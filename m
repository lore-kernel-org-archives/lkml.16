Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E03C2C9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308395; cv=none; b=ob+mZGI2/+hXcnM5SpbpH9kb3QfM5Cj5MYhGIO9lbrao0lTshgiFCyQptz2EPU/zTqy0JnhpTJNnTUwwgEee4xAoDX78wsNeqPdKhf0vrkCxawpyE1eGCNbnm9DdUWy7MFsOv0JcWErLvbcCpW11cC39uAzRRZGy6SfLanqCPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308395; c=relaxed/simple;
	bh=9MRD1+jcFedrZg03dVslc9ED/+5UQU4W+jpewP/RIS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A902toTMBU8FWwV/v+ZWrk/LIYOrPdAai4xQDhW9GjiugLuHwkymFUSKoT6K/IW8Nint3a/kyHrrF1y7PUV0GBzOk7ggAjDRlNHzQi01pMjPN7HyiWtA2Uz9ehe7SUeFGZfjkCDl/cySORgX1/CaD3ictF5duz1FIRAyKVhXqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kIHCERj6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kIHCERj6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so8996185e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308392; x=1747913192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E6YcWQUS/krFSoVF5ePsfXGO+e5W0vWFl3MyrWAJnzQ=;
        b=kIHCERj6mmy9rvTI4yHJ1eWlFrs8AhWp1mu1CI6Nx6zSuruxJAsfNRS8aZka7i6WaG
         TbE7kP36LFvAr4641pl2EFkTfjPCYvs5HJRb/RguwuQcO+8iVQrexudlXaOpN0+HnMjw
         aw0haN9riD4NQTmnCKGw8AhYVOPSpTZ0FwkkQMjy/FaKx9ti+syxDOiMkSZjTuuEThfX
         w1LiGWmmv361fZXlvik8wn9Kuaopk/CtSmzHZ5g6HEQk3vIkSczDdZp6NnmzWso29KeS
         idMAMHHXY5Cmf4S80leJjwd0aIk2nsAb31UOUhCLsz2niOQxFmFhq3aKdnjVJAE8xtbU
         TwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308392; x=1747913192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6YcWQUS/krFSoVF5ePsfXGO+e5W0vWFl3MyrWAJnzQ=;
        b=qiuVWgjctnmvIRsZou2nG/wQl5dPq+sQ2iziavwboMLGrybu7TvaFvRYcC6HH2nexl
         9LLoadjnXKqU5145NWtNhdC4UQOJ5qTD8UF0IqSZvdIzYRXdINpL4LbIlwCg7z8pJI9x
         BKZtXFG2RuX0zTyv5awvJqCUc0FUu1kGmarQ1ZhNNs+hOCm5JTutOOZLXv5DSm7mJHUP
         N/ylReIsh9oBISjRdwlxEGo41trhDQTMIAd/gkjwFFCfGpGrCkxXz4sJMcNA9dSfYe7d
         iHoVy5l8yK9FkOPI16hVId2FOF4CDtydfUBam0tLh5zSTi+mOetF1w1e+IfDiDGMlXKz
         xv7g==
X-Forwarded-Encrypted: i=1; AJvYcCX3G8MG0nABCqwu5yQhWehDsx2k+kTYA5twpchwZnZWIWhuYdueB25NVi6jvJKUEU1UmGBPdmSbQrIzuKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+NC0bj3B/opBF/W1CT/A/jj47fSIY1vtebB+7Zw1M06O/QQ/s
	ej96TkLUo+gv22dzDKOEyhdlTWnhZRT/z+nA+O9GWaQzfzclaiAK55UFo5pWHQ==
X-Gm-Gg: ASbGnctVO/YGBLECa6vZY4xORpg1ZG5tTab/8oG2UgRamDTi9X+JgYFEN2D+rllLkx1
	nS/PCKXF5UXJ9jfbR+9ZpzAqOHqz6LGHikn7q0JjGEYS0yZi2mcf/ozu+Iv94JPmt6Stjd3yGXp
	pvn3nkZwu+BR1h20/ObJF9tzCKU4BbNxzKjKSyC2qJrvNsyjFqIpl94YIDfbO/N9ExSXXVFsOQg
	JMPyZi0jcTxf2qQktdKaVDLzyXHKFB2RpxIz+qzLq8c5tgnvKbWJb/yuT2DmbNIrqkHCqk7FewJ
	VNwOIY21ITD5D/3P2X5k8zj/0Do0nsEmFpAMGOo8ymwEO2FWAYh/wfMgxeJClt7/lboncZBsCIX
	uP5qLi5Z9LW/EAg==
X-Google-Smtp-Source: AGHT+IEkCceAOB29/pB9CUmVZ8C8Si1ZbNqMfWkWxFcEkinM5zQ7dz5OaP8iyatRAtCIbSSJ7O2kkw==
X-Received: by 2002:a05:600c:3e12:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-442f96ecf1amr18446915e9.19.1747308392065;
        Thu, 15 May 2025 04:26:32 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3979355sm67419385e9.37.2025.05.15.04.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:26:31 -0700 (PDT)
Date: Thu, 15 May 2025 12:26:27 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	thippeswamy.havalige@amd.com, shradha.t@samsung.com, quic_schintav@quicinc.com, 
	cassel@kernel.org, johan+linaro@kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/9] PCI: stm32: Add PCIe Endpoint support for
 STM32MP25
Message-ID: <b5x4fayqm242xqm3rgwvrz3jywlixedhhxwo7lft2y3tnuszxr@3oy2kzj2of5l>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-5-christian.bruel@foss.st.com>
 <tdgyva6qyn6qwzvft4f7r3tgp5qswuv4q5swoaeomnnbxtmz5j@zo3gvevx2skp>
 <619756c5-1a61-4aa9-b7fb-6be65175ded2@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <619756c5-1a61-4aa9-b7fb-6be65175ded2@foss.st.com>

On Mon, May 12, 2025 at 06:06:16PM +0200, Christian Bruel wrote:
> Hello Manivannan,
> 
> On 4/30/25 09:50, Manivannan Sadhasivam wrote:
> > On Wed, Apr 23, 2025 at 11:01:14AM +0200, Christian Bruel wrote:
> > > Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
> > > controller based on the DesignWare PCIe core in endpoint mode.
> > > 
> > > Uses the common reference clock provided by the host.
> > > 
> > > The PCIe core_clk receives the pipe0_clk from the ComboPHY as input,
> > > and the ComboPHY PLL must be locked for pipe0_clk to be ready.
> > > Consequently, PCIe core registers cannot be accessed until the ComboPHY is
> > > fully initialised and refclk is enabled and ready.
> > > 
> > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > ---
> > >   drivers/pci/controller/dwc/Kconfig         |  12 +
> > >   drivers/pci/controller/dwc/Makefile        |   1 +
> > >   drivers/pci/controller/dwc/pcie-stm32-ep.c | 414 +++++++++++++++++++++
> > >   drivers/pci/controller/dwc/pcie-stm32.h    |   1 +
> > >   4 files changed, 428 insertions(+)
> > >   create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > 
> > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > > index 2aec5d2f9a46..aceff7d1ef33 100644
> > > --- a/drivers/pci/controller/dwc/Kconfig
> > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > @@ -422,6 +422,18 @@ config PCIE_STM32_HOST
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called pcie-stm32.
> > > +config PCIE_STM32_EP
> > > +	tristate "STMicroelectronics STM32MP25 PCIe Controller (endpoint mode)"
> > > +	depends on ARCH_STM32 || COMPILE_TEST
> > > +	depends on PCI_ENDPOINT
> > > +	select PCIE_DW_EP
> > > +	help
> > > +	  Enables endpoint support for DesignWare core based PCIe controller
> > > +	  found in STM32MP25 SoC.
> > 
> > Can you please use similar description for the RC driver also?
> > 
> > "Enables Root Complex (RC) support for the DesignWare core based PCIe host
> > controller found in STM32MP25 SoC."
> 
> Yes, will align the messages
> 
> > > +
> > > +	  This driver can also be built as a module. If so, the module
> > > +	  will be called pcie-stm32-ep.
> > > +
> > >   config PCI_DRA7XX
> > >   	tristate
> > 
> > [...]
> > 
> > > +static int stm32_add_pcie_ep(struct stm32_pcie *stm32_pcie,
> > > +			     struct platform_device *pdev)
> > > +{
> > > +	struct dw_pcie_ep *ep = &stm32_pcie->pci.ep;
> > > +	struct device *dev = &pdev->dev;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(dev);
> > 
> > This needs to be called before devm_pm_runtime_enable().
> 
> OK. Also and we must use pm_runtime_get_noresume() here.
> 

Yes!

> > 
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "pm runtime resume failed: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > +				 STM32MP25_PCIECR_TYPE_MASK,
> > > +				 STM32MP25_PCIECR_EP);
> > > +	if (ret) {
> > > +		goto err_pm_put_sync;
> > > +		return ret;
> > > +	}
> > > +
> > > +	reset_control_assert(stm32_pcie->rst);
> > > +	reset_control_deassert(stm32_pcie->rst);
> > > +
> > > +	ep->ops = &stm32_pcie_ep_ops;
> > > +
> > > +	ret = dw_pcie_ep_init(ep);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to initialize ep: %d\n", ret);
> > > +		goto err_pm_put_sync;
> > > +	}
> > > +
> > > +	ret = stm32_pcie_enable_resources(stm32_pcie);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable resources: %d\n", ret);
> > > +		goto err_ep_deinit;
> > > +	}
> > > +
> > > +	ret = dw_pcie_ep_init_registers(ep);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> > > +		goto err_disable_resources;
> > > +	}
> > > +
> > > +	pci_epc_init_notify(ep->epc);
> > > +
> > 
> > Hmm, looks like you need to duplicate dw_pcie_ep_init_registers() and
> > pci_epc_init_notify() in stm32_pcie_perst_deassert() for hw specific reasons.
> > So can you drop these from there?
> 
> We cannot remove dw_pcie_ep_init_registers() and dw_pcie_ep_init_registers()
> here because the PCIe registers need to be ready at the end of
> pcie_stm32_probe, as the host might already be running. In that case the
> host enumerates with /sys/bus/pci/rescan rather than asserting/deasserting
> PERST#.
> Therefore, we do not need to reboot the host after initializing the EP."
> 

Since PERST# is level triggered, the endpoint should still receive the PERST#
deassert interrupt if the host was already booted. In that case, these will be
called by the stm32_pcie_perst_deassert() function.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
