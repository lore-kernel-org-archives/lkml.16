Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A0B2040B4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822573; cv=none; b=lAMmQFM2XSQ7K3KL9ms8CR7mfqEeGMDj95K57yR+5Fd0MQtQ85ml+so6wQ83ZltXjG4Y/gVjQUrKmRji8ccOelEJhmDGXHnBg9B9X0wxREm0YuITlQPzCwHShVC8/DkPw4uH0pjIegYTdjk2LnYIJ5X1IJ29tEsIko0iONjxdTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822573; c=relaxed/simple;
	bh=QKAEVdNh2ZLF9cRG5csgCtm3LxoVaQVmghx6cKpf8Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhNXXeNKF710IMTV9EuMswAMOMvj48cO045hOexcceJxJmCIM8ncnP1uTy59Cg+j4ZBHUBzKV68VDRKmLOx8GldQesjrUgccJwl5bGJ0wT5n306jvm3cH1nPmqZxDfEr/qrcCsFmc6c+0DHNOfSOuHyM1PmWzcf5B7iSp/sRsPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coDxotNo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coDxotNo"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22438c356c8so81012075ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744822571; x=1745427371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSSNturEPdXL4hNGJwDT8d92eWp8NIZOVnl4d0urTTo=;
        b=coDxotNoigK6a2Mgqt5S8NE9o3+MR4EqFUvdBaDb4tzSpPra1Kn36lZ4uqnUMTQXXN
         3nCcu9q+NDHvkKTzFWf2P6lpgCnV7y+u7/QRaZwZoGBZlZBSoVloiP1s0Giv/KrEaoio
         7kyojzdfm8wghym3zOrP0gH+ZsGIWiEFpaLLyh+XuzAtmxP6mopenZzWf2tcBYAVqNmu
         Kt7acaG0c5nlrm5rcYUp4Z6a2TBVeyOmhEkACBuXgppLMLOdImV4bvHmVYp7zex7fDRg
         4jOOau20sw5rajpUscp35T6CarZfgc5aIs30svLSSF7qkNYq9jiwjiCuZ6J78UniBTxD
         W49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822571; x=1745427371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSSNturEPdXL4hNGJwDT8d92eWp8NIZOVnl4d0urTTo=;
        b=Qqt4r+pqV3u3TCVeaMl4x8U6LOu1vJOvfChPseOS6xY/fa6Md1+mejBVEmRkR0KVa+
         Bw8obt4NHNX2+nfo36y0pg9jdtjG/YKvFfySnOIiQGrb2RtWVrqASXwpLn6TX5DnIB7a
         DkSRds15G/YPNvRumTh5/W7ipWZYOP2c0jLswMfwK6CBh0RtHXv8gZW1EvCsqRXtaCHQ
         W2VbutJmde11UBcedJq515T9ZnN7baN2RUOQeQo0wMTXMOLUMwMBaAZutwoeW5zHy1vE
         gEuCr4bUophUjc2tF/M8Gk7LseenoOhktF+Ov/hwQ3LrIyGn8A2Xja70ScgoPEnTHpQm
         BxXg==
X-Gm-Message-State: AOJu0Yz+En5q5MbybeUmzontdePy4dM/VuV+mRvZIhSvzsZpblcQtlAB
	lcIUJMkNmxsDAxJuzyBer6lY+sHTyN0ozdNQmtXdFhpNi/RKGH6s
X-Gm-Gg: ASbGnctcKDYU15Hlt4le4XFhwy+j4wypcWMH4jH2NHUB8f0cRlfUyTGahk0jSNb60u3
	Ncz7iHv7v8dDxtzYucWtlZBAsX7zzTerrz6Bz5Vf/I5HZAwWHV1JKOddNNf2A5b2d0YddCtci6e
	iqRzMxUiOCnRibcjG/yJfv/7OB1+DnWieorIf47TW1vBEFSQn1vbMvFpEkXqTc7kvfU4gMqez5D
	knkK4UkDXvqaVAH/+dGo58GG5qVMew1Je5Y8PWvTUzSPquH6DgPF2qmz/mYZs8Rs8N8FrJJ2J06
	Pu4i3SU8ouBBZkVFgDCNtmw1uK61mazK2HCSO1RW
X-Google-Smtp-Source: AGHT+IFu6RbY1HnU0Bjykhxy7/SdzjZMhLZqA4gusZrbeMtIwxp1yn88UchTvVPL1stm0yRfRK4XyQ==
X-Received: by 2002:a17:902:f64c:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-22c359122b2mr46206575ad.25.1744822571064;
        Wed, 16 Apr 2025 09:56:11 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe8de8sm16567855ad.248.2025.04.16.09.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:56:10 -0700 (PDT)
Date: Wed, 16 Apr 2025 12:56:08 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 2/2] bitmap-str: Add missing header(s)
Message-ID: <Z__hKFYI5wowbZPx@yury>
References: <20250416063248.1864059-1-andriy.shevchenko@linux.intel.com>
 <20250416063248.1864059-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416063248.1864059-3-andriy.shevchenko@linux.intel.com>

On Wed, Apr 16, 2025 at 09:32:11AM +0300, Andy Shevchenko wrote:
> bitmap-str.h is not self-contained, it uses something that is provided
> elsewhere, add missing header(s).

Can you be more specific? Is 'something' means the __user? If so, it's
provided in linux/compiler_types.h.

Can you add the compiler error you're trying to fix, or how did you
caught it?

Thanks,
Yury
 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/bitmap-str.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/bitmap-str.h b/include/linux/bitmap-str.h
> index d758b4809a3a..53d3e1b32d3d 100644
> --- a/include/linux/bitmap-str.h
> +++ b/include/linux/bitmap-str.h
> @@ -2,6 +2,8 @@
>  #ifndef __LINUX_BITMAP_STR_H
>  #define __LINUX_BITMAP_STR_H
>  
> +#include <linux/types.h>
> +
>  int bitmap_parse_user(const char __user *ubuf, unsigned int ulen, unsigned long *dst, int nbits);
>  int bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp, int nmaskbits);
>  int bitmap_print_bitmask_to_buf(char *buf, const unsigned long *maskp, int nmaskbits,
> -- 
> 2.47.2
