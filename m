Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC326B95C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772996; cv=none; b=ML1RyzbLHBweitPjyi2coAIkBVNk7T+I0RDm0IcToDj2nJeFDUrhwHyftvuU4478XvVeR4RG8CqkVRz5kTeo8VGP2Wx5skVkDoD7MhsNhYZGhOXazki3N41zRw5aXwTNrp+RQ5sEQqYRgxYCb8kX0afTdHrIl7FyrTRcOF6M98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772996; c=relaxed/simple;
	bh=ghSTPDMBmKNh6R/xiVJM8gT+jTFNIjQQaJPqghwpZjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixN768x2SMmQegAzC2+/42gZTnIBuBB9zV3FSDjqGXe6GiBWTYoHyCeZx5NNpInXWkMt9rLNkpLEOXCzjjvs17l2JMOqe2I3VYRMtk91PWcCTD/7HBfUXY6TFToBneP9Y08Ad9AS+ET2J3xtM01vvIQF/DU2QhKYBp1liJzfIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eb/VyXos; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eb/VyXos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39874C4CEEF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746772996;
	bh=ghSTPDMBmKNh6R/xiVJM8gT+jTFNIjQQaJPqghwpZjY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Eb/VyXosiYXHNnQAaqq5IlB7CzkTKtizXgAXVvm3bcJ0b/fuzwgRFfcWThnZEwNzl
	 QJXk0Fpw+RTQyZmVnBR6JLO7DLUGBFNciUktHOf678YDHkhk3U/Yh7cxIwIIvw3jCT
	 tOVurhBTyr7AVJgBC6bIjaR5fYWxXc5yVeCAI9G5fitxy1Tz14PUeK9mQdEZK9wt8s
	 Mq6Ws7w3trcXdnTV0TKHHEmlF51dUyvwIXPrbGl0HF9jBGl2QPESLA4K/yLVGi7qHl
	 smboDShLc3NgxO9/9Zj/RpoJ/n1UJBueb8G2IdoUIB4v8eKwplrjuZq2ZORl2AHhmT
	 zKEBq4Qkr6RBQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-326ca53a7e8so623881fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 23:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiATHEBaPfxfnzP0sLnFls2mRBG5O6xcch3/UBNC0MLF9yuezN7B8wO25V7gvhrSboqxfxTseS0nGCGPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQHgW4ko/h5ocvZAM62lTuPF4tAvtWWEK+nMwJ094aGAM+DmF
	0LPMSj+OPeVAOUx56/0zfTNrLnmlkOgRNtDFAukkX2a9sdui8R/PkbR5IAslCvcny2AmcdM1Jf/
	m61zfRAs96G65q1r322zXkwIhqs0=
X-Google-Smtp-Source: AGHT+IFsYIL6Kq1fR2rucdZEGan6DGCUAzRTPL9yxGMxy2vAM733bGMSlqsVKU81T1W52/p+1SZOBQJGywB2CW717ww=
X-Received: by 2002:a2e:bc07:0:b0:30c:c7a:dcc with SMTP id 38308e7fff4ca-326c45a9416mr9145701fa.20.1746772994563;
 Thu, 08 May 2025 23:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com> <20250508114328.2460610-8-ardb+git@google.com>
 <aByy1CFUieJQeofl@e129823.arm.com>
In-Reply-To: <aByy1CFUieJQeofl@e129823.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 May 2025 08:43:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE-VbdniRZ9Y+u9eaw9JM_qot+TJkQkfULX548YvKD4Ww@mail.gmail.com>
X-Gm-Features: ATxdqUFXQ6f01M85Uaq5BhYbSHW7aM9dCR1G5FmaZ6Jsmzse2QNK1itGcCJ8okg
Message-ID: <CAMj1kXE-VbdniRZ9Y+u9eaw9JM_qot+TJkQkfULX548YvKD4Ww@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 15:34, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> Hi Ard,
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > BSS might be uninitialized when entering the startup code, so forbid the
> > use by the startup code of any variables that live after __bss_start in
> > the linker map.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/image-vars.h  | 62 +++++++++++---------
> >  arch/arm64/kernel/vmlinux.lds.S |  2 +
> >  2 files changed, 35 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > index c3b4c0479d5c..a928e0c0b45a 100644
> > --- a/arch/arm64/kernel/image-vars.h
> > +++ b/arch/arm64/kernel/image-vars.h
> > @@ -10,6 +10,12 @@
> >  #error This file should only be included in vmlinux.lds.S
> >  #endif
> >
> > +#define PI_EXPORT_SYM(sym)           \
> > +     __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> > +#define __PI_EXPORT_SYM(sym, pisym, msg)\
> > +     PROVIDE(pisym = sym);           \
> > +     ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
> > +
> >  PROVIDE(__efistub_primary_entry              = primary_entry);
> >
> >  /*
> > @@ -36,37 +42,35 @@ PROVIDE(__pi___memcpy                     = __pi_memcpy);
> >  PROVIDE(__pi___memmove                       = __pi_memmove);
> >  PROVIDE(__pi___memset                        = __pi_memset);
> >
> > -PROVIDE(__pi_id_aa64isar1_override   = id_aa64isar1_override);
> > -PROVIDE(__pi_id_aa64isar2_override   = id_aa64isar2_override);
> > -PROVIDE(__pi_id_aa64mmfr0_override   = id_aa64mmfr0_override);
> > -PROVIDE(__pi_id_aa64mmfr1_override   = id_aa64mmfr1_override);
> > -PROVIDE(__pi_id_aa64mmfr2_override   = id_aa64mmfr2_override);
> > -PROVIDE(__pi_id_aa64pfr0_override    = id_aa64pfr0_override);
> > -PROVIDE(__pi_id_aa64pfr1_override    = id_aa64pfr1_override);
> > -PROVIDE(__pi_id_aa64smfr0_override   = id_aa64smfr0_override);
> > -PROVIDE(__pi_id_aa64zfr0_override    = id_aa64zfr0_override);
> > -PROVIDE(__pi_arm64_sw_feature_override       = arm64_sw_feature_override);
> > -PROVIDE(__pi_arm64_use_ng_mappings   = arm64_use_ng_mappings);
> > +PI_EXPORT_SYM(id_aa64isar1_override);
> > +PI_EXPORT_SYM(id_aa64isar2_override);
> > +PI_EXPORT_SYM(id_aa64mmfr0_override);
> > +PI_EXPORT_SYM(id_aa64mmfr1_override);
> > +PI_EXPORT_SYM(id_aa64mmfr2_override);
> > +PI_EXPORT_SYM(id_aa64pfr0_override);
> > +PI_EXPORT_SYM(id_aa64pfr1_override);
> > +PI_EXPORT_SYM(id_aa64smfr0_override);
> > +PI_EXPORT_SYM(id_aa64zfr0_override);
> > +PI_EXPORT_SYM(arm64_sw_feature_override);
> > +PI_EXPORT_SYM(arm64_use_ng_mappings);
> >  #ifdef CONFIG_CAVIUM_ERRATUM_27456
> > -PROVIDE(__pi_cavium_erratum_27456_cpus       = cavium_erratum_27456_cpus);
> > -PROVIDE(__pi_is_midr_in_range_list   = is_midr_in_range_list);
> > +PI_EXPORT_SYM(cavium_erratum_27456_cpus);
> > +PI_EXPORT_SYM(is_midr_in_range_list);
>
> small nit:
> Would you rebase this patchset after
> commit 117c3b21d3c7 ("arm64: Rework checks for broken Cavium HW in the PI code")?
> Otherwise, I experience boot failure because of SCS related code:
>
>   ffff80008009fbc0 <is_midr_in_range_list>:
>   ffff80008009fbc0: d503245f    bti     c
>   ffff80008009fbc4: d503201f    nop
>   ffff80008009fbc8: d503201f    nop
>   ffff80008009fbcc: f800865e    str     x30, [x18], #0x8 ---- (1)
>   ffff80008009fbd0: d503233f    paciasp
>   ...
>
> At pi phase, platform register initialized properly...
> So it makes panic on (1).
>

That commit is not in the arm64 tree, so it will be up to Marc and
Catalin to resolve the conflict.

Your commit

363cd2b81cfd arm64: cpufeature: Move arm64_use_ng_mappings to the
.data section to prevent wrong idmap generation

is not in the kvmarm tree, so the build will not even complete if you
rebase it on that.

For testing, please merge the kvmarm tree and resolve the conflict by hand.
