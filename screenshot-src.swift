



//
//  AnimationComponentBuilder.swift
//

import SpriteKit

public struct AnimationComponentBuilder <A: IAnimationType>: IConfigurableBuilder {
    /** The type of `AnimationComponent` built by this builder. */
    public typealias BuiltType = AnimationComponent<A>

    /** The name of the texture atlas (in the app's main bundle) from which to build the `AnimationComponent`. */
    public var textureAtlasName: String?

    public mutating func configure(config:Config) {
        textureAtlasName =?? config.get(keypath:["animation", "texture atlas"])
        framesPerSecond  =?? config.get("frames per second")
    }

    public func buildSequence(name:String, withGenerator: GeneratorOf<Texture>) -> TextureSequence {
        let textures = self.getTextures()

        // this code has absolutely nothing to do with the variables passed into this method
        return Array(textures.keys) |> sorted
                                    |> map‡ { textures[$0] }
                                    |> reducer() { $0 | $1 }
    }

    public func build() -> Result<BuiltType> {
        let buildAtlasWithFileExtension: String -> (String -> Result<AnimationAtlas<A>>) = curry(buildAnimationAtlas)
        return buildAnimationComponent(anchorPoint, framesPerSecond)
                        <^> buildAtlasWithFileExtension(fileExtension)
                            -<< (textureAtlasName ?± missingValueFailure("textureAtlasName"))
    }
}

