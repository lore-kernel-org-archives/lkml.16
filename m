Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210C20408E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605059; cv=none; b=qjm3BR+u5KjAGvkcBTM9s76BQC3t9r0mSm33D78RdaiBpp21wW/MXzwbqMLFpirGaAwtXHTpLD2Urefbpctam9nsn5SZJaAjztoscClqbN8Lf3sYrx3IpGXGBZww8GKKTQjiEl3r5NToBSoISvyAgZhyAN2ZZv8gsR2Vb/n4y88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605059; c=relaxed/simple;
	bh=msjrMOhVFQTam8LsHvWU02Q7S8Fw/6DL11BmDJK1/qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4ICU5TWFpwMkEyYQzhuCpqMvRY2myY1TeUsYmNmOA8JZ8K2O0qJvLptK6C4ZzlDsFAvt1tnP1eOq2m47fRoCsgJj4w/+PwOvAmscRv0lIEPNITpamtUKvF8hfqPuu15o8NO/mWd5FNR8ofQvFsgvxKVqXwZCObM2trbpM0XFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oVQfA6Ba; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oVQfA6Ba"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216426b0865so81067855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738605057; x=1739209857; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=;
        b=oVQfA6Bafwte0SBnh7jXmZtctoNtdBPDXZ1sXm7pzV8qdu3gEqPcM0fzNrSToaxtGQ
         qPlmXnw+alLb0RCmSQRj2ZdHUaUvY1SwdgNUJ5bV0+76VSbSorZre8Y4M8HJEdb1cUHe
         neYaxS8lhmyq+GpZvXgEU1mjf5AIoK055dKG3Bmnf/vEecCs6ZY6nX2QolwnQnRFTUwn
         i8+G4OZAW7XN3Fhkdf2Vfklk2xrMEALhbUjnhj6sv2fcZpNkhHr5w2fZ0LLGyvzH84IO
         VT/hDCWcb/15R7sycsomMwCueu1KKBOd6aG8yI0UeKhlGHx25k+U3Efyctap2CHO/zF3
         IpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605057; x=1739209857;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=;
        b=m0IOpVQ+60SlxKj6wAvPx0708/vRyp7WBxC+EIrHEGn4Dshef0x7a7ZwGoie6oCcsR
         PWw5/QK9+sT1olzoes5zYZENiQwqJ/n/UqLcothP23gmJR19BjrjbnNhUvXMrOFU9s1a
         ZNQN/Oo7KwGmTEqJn5LqYRr/27Y4Q1jBOeP6h4S6HxLgakfJ/Z5AoQEhaEZc0aw+Xoai
         GqFv8RhEKL9rhQVRAKMnwoz7ZCXjsd7D5wBjqeudd6NhStluNgzTbygfaLC3LkEuzZ9M
         AQSXfSug4tJtnpPobsveeLVtXInRgD/xI1Zsj3HRLmTom0j3w0ySymUdy0zI9Ye2XNj5
         FS4A==
X-Forwarded-Encrypted: i=1; AJvYcCWyMmjrMX92vndqKyDOvMNSOOmPjc22DawiVw7V47pzB6D80w0jTRuQBjwqxjPmjWR/4Aoy76nnf6XGUFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOp2c7q2Q/E5Bab9laYKaDduMD1171il+pTZ23kFBIxKOYJp0z
	3Yq9KgcJvUbnsRgUJWZkebo6J+5BTvC8MJaSziczcxn212wwTN2pNMlTE96IRQ==
X-Gm-Gg: ASbGncu6oPsHg9AZ7AkK5wYAjzbXitSek4phNF0/xiVg23HylLtEpmZLjW+vpi681H0
	AcFqYwgDeODkOEDxsisnQwkzVFoUxjRHPjeWPFSbSCHKHREr1WvwCGk6IG24wGJoDJn8BQbRdOP
	WjtwnI56WD8D3m8QElp8C84dtXuo8wZlEUR3udYoNSEmSZkoWy42ZW5K9p2GZ21IfMQE39qI2Sc
	F7VRaGPtDvPH7lYQ7WvhhN/cosTi8459RDPEioaWVsQaygFci+ft/Lrltn/T370xMh5W85kbaEY
	IwZKhuJDic71QIrvJ8SGSGW3SQ==
X-Google-Smtp-Source: AGHT+IELooHF0qMvKyeOA5tLJ+3Ezf8GfLZEZvxarJoUbgD+ShYJqVXPzWfrjpSpkcyIBau0pRT4fw==
X-Received: by 2002:a17:903:2a85:b0:216:7ee9:2235 with SMTP id d9443c01a7336-21dd7dff6aemr371780435ad.43.1738605057004;
        Mon, 03 Feb 2025 09:50:57 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f03edsm79348895ad.45.2025.02.03.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:50:56 -0800 (PST)
Date: Mon, 3 Feb 2025 23:20:49 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250203175049.idxegqqsfwf4dmvq@thinkpad>
References: <20250201162416.azp4slqqeabo2xyl@thinkpad>
 <20250201170740.GA731664@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201170740.GA731664@bhelgaas>

On Sat, Feb 01, 2025 at 11:07:40AM -0600, Bjorn Helgaas wrote:
> On Sat, Feb 01, 2025 at 09:54:16PM +0530, manivannan.sadhasivam@linaro.org wrote:
> > On Mon, Jan 27, 2025 at 06:41:50PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> > > > On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > > > > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > > > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > > > > when
> > > > > > building on some platforms.
> 
> > > > > >       snprintf(name, sizeof(name), "port%d", slot);
> > > > > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > > > > name);
> > > > > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > > name);
> > > > > > +     if (!regs)
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     port->base = devm_ioremap_resource(dev, regs);
> > > > > >       if (IS_ERR(port->base)) {
> > > > > >               dev_err(dev, "failed to map port%d base\n", slot);
> > > > > >               return PTR_ERR(port->base);
> > > > > >       }
> > > > > > 
> > > > > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> > > 
> > > I think this still assumes that a CPU physical address
> > > (regs->start) is the same as the PCI bus address used for MSI, so
> > > this doesn't seem like the right solution to me.
> > > 
> > > Apparently they happen to be the same on this platform because (I
> > > assume) MSIs actually do work, but it's not a good pattern for
> > > drivers to copy.  I think what we really need is a dma_addr_t, and
> > > I think there are one or two PCI controller drivers that do that.
> > 
> > I don't see why we would need 'dma_addr_t' here. The MSI address is
> > a static physical address on this platform and that is not a DMA
> > address. Other drivers can *only* copy this pattern if they also
> > have the physical address allocated for MSI.
> 
> Isn't an MSI on PCI just a DMA write to a certain address?

That's from the endpoint prespective when it triggers MSI.

> My
> assumption is that if you put an analyzer on that link, an MSI from a
> device would be structurally indistinguishable from a DMA write from
> the device.  The MSI uses a different address, but doesn't it use the
> same size and kind of address, at least from the PCIe protocol
> perspective?
> 

Yeah, but in this case the address allocated to MSI belongs to a hardcoded
region in the host memory (not allocated by the DMA APIs which will have the
region attributed as DMA capable). So it doesn't belong to the DMA domain, and
we cannot use 'dma_addr_t'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
