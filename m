Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706FB3A1BA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701663; cv=none; b=j22wzwR4KEyh6b//Q65r2tbzxQLteGiOEfADTMiOUM6ChdjxysLcJMlYjpso00JjsudAoHK7K1uzR86sI7meZNBW1olq5sShfhH6jYMgRPiBHRWpRzERVtpc/ZVA8duWbl2D+/XJFCT9V+2B+KHiett46TRNBuANtdhWY6Znqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701663; c=relaxed/simple;
	bh=GEfBOA45QlWfcWHD5yzJuDstvply4eSmwqKjrGpmXUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iE3CoHvQP80sDWnRMB8Q4Yp1Fv71DSU64DefzfhYU0lu4pEB5F7efqUcimIe/mh0+hhwBKzKFLARgVnUx89ILYzYtP6UYZWFEqzYbDagyJz+jgqUr0vtNAEDPohPKWufmmBK8Ys4coyByHeRRjYU/ReDkSx8GR2D5c0PpVBhQAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrlNFjZ9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrlNFjZ9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fd89d036so62568645ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701660; x=1745306460; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XCNk9Rod1k+bgkwurUtIjlivzVvS2RJvCje5WjdRCTk=;
        b=qrlNFjZ9sCrJXI5cTQdCR+/laEgXYSV2r1Oauzx4cOKoNxLJMdG2zoZQRY3WMjlDQ3
         g4b9Br9o2of0QLOj/83VooUXEWSw4C1Bd19kf27waStgRxki4DAS68TJ7qEGpZqbPEBz
         GHloJdpnRVFRhjIkYQyoE+A2zLatJqk4bdrd1i2Z93bosZyc6Cu9RhcsenaW70Zo//oV
         dh9ovl+BxInOQwagNk5bQ5ORACw01eAplZAJ+wIE8ybIGlakUIQTaa37sTwEu3BP49vC
         7mASa1tSyi+mGGRRSVTqriPEJcBX3xJSbYlxthqY2FmVAxb1RdHBdli37bP2NeeGAZDx
         PxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701660; x=1745306460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCNk9Rod1k+bgkwurUtIjlivzVvS2RJvCje5WjdRCTk=;
        b=uGFDgAV9U/7WmWyQMzo93dbY7tVabXKnS6wUQOLlQ580jNvYO/LmOnUEgq13po+CVQ
         wmoT3kMbJODN31PQ2/7XMQi7yWS2hLR2fpgURDU0I6KGLStO3XQWbXmkjfFnAlmssOI0
         FJePyBVqHv1h9Tfcz+/e1apFSTVIRhzIVUm/gcCoIaXd9Oy7IzFQzfdfyL+y6EE3Vyes
         9XvIGY7vPyBXEfmQjbLv+qVf/LXyBaqZAdT3rl+owVBwvDoX0JcKTGr0Srph1QU4COWP
         Ndv5FBZrD0vPsgNSNdrmkQciQKTFb32sowFgeE9i+HPvwQsltO5dW4quzU/rJ+TLkbf1
         4snA==
X-Forwarded-Encrypted: i=1; AJvYcCXNF7a/4kHlRja4QEPqfApbEgM3dVz+h3adXxnPW38ze5l/hCjWg4T+8pcct6x2pp3BKmEWjSi8dbKkxeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8uhTIg2NCG5yviTxbB2z1v7fqLKL+4zqwOMjlAlcxSqnQWfp/
	lQV9+P4G0ITKke917wQLHHS4XyJC1cehxl1eLZHClZTxGMtIIfHAudPHWYeOZA==
X-Gm-Gg: ASbGnctNcm9nnobBgr2MD05f2JrUDpC89SIXNQmEZROx9nEs2w4McqtTrPvaAP8YeN+
	n/0/IisqyfH5GoBZk1D/PTR92lbFuVh+ebrN8nT8v1VWXg+46uIDvO5/0EDpgX6wnGBw9n59C5E
	Y45naGwi+n7Ep5WAg1Av8S9NA128Odvjqn3vpWmOY/QFcuPzx6gKfX62W+GM2LZewv7ZQ2dhn9G
	U1yFAkjISJSLiyPr5BVxj9Giflj6kbirTf7suF+NSTn08heisoXE92EIPS2cJkRY6xrbVykzEEz
	Do3LIFP42bRSVQGDmUSChXesLwQcT952Kvrxi3BFbZkDyGnuHrcLKQCBZ58O
X-Google-Smtp-Source: AGHT+IHwx8NytA4HfmHYqY+ucueZxWfnA77QXqfaKsQqKRz4c9hbWsTrqA2PwtFUSZmcoIQDMTuTwQ==
X-Received: by 2002:a17:903:1b6f:b0:224:c47:cb7 with SMTP id d9443c01a7336-22bea3f02aemr222574665ad.0.1744701659806;
        Tue, 15 Apr 2025 00:20:59 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cddfaesm111157005ad.257.2025.04.15.00.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:20:59 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:50:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <3wmkjmutepc2s2ookc3ces4eyxe6morhhwxzlpup4mkkoy5ocx@py6h36upgl75>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-7-hongxing.zhu@nxp.com>
 <uqrhqkmtp4yudmt4ys635vg3gh5sibhevu7gjtbbbizuheuk45@lhxywqhtbpak>
 <AS8PR04MB867619A464E923655EDEF4878CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB867619A464E923655EDEF4878CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Mon, Apr 14, 2025 at 03:16:46AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月13日 23:33
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
> > PCIe
> > 
> > On Tue, Apr 08, 2025 at 10:59:29AM +0800, Richard Zhu wrote:
> > > Add PLL clock lock check for i.MX95 PCIe.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 28
> > > +++++++++++++++++++++++++--
> > >  1 file changed, 26 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 7dcc9d88740d..c1d128ec255d 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -45,6 +45,9 @@
> > >  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
> > >  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> > >
> > > +#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
> > > +#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
> > > +
> > >  #define IMX95_PCIE_SS_RW_REG_0			0xf0
> > >  #define IMX95_PCIE_REF_CLKEN			BIT(23)
> > >  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> > > @@ -479,6 +482,23 @@ static void
> > imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
> > >  		dev_err(dev, "PCIe PLL lock timeout\n");  }
> > >
> > > +static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie
> > > +*imx_pcie) {
> > > +	u32 val;
> > > +	struct device *dev = imx_pcie->pci->dev;
> > > +
> > > +	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
> > > +				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
> > > +				     val & IMX95_PCIE_PHY_MPLL_STATE,
> > > +				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
> > > +				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
> > > +		dev_err(dev, "PCIe PLL lock timeout\n");
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)  {
> > >  	unsigned long phy_rate = 0;
> > > @@ -824,6 +844,8 @@ static int imx95_pcie_core_reset(struct imx_pcie
> > *imx_pcie, bool assert)
> > >  		regmap_read_bypassed(imx_pcie->iomuxc_gpr,
> > IMX95_PCIE_RST_CTRL,
> > >  				     &val);
> > >  		udelay(10);
> > > +	} else {
> > > +		return imx95_pcie_wait_for_phy_pll_lock(imx_pcie);
> > 
> > Is this PLL lock related to COLD_RESET? It doesn't look like it. If unrelated, it
> > should be called wherever required. imx95_pcie_core_reset() is supposed to
> > only assert/deassert the COLD_RESET.
> > 
> > If related, please explain how.
> Thanks for your kindly review.
> To make sure the HW state is correct to continue the sequential initializations.
> The PLL lock or not check would be kicked off after the COLD_RESET is
>  de-asserted for i.MX95 PCIe.
> So, the PLL lock check is added at the end of de-assertion in
>  imx95_pcie_core_reset() function.
> 

But imx95_pcie_core_reset() is not doing anything for deassert other than
waiting for PLL lock. Hence my question.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
