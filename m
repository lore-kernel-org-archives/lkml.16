Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DD123956D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862031; cv=none; b=EwcmS+/Bgp1dIQCaDkzu3Erv4M1JYC9m28HXP7KDPpOkTrmnRO70bL1degwHBwxGzFqovE+RhmXLXWeKDO75RzxubMXsW/WQepLlCLVhWBncCDYXFlV2S5SMiAhJKWpDwpbX5zMyMZisgGLhfGeIVyBXgaKKc31IC74QA3us/no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862031; c=relaxed/simple;
	bh=1LHTfxUo8xZeHJae+QR8ifk3ngRysEMX7RFarQFlU10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3j5W2qbAIvw1HeQTcLaAPtCmgh68E2NxM8/M7AeWHVEZ8a+ehMyj3KS2EXTfeevPpcSjs9u/OAMbvJHVpx3mio3VA5+Wfiqia6iIoGKftuVNDD8eq6RyfLQPteYyFNP/ATlOYR9W/zOTeIWqiWRp6SqrHF0aTEw7GMnlUN9ows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juFzLi3Z; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juFzLi3Z"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f49837d36so6104475ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738862029; x=1739466829; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=++On7KDtroDf34oNj2vJEgLtoair4LXrAFytlgiGD50=;
        b=juFzLi3ZaPlexzJp2Sgsnoopvy6nc18xrSIXagnCzVaoioiRTaCC5fCar7lfMYe96b
         Mj3Afp3oC90VO4F8sosDVIHnJRrAEWRfIxd6/yZ7gS44fCXbUPJLWBPPwhvUC2Dgj/V6
         E8VccjugbPcfC7nxcL/P29g4PrcY97FeBdLX+ZaMhlJ8BR6re7sjj5AFj7TaXEnFrZbF
         JMOmOY6+0dFbUMsHrn7b1bhgS8MkdHBTHUzXEmn715pkvrG7gMPIixac2CyEGPK6/Pw7
         PVRQbBMqK4il1pxIuj1qqSiAPnTSWVgXP0Wo33jFmDQA6vROqi9vZNmY0DBy9Gbkxe0y
         JDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862029; x=1739466829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++On7KDtroDf34oNj2vJEgLtoair4LXrAFytlgiGD50=;
        b=WimqTLFhCEvXuCvdqzMLzfvH/BRNweq9fVXDDQcd8Zl2KhqNI9GgpqVEFRve/4cHGb
         KbSxpPHVc7JISGZ2PuUhOe4NCf94ePeYso2xF4OygsVqs33lQBQ14YR1hN58Log9VLMA
         8BNzT4gbBahWinDlmcuj9QF5GDYN+EV9rLNpdXBaA3OaIH22YOVCGvK1H/+CcJ8OwR4p
         7Exk6AIpKaxQeZxnky9NELRpYEULTbcuuFhVQwtbC2TQs5Y4Q8ehJCyze9LIz1TBVTN5
         eaUZkJDFZ55+kl3sXEjeM4HZaoUe/CIvM3Gw52ALKeQtIqYxbHD8eOEtjvwh0mC+E40Y
         N/GA==
X-Forwarded-Encrypted: i=1; AJvYcCUjRJLcOcxMeFK064b+400bmQSu9oUCEd2kr2UL4Om8SGGRKLqED4vPOpI3EH8rGh9QINjtDP5lFArAHtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4poWFqta0QzkM9CHDNYp0TrPJruVsnGbXU+fjlzkYxCj4tay
	SyraTMMHmFuE7TJ9r27eS5zKNgsOY6BR1N4J+G9i/Rcb9k8Xlk+kxCBXNXusww==
X-Gm-Gg: ASbGncv+AC7FjE4MH4rYFUa3xXxA6GahXkMsMaHj7QRI9eboAZY+HVlxFTwNN9Msptl
	chqFEtoJYK0AHEFLiBGqANlTewCbmSG1EHwPTTRhbIOhgtB3BWN4Dt8CBjH8iyMoglqt23eN3ea
	OHwVrkiczAkt5PIT9/e7TwYE3HAuCmJOurczkBE3v9l92FaaUmYdfvDBSqPuziTfyqR1p2xGSRo
	yY50zgb9h81o7RoN0GXgq+/lCU990NJ+N11Y8041Mn+fzSWLzpc8sCypV2/0yYBeT+5Zamz4u1W
	lh1TXQWqFHudwiRfmGjusCx1fqk=
X-Google-Smtp-Source: AGHT+IEi7kDHTM5kqvCT3m8M3uGH2PtQ237ql11AqlpeMMU7B/j29LzSOZBi2OJPv95Pp6eAwXZ+0A==
X-Received: by 2002:a17:902:f686:b0:216:2426:7666 with SMTP id d9443c01a7336-21f17df5651mr126780975ad.12.1738862029434;
        Thu, 06 Feb 2025 09:13:49 -0800 (PST)
Received: from thinkpad ([120.60.140.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a4f875sm1794525a91.24.2025.02.06.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:13:48 -0800 (PST)
Date: Thu, 6 Feb 2025 22:43:41 +0530
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
Message-ID: <20250206171341.ms357hjxvegyspi6@thinkpad>
References: <20250203175049.idxegqqsfwf4dmvq@thinkpad>
 <20250203185246.GA794570@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203185246.GA794570@bhelgaas>

On Mon, Feb 03, 2025 at 12:52:46PM -0600, Bjorn Helgaas wrote:
> On Mon, Feb 03, 2025 at 11:20:49PM +0530, manivannan.sadhasivam@linaro.org wrote:
> > On Sat, Feb 01, 2025 at 11:07:40AM -0600, Bjorn Helgaas wrote:
> > > On Sat, Feb 01, 2025 at 09:54:16PM +0530, manivannan.sadhasivam@linaro.org wrote:
> > > > On Mon, Jan 27, 2025 at 06:41:50PM -0600, Bjorn Helgaas wrote:
> > > > > On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> > > > > > On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > > > > > > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > > > > > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > > > > > > when
> > > > > > > > building on some platforms.
> > > 
> > > > > > > >       snprintf(name, sizeof(name), "port%d", slot);
> > > > > > > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > > > > > > name);
> > > > > > > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > > > > name);
> > > > > > > > +     if (!regs)
> > > > > > > > +             return -EINVAL;
> > > > > > > > +
> > > > > > > > +     port->base = devm_ioremap_resource(dev, regs);
> > > > > > > >       if (IS_ERR(port->base)) {
> > > > > > > >               dev_err(dev, "failed to map port%d base\n", slot);
> > > > > > > >               return PTR_ERR(port->base);
> > > > > > > >       }
> > > > > > > > 
> > > > > > > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> > > > > 
> > > > > I think this still assumes that a CPU physical address
> > > > > (regs->start) is the same as the PCI bus address used for MSI, so
> > > > > this doesn't seem like the right solution to me.
> 
> Apart from the question of what type should be used, what do you think
> about this part?  I don't think we should assume that the address on
> PCI is identical to the CPU physical address.  IOMMUs and (I assume)
> iATUs can make them different, can't they?

IOMMU/iATU only gets into play if the address gets mapped and translated. If you
look at the patch, even though it maps the physical address to 'port->base', the
MSI address 'port->msg_addr' is actually populated with 'regs->start +
PCIE_MSI_VECTOR' which corresponds to the physical address without any
translation or mapping.

>  If so, this looks like an
> implicit assumption that PCI bus==CPU physical, and I think we should
> make that a little more explicit somehow.
> 

In this specific case, MSI address == Physical address.

> > > > > Apparently they happen to be the same on this platform because (I
> > > > > assume) MSIs actually do work, but it's not a good pattern for
> > > > > drivers to copy.  I think what we really need is a dma_addr_t, and
> > > > > I think there are one or two PCI controller drivers that do that.
> > > > 
> > > > I don't see why we would need 'dma_addr_t' here. The MSI address is
> > > > a static physical address on this platform and that is not a DMA
> > > > address. Other drivers can *only* copy this pattern if they also
> > > > have the physical address allocated for MSI.
> > > 
> > > Isn't an MSI on PCI just a DMA write to a certain address?
> > 
> > That's from the endpoint prespective when it triggers MSI.
> > 
> > > My assumption is that if you put an analyzer on that link, an MSI
> > > from a device would be structurally indistinguishable from a DMA
> > > write from the device.  The MSI uses a different address, but
> > > doesn't it use the same size and kind of address, at least from
> > > the PCIe protocol perspective?
> > 
> > Yeah, but in this case the address allocated to MSI belongs to a
> > hardcoded region in the host memory (not allocated by the DMA APIs
> > which will have the region attributed as DMA capable). So it doesn't
> > belong to the DMA domain, and we cannot use 'dma_addr_t'.
> 
> Doesn't .irq_compose_msi_msg() build the Message Address/Data pair
> that is programmed into a device's MSI Capability or MSI-X Table?
> The device will eventually use that to initiate a DMA write to that
> address.
> 

The device can indeed initiate the DMA transaction on this MSI address, but that
doesn't mean that the host will also use DMA to handle it. Given that the
physical address is used directly for MSI, the host might do non-DMA access
while receiving MSIs.

To clarify, if the device initiates a MSI by sending the MWr TLP to the host,
the host RC will intercept it and will signal the host CPU of the interrupt.
In this process, there is no need for the host to use DMA. DMA would certainly
make sense if the endpoint is issuing MWr/MRd TLPs to write/read to the host
DDR.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
