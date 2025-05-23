Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6564F18EAB
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747978712; cv=none; b=ugP96a6E9cE9Hs1UnXpycWxb+QG9iy/Rg+K2TlERLQ9563IyN5IF0rDa9oBaKVJnTUaHCsCPjBMz0d7WfHGtj00fOFELxiusJBeNhQu80UjtOVXI3XRVCrkAXG4DVxdT31fz/QM8TAvBeikyMJFJauTLMgZ7uaUzBVPlyts+RaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747978712; c=relaxed/simple;
	bh=G39agmc79I3qTS9wlOWguGgLGm3T8xow4BWYKuRKjzA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nRslR170rVqBpRHH2KPQB58CjPBS2RMPg3vBgg06n297Y7M4DLB5A9m0/5FlheOdpc38VBu1Sy0byv8di9aW7cWDQFYS0dOqspxwaJP5G4Q7wqpvJOkqEMGsy0ko7C5F4Gf41esKkkFYYK7A7T4JXchORlUkwDI5TaSjD+or9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dsq4kVRJ; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dsq4kVRJ"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso7738001276.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747978709; x=1748583509; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gXYpopPXv47NudJVuPuqagLYokxJYwwz/lx/l1lzTY8=;
        b=Dsq4kVRJ7OLSNwKD38JNA8DG9K0x4gQ0NUmTQgEEubU+18MadJKk+BdqCRTX+pRLZF
         8tb6F+tGXYNp+0whdlPX0txjzF3B080fL/FD/TJ+Z10u6x/Rirt7Np5zMjk6DZoyNvXT
         osYCFqaU3WNjZ4Vv6ZwK7sGz4/knGukhHibclbfokXTP+8Gqur/yaZuV6RYgbvCHZ5vk
         tkJpgGqImgmFeDD+KCuQVhAiV7NX/G3DVyz8R4ePMl6CBK+v/eqs4s4frB7yCTrZT2IX
         j2vCzhcPUjs0Vf7WuB0mUBnY68k/zt+0AbNn1U9gAVUNFKTtsIbm/NazCTtB6XmEasLu
         32Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978709; x=1748583509;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXYpopPXv47NudJVuPuqagLYokxJYwwz/lx/l1lzTY8=;
        b=FN2d+uPbn7WRYAVHtsLJXZ+4D/L8g1Wk/u2C7eBgr+rtGeHEpfqDv88H2HwznB3820
         CBYG6SyTHshZUNwQEz+9XVuq7RXCoJNvKBrPg3MmECj52qbSZ1slKsaayLapC+Tyz3a2
         MWhuTb4jRHtAeoWYpDCkTF2NS5Rpl7FtGBpr7WTiWZ8tiVpmZj07fN+vhmPj3kI+Nig4
         gvdcagX32CnG+7OU59yLKQdlOWcoi7M8Seb0uairk1XOTN017Hc7qfKbrmzY8oTgLCpZ
         FS+vU+baI39oThel+yls/xdDxSSaFb5jIoiHpgoFUtG3UjhjkatcF5e8zbHw1cJ33t2H
         D7WQ==
X-Gm-Message-State: AOJu0Yyd/sMRsvz+375tbCQFQa4D56zrfqp6oH76E6odDPvb1+OOmjuH
	K2L9AT0VQRW+rR6TRhvAsjQ1ENfMfMrqUcLGb7LAWNj+D0zXVoBVIvij4A9dUn3wfDopRCwkQf0
	TNsS3sZWjPPrxdx+0AT7FvQEHb9RBlG8pyTNrNRc=
X-Gm-Gg: ASbGncsxiuIgpZwqx7LwzS9eHyDZfSBCB0m9Kru3KlI719qkVkGmC0v3a7UJh6X5fYm
	krKy4k03Y5Gz1GpG+VSDk4wIukw2RSOdXPYFh+grvRQoZLlQvtwfrZ8oz+HtZGnnTEwvrQ7RDCA
	pNb2RGYYt6sXIZKhdzgfVgPP6cZJuvpJYDXONMWq9KMl1qGfv4nzJlBUrrM5R773in
X-Google-Smtp-Source: AGHT+IFwhKh1NBL3vUAIRzZe4SecMf9/V/ay+21/JJ3gmT7daF6Li2VKQGeLBD7grBzo0FOSXqCV9X8c9Ma1Xr563AA=
X-Received: by 2002:a05:6902:cc4:b0:e7d:3baf:2acd with SMTP id
 3f1490d57ef6-e7d7e0c9fd2mr2273971276.18.1747978708870; Thu, 22 May 2025
 22:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Fri, 23 May 2025 11:08:18 +0530
X-Gm-Features: AX0GCFtiy6RErnQit5XMmZcBcBZMYOwmS4JN4l4HdeINKS5mn0D1rqHBzeNNtug
Message-ID: <CAFf+5zi+ghAOp6yBaUDZC95v62NeJaBui7cERkOumnSocS8ozA@mail.gmail.com>
Subject: My coding guidelines for C programs.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

------------------------------------
My coding guidelines for C programs.
------------------------------------

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

--------------------
