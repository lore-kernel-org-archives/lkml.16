Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029323718F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595133; cv=none; b=NBgauQLd7NnoolI134aaEGz9Zst54YI09g1k7vCcgquDyj+QZW4lZgLX9K5HOeu5Po8MVqIXOUf6E7LGKZEwjCWVSVznUonDOshL3jX7pK7W0btenc5Td67UQFAjrAT2eIJ4PFjMNXHZHNV4mv4+nUXnROhc2jXq8C4qjKAlE7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595133; c=relaxed/simple;
	bh=yz2g4VlGJxKRTtOW8OVXla1bJm6KVYLvKyCbxgeOuKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzZsD6u/BXp2DjQo4q0fSH+DMQMkEkL96jBPyU1OU6/J0t9v44UlYCLvZFnAj7vwWvvFKGAftlYhfu9+jcG7oglmoF9MXJxv7GAOFHtndoU/4ryNlHWvn/wMs1Ji5iJDKGxQHQjmX03VLthwr/0RQC4rQdLx9oo6Kiau24Ndfuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ELUm4BIi; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ELUm4BIi"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so11302103a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743595130; x=1744199930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpOpISsK92nzP8u+mrCrBVvlHehBgWb2S+ejZtPgHRk=;
        b=ELUm4BIi7v5+Gy9Vy/jGLtAaT01El6sbRwRuGZpT/ypYuN8Li/glsAleo3FcCcQM31
         /NNSpXMWMKdzF6V8vUMxmkmxsdFgebEQBU5vrUs3cJVXLC9zmnU/vQ8fLCs7kM1t4fWl
         6XWhVBtVHN7ZhLh6gjQf4jGU88Rj9GkaMsH0fl0fntT40/XYYpucNFfXMrWQ4V1uoXMI
         B8wHl4Ivklf/rlfRxG0dNRnO2YHqqoxHvoPVycnqJEnBbM9TR20HR6E6Jf1BTWfDvJCq
         Un5jEzLCtjGWlaI7etNIhfeCHpyOM8fqmef2XY7e/dKGUOg6f+aRjt+oWulHjwi6YX2F
         ykxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595130; x=1744199930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpOpISsK92nzP8u+mrCrBVvlHehBgWb2S+ejZtPgHRk=;
        b=FGiRDrc0awHgTGYUY86LNyvvnyehhpQVYRV0+dzStwARDS6AV1OU9dzLVx65vnjez1
         cJanL3PSJTtS7G1AXbzllhfzjl/mH2tLTTpFGPCxcYMTINqkWXHeH/ZJ0iFlFpm9Lk0p
         vUgdOlNAVkAblIZLD4kKs7p007r6rU8KWEKRiI90yAfv1bktaCqsS+F9DuLmQt0untp/
         U5zCcSM9LOebPvWdOlBRPoR4qsD0H5pSaPN0hRWz2G7HbXd2L80mqRUOovn8Y51SwwjU
         lUq0csCJ1iT8i8IpKZNayDLp2jtmhf/8LHsrAViksftZ5eYjY8t3NEYn23bODmWhisDL
         kkyg==
X-Forwarded-Encrypted: i=1; AJvYcCUOy87VOjKPLWm8dS3+fGpHewcHgBBwtpBy952SR9/cKMVtOmWz5avS1/REnUHyC0aV/fxHIcGG8NT3eHY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycd7S71/9YGZ/Kq/3d5244WrfF6BM4E2d5TMkDFltAXGdLtCVc
	NB/jJlKf3IUSquOCiV+lEONeh1eS5EtgX5u9N7hU4uewKAEPNrlnTBnhVxz+wmUeVeB6TR3NIIB
	EA7ITew81g4cktEDJNFp7EdrYz05mZ4pEl0MSaw==
X-Gm-Gg: ASbGnctYkT8v6DrZtlHtIdSRVQtIXURWdsMozI0Wi7hEQfes5PxJn7iw2OY8vbadAMQ
	gfJ8MMNPDKGg6xwRwdV3cQUe2wU+Ohe+J2auL5STXOMWotgqyhAbjSeSgTw1FvaTc/staBnONgs
	oWoiOp855fFkRqd7WA22Op/s2nWbNTAIHZz8EzWUs=
X-Google-Smtp-Source: AGHT+IF3cEFgXzdw0KASyYJbIgo8CjfwnxgRulQ8O3ZcGZVY1greNWnfIf6SArRocnrBaky8kBjQ3GFF0cDB7r4EhsM=
X-Received: by 2002:a17:90b:2711:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-3056ef08027mr3048369a91.28.1743595129770; Wed, 02 Apr 2025
 04:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325144252.27403-1-luxu.kernel@bytedance.com> <8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
In-Reply-To: <8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 2 Apr 2025 19:58:38 +0800
X-Gm-Features: AQ5f1JrCmdbPvgxjXXBONrqT24lyujGReyf184CCKAQbeGFTcfNc41gd0CSYnb8
Message-ID: <CAPYmKFv_qRmsR+4s3evxCJjzVavtNb6UFRX6+JmepUW23X=ZLg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32
 bit I/O bus platform
To: Robin Murphy <robin.murphy@arm.com>
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, alex@ghiti.fr, 
	lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robin and Jason,

Thanks for your comments and sorry for the late reply.

The iohpmcycles register is handled specially because unlike the other
IOMMU registers, its effective bits lies in the upper half. I want to
ensure that all effective bits are the last ones to update. For
example, when updating DDTP register, we update the upper half first
which only contains its table PPN, and then update its lower half
which contains the MODE bits which really enable translation. The main
reason is that when software splits an 8-byte write to two 4-byte
writes, the hardware is not aware whether it is an 8-byte write or a
4-byte write when it receives the first write. Thus it will always
make the value effective every time it receives a 4-byte write.

On Wed, Apr 2, 2025 at 7:29=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2025-03-25 2:42 pm, Xu Lu wrote:
> > Introduce a new configuration CONFIG_RISCV_IOMMU_32BIT to enable
> > splitting 8-byte access into 4-byte transactions for hardware platform
> > whose I/O bus limits access to 4-byte transfers.
> >
> > Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> > ---
> >   drivers/iommu/riscv/Kconfig |  9 +++++++++
> >   drivers/iommu/riscv/iommu.h | 28 +++++++++++++++++++++++-----
> >   2 files changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
> > index c071816f59a6..b7c9ea22d969 100644
> > --- a/drivers/iommu/riscv/Kconfig
> > +++ b/drivers/iommu/riscv/Kconfig
> > @@ -18,3 +18,12 @@ config RISCV_IOMMU_PCI
> >       def_bool y if RISCV_IOMMU && PCI_MSI
> >       help
> >         Support for the PCIe implementation of RISC-V IOMMU architectur=
e.
> > +
> > +config RISCV_IOMMU_32BIT
> > +     bool "Support 4-Byte Accesses on RISC-V IOMMU Registers"
> > +     depends on RISCV_IOMMU
> > +     default n
> > +     help
> > +       Support hardware platform whose I/O bus limits access to 4-byte
> > +       transfers. When enabled, all accesses to IOMMU registers will b=
e
> > +       split into 4-byte accesses.
> > diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> > index 46df79dd5495..0e3552a8142d 100644
> > --- a/drivers/iommu/riscv/iommu.h
> > +++ b/drivers/iommu/riscv/iommu.h
> > @@ -14,6 +14,10 @@
> >   #include <linux/iommu.h>
> >   #include <linux/types.h>
> >   #include <linux/iopoll.h>
> > +#ifdef CONFIG_RISCV_IOMMU_32BIT
> > +#include <linux/io-64-nonatomic-hi-lo.h>
> > +#include <linux/io-64-nonatomic-lo-hi.h>
> > +#endif
> >
> >   #include "iommu-bits.h"
> >
> > @@ -69,21 +73,35 @@ void riscv_iommu_disable(struct riscv_iommu_device =
*iommu);
> >   #define riscv_iommu_readl(iommu, addr) \
> >       readl_relaxed((iommu)->reg + (addr))
> >
> > -#define riscv_iommu_readq(iommu, addr) \
> > -     readq_relaxed((iommu)->reg + (addr))
> > -
> >   #define riscv_iommu_writel(iommu, addr, val) \
> >       writel_relaxed((val), (iommu)->reg + (addr))
> >
> > +#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, ti=
meout_us) \
> > +     readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, con=
d, \
> > +                        delay_us, timeout_us)
> > +
> > +#ifndef CONFIG_RISCV_IOMMU_32BIT
> > +#define riscv_iommu_readq(iommu, addr) \
> > +     readq_relaxed((iommu)->reg + (addr))
> > +
> >   #define riscv_iommu_writeq(iommu, addr, val) \
> >       writeq_relaxed((val), (iommu)->reg + (addr))
> >
> >   #define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, t=
imeout_us) \
> >       readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, con=
d, \
> >                          delay_us, timeout_us)
> > +#else /* CONFIG_RISCV_IOMMU_32BIT */
> > +#define riscv_iommu_readq(iommu, addr) \
> > +     hi_lo_readq_relaxed((iommu)->reg + (addr))
> >
> > -#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, ti=
meout_us) \
> > -     readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, con=
d, \
> > +#define riscv_iommu_writeq(iommu, addr, val) \
> > +     ((addr =3D=3D RISCV_IOMMU_REG_IOHPMCYCLES) ? \
> > +      lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
> > +      hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))
>
> Echoing Jason's comment, what is this even trying to achieve? Nothing in
> the spec suggests that the cycle counter register is functionally
> different from the other PMU counter registers (other than its
> self-contained overflow bit).
>
> It is not, in general, safe to do a split write to a running counter
> either way - low-high vs. high-low just moves the problem around,
> changing *which* combinations of values are problematic and capable of
> overflowing into each other between the writes. If the PMU driver can't
> write counters atomically, it will need to ensure that it only ever
> write them while stopped (at which point the order surely shouldn't
> matter). Conversely, though, reading from running counters is a bit more
> reasonable, but it needs more than just hi_lo_readq to guarantee it's
> not got a torn result.

You are right. It is more appropriate to ensure update iohpmcycles
with cycle counting disabled. I will remove this redundant branch in
the next version.

>
> Thanks,
> Robin.
>
> > +
> > +#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, ti=
meout_us) \
> > +     readx_poll_timeout(hi_lo_readq_relaxed, (iommu)->reg + (addr), va=
l, cond, \
> >                          delay_us, timeout_us)
> > +#endif /* CONFIG_RISCV_IOMMU_32BIT */
> >
> >   #endif
>

Best regards,
Xu Lu
