Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966013E02A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738306457; cv=none; b=fcf/fvIDpdgdrfbcYzN2qLIJf8z8z6ZCrcm/HRVVPCovyS86751YzGR5WKE2VRGI5YXut6I7Vnmm9E6lnUIqctTUbo8mmBjmeqoChOGzMruhUDIWro+LoszOYKCOmL+zy/htuTLzweTXW3cB/Y3W7BGb9gFcxUwo3xUUOcdYwsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738306457; c=relaxed/simple;
	bh=wPPZdwcTNReY/45pINziN8cWtHxbCtGIYeZW3L13D2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHo+m9pLVp2OmHekscLG31FD4eTnvEFBzcIo55H64CfNu1MtDQBFPYjDvCxDHf0z2PPfeRHDaO7uORnkgWyMRpxyL9lo7y2dHyh4Def3E5oHdBec+a/XSjMZveYEitEukRbt19quDpy04R69meXwMt6zQlnYPOMR9GRYduZazDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pTT0Hcmn; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pTT0Hcmn"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2efb17478adso2757234a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738306454; x=1738911254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjk/Bm1nilxEN/HqMvYtrvEtTOGs2l5rMV27l42M1Jg=;
        b=pTT0Hcmny+wYvuaAFQjccuk+VdhUR20p9P/Tx4DR2e/J1rsXy6cJMAxNhGuwD/zNqj
         sx3HAKt/VYY7NE2SljQ2D1Wl51MmcdXa6DJ9fJAU0JtyoQRJv9SIv/eE3DbJ5vGEmx8a
         s0x9YPhczIqhDWJJFdFXX1bZIV+/pYRPGQiMrDeHddA6ZyDY9mPyCKRvtd0IY0amzgaX
         6JBWeB998l4jpxM4MQc7e8JOP5kOyYZsXWjElg53WnNYtFzqtdCxGP78ijNUZspx0Wpy
         JqmM5Nq6R/X2+p28bJqSl6LpgBur4O+EnqI2s5r//IeFtl+0L2KnbY/u1XRPIR396sVd
         Ya6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738306454; x=1738911254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjk/Bm1nilxEN/HqMvYtrvEtTOGs2l5rMV27l42M1Jg=;
        b=lPNWE4ASuqqjx01DhtrzuUxKG8dUvRNuQIkTwdHz3rJ+uYODP3Axg+D8xxWTUH6YwX
         2Pie4IETYkYEq4eLzFfw1nFWTSEgga7Ya12HdeKRvS12y4vjDO04f/xXQNquHRf6E9va
         SWu5tq1ZLxTDAQ+tBkGF3sDWkfC0f+n0HjnAx1wIhORtjGa81AWGVMZvhuec8eAdF5jY
         fLrmItxbDRROvTuJBqfhtMFJNjdm1jXeVM3XM3uGIfIwuzW5ukglm/6uLBdRlbeQLzNg
         Yl2+ZqqvZ3Aud/L55TeTCRACrPEDHrg5E3v7/7qur9WceExu6HZqvTlgU660gTKJrFLD
         JOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX/wXroDjmOPH4NPNHtj7qpnbfafIlsqGl3eSoyxhxztsgy0+9XyChKY+Bga/W//Tj4QQRdkckqjDfaRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Cpl8ni49Kicdqa1YTgGL2eBml6xhE0SNm6kFnAc/aXIXPO6p
	UmQgEUvkYlHfuSV/YQSC9QMm4AcPfu2TcCUxTcz88oZ5XlssF5D7kB/tPLvnuPs=
X-Gm-Gg: ASbGncvWCkwBmzEAkDEWttCuiqn/eYM5TdVgw4wI/S/JGm47ypLpGnXDayRvxDGAlSp
	sbRz7YAiXtOxt3Qgv+MYOmF1Knt1kpTk+3Or8CFYVuxMpJHEQoYdrOFeYzIehlgMHKVQz+VYWw9
	AAi0JXXdRYHifLVdQQidul0YQ3Zr44elZPPo+6ep9nnQzPkTfFjUx4tcXSwzsmL30OFSR10RUa9
	lvzYbOjoq+SKE5EJILGI2lYNRBQse0iV5SMVtvAIgK0jrFT3dQuJI60Tc0CdoNec6xZrrhElciP
	z5bqNVrcTQT9GOIZLxFSUsyM7bJN461ciZi9JgEKCfdwLbXBTw==
X-Google-Smtp-Source: AGHT+IEz7rjrhwL3HJk43f36FIy7rrYdmVDDgayhVQoH4Dh/eG3AVR0uPbtT1vdB4HpALYHMe7rawg==
X-Received: by 2002:a17:90b:5408:b0:2f6:d266:f45c with SMTP id 98e67ed59e1d1-2f83abb34e6mr16241576a91.2.1738306453920;
        Thu, 30 Jan 2025 22:54:13 -0800 (PST)
Received: from ghost (c-24-56-227-58.customer.broadstripe.net. [24.56.227.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf9497dsm5104201a91.35.2025.01.30.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:54:13 -0800 (PST)
Date: Thu, 30 Jan 2025 22:54:11 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <Z5xzkwwZAWRRLCdj@ghost>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131035245.GA47826@ax162>

On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
> On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > On riscv, kernel modules end up with a significant number of local
> > symbols. This becomes apparent when compiling modules with debug symbols
> > enabled. Using amdgpu.ko as an example of a large module, on riscv the
> > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> > (--strip-debug), and 20MB (--strip-unneeded).
> > 
> > Use --strip-unneeded instead of --strip-debug to strip modules so
> > decrease the size of the resulting modules. This is particularly
> > relevant for riscv, but also marginally aids other architectures.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> Is there any sort of regression risk with this patch? If so, another
> option may be to give another level to INSTALL_MOD_STRIP like 2 so that
> INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
> opt into this option. No strong opinion because I am not sure but was
> not sure if it was considered.

I do not believe this would cause regressions. The description on gnu
strip is:

"Remove all symbols that are not needed for relocation processing in
addition to debugging symbols and sections stripped by --strip-debug."

The description on llvm-strip is:

"Remove from the output all local or undefined symbols that are not
required by relocations. Also remove all debug sections."

gnu strip --strip-unneeded strips slightly more aggressively but it does
not appear this causes any issues.

> 
> Regardless:
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

- Charlie

>
> > ---
> >  scripts/Makefile.modinst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e787b219f752570642 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -80,7 +80,7 @@ quiet_cmd_install = INSTALL $@
> >  ifdef INSTALL_MOD_STRIP
> >  
> >  ifeq ($(INSTALL_MOD_STRIP),1)
> > -strip-option := --strip-debug
> > +strip-option := --strip-unneeded
> >  else
> >  strip-option := $(INSTALL_MOD_STRIP)
> >  endif
> > 
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250122-strip_unneeded-cab729310056
> > -- 
> > - Charlie
> > 
