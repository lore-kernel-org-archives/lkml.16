Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76C840C03
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745170943; cv=none; b=raiBh94ioRG7+MajApbpgDGInh3khei31gcvadVCzVcyFtTXfT7U+zPw9o4+t6f4ZWKgAEJDIq7pzwhPUf1fRcyNvw0XePKfCp2zaGLbGnf3njXvLldWqp8FkxtEFgFfL81SN7lWhnvS4rltlaoPdwJzjXnp7G1jdCsSJJZHAqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745170943; c=relaxed/simple;
	bh=KaPUcl8wK8U9WuVzuT3vYzaCZJ2u4mNGxRpXGDP00Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngHPUMk++ASoScw4m+OanA4d4IqkNP0kMzSIrOh7XMaLUIWNhMJGHaU7VvByWrQNs07LB9GQ/untZ7Nm23ywpGt7KYQANcssysE+BvtCmuVPVY909avdx4D1zr3oVXW6ozHeXwWP5CA8SScAuxxTayGShHRa7NeNnAII8nzxbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrNY5i3N; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrNY5i3N"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736e52948ebso3811676b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745170941; x=1745775741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myuVKRwCeU9ZUEKKzU/xoBVSsZcB8quoj9npxdOLf/g=;
        b=GrNY5i3NfR1uA5t/zeD360nvmezD6wlxBrUF91df6JzXBSC3LBj8lr13nm/5ck6aqw
         gXsZ1eyPNU6j72eaJgJ9dEp8WttpT7gnPa6qDO+hlBJ9+YP4MFjRkUoQ8/kN6ZrqLzjO
         qcRygwJ3gDA/GEJ2v0FllNecgRM+qggB+4CuBNju8JDGX66DwGr/6G1FLfTE26cZDQY7
         U4B2mvbPj1shscvMeS8vQQqaJD609Ap+NGX+RbRbfKionG8mmtwPoOVp+lJykiPEvxgR
         /ZazBuKHz/3G2oEMh5CwrzE4Knf3pMB34MS48e0LtiS97HIHn9M+SpxCuvuMBRAl0tTi
         NpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745170941; x=1745775741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myuVKRwCeU9ZUEKKzU/xoBVSsZcB8quoj9npxdOLf/g=;
        b=qukdY2UGt08xaJo1Appc1NEcORwUaR6KkdC8QcTin2rX2FGu3UlOiYJzl6r2TYDbSO
         Jow9ZnVsGfVjH1eKEd8/h+t3DmWW+LNgCSzKYHIYzkkF1D1zFbKz0gGoaho2LntsfUG/
         cJ4OjancsewlgfGmnFlKpNQwzMhf+YlMy444fcZhmd84cJzBrsvR0v/mm4+Y9j3be3BO
         XQUySpKyD9rQ2a0to/yHymScwp8GvACrpLLlyMdZW9OaEi0A0tXm/ZhdG1mJoqFVBxxO
         3kkY4QEFEaXpQWSEJyG52rm5ZEpUV2ymUZAaVw5NS//2G/V+fHNDNKLKNOuzz5G+ETTz
         u2JQ==
X-Gm-Message-State: AOJu0Yyo2kdq8FtzloY39+eSnVBd/4SlU3cyVZ8NEruP7R32h0O00UI5
	hUgpTy28UqQ/obJci4znN0AZEIA4RklAAIto9bSQbhquKYWzJWcD
X-Gm-Gg: ASbGnctARduihkfWIzjM2bRDxVilNUbotVctJ8qNmVA8kIkD1X1ao/9ypseVeJZS5L3
	i2FZDWpVzzeUZptu6yMNDXghr+XghYHTeR7bztbvuzRo3QQ+9pG8QckxIlpZsmreKDGs8/+uL47
	Mls4TvCNHL4igZZe9sVu7o9GTfZCqKbxr0y9YyWxcn5kiNhMfQyrIq+HXzrWH25wqlocDkTXGGT
	wPfbKMD1e5b5GHFtWNIFZHXFPJowDCg4Q8/z/VSaLdFIj4fRJogzfYdWIF3mbTAAdoh728RHWsC
	uYR/4sXPhRD3mkZxiFU8Wk5t/fT6ISoFRTYpn5bpGJGdvEymBwv4d95NCnyeFB6I
X-Google-Smtp-Source: AGHT+IGapvyA6RZML9rG6T0Qn5NdkWQXMSUWzdwI60ykn6Ibua+5OHVS9D+UlwtXsFoGTTTEoL5sTA==
X-Received: by 2002:a05:6a00:2e84:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73dc15c4883mr12201150b3a.20.1745170940903;
        Sun, 20 Apr 2025 10:42:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaaa313sm4942211b3a.122.2025.04.20.10.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:42:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 20 Apr 2025 10:42:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: cem@kernel.org
Cc: linux-kernel@vger.kernel.org, Hans.Holmberg@wdc.com,
	oe-kbuild-all@lists.linux.dev, hch@lst.de, lukas@wunner.de,
	angelogioacchino.delregno@collabora.com,
	Jonathan.Cameron@huawei.com
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
Message-ID: <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>
References: <20250419115157.567249-1-cem@kernel.org>
 <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>

On Sun, Apr 20, 2025 at 08:40:27AM -0700, Guenter Roeck wrote:
> On Sat, Apr 19, 2025 at 01:51:46PM +0200, cem@kernel.org wrote:
> > From: Carlos Maiolino <cem@kernel.org>
> > 
> > Building linux on i386 might fail if a 64bit type is passed to
> 
> i386 actually builds. Its compiler is probably able to convert
> the offending mult_frac() without helpers since the divisor is
> a constant. I see the problem with openrisc and parisc, with
> gcc 13.3.0.
> 
> > mult_fract(). To prevent the failure, use do_div() for the division
> > calculation instead of hardcoding a / b.
> > 
> > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> > ---
> > 
> > I'm sending it as a RFC because I didn't to extensive testing on this
> > patch, also I'm not sure if mult_frac() was intended to work on 32-bit
> > only types. If that's the case, perhaps, a new mult_frac64() might be a
> > better idea?!
> > 
> >  include/linux/math.h | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/linux/math.h b/include/linux/math.h
> > index 0198c92cbe3e..05ea853b75b4 100644
> > --- a/include/linux/math.h
> > +++ b/include/linux/math.h
> > @@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
> >  #undef __STRUCT_FRACT
> >  
> >  /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
> > -#define mult_frac(x, n, d)	\
> > -({				\
> > -	typeof(x) x_ = (x);	\
> > -	typeof(n) n_ = (n);	\
> > -	typeof(d) d_ = (d);	\
> > -				\
> > -	typeof(x_) q = x_ / d_;	\
> > -	typeof(x_) r = x_ % d_;	\
> > -	q * n_ + r * n_ / d_;	\
> > +#define mult_frac(x, n, d)		\
> > +({					\
> > +	typeof(x) x_ = (x);		\
> > +	typeof(n) n_ = (n);		\
> > +	typeof(d) d_ = (d);		\
> > +					\
> > +	typeof(x_) r = do_div(x_, d_);	\
> > +	r *= n_;			\
> > +	do_div(r, d_);			\
> > +	x_ * n_ + r;			\
> >  })
> >  
> 
> Unfortunately that doesn't work. I get build errors on parisc.
> 

Turns out the first parameter of do_div needs to be u64, not s64,
at least on parisc.

Guenter

> In file included from ./arch/parisc/include/generated/asm/div64.h:1,
>                  from ./include/linux/math.h:6,
>                  from ./include/linux/kernel.h:27,
>                  from ./arch/parisc/include/asm/bug.h:5,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/mm.h:6,
>                  from mm/page_alloc.c:19:
> mm/page_alloc.c: In function 'boost_watermark':
> ./include/asm-generic/div64.h:183:35: error: comparison of distinct pointer types lacks a cast [-Werror]
>   183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>       |                                   ^~
> ./include/linux/math.h:142:24: note: in expansion of macro 'do_div'
>   142 |         typeof(x_) r = do_div(x_, d_);  \
>       |                        ^~~~~~
> mm/page_alloc.c:2010:21: note: in expansion of macro 'mult_frac'
>  2010 |         max_boost = mult_frac(zone->_watermark[WMARK_HIGH],
> 
> That is just one example. It seems to affect all uses of
> mult_frac().
> 
> Guenter
