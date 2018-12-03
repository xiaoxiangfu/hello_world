int fibonacci(int n)
{
  int prev = 1, prev_prev= 0;
  int value = -1;
  if (n == 0) return prev_prev;
  if (n == 1) return prev;
  while (n > 1) {
    value = prev + prev_prev;
    prev_prev = prev;
    prev = value;
    n--;
  }
  return value;
}
