Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A2219E99
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875738; cv=none; b=GcYW9lRFDnpEjsr5hEh5YIUWD+0JfP+oBIL3VMKguM6eiUN3bX5JmX8cxmF7Hpbwi8bYgyNo/PtM9JTIcraOwpTc/LDAo91MNYFlX0kylNW5Tpd3ynKtLPIntLs/ikmCDI1pelvyEbl9aLkn9CNW11eoF8e5h6RCz5lwkfsXna0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875738; c=relaxed/simple;
	bh=mVQwtEZSIlgHa/mm1mmUYoeDx30+E8QTcMPkDxPlNF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxsITIIbQVd48gwBe+9Ycm1x8XBHV4CqwqGvEnc03pwLQdriUp3ZRJciwnQUzqsIUNsG+KCXy8aO7XmaGaLzhTMkNCVsSi1BwjHxttVCSuCHW2RCgRz2yOckF/RC42zEXeDcRuCN1ypk0Z9QhPd/wKwj9EgZdsXAlDytxTu8tsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQqR4Pm8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQqR4Pm8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22401f4d35aso6025115ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875735; x=1745480535; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eDgB7wJ22ie3HmeLXVm86GHefERwHEPMmaPgZUtFTeM=;
        b=wQqR4Pm8rBZKdlxXyseRgKtd9U9JpvKFaxiVpgCLU69FG7KhNy3kcP064s6ki0Cabx
         H3nhgMN3CavkbM0vZ7svGG+PzM4ZLYWrVwNOz7OvR4KLKbMcOs/r8IMyumx+MJL5xa2h
         B7s7sCeZGLgfKdh0KWN5LXfqzfHSmYwYp1drtgqYeELQVcyk5PvKv2qDZfQWcXCkdGf8
         K47PsP2JXVDe7YjntJMr5OgyHcR8hWbCu0A27Qto6czighlnSyqIsoZOdEJra60xtudP
         8+90v6WsznqbIFsIbmQZrKki8WdDv7E3kzTJd4Uk8iuMtfsM/NvC/Tyk6o67AVJVg/Bw
         G+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875735; x=1745480535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDgB7wJ22ie3HmeLXVm86GHefERwHEPMmaPgZUtFTeM=;
        b=EzQ20x0eJbbv4WIdXPW6LnjaPfzbDGpJRVvnCn16BSgUdltcdYXucm++K4XpQOtC1l
         S4YukaSmOngsizSTNVAa7cZzXRd44iG2Z9ca9GuUvBc3YcFx6QRTEEpWmWsp/FyEJoTa
         9reHS85F1W6nOaWbTzEuWJiAUAFH1DqLZ4+Gn7xlrkpmH7pial5pmMSHEuwiJcNzOMs4
         km4Be8vqnnGYtXG1zw3agYZ0qWCXNIa4+AFQVEOY8JI2HznhNtArQVCfoxiujQTtwWPW
         pUIGC8Gx3m+5I2rXsr6xF/NXUBZcZRVei0JUJolkdJqv20f4sP8tD+N3KaceZm7u2h3F
         FysA==
X-Forwarded-Encrypted: i=1; AJvYcCWJW0yLP47FAOcXOxOVXFyh/C1zqMOLD43jsvkUOwE80yIAydXccc/wChP5WWisZbQDWWrNdetv9BdXqaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiKpPbmy1M4biG98DpypoSxnukv2v/siViSN28YeIY+hlsvWBb
	GyDxvHeo+UIDkkSIltbCdDxAVVTf/rk8hiJ4DKx/Xqm8p/dXdqhf9RaoypVgsQ==
X-Gm-Gg: ASbGnctdqta3n+CJMmoJ5ek/rba3WCprm6Iv8aVdihTA0msI5Sq8uy3x5Y1jCFAbUoa
	J1tmEPv/0u0gQUMvEDjA5xSael9VCFuod3iZYe9TWY9I0+AUdYx0DT7+rnQ8PX3beLfltsCWWv5
	M0IAk1PdCTIRg8Ap8C4Ds+VGXIFvDq2ZHZYqLXCb632s0rgoQ6c0N+R3Thbs5J0vz14j4jVgz36
	x02uO0lEaCXuWLHgOixNZbxKafqd+xsJqf6H6RCyPhXqgek5B0t6uZso+JG2pSZJIxS/van3AY7
	IL9Dj2mTFc7IuSPsPNC0PwR+5So2Ngx47ccameO0euNjxGIlLCjQRj6NlZY=
X-Google-Smtp-Source: AGHT+IG/Yi/qk4YGrJvgZRoRnXd14pk5pi5diwpsqtszPlC13bqbgZFlocoYN6rPXNF0yZn07MCGQQ==
X-Received: by 2002:a17:902:dacc:b0:223:35cb:e421 with SMTP id d9443c01a7336-22c35985d1dmr68962035ad.49.1744875735660;
        Thu, 17 Apr 2025 00:42:15 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3e0e19d2sm15264935ad.91.2025.04.17.00.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:42:15 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:12:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <doyt4kcaffgjm5u5notcjnqur7ydim3dpo4se5em2an36wa3rp@xzntx4sa47dl>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <Z__hZ2M8wDHn2XSn@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z__hZ2M8wDHn2XSn@wunner.de>

On Wed, Apr 16, 2025 at 06:57:11PM +0200, Lukas Wunner wrote:
> On Wed, Apr 16, 2025 at 09:59:05PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > --- a/drivers/pci/pcie/err.c
> > +++ b/drivers/pci/pcie/err.c
> > @@ -270,3 +270,30 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  
> >  	return status;
> >  }
> > +
> > +static pci_ers_result_t pcie_do_slot_reset(struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	ret = pci_bus_error_reset(dev);
> > +	if (ret) {
> > +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		return PCI_ERS_RESULT_DISCONNECT;
> > +	}
> > +
> > +	pci_info(dev, "Slot has been reset\n");
> > +
> > +	return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +void pcie_do_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (pci_is_root_bus(bus))
> > +			pcie_do_recovery(dev, pci_channel_io_frozen,
> > +					 pcie_do_slot_reset);
> > +	}
> > +}
> 
> Since pcie_do_slot_reset(), pcie_do_recover_slots() and
> pcie_do_recover_slots() are only needed on platforms with a
> specific host controller (and not, say, on x86), it would be good
> if they could be kept e.g. in a library in drivers/pci/controller/
> to avoid unnecessarily enlarging the .text section for everyone else.
> 
> One option would be the existing pci-host-common.c, another a
> completely new file.
> 

I don't like introducing a new file, so I'll make pci-host-common as a common
library for host controller drivers and move this code there.

> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -966,6 +966,7 @@ int pci_aer_clear_status(struct pci_dev *dev);
> >  int pci_aer_raw_clear_status(struct pci_dev *dev);
> >  void pci_save_aer_state(struct pci_dev *dev);
> >  void pci_restore_aer_state(struct pci_dev *dev);
> > +void pcie_do_recover_slots(struct pci_host_bridge *host);
> >  #else
> >  static inline void pci_no_aer(void) { }
> >  static inline void pci_aer_init(struct pci_dev *d) { }
> > @@ -975,6 +976,26 @@ static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
> >  static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
> >  static inline void pci_save_aer_state(struct pci_dev *dev) { }
> >  static inline void pci_restore_aer_state(struct pci_dev *dev) { }
> > +static inline void pcie_do_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +	int ret;
> > +
> > +	if (!host->reset_slot)
> > +		dev_warn(&host->dev, "Missing reset_slot() callback\n");
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (!pci_is_root_bus(bus))
> > +			continue;
> > +
> > +		ret = pci_bus_error_reset(dev);
> > +		if (ret)
> > +			pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		else
> > +			pci_info(dev, "Slot has been reset\n");
> > +	}
> > +}
> >  #endif
> 
> Unusual to have such a large inline function in a header.
> Can this likewise be moved to some library file and separated
> from the other version via #ifdef please?
> 

Sure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
