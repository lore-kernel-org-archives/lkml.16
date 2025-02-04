Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234C139CE3
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658358; cv=none; b=ZsIRcRzw0dd8rtjeRlIAJITVJbBeyI5OvhE77r6gZcvFM4VTWj6/+9ALWAJMSBOPcYOLcdLV/ixix849BVoG+zQngb0EFTzY41pBVbbrF4wjTUA6UusyTS6SKmUzLdcJyjhijPZ21rxBoJt+UkR8wApPCOWtUg8qMVsIOQ3jMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658358; c=relaxed/simple;
	bh=CXzrvnyNy6UIR8AIqnNDWW6iG2MDonaTRV39vDstuno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGpAjCM7yo2yUi/n8jD9eX8vJARs3QKkVg+5MqKxdQk3X8OE4TKO9qa/lvnESwOyIRSryjL/Ot5Tun+RXImqbDcFh6RqcmxyU2TUQvRYnxLx6CVhhLmby7ba/zXM6C69cqoL9DKQhyTPGs5kRK/N7YCYbbtSYgrFh352pOcUeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AlHnp9FH; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AlHnp9FH"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so9909631a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 00:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738658355; x=1739263155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb8SCwepcIFpHG6pcamLtEJWKgHZdTSbrBKJiie6Qso=;
        b=AlHnp9FHfJWNem0SHz4KGglwLq5PJY8Ttpk40+sVbQGC52jyEycaSQcOkNMMk5QNMn
         f9yg4Rf/we7D9u3YF4q7451vjtYzoZhYJ/NTX142qrLDJg8kC+g24OROaaJAqcsjgRRW
         oHZrieRO535smAG1y3sM+akHHnEwSBSUlaT6xicXzXkQCJQJ46917FZXyG8hM5dnpqak
         nh4UKbnxJpmfkBCEoPzg38l5sBCWfubjRZ4ZXIf+4g1K3rxMmUrsk1MrtF0m27iJh2xV
         VYwX9X9qir3Nm3iRB7MjB2/4Nmj6Wf1Mim1DWteoH1a0N3bA5A8O4BE4T4VLsZN3QwuF
         s6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658355; x=1739263155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vb8SCwepcIFpHG6pcamLtEJWKgHZdTSbrBKJiie6Qso=;
        b=fiRRZlO8+4B828ELut6dNVZWtsE/1Ug+82Yw2n4RfjNO0vpS/WcltQ4y1DjRd3klRk
         37Tepf6poTLW45UXq833qRlKs0v45ohWOjLXk/OusXU22jwYFtNsbJDtWRZuWKCt8Uxb
         d8/LtZzHEfZZ3Jj8iUWDBi6sUeCiuHpubFYKCI1lGrqxBaYmXePytoKcjU27TMNxA6Jp
         C112+S/FExRbUPMlNTDLoFIyu7XQ2XOM+2NAdevKuKn1XWCiRkr08ZDLgplDcXuAUnQG
         Z188U+d+KLGGsFn0N0nePhSHtnjIJAY8VcxWaj4sHLdR5sAonFUFHsW9z0u62qX7bw6B
         YUow==
X-Forwarded-Encrypted: i=1; AJvYcCUesjaoOECeA45cW/o4z+Px2dHuSIhPzaY0VvhZsG841JnS5Ab0yXFhkc4ZyU6m7rDkw1KbAEwJauODI4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFS6sTWu+mlwDcemnjBEdUn1JfGPkL5mp549eFra+J0++HuIx4
	rlwgLsWlcOebxwznB2GY+vLxL1gU3YwxZKKtmOa9Ho++EAGai1TwapigplHL2+8=
X-Gm-Gg: ASbGncsbAv6JOnjHOQyMK2WRY9atB6ACX7kE630fNG30+ED7guQOBgYj1ttbu+0BBBR
	cEJtKbNQge6jbgsWDczZsOp/hpPbSHIp6/B9cTb36LWfFsrtd2dx+zZvgYaY9EWI74lOTHNBXlr
	bnchkDjt46f90+BhDnN12FSj2qf8Q+JLZZHOjCY9oYaEKH0/9PwUOFADGh/lZX47rSQZSaDuQzB
	89yx7d3l6LxhnFBw3qxrchi/tZOP787losdqLDcKzrWOCaz45QC3nXhSYHWBoAeHOwlSyKMwb5c
	d/fqccqgQ6KQwT7iEQ==
X-Google-Smtp-Source: AGHT+IE+fr0/sskjLgIexiwqgLWwnZjXxN2KiXcplZXGykP1nsDXc5j8PautDh9haM1ztvdahceqLw==
X-Received: by 2002:a17:907:7faa:b0:ab7:b93:f77d with SMTP id a640c23a62f3a-ab70b93fafcmr1255044066b.3.1738658353235;
        Tue, 04 Feb 2025 00:39:13 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab706ce9a53sm627549466b.72.2025.02.04.00.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:39:12 -0800 (PST)
Date: Tue, 4 Feb 2025 09:39:10 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] scanf: convert self-test to KUnit
Message-ID: <Z6HSFvvgxFVGDQeI@pathway.suse.cz>
References: <20250203-scanf-kunit-convert-v2-1-277a618d804e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-scanf-kunit-convert-v2-1-277a618d804e@gmail.com>

On Mon 2025-02-03 06:48:05, Tamir Duberstein wrote:
> Convert the scanf() self-test to a KUnit test.
> 
> In the interest of keeping the patch reasonably-sized this doesn't
> refactor the tests into proper parameterized tests - it's all one big
> test case.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> ---
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and printf), the rest having been converted to KUnit. In
> addition to the enclosed patch, please consider this an RFC on the
> removal of the "Test Module" kselftest machinery.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 scanf

Fortunately, the following still works ;-)

	$ modprobe scanf_kunit

Just the messages in dmesg are in the ktap format.

Anyway, I do not have strong opinion. I am fine with this change
when similar tests are being tranformed to kunit tests.

Acked-by: Petr Mladek <pmladek@suse.com>

Should this go via the printk tree, please?
Or is David going to take it via the kunit tree?

Also see a nit below.

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2427,6 +2427,23 @@ config ASYNC_RAID6_TEST
>  config TEST_HEXDUMP
>  	tristate "Test functions located in the hexdump module at runtime"
>  
> +config SCANF_KUNIT_TEST
> +	tristate "KUnit test scanf() family of functions at runtime" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to test the scanf functions at boot.
> +
> +	  KUnit tests run during boot and output the results to the debug log
> +	  in TAP format (http://testanything.org/). Only useful for kernel devs
> +	  running the KUnit test harness, and not intended for inclusion into a
> +	  production build.
> +
> +	  For more information on KUnit and unit tests in general please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +	  If unsure, say N.
> +
>  config STRING_KUNIT_TEST
>  	tristate "KUnit test string functions at runtime" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> @@ -2443,9 +2460,6 @@ config TEST_KSTRTOX
>  config TEST_PRINTF
>  	tristate "Test printf() family of functions at runtime"
>  
> -config TEST_SCANF
> -	tristate "Test scanf() family of functions at runtime"
> -
>  config TEST_BITMAP
>  	tristate "Test bitmap_*() family of functions at runtime"
>  	help
> diff --git a/lib/Makefile b/lib/Makefile
> index d5cfc7afbbb8..a53cf6dd1505 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -85,7 +85,6 @@ obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
>  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
>  obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
>  obj-$(CONFIG_TEST_PRINTF) += test_printf.o
> -obj-$(CONFIG_TEST_SCANF) += test_scanf.o
>  
>  obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
>  ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_KASAN),yy)
> @@ -373,8 +372,9 @@ CFLAGS_bitfield_kunit.o := $(DISABLE_STRUCTLEAK_PLUGIN)
>  obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
>  obj-$(CONFIG_CHECKSUM_KUNIT) += checksum_kunit.o
>  obj-$(CONFIG_UTIL_MACROS_KUNIT) += util_macros_kunit.o
> -obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
>  obj-$(CONFIG_HASHTABLE_KUNIT_TEST) += hashtable_test.o
> +obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o

This looks like an unrelated change.

> +obj-$(CONFIG_SCANF_KUNIT_TEST) += scanf_kunit.o
>  obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
>  obj-$(CONFIG_BITS_TEST) += test_bits.o
>  obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o

Best Regards,
Petr
