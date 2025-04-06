Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2162E62A3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743904085; cv=none; b=FcHDdxI1aDue8I7eQz4kc6fj5EXjn3hpYYTlEitSVr0OTd6Kmwgeh2APRAiDAJo1gWiFQJR/b8PB3Ra7ThcwwoHttRufxD9WHYUYGFDT93ip8JGifRuiOMIlhaOlq3FD1HvILp9kF2Cv3C/buv24TgRWMW8DFG0gC+E1DKNLlhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743904085; c=relaxed/simple;
	bh=BnZqFzsSTUHBtktp5fLFFdp/V5nR6mFEWhd1V7ed6Os=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bBlYfGqIOgkS2RMAHA48j9CbiNJ0KAaZj+x2nG2BAyp6YIir9vj5TyfeSmtIl2Z3i6nfHslOEBGPl02kzZNaVB0sTMdCal9u0jH++toskOKtmY868uQUXxQoWvUcbqj2S2n0ua3NJR+DMNMm2AqLa6pVhkr/O5E5Nq0fFa3LJmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ugqr4gyi; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ugqr4gyi"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c592764e54so426001485a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 18:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743904081; x=1744508881; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rkbfab3JP71mT0bLEdL6IidpKI6+b/G59N9v07k4OLY=;
        b=Ugqr4gyid2Ewbv7grxVKAoP1nneYl/oKBxd617MQjDx+LxqMySq8CpdSLXfu7GAREi
         4N3gTEspHvvOeDAJlDEfs0MVZSbWYutO1YDE4Qjc7oHVU/f3WRgT9PD8ZKNrZNHU4YZI
         AFCPpuf9dgLq+Srqwg14YMaygyC8rJ/F+aXBoUnLkbt46/aqQH2Q7bFXCpaKKN0Frv0r
         RkPqT+vrggllBCzWdckiRVLdyw0df778+xaJBxmZpVVdlOrYCMkMqRC9WcTse33+QCwD
         Zs9et4ITH5uxDPQ3IwUudeco5fmWQTfxhPtudwav5CoAiv7A8X7JiGvO6NiaHTPqdxS1
         Fc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743904081; x=1744508881;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rkbfab3JP71mT0bLEdL6IidpKI6+b/G59N9v07k4OLY=;
        b=swGWSk8Uw9yKOJag0WgvO1tba8qIb3ISOk+52SBFblfSDYJ/xsA7UrgXs179rHFed4
         lXdnb/iCYwFL2Cwfeq37vFFN0oHW6y8fWsebMg3c5yYmz0wtlWOt7xlQIJUU4wtS8r5r
         rJSp2ElNWWIhs8xiL2i7Nfgipvxv9lgVSoyknP0lBgZIqmjLdcotzoecwQKvBenM12uZ
         fUe35ojDbuYNvOwxZxe4+A6slpWadov0JHvfNl1ha+6J2MaBu/Y4k2dL1OJR7O/+NZ3A
         GMcBNN+/uOod4TfGm9KKBanspgas9Jy8V8UN+TMU0p7EBTvo04XycVIzqiKVT48AFRBD
         ZnVA==
X-Forwarded-Encrypted: i=1; AJvYcCVoez6xko5l+gSHWZgavzi2U8rThOzNMlJI42+RaCpcZezUb9yP8rfq0w8IfjsvFheb3ouE3AQxpcjpO2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJA0QDG1v+5emAxNCvgLmzKUd6HIqOREEE0EtLmiocyg959Wo
	ojsG8kopxPBI86hkFL1UeD2X4mjprUzlUZrkoWElHGqnDXJmooaoMudvy2exSKI=
X-Gm-Gg: ASbGncs++TBloz0S4tQy285xGUKpEjALFRZ1V/CE0aPU6C9rdp2qDzn3R2EsR19hUtx
	rUEOaZg9EKkDY3QOZmNjh+I1O0GdGgywSNqu3CrBT5UaDnLtAHR7BxY6x9q8eNi8ImctXQxj3Rm
	GBVSaYqD7BYFQv09Vyqbi58VJzJB2RzQb6g1KO5TzgLZMJHJpVKhel1XR2YFlkJJq5v3v/jYOrU
	n5GseCdFldOMO3CDUJMym7AVVPJ7Oa8FB5xhyGmXSn7i8L1Xp1izUlduN/rZS4PehfX4rMWlA+8
	GtfDYZ37807bIhF+JVsVr6y2Mnmha2jNNPwH7mrrgVz+ji8K+C5oH8gZSQ281IgcUeIwlpRpnoE
	qpDUNFCA=
X-Google-Smtp-Source: AGHT+IFjnPR2ZKRAq4wh04nMCAuaezN4R84Vz4Xxbc9qqUTmL/kMjPVvRNvK62UJ+mw07AAg3goJhA==
X-Received: by 2002:a05:620a:192a:b0:7c5:4c49:76a6 with SMTP id af79cd13be357-7c7759eaad8mr1023671185a.8.1743904081114;
        Sat, 05 Apr 2025 18:48:01 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e735783sm419158285a.22.2025.04.05.18.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 18:48:00 -0700 (PDT)
Date: Sat, 5 Apr 2025 21:47:59 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 2/3] lib: Add tests for mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250405204530.186242-3-david.laight.linux@gmail.com>
Message-ID: <0s44no55-3361-7842-o41s-p5nr72p44n3p@onlyvoer.pbz>
References: <20250405204530.186242-1-david.laight.linux@gmail.com> <20250405204530.186242-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Apr 2025, David Laight wrote:

> Replicate the existing mul_u64_u64_div_u64() test cases with round up.
> Update the shell script that verifies the table, remove the comment
> markers so that it can be directly pasted into a shell.
> 
> It any tests fail then fail the module load with -EINVAL.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  lib/math/test_mul_u64_u64_div_u64.c | 112 ++++++++++++++++------------
>  1 file changed, 66 insertions(+), 46 deletions(-)
> 
> diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
> index 58d058de4e73..9548eb7458c7 100644
> --- a/lib/math/test_mul_u64_u64_div_u64.c
> +++ b/lib/math/test_mul_u64_u64_div_u64.c
> @@ -10,61 +10,72 @@
>  #include <linux/printk.h>
>  #include <linux/math64.h>
>  
> -typedef struct { u64 a; u64 b; u64 c; u64 result; } test_params;
> +typedef struct { u64 a; u64 b; u64 c; u64 result; uint round_up;} test_params;
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
> +while read a b c r d; do
> +  expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $c | bc )
> +  given=$( printf "%X\n" $r )
> +  if [ "$expected" = "$given" ]; then
> +    echo "$a * $b  / $c = $r OK"
> +  else
> +    echo "$a * $b  / $c = $r is wrong" >&2
> +    echo "should be equivalent to 0x$expected" >&2
> +    exit 1
> +  fi
> +  expected=$( printf "obase=16; ibase=16; (%X * %X + %X) / %X\n" $a $b $((c-1)) $c | bc )
> +  given=$( printf "%X\n" $((r + d)) )
> +  if [ "$expected" = "$given" ]; then
> +    echo "$a * $b +/ $c = $(printf '%#x' $((r + d))) OK"
> +  else
> +    echo "$a * $b +/ $c = $(printf '%#x' $((r + d))) is wrong" >&2
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
>  	int i;
>  
>  	pr_info("Starting mul_u64_u64_div_u64() test\n");
> @@ -75,16 +86,25 @@ static int __init test_init(void)
>  		u64 c = test_values[i].c;
>  		u64 expected_result = test_values[i].result;
>  		u64 result = mul_u64_u64_div_u64(a, b, c);
> +		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, c);
>  
>  		if (result != expected_result) {
>  			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, c);
>  			pr_err("ERROR: expected result: %016llx\n", expected_result);
>  			pr_err("ERROR: obtained result: %016llx\n", result);
> +			errors++;
> +		}
> +		expected_result += test_values[i].round_up;
> +		if (result_up != expected_result) {
> +			pr_err("ERROR: 0x%016llx * 0x%016llx +/ 0x%016llx\n", a, b, c);
> +			pr_err("ERROR: expected result: %016llx\n", expected_result);
> +			pr_err("ERROR: obtained result: %016llx\n", result_up);
> +			errors++;
>  		}
>  	}
>  
> -	pr_info("Completed mul_u64_u64_div_u64() test\n");
> -	return 0;
> +	pr_info("Completed mul_u64_u64_div_u64() test, %d errors\n", errors);
> +	return errors ? -EINVAL : 0;
>  }
>  
>  static void __exit test_exit(void)
> -- 
> 2.39.5
> 
> 
