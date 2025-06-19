Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EE7374D1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313864; cv=none; b=ZH3fHSL63zzsj/ZvHm6UD/WKagw7GnZuKy8styXiUTYRcWO5pFpeoIo7SuQzQdV1EDW7z14VMu2Bo3c+yCfxS3sn46Zq7KyVk0HfBxvfGGEy2wwcEjm3Mmejycw7yog4YAf9ssq/tNayy6VXNy34I1fTInshXpNXYIWJrHlmdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313864; c=relaxed/simple;
	bh=VVqC53lf4cP//DWzRZYqVRLXnCXg/7D+55IsJJ4iD4w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dBkqKD7FgZoEA4OkRISWqBzlTPEgbX7PwrzC0pk5PQ2DYJvMkaJI2NfmTv1qsDjOzm/OKQrfa1Jw0+j4kvuuWIn6aKVLqBp3vZ7/DIL4hpd/t28rhreCUpi9FfWo+F/DSXs9SQXMBgReoFgdYVBmr0ZFMyp5dhOg527TJRIfkPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyofpGKf; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyofpGKf"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-7086dcab64bso3679327b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750313862; x=1750918662; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3vA9mOWoLKmq5uEeoEgD8m+hlqjJZG0C2r1BxmR8JJk=;
        b=dyofpGKfHo3UPC8mKAXx9t5S7Pp2O3Rml3mgZ9JYzL1RKk9KjgCmV7VbZYCdoFni8i
         dJA0LCXZHSy9fUwRvTab2/Hcps5W7IqUEQFqlfFr90rW9LgxDDiE+Dop45+QOhNSDxO2
         5dpT7n0OD7K1gFefPvHScGFwxte0iBZI0cKMgfZAZv2mfDds5zE8/MGMkuvquVGiW537
         3V6t6JKixChIgfECgxLC0gOreVxPYpNVNV4ZlCjCHeokEhnNpmCI02Yp9JuR3g7l27ro
         M4x6J2kwhg9ISC+szD1ObLUqid/Z8TnyyrTVijyoKH8lfouV89f05AD+H0zpTKHupM7k
         qjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750313862; x=1750918662;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vA9mOWoLKmq5uEeoEgD8m+hlqjJZG0C2r1BxmR8JJk=;
        b=XOIx19H6eIUEjBGlGfOTj6Cs52y6fMnMLLKPr4dT/GhzLgSERXMHitxXbJKeMD0VsN
         MfO9Dl7rV9yg9q6O/S5QAoDVybRW+7/UkgpPF9psyoCDghBM5EipNuvfWC+FyOQ0XJjq
         3zH70MEGFQLWo8kIiwmrQd0z0oTCZoYAXVekaar761iVeaf12Nm9JIL70/bP0+RVLD2W
         opxrAMbPPT5n3ntAvyWsX71NoFWGX658V9ApLjkAWjZ6fFBj5kJUsHCChT6bqqsPAFiZ
         ZeCaCehUuLdX6z2tr7jsu9yyBgXJ9rzW9dtB/pB5yzZM0z/Jxc7NU+haUsqEsR++OfUJ
         c7yQ==
X-Gm-Message-State: AOJu0YxNDyCjDiANfTXZGHYrwY+v4wvg/ukPiSS88bCPIhDlA7UPdDNg
	ZXXo/raklb+5NYG5v7OfSLEn99j+GiV46hMC5V+Wj6h3N6iD7AXa4h484myU9eXG7HnKnKnZ5eK
	JR7ON82H1pkMBaiHNVqhy55mBlCxsIHkn9ALMCrs7lA==
X-Gm-Gg: ASbGncttvQlL247kk1FIh1ZCKHtyRTyass7FAUkV9gwaNNx/jMaCZ58UfSWjLt/ZUlt
	rQuejs0zqW3iHM2v4nTXOTamTULzEfW/3sWoH8a39r1ybUCoifJAaA5mqokdoFWHUs9yh/ftn1e
	uR7RURGKycwsmqQzbQD6CC5ksU+hjZ69yrB0Xz6W4nxSaFVCadeH1V494PBpzSI3EDOnmUsE4Mr
	n2zIA==
X-Google-Smtp-Source: AGHT+IF5J1Fv3Qglgv2Od5Md7sbDrsB+jltBYg1eUmHEpVuvE4NAVQG0D857zRvPHZxlnktY53BHx/bnbxPdv103WZQ=
X-Received: by 2002:a05:690c:7305:b0:711:3f06:6109 with SMTP id
 00721157ae682-7117542b329mr292151837b3.20.1750313861741; Wed, 18 Jun 2025
 23:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Thu, 19 Jun 2025 11:47:30 +0530
X-Gm-Features: Ac12FXwXjL3kbevZ3Hh_n7mt-3B2EHEXG3SqPpYXbCp8iE4HT1pVu3G1k6PF9l0
Message-ID: <CAFf+5zi44QwoqZE196KkT9sQ2p+RybxQuzm1-9Mxn_sUK+Csdw@mail.gmail.com>
Subject: My coding guidelines for C programs.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

My coding guidelines for C programs.

--------------------------------------------------
My coding guidelines for C programs.
--------------------------------------------------

* Check all arguments of a function, even if the function is called from a
  trusted function. All arguments should have a MIN and a MAX value and the
  argument's value should be greater than or equal to (>=) the MIN value and
  less than or equal to (<=) the MAX value. If the argument's value is not
  within this range then no further processing should be done and an error
  should be returned.

  Checking arguments validity is very very important because, in my opinion,
  not doing this is the source of most of the security vulnerabilities. Even
  switches/routers/security software/software of security appliances, etc.
  should check the validity of function arguments. In fact, all software written
  in this world should check for the validity of function arguments.

* Always check the return values of the functions that you call before
  proceeding ahead.

* Always check whether the pointers are NULL or not before using them.

* Always use calloc() to allocate memory instead of malloc(). This is because
  calloc() sets all bytes of the allocated memory to a value of zero (0) and
  this may help in reducing/catching some bugs.

* Make the pointer variable NULL after freeing it.
  Example: free(var); var = NULL;

* Don't use unbounded C functions like - strcpy(), strlen(), strcat(), gets(),
  etc., but instead always use bounded C functions like - strncpy(), strnlen(),
  strncat(), fgets(), etc.

* Don't use unsigned data types unless you are totally sure because conversion
  between signed and unsigned data types may lead to bugs and security issues.
  Also, using unsigned data type in a loop's exit condition may result in bugs
  and infinite loops.

* Don't typecast between data types of different lengths unless you are
  absolutely sure. This is because the values may change if you typecast from a
  longer data type to a shorter data type. For example, let's say that you have
  a 'long' variable 'l' that has a value of 8589934591 (0x1FFFFFFFF) and now if
  you typecast it to an 'int' variable 'i', then the value of 'i' will become
  -1 (0xFFFFFFFF). When you typecast from a shorter data type to a longer data
  type and if the shorter data type is negative then signed extension will
  happen in the longer data type and you may not be expecting that.

* Don't typecast between data types of same length also unless you are
  absolutely sure.

* Don't use global variables unless really really necessary. If you need to use
  a variable in multiple functions, then you can pass around that variable as a
  function argument instead of making it global. Even then if you think that you
  need a global variable then consider making it static so that it is not
  visible outside of the file.

* Initialize all variables (global/local/static) to proper values. In C, all
  global/static variables are initialized to 0, but even if your proper value is
  0, even then you should initialize explicitly to make code more readable.

*. Don't expose all functions to the user. Expose only those functions that the
   user will actually need, rest of the functions should be static. And also,
   the user may not need to look at the static functions so put all the static
   functions at the bottom of the source file.

* Don't hard-code any value in the program. Make it a #define. This is because
  if you hard-code the same value at multiple places then changing all of them
  will be a bit tedious and it is possible that you may miss out changing it at
  some places. If it is a #define, then you need to change it at one place only.

* Compile all your C programs using the following gcc flags: -Wall -Werror
  -Wextra -Wundef -Wunreachable-code -Winit-self -Wparentheses -Wconversion
  -Wsign-conversion -Wsign-compare -Werror-implicit-function-declaration
  -Wmissing-prototypes -Wmissing-declarations -Wformat-security

* Don't hard-code passwords or any other credentials in your program.

* Don't use 'long' unless absolutely necessary (like when dealing with files).
  Always use 'int'.

* Don't use recursive functions, unless absolutely necessary, because recursive
  functions can lead to stack overflow.

* Don't use shorthands so that the code is more readable. Some examples are
  given below:

        ** Instead of using "if (!ptr)", you should use "if (ptr == NULL)".
        ** Instead of using "if (!*char_ptr)", you should use
           "if (char_ptr[0] == '\0')".
        ** Instead of using "char_ptr[i] = 0", you should use
           "char_ptr[i] = '\0'".

* Always put opening and closing braces for 'for loop', 'while loop', 'if
  statement', 'else statement', 'else if statement', etc. even if the contained
  line of code within the braces is only one line. This is for protecting
  against accidental mistakes (like adding another line of code in a 'for loop'
  that has no braces and then forgetting to put the enclosing braces). Also,
  this practice makes code more readable.

--------------------
