Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F3142E73
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751341666; cv=none; b=luvLmjGiopc6odawuHFP57/DUt0dWzf+wJpVxTVI3xlbShrCLSUh1D0qtC15bfs43I3dOM0WkXlHlf02o2YzVT1a6qtBLdWOblSwpAp1ULaB5MeFoTeMrj2JQDq91iZ/+GkkzkN5k0nybUyfD7vJLlvQKksvk1JQxTCM+cs3PIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751341666; c=relaxed/simple;
	bh=pxIbsYpOLc6LPCX7Y2ZibVmY1Hku+f+8eNIhpZl5XhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP/CdtrLwc1cKO/644vxsIm3sDDUYUSHyzI7S/kzLZEFpSXj82wVjM63SrGFMn9EVRWsvZZRuqt5A+PKitvsQfgoZ1oszKC5MAY8U65cA+oVFUPkSurxtkdwbsP3PYg9C2uJjZgTfnxHzIL7jUhWJu3+j4pGobFaKJf5c8bUHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jcr/3CjO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jcr/3CjO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2349f096605so31318405ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751341664; x=1751946464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q70BTMXv+elr6mx+h6qORt+5RlAkLGyM2dZSnSb4WnM=;
        b=jcr/3CjO3pOfM1wn9OSdXFNnOpkOPlFYHUADEiTZV1FpS5Vc0g0tu0zrbePSQlPiDv
         k/NHYrf8byNE1gCShI+CEeNgb4k/B+eIE7EBBdFq8iYL3170yyHXO+zoEvNuhw5P1UTH
         5ZneBZ1BmN/2ycQqLbd/oSWzLVXiTt9sktFerVncYivcxqZ4cYtErdQOZKg2mAQtM3zq
         7nUtU0PW4prb+pHjjSonR7G6OKZbotV3mIU2tqDNvmICjLXDjoI04+TJM4Hxw+RfyMOq
         aONptXDl+7CpQ2HhEL2+DxLf3BfGoHUoLs6gtKMAmH7bRJcZLjFI2BlBLbot2je15MuT
         ndXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751341664; x=1751946464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q70BTMXv+elr6mx+h6qORt+5RlAkLGyM2dZSnSb4WnM=;
        b=LjCXL4EbRPdAqSt9TI0bLamjv+nM6lF/BcqY12m1nir+OfNO7nLgvunjfZbAgjPJ0l
         1R+YOqKF0rRqxCN3FRXT8O8l8qVGhqZG42AW/flpmAk13+blvR9Xt93M4KSh1KUVQUN2
         iuQ8ZUG5UvSAYx8gXQE6F+T1D5o02St2Y3o+gzCCHxcIQmNqvm9YUa09CiLujE016bqZ
         7k1mQzJoQKE7nRSKXIsXSq5B/GXeLs35/vtkKhXLL2lXuGFOSvz2q0uIrn5u8np8V5eq
         aAW6MzapPEXf3Re2h+Y6vv93m6QD/NYeEPn3FTDf6JFA85p3zdWJZFxw/DWjuvu1PgTF
         yAIw==
X-Gm-Message-State: AOJu0YwHMq+dGHeQrSHmV+7VI97GgbCf8ZymWnGsFf8O/xhNjMpmMyLZ
	TNdfrkW20pXAkoD6nFNWnYc1Y//bPukUWyWuVcygKZ8WiDhIIsGuqQKAuaIH0Wb3k9s=
X-Gm-Gg: ASbGnctVaz48eDrjySkmwCBXGRHY6yQtL/RjT5XQIDZ+qu1ohkxqfetSycxMk+Gsl5S
	r+GVTWB8E1WOO5l2ICeJI/B39eYvwnQmbpx4+RqCvAPI45GEJEkiHbso5XCs6fzQnbytL8/0sYv
	4vHwIXYuCyxRpYIrNma48+RRxGJgG5rlYf9FMkWNHsaJyIo/mdlZypF6Ak/YqurasXexQlkv3gU
	JRi0YiPWjPXZ+LDWLrX9vZSEz3ttHoHXjXJ61O8Uq7OH94zB4Rk0qtPTv+u33BjDrUHA6J2OVAD
	pH3404X96opvEi9o9Nb6yjEohqaLHSym0f5jpKrqZuVtQWVMVn1SOE2VI1NRtPg8ypD4Rg==
X-Google-Smtp-Source: AGHT+IGN1GMdTqZAPJCguumolenY1Wtb8nB6QKle+VjMdicMJz56dOOYCipT836/9qVM3LRjuPHcgA==
X-Received: by 2002:a17:903:fa3:b0:235:779:ede3 with SMTP id d9443c01a7336-23ac4680a0fmr213846545ad.41.1751341664573;
        Mon, 30 Jun 2025 20:47:44 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1c40sm95714045ad.67.2025.06.30.20.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 20:47:44 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:17:33 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 1/3] ACPI: RISC-V: Add support for RIMT
Message-ID: <aGNaVQEsZX7vmrFv@sunil-laptop>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-2-sunilvl@ventanamicro.com>
 <20250630-4a94187c794980bb830c539a@orel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-4a94187c794980bb830c539a@orel>

Hi Drew,

Thank you very much for the review!.

On Mon, Jun 30, 2025 at 09:55:09AM +0200, Andrew Jones wrote:
> Hi Sunil,
> 
> I found a few nits while skimming this.
> 
> On Mon, Jun 30, 2025 at 09:18:01AM +0530, Sunil V L wrote:
> > RISC-V IO Mapping Table (RIMT) is a static ACPI table to communicate
> > IOMMU information to the OS. The spec is available at [1].
> > 
> > The changes at high level are,
> > 	a) Initialize data structures required for IOMMU/device
> > 	   configuration using the data from RIMT. Provide APIs required
> > 	   for device configuration.
> > 	b) Provide an API for IOMMU drivers to register the
> > 	   fwnode with RIMT data structures. This API will create a
> > 	   fwnode for PCIe IOMMU.
> > 
> > [1] - https://github.com/riscv-non-isa/riscv-acpi-rimt
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  MAINTAINERS                 |   1 +
> >  arch/riscv/Kconfig          |   1 +
> >  drivers/acpi/Kconfig        |   4 +
> >  drivers/acpi/riscv/Kconfig  |   7 +
> >  drivers/acpi/riscv/Makefile |   1 +
> >  drivers/acpi/riscv/init.c   |   2 +
> >  drivers/acpi/riscv/init.h   |   1 +
> >  drivers/acpi/riscv/rimt.c   | 523 ++++++++++++++++++++++++++++++++++++
> >  include/linux/acpi_rimt.h   |  26 ++
> >  9 files changed, 566 insertions(+)
> >  create mode 100644 drivers/acpi/riscv/Kconfig
> >  create mode 100644 drivers/acpi/riscv/rimt.c
> >  create mode 100644 include/linux/acpi_rimt.h
> > 
[...]
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 36061f4732b7..96d64e0a7b97 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -16,6 +16,7 @@ config RISCV
> >  	select ACPI_MCFG if (ACPI && PCI)
> >  	select ACPI_PPTT if ACPI
> >  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> > +        select ACPI_RIMT if ACPI
> 
> Should use tab here.
> 
Okay.
> >  	select ACPI_SPCR_TABLE if ACPI
> >  	select ARCH_DMA_DEFAULT_COHERENT
> >  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
[...]
> > +static inline int rimt_set_fwnode(struct acpi_rimt_node *rimt_node,
> > +				  struct fwnode_handle *fwnode)
> 
> I see this is a faithful port of arm's iort functions, but using
> 'inline' in source files is pretty pointless, so we could drop
> that.
> 
Sure.

> > +{
> > +	struct rimt_fwnode *np;
> > +
> > +	np = kzalloc(sizeof(*np), GFP_ATOMIC);
>
[...]
> > +	map = ACPI_ADD_PTR(struct acpi_rimt_id_mapping, node,
> > +			   id_mapping_offset + index * sizeof(*map));
> > +
> > +	/* Firmware bug! */
> > +	if (!map->dest_offset) {
> > +		pr_err(FW_BUG "[node %p type %d] ID map has NULL parent reference\n",
> > +		       node, node->type);
> 
> Should we have a pr_fmt() definition at the top of this source file for
> this pr_err?
> 
Oh yeah. Will add.

> > +		return NULL;
> > +	}
> > +
>
[...]
> > +	return err;
> > +}
> > +
> > +#else
> > +int rimt_iommu_configure_id(struct device *dev, const u32 *id_in)
> > +{
> > +	return -ENODEV;
> > +}
> 
> This is unnecessary since we have the stub in the header file.
> 
Right.

> > +#endif
> > +
>
[...]
> > +int rimt_iommu_configure_id(struct device *dev, const u32 *id_in);
> > +
> 
> ubernit: no need for this blank line
> 
Sure.

Thanks!
Sunil
