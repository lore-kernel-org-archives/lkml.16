Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D186328
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996055; cv=none; b=A4Fz2zzjKbTMpw0OgHgiAYQ6z7sgl/EbjN/sqdYkZ2/W2Q21SqRaUMoFqu0U5/3QbgWq3GTF6Q4chkeilFWv5hOWQ696W5lfA5C0Y2D4j2Uo7dN5gmOSx1ANz/UaOEajJNfub+10+TqXBkiPRc1kdaXexNCLPryOawcCaZtyyKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996055; c=relaxed/simple;
	bh=WdGGHLlvsM/i1MnTQ2dVztvbpKZ3JQ0HRd4+rdRBjUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZFmRMnYRlCXxmL51G8+P6BThNu5c+nKYaqBPHpOmw6GstoZLHVXUOb6aSJtxOt5K46p82Gl9JEbQb1oZ5PUPqC4gQVNvdsquXgzBEoH6am2krnkCfUgF5DnMPupMTKKoObdFAmaShNnXxAkFcwUeKhbTUTefTwNkNPqDhqBkck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKy6O/Xf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKy6O/Xf"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7399838db7fso2100344b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744996053; x=1745600853; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nL6dqOeouWGje3PfIFhRZYZKH+4zhi7g+fExpzSbfis=;
        b=VKy6O/XfVFphQtRBySCY2ghsxfKquvyOBCde+lPIIX1hKWhWiTgAb3GRZoiWbiZAVZ
         LS9GnFy0PRVXc/PtlW2va/eU/n7OS1p9z6toQ6pIPI7oZp2IxdM9iYPBflwM38FW/n4B
         wBe+9t1yLE5HuLQg1IDAv4UUFfxtrz+DcVD+hIiXf+fE5aH0ebq+D2P0GJTK85hfLMRW
         IynIzKv0aAGmzmcz2NR7Mhj76+iBd8iMu2CUWl11vb7RWuhZQBUY+pny3EKQKohnUDk/
         nFmuJP2MsyRdLEyBOyqyjQccNmiCqAbqEQeA6JVpCsmLajrbl67PUS122nzlGwhAadrJ
         ejtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996053; x=1745600853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL6dqOeouWGje3PfIFhRZYZKH+4zhi7g+fExpzSbfis=;
        b=MiduXwImUFzmSzso6JyuXey1G4EmV4wi4Xe5hJ0FKBzGHyvDkaKF9q7izrQngwOfEs
         1yXbF2NzmJLGMb9B2cSk5Lb10uHxX5BVx7N/HhSDIKDW9bHsVo+tqjhrdUU7UW3JjBds
         ReueGEJdDNCf9BjXVeNVTQFn/9KZTWi6ixxS38k8Bhe0HlYji10Vix4eUS1nP6i3QP9N
         81CRnzl8E/YzDgmWtp8IFJANiLicLR4h/VFDFeib+YS2haLYQxyUBL/shNANNVU1/+8T
         CELQrwjfULg7rkOR4mNnfwcLH2SZjROjWYCoQieS7iaFwtPpl6q2ii+dE5mX9bXpsil/
         QB2w==
X-Forwarded-Encrypted: i=1; AJvYcCXfZ9/9t2horLYwABUQD3Rty9O5lQZcyuVdNRZL5PaJaXZmNXOUojb/6fMAQ8EuGbCqnFcvRafozMW9RHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RL+nkMSJqNx1V4XfIUWQoRRS2ATvRuzP44ExZ0bN0w/GOXPB
	v02ot5U3ZiMge1vrF/v+hSg+fp5Da3bUGJ4KnI9Ci0k9RYFzO3xQEbUmA7bl5w==
X-Gm-Gg: ASbGncuDaz/9UaNLa4WkqNSGdejyyVh+8T+cxIRMtqj3lyNEf9p2tv5XeW5zPDiIOmB
	1HjWL28sKGQYOPzpij8DkLvNpfJ0vIJ5W/7wHU6kKQS4C8cNd6LskhwpGQbs+cM+IYDwkoMXfLk
	mNYNei7ObvWsm+ZnOl79BCVZKbM290c8QQdJUhBpJ1tYdBUbO52WgVeIL5VWKeEPYjTvq9ospJQ
	eSTR+VkzOoc0SpJm5ohHS4p0v2UZtw1H4IK2Ne+f1lz8Bvi3/I0ivmIpL6i7qEc6IclUTbERPri
	0ucmF/1c0dXo95qnfItZ6XkE3CQkbzIYhInyXzaB4vhO5hOQ7Ys=
X-Google-Smtp-Source: AGHT+IFd8ioW+E3Ktz8zI+ikNBXvvgjozvxKBov9f/KWyoLC0PTaG7crTd+nou7TAO4V0w0FxgrPdg==
X-Received: by 2002:a05:6a00:3c76:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-73dbe601c73mr4561736b3a.7.1744996052724;
        Fri, 18 Apr 2025 10:07:32 -0700 (PDT)
Received: from thinkpad ([36.255.17.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaee68bsm1880459b3a.175.2025.04.18.10.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:07:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:37:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, 18255117159@163.com, 
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v4 4/4] PCI: j721e: Add support to build as a loadable
 module
Message-ID: <gqeraipycu4blfye77oyaysxatz757r7lsw72kq26smj4dwxoj@cytxxhqjrnno>
References: <20250417124408.2752248-1-s-vadapalli@ti.com>
 <20250417124408.2752248-5-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417124408.2752248-5-s-vadapalli@ti.com>

On Thu, Apr 17, 2025 at 06:14:08PM +0530, Siddharth Vadapalli wrote:
> The 'pci-j721e.c' driver is the application/glue/wrapper driver for the
> Cadence PCIe Controllers on TI SoCs. Implement support for building it as a
> loadable module.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

One nitpick below. But no need to respin just for this. Hopefully, this can be
changed while applying the series.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> v3 patch is at:
> https://lore.kernel.org/r/20250410104426.463453-5-s-vadapalli@ti.com/
> Changes since v3:
> - In the fourth patch of this series, the polarity for PERST# assert in
>   the driver's .remove callback has been fixed based on Mani's feedback at
>   https://lore.kernel.org/r/6bi5gul3sqvycmkf6cwokkvownjffaf2tkonjlefo2d7cautwx@uhfexzgz3okp/
> 
> Regards,
> Siddharth.
> 
>  drivers/pci/controller/cadence/Kconfig     |  6 ++---
>  drivers/pci/controller/cadence/pci-j721e.c | 31 +++++++++++++++++++++-
>  2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> index 82b58096eea0..72d7d264d6c3 100644
> --- a/drivers/pci/controller/cadence/Kconfig
> +++ b/drivers/pci/controller/cadence/Kconfig
> @@ -43,10 +43,10 @@ config PCIE_CADENCE_PLAT_EP
>  	  different vendors SoCs.
>  
>  config PCI_J721E
> -	bool
> +	tristate
>  
>  config PCI_J721E_HOST
> -	bool "TI J721E PCIe controller (host mode)"
> +	tristate "TI J721E PCIe controller (host mode)"
>  	depends on ARCH_K3 || COMPILE_TEST
>  	depends on OF
>  	select PCIE_CADENCE_HOST
> @@ -57,7 +57,7 @@ config PCI_J721E_HOST
>  	  core.
>  
>  config PCI_J721E_EP
> -	bool "TI J721E PCIe controller (endpoint mode)"
> +	tristate "TI J721E PCIe controller (endpoint mode)"
>  	depends on ARCH_K3 || COMPILE_TEST
>  	depends on OF
>  	depends on PCI_ENDPOINT
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index ef1cfdae33bb..8a73a4d382d1 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -15,6 +15,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> @@ -27,6 +28,7 @@
>  #define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
>  
>  #define ENABLE_REG_SYS_2	0x108
> +#define ENABLE_CLR_REG_SYS_2	0x308
>  #define STATUS_REG_SYS_2	0x508
>  #define STATUS_CLR_REG_SYS_2	0x708
>  #define LINK_DOWN		BIT(1)
> @@ -116,6 +118,15 @@ static irqreturn_t j721e_pcie_link_irq_handler(int irq, void *priv)
>  	return IRQ_HANDLED;
>  }
>  
> +static void j721e_pcie_disable_link_irq(struct j721e_pcie *pcie)
> +{
> +	u32 reg;
> +
> +	reg = j721e_pcie_intd_readl(pcie, ENABLE_CLR_REG_SYS_2);
> +	reg |= pcie->linkdown_irq_regfield;
> +	j721e_pcie_intd_writel(pcie, ENABLE_CLR_REG_SYS_2, reg);
> +}
> +
>  static void j721e_pcie_config_link_irq(struct j721e_pcie *pcie)
>  {
>  	u32 reg;
> @@ -633,9 +644,23 @@ static void j721e_pcie_remove(struct platform_device *pdev)
>  	struct j721e_pcie *pcie = platform_get_drvdata(pdev);
>  	struct cdns_pcie *cdns_pcie = pcie->cdns_pcie;
>  	struct device *dev = &pdev->dev;
> +	struct cdns_pcie_ep *ep;
> +	struct cdns_pcie_rc *rc;
> +
> +	if (pcie->mode == PCI_MODE_RC) {
> +		rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
> +		cdns_pcie_host_disable(rc);
> +	} else {
> +		ep = container_of(cdns_pcie, struct cdns_pcie_ep, pcie);
> +		cdns_pcie_ep_disable(ep);
> +	}
> +
> +	if (pcie->reset_gpio)

All 'gpiod_*' APIs accept NULL descriptors. So you don't necessarily need the
check here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
