Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8534CF5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565998; cv=none; b=sFgjmNMUjp/3Yx2PtiKfJ/6BgmWj21AdGIf9qbSSpu4JkXojWcFeod5ijwEs7uumH4ehZaAUPwB2fMH1OizNXIW2notIVau0+bh4+mVaJeZGle5DylfVy4WcuioqojQ5idCtou81AMOPhg62wQESNL5a2F1wSHote5DL0/zOQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565998; c=relaxed/simple;
	bh=WOBxNFfwoRaqVofbA8CFrImfGjl5LQJoK5Bx9c4gVxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee8dWtoLRA7mdAtK4Zq7xeT9RlXD/4BaZhvkUbbHrzkbf7LFi/xbwBtSLtpqHwwVbdayffmIPcCgNKM5zv0a3aSawqWQgwUSGhhNYoq/wkZDA+3qyRI5WsALpRmL/yULkAU+3l+dp2DDS3Ijw/T9NUYSUEiHWGHXBw+oOPRvl24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=G+Ng+RFl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="G+Ng+RFl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so17593995e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745565995; x=1746170795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rOWai1sdUbgwofhh5Gm/RhS+Xf+8kuHnQc4bFrAWfA=;
        b=G+Ng+RFlzYMB95D9S5v5mPE8PcsRJ+L1L53MKVN24KeRO0aiqd2jh6Bld+oP7/FTnF
         SkxdVOfCuS0AZftZ3RNo9LdO4Yt3nbRjbTHDkTEA+Yf+5ufOIkCN8NoC98ct4dlRMpX6
         FAcm9IFJHebAuAI7TC36AJWyR22iT1O2emh7tqsxGApLAPznuLaWnD9e1gy3XkVbF3QK
         h7+WTN6oqgnfLWpBmJIDkCiar93TU0TO+Ibhauzt5GbaZjzlGI9dJ0ZAq9T+Nhienavx
         kGVyJcBQB2LtVdNcJDqV5Vc+W6GL4vQAAHmDWGOU/2erL2LypG9vDzNR9n1VNVIpz8Fc
         3LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745565995; x=1746170795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rOWai1sdUbgwofhh5Gm/RhS+Xf+8kuHnQc4bFrAWfA=;
        b=VGyJSi1rhn0A8THb1JvnLSSavGNnNzVbmlidDzLEw7V4uPwwbxbi4J+abLoAtFJeER
         RwtQdNQdj2ho5CMzM9C6Di9B+3KX79vlj6EHRwqNg/FEOsrYMTN0xRyT8X5EaWI3jgc0
         aDYlmVFdg3Onvvq0sAcsY53HFW1RBiP13vlPjHVTrF0Y4T9ryVeE/xJxIO+6HS0YdPP6
         rR88xy3JG9ntxUApXNugrINhNbJpxMP8jflRMvxXHVptDbL1P+Xgb17kXgqoLTJ9B0A+
         tOB8uModxkgpcf19SqQ3XQfy4hrWLIsdZpaYl6tHsWrQzLyq2E6EHCuVgJesVvRcNW74
         OF8g==
X-Forwarded-Encrypted: i=1; AJvYcCXPu0pn9ickoPxFW38KwMGNgLMtLhEXz27nvaT6zHGy/5wX/ZtC/mPBQrm1CsnDO0gWtPZhj3NIIEyQvSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEtWkQ+WGJH/RWT8blAP4XwLYT9cpTcFzukJBYPTI8f50x148
	mQ9ALqQ+cycGlFtOZ7SaB0Rqv4eN+zInG2HvH3F6QWzPi75FvmQIrRSQzzjuZCs=
X-Gm-Gg: ASbGnctT/9nYl4BuZQ02XU+9wtFzk7TzLT5wAoB1k/H5cThxlSYInIF8hmIcOW/BUCo
	VOi8IOOtjonXC/GhgabR3ZvQOYHHN8dNTXkBpqHiM9i7i0oBN4KgwntLQSNlC9x0BDlHix0UGDx
	A9LVDmdxo4Y6y3w84N7VEgj6p4pjJlttzw0XCb6WZcIxyjjM8+2yMTy6Tq3qn8/D7aWyC2K99mA
	aE6tKjyg2UrBxYsp34EPkNOxavSUupVzD1XDJJw8DgK6UqDg+How2ySyzkbm0EYIfolBufrF6IN
	Eh0/N4okuTbpN2v/QvZ1GbF0wdXK
X-Google-Smtp-Source: AGHT+IHyL/iAGxsNCgxot5kbeyyZgpCwkYAozWtkwnyndNThNfSseLduEbxfeuXjaZvP1Jxj6O0QvQ==
X-Received: by 2002:a05:600c:34ca:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-440a66aaf1bmr8945465e9.24.1745565994713;
        Fri, 25 Apr 2025 00:26:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2aab65sm46521075e9.17.2025.04.25.00.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:26:34 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:26:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250425-93c9f462a1980ebd7bbc515d@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-3-alexghiti@rivosinc.com>
 <20250424-f322adab22126ae97dd7c5b4@orel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-f322adab22126ae97dd7c5b4@orel>

On Thu, Apr 24, 2025 at 10:45:46AM +0200, Andrew Jones wrote:
> On Tue, Apr 22, 2025 at 10:25:44AM +0200, Alexandre Ghiti wrote:
> > RV_X() macro is defined in two different ways which is error prone.
> > 
> > So harmonize its first definition and add another macro RV_X_mask() for
> > the second one.
> > 
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
> >  arch/riscv/kernel/elf_kexec.c        |  1 -
> >  arch/riscv/kernel/traps_misaligned.c |  1 -
> >  arch/riscv/kvm/vcpu_insn.c           |  1 -
> >  4 files changed, 20 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> > index 2a589a58b291..4063ca35be9b 100644
> > --- a/arch/riscv/include/asm/insn.h
> > +++ b/arch/riscv/include/asm/insn.h
> > @@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
> >  
> >  #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
> >  #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
> > -#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
> > -#define RVC_X(X, s, mask) RV_X(X, s, mask)
> > +#define RV_X(X, s, n) (((X) >> (s)) & ((1 << (n)) - 1))
> 
> Assuming n is arbitrary then we should be using BIT_ULL.
>

Eh, scratch this. We know n has to be 31 or less since these macros are
for instruction encodings.

Thanks,
drew
