Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9D31E50E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743906396; cv=none; b=JVau6cjJH+GPTCqJvTjs6pGJA73JYQzvNmC3Het30MD0wQ3R2MSgOOgSIPC9XVwDGDoasB7U8HiHrJ+RlZyJgVtR24AHFfip/2Mzf/3wddraSZ+rjfiJQfTnlUEhSs2kyFTSQ5KmXad8vtq2xAA9/m1UM6bUkr6n0YGREeNiVvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743906396; c=relaxed/simple;
	bh=S8xIaWNmHVVdPvzYp2CSqwW6L/QzgTyDR5DDkDBcRso=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J4xEo/ESINmt4h/W2Wspa1JUap+H/qzLhYlCd74UfU0A/OU9wNuO7IW3ApmHIlzza8Nx9308gfdpfIFDbV956EYxAeYu2zA0dk+qog1sy3MY2ZPtM9FyFdaLIscg/SMWV2b2K9Njjsn2ebZh3sbO9kWsCKI7Z0W4XlgOtVegeh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sfh2oRYZ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sfh2oRYZ"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c55500d08cso310275485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 19:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743906392; x=1744511192; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IqxqfopP4aCBejumITSRdoprnx2Np5TJebDfmw6Dxk=;
        b=sfh2oRYZuctdYxW/cNmhvHvgKioKFmAo0J0BEOLm57aKk5KVrybR63M82ZkDIIy8J5
         PuRlI4itLBbXAxfYk0PrsLuuMRHf/NsQnsB/OEe4lK2JfInYB3zuTQOLCGxvqV92xxPh
         9CeU44iGLu4K9ZSEI78gTNVtuQIYLkBsjiAhAJ8sZSRdeB7o9KFS49X8poQWHVA24w6c
         /vgKlDZhYkc7MKELcdKHm2zhPhru4aTZKa9itVRYbJbxTcXcScerm5drNeedanp1XrS0
         fBWBonacnno9zpj/lkQ3CcfoB4LTPOFWNjmhKUbo1AKc42YpT+ZxG/OIN/aalwUHJUQ2
         r7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743906392; x=1744511192;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1IqxqfopP4aCBejumITSRdoprnx2Np5TJebDfmw6Dxk=;
        b=VWc4QJhmaCiZjP3vDK/VHt10p6+PYKi9HK3Y4zNiID/kPCEgjk2ST33RlSnb7kHLz7
         IsGnAozuNvbeoqJkxgNsDYT55sHmjGXj1JEbzP3WSzpSHz3H8Yz+Bpu1aXYdiAInvGWF
         hBLT8QwDVKgr1FsqCh//jC0tvHJtPPzTwvty5hcO7NlNue4KrlQk06o+VgDHC7yJL15U
         qEFZILM5vb6q1sTj6A9dHjZAn2agzGV0cObzpr8fuFEIQFzVOePbtjwbY6vzC3gXIOma
         eAm62rf5njF8t2df1FcmhziTocP4pGZQ6+nZDa26rU7WwHKMou08IiBdqtjpHv2I4Two
         1plQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrboEa/hzcrTaudJ4+VxsKfx8ym936LeQSdB+UOF5qd+/9aX6ctc8dGCTz+3xf50VzkY8uNI+M+uQpdMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTC+JdrU0BSBxEbT1GbjS9XCOT30WPbGNnmqw+Ep0evkJRmwk3
	ZIOIyJ3iW4oko0rDwIx+nMOQJG2G5Ba++8tINg5R6Ql5c3Cwf364T0kmTVhhX+k=
X-Gm-Gg: ASbGncvv8x2xvpo5ZwRHqo72C6G4Hm+Dz9z43kEAMb27tMwkpejOTKBZmyfE5Z43E9P
	A6wrE/RM4kR6aEkJknoGgi0DmXbKFWOV0UUslofQbls3z5BsRMOLFd0gBMBPYcZ+mnBvebWS8s/
	tHsrqAJO1l6dtjFWLa1G97kNM1bc5L3Dicq50N79J80gnXjapZs6VZXzlnlY/9c2YOtscbluOHE
	ZYGCrh1O1QMlMZcTQGfIzrMhPAVe5N2S9CzUniddqyU/WiidWQacI0OxaMY3M7F5iJ1FEEpkMiH
	uss4UHsV6xKUFwnJ9Mj2FL4/EUFYMqP1/ktEiHXaQPT/t8omuAdJ+/tPGOxh1DzeqRcDHL5n/Rv
	SvfzUzsI=
X-Google-Smtp-Source: AGHT+IEKcYuHBokEnfHVN3ItPKhyhlOg2e8P8WeGSvB6sn6m5NkO6lQDUAtvVNKU7WRsLsmADw0CEA==
X-Received: by 2002:a05:620a:4549:b0:7c5:a575:75da with SMTP id af79cd13be357-7c77dd441aemr677491085a.6.1743906391909;
        Sat, 05 Apr 2025 19:26:31 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e7354bdsm424148685a.20.2025.04.05.19.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 19:26:31 -0700 (PDT)
Date: Sat, 5 Apr 2025 22:26:30 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 3/3] lib: Update the muldiv64 tests to verify the C on
 x86-64
In-Reply-To: <20250405204530.186242-4-david.laight.linux@gmail.com>
Message-ID: <62qp434q-q2ps-r698-qs2n-43345rn4npn0@onlyvoer.pbz>
References: <20250405204530.186242-1-david.laight.linux@gmail.com> <20250405204530.186242-4-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Apr 2025, David Laight wrote:

> div64.c contains a 128 by 64 division algorithm which x86-64 overrides
> it with an asm implementation.
> So running the muldiv64 tests only verifies the asm code.
> Since x86-64 is the most likely test system compile the default
> code into an x86-64 kernel (under a different name) when the tests
> are being built.
> Verify that both the asm and C functions generate the correct results.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>  lib/math/div64.c                    | 18 ++++++++++++++++--
>  lib/math/test_mul_u64_u64_div_u64.c | 26 ++++++++++++++++++++------
>  2 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 50e025174495..38ee5c01c288 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -25,6 +25,8 @@
>  #include <linux/minmax.h>
>  #include <linux/log2.h>
>  
> +#include <generated/autoconf.h>

Isn't this automatically included everywhere by the Makefile?

> @@ -183,10 +185,22 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  }
>  EXPORT_SYMBOL(iter_div_u64_rem);
>  
> -#if !defined(mul_u64_add_u64_div_u64)
> +/*
> + * If the architecture overrides the implementation below and the test module
> + * is being built then compile the default implementation with a different name
> + * so that it can be tested.
> + */
> +#if defined(mul_u64_add_u64_div_u64) && (defined(CONFIG_TEST_MULDIV64) || defined(CONFIG_TEST_MULDIV64_MODULE))

You could shorten this to:

#if defined(mul_u64_add_u64_div_u64) && IS_ENABLED(CONFIG_TEST_MULDIV64)

> +#define TEST_MULDIV64

Then I'd use IS_ENABLED(CONFIG_TEST_MULDIV64) in place of TEST_MULDIV64.
It is more self explanatory.

> +#undef mul_u64_add_u64_div_u64
> +#define mul_u64_add_u64_div_u64 mul_u64_add_u64_div_u64_test
> +u64 mul_u64_add_u64_div_u64_test(u64 a, u64 b, u64 c, u64 d);
> +#endif

Hmmm... I wish there could be a better way to do this, but other than 
the above suggestion I don't see one.

> +
> +#if !defined( mul_u64_add_u64_div_u64) || defined(TEST_MULDIV64)
>  u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  {
> -#if defined(__SIZEOF_INT128__)
> +#if defined(__SIZEOF_INT128__) && !defined(TEST_MULDIV64)
>  
>  	/* native 64x64=128 bits multiplication */
>  	u128 prod = (u128)a * b + c;
> diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
> index 9548eb7458c7..e2289b412601 100644
> --- a/lib/math/test_mul_u64_u64_div_u64.c
> +++ b/lib/math/test_mul_u64_u64_div_u64.c
> @@ -73,6 +73,10 @@ done
>  
>   */
>  
> +#ifdef mul_u64_add_u64_div_u64
> +u64 mul_u64_add_u64_div_u64_test(u64 a, u64 b, u64 add, u64 c);
> +#endif
> +
>  static int __init test_init(void)
>  {
>  	int errors = 0;
> @@ -80,21 +84,31 @@ static int __init test_init(void)
>  
>  	pr_info("Starting mul_u64_u64_div_u64() test\n");
>  
> -	for (i = 0; i < ARRAY_SIZE(test_values); i++) {
> -		u64 a = test_values[i].a;
> -		u64 b = test_values[i].b;
> -		u64 c = test_values[i].c;
> -		u64 expected_result = test_values[i].result;
> +	for (i = 0; i < ARRAY_SIZE(test_values) * 2; i++) {
> +		u64 a = test_values[i / 2].a;
> +		u64 b = test_values[i / 2].b;
> +		u64 c = test_values[i / 2].c;
> +		u64 expected_result = test_values[i / 2].result;

I don't see the point of the loop doubling here.
If I understand it correctly, you'll test the default version twice and 
the _test version once for each test entry.


>  		u64 result = mul_u64_u64_div_u64(a, b, c);
>  		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, c);
>  
> +#ifdef mul_u64_add_u64_div_u64
> +		if (i & 1) {
> +			/* Verify the generic C version */
> +			result = mul_u64_add_u64_div_u64_test(a, b, 0, c);
> +			result_up = mul_u64_add_u64_div_u64_test(a, b, c - 1, c);
> +		}
> +#else
> +		i++;
> +#endif
> +
>  		if (result != expected_result) {
>  			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, c);
>  			pr_err("ERROR: expected result: %016llx\n", expected_result);
>  			pr_err("ERROR: obtained result: %016llx\n", result);
>  			errors++;
>  		}
> -		expected_result += test_values[i].round_up;
> +		expected_result += test_values[i / 2].round_up;
>  		if (result_up != expected_result) {
>  			pr_err("ERROR: 0x%016llx * 0x%016llx +/ 0x%016llx\n", a, b, c);
>  			pr_err("ERROR: expected result: %016llx\n", expected_result);
> -- 
> 2.39.5
> 
> 
