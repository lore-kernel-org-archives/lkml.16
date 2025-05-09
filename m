Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210362376EB;
	Fri,  9 May 2025 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822887; cv=none; b=XnLm8W7uUQ8MWien/PnNX6ImFj5QaV2N2RYFHCjz4vdt2OdrmtKnjQoDF10PUfGGYKNNKSXXrStPuvrkJjZrgxJpbRA17YgD2Plb1I9bX4S5B7XADgwhirt49PdTDeqDOEopslOHnBWutafucjVTFs2UqfUgh51mKIAx28zaKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822887; c=relaxed/simple;
	bh=a6qm/sF9WDyjAq41Ggn9WeDtY4Jltoj2tMrxaUZz9l8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpRnnuB2hdDsNUMDnIAyAG+3bVKuEYIIeTUyJRq8/+5j51FAF6wRgpQ0Ar7Ha5HWKELjqCU7NOfSFNMMm3tQRahuK7cd4fTK58O+Drzn7MPawRPYrgpymWDVOzMEyS2YKyKxaNHVx/y+I/xHszvjnQXomashF8s6w85EXfP1/6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjt8ERHu; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjt8ERHu"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb2faa9f55so322100566b.3;
        Fri, 09 May 2025 13:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822883; x=1747427683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEZw5twQAfj8z3447mRigmK80cFH9t6rCalw3qbVgv0=;
        b=gjt8ERHu/i6gM/e5AOtILxJbc0Nr9i4IO5cbmoAvLvBnzuX8maH4BAg8OfJmkmjqC5
         sXCX/nD3TEA8pIu9Edo1IASosjwSdRAnViUjC4FDgRAIqI6z8EoVfqBdjNomvVMtz+68
         9YmyryaB/DAWvNrbU/nxxa+1DIUc2xZAs+vU0m2d8YzeRLuVsSpHhyv9L1/spZFi+EYS
         ZBwqzFRWpQFsuPWp/mfDExjDKkNGlp8ZLSpOD+qGjcGlkO7qa22QqMLKf9G5r+6nsFi9
         LIAZUsL4Ys84lUl9QUap6BUTRknmDu7pkTDAI8ZsBvPOAGwYaW0C+yi+J2FFTRsPuH1x
         mwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822883; x=1747427683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEZw5twQAfj8z3447mRigmK80cFH9t6rCalw3qbVgv0=;
        b=gxZb5fI26dZZpW7gp+Y8lL6fpCZCbGf0PuCpTsuMcvqyjFSn4UvJKdJMGmfdc3q07i
         rzutQhPCBluhFNLlrEu0bS7AxB6OJa6oUMbVSk4kohhu+Tj2w/XPURU25Ack29aLm7DH
         BbQwgtml7e6sPGNX+ZdsvheuGImk4poQkNge1ppLmxxHvQRYkzlpLhTM+uH6+0jjoNOV
         tPpct1qqKvFNSv/Wnt1vhK5kJpCoiyEaGYK5UzqSoPkqMfxnqEenG2fr2Z3MiNmG7ILM
         AZN63mOehYF4yeO0bKMS0Hnp3K+yx6IBnhO5WXA+91Y7fR3vamsOry2AXpGS1H1yUavC
         wQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiS4jtx19p9vZVDmEXzjBelZsKZ7X/gIhCVKp9D5O+n0W31VUV8QAK4Rv8R2sH8KSvK1FtiNFFjm9QhcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhuT5N/dd3u4tvI05E96pTiy6fzB1r9JKlyZr1gnDxuMDZztT7
	mNLrbRDYNoSeZpP/i7wkrhCh6PHFM4g/1lOROLMfs6fhksWlHHlNm0wS
X-Gm-Gg: ASbGncvwD/Buo0WFzG6VBiqbLIgBZgVBAvIHpUOAkjaKNlUHzoFC87DrmG8czbUwYBM
	5AGpQSuIe8vEAjxDWz+m991kLysVwPLEe7o4FGdepRlLssasd6YFOsyGO+ce+s1gMZU/pp80AXA
	FYF4vL6wUpDq04NJxK1pZ/ebO2mpZ7wEoKvOqb1HbF6EIB0+61lDsV77rHJXKYzNYLQkk9BpPAE
	PPhbMW8VBNqAondF0tPG+xsWK98yOJ+bV2Eiz5AoOLTzdpV2OxewbAjDuhjQqOy5P1vm6G7T+qF
	OkFHrTE5BVmbZEjaCV5vM4Y7aVWePLbBWCn1JDSSjx+z2wD6pAZduva8Db/O
X-Google-Smtp-Source: AGHT+IEZZh77jMFVy9UAy7GrnUW18J8dLwOg/5su/txzyZnnMCOS6A7gQU/f0CHcxBifo3Od/6UDBA==
X-Received: by 2002:a17:907:d15:b0:aca:d5a1:c324 with SMTP id a640c23a62f3a-ad2187c10f8mr390820366b.0.1746822882976;
        Fri, 09 May 2025 13:34:42 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:42 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 2/9] CodingStyle: delete explicit numbering
Date: Fri,  9 May 2025 23:34:23 +0300
Message-ID: <20250509203430.3448-2-adobriyan@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All _real_ documentation systems have a way to number
chapters/sections/subsections automatically.

I haven't found a way to do it in this reST thingy so keep them
unnumbered for the time being.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 100 ++++++++++++-------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 19d2ed47ff79..a4fbe45c3eb9 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -15,8 +15,8 @@ and NOT read it.  Burn them, it's a great symbolic gesture.
 Anyway, here goes:
 
 
-1) Indentation
---------------
+Indentation
+-----------
 
 Tabs are 8 characters, and thus indentations are also 8 characters.
 There are heretic movements that try to make indentations 4 (or even 2!)
@@ -95,8 +95,8 @@ used for indentation, and the above example is deliberately broken.
 Get a decent editor and don't leave whitespace at the end of lines.
 
 
-2) Breaking long lines and strings
-----------------------------------
+Breaking long lines and strings
+-------------------------------
 
 Coding style is all about readability and maintainability using commonly
 available tools.
@@ -117,8 +117,8 @@ However, never break user-visible strings such as printk messages because
 that breaks the ability to grep for them.
 
 
-3) Placing Braces and Spaces
-----------------------------
+Placing Braces and Spaces
+-------------------------
 
 The other issue that always comes up in C styling is the placement of
 braces.  Unlike the indent size, there are few technical reasons to
@@ -231,8 +231,8 @@ Also, use braces when a loop contains more than a single simple statement:
 			do_something();
 	}
 
-3.1) Spaces
-***********
+Spaces
+******
 
 Linux kernel style for use of spaces depends (mostly) on
 function-versus-keyword usage.  Use a space after (most) keywords.  The
@@ -303,8 +303,8 @@ of patches, this may make later patches in the series fail by changing their
 context lines.
 
 
-4) Naming
----------
+Naming
+------
 
 C is a Spartan language, and your naming conventions should follow suit.
 Unlike Modula-2 and Pascal programmers, C programmers do not use cute
@@ -356,8 +356,8 @@ specification that mandates those terms. For new specifications
 translate specification usage of the terminology to the kernel coding
 standard where possible.
 
-5) Typedefs
------------
+Typedefs
+--------
 
 Please don't use things like ``vps_t``.
 It's a **mistake** to use typedef for structures and pointers. When you see a
@@ -440,8 +440,8 @@ In general, a pointer, or a struct that has elements that can reasonably
 be directly accessed should **never** be a typedef.
 
 
-6) Functions
-------------
+Functions
+---------
 
 Functions should be short and sweet, and do just one thing.  They should
 fit on one or two screenfuls of text (the ISO/ANSI screen size is 80x24,
@@ -480,8 +480,8 @@ closing function brace line.  E.g.:
 	}
 	EXPORT_SYMBOL(system_is_up);
 
-6.1) Function prototypes
-************************
+Function prototypes
+*******************
 
 In function prototypes, include parameter names with their data types.
 Although this is not required by the C language, it is preferred in Linux
@@ -523,8 +523,8 @@ below, compared to the **declaration** example above)::
 	...
  }
 
-7) Centralized exiting of functions
------------------------------------
+Centralized exiting of functions
+--------------------------------
 
 Albeit deprecated by some people, the equivalent of the goto statement is
 used frequently by compilers in form of the unconditional jump instruction.
@@ -595,8 +595,8 @@ fix for this is to split it up into two error labels ``err_free_bar:`` and
 Ideally you should simulate errors to test all exit paths.
 
 
-8) Commenting
--------------
+Commenting
+----------
 
 Comments are good, but there is also a danger of over-commenting.  NEVER
 try to explain HOW your code works in a comment: it's much better to
@@ -635,8 +635,8 @@ multiple data declarations).  This leaves you room for a small comment on each
 item, explaining its use.
 
 
-9) You've made a mess of it
----------------------------
+You've made a mess of it
+------------------------
 
 That's OK, we all do.  You've probably been told by your long-time Unix
 user helper that ``GNU emacs`` automatically formats the C sources for
@@ -728,8 +728,8 @@ set automatically if you are using an editor that is compatible with
 EditorConfig. See the official EditorConfig website for more information:
 https://editorconfig.org/
 
-10) Kconfig configuration files
--------------------------------
+Kconfig configuration files
+---------------------------
 
 For all of the Kconfig* configuration files throughout the source tree,
 the indentation is somewhat different.  Lines under a ``config`` definition
@@ -757,8 +757,8 @@ For full documentation on the configuration files, see the file
 Documentation/kbuild/kconfig-language.rst.
 
 
-11) Data structures
--------------------
+Data structures
+---------------
 
 Data structures that have visibility outside the single-threaded
 environment they are created and destroyed in should always have
@@ -789,8 +789,8 @@ Remember: if another thread can find your data structure, and you don't
 have a reference count on it, you almost certainly have a bug.
 
 
-12) Macros, Enums and RTL
--------------------------
+Macros, Enums and RTL
+---------------------
 
 Names of macros defining constants and labels in enums are capitalized.
 
@@ -893,8 +893,8 @@ The cpp manual deals with macros exhaustively. The gcc internals manual also
 covers RTL which is used frequently with assembly language in the kernel.
 
 
-13) Printing kernel messages
-----------------------------
+Printing kernel messages
+------------------------
 
 Kernel developers like to be seen as literate. Do mind the spelling
 of kernel messages to make a good impression. Do not use incorrect
@@ -929,8 +929,8 @@ already inside a debug-related #ifdef section, printk(KERN_DEBUG ...) can be
 used.
 
 
-14) Allocating memory
----------------------
+Allocating memory
+-----------------
 
 The kernel provides the following general purpose memory allocators:
 kmalloc(), kzalloc(), kmalloc_array(), kcalloc(), vmalloc(), and
@@ -971,8 +971,8 @@ These generic allocation functions all emit a stack dump on failure when used
 without __GFP_NOWARN so there is no use in emitting an additional failure
 message when NULL is returned.
 
-15) The inline disease
-----------------------
+The inline disease
+------------------
 
 There appears to be a common misperception that gcc has a magic "make me
 faster" speedup option called ``inline``. While the use of inlines can be
@@ -999,8 +999,8 @@ appears outweighs the potential value of the hint that tells gcc to do
 something it would have done anyway.
 
 
-16) Function return values and names
-------------------------------------
+Function return values and names
+--------------------------------
 
 Functions can return values of many different kinds, and one of the
 most common is a value indicating whether the function succeeded or
@@ -1034,8 +1034,8 @@ result.  Typical examples would be functions that return pointers; they use
 NULL or the ERR_PTR mechanism to report failure.
 
 
-17) Using bool
---------------
+Using bool
+----------
 
 The Linux kernel bool type is an alias for the C99 _Bool type. bool values can
 only evaluate to 0 or 1, and implicit or explicit conversion to bool
@@ -1064,8 +1064,8 @@ readable alternative if the call-sites have naked true/false constants.
 Otherwise limited use of bool in structures and arguments can improve
 readability.
 
-18) Don't re-invent the kernel macros
--------------------------------------
+Don't re-invent the kernel macros
+---------------------------------
 
 The header file include/linux/kernel.h contains a number of macros that
 you should use, rather than explicitly coding some variant of them yourself.
@@ -1087,8 +1087,8 @@ need them.  Feel free to peruse that header file to see what else is already
 defined that you shouldn't reproduce in your code.
 
 
-19) Editor modelines and other cruft
-------------------------------------
+Editor modelines and other cruft
+--------------------------------
 
 Some editors can interpret configuration information embedded in source files,
 indicated with special markers.  For example, emacs interprets lines marked
@@ -1121,8 +1121,8 @@ own custom mode, or may have some other magic method for making indentation
 work correctly.
 
 
-20) Inline assembly
--------------------
+Inline assembly
+---------------
 
 In architecture-specific code, you may need to use inline assembly to interface
 with CPU or platform functionality.  Don't hesitate to do so when necessary.
@@ -1153,8 +1153,8 @@ the next instruction in the assembly output:
 	     : /* outputs */ : /* inputs */ : /* clobbers */);
 
 
-21) Conditional Compilation
----------------------------
+Conditional Compilation
+-----------------------
 
 Wherever possible, don't use preprocessor conditionals (#if, #ifdef) in .c
 files; doing so makes code harder to read and logic harder to follow.  Instead,
@@ -1202,8 +1202,8 @@ expression used.  For instance:
 	#endif /* CONFIG_SOMETHING */
 
 
-22) Do not crash the kernel
----------------------------
+Do not crash the kernel
+-----------------------
 
 In general, the decision to crash the kernel belongs to the user, rather
 than to the kernel developer.
@@ -1264,8 +1264,8 @@ Use BUILD_BUG_ON() for compile-time assertions
 The use of BUILD_BUG_ON() is acceptable and encouraged, because it is a
 compile-time assertion that has no effect at runtime.
 
-Appendix I) References
-----------------------
+References
+----------
 
 The C Programming Language, Second Edition
 by Brian W. Kernighan and Dennis M. Ritchie.
-- 
2.49.0

