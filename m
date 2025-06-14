Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441B03C17
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914401; cv=none; b=CLjnKpSwFDOkhGpp7n2ILJaxo+KkaEJfeWLcuYEcapWEcxhCj/HX38xSu8yITXGjenYh68iZwap978Q0G+1Je6kMk77thYi8MImtqESYvVAW/E3rpAbfk1oJ/rpcDBMHKMK3QSb9pdy8iGuxJrF+NroznMB5Tiy7Q7KJ2f5KMUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914401; c=relaxed/simple;
	bh=7NFBih6V+fdjUHRCANqdpBZz8Jzsq05YfXh3IRT/da8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qWxNFQwOzSEe+7ZWcXHKKf5NAW1ui9nt5KHSqxBhjT0O6R5nEqeQ+pXz7g02BxJw1tHkGUa8Z8FbNh5dqH5vq5EkTjeSnbtZjW8CiHQIET/bMVEAH5cIj9DpA6EQ43skI4k2aU2nSey5fh97cLJbWvGutMDvLmE2LroJLKdXswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WGlHzScn; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WGlHzScn"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d09a17d2f7so280334585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749914396; x=1750519196; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDOjRRaSfUozlk8e5FSsJLZB+btk9Q4No6daL5W2j2g=;
        b=WGlHzScnnDfdB4jEC/fCe8MGazQAiND70ueArE1TGrLUa3GbJKBuaVGGPqqD2yP5kp
         Ajc3PoRbV3GyaWscDPJSUOXpGyr7E2lRG+/t8EIdVjkpvFr1O0dcrho71agqnBuH/S4C
         16cacVIJC6DgWBjxLAKTeOTLZTFfGHjMduMMGI4YYoqFjngIDYp5GixtTL0lunPJf4vZ
         /fTvloZVFPu7OUxPTxkWBke9EKrSz7vu1HA8cKPoYSNLQ0+yJGCfKkyhddG5pymRkWot
         njdJ7eU13EEE0r+Z4UsLzHo8+symKmzJ3Few+b0oRrkVEawYrXWdK+5MpvpMDpEKf4FQ
         XzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749914396; x=1750519196;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDOjRRaSfUozlk8e5FSsJLZB+btk9Q4No6daL5W2j2g=;
        b=mNPe9Kif/f+YLL3htBIC/kiOpDNjVMxELcGFV7DZgRgtxCHUTL6z8iTJPkqeALPz39
         +Lp8KQ+8oU5AiOon0VfoW3FIXST/Z2hhNRd5yddZ/XtzEdUD/ZoiLoTUo7cePVOSFNnQ
         eSgsotfBWGEkl28JowBNS8XUkGuGIfpDTHn1ejaF08Rb3rvHLCAGGjG1wcG+gUAlsBuh
         e/0W0Rn0a4O3MpyNExasJg6AU1ktgF/qjURdpqvmGjVOz9/Q5KJU5Chqik2XpcQLjfaF
         d14junTdd0i+nBmNrUihids+QLG1tWrUB6eR3oft2Ym6GaSb8w24E6estbJlCB8eGMpp
         jfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJWRieNVzXMrPfEJIV2rW+fXyJALVgnj4YbgLenWpP4ufmE0kFByV7Z/zXG9WlMgmALq7SebQH+5CiO1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZr1OkfJm3DugdX7RrmsCv5K//PZnjN5yShLIpF0FHiVOQONJa
	n39L2eJua5fvvp3SUdnzsN8Omu9X8rarggGjX8IYkhV3hnbeJhqFH48DLuSlqjPv4so=
X-Gm-Gg: ASbGnctacp2jMLkJyinV1TBI6Ok6dhmh9U3mnWDG9S2CSWMqDQO6KV6IBASNaIG8wm7
	WXcbNUjT+aVOnW+tdEXmkKlDsfzc1i6uJHhi6juwbNM2go0uAQKaoRhHBWNBOLUJfE7i7K+l1tb
	qdJuMxKX5s8IoEes0yo+6ljODnFwWzkqcq2PTYksAQIer/9zTqQkquOBBG6y6kwOoOIIROCeGeI
	46z2jMpcjpchGkLit4phGGPJPL/cyZnI0ofAX9H91wWthY95+rcX3fZZ8zYpmpMGARYN8tgXS2N
	83mGGF3kTSGj5WJzGTFLFvE1DrgQb1b0loUBSCxh7iol4T0KrZJtiD/NWqtZHwRihgGtlXM0fJb
	W/EPBT2ctxjyh7hQ+ixboc5qY1w==
X-Google-Smtp-Source: AGHT+IE8b1NpYbPNj6xQ7SELp33MUpxEFdWmv/s2aaZDsF3tElDXCB7EeZI53N+Odj2EB4BE9y1BIQ==
X-Received: by 2002:a05:620a:199f:b0:7ce:be04:f838 with SMTP id af79cd13be357-7d3c6c1ab19mr437739785a.18.1749914395825;
        Sat, 14 Jun 2025 08:19:55 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e01d91sm303240085a.30.2025.06.14.08.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:19:55 -0700 (PDT)
Date: Sat, 14 Jun 2025 11:19:54 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 05/10] lib: Add tests for
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250614095346.69130-6-david.laight.linux@gmail.com>
Message-ID: <3260q202-3085-527o-q41n-7q6oo3qpos1r@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-6-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> Replicate the existing mul_u64_u64_div_u64() test cases with round up.
> Update the shell script that verifies the table, remove the comment
> markers so that it can be directly pasted into a shell.
> 
> Rename the divisor from 'c' to 'd' to match mul_u64_add_u64_div_u64().
> 
> It any tests fail then fail the module load with -EINVAL.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> 
> Changes for v3:
> - Rename 'c' to 'd' to match mul_u64_add_u64_div_u64()
> 
>  lib/math/test_mul_u64_u64_div_u64.c | 122 +++++++++++++++++-----------
>  1 file changed, 73 insertions(+), 49 deletions(-)
> 
> diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
> index 58d058de4e73..ea5b703cccff 100644
> --- a/lib/math/test_mul_u64_u64_div_u64.c
> +++ b/lib/math/test_mul_u64_u64_div_u64.c
> @@ -10,61 +10,73 @@
>  #include <linux/printk.h>
>  #include <linux/math64.h>
>  
> -typedef struct { u64 a; u64 b; u64 c; u64 result; } test_params;
> +typedef struct { u64 a; u64 b; u64 d; u64 result; uint round_up;} test_params;
>  
>  static test_params test_values[] = {
>  /* this contains many edge values followed by a couple random values */
> -{                0xb,                0x7,                0x3,               0x19 },
> -{         0xffff0000,         0xffff0000,                0xf, 0x1110eeef00000000 },
> -{         0xffffffff,         0xffffffff,                0x1, 0xfffffffe00000001 },
> -{         0xffffffff,         0xffffffff,                0x2, 0x7fffffff00000000 },
> -{        0x1ffffffff,         0xffffffff,                0x2, 0xfffffffe80000000 },
> -{        0x1ffffffff,         0xffffffff,                0x3, 0xaaaaaaa9aaaaaaab },
> -{        0x1ffffffff,        0x1ffffffff,                0x4, 0xffffffff00000000 },
> -{ 0xffff000000000000, 0xffff000000000000, 0xffff000000000001, 0xfffeffffffffffff },
> -{ 0x3333333333333333, 0x3333333333333333, 0x5555555555555555, 0x1eb851eb851eb851 },
> -{ 0x7fffffffffffffff,                0x2,                0x3, 0x5555555555555554 },
> -{ 0xffffffffffffffff,                0x2, 0x8000000000000000,                0x3 },
> -{ 0xffffffffffffffff,                0x2, 0xc000000000000000,                0x2 },
> -{ 0xffffffffffffffff, 0x4000000000000004, 0x8000000000000000, 0x8000000000000007 },
> -{ 0xffffffffffffffff, 0x4000000000000001, 0x8000000000000000, 0x8000000000000001 },
> -{ 0xffffffffffffffff, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000001 },
> -{ 0xfffffffffffffffe, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000000 },
> -{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffe, 0x8000000000000001 },
> -{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffd, 0x8000000000000002 },
> -{ 0x7fffffffffffffff, 0xffffffffffffffff, 0xc000000000000000, 0xaaaaaaaaaaaaaaa8 },
> -{ 0xffffffffffffffff, 0x7fffffffffffffff, 0xa000000000000000, 0xccccccccccccccca },
> -{ 0xffffffffffffffff, 0x7fffffffffffffff, 0x9000000000000000, 0xe38e38e38e38e38b },
> -{ 0x7fffffffffffffff, 0x7fffffffffffffff, 0x5000000000000000, 0xccccccccccccccc9 },
> -{ 0xffffffffffffffff, 0xfffffffffffffffe, 0xffffffffffffffff, 0xfffffffffffffffe },
> -{ 0xe6102d256d7ea3ae, 0x70a77d0be4c31201, 0xd63ec35ab3220357, 0x78f8bf8cc86c6e18 },
> -{ 0xf53bae05cb86c6e1, 0x3847b32d2f8d32e0, 0xcfd4f55a647f403c, 0x42687f79d8998d35 },
> -{ 0x9951c5498f941092, 0x1f8c8bfdf287a251, 0xa3c8dc5f81ea3fe2, 0x1d887cb25900091f },
> -{ 0x374fee9daa1bb2bb, 0x0d0bfbff7b8ae3ef, 0xc169337bd42d5179, 0x03bb2dbaffcbb961 },
> -{ 0xeac0d03ac10eeaf0, 0x89be05dfa162ed9b, 0x92bb1679a41f0e4b, 0xdc5f5cc9e270d216 },
> +{                0xb,                0x7,                0x3,               0x19, 1 },
> +{         0xffff0000,         0xffff0000,                0xf, 0x1110eeef00000000, 0 },
> +{         0xffffffff,         0xffffffff,                0x1, 0xfffffffe00000001, 0 },
> +{         0xffffffff,         0xffffffff,                0x2, 0x7fffffff00000000, 1 },
> +{        0x1ffffffff,         0xffffffff,                0x2, 0xfffffffe80000000, 1 },
> +{        0x1ffffffff,         0xffffffff,                0x3, 0xaaaaaaa9aaaaaaab, 0 },
> +{        0x1ffffffff,        0x1ffffffff,                0x4, 0xffffffff00000000, 1 },
> +{ 0xffff000000000000, 0xffff000000000000, 0xffff000000000001, 0xfffeffffffffffff, 1 },
> +{ 0x3333333333333333, 0x3333333333333333, 0x5555555555555555, 0x1eb851eb851eb851, 1 },
> +{ 0x7fffffffffffffff,                0x2,                0x3, 0x5555555555555554, 1 },
> +{ 0xffffffffffffffff,                0x2, 0x8000000000000000,                0x3, 1 },
> +{ 0xffffffffffffffff,                0x2, 0xc000000000000000,                0x2, 1 },
> +{ 0xffffffffffffffff, 0x4000000000000004, 0x8000000000000000, 0x8000000000000007, 1 },
> +{ 0xffffffffffffffff, 0x4000000000000001, 0x8000000000000000, 0x8000000000000001, 1 },
> +{ 0xffffffffffffffff, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000001, 0 },
> +{ 0xfffffffffffffffe, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000000, 1 },
> +{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffe, 0x8000000000000001, 1 },
> +{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffd, 0x8000000000000002, 1 },
> +{ 0x7fffffffffffffff, 0xffffffffffffffff, 0xc000000000000000, 0xaaaaaaaaaaaaaaa8, 1 },
> +{ 0xffffffffffffffff, 0x7fffffffffffffff, 0xa000000000000000, 0xccccccccccccccca, 1 },
> +{ 0xffffffffffffffff, 0x7fffffffffffffff, 0x9000000000000000, 0xe38e38e38e38e38b, 1 },
> +{ 0x7fffffffffffffff, 0x7fffffffffffffff, 0x5000000000000000, 0xccccccccccccccc9, 1 },
> +{ 0xffffffffffffffff, 0xfffffffffffffffe, 0xffffffffffffffff, 0xfffffffffffffffe, 0 },
> +{ 0xe6102d256d7ea3ae, 0x70a77d0be4c31201, 0xd63ec35ab3220357, 0x78f8bf8cc86c6e18, 1 },
> +{ 0xf53bae05cb86c6e1, 0x3847b32d2f8d32e0, 0xcfd4f55a647f403c, 0x42687f79d8998d35, 1 },
> +{ 0x9951c5498f941092, 0x1f8c8bfdf287a251, 0xa3c8dc5f81ea3fe2, 0x1d887cb25900091f, 1 },
> +{ 0x374fee9daa1bb2bb, 0x0d0bfbff7b8ae3ef, 0xc169337bd42d5179, 0x03bb2dbaffcbb961, 1 },
> +{ 0xeac0d03ac10eeaf0, 0x89be05dfa162ed9b, 0x92bb1679a41f0e4b, 0xdc5f5cc9e270d216, 1 },
>  };
>  
>  /*
>   * The above table can be verified with the following shell script:
> - *
> - * #!/bin/sh
> - * sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4/p' \
> - *     lib/math/test_mul_u64_u64_div_u64.c |
> - * while read a b c r; do
> - *   expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $c | bc )
> - *   given=$( printf "%X\n" $r )
> - *   if [ "$expected" = "$given" ]; then
> - *     echo "$a * $b / $c = $r OK"
> - *   else
> - *     echo "$a * $b / $c = $r is wrong" >&2
> - *     echo "should be equivalent to 0x$expected" >&2
> - *     exit 1
> - *   fi
> - * done
> +
> +#!/bin/sh
> +sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4 \5/p' \
> +    lib/math/test_mul_u64_u64_div_u64.c |
> +while read a b d r d; do
> +  expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $d | bc )
> +  given=$( printf "%X\n" $r )
> +  if [ "$expected" = "$given" ]; then
> +    echo "$a * $b  / $d = $r OK"
> +  else
> +    echo "$a * $b  / $d = $r is wrong" >&2
> +    echo "should be equivalent to 0x$expected" >&2
> +    exit 1
> +  fi
> +  expected=$( printf "obase=16; ibase=16; (%X * %X + %X) / %X\n" $a $b $((d-1)) $d | bc )
> +  given=$( printf "%X\n" $((r + d)) )
> +  if [ "$expected" = "$given" ]; then
> +    echo "$a * $b +/ $d = $(printf '%#x' $((r + d))) OK"
> +  else
> +    echo "$a * $b +/ $d = $(printf '%#x' $((r + d))) is wrong" >&2
> +    echo "should be equivalent to 0x$expected" >&2
> +    exit 1
> +  fi
> +done
> +
>   */
>  
>  static int __init test_init(void)
>  {
> +	int errors = 0;
> +	int tests = 0;
>  	int i;
>  
>  	pr_info("Starting mul_u64_u64_div_u64() test\n");
> @@ -72,19 +84,31 @@ static int __init test_init(void)
>  	for (i = 0; i < ARRAY_SIZE(test_values); i++) {
>  		u64 a = test_values[i].a;
>  		u64 b = test_values[i].b;
> -		u64 c = test_values[i].c;
> +		u64 d = test_values[i].d;
>  		u64 expected_result = test_values[i].result;
> -		u64 result = mul_u64_u64_div_u64(a, b, c);
> +		u64 result = mul_u64_u64_div_u64(a, b, d);
> +		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, d);
> +
> +		tests += 2;
>  
>  		if (result != expected_result) {
> -			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, c);
> +			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, d);
>  			pr_err("ERROR: expected result: %016llx\n", expected_result);
>  			pr_err("ERROR: obtained result: %016llx\n", result);
> +			errors++;
> +		}
> +		expected_result += test_values[i].round_up;
> +		if (result_up != expected_result) {
> +			pr_err("ERROR: 0x%016llx * 0x%016llx +/ 0x%016llx\n", a, b, d);
> +			pr_err("ERROR: expected result: %016llx\n", expected_result);
> +			pr_err("ERROR: obtained result: %016llx\n", result_up);
> +			errors++;
>  		}
>  	}
>  
> -	pr_info("Completed mul_u64_u64_div_u64() test\n");
> -	return 0;
> +	pr_info("Completed mul_u64_u64_div_u64() test, %d tests, %d errors\n",
> +		tests, errors);
> +	return errors ? -EINVAL : 0;
>  }
>  
>  static void __exit test_exit(void)
> -- 
> 2.39.5
> 
> 
