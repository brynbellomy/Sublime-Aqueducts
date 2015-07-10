



/**
    NanuNanuPopover.tsx
    Popover component that nanu-nanus the current user.
 */
import * as assert from 'assert'
import { autobind, propValidating } from '../common/react-utils'

@autobind
@propValidating(validateFn)
class NanuNanuPopover extends React.Component < NanuNanuPopover.Props, {} >
{
    componentDidMount() {
        React.findDOMNode( this.refs['inner popover'] ).nanu()
    }

    render() {
        const className = (this.props.className || '') + ' popover'
        return (
            <Popover id="foo-bar" ref="inner popover">
                Nanu nanu, {this.props.firstName}!
            </Popover>
        )
    }
}

