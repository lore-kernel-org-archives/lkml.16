Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5A218EB3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094701; cv=none; b=if+DVQUrUO2QsnTDuK7DPP8lZRRO88QW7WDojlLEJZDWYADhwxwjStp9+xAhENnptBlea8Ovpu4a43HLVbQQ/Ukzaw/OM1Muy9g1qxx8wyRtxaqLbF8SdQYmgrgSdYxUlGwMSf5WnD9042IcG62OkaW9bln/AR71tTK0ieYo6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094701; c=relaxed/simple;
	bh=RT138KMBYvf8p/dIxpN4afKsBebrfEQuxVX6N0QW8Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv+zrQdyYLszMo3k+IO9b/pc555GVrvKw7AiBg2UI7+9HHOMmbTlDJrryJEXe6b4tsz+2srTFJ4mCCk/CERP1zi1q/O5V9ylLKPNU5LQTkGT/jTFUlzTDjq1rWBLidVnQfshpcGVBuhvjaphKx8RmkvqnG87VNqrMXT662fXWAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MDrtgMmt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MDrtgMmt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22403cbb47fso29178885ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743094699; x=1743699499; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X69JYKuhz4RcL0yZqHBKQzuXmiTmjL3ropZ+qzIq5VI=;
        b=MDrtgMmtAynrGqubGVIIq04TYGL20X6HwGq/T3U9fEj7J/k18Esk6GZycE4B/RgKRm
         T7VLV2GGqb7blCFrqO2zWv5r4WL6aEhb4EpIhrV3FD59wLQ/nIEyD4QQLef4xyaref5r
         O3+ihFmE8xmHoKq5bMler3ySZkql129fbRibhkXAWDqrKmdxlnsISHavt9OSe5HW4wBd
         hwZbuIIboGcJkzGMvnB7zVfs/Bx9yKAUMDJRFPlx1zBkqld16VMp4LpBjR7im1F+d7xT
         mbqB9cD8jDja5HDjWF6Nil+DvPnCihzHXUoHXfp9H+h+E+AVk4kYab2Ry1ZeimQAq21l
         q/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094699; x=1743699499;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X69JYKuhz4RcL0yZqHBKQzuXmiTmjL3ropZ+qzIq5VI=;
        b=ml6R4frf44YXVGlZv7rtBivFhnql3EFvw6yVzKPOV5RB1D/PeObVHYKWp7/fKtauy1
         yoBjC5vrItf1kUagNyFttL08LXCT8xx99UIp0yICMSk3TcKMyPzKNbzb6iisLX+8wBlK
         +tfCvOSxnOGcgDdLQ6bAbmFzRjStaq/jvtc36oD2VMlAvemPBCj76YBfNG1ERJ40Pagv
         Gba9T8Hy/UHl3splrWhaS0WS8jr+jMXgQYjnzztFX1BiNDbz3UUtw876WuBmfWumbqIY
         L8VQ8w14SCPSYZUMRz5yXMtZYD+lrSRj3ORnTFyTJLcqsH1qOEZb7mDcy+zt3vPDWxR6
         MJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJKsLk40VyjcpNXp6bL8wXXoKLxAVEMFva/aX+7mr/uu9KbeiSXLkT3eAG3iY+crbQsbQfLefOWejmTXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMlx0Uapb2XgJIXgd1e+dpq6SReQ3zrq9Mis2asTGFO+cyIck
	XL4crAAlgeUPaSh5TgHuPT0DsbGBLZOFuJLuwUsH5Ncv1FYyFgI1o4MXkNj4Lg==
X-Gm-Gg: ASbGncvj3Q3QDRkUivhs5Lwp6I4mmJAogFEcurj4JlvIO+bXGUVohKv5zFcOfsvueh7
	M7G9OoQf5UoXz92faVH0oqqEy6BvOMoOTgwuD4ee0S1E1A66dEjQZfS2MgPgqb+GhG4C8M7HRjd
	DoVSyTjG2jmn4Fq500RAePFjQTU91hqacQu+xK9qVbElMU9jOL5KRdKDfUPRzwvKcyQOCx0CSSK
	Ij1HYMpiitpRVFXNb25BnDYUBImjrr0P76lcbu1WwEDYMQAW5yGUy1LugeA6H2YZBrowwW9nvXj
	ApN8Sgq2/QBgmD9jNV4wyx3i77RI5/qJYnwrCT1HkAZe82qkizZMfgY=
X-Google-Smtp-Source: AGHT+IHwuPY0Fx7bxAhLHvSP9n9cJk7C+cgwdhW0NMvfUo8FmmlkrLe6GLIwmYsoS5A7Qo0poTq5fw==
X-Received: by 2002:a17:903:228c:b0:215:b75f:a1cb with SMTP id d9443c01a7336-2280481cce0mr59185335ad.9.1743094699295;
        Thu, 27 Mar 2025 09:58:19 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf8fesm1848975ad.110.2025.03.27.09.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:58:18 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:28:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v6 1/5] PCI: Introduce generic capability search functions
Message-ID: <d6bxw26swugn6kmod5faycruzcmz4mbjcck3mhljikhmm7h4y3@o5voponyug2w>
References: <20250323164852.430546-1-18255117159@163.com>
 <20250323164852.430546-2-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323164852.430546-2-18255117159@163.com>

On Mon, Mar 24, 2025 at 12:48:48AM +0800, Hans Zhang wrote:
> Existing controller drivers (e.g., DWC, custom out-of-tree drivers)

Oh, you should not mention 'out-of-tree drivers' as this patch is not anyway
intented to benefit them. We certainly do not care about out of tree drivers.

- Mani

> duplicate logic for scanning PCI capability lists. This creates
> maintenance burdens and risks inconsistencies.
> 
> To resolve this:
> 
> Add pci_host_bridge_find_*capability() in pci-host-helpers.c, accepting
> controller-specific read functions and device data as parameters.
> 
> This approach:
> - Centralizes critical PCI capability scanning logic
> - Allows flexible adaptation to varied hardware access methods
> - Reduces future maintenance overhead
> - Aligns with kernel code reuse best practices
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
> Changes since v5:
> https://lore.kernel.org/linux-pci/20250321163803.391056-2-18255117159@163.com
> 
> - If you put the helpers in drivers/pci/pci.c, they unnecessarily enlarge
>   the kernel's .text section even if it's known already at compile time
>   that they're never going to be used (e.g. on x86).
> 
> - Move the API for find capabilitys to a new file called
>   pci-host-helpers.c.
> 
> Changes since v4:
> https://lore.kernel.org/linux-pci/20250321101710.371480-2-18255117159@163.com
> 
> - Resolved [v4 1/4] compilation warning.
> - The patch commit message were modified.
> ---
>  drivers/pci/controller/Kconfig            | 17 ++++
>  drivers/pci/controller/Makefile           |  1 +
>  drivers/pci/controller/pci-host-helpers.c | 98 +++++++++++++++++++++++
>  drivers/pci/pci.h                         |  7 ++
>  4 files changed, 123 insertions(+)
>  create mode 100644 drivers/pci/controller/pci-host-helpers.c
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 9800b7681054..0020a892a55b 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -132,6 +132,23 @@ config PCI_HOST_GENERIC
>  	  Say Y here if you want to support a simple generic PCI host
>  	  controller, such as the one emulated by kvmtool.
>  
> +config PCI_HOST_HELPERS
> +	bool
> +	prompt "PCI Host Controller Helper Functions" if EXPERT
> + 	help
> +	  This provides common infrastructure for PCI host controller drivers to
> +	  handle PCI capability scanning and other shared operations. The helper
> +	  functions eliminate code duplication across controller drivers.
> +
> +	  These functions are used by PCI controller drivers that need to scan
> +	  PCI capabilities using controller-specific access methods (e.g. when
> +	  the controller is behind a non-standard configuration space).
> +
> +	  If you are using any PCI host controller drivers that require these
> +	  helpers (such as DesignWare, Cadence, etc), this will be
> +	  automatically selected. Say N unless you are developing a custom PCI
> +	  host controller driver.
> +
>  config PCIE_HISI_ERR
>  	depends on ACPI_APEI_GHES && (ARM64 || COMPILE_TEST)
>  	bool "HiSilicon HIP PCIe controller error handling driver"
> diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
> index 038ccbd9e3ba..e80091eb7597 100644
> --- a/drivers/pci/controller/Makefile
> +++ b/drivers/pci/controller/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_PCIE_RCAR_HOST) += pcie-rcar.o pcie-rcar-host.o
>  obj-$(CONFIG_PCIE_RCAR_EP) += pcie-rcar.o pcie-rcar-ep.o
>  obj-$(CONFIG_PCI_HOST_COMMON) += pci-host-common.o
>  obj-$(CONFIG_PCI_HOST_GENERIC) += pci-host-generic.o
> +obj-$(CONFIG_PCI_HOST_HELPERS) += pci-host-helpers.o
>  obj-$(CONFIG_PCI_HOST_THUNDER_ECAM) += pci-thunder-ecam.o
>  obj-$(CONFIG_PCI_HOST_THUNDER_PEM) += pci-thunder-pem.o
>  obj-$(CONFIG_PCIE_XILINX) += pcie-xilinx.o
> diff --git a/drivers/pci/controller/pci-host-helpers.c b/drivers/pci/controller/pci-host-helpers.c
> new file mode 100644
> index 000000000000..cd261a281c60
> --- /dev/null
> +++ b/drivers/pci/controller/pci-host-helpers.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCI Host Controller Helper Functions
> + *
> + * Copyright (C) 2025 Hans Zhang
> + *
> + * Author: Hans Zhang <18255117159@163.com>
> + */
> +
> +#include <linux/pci.h>
> +
> +#include "../pci.h"
> +
> +/*
> + * These interfaces resemble the pci_find_*capability() interfaces, but these
> + * are for configuring host controllers, which are bridges *to* PCI devices but
> + * are not PCI devices themselves.
> + */
> +static u8 __pci_host_bridge_find_next_cap(void *priv,
> +					  pci_host_bridge_read_cfg read_cfg,
> +					  u8 cap_ptr, u8 cap)
> +{
> +	u8 cap_id, next_cap_ptr;
> +	u16 reg;
> +
> +	if (!cap_ptr)
> +		return 0;
> +
> +	reg = read_cfg(priv, cap_ptr, 2);
> +	cap_id = (reg & 0x00ff);
> +
> +	if (cap_id > PCI_CAP_ID_MAX)
> +		return 0;
> +
> +	if (cap_id == cap)
> +		return cap_ptr;
> +
> +	next_cap_ptr = (reg & 0xff00) >> 8;
> +	return __pci_host_bridge_find_next_cap(priv, read_cfg, next_cap_ptr,
> +					       cap);
> +}
> +
> +u8 pci_host_bridge_find_capability(void *priv,
> +				   pci_host_bridge_read_cfg read_cfg, u8 cap)
> +{
> +	u8 next_cap_ptr;
> +	u16 reg;
> +
> +	reg = read_cfg(priv, PCI_CAPABILITY_LIST, 2);
> +	next_cap_ptr = (reg & 0x00ff);
> +
> +	return __pci_host_bridge_find_next_cap(priv, read_cfg, next_cap_ptr,
> +					       cap);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_bridge_find_capability);
> +
> +static u16 pci_host_bridge_find_next_ext_capability(
> +	void *priv, pci_host_bridge_read_cfg read_cfg, u16 start, u8 cap)
> +{
> +	u32 header;
> +	int ttl;
> +	int pos = PCI_CFG_SPACE_SIZE;
> +
> +	/* minimum 8 bytes per capability */
> +	ttl = (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) / 8;
> +
> +	if (start)
> +		pos = start;
> +
> +	header = read_cfg(priv, pos, 4);
> +	/*
> +	 * If we have no capabilities, this is indicated by cap ID,
> +	 * cap version and next pointer all being 0.
> +	 */
> +	if (header == 0)
> +		return 0;
> +
> +	while (ttl-- > 0) {
> +		if (PCI_EXT_CAP_ID(header) == cap && pos != start)
> +			return pos;
> +
> +		pos = PCI_EXT_CAP_NEXT(header);
> +		if (pos < PCI_CFG_SPACE_SIZE)
> +			break;
> +
> +		header = read_cfg(priv, pos, 4);
> +	}
> +
> +	return 0;
> +}
> +
> +u16 pci_host_bridge_find_ext_capability(void *priv,
> +					pci_host_bridge_read_cfg read_cfg,
> +					u8 cap)
> +{
> +	return pci_host_bridge_find_next_ext_capability(priv, read_cfg, 0, cap);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_bridge_find_ext_capability);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 01e51db8d285..8d1c919cbfef 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -1034,4 +1034,11 @@ void pcim_release_region(struct pci_dev *pdev, int bar);
>  	(PCI_CONF1_ADDRESS(bus, dev, func, reg) | \
>  	 PCI_CONF1_EXT_REG(reg))
>  
> +typedef u32 (*pci_host_bridge_read_cfg)(void *priv, int where, int size);
> +u8 pci_host_bridge_find_capability(void *priv,
> +				   pci_host_bridge_read_cfg read_cfg, u8 cap);
> +u16 pci_host_bridge_find_ext_capability(void *priv,
> +					pci_host_bridge_read_cfg read_cfg,
> +					u8 cap);
> +
>  #endif /* DRIVERS_PCI_H */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
