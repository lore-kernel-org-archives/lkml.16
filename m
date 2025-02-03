Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE7020DD5E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602102; cv=none; b=I0N9EwoF3Bdj9OUuHMOhH7W+QT4ws9p+E5QK16aMUSKbLDFkIwrmJsG0JcQBVetpa5H74JJknoIsYWtzQBa411tXHCNkm6XuLALqSSjDQNbwC4ObPzHPxov11uxJjkegvYJHrsusBabHBtqwCifL/6v7Yjzsi+qQthJ+4pc55Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602102; c=relaxed/simple;
	bh=vslW75JcSijFBGVzY2fq7WsihvYzuoc1s1iY7mWXoGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRLsDcA1et7Bk2HPoSYZQlWuiSTdAKAv0vtv6rEVWdZcvK6WpWlhvSsxzs4P62AnfM3vm3OLjw3vsNtOsgMlwbuaQqVaiUGa94Wk9FKPnV1M5KGqApSh45oFro4MPhnpV87QNMpdfDdb5TExX/7PtH5N5s5ESZSDNevlap7uBg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFwGcF19; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFwGcF19"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso77981745ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738602100; x=1739206900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aiu/4gR5G7Wp81OQBB+vnHCLXNeDY5L1jC3+UYSY8EI=;
        b=jFwGcF19FVyPwNrchEnU4gMMooKWnWyuFWh9dvCwkPXRZd1OtTIzYBBahBoP1wNncy
         zTF+3fjR5WzP58rGnN62/qSR8pmQi468kpdkNgXdr635bRcudhRlYiYLFhVR1Ak1qZPg
         k58suBoCMrso/KLxmvYiJfm90/RBV01dFSRplYU0ixpXgTne5nSRgeFCnfoO3GlkGaqP
         d2cgc0/6vFj1e4B1owkGumsYSOwcz/F54mLshkm048p13tgAjUdV6rhZ60VwfL1zy0JW
         LNODniA/88ehDl/jbEoAguTCk4QUFOaFFuldFKvNpwQwZJAKBT7Hev7bnnOiOWD73W7c
         SnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602100; x=1739206900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aiu/4gR5G7Wp81OQBB+vnHCLXNeDY5L1jC3+UYSY8EI=;
        b=ktkpTH9wOhjlLuBbnD9qzM2SdCSWjvZTr/VOqX18jUjOEUFUY9rMmCP3zE9yPEVJvY
         T83xzNPa68UT52E9+DeGLqzBQQl0Ylh1XegXhUkChTztU57WYUKOOzZlzFlOhk7fV20E
         tGEmhB57I+KJ85iPbrHjiOaPSXDvUU3D1wwhWogus+esQkpIUkyWT/ETXX8M1JOuFOeW
         2DM1AQrTSmq1ayEQU1xPqVHtfM8QO7/uZP6vYuYM+MN/70uU1OAuNvCVqRo4JeMQ4iGP
         L4Slz6pHXhSIhk8DP8itEsCg1Di8QWBYRbuQskyxW0RLDHL7kYFeb/fUAttK0zAXsxFu
         A1NA==
X-Gm-Message-State: AOJu0YzcEoKw5xDwxaxkxoyh89QGhB0wvallaR29Fe+HHvIR/8cys0Fz
	vFOacQ86i0rR+ShNqo1lNAu9PRU6Mn9sLg6pqUn/Y0Sbgq+6cwp/6HM8nKVG
X-Gm-Gg: ASbGnctPGmgycGJV/5IEC7t5TrHo/+68mFJRdJoxa17l+anHzeW0fFq6NllkkvlqHS9
	/UcohExAgoubrywTbyC6UFXmayqwA8geW6lK4SIAOAoXrhYt8v66yZb7wKr/r8Z0yz3VlPf8SAo
	b8XW44TzJzFFQixdYxlf5P5CnRaF1VSF9e6IQiDniErXil7TTxQE0f7CKQIIJwBX1+s8Vg54skB
	643ge01890QuAfEh7P6WL1Y2jc7iDI8GI4k19CyYkYJyTeZqs36w4IA5VhgBtoDQCamZRS3uRSh
	RCrU9haZZuElbgzvKlj69NeMperAJ7+88kGr0nw=
X-Google-Smtp-Source: AGHT+IGtbkcK6dfMD2SE1atFKl7M7fby6RjBflujy6DN9WgTKw0B7SW9RWb9AGe1smxjUEy3VGxMfg==
X-Received: by 2002:a17:902:dacc:b0:215:b9a7:5282 with SMTP id d9443c01a7336-21dd7d7a783mr354586555ad.26.1738602099940;
        Mon, 03 Feb 2025 09:01:39 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3325652sm78464735ad.256.2025.02.03.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:01:39 -0800 (PST)
Date: Mon, 3 Feb 2025 12:01:37 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, g@thinkpad
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v1 1/1] bitmap: Align documentation between
 bitmap_gather() and bitmap_scatter()
Message-ID: <Z6D2aLzVwNh-jhc6@thinkpad>
References: <20250203121919.3184930-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203121919.3184930-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Feb 03, 2025 at 02:19:19PM +0200, Andy Shevchenko wrote:
> First of all, the bitmap_scatter() mistakenly refers to itself for

It seems there's no 2nd concern. So I removed the 'First of all' part
and applied in bitmap-for-next.

Thanks,
Yury

> detailed explanation about the relationships of two. Instead of simply
> fixing this, align text in both making a cross-reference.
> 
> Fixes: de5f84338970 ("lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/bitmap.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 2026953e2c4e..595217b7a6e7 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -560,9 +560,9 @@ void bitmap_replace(unsigned long *dst,
>   *	      ...0..11...0..10
>   *	dst:  0000001100000010
>   *
> - * A relationship exists between bitmap_scatter() and bitmap_gather().
> + * A relationship exists between bitmap_scatter() and bitmap_gather(). See
> + * bitmap_gather() for the bitmap gather detailed operations. TL;DR:
>   * bitmap_gather() can be seen as the 'reverse' bitmap_scatter() operation.
> - * See bitmap_scatter() for details related to this relationship.
>   */
>  static __always_inline
>  void bitmap_scatter(unsigned long *dst, const unsigned long *src,
> @@ -608,7 +608,9 @@ void bitmap_scatter(unsigned long *dst, const unsigned long *src,
>   *	dst:  0000000000011010
>   *
>   * A relationship exists between bitmap_gather() and bitmap_scatter(). See
> - * bitmap_scatter() for the bitmap scatter detailed operations.
> + * bitmap_scatter() for the bitmap scatter detailed operations. TL;DR:
> + * bitmap_scatter() can be seen as the 'reverse' bitmap_gather() operation.
> + *
>   * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
>   * The operation bitmap_gather(result, scattered, mask, n) leads to a result
>   * equal or equivalent to src.
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
