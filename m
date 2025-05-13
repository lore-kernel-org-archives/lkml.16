Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E9454758
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171036; cv=none; b=JKTGQxocLisEQg7JUF44fT738xgqmVTRsCbdGKxvNCFLIuXi5eKGzfaLb8hLJc/vd+oy1e3NJshnnaxqb0Jn7s/Q176jLz2R0aIogDaxJxeujwkZl4iUo34nCoMMarnj21WjzDazgta9Xn5mibenmMjiDtRdTSpRuSm+bDNvs1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171036; c=relaxed/simple;
	bh=tbmAcCHmXrhsRtKnGGJ7QP9M/F8HAnQdNl7kjTK9FLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRlbh1ZcPqn3T2azoE3hOwpLifg8DwLVQFQox7U8HskxaghD7TvCmLySlcGdroO2mA+1+rrxqvAAniMh1TCq8Jz2V0mD3Ae+Cvywxis2Rd+0gAVl3N7Dm5OviYwiSXGXXc/rv6Cggr/j95h4kfwiCPBYTLZc3tT063jJs2/4HQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u84pZYf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u84pZYf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755DAC4CEE4;
	Tue, 13 May 2025 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747171035;
	bh=tbmAcCHmXrhsRtKnGGJ7QP9M/F8HAnQdNl7kjTK9FLA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=u84pZYf6Z40cIqmpENe5tfTjYYTnKFaqgZU9LwYMPsC9LeXEKoAhzoPFrgCJIYXWW
	 XcMASR3dpL5kMcpriuSP5U+xpp6bq0OWww/uFpzfdi+AQ8F5JI+A4i2HJ/RkMGRQpb
	 Wa80Nh9jkcIEq6NMbG6MR063SRaQFP50Cd0XnVv52sWgL/hzvlHeDajgo85kh384Yj
	 AkIIJ3D8BcmeKUlAb0dq3va4yH8MzG95qSeH1KyBTsom6Qj9FxRchYR7Fe/+4vjG/k
	 KsGv/DV77pxXcVFc1Aq9Cd5KpA00L9TYSpQHZyib0WHEIaPcPyOPX/6GZ7wK/zgjv/
	 fOddW4KG2am9Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 13483CE0908; Tue, 13 May 2025 14:17:15 -0700 (PDT)
Date: Tue, 13 May 2025 14:17:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
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
Message-ID: <d22525bd-a470-4400-93ea-dda6a9efec4d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
 <20250508233335.1996059-20-paulmck@kernel.org>
 <aCISGjo-aYAs8y0u@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCISGjo-aYAs8y0u@pathway.suse.cz>

On Mon, May 12, 2025 at 05:22:02PM +0200, Petr Mladek wrote:
> On Thu 2025-05-08 16:33:34, Paul E. McKenney wrote:
> > Add a simple single-threaded smoke test for lib/ratelimit.c
> > 
> > To run on x86:
> > 
> > 	make ARCH=x86_64 mrproper
> > 	./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_RATELIMIT_KUNIT_TEST=y --kconfig_add CONFIG_SMP=y lib_ratelimit
> > 
> > This will fail on old ___ratelimit(), and subsequent patches provide
> > the fixes that are required.
> > 
> > --- /dev/null
> > +++ b/lib/tests/test_ratelimit.c
> > @@ -0,0 +1,79 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <kunit/test.h>
> > +
> > +#include <linux/ratelimit.h>
> > +#include <linux/module.h>
> > +
> > +/* a simple boot-time regression test */
> > +
> > +#define TESTRL_INTERVAL (5 * HZ)
> > +static DEFINE_RATELIMIT_STATE(testrl, TESTRL_INTERVAL, 3);
> > +
> > +#define test_ratelimited(test, expected) \
> > +	KUNIT_ASSERT_EQ(test, ___ratelimit(&testrl, "test_ratelimit_smoke"), (expected))
> > +
> > +static void test_ratelimit_smoke(struct kunit *test)
> > +{
> > +	// Check settings.
> > +	KUNIT_ASSERT_GE(test, TESTRL_INTERVAL, 100);
> > +
> > +	// Test normal operation.
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, false);
> > +
> > +	schedule_timeout_idle(TESTRL_INTERVAL - 40);
> 
> Heh, I have got a new laptop. The battery in the previous one was
> about to explode. And the test started failing on the next line most
> of the time.
> 
> The following change helped me:

Thank you very much!  I have queued this, and intend to keep it as its
own commit, following my original.

							Thanx, Paul

> >From 005e00ca09b4bd5b4a5f3026f1835e0435ecfbd9 Mon Sep 17 00:00:00 2001
> From: Petr Mladek <pmladek@suse.com>
> Date: Mon, 12 May 2025 16:38:02 +0200
> Subject: [PATCH] lib: Make the ratelimit test more reliable
> 
> The selftest fails most of the times when running in qemu with
> a kernel configured with CONFIG_HZ = 250:
> 
> >  test_ratelimit_smoke: 1 callbacks suppressed
> >  # test_ratelimit_smoke: ASSERTION FAILED at lib/tests/test_ratelimit.c:28
> >                    Expected ___ratelimit(&testrl, "test_ratelimit_smoke") == (false), but
> >                        ___ratelimit(&testrl, "test_ratelimit_smoke") == 1 (0x1)
> >                        (false) == 0 (0x0)
> 
> Try to make the test slightly more reliable by calling the problematic
> ratelimit in the middle of the interval.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  lib/tests/test_ratelimit.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/tests/test_ratelimit.c b/lib/tests/test_ratelimit.c
> index 0374107f5ea8..5d6ec8854600 100644
> --- a/lib/tests/test_ratelimit.c
> +++ b/lib/tests/test_ratelimit.c
> @@ -24,19 +24,19 @@ static void test_ratelimit_smoke(struct kunit *test)
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, false);
>  
> -	schedule_timeout_idle(TESTRL_INTERVAL - 40);
> +	schedule_timeout_idle(TESTRL_INTERVAL / 2);
>  	test_ratelimited(test, false);
>  
> -	schedule_timeout_idle(50);
> +	schedule_timeout_idle(TESTRL_INTERVAL * 3 / 4);
>  	test_ratelimited(test, true);
>  
>  	schedule_timeout_idle(2 * TESTRL_INTERVAL);
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, true);
>  
> -	schedule_timeout_idle(TESTRL_INTERVAL - 40);
> +	schedule_timeout_idle(TESTRL_INTERVAL / 2 );
>  	test_ratelimited(test, true);
> -	schedule_timeout_idle(50);
> +	schedule_timeout_idle(TESTRL_INTERVAL * 3 / 4);
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, true);
> -- 
> 2.49.0
> 
> Feel free to squash it into the original patch which added the test.
> 
> > +	test_ratelimited(test, false);
> > +
> > +	schedule_timeout_idle(50);
> > +	test_ratelimited(test, true);
> > +
> > +	schedule_timeout_idle(2 * TESTRL_INTERVAL);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +
> 
> Best Regards,
> Petr
