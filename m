Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6AE20E33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325790; cv=none; b=T8m7WVEQM85fIUs+Vf/Sg0C5I90kUp2NAH6u017le2ACfh8vswrthIUrSR66FwPFcWbUYfjvTt39Z+abKHaGAMU7x3duEJAsZOETSDWk+nSo+6pTThyWlmzDepHu0FJRswrfT4Op5iiXsGtWHqEVeJ7agzN3VEIVdFwOoC4WXl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325790; c=relaxed/simple;
	bh=wYZqWE/orBcjdt6AJ8w7ry/uJRuGBEdSpZH9j/IsQWU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LFf91NUAA/XcCWiGCnPM7DPHox8KAMTeotnkM0QO+fHfyAlkaXdP/YUDE4/Z02+iIqHbiLOAvoBVHyCgXg+xrz1P7+j4GCgSzHVQpyuqKeqQ5upLqJLehLldzPovWl5x0MaxyvzqDfm0h0yfDM/Zd/f3GTDhWo8Ut3g2y/ucak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDU7KNrQ; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDU7KNrQ"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-70b4e497d96so5377817b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750325788; x=1750930588; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wYZqWE/orBcjdt6AJ8w7ry/uJRuGBEdSpZH9j/IsQWU=;
        b=IDU7KNrQBlhtbvkuOY46Hi5rlngL2Kpbj+8mUVxZoX2ijwIk/fWhP84wX61R0V+2uJ
         bWsrFQVRgY11qcuyZd12hu1EFmlMFJeb2stEkOW25Gx9rEOtfI8+85FI8CQiYfS9+Ivh
         Xfy0RkzNQ/F81jjSqGu7J/SvmhAxfUDecj5XXFtf8rrYOIPBq4M3pRLvui7eLyMBzzRo
         Pu453aBcDmPrWc8ul5nhz8AtKk/vnkU8f5E1n5K+Q1anGsRRXtTYMKAnIxmQdLGllL+V
         Y7XreauNF4sCSO2NJRE5B4bN1P8qlzVridb71251AEo0aSJswu6EzQ7cRnjsdh6SyB2M
         hVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750325788; x=1750930588;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYZqWE/orBcjdt6AJ8w7ry/uJRuGBEdSpZH9j/IsQWU=;
        b=UgGAvvZ1UEtTvzCb6wElpJVoYThItEzPS+0iQNw+3z+claUyfvq6UUMmA0qNcj1VHq
         NcNrfT7Ddnv1XB+Ji4S5Dt+825n2ER/iOYbsWL1rRjC8J++i0AsbYQWoJwAjuW+XAFrk
         1g6Av7jE0ExSLxwxn8FwFWUnl8HpIYCUxt2HARSvUxyj8EoNzQQh9BG4KR7Oxk7U9FHZ
         +wqWkJkZ25Ss7anxw65VG0JQiVONZ7XF9QneroECEcLZbdGEZmxLrG57YrBVcj2s2tUA
         lAT3hI3G3wlO1V/QT+DsPrrPjmX3b4OpIYabrG0AKfM/xxQvixGi7miFmlVKOHh0Jlgl
         +4WA==
X-Gm-Message-State: AOJu0Ywqapm+zb32QPuVnOjI/NQIsrwD7JEeuJIfsqFfmcguZM4FJHyj
	B8drzx/d16fK8NQacAsCgDAK4TrivujGs1daOzL7K44crBVYn4i467qxuJauk1fLkmkIWQYy0Ch
	2DboV/FK3Fb/aESKfvHb/VvxdYlGD7X029+1rA0Bz8g==
X-Gm-Gg: ASbGncswXdDGs4nPBiCdYqjT95rtOhYJ/5D9csPDARHRQ1eeinlRpmkEDQttNTs0Lve
	OLa8mxRShsfod9KO803pCROSlShFoOY/MHu3GctB38E01Ft/cTcVYI5RBim9UCJ4wjOIffZTwQZ
	bKF3/cM/KBGgGv4XWisyyAiMdW5PZUwtZWhQqkERQIv0gmStknLaIoYsbhXMNjaLkWsQ3WIqS5J
	93pgg==
X-Google-Smtp-Source: AGHT+IFENmQNlimlbCa1IokyLOc8Z2OBWR7X3ZrHkHQrVhJYDoMQcPFVKSH3Tk+LsMQ2QzYB5792g/T3IdO4DC2cAf4=
X-Received: by 2002:a05:690c:3585:b0:70d:f47a:7e21 with SMTP id
 00721157ae682-7117539f8e2mr308912307b3.1.1750325787561; Thu, 19 Jun 2025
 02:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Thu, 19 Jun 2025 15:06:16 +0530
X-Gm-Features: Ac12FXwXwNsJxfx_HLKXxp-nBdyhPBRC9jTjnu44SePD5ZWdlXIsLVHmAeDYNmA
Message-ID: <CAFf+5zjW0En_BhpLNsqVTzJ+-kxPLdB_rK8=nmrideT03=ZKgg@mail.gmail.com>
Subject: How to do secure coding and create secure software.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

How to do secure coding and create secure software.

-----------------------------------------------------------------------
How to do secure coding and create secure software
-----------------------------------------------------------------------

I can do secure coding and no one can hack my code unless the language/OS have
some issues. You can challenge me on this.

Ultimately, all software boil down to functions/methods. If functions/methods
are secure then the whole software is secure.

If all functions in all software in this world are secure then there won't be
any hacking.

Now, in the following text, the word function will mean both function and
method.

I am listing the main points of secure coding below. These points are applicable
to almost all languages.

1. The first point is that all the arguments to your function should be checked
always whether they are in the allowed range or not, even if your function is
called from other trusted functions and even if your function is
private/protected or static. The value of a function argument should not be
unbounded, it should be within a bounded range. All function arguments should
have a MIN value and a MAX value. For example, you can specify that the minimum
length of a string argument should be 1 and the maximum length of the string
argument should be 1024. Now, for getting the length of the string you will have
to write your own strlen() function, you can't depend on the strlen() function
of any library because the library's version will keep counting until it finds
'\0' character and by then your program may crash. If you are using C language
then you can use strnlen() function. The code will be "len = strnlen(str, 1025);
if (len == 1025) { return error; }". Similarly, your 'int' arguments, 'float'
arguments, etc. should also have a bounded range (a MIN value and a MAX value).
Also, always check that whether the pointer arguments are NULL or not.

Now, a counterpoint can be that checking all the function arguments will take
more time but actually because of very fast processors available these days,
it will not take noticeable time. On a 1 GHz processor, you can execute
1 Gig (2^30 or 10^9 for simplicity) instructions per second. So, if you are
checking a pointer for NULL then it will be around 5 instructions. So, this
will take only 5 nanoseconds (5 * 10^-9 seconds). So, time consumed in checking
arguments is not a big issue. Checking the length of a string may take some more
time but it will also be not noticeable. Assuming 5 instructions for checking
for NULL character ('\0') and 1 instruction for incrementing the len variable
and another 5 instructions for comparing the len variable to the MAX string len,
then we have 11 instructions per character. If the length we want to check is
1000 then it will be 11,000 instructions and it will take only 11 microseconds
(11 * 10^-6 seconds). So, this time is also not noticeable.

2. The function body should also be secure. After writing code, you should
review your code for security issues and also get it peer reviewed for security
issues. In general, you should always get your code peer reviewed for security
issues, bugs, company coding guidelines, etc. Some common security issues are -
infinite loops that were actually not intended to be infinite loops, NULL
pointer dereference, accessing memory that is not part of your program, copying
more data in a buffer than the actual size of the buffer (aka buffer overflow),
stack overflow, out-of-bounds access (for arrays), using memory/pointer after
freeing it, etc. If you are programming in C language then you shouldn't use
unbounded C functions like - strcpy(), strlen(), strcat(), gets(), etc.,
but instead you should use bounded C functions like - strncpy(), strnlen(),
strncat(), fgets(), etc.

3. Always check the return values of the functions that you are calling before
proceeding ahead. Don't assume that all functions will always succeed. It is
quite possible that a function always succeeds in internal testing but it may
fail when customers start using your software. If the function that you called
returned an error and if you didn't check it and proceeded ahead then wrong
things can happen and these wrong things can open a security hole in your
software and your software may get hacked.

4. Don't use an unsigned data type unless you are dealing with binary data
(like - raw bits, raw bytes, network data, data from hardware devices, etc.).
Although unsigned data type in itself doesn't present any security issue but if
the usage of the unsigned data type is wrong then it can lead to security
issues. For example, if you use an unsigned integer variable in a loop and the
exit condition of the loop is that this unsigned integer variable becomes less
than 0, then this loop will never exit because an unsigned integer variable will
never become negative and this infinite loop can open some security holes in
your software. Another issue with unsigned data type is that when you convert
an unsigned data type to a signed data type then although the bits values are
not changed but the interpretation of the bits values change because the data
types are different. So, let's say that you have an unsigned integer 'u' and in
'u' the most significant bit is set. But, 'u' is still positive because it is of
unsigned type. Now, if you typecast 'u' to a signed integer variable 's' then
's' will be interpreted as being negative because the most significant bit is
set. So, "u > 0" will be true but "s > 0" will be false. So, now, if you use 's'
in some comparison then the results may not be as expected and this may open a
security hole in your software.

5. Don't typecast between data types of different lengths. This is because the
values may change if you typecast from a longer data type to a shorter data
type. For example, let's say that you have a 'long' variable 'l' that has a
value of 8589934591 (0x1FFFFFFFF) and now if you typecast it to an 'int'
variable 'i', then the value of 'i' will become -1 (0xFFFFFFFF). Now, when you
use 'i' in your program then unexpected things may happen and these may lead to
security issues in your software.

When you typecast from a shorter data type to a longer data type and if the
shorter data type is negative then signed extension will happen in the longer
data type and you may not be expecting that and this may probably open a
security hole in your software.

6. Don't hard-code passwords or any other credentials in your program/software.
Hard-coding these is a big security issue.

7. Don't use recursive functions, unless absolutely necessary, because recursive
functions can lead to stack overflow and stack overflow is a security issue.

8. Avoid using global variables. In object oriented languages avoid using public
variables as much as possible. In C language also you should avoid global
variables, but in case you need to use some, then make them 'static' so that
they are not visible outside the file.

9. Initialize all variables (global/local/static/private/protected/public) to
proper values before using them (in C/C++ uninitialized global and static
variables are automatically initialized to 0).

10. Don't expose all functions to the user. Expose only those functions that the
user will actually need, rest of the functions should be private/protected in
object oriented languages and static in C language.

In my opinion, if you follow these points then your functions/software will be
secure. I follow these points and my functions/software are fully secure, they
can't be hacked.

----
