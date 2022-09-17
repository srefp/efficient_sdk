extension IntListExtension on List<int> {
  /// 展示
  String get displayWeeks {
    this.sort();
    int p = 0, q = 1;

    // 连续周的起始和结束
    int continuousStart = 0, continuousEnd = 0;
    // 单双周的起始和结束
    int oddOrEvenWeekStart = 0, oddOrEvenWeekEnd = 0;
    StringBuffer sb = StringBuffer();
    if (this.length == 0) {
      sb.write('');
    } else if (this.length == 1) {
      sb.write('第${this[0]}周');
    }
    while (p < this.length) {
      // 连续周
      if (q < this.length && this[q] - this[p] == 1) {
        continuousStart = this[p];
        while (q < this.length && this[q] - this[p] == 1) {
          p++;
          q++;
        }
        continuousEnd = this[p];
        p++;
        q++;
        sb.write('第$continuousStart-$continuousEnd周 ');
      }
      // 单双周
      if (q + 1 < this.length && this[q] - this[p] == 2) {
        if (q + 1 < this.length && this[q + 1] - this[p + 1] == 1) {
          sb.write('第${this[p]}周 ');
          p++;
          q++;
          continue;
        }
        oddOrEvenWeekStart = this[p];
        while (q + 1 < this.length && this[q] - this[p] == 2) {
          bool nextSatisfyContinuous = this[q + 1] - this[p + 1] == 1;
          if (nextSatisfyContinuous) {
            break;
          }
          p++;
          q++;
        }
        if (q == this.length - 1 && this[q] - this[p] == 2) {
          p++;
          q++;
        }

        oddOrEvenWeekEnd = this[p];

        if (this[p].isOdd) {
          sb.write('第$oddOrEvenWeekStart-$oddOrEvenWeekEnd周(单周) ');
        } else {
          sb.write('第$oddOrEvenWeekStart-$oddOrEvenWeekEnd周(双周) ');
        }
        p++;
        q++;
      }
      if (q >= this.length ||
          this[q] - this[p] != 1 && this[q] - this[p] != 2) {
        if (q <= this.length) {
          sb.write('第${this[p]}周 ');
        }
        p++;
        q++;
      }
    }
    return sb.toString().trim();
  }

  /// 将列表改为逗号隔开的字符串
  String get getString {
    StringBuffer sb = StringBuffer();
    for (var i = 0; i < this.length; i++) {
      sb.write(i.toString());
      if (i < this.length - 1) {
        sb.write(',');
      }
    }
    return sb.toString();
  }
}
