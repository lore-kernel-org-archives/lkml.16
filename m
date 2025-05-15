Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3929824F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308569; cv=none; b=aiXdtfPOkeb9yUBz7+6fTdKYhTjxKTzAkR4A5Bkf3/5AL0zd2+6e0uBPRtww2j28xHGNvUOcW4V+CL1E/dS6eHYPcsoBEtbefzszU2X9AS3WMvjqIgsBwO56Oa/vBoQ+dQGExByt/tdTjxrIVryn8SX9ehO1Ft5iFnfJGj4ZEeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308569; c=relaxed/simple;
	bh=nFtmckRpB0dUuxCAVojM9JULBIGVkNwbMXUo38KSfV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbwJeyUcas9zIokaAcEo8jLcl5qMdn0xouqX/SuM1JRoqYIQUUxR6uCjsnQFCEeIe9K6D8MCd9zHTMg7Quqo2Ew7PNVKPcKi73LLPTUHcmanB9BkdJosyMMSAkkaNByn8QlEpRVQhTbjlh/S37vxUgq2Bht2V/WMQ63L3+UV8LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nHZKEuMx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nHZKEuMx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so413639f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308565; x=1747913365; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFdj64C/cdI5aMQcMm0++S9r7ta1roUULL87nRUbXCo=;
        b=nHZKEuMxJU/c3U2mQ8QPSi8pwfpIdA9nhKPZTu3BI0/8pJhTTAJwHdT0N7n/woL5po
         03UW9gu4ZoRGdZSihjjULzDjcwhI8XYqCH+L9mFT27IO9jCmqc2pV8/UAr38gKPr9rUk
         JSaXcRbiJk/KC0cSz8RPayUBt8mqZp9ijW2+w7209+u299wjkx5MtIdYsE0TOp8wquJh
         HIq6C6gv1uSqjOUU9L57IbVCTfyV8PwRsdc/JljrzRl9yNfic35/1C4y0mYcNtdbblQh
         LKKrbUPpiwWrb7YvM+0MW63Crhp2JRe8PsA8gihqpo01uBykJnRdAqrAMpLtRTxl5E5K
         bI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308565; x=1747913365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFdj64C/cdI5aMQcMm0++S9r7ta1roUULL87nRUbXCo=;
        b=BQUMa/9g1FQUlhB/4THvhP+SXlaC8jquGYSMSuaoj5U6UyU1HTFgUSHjsSuu3jr8pL
         oIBgqFKUwIdAp5jXHwvCFJ9Pldi73Y8fzwwnjla+z0AKJH42q94XjCvtD1BmkSFfm+D9
         gADtgwur3Of4/9BWPhOdvU7zPho4lhH6G+sVWvUz4giXD88eYuiSUmJcNsqBBgFppUGd
         tJyDu1v6ZLR2iSRvdj/6l6yfjokbvfevA2dwQMsqIdDk/8sdFb5BDGgF6o+DXJQkdwuD
         Ge8WktCUuBtieRiM0ry8EXsI28ElRDFOn3z3za/+kQIoa3WllUBcTTjVGajL6bqtRcNO
         t6cw==
X-Forwarded-Encrypted: i=1; AJvYcCV1hEuL7FDQLfS3MCYuWVMGCAP1SSjHuwVvN8a4F81mjs/Y1Vvw21C0WHAIAOZruhoiRIzl9oMOH/2mzlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7g1bnPofn5PWxlCOxXx51We/5MLJPg8S4riDUFKRRY6od3Mtp
	v77VyU5/miQ20cO7jKmi1OVHEiaydbWNO5lZXJuy+55aFmxaC1uVuFVq/qxGeg==
X-Gm-Gg: ASbGnct0dcGJPxBnRkDN9evEOFoZ+/5VAuJRles2ueEsKrmdFtNBtrlOwOZJvHpVeVB
	M/hwdyy1gxR2o7WGbViAo5i34OZbWb36eRftHBtDdS1DElN2yTj7c0wQ7twR2a10+rnZCrn9hud
	SNWWQvsc0aaftRygCIgjeEZK/TAdC2aw5i7T1nwHrlk5K7/yURlS7qQ7hQAiTKfcTvrBhpIlqcH
	aPdRyjPaCI7OG14AcePUs7wXgTISuG1nMiHgw5feGvhYeoQQVY4Jr7CvVhhSE2euyivzo5N89wH
	JsSUGaR1pFMgowhH/T11FFfKqVYDzUIwM4xyvD9yepLyvnUYvrLHIqSW0eXRDc1O1kEGgp66jWf
	u4UvT/xbapcA5XttCOJYYDH5m
X-Google-Smtp-Source: AGHT+IFamW2RPKGKJfE+U6UvXP5DVtS58juDRGBK81mdENW8tAkGVKABiwtzg+vRMFYjw66L5CqtcA==
X-Received: by 2002:a05:6000:2088:b0:3a3:55e6:eaaf with SMTP id ffacd0b85a97d-3a355e72142mr1087194f8f.24.1747308565358;
        Thu, 15 May 2025 04:29:25 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de087sm22731199f8f.16.2025.05.15.04.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:29:24 -0700 (PDT)
Date: Thu, 15 May 2025 12:29:21 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	thippeswamy.havalige@amd.com, shradha.t@samsung.com, quic_schintav@quicinc.com, 
	cassel@kernel.org, johan+linaro@kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/9] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
 <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>

On Mon, May 12, 2025 at 05:08:13PM +0200, Christian Bruel wrote:
> Hi Manivannan,
> 
> On 4/30/25 09:30, Manivannan Sadhasivam wrote:
> > On Wed, Apr 23, 2025 at 11:01:12AM +0200, Christian Bruel wrote:
> > > Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> > > controller based on the DesignWare PCIe core.
> > > 
> > > Supports MSI via GICv2m, Single Virtual Channel, Single Function
> > > 
> > > Supports WAKE# GPIO.
> > > 
> > 
> > Mostly looks good. Just a couple of comments below.
> > 
> > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > ---
> > >   drivers/pci/controller/dwc/Kconfig      |  12 +
> > >   drivers/pci/controller/dwc/Makefile     |   1 +
> > >   drivers/pci/controller/dwc/pcie-stm32.c | 368 ++++++++++++++++++++++++
> > >   drivers/pci/controller/dwc/pcie-stm32.h |  15 +
> > >   4 files changed, 396 insertions(+)
> > >   create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
> > >   create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
> > > 
> > 
> > [...]
> > 
> > > +static int stm32_pcie_probe(struct platform_device *pdev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie;
> > > +	struct device *dev = &pdev->dev;
> > > +	int ret;
> > > +
> > > +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
> > > +	if (!stm32_pcie)
> > > +		return -ENOMEM;
> > > +
> > > +	stm32_pcie->pci.dev = dev;
> > > +	stm32_pcie->pci.ops = &dw_pcie_ops;
> > > +	stm32_pcie->pci.pp.ops = &stm32_pcie_host_ops;
> > > +
> > > +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
> > > +	if (IS_ERR(stm32_pcie->regmap))
> > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
> > > +				     "No syscfg specified\n");
> > > +
> > > +	stm32_pcie->clk = devm_clk_get(dev, NULL);
> > > +	if (IS_ERR(stm32_pcie->clk))
> > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
> > > +				     "Failed to get PCIe clock source\n");
> > > +
> > > +	stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
> > > +	if (IS_ERR(stm32_pcie->rst))
> > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
> > > +				     "Failed to get PCIe reset\n");
> > > +
> > > +	ret = stm32_pcie_parse_port(stm32_pcie);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	platform_set_drvdata(pdev, stm32_pcie);
> > > +
> > > +	ret = pm_runtime_set_active(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to activate runtime PM %d\n", ret);
> > 
> > Please use dev_err_probe() here and below.
> 
> OK, will report this in the EP driver also.
> 
> > 
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = devm_pm_runtime_enable(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	pm_runtime_get_noresume(dev);
> > > +
> > 
> > I know that a lot of the controller drivers do this for no obvious reason. But
> > in this case, I believe you want to enable power domain or genpd before
> > registering the host bridge. Is that right?
> 
> We call pm_runtime_enable() before stm32_add_pcie_port() and
> dw_pcie_host_init(). This ensures that PCIe is active during the PERST#
> sequence and before accessing the DWC registers.
> 

What do you mean by 'PCIe is active'? Who is activating it other than this
driver?

> > And the fact that you are not
> > decrementing the runtime usage count means, you want to keep it ON all the time?
> > Beware that your system suspend/resume calls would never get executed.
> 
> We do not support PM runtime autosuspend, so we must notify PM runtime that
> PCIe is always active. Without invoking pm_runtime_get_noresume(), PCIe
> would mistakenly be marked as suspended.

This cannot happen unless the child devices are also suspended? Or if there are
no child devices connected.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
