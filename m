Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1D192590
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950591; cv=none; b=C+s+lpPV6AA0S6E2fKOATmEh1xWVdzVDySBIM63H6gqCMOtAif+bgq4Yq9KNR0k/gBWQiwwAUNrsv5NTXFwGi/TiGFb2eN0locaSd63uDpflXcj9nVH52ecFbqrS3N+5ZHPh0BKPZVrKt5vMZWnzz2/CtjdeXbeNQQUBaYdZ500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950591; c=relaxed/simple;
	bh=OjHf0/La6zmx4FAbdAnxgighWHZDuLFxwPxDymnae2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoFqmvmMhFi/Ollp1QU4FPs2oAzZhdc2VAo+fMFYkac3AYkRR8CqA5nJKCDiygfDyr5sQXzbtxijbiKM7R3FanNAxIp3QNZqjNALkfYF12Ihs+mU6NKeyXUIQ0uVZ+9UQseiDLGTLxrJyTyzjQQSc2QBvDfNykL3CNpvYgt6PCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=etM+490N; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="etM+490N"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f4500a5c3so39859245ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738950589; x=1739555389; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ueL8uhdRjf52HSBhlGadO+O+QftLnA6FgREnqVSmz0=;
        b=etM+490NN9p12nFXzw29ymoF8JE8Y9ga99SBrjuc+HxWrBjTdXgU/BsjShDJp84shc
         BIMWmjJXva7ruuH478MI7cTkj6bv3E7h0n5e2kvbfwcTonEAn2QvwWOjNsMvoTVTvxgB
         w+HHHBySYTz61U2sRPnhtaSp25AJXNtQkpZ2Yvgr0h8IJejP0yXLpXYiVYCS+plIlHKi
         PUZcVGI819TxTEpjdwJld0ciq/8wyhuiCIP8GpI2aYEklghJSm46QeQEOijYAxWQFOKe
         w6Ykmbvfr5MDQMHDjNVtkGrNPSiQKyeldLSojG67HoSJN8uvJfMY6t+GcPxfJ2HsSsJ2
         OAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950589; x=1739555389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ueL8uhdRjf52HSBhlGadO+O+QftLnA6FgREnqVSmz0=;
        b=wTDMZ/egLPmCcs1mlewTD424YMkDR9C3FtzGbHtj0P+WPbRUTI9CIKjoghG2FQ5skw
         JRXmN/Suez1xUEmOiRB1JpD/4Yf74vcOLYD0Rh6Qf8E2dZ3wa8c156DGg6fHZoKg2L3Z
         NXstyrmSiq0LIS0qaLyTSDGCu6VCLCnRuB9EHUCqqsLu1Va8DEM0Xdq0Mvat1tsGj9Xc
         HJwjnCpzXrrwT/W+9vxQWNHOV7N8txd0E0jylCUZRrlbNM8HaCv143Lt4z8UJY9aUYEH
         RMXApmwit7T+dLX0NaKru4zSX4R3RhE/oZs86RLb4hCTTVDAJF5wDNJ6ji1Gd0wnp5xc
         Zz1w==
X-Forwarded-Encrypted: i=1; AJvYcCWTgjmHt5fpq1b9wSautMAPltu45+vukzhIng9CqIFtXEIkR23c9R5SN6KXe36uOFV2d9ILakAsJc58ViA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpISd5ji3XwLnf6UFCxkf9aoVDcAN10xlaTajF3bmOFqaJoJga
	dT5N03cuzzcBuapYlWaSvo8sKN0j1WvYnjx+Ffv9F9X68WsxotOu7hJOGQJhLA==
X-Gm-Gg: ASbGncs1d7WGC6sJvhvzLypTbKX0s97kdgkTH5df7VyF0ZoszSFUAC7BSixeqBDu398
	YQVioifFS2t2WAgMb7d1ZR0aGDU2Cm6dF1ZfbR0J2781Gw7KsUH9OoLIKefD3qnjKWGgP1fNItz
	5lYnWzRFYNZ+hMlhT9w9+szNS7jmnIfYlhv86xSp23E2yKQOpuF+UK+OwaqUKZd0rnMsC8DA6rg
	W+aSY17savx+BibjW5ZX7lD7gY396xF6rnw6p+eTzFTPTW3tSuTmu9UAfDZ8KrXk6/5/TpUGc7t
	rBeGcTQq3q/o2uj7C+pn4bTjpA==
X-Google-Smtp-Source: AGHT+IE6OgQOwi69kOmyTP+cvlnuvv/NziCa4NqzRul258V7kLWTeAlJ+6B/WB+eU+A9dOCwtErZPw==
X-Received: by 2002:a17:902:e74a:b0:216:4064:53ad with SMTP id d9443c01a7336-21f4e7ed222mr70009195ad.48.1738950587991;
        Fri, 07 Feb 2025 09:49:47 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36541c36sm33757455ad.63.2025.02.07.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:49:47 -0800 (PST)
Date: Fri, 7 Feb 2025 23:19:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
	kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
	lee@kernel.org, lpieralisi@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com, helgaas@kernel.org
Subject: Re: [PATCH v3 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <20250207174939.w2e2bdvvcmqojlse@thinkpad>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <ddedd8f76f83fea2c6d3887132d2fe6f2a6a02c1.1736923025.git.unicorn_wang@outlook.com>
 <20250119122353.v3tzitthmu5tu3dg@thinkpad>
 <BM1PR01MB254540560C1281CE9898A5A0FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
 <20250122173451.5c7pdchnyee7iy6t@thinkpad>
 <86msfhviek.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86msfhviek.wl-maz@kernel.org>

On Thu, Jan 23, 2025 at 12:12:03PM +0000, Marc Zyngier wrote:
> On Wed, 22 Jan 2025 17:34:51 +0000,
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > 
> > + Marc (for the IRQCHIP implementation review)
> > 
> > On Wed, Jan 22, 2025 at 09:28:12PM +0800, Chen Wang wrote:
> > > 
> > > > > +static int sg2042_pcie_setup_msi(struct sg2042_pcie *pcie,
> > > > > +				 struct device_node *msi_node)
> > > > > +{
> > > > > +	struct device *dev = pcie->cdns_pcie->dev;
> > > > > +	struct fwnode_handle *fwnode = of_node_to_fwnode(dev->of_node);
> > > > > +	struct irq_domain *parent_domain;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	if (!of_property_read_bool(msi_node, "msi-controller"))
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	ret = of_irq_get_byname(msi_node, "msi");
> > > > > +	if (ret <= 0) {
> > > > > +		dev_err(dev, "%pOF: failed to get MSI irq\n", msi_node);
> > > > > +		return ret;
> > > > > +	}
> > > > > +	pcie->msi_irq = ret;
> > > > > +
> > > > > +	irq_set_chained_handler_and_data(pcie->msi_irq,
> > > > > +					 sg2042_pcie_msi_chained_isr, pcie);
> > > > > +
> > > > > +	parent_domain = irq_domain_create_linear(fwnode, MSI_DEF_NUM_VECTORS,
> > > > > +						 &sg2042_pcie_msi_domain_ops, pcie);
> > > > > +	if (!parent_domain) {
> > > > > +		dev_err(dev, "%pfw: Failed to create IRQ domain\n", fwnode);
> > > > > +		return -ENOMEM;
> > > > > +	}
> > > > > +	irq_domain_update_bus_token(parent_domain, DOMAIN_BUS_NEXUS);
> > > > > +
> > > > The MSI controller is wired to PLIC isn't it? If so, why can't you use
> > > > hierarchial MSI domain implementation as like other controller drivers?
> > > 
> > > The method used here is somewhat similar to dw_pcie_allocate_domains() in
> > > drivers/pci/controller/dwc/pcie-designware-host.c. This MSI controller is
> > > about Method A, the PCIe controller implements an MSI interrupt controller
> > > inside, and connect to PLIC upward through only ONE interrupt line. Because
> > > MSI to PLIC is multiple to one, I use linear mode here and use chained ISR
> > > to handle the interrupts.
> > > 
> > 
> > Hmm, ok. I'm not an IRQCHIP expert, but I'll defer to Marc to review the IRQCHIP
> > implementation part.
> 
> I don't offer this service anymore, I'm afraid.
> 
> As for the "I create my own non-hierarchical IRQ domain", this is
> something that happens for all completely mis-designed interrupt
> controllers, MSI or not, that multiplex interrupts.
> 
> These implementations are stuck in the previous century, and seeing
> this on modern designs, for a "server SoC", is really pathetic.
> 
> maybe you now understand why I don't offer this sort of reviewing
> service anymore.
> 

Ok, I can understand your pain as a maintainer. I'll try my best to review these
implementations as I have no other choice :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்
