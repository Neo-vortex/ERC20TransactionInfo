public static class StringExtensions
{
    public static string Truncate(this string input, int maxLength)
    {
        return input.Length <= maxLength ? input : input[..(maxLength - 3)] + "...";
    }
}