Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D01E50B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747710474; cv=none; b=b5bLYAK7y1zWTb86lt9pu+CDG3d4wMUdw0MTF/w5jiuOmTWgVvWLHZwTYXcYjjjCJLU9fpwzeM5u/On07IWwu8Nouqssw/8x7ZRzn/4LI9+WclK3RIJ6eGqjq3/wTIuNbCewMk0jnVTgS3jHVgQqLaf/1jXRCJFKz0RmRD8UZTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747710474; c=relaxed/simple;
	bh=X08IU2tmAFv6F9kyf0cCQYXDXg909Pdb0FrOb1Fz78E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JEDx5TqNwmP4JXYm0faCYrXcj97j2Ji2Eq9D7cDVqjDMgC8bD77hKPP6O04L5Nc+NcXImqtoEGLUI30Fsrw1aF+9iNEleG+63Idz+AKLBdKsbXjiBWJemkpADqsC3e7k6KDRTd5yq1CO7mbhxAiMjQ5zIXDXvFDSI4+UaYj5/rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oT0P7PvZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oT0P7PvZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4766631a6a4so54614201cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747710470; x=1748315270; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ikgx8W6CLtVdUJ2TWvsSUDB7GLAYTbQGEHc1xWeF+s=;
        b=oT0P7PvZs7Q7cWDkxmmMY4Ryu4iJxVaR5PlEigs0S6Ei57sbRkgGXMD53diN8u7s4c
         f7RUnJYJnTzkkSgShom5mt8LXoEQGM7aJ6mnsRBDlxgB822kIy1D9ATvwUCBXLKYald4
         NTh5XA6wz+c4d7eyOj+/n9d8yuk1WjauwFrCZaKQaBod2ri428XEgflBTtRjR79GQxJk
         8X4Ojhg14A2B2j9sZvTH+1nxnQrFqQeMTwS5CVKApLYLRo8v+fhztLl1xpGgwIpewMv7
         +v1cOxMQXOhN5RqYkXJF3ebplHnNl7eBNhT4BjzYmTG/GBj+eselB5PSxweoxQrj9zIx
         eNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747710470; x=1748315270;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ikgx8W6CLtVdUJ2TWvsSUDB7GLAYTbQGEHc1xWeF+s=;
        b=dpfpx37+ncJbeYy9o7cSc2RkoxygfEpeDni66aWnP31Q6nD1O9txcmIDulu0SRj7nX
         A2MR+W62f40vfjEi7ymSeHIdGmSJhEwESXMQ7fhyqlhumk6Wxv8eWulxNWo2gmuAmVSm
         QFfkRpTCw5XTsCCAxdQW2+S5Fh0RkWYwg0tcfhMpsd1cy/vEufCexToPn1lthSjtf+tJ
         FCiWxh7LHkVn3yhp6ntzvVDFf31SovrbY9uzw1WFHzloOj3rfsC3VOKCIMpjIwW9G+9D
         oYh8MYLscuT4ICFGd8fijWwhvZU6HjtQMtt6m/mixj2TCLFTsihNHcNPc8SSrHxdYWFY
         4aLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnijmrBk5OE4lwREibVbd8//dR8Zh3cyt+qCzEG2LIukiHIOBJDHjrIVSX0njeFdPaTN1DOhhDNd2N+yE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXuOk1v1LVOrTRyZJFi7OcfE4KRbJPSKD9inujAgQ2G3agc0T
	4iIYHIc6a5PFMzY0Y4tA3w4codpygSEeZeadcsdvURO/ojKW6q5beBXotf8d6jNlSls=
X-Gm-Gg: ASbGncuWy5JFFVKaQ4pGbdUauvWylIwy5rfmlnsJbJ63Sj9itiXTJIfG3Ha7S8dqWQc
	IZtKPlemLVJzak6SKGjHvr33c/St3Q38XdkNXBY+KCgFrcz9jTK5rearEmLLrOSkdqDMZMPD9Ft
	FcyTncyLvfHToyjZHeAZXOVtdBNKsa+UbsgGgJmnJPsypPy/ufYlCDUu7831Su8uOoYq8jn4+LR
	3NlZhigf/9+XIyabNTsU6GTM6rk9SnTAN5uj6R23opCZbrXFoDgvmzsnIELaFNg0/2pb5ouIAq5
	L5fmnfWgX4U7GAYLRB67Ggp5O51L1opuNS2ADbfqM2QVeWp8/+r2GcoQgXD1D9OeBSmoaritcOe
	E86ZkS/u9gj0hNw==
X-Google-Smtp-Source: AGHT+IFMfA/H6Yy96PUhnFv27kUzNW2THQiGf+tz6RG9OI0U//WemUWxmQHL0ZlswOBYeXQg7wP84w==
X-Received: by 2002:ac8:6f10:0:b0:477:6eca:b40c with SMTP id d75a77b69052e-494ae326c18mr281598441cf.1.1747710470106;
        Mon, 19 May 2025 20:07:50 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494b0afca5asm61617611cf.61.2025.05.19.20.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 20:07:49 -0700 (PDT)
Date: Mon, 19 May 2025 23:07:47 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 4/4] lib: Add tests for
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250518133848.5811-5-david.laight.linux@gmail.com>
Message-ID: <8q3qs864-0oo6-1oon-r839-o4q0p10p9156@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-5-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 May 2025, David Laight wrote:

> Replicate the existing mul_u64_u64_div_u64() test cases with round up.
> Update the shell script that verifies the table, remove the comment
> markers so that it can be directly pasted into a shell.
> 
> It any tests fail then fail the module load with -EINVAL.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> 
> Changes for v2 (was patch 1/3):
> - Include the total number of tests in the final pr_info().
> 
>  lib/math/test_mul_u64_u64_div_u64.c | 116 +++++++++++++++++-----------
>  1 file changed, 70 insertions(+), 46 deletions(-)
> 
> diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
> index 58d058de4e73..383b0dfc8023 100644
> --- a/lib/math/test_mul_u64_u64_div_u64.c
> +++ b/lib/math/test_mul_u64_u64_div_u64.c
> @@ -10,61 +10,73 @@
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
> +	int tests = 0;
>  	int i;
>  
>  	pr_info("Starting mul_u64_u64_div_u64() test\n");
> @@ -75,16 +87,28 @@ static int __init test_init(void)
>  		u64 c = test_values[i].c;
>  		u64 expected_result = test_values[i].result;
>  		u64 result = mul_u64_u64_div_u64(a, b, c);
> +		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, c);
> +
> +		tests += 2;
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
