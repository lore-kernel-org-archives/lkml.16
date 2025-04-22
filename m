Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E9B2853FA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333063; cv=none; b=T3iewfoWA6z2L2a3VBBQ6xXyntVblNoiMrnjBVbZ/+//dZpKZyB3bB3pe6NCejI4dRtk3SC3flB/WGFJDE46+Z++JVJb/4zlZtqqwUfeQD4YZOHGJ4op90Mtfb3RqseY4VtWeb8bIkXtZ/+U1yQs3tVHxbVkmBrSSOvJnXeJCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333063; c=relaxed/simple;
	bh=hcRCVQLMGQuokxZ47uRkLb94JUCIlU9ZIY11BPBvFM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrBwit8qxrkMV1GAhS6iWihRpAjA0d/5W7j8E91hA+mO0lYU2tO+q/4axOWCf38b3N9LGr0Gwa5kwrZfKB2jyVJxvqqtWA/wcFCKDPBjHu+TNFbO2XQolTmmGZC2EmKHcm95BYMEANI3UfRlqpGE+Dkradp/7MPWq7/MJMQ/qD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KCgpzkbV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KCgpzkbV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c1389so3929982f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745333060; x=1745937860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtbOQr3P1AE5JrgnTdrzdzy2R0eA5GDtOLhEvjLT2oE=;
        b=KCgpzkbVdVzTsnDEGbZadZqvYsy57Ol4Zaz7ipqXkoXzxqMhljbBCcgjDbps/cNnnu
         rLpv2Yy8XxJS/bG0xYOvjsN6sCHn5bMVtbwv8laVfCQNQCRt1BNCZl3uqfp5Xtb6yp6U
         AjPdKTVquf8GtRjqOHOYUQ+4Rf7sXytEzyTtb+7qCdBLABb4FJfxDZHeA/hdlA6v3vgU
         qcqGgEWGDuWEo+H9OiLDYN7wg5IYhADhnAoUao5Ii14HqZ+BpofwY5sr2GX1hNT+T5Dj
         49clS1uunoj57J7npMMey0MBbQy+xbsm5/60WeaWL2lWOP8FV4VTXQh3QQFRdcs6iBhE
         OK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333060; x=1745937860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtbOQr3P1AE5JrgnTdrzdzy2R0eA5GDtOLhEvjLT2oE=;
        b=lhr7JIypWSWYMOApuZHt9n8+thkxa/pllg3Edxt7Y6c5SqQFP/1OB6/VRDUkC1jvmV
         +Mg+mAqNofAjkbb7Q3jendR+vhnKAW9PRVVjXP91E11Nc14Rag/V7r3yCskJgmh/5h/C
         BS6bnuLxUmLOkoRJNrisiE+A8GZ5RZMJ2T80E8Il9CfyBUaOZTYfhfK06XV3utlf45Tk
         ulJjWigIYZbCAooNOIBPs7WKDgHTOg0Ch8yFg55EsLxpYqkhGC9go8wc9hamuFyrhsMB
         m6GyLH5cFR1PrXUawEY4CKrXskdn+JHRyiobBzmVqd6rDWH6cA4Zc5/Ssq/SpnJvWT4W
         a0Jg==
X-Gm-Message-State: AOJu0YxIwq2r5Ido2z+gqEVyMjnZDz0ybPIvG2DmQKKvV0IZ31s1UK2x
	KbJhsH7BVp1rm/kqmUrkg27PCC5y11Ux/yXPDL8j7AsR9U1VRpebxjEXWiWEJ14=
X-Gm-Gg: ASbGncvwM9ItZilFCqGAfTxSgBzUGd4dPUarPUJbefo6RGbXuHPJ5htzSjIwCJNtLJj
	J9wQSJpvc5N7lZ3MXN3ZfM3mzzWqq2KNtzcOxqeGjCnbTZXMUtUM4zSNXoS7pFYw4c12onyGz4U
	wvzxVRwlf0orIqWVSk0oshQ4YAa95QBc7mNzvgmPuOz+F16Q7TyfSwISB9fqyJ6sF4Lk1bXVVtE
	pWyXvqbqSzSOmCNkD3SwXltF9+f+dLkOaUTLZpA498PxihpFBAvO89lHUyxHsVMdodpUKDqqjIG
	E7PT7b3ypapjXMRqk9j63/EwYqcH3ZY1ovjZNiLHWrlvsvp1L0kJbg==
X-Google-Smtp-Source: AGHT+IFxoOhwp5MY2iqliXh8xj4kMNlgzW6VhoDXHTLEb4aGGDNqCpHb8zwa/xmo/9Siz3ExW8sYtA==
X-Received: by 2002:a05:6000:2287:b0:39c:e14:cd70 with SMTP id ffacd0b85a97d-39efba5cd28mr12328667f8f.34.1745333059757;
        Tue, 22 Apr 2025 07:44:19 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207c5sm15278879f8f.6.2025.04.22.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:44:19 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:44:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v2 ratelimit 01/14] lib: Add trivial kunit test for
 ratelimit
Message-ID: <aAerQXIz8Aebqm8c@pathway.suse.cz>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-1-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418171359.1187719-1-paulmck@kernel.org>

Hi,

I have been recently involved in a conversion of printf/scanf
selftests to KUnit. And I seem that there are some naming
conventions. Adding Kees into Cc.

On Fri 2025-04-18 10:13:46, Paul E. McKenney wrote:
> Add a simple single-threaded smoke test for lib/ratelimit.c
> 
> To run on x86:
> 
> 	make ARCH=x86_64 mrproper
> 	./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_TEST_RATELIMIT=y --kconfig_add CONFIG_SMP=y lib_ratelimit
> 
> [ paulmck:  Apply timeout feedback from Petr Mladek. ]
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Jon Pan-Doh <pandoh@google.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Karolina Stolarek <karolina.stolarek@oracle.com>
> ---
>  lib/Kconfig.debug    | 11 ++++++
>  lib/Makefile         |  1 +
>  lib/test_ratelimit.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 lib/test_ratelimit.c
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9fe4d8dfe5782..581d6a8489670 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3232,6 +3232,17 @@ config TEST_OBJPOOL
>  
>  	  If unsure, say N.
>  
> +config TEST_RATELIMIT

Most KUnit tests seems to follow the pattern <ITEM>_KUNIT_TEST.
You might want to use:

config RATELIMIT_KUNIT_TEST

> +	tristate "Test module for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS

	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS

> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds the "test_ratelimit" module that should be used
> +	  for correctness verification and concurrent testings of rate
> +	  limiting.
> +
> +	  If unsure, say N.
> +
>  config INT_POW_KUNIT_TEST
>  	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> --- /dev/null
> +++ b/lib/test_ratelimit.c

The commit db6fe4d61ece241 ("lib: Move KUnit tests into tests/ subdirectory")
moved many kunit test modules to lib/tests.

Also they renamed the printf/scanf test modules to <item>_kunit.c,
so this probably should be:

 lib/tests/ratelimit_kunit.c

> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <kunit/test.h>
> +
> +#include <linux/ratelimit.h>
> +#include <linux/module.h>
> +
> +/* a simple boot-time regression test */
> +
> +#define TESTRL_INTERVAL (5 * HZ)
> +static DEFINE_RATELIMIT_STATE(testrl, TESTRL_INTERVAL, 3);
> +
> +#define test_ratelimited(test, expected) \
> +	KUNIT_ASSERT_EQ(test, ___ratelimit(&testrl, "test_ratelimit_smoke"), (expected));
> +
> +static void test_ratelimit_smoke(struct kunit *test)
> +{
> +	// Check settings.
> +	KUNIT_ASSERT_GE(test, TESTRL_INTERVAL, 100);
> +
> +	// Test normal operation.
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, false);
> +
> +	schedule_timeout_idle(TESTRL_INTERVAL - 40);
> +	test_ratelimited(test, false);
> +
> +	schedule_timeout_idle(50);
> +	test_ratelimited(test, true);
> +
> +	schedule_timeout_idle(2 * TESTRL_INTERVAL);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +
> +	schedule_timeout_idle(TESTRL_INTERVAL - 40);
> +	test_ratelimited(test, true);
> +	schedule_timeout_idle(50);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, false);
> +
> +	// Test disabling.
> +	testrl.burst = 0;
> +	test_ratelimited(test, false);
> +	testrl.burst = 2;
> +	testrl.interval = 0;
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +
> +	// Testing re-enabling.

BTW: I had to add the following sleep to make sure that the next call
     was past the interval. Otherwise, the test failed.

	schedule_timeout_idle(TESTRL_INTERVAL);

That said, this was needed when testing the original ___ratelimit()
implementation. It is not needed with the entire patchset applied.
I guess that it was solved by the 11th patch "[PATCH 11/14] ratelimit:
Force re-initialization when rate-limiting re-enabled".

> +	testrl.interval = TESTRL_INTERVAL;
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, false);
> +	test_ratelimited(test, false);
> +}
> +
> +static struct kunit_case sort_test_cases[] = {
> +	KUNIT_CASE(test_ratelimit_smoke),

The test printed:

[   75.479585]     # test_ratelimit_smoke: Test should be marked slow (runtime: 25.326793644s)

The warning has gone when using:

	KUNIT_CASE_SLOW(test_ratelimit_smoke),

> +	{}
> +};
> +
> +static struct kunit_suite ratelimit_test_suite = {
> +	.name = "lib_ratelimit",
> +	.test_cases = sort_test_cases,
> +};

Best Regards,
Petr
