Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA87214216
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738789194; cv=none; b=IO8oHgT/irPV9ILaTMHnC2V+RWNQ6XESU7ULv5k2+lUcLu8eLKUEX1nm/mc3CvnnYbN7Gd8O3cuJgY1p4REhuZkGZv6w1OyrQMzUfub48ZM30D79J8wAgDTuWeEFOYBeN1LVEtSS4fJyW1R830imlRUNpXJKqIufXrR2LT+PKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738789194; c=relaxed/simple;
	bh=VSoBx/5sFEKL7NVF44QC8hlh7Mvs6pHrrfStbgCCnaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAyntAcMuGZUuJev+W0G5LzKi0riR4wTCZsUd0KXyncjtPTAVnOMxdY+AIStF4k289YiL0328L6HVbEJvsp+PdmQ2EoQt+YHX/MLe6UoQYeYcQiXANfDGfGBOLpJAOHaqvGhvOvSg+cv9oCYgWYfchqxifLJNdhrSkftreVlJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doL8RoHC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doL8RoHC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f1b2480a2so4817375ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738789192; x=1739393992; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UsmcomgZu5DeO40/+tZb+0wNayr53e3BIOiMSuGaUqc=;
        b=doL8RoHCMfphi3HgHaj7oL3UwQLZSwW9YrryKG6brl92cbYKmuKYEdCj1fHilQmnQ1
         enr3RBL7JaNvLB003ckoL4QCvCnYzbhrXhXq28PbMSPFzfl0qQaziV+6o1IIGh054syN
         sC6Jg/cfY3A9Pw+ser4dcfaKYk3W/Su6mCySsRjQ9Lc8T1l+09P50sZ7fW2l2Y6tZwkG
         MhjFQ+g4ayXl29Wa8yJdBkyPQtx1XRwqa3iFHntbCf4GuW6wH9xCzuuuLx3DEMEmaOFn
         0pu56Gw389m28M/tOoIqE827z53MPcLTfYFY9REvUwla+wytSkrszD6ODuW/gXg8TMiP
         wEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738789192; x=1739393992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsmcomgZu5DeO40/+tZb+0wNayr53e3BIOiMSuGaUqc=;
        b=J5S30HfTND1Vwszu1s1SBQV+nWofolhffvyxLQDutiW0jid+gCreMyUM6hdkZr9mIr
         KvJX8C5/OQY3HAuuFfN4A8m3QRiZr0JOwctBMoLe1OgZEIrVnyTeiG4dO/anaTk1G+1V
         h66MOY/HEbiyVgZ96EmX4Wkrb2Lw2ZULmsQr0dF94P6Lv2/6EEH/JUiH6q/Y2bGiNxaA
         niJRuyllfPuzM/EXxQeaNkiFa/3zaPFFW/2DjjVwkekFnoatDw0qLOMjN4ew+bSRspSc
         utnhmQ7uiZajXh9b+RWFkMkkjlF7uckUMRJKzS97Fg/c45c5v/0gp1TWwiOKcoukztPP
         heDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoHIgITokHwjHx+5UOS8fztguXj9DAZp0xreFxyRmXn36whqdqCRAFWMr+KnsFdyqcspE36sg8xzmxRBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2K6wrPXHvF1zTh3zrFz8DbZwOAzR5IPN75/DfaujBo2jjFg09
	Q7p0GksjvMQJe3AJGDrEsuB5kbMKNVVmQdnBTjL5mvkEs2Q+NECR30APmn6b
X-Gm-Gg: ASbGnct2zb/owNOKonzn9NPX5hXB9HiVGKCa/F5mFoOAJMnZHpDOhnHR2tka7UpfzdP
	5AgFeSHUpI4x0ZxiI5zWeGp3+9oX/XAUewV/RYPbM93oMdscy8SFqWigTSwhTX5otaW6F/k3DW4
	yg3ar87I0j7FQbj/xmGFn2TfVvQgc5URCMGZuhpffPS0rKgVLMKYzOq3DqXksZjmMamCrVSAVtl
	+evc85jJ771sQfjO/JwhDGKjCOx1E/QWn9xs/W+nm4bQabB+e+DYKILtPxMUSmp+QYUXdZSJX/R
	Yf1Rh+MI12RISgo=
X-Google-Smtp-Source: AGHT+IGtUcuikW/4uXj5Cc81y0AsDx/JjjVxTTkfiGsilLiCr+J0CUxqCg/3lDl846xWA2blVvw3oQ==
X-Received: by 2002:a05:6a00:4642:b0:72d:9b11:1ebb with SMTP id d2e1a72fcca58-7303511d1admr7650203b3a.8.1738789192181;
        Wed, 05 Feb 2025 12:59:52 -0800 (PST)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba2casm13413860b3a.92.2025.02.05.12.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:59:51 -0800 (PST)
Date: Wed, 5 Feb 2025 15:59:49 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] linux/bits.h: Squash unsigned comparison warning for
 GENMASK
Message-ID: <Z6PRRXgYYEoMbjsp@thinkpad>
References: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>
 <Z6KF8UBsQ4NmR9KS@thinkpad>
 <20250205170651.GA56382@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205170651.GA56382@yaz-khff2.amd.com>

On Wed, Feb 05, 2025 at 12:06:51PM -0500, Yazen Ghannam wrote:
> On Tue, Feb 04, 2025 at 04:26:20PM -0500, Yury Norov wrote:
> > On Tue, Feb 04, 2025 at 05:13:16PM +0000, Yazen Ghannam wrote:
> > > Cast inputs to 'long' to avoid the following 'type-limits' warning:
> > >   warning: comparison of unsigned expression in ‘< 0’ is always false
> > > 
> > > The 'long' type can hold +/- 2G which far exceeds valid inputs for the
> > > GENMASK helpers (current max use is 128 bits).
> > > 
> > > Idea is similar to implementation in __is_nonneg().
> > > 
> > > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > > ---
> > > Note to maintainers:
> > > I found some previous discussions on this topic in the mailing list
> > > archives. The upstream code has changed a bit since then, and this
> > > proposed solution seems fairly simple when based on the latest code.
> > > 
> > > I figured I'd look at something outside my normal focus areas. I
> > > apologize for the noise if this solution is too naive or incomplete.
> > > 
> > > Thanks!
> > 
> > Hi Yazen,
> > 
> > Wtype-limits is enabled in W=2 only, see scripts/Makefile.extrawarn.
> > We normally shouldn't see this type of warnings even when compiling
> > with W=1, at all. 
> > 
> > We have quite a lot callers in kernel already that do GENMASK(xxx, 0)
> > 
> >   yury:linux$ git grep GENMASK | grep 0\) | wc -l
> >   13788
> > 
> > And nobody complained so far. 
> 
> Right, this is with W=2.
 
> I focus mostly on x86 MCE, and I was doing some extra checking.
> 
> > 
> > Still, I tried to compile a small userspace app that calls
> > __GENMASK(10,0), and found no warnings with Wall, Wextra and
> > Wtype-limits enabled.
> 
> The warning comes from the GENMASK_INPUT_CHECK(). Using __GENMASK()
> would bypass this, correct?

Yeah.. I actually tried GENMASK(). This is my code. (I have to pull
more macros because I run it against Ubuntu 6.8.0-52-generic kernel)

  $ cat tst.c
  #include <linux/const.h>
  #include <stdio.h>
  
  #define false 0
  #define __is_constexpr(x) \
          (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
  #define const_true(x) __builtin_choose_expr(__is_constexpr(x), x, false)
  
  #define __BITS_PER_LONG (64)
  #define __GENMASK(h, l) \
          (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
           (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
  
  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
  #define GENMASK(h, l) (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
  
  int main()
  {
  	printf("%lx\n", GENMASK(10,0));
  	return 0;
  }
  $ gcc -Wall -Wextra -Wtype-limits tst.c ; ./a.out
  7ff
  $ gcc --version
  gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
  Copyright (C) 2023 Free Software Foundation, Inc.
  This is free software; see the source for copying conditions.  There is NO
  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

>> Can you share more about your compiler, compilation command and config?
> 
> Compilers with warning: GCC 13 and 14
> Compilation command:    make W=2 arch/x86/kernel/cpu/mce/
> Config:                 make defconfig (on x86_64)
> 
> I don't see the same warnings with LLVM/clang. The '-Wextra' flag does
> not include '-Wtype-limits' (at least on clang 18 and 19). But I still
> don't see the same warning when I add it.

This looks like a specific compiler issue. Nothing to fix on kernel
side, but you may want to file a bug in GCC.

Thanks,
Yury
