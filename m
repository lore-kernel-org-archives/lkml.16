Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65B26AF5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745763258; cv=none; b=jVH5/ncBDJGaQCyYk/UydsyAksnIPpqMrPvywuP2+yjB66D2xj4KzkHViUnJh8yayPNiPmxyxgvoOBre9MZQd9qkhIlQ9xK9hW2e2+x7EkLSvSkN4uRE/f/5+fdaSt28q82lNG8KaHQFKr2/JPTVDrI5dYI7zFfJWfpJnOscG+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745763258; c=relaxed/simple;
	bh=rkRAGu8tTnx7TSm3R/NqNuU2jUskZCs4cycJWjam2DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLjvFLims25Bj46rIiwL93scC4XLWYLhuEp/RdBlAXQ7p7V2OS9hVvPEh9Wvd+HDsiQojN9CIWOlbMGcTmIKB9wIeppgvPLHF/CzJ8KF5MyhMdiM/pQXct9Y1wCoD4ed0JyLa+s8mFZePPzhmZYgxNtP0kCQ5ALwtdmBqExwvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GeCNf/ru; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GeCNf/ru"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c277331eso4649280b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745763255; x=1746368055; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ACNBxPO8ZTcboVmh3x2UF5/k0ixRgW7g046Uv0nuIS4=;
        b=GeCNf/ru9VwUnZsUh5E776cNUDOtJdoZYNtyZz/IrIxgdx5kmVbeltFIq4HsiBy+bd
         7EGr6z8GeeyOZE+BqW9Lx7lY03fB7F8NAGkT1Evt6fdVKn6GZzfoatjtztymfb4lX6SM
         Jj4kO1i7jWDBjVp37Vj1060x5K5BqXoyvuGq2BTHSsnGtdblXX5AKcrRYkB4tKLje8nd
         6+AmtnbNQ3X5KJctUo5674lZYiWZROwMh1dpbSZdoDbIPtHbs47wQ7QmGqkYZtAoJ/7g
         HxCn7fef7p1yqrF3QYDDRW2tCXxbM6CDS+VEPmOEpn0goiFEDCzzYeLUcsjr/ShO2epi
         SJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763255; x=1746368055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACNBxPO8ZTcboVmh3x2UF5/k0ixRgW7g046Uv0nuIS4=;
        b=d7b+q/FtGQxvXj5pK4VNhu3yl/qg5pPoaVZKtk6dPHvqtkhLjdjXibA6rey0Qc/ynH
         wwzaoQh3DQ6WUEQZ+GsM+5zEV5fJBsrE9Pw6nthguNGh4KLfYKIyK9md5EPXksGdyLgx
         oEXReV3i7mG/wMiYQCaXr22KhgHk4cSF40wYvoumkF8R3bv9ZMwoJDY7AWcYiL8T1s8P
         B6QSWc5K3/MWxtauwhb/lsI3tjPSQWGEV+QpJsEfwL4BQJaGJ1vbqzkk8shCjQpPOh0o
         VgM92pYLi3GD5whIWY1YZ7vVwZELljDCCPc6VfMZ09S+U+NGpwOb8D+0C+uZyiGVyZpN
         uPyg==
X-Forwarded-Encrypted: i=1; AJvYcCWz0PYKqH6t2YZBNrlAVo/R0rnjU1gEZC+fHkda/DcYwSIRmRo5VFAKGZFiBLxm/+48BDTTT59BrNr2PfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGpEhb2Q3DwiDSAyEsNBRXXTXMJBhMiRIuP7EPSLXjtcPAdjk
	u2asY3JjcZXGGfAkHRDsXt0sMAm50tRXS0dDFrQWhAZTW317cPNzlDueoZIncQ==
X-Gm-Gg: ASbGncuNRKRZv929lbuPQgZO7wD68sQe741+MOutV+ZllbUJrXuSCUxrdr+UbiPDESY
	X7qO6Lxtk/2dLMxPKZNPG3tmB12MiXwwpZMvzqd43yELiN6v/RAQ7D6e/tNayycumSXXyFy+jBZ
	UE0ig6ROOQibnOFwyMWg4FruzpyFmCtJZo9fdYsyQnCCFfwWVSUXcQDmLJGpHKbhQcwTWph63wY
	QdIzHl057unlsw+Sy0huqPYnNY7tEH7B3laXwlgFnww8gL87lOj7iiq//6rVMXvLB30lLI9N3l4
	qu2WoNj5ghLPww++X2ascIPfQnsKFi86+m9Lmadx+NATM0nrAWgz
X-Google-Smtp-Source: AGHT+IHjWEH0dSAl/SHWrSYJFzYKk/J+piJ5N7UDrAAAZ6BtOMkHd9X5c8VlDHgDtN0O4ARPSiTzjA==
X-Received: by 2002:a05:6a20:c6ca:b0:1fd:f4df:ab67 with SMTP id adf61e73a8af0-2045b64f481mr12361009637.21.1745763254720;
        Sun, 27 Apr 2025 07:14:14 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912325sm6480321b3a.14.2025.04.27.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:14:14 -0700 (PDT)
Date: Sun, 27 Apr 2025 19:44:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com, shawn.lin@rock-chips.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v4 2/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <mbgc46teac74goifhuj4fegmtaagfoqkhlm4uid23jurbvi2xa@wnhycs77kk6w>
References: <20250427125316.99627-1-18255117159@163.com>
 <20250427125316.99627-3-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250427125316.99627-3-18255117159@163.com>

On Sun, Apr 27, 2025 at 08:53:15PM +0800, Hans Zhang wrote:
> Register definitions were scattered with ambiguous names (e.g.,
> PCIE_RDLH_LINK_UP_CHGED in PCIE_CLIENT_INTR_STATUS_MISC) and lacked
> hierarchical grouping. Magic values for bit operations reduced code
> clarity.
> 
> Group registers and their associated bitfields logically. This improves
> maintainability and aligns the code with hardware documentation.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 49 ++++++++++++-------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index e7d33d545d5b..a778f4f61595 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -33,24 +33,37 @@
>  
>  #define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
>  
> -#define PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> -#define PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> -#define PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> -#define PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> -#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
> -#define PCIE_CLIENT_INTR_MASK_MISC	0x24
> -#define PCIE_SMLH_LINKUP		BIT(16)
> -#define PCIE_RDLH_LINKUP		BIT(17)
> -#define PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
> -#define PCIE_RDLH_LINK_UP_CHGED		BIT(1)
> -#define PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> -#define PCIE_CLIENT_GENERAL_CONTROL	0x0
> +/* General Control Register */
> +#define PCIE_CLIENT_GENERAL_CON		0x0

Is this the actual name of the register as per the documentation? Just asking
because of '_CON' instead of '_CONTROL'.

- Mani

> +#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> +#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> +#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> +#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> +
> +/* Interrupt Status Register Related to Legacy Interrupt */
>  #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> +
> +/* Interrupt Status Register Related to Miscellaneous Operation */
> +#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
> +#define  PCIE_RDLH_LINK_UP_CHGED	BIT(1)
> +#define  PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> +
> +/* Interrupt Mask Register Related to Legacy Interrupt */
>  #define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
> +
> +/* Interrupt Mask Register Related to Miscellaneous Operation */
> +#define PCIE_CLIENT_INTR_MASK_MISC	0x24
> +
> +/* Hot Reset Control Register */
>  #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
> +#define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> +
> +/* LTSSM Status Register */
>  #define PCIE_CLIENT_LTSSM_STATUS	0x300
> -#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> -#define PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
> +#define  PCIE_SMLH_LINKUP		BIT(16)
> +#define  PCIE_RDLH_LINKUP		BIT(17)
> +#define  PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
> +#define  PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
>  
>  struct rockchip_pcie {
>  	struct dw_pcie pci;
> @@ -161,13 +174,13 @@ static u32 rockchip_pcie_get_ltssm(struct rockchip_pcie *rockchip)
>  static void rockchip_pcie_enable_ltssm(struct rockchip_pcie *rockchip)
>  {
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  }
>  
>  static void rockchip_pcie_disable_ltssm(struct rockchip_pcie *rockchip)
>  {
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_DISABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  }
>  
>  static int rockchip_pcie_link_up(struct dw_pcie *pci)
> @@ -516,7 +529,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>  
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  
>  	pp = &rockchip->pci.pp;
>  	pp->ops = &rockchip_pcie_host_ops;
> @@ -562,7 +575,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>  
>  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_EP_MODE,
> -				 PCIE_CLIENT_GENERAL_CONTROL);
> +				 PCIE_CLIENT_GENERAL_CON);
>  
>  	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
>  	rockchip->pci.ep.page_size = SZ_64K;
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
