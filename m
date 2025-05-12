Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D18B66E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063329; cv=none; b=IO3c7PtA7IU5kRSE/Jr9aNAmx7m5x/UhVIRKfzpDMdEetuYmhdijse2wDzjh8sQTOwmM1his1V/f08oTEuZzJCJsC0nPOJhMCKWoQPVbTXmCF5rW26a50FC3nnNeg3h9qTQVb/mRLH0wCFABGr+j1qw813YBP1OKRcRhRklnvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063329; c=relaxed/simple;
	bh=wbEqmMEMqD1AvJL1qNtfeANnAbYoQcEnNNLmmCf2oyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIFXL0Fv2agN2NtegarAunKLhuGERIaPj6PAuD6dNf4eboDvca5HoF+XiCmPXk95uiLEWKB3gfGuNj2l2UBvwuvSC3YzQSzXRttPoOJlMYjColq+hEk4kxizZCJUytRrIU1qj8WwvHhRz8od+aGSAVnw0/al7DP2I1YmBEdybx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QKj1ZDbk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QKj1ZDbk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad2452e877aso275481566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747063325; x=1747668125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwCgsB48IJa6Iqqt1Nvy5n+N4R6t7txPXIwtholDS0A=;
        b=QKj1ZDbkhvw4J58xEWiJrVC8UMz4z7Gdt/d9KPD+31TptHhIVNODAp7tOM4MaoPSx2
         /3iNrRgZ9LXxIJh4tVO1qldoPVkgYorqQQmaERVU52nI9/ZS1LIzcB4bIXxNvbXGklJ6
         tLA/6tW+4bn3gb3rZW01O4CPwvZw+g71ehw9OYyojYm/9MDj8rxO9XCYNZidFUdDGKGL
         jVWCnmpySgD0/ifR1fPZDRmEAsM5ia30iLDWTUsKiLstB4Z8r2R43b1356VrD0Tk7wFe
         bA+LIIuHk5bT4Zz1wVWHsnnvL4fC4Xo3vR18G2XED+mdpTWOG/EiRANocYGRr6+xdrMz
         BhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063325; x=1747668125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwCgsB48IJa6Iqqt1Nvy5n+N4R6t7txPXIwtholDS0A=;
        b=O4tTnbFbsIWgmJjWLTiWOvhoSzhQjQC26wI3GDTIWUs832SuOi7DCWKbveMiE7v90Z
         QXX9FTVSLblEyHBiKiVBwo8gxsSsx5Zmxfl57Tp6kC9AdEMPEOn1ygAzXq/NDx+JpYDk
         CmH+PSoWRMwbQKNveN80L8eNaB44m04w8AS+Ja7NaJu/IPo55D1CUNXmENOMGGOC90y8
         gbA7sxuz2GcVXnccOs9HfdKGHXqiLRkI4IQXIhWCG1AKUSb4Fftz/i22+CT7kubXZKhi
         gFKyjkmYWSdT/jksQZ1TUbxu8qiXnGPnbr76OezitJxZ6OW8/7XLx2OMd4sEvgxlWb1E
         AGRg==
X-Gm-Message-State: AOJu0Yypd4kshpVpW95dlkqetIcca2G6liezgdvJ4vtXhFZV6cy1It69
	Wt3+Or0RRkvXNc94VQWpBPZPrU/q6sHy6ddW51rk59iFdJ8VoyWJJ5Z/HORj+TY=
X-Gm-Gg: ASbGncvYHjBaHuwgtHgZrhg4NUAT4oyIRZcqw6ZRhJZrawJAGPA3ssnBA7N2MHsotpR
	eZ1F+eahG1SVXWof6RPqTiewbkNgcHD2oWjaoxBxC2Zdx3LVr6VOZzS37L9FdTSmtsdOno2AV2W
	b9dWRIZtlD6SaodBtFnyFqPKRBFpty8UZZGTTySFv6j30a72g9keCXakXCWPXU3iqEFy8tyQpo+
	mF1iT0BuW6cLtMKWZXUB571nrPHLFizT/mPIKD44XlDmJXwPpopAghW3KtX8kDfAyXPsPMRjUg5
	l5SEcyjtcVhj7ev9Rfdv9BwBk9ZLR/8wHokjAIYrxabpqLwtCAYWIw==
X-Google-Smtp-Source: AGHT+IH8CjfXyuuePrnoFgkeVZOY1m1OFEWObGuNoM604cU4OzREf5Fg3kwEWLwl+ycH1gdmJA4AKg==
X-Received: by 2002:a17:907:86a4:b0:aca:d6f2:5d5 with SMTP id a640c23a62f3a-ad21915f68cmr1339483766b.39.1747063325138;
        Mon, 12 May 2025 08:22:05 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8ac2sm629798466b.27.2025.05.12.08.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:22:04 -0700 (PDT)
Date: Mon, 12 May 2025 17:22:02 +0200
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
Subject: Re: [PATCH v5 20/21] lib: Add trivial kunit test for ratelimit
Message-ID: <aCISGjo-aYAs8y0u@pathway.suse.cz>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
 <20250508233335.1996059-20-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508233335.1996059-20-paulmck@kernel.org>

On Thu 2025-05-08 16:33:34, Paul E. McKenney wrote:
> Add a simple single-threaded smoke test for lib/ratelimit.c
> 
> To run on x86:
> 
> 	make ARCH=x86_64 mrproper
> 	./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_RATELIMIT_KUNIT_TEST=y --kconfig_add CONFIG_SMP=y lib_ratelimit
> 
> This will fail on old ___ratelimit(), and subsequent patches provide
> the fixes that are required.
> 
> --- /dev/null
> +++ b/lib/tests/test_ratelimit.c
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
> +	KUNIT_ASSERT_EQ(test, ___ratelimit(&testrl, "test_ratelimit_smoke"), (expected))
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

Heh, I have got a new laptop. The battery in the previous one was
about to explode. And the test started failing on the next line most
of the time.

The following change helped me:

From 005e00ca09b4bd5b4a5f3026f1835e0435ecfbd9 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 12 May 2025 16:38:02 +0200
Subject: [PATCH] lib: Make the ratelimit test more reliable

The selftest fails most of the times when running in qemu with
a kernel configured with CONFIG_HZ = 250:

>  test_ratelimit_smoke: 1 callbacks suppressed
>  # test_ratelimit_smoke: ASSERTION FAILED at lib/tests/test_ratelimit.c:28
>                    Expected ___ratelimit(&testrl, "test_ratelimit_smoke") == (false), but
>                        ___ratelimit(&testrl, "test_ratelimit_smoke") == 1 (0x1)
>                        (false) == 0 (0x0)

Try to make the test slightly more reliable by calling the problematic
ratelimit in the middle of the interval.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 lib/tests/test_ratelimit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/tests/test_ratelimit.c b/lib/tests/test_ratelimit.c
index 0374107f5ea8..5d6ec8854600 100644
--- a/lib/tests/test_ratelimit.c
+++ b/lib/tests/test_ratelimit.c
@@ -24,19 +24,19 @@ static void test_ratelimit_smoke(struct kunit *test)
 	test_ratelimited(test, true);
 	test_ratelimited(test, false);
 
-	schedule_timeout_idle(TESTRL_INTERVAL - 40);
+	schedule_timeout_idle(TESTRL_INTERVAL / 2);
 	test_ratelimited(test, false);
 
-	schedule_timeout_idle(50);
+	schedule_timeout_idle(TESTRL_INTERVAL * 3 / 4);
 	test_ratelimited(test, true);
 
 	schedule_timeout_idle(2 * TESTRL_INTERVAL);
 	test_ratelimited(test, true);
 	test_ratelimited(test, true);
 
-	schedule_timeout_idle(TESTRL_INTERVAL - 40);
+	schedule_timeout_idle(TESTRL_INTERVAL / 2 );
 	test_ratelimited(test, true);
-	schedule_timeout_idle(50);
+	schedule_timeout_idle(TESTRL_INTERVAL * 3 / 4);
 	test_ratelimited(test, true);
 	test_ratelimited(test, true);
 	test_ratelimited(test, true);
-- 
2.49.0

Feel free to squash it into the original patch which added the test.

> +	test_ratelimited(test, false);
> +
> +	schedule_timeout_idle(50);
> +	test_ratelimited(test, true);
> +
> +	schedule_timeout_idle(2 * TESTRL_INTERVAL);
> +	test_ratelimited(test, true);
> +	test_ratelimited(test, true);
> +

Best Regards,
Petr
