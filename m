Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBF1CD1F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745463447; cv=none; b=ONYbvNTulJ4KH3TncqXnUgx0jbl8C+lgc0YZv/0Q1RPAWLRgvpDsOeuGS1nJRppJBfk6MvFpcPoSmnc/hx+THH2hNU4g68AAFGrvwmAWb2YnWw8y05vebtxzein2U/68hnwgQKGNjCgE7O4Eyl08NLj7ULF3+8TWcvyWucFEF3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745463447; c=relaxed/simple;
	bh=iYfFY3LX3VGGJrfzXL0mjgtvqfghi4OJtmrers18SMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdiWkfvwCrDEOmbWMFH3Pcma2FlgANIwMQIc7UpAdQ1Fd1b6nmYHkdimjMfolkV5xjNhkCdjfZ+a/ESLuHb6RwawTFtmnfMWwF8Nv30cAlEjWy0sLkzlOaMg5GbmDTMWWpjfNHUpxPyXTLtEiRlLl3R6BcGQgb3DBmQfqDD7KhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyZuoiDW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyZuoiDW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227a8cdd241so6132135ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745463445; x=1746068245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWmRzbYfNddyjBJLZVPENIF9TuDPr2eV0WK5hTPyUWw=;
        b=GyZuoiDWCxC8I/d0agolWXUTi1foAPFNUP3vrX6Xa+/+pQR7ZV0agnk8bWQOCg7vNv
         tFS9wd9vGtKveP4Dq1NJ+anheDXRwe2KIT2VmXLTGCfKDaQx2aElDfIhclb6i84sVF78
         FH0Xca6TyIBdk/Pcud9UpRtFMuLSAQOuqH3MNsJeGIMtw6rG1dpaX0Q7nhz77QYHt0Km
         i26OYO9tPutQfiCm2pNLv+UYyRTIPGLd8g/c6pp9jVexaxMbO0uenZtDQTXKFYjPqGJQ
         B32yzupqmQi6Iv+Tnz/dN5NmKk325BTVfNg3lTScL6SYiGSvGQZeugo4M7i50Ycs0rhn
         RSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745463445; x=1746068245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWmRzbYfNddyjBJLZVPENIF9TuDPr2eV0WK5hTPyUWw=;
        b=eWFDu5WTMm0+J48BGbD1ZUGv7YIkjHBWmb0z6bKfXFkAgCjItoZDBH63BTwWKDHzoj
         AexQM7Ftucl2J9aDoeyNnqal4fRS1M9pAaTs6XDzvUN5tiYPtfFjEjvyj2Lj5dMlIzWy
         QyO1Ii8cUY/YQ0m6zkmenxs1AmmR6+RrxKL7PC9USemo3FEGbFGp00ujUDCCioouUNK/
         CjuXdsJRvZVMAKh4zecS+t51Abip3pV36+hfTCOfKUtgnQLrBOgyEY4FDcaCzMmyGGQT
         qVdYE+mHHsaJB4IAMuy/WkWEkpua/LZfq4v/4ZCZ+r9VcLNIO9Lh1rdkynH7RzhicI6F
         60iA==
X-Forwarded-Encrypted: i=1; AJvYcCWD++gHVdSGqfUKOkJ9qoZYDMqPN0HIvkMKJRVG1NRvPIQT/T6q/vKhxYwNUlM0xHXasseoZVVDKz3+HiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYveYFB5RN1qDybYSqx1HB17WvUPMn6xg8uH6JIu8yNQzx4u5r
	IY7mvjs2RXZ3n3BrdkblsgSikT+GjAi8KsbR4ppJenq3tBC2kclt
X-Gm-Gg: ASbGncvo6Z77EZOkqvdk7NnMpjBHjuFYNUNBFCs0enGmdLGG+uVIkb+VePEiCuJaD4p
	84WxAxAGmt9fjFTeE2/jorMbqvkG+AOukhB0LTK4LnmGeT/knGXXtqkU3BBwKflb5ADEd/8lqK5
	qFUgDbVqtluMcPN4YXNXi0d6rJuoK96jaYLRJ8TBuk+0w/kjpXO+VVc/I9l2bMNo/UQyEY4SQWq
	k2QfqikXZNuFs7wszvD+FQKvFv/NtuLPKvtSQAN1ICW9/SAjo02KkdCyFqVbAfmWsT368bn7MLK
	vgeQRdRIM6nF5MN+NOcdAOYMYJuUV2WfOXrA6sMOdTdnt1ZOZdk=
X-Google-Smtp-Source: AGHT+IGWaKESnK18NLzUxZc+73taW8JAQkYYI8G9NUiDRHBigHW6w5Hh8wTVME0SWV6skLoPMmzKyA==
X-Received: by 2002:a17:903:94c:b0:223:6180:1bea with SMTP id d9443c01a7336-22db3d71fd6mr12740205ad.37.1745463445242;
        Wed, 23 Apr 2025 19:57:25 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f48a7sm228098a12.9.2025.04.23.19.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 19:57:24 -0700 (PDT)
Date: Wed, 23 Apr 2025 22:57:22 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] find: add find_first_andnot_bit()
Message-ID: <aAmokt3PBX8LzbwJ@yury>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-3-yury.norov@gmail.com>
 <062e5e61-e2c3-418e-987b-33fd9009d03f@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <062e5e61-e2c3-418e-987b-33fd9009d03f@intel.com>

On Wed, Apr 23, 2025 at 02:28:26PM -0700, Reinette Chatre wrote:
> Hi Yury,
> 
> On 4/7/25 8:38 AM, Yury Norov wrote:
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > 
> > The function helps to implement cpumask_andnot() APIs.
> > 
> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > ---
> >  include/linux/find.h | 25 +++++++++++++++++++++++++
> >  lib/find_bit.c       | 11 +++++++++++
> >  2 files changed, 36 insertions(+)
> > 
> > diff --git a/include/linux/find.h b/include/linux/find.h
> > index 68685714bc18..d1578cfb667c 100644
> > --- a/include/linux/find.h
> > +++ b/include/linux/find.h
> > @@ -29,6 +29,8 @@ unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1, const unsign
> >  					unsigned long n);
> >  extern unsigned long _find_first_and_bit(const unsigned long *addr1,
> >  					 const unsigned long *addr2, unsigned long size);
> > +unsigned long _find_first_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
> > +				 unsigned long size);
> >  unsigned long _find_first_and_and_bit(const unsigned long *addr1, const unsigned long *addr2,
> >  				      const unsigned long *addr3, unsigned long size);
> >  extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
> > @@ -347,6 +349,29 @@ unsigned long find_first_and_bit(const unsigned long *addr1,
> >  }
> >  #endif
> >  
> > +/**
> > + * find_first_andnot_bit - find the first bit set in 1st memory region and unset in 2nd
> > + * @addr1: The first address to base the search on
> > + * @addr2: The second address to base the search on
> > + * @size: The bitmap size in bits
> > + *
> > + * Returns the bit number for the matched bit
> > + * If no bits are set, returns >= @size.
> 
> Should this be "If no bits are set, returns @size." to match similar document
> snippets as well as what the code does?
> 
> I am not familiar with the customs of this area but I did notice that
> this patch triggers some checkpatch.pl warnings about alignment not
> matching open parenthesis ... but looking at the existing content of this
> file this custom does not seem to apply here.

It was a really unclever decision to make find_bit() API returning
the size exactly, because this ends up with a few extra instructions
that we can avoid. For example, in FIND_FIRST_BIT() we have to return

        min(idx * BITS_PER_LONG + __ffs(MUNGE(val)), sz);

instead of just

        idx * BITS_PER_LONG + __ffs(MUNGE(val)

Unfortunately, the existing codebase relies on this overly strict
guarantee. For the new API, I encourage people to guarantee '>= size',
not '== size'. There's no difference from practical perspective. But
if one day somebody will decide to clean this up, there will be less 
burden to rework.
