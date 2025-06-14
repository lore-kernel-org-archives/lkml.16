Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8D16F8E9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914743; cv=none; b=VIN9p2a1vDTaFpWC2lg4xKScnItjBYOjGNmC3arHUOx299xxUO0OdNN34LHzipTv/Phc4t1yCbVkQP25vutfkl5Ip8569xXuW/WrubFVz9+eGBpfROKpsKrlUcVxtkWGH11sk/eFz8SdPgaOdBxihZRwy60dbhES0ykekCegiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914743; c=relaxed/simple;
	bh=m/OUbcKOcjpf5uzIGH8L+8ydpt7kL28iPb4+e8nmc0A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WrfTBZtzVjFijNBbferyIVj2bCjaps4dVF8Nulu4sgULrFcbqJMJXUx02B7UOWuDi6OFyC7gn9FWla6nhfucf15fDQu/QTJ8BIv+nh0ZqW/qPW/TPSWvpQ0O8Q7TDTn20RF59S+QW0a2UZBT7P8Tl9vb0Y1p12n+2PlE9wq9HzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KN0HDsFW; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KN0HDsFW"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a5903bceffso38627751cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749914737; x=1750519537; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyLNpgV8IKlZpHVHx/0vxUy8puoobe07u/iuiJ4BoQg=;
        b=KN0HDsFW6NlaAeXJvG7Y5PEukNWYySdO0UL7Tzkeyw64yEE2hCNJBh7SpgUhIcD2H5
         rtkakV2Y/j6oPmSJliJ89fDkkxmSROnP1/LkfSyTdNYR1CTZOZULZbjt/ZvUEMOVarcs
         Lsj/1pzA83/VovlmxhiNag/lJDkyWZCzLUDZlkF9qS4mwRUN/YwRBVuN2M9M2Dd6bMt3
         FDDErM0Uuh30h83kDMV5uEISot7rHc2Y6WG1XmqjGFs6oB1BAD5eVKR4f0xWsd05WcmZ
         DKSKONSWKh64aI7YK/QQvsSbuQWbemjFMq4QvTa/Nmy2laQ4+fQl8nDWWnplovfJWxUP
         oWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749914737; x=1750519537;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyLNpgV8IKlZpHVHx/0vxUy8puoobe07u/iuiJ4BoQg=;
        b=KPDVziZbH+SmMu5wxbW9i5NgVz1xqW7CN+ivQjyoy4x0OnJbXZ75pP1ClGsB89DQYK
         11PXg++XvIDYr+pM0V/KI1KtKpHHqnKfYRn9icbwFYgGBk2pj8N44WDOlO+ti4n2IRgM
         ncz0uWSrafTzaYTUKfNpWaHT/iwkMrM2J7ADsVQv08MZs7pvNOlEEgkp7xJJdv4am4O3
         U/GlJEfcGYR8UYp45RvB7ALJfHmo9hP+uo6xiWvzu9ITaU/WCTyA0dh908wXI7uKjYDO
         0vvxBrGk1H2773R0J6Ija7akTWR7cUoc2g1s+zZmrREMi4XGdP6xyXYuj0BxU3FXmZ78
         rxIw==
X-Forwarded-Encrypted: i=1; AJvYcCXe2shMWkTBDfSGk+K/pcrho0kYl+/LjOOV5Msrolfv+a1bQvK0aLaD4Khs47UwwclNwWQHOr4Mj2vvrpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8qjcCrvxKkF3H++vn/MNqoGQC549GVYNJODq7+xbH86CRTda
	m+3f0H1Pf5TV38hptKWGn1R20FWukSSCvU8I+UcHPAVVntvpp/MZJkndLBTgyqJqUtk=
X-Gm-Gg: ASbGnculEPy2ZtT/cOj5RMzZ5TMNj2kCIeQDAJmw0jYO5U3ygG8GKghCzDzAdBpFyN5
	DH6iWvSPUK3TYyY/4UZCbp04Yt1Ay5tp1N0b7OrhQln58NdHKD1jUuXLUJqkCma106CH9nwkWKU
	Lb6+6W04IP8WP2fPmFumcRdSDdPLWBA+BiLuq/IQIH+Yx+OqYp+bweSQLyNkGahvmd5Urlbm/oa
	CwDrGN05zvpfWL8AoRU9dRc2AilT2R6RFMNQnGLsbv8LT1AI9KVktNeTu9SUTl4tHGTKojlqhQx
	Ef2ojXfLseBfFj5At7Dw9ivks7PcfQe8w9v4t4CFQ5C1C/BAbp/hAe72//Ze8HKJ+fwon0wlDzs
	X/D6hwx/YIlSw+5Y0hWZHiLzHN6YdrZXjzanf
X-Google-Smtp-Source: AGHT+IE7JkTbMPWTKCVXq3SbW9S5m+GHbf1vpvwlHZSYuxzM8f9I0HZtMeDg05ft9RV1btR+ILtEaQ==
X-Received: by 2002:ac8:5713:0:b0:48d:df0e:ef38 with SMTP id d75a77b69052e-4a73c5f83fcmr54320081cf.33.1749914737238;
        Sat, 14 Jun 2025 08:25:37 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b18edsm29922731cf.41.2025.06.14.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:25:36 -0700 (PDT)
Date: Sat, 14 Jun 2025 11:25:35 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 06/10] lib: test_mul_u64_u64_div_u64: Test both
 generic and arch versions
In-Reply-To: <20250614095346.69130-7-david.laight.linux@gmail.com>
Message-ID: <q51q92o9-s77q-9431-nss5-03o1258803n0@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-7-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> Change the #if in div64.c so that test_mul_u64_u64_div_u64.c
> can compile and test the generic version (including the 'long multiply')
> on architectures (eg amd64) that define their own copy.

Please also include some explanation for iter_div_u64_rem.

> Test the kernel version and the locally compiled version on all arch.
> Output the time taken (in ns) on the 'test completed' trace.
> 
> For reference, on my zen 5, the optimised version takes ~220ns and the
> generic version ~3350ns.
> Using the native multiply saves ~200ns and adding back the ilog2() 'optimisation'
> test adds ~50ms.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> 
> New patch for v3, replacing changes in v1 that were removed for v2.
> 
>  lib/math/div64.c                    |  8 +++--
>  lib/math/test_mul_u64_u64_div_u64.c | 48 ++++++++++++++++++++++++-----
>  2 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 7850cc0a7596..22433e5565c4 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -178,13 +178,15 @@ EXPORT_SYMBOL(div64_s64);
>   * Iterative div/mod for use when dividend is not expected to be much
>   * bigger than divisor.
>   */
> +#ifndef iter_div_u64_rem
>  u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  {
>  	return __iter_div_u64_rem(dividend, divisor, remainder);
>  }
>  EXPORT_SYMBOL(iter_div_u64_rem);
> +#endif
>  
> -#ifndef mul_u64_add_u64_div_u64
> +#if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
>  u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  {
>  	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
> @@ -196,7 +198,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  		return 0;
>  	}
>  
> -#if defined(__SIZEOF_INT128__)
> +#if defined(__SIZEOF_INT128__) && !defined(test_mul_u64_add_u64_div_u64)
>  
>  	/* native 64x64=128 bits multiplication */
>  	u128 prod = (u128)a * b + c;
> @@ -270,5 +272,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  
>  	return res;
>  }
> +#if !defined(test_mul_u64_add_u64_div_u64)
>  EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
>  #endif
> +#endif
> diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
> index ea5b703cccff..f0134f25cb0d 100644
> --- a/lib/math/test_mul_u64_u64_div_u64.c
> +++ b/lib/math/test_mul_u64_u64_div_u64.c
> @@ -73,21 +73,34 @@ done
>  
>   */
>  
> -static int __init test_init(void)
> +static u64 test_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d);
> +
> +static int __init test_run(unsigned int fn_no, const char *fn_name)
>  {
> +	u64 start_time;
>  	int errors = 0;
>  	int tests = 0;
>  	int i;
>  
> -	pr_info("Starting mul_u64_u64_div_u64() test\n");
> +	start_time = ktime_get_ns();
>  
>  	for (i = 0; i < ARRAY_SIZE(test_values); i++) {
>  		u64 a = test_values[i].a;
>  		u64 b = test_values[i].b;
>  		u64 d = test_values[i].d;
>  		u64 expected_result = test_values[i].result;
> -		u64 result = mul_u64_u64_div_u64(a, b, d);
> -		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, d);
> +		u64 result, result_up;
> +
> +		switch (fn_no) {
> +		default:
> +			result = mul_u64_u64_div_u64(a, b, d);
> +			result_up = mul_u64_u64_div_u64_roundup(a, b, d);
> +			break;
> +		case 1:
> +			result = test_mul_u64_add_u64_div_u64(a, b, 0, d);
> +			result_up = test_mul_u64_add_u64_div_u64(a, b, d - 1, d);
> +			break;
> +		}
>  
>  		tests += 2;
>  
> @@ -106,15 +119,36 @@ static int __init test_init(void)
>  		}
>  	}
>  
> -	pr_info("Completed mul_u64_u64_div_u64() test, %d tests, %d errors\n",
> -		tests, errors);
> -	return errors ? -EINVAL : 0;
> +	pr_info("Completed %s() test, %d tests, %d errors, %llu ns\n",
> +		fn_name, tests, errors, ktime_get_ns() - start_time);
> +	return errors;
> +}
> +
> +static int __init test_init(void)
> +{
> +	pr_info("Starting mul_u64_u64_div_u64() test\n");
> +	if (test_run(0, "mul_u64_u64_div_u64"))
> +		return -EINVAL;
> +	if (test_run(1, "test_mul_u64_u64_div_u64"))
> +		return -EINVAL;
> +	return 0;
>  }
>  
>  static void __exit test_exit(void)
>  {
>  }
>  
> +/* Compile the generic mul_u64_add_u64_div_u64() code */
> +#define div64_u64 div64_u64
> +#define div64_s64 div64_s64
> +#define iter_div_u64_rem iter_div_u64_rem
> +
> +#undef mul_u64_add_u64_div_u64
> +#define mul_u64_add_u64_div_u64 test_mul_u64_add_u64_div_u64
> +#define test_mul_u64_add_u64_div_u64 test_mul_u64_add_u64_div_u64
> +
> +#include "div64.c"
> +
>  module_init(test_init);
>  module_exit(test_exit);
>  
> -- 
> 2.39.5
> 
> 
