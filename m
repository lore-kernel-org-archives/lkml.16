Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DB26158B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299177; cv=none; b=bq+FDmwjmrrAfntNfRRrYrVt1EwuHAyGGrOX5qPSv9O6si6UzgbiVyf0FZiUWjWFiHrSYhhDWIn2hMNtoj0EN93vNBW7B7g5XdL00C/1+RxkZNsagh8MVDuoA/E4FDJ2V61TfR5B9B3lre7MS7xJXOmHF69lAtEcty9NN7jEm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299177; c=relaxed/simple;
	bh=BPbNAs4KfqcOEuk525T6R4Bh9dgRqj5V+Ix3I3yyues=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDZl3HniNbs9xqhM4+Rj06NykmHltrMVRTnpba4IM6ZqJ+B6yeVjZIOoiabXzgT5PjmfADUf8MgxtxAOhiNrfggj6O/sbU9FlrH+Jz7IZSlmbhwQ7+bc3AJwkZnUWmq2qbol1tfmwkkZsWhpwBEKOM7C7wQGloO0CT3L0H49nTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGmgSB5C; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGmgSB5C"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f8c58229f1so510167b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739299174; x=1739903974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FA/FuSfqdPppR8QhYqza1bx1UGNIteApVr7uq242neM=;
        b=GGmgSB5CJyraoCL+gffJcWu+/GZI4k56E0lhLHViOI9sNKOlJDHJJA1eRtIHqgGhCd
         YxUfTRHvIEjqWE0HUYTczS+o7MZ9vwvkxlx2QvjdHbGl0geg/JyMpHMSYiJbYVVsi+0x
         UjSzKIaUmmVx3eXY7zlKPJTbzjfzSD/3gC2SRSBMtMCOj2Cg5A+Tbz6ek234d9onBQtI
         1jlgxNa7cGVP7XAgZM4o8heX47HlVLTfno4adxe1QipHRh1zSnh1EISFgbkKQUypsr6q
         HFm+DXnqjtTs4UpW0jhl42swA8Cc0d5HeAf7sQ83djGnfUTDOyA1QEeP5JNu3LUJXAhQ
         YX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739299174; x=1739903974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA/FuSfqdPppR8QhYqza1bx1UGNIteApVr7uq242neM=;
        b=tPVjZE/8XoM/MwsHCzqnRCNlbvJhOwkjdoRK9IQ5/ol69FMHjRMeIrFQF9D7S4Yc+T
         RQ2qlfQjzEKZQXLuragWlfjJZvDKIlpNp6hYsi99JExEtaE3jlp1DWO5AGPQkwxOIdkN
         kuRoeJmfd0BUGZ8HDHw32sY05EAKrVflbWM0hf1yya8plaMpegRcd0Df6BxnyPnvrzIa
         XwrfEpntfAXzvFyg+BUpbI2hHMYIBFP1bnPp8a+M7FcA46sxyr9NSzugOQf81exG817/
         lx21yhQVWtWT49O81qBx4qv6IEWb6ibn9aeAm2aTpUwHvM5E0BivjLt+0JfaXGXsn6R5
         RNGg==
X-Forwarded-Encrypted: i=1; AJvYcCWJQmI0pGE7th06N7LoLy31tN4VO4lTX33jN2IIdKc/W4DP62WszWhEtg8sgR/W9Mf0HLymLE06yd2DoQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Tkw5NL9Nx01sIzadGzfzkXcUN1YEmNSLG6NvQIWxYxd8v8Tp
	RuAWc2ByB1V4Y4W3Eu7+qE35F4MRhIPLZWqy2sW5aZ1ZAbVEFLef
X-Gm-Gg: ASbGncvTUW67L+mEFjoh9oP4WVA2uvsP7QjQCxS1+zHR6TiD9WlfH/7YVnur+/HvBac
	VK6c9DjLJriVpWTapNxBDVeHqCWPRXIOM/L2DC83pjBwDUy4HFMU8MfKGgwiDUQsrWGf09xxw+X
	xBCuLP04n/EnAl4dkhaCQ5DUAMUISWhZpLtIPbccFwoD17Q6TaYvdh+GB96Sn6hKh5uz21E5ygf
	QrtlFekEkp6cJAL4H5PDb8ROGB5qsK8ARLc4Jp8RNGWSA9be5toe6VWUInO7ThfwwN3gHwL3Cgp
	NtFEss2i2FHpZA645ZDY+18ZXr2nRzgcXehlIUlCecBVqtmmPtI=
X-Google-Smtp-Source: AGHT+IHpdWSxYkszc1afJjN8Fxnyn3DMjzNSfRjlz2Qsyy+VLzn+ldnO7xL41LVca0BpC4fmAGfJFw==
X-Received: by 2002:a05:690c:2902:b0:6f9:c6e2:89a8 with SMTP id 00721157ae682-6fb0c461c73mr43661037b3.6.1739299174201;
        Tue, 11 Feb 2025 10:39:34 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ff6a8d8sm22443777b3.79.2025.02.11.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:39:33 -0800 (PST)
Date: Tue, 11 Feb 2025 13:39:32 -0500
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: anshuman.khandual@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] uapi: Refactor __GENMASK() for speed-up
Message-ID: <Z6uZZPpQ9YYfrL-I@thinkpad>
References: <20250211162412.477655-1-richard120310@gmail.com>
 <20250211162412.477655-2-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211162412.477655-2-richard120310@gmail.com>

On Wed, Feb 12, 2025 at 12:24:11AM +0800, I Hsin Cheng wrote:
> The calculation of "((~_UL(0)) - (_UL(1) << (l)) + 1)" is to generate a
> bitmask with "l" trailing zeroes, which is equivalent to
> "(~_UL(0) << (l))".

I used to think that GENMASK() is a compile-time macro. __GENMASK() is
not, but it has very limited usage through the kernel, all in the uapi.
 
> Refactor the calculation so the number of arithmetic instruction will be
> reduced from 3 to 1.

I'd like to look at it! Please share disassembly.

> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
> Test is done to show the speed-up we can get from reducing the number of
> instruction. The test machine runs with 6.9.0-0-generic kernel on x86_64
> architecture with processor AMD Ryzen 7 5700X3D 8-Core Processor.

So you CC arm maintainers and provide tests against x86_64. Are your
improvements consistent for arm, power and other arches?

Can you run bloat-o-meter against your change?

> The test executes in the form of kernel module.
> 
> Test result:
> [451675.644026] new __GENMASK() : 5985416
> [451675.644030] old __GENMASK() : 6006406

The difference is 0.35%? That's impressive!

Can you please run your test multiple times and print those numbers
together with confidence interval?
 
> Test script snippet:
> /* switch to __BITS_PER_LONG_LONG when testing __GENMASK_ULL() */
> \#define __GENMASK_NEW(h, l) \
>         ((~_UL(0) << (l)) & \
>          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
>
> int init_module(void)
> {
>     ktime_t start, end, total1 = 0, total2 = 0;
>     for (int k = 0; k < 100; k++) {
>         for (int i = 0; i < __BITS_PER_LONG; i++) {
>             for (int j = 0; j <= i; j++) {
>                 unsigned result1, result2;
> 
>                 start = ktime_get();
>                 result1 = __GENMASK_NEW(i, j);
>                 end = ktime_get();
>                 total1 += (end - start);

Nah, this is wrong. I feel like you measure performance of
ktime_get() rather than GENMASK().

Do it this way:

        start = ktime_get();
        for (...) {
                __always_used result = GENMASK();
        }
        time = ktime_get() - start;


> 
>                 start = ktime_get();
>                 result2 = __GENMASK(i, j);

Please test GENMASK(), not __GENMASK().

>                 end = ktime_get();
>                 total2 += (end - start);
> 
>                 if (result1 != result2) {
>                     pr_info("Wrong calculation of GENMASK_NEW()\n");
>                     return 0;
>                 }

For functional testing we have lib/test_bits.c, lib/test_bitmap.c and
others. I expect you'll run them all to check correctness. Once you do
that, you don't need to test correctness here.

>             }
>         }
>     }
> 
>     pr_info("new __GENMASK() : %lld\n", total1);
>     pr_info("old __GENMASK() : %lld\n", total2);
> 
>     return 0;
> }

Please incorporate this in one of existing tests and prepend the
series with it. That way you'll let the others to run before/after for
your series.

> ---
>  include/uapi/linux/bits.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/bits.h b/include/uapi/linux/bits.h
> index 5ee30f882736..8fc7fea65288 100644
> --- a/include/uapi/linux/bits.h
> +++ b/include/uapi/linux/bits.h
> @@ -5,7 +5,7 @@
>  #define _UAPI_LINUX_BITS_H
>  
>  #define __GENMASK(h, l) \
> -        (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
> +	((~_UL(0) << (l)) & \
>           (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))

Now it would fit a single line, right?

If it works, this is a nice simplification, even though it's only a
compile time thing.

Please address all the comments above and run low-level tests I
mentioned above, so that we'll make sure it has no side effects.

Thanks,
Yury

>  
>  #define __GENMASK_ULL(h, l) \
> -- 
> 2.43.0
