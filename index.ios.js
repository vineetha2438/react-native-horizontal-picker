import React, { Component } from 'react';
import { requireNativeComponent, Event } from 'react-native';
import _ from 'lodash';
import PropTypes from 'prop-types';

const RNTHorizontalPicker = requireNativeComponent('RNTHorizontalPicker', {
  propTypes: {
    titles: PropTypes.array,
    selectedIndex: PropTypes.number
  }
}, {
  nativeOnly: {
    onChange: true
  }
});

export default class HorizontalPicker extends Component {
  constructor (props) {
    super(props);
  }

  convertToString(array) {
    return _.map(array, (item) => {
      return item.toString();
    });
  }

  render() {
    const {
      onChange,
      selectedIndex,
      style,
      titles
    } = this.props;
    return (
      <RNTHorizontalPicker
        selectedIndex={selectedIndex || 0}
        style={style}
        titles={this.convertToString(titles)}
        onChange={onChange}
      />
    );
  }
}

HorizontalPicker.defaultProps = {
  selectedIndex: 0,
  style: { width: 150, height: 100 },
  titles: [1, 2, 3, 4]
};

HorizontalPicker.propTypes = {
  onChange: PropTypes.func.isRequired,
  selectedIndex: PropTypes.number,
  style: PropTypes.object,
  titles: PropTypes.array.isRequired
};
