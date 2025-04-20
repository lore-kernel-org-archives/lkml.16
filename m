Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA41E9B36
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745163631; cv=none; b=WuEhos8Q+pUQMB8OKNB884rdxNMbQoj0k3Pod8cBiI0w/Xlk0HYHfRFS+XC+FYzgiKNxt4QQd+mAgygXldkMqekeH+aTYI8H1vkkITnSVGPShqrcXnFRa17HZQTEIU9G7iLSOQV/RwH2NdIr1Ll83ZNC58IXgz8jGmBgXW/YZpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745163631; c=relaxed/simple;
	bh=k7aGFszF0R06YFKqwdPb+3xPYKPQa0hDh8+Ez5AGA4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYrv+Nw7lqRkmlqgB7sBYN9p62L7arX3OrodlsH+2bFrwI9wy16RmS190Jqb8asfedMUbwBeYrJF+tutdriP2L2jFyjunHRERp4gqh+hQeRW2a3dOTc9fLceGeXoEf6sdvpleyzDwQmkjmSPdkfJ5qlAc8xvhCOKbnbfGYfgAos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBcUVIVv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBcUVIVv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736e52948ebso3754757b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745163627; x=1745768427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBoB8+l6ww6DhdyJSg6aHMybm/qJjBC0A5J8o7rOW4k=;
        b=MBcUVIVvvc+lWA4XBstGlkQmmgo1JaBf3c+13yGluU6tte9C6l/O9nCHXvuNPSeFpc
         NmpEzvE01h8SqpzfdU/gok559kz4HMm8l3tN6qKwmAcDvwVnAy4VW7J65HtkvPOyHLJ+
         gd+LVsXVGS53FQKEd52NJFXLZv/8vlf40+iVPb/bmEp23JUjXBBp8xg2uwTwrqlV3bdD
         lX3Ytw/5EN2gk6yldLuqZRUruxpBLnB7d7x1eFaPG5UtDsBkZVvfi2rpSUWWpDN6/veQ
         LvvH6SqreZ3xlibrEiLrHKBBcsaoXLlwHAik3xd/KyeFvJTQQEJHsB/IACu62qYRGC0K
         LNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745163627; x=1745768427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBoB8+l6ww6DhdyJSg6aHMybm/qJjBC0A5J8o7rOW4k=;
        b=H2pfYy/RSuiiFJf+cxdD464cYOclOIMfsQWc5ftsOQcvfG/1hJpUXcFGXCyc+CYCW6
         yImsHAjKFdg2XYVu8IGgpd771CoY6mi9RY9wMIDYDVUAuxPGAfT4BIn72+BdplEHtUks
         Ow+9VSbo+KnMOOrumOms6I5HbJl6ov1l1/MmMy4t2L+Kb4pVSNgKYRsGeSkoKO175Yh1
         uPhkN2Ibay3ubMM96LDIFdnV6ebmIvDsnpF7GwMSi3tgKhjZ7xRGGMgbEg+RdMAhHGOf
         yKNTlVrHBkuY9XEC0+VWR/kditEzcvB4H0ZYiMB8f1GdY1vKLsn8b1iN5oLDHg/brflT
         +0kw==
X-Gm-Message-State: AOJu0YzrMN5FDBZFQQmMRg0C3bUAoHM7UymdLeKbdr7LWGhPMSaUwsYv
	am4jqYXYxxibPKnH3WnZcN76pzTNOWS/Lj1tYaIEgWgcSvAllsvA
X-Gm-Gg: ASbGnctLJLcHyp/GnaCeVtlLvTJfmezsOkXOsFnEC5Xf67+RPxxHXiM7OMPYcx702AS
	eXo7cvOBjUkuGjNyTK4XzMFROXgKi+KUZTValzhsbjOmx40oFwjN514y5TkN4pUmmUCjAwM7vQe
	lqVUb39PlqNhahiMqAUxYNIzdGUTGORimHil75NL3qMe5qp/d5yL5We4IJ7217hqnA+sTrmCsjl
	jfRtvDiGzllAYq80QckSU8WbP48zHZ0j9Q46p3Q12larbWISuzWOozXar3T9IUW9L6JkSgEeTKc
	KI6n4hUznNVR05PqQPLxeLT6vU0Lvjaz4rhiK/coGr6NzLyBb80fIg==
X-Google-Smtp-Source: AGHT+IGnXGoOkyPEZm7884fJQ3cvLvmunv/Or1iGx6Hx/rv9Umx7bcsweNEzjehiStXSZDm1LkacBQ==
X-Received: by 2002:a05:6a00:279f:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-73dc149bef9mr11164718b3a.6.1745163626891;
        Sun, 20 Apr 2025 08:40:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa59165sm5029566b3a.93.2025.04.20.08.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 08:40:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 20 Apr 2025 08:40:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: cem@kernel.org
Cc: linux-kernel@vger.kernel.org, Hans.Holmberg@wdc.com,
	oe-kbuild-all@lists.linux.dev, hch@lst.de, lukas@wunner.de,
	angelogioacchino.delregno@collabora.com,
	Jonathan.Cameron@huawei.com
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
Message-ID: <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>
References: <20250419115157.567249-1-cem@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419115157.567249-1-cem@kernel.org>

On Sat, Apr 19, 2025 at 01:51:46PM +0200, cem@kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Building linux on i386 might fail if a 64bit type is passed to

i386 actually builds. Its compiler is probably able to convert
the offending mult_frac() without helpers since the divisor is
a constant. I see the problem with openrisc and parisc, with
gcc 13.3.0.

> mult_fract(). To prevent the failure, use do_div() for the division
> calculation instead of hardcoding a / b.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> ---
> 
> I'm sending it as a RFC because I didn't to extensive testing on this
> patch, also I'm not sure if mult_frac() was intended to work on 32-bit
> only types. If that's the case, perhaps, a new mult_frac64() might be a
> better idea?!
> 
>  include/linux/math.h | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/math.h b/include/linux/math.h
> index 0198c92cbe3e..05ea853b75b4 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
>  #undef __STRUCT_FRACT
>  
>  /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
> -#define mult_frac(x, n, d)	\
> -({				\
> -	typeof(x) x_ = (x);	\
> -	typeof(n) n_ = (n);	\
> -	typeof(d) d_ = (d);	\
> -				\
> -	typeof(x_) q = x_ / d_;	\
> -	typeof(x_) r = x_ % d_;	\
> -	q * n_ + r * n_ / d_;	\
> +#define mult_frac(x, n, d)		\
> +({					\
> +	typeof(x) x_ = (x);		\
> +	typeof(n) n_ = (n);		\
> +	typeof(d) d_ = (d);		\
> +					\
> +	typeof(x_) r = do_div(x_, d_);	\
> +	r *= n_;			\
> +	do_div(r, d_);			\
> +	x_ * n_ + r;			\
>  })
>  

Unfortunately that doesn't work. I get build errors on parisc.

In file included from ./arch/parisc/include/generated/asm/div64.h:1,
                 from ./include/linux/math.h:6,
                 from ./include/linux/kernel.h:27,
                 from ./arch/parisc/include/asm/bug.h:5,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/mm.h:6,
                 from mm/page_alloc.c:19:
mm/page_alloc.c: In function 'boost_watermark':
./include/asm-generic/div64.h:183:35: error: comparison of distinct pointer types lacks a cast [-Werror]
  183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                                   ^~
./include/linux/math.h:142:24: note: in expansion of macro 'do_div'
  142 |         typeof(x_) r = do_div(x_, d_);  \
      |                        ^~~~~~
mm/page_alloc.c:2010:21: note: in expansion of macro 'mult_frac'
 2010 |         max_boost = mult_frac(zone->_watermark[WMARK_HIGH],

That is just one example. It seems to affect all uses of
mult_frac().

Guenter
