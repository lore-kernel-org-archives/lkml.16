Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F070C2253B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310616; cv=none; b=UYldALbHHB28sG1ACmO4Eri4fpOzB4jGu9GRPMyhBxor46BJ9QiPjEf6dd7fCySVCaQl/T6j+1/cyXOnlkXHT/dZ+1t365Jm1EA3mFtYs9lmZ+bOYXMf6h8whxpgIvHHCUEvrzAv0bHIQ5FfOVJPh+zzdpqzbtDgUyOxsBlsSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310616; c=relaxed/simple;
	bh=rIaiGOYbokETxOKXtmP8wukLdDqxoOnSlsPQovNIqD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmDGZVSFJXDF9O0qhofO9nLn5MNcPAGhH5qNKfnZdJBtdrSf1jL4DSegGQnr+Fx5npiST4d9QVn32FAhfELnCNLiY98vQpP3Y8O/nwbu/sd82XudxE9Itw9lCG9I8L8W80F22xLjAYiyAueV3dyXJHVZnwPdDiGQJ+PsyUOXS/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMrsw/vL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMrsw/vL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so8455215e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747310613; x=1747915413; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5Dm294PbrWONSf7K3CLqY0H7cYyRoYEw+bT1IPWQHo=;
        b=gMrsw/vLV/MCIMZNu6II4h4X7lqvaP/PTjAsv5aB4WMPGa7GEgP1VJwBDIDihYVgqz
         erkAWAxLqSi7dqogJrUcJ/hUO7KPIS6lWRKFtDLQRCFmoYyEz19WiL6tDFMGF95nHszM
         CutiDuLF7PgsunUcrU8MmGEM2yUjepWhtSSj+io7sk4nWBSkWsYKO039jVpZYknru/VC
         Tjnhz6ljBDunOJjv11mrpN6FrM+FfJzCnBN+lHJJEN36uxEZf1NudvQ+JXUF/Ao58yNq
         4cgnSmPcgVYotU327oCJFJLi4pHThTTHMkTzenGiHYPQGlSxTLhymTw0LJ5NKbMgVL4m
         iJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310613; x=1747915413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5Dm294PbrWONSf7K3CLqY0H7cYyRoYEw+bT1IPWQHo=;
        b=lC5Swiv28R7Il12akUWSl8A7MBNV2rAdZvAB6sKdRYUM2EFm5+ithUyxHSV3Jwlu7B
         aXM1mjM5BSSRnQCp0AzpRPXbelgWAWZ5C4i9pQ+AI5QLweH5k+Bnh5TMVOXvvhNcaE+/
         +ZVc5ynb9j1CqmF/5ZYYx1eLNnfFz4kvPUVYN+kx7Y9c4CG+ltPgGrCyllMRnCyFmwMD
         /c6piBXGFBeNeNJvG6GLn4CjrUJeQGom9xiaV5oBKEGx6OnnleWCmln084IdH4Tjzaie
         outh/fNT/cv13d/1OrOTI4GmYQmnaGwhinuhPolZrJPfk++xPxxuVMeRTl33SHBaJI7s
         6Q5g==
X-Forwarded-Encrypted: i=1; AJvYcCXqnoDj0wYkb3QwlAJ8PubkfBaYJizmRblKyyLV2nzl104ccKDSoDGLqHxE7IGJA9kmiOmZX3gamIldDIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA078r3jYBCVzClmcMCbm4cGR3QPQotLM5+lOp/P4VVbB3ii9q
	S9hzhmLLqT2aRkeJg5Y2JSPX5x5x58oq7uAXCIiLqh6ZlQMajzMjbPY4dkfGRw==
X-Gm-Gg: ASbGncs0AtxfVKygHJ6N0XvZ6UIV8qrPaTYXnghxjZi5l1NK5abS+IrOSwPsymN3e5I
	IQVUOxHfvLTfhqn0TAy4z3+Cyiw9h5wnDWv8reThE2wYsEcJWGYt19fEhdVG8BFS3qUehvZDn6f
	6Wec/JykWmMdOcbc4rHfPpHg+qc/kEKq0MTJM9lvKhZxgQtWtBqiMe4zlrq/qwc7ydIsZh0AcsI
	c0FAd8b+5PYP/6WXtcEVT4AiVlLk7Msb/GNBJnJs/29gszb/kG2bd7A3Ny0pxPRSbZbUpretuhf
	FV9RAG1VxY2YwdJA782udnA84zOC6ou0xndtde0GC0A2pI9oHH6RQoS8o9bG4eqXjaje/eu5Cq2
	9KZsKy6EiwqNmLg==
X-Google-Smtp-Source: AGHT+IHlVMLx2LBOebfEdakAr7jMaTKb4vKCXk6oSYtrA1JygFEFmKNR3fFjnt2BvUb5BojRv/MYmQ==
X-Received: by 2002:a05:600c:a42:b0:442:cd13:f15d with SMTP id 5b1f17b1804b1-442f217a65fmr61066245e9.29.1747310612978;
        Thu, 15 May 2025 05:03:32 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2961sm22525510f8f.45.2025.05.15.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:03:32 -0700 (PDT)
Date: Thu, 15 May 2025 13:03:30 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de, yue.wang@amlogic.com, neil.armstrong@linaro.org, 
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <wqzay2jvimjvpsj5rzh6xwxgmrerma5qesbwa6fkjepibhdv6e@hi4dpp4kmt5u>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
 <oy5wlkvp7nrg65hmbn6cwjcavkeq7emu65tsh4435gxllyb437@7ai23qsmpesy>
 <20250509160025.s65aw5ix6s7533b5@pali>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509160025.s65aw5ix6s7533b5@pali>

On Fri, May 09, 2025 at 06:00:25PM +0200, Pali Rohár wrote:
> On Friday 09 May 2025 12:38:48 Manivannan Sadhasivam wrote:
> > On Wed, May 07, 2025 at 06:36:20PM +0200, Pali Rohár wrote:
> > > On Wednesday 07 May 2025 23:06:51 Hans Zhang wrote:
> > > > On 2025/5/7 23:03, Hans Zhang wrote:
> > > > > On 2025/5/7 01:41, Pali Rohár wrote:
> > > > > > On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
> > > > > > > The Aardvark PCIe controller enforces a fixed 512B payload size via
> > > > > > > PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
> > > > > > > core negotiations.
> > > > > > > 
> > > > > > > Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
> > > > > > > PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
> > > > > > > during device initialization, leveraging root port configurations and
> > > > > > > device-specific capabilities.
> > > > > > > 
> > > > > > > Aligning Aardvark with the unified MPS framework ensures consistency,
> > > > > > > avoids artificial constraints, and allows the hardware to operate at
> > > > > > > its maximum supported payload size while adhering to PCIe
> > > > > > > specifications.
> > > > > > > 
> > > > > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > > > > > ---
> > > > > > >   drivers/pci/controller/pci-aardvark.c | 2 --
> > > > > > >   1 file changed, 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/pci/controller/pci-aardvark.c
> > > > > > > b/drivers/pci/controller/pci-aardvark.c
> > > > > > > index a29796cce420..d8852892994a 100644
> > > > > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > > > > @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct
> > > > > > > advk_pcie *pcie)
> > > > > > >       reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > > > >       reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
> > > > > > >       reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> > > > > > > -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > > > > > >       reg &= ~PCI_EXP_DEVCTL_READRQ;
> > > > > > > -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
> > > > > > >       reg |= PCI_EXP_DEVCTL_READRQ_512B;
> > > > > > >       advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > > > > -- 
> > > > > > > 2.25.1
> > > > > > > 
> > > > > > 
> > > > > > Please do not remove this code. It is required part of the
> > > > > > initialization of the aardvark PCI controller at the specific phase,
> > > > > > as defined in the Armada 3700 Functional Specification.
> > > > > > 
> > > > > > There were reported more issues with those Armada PCIe controllers for
> > > > > > which were already sent patches to mailing list in last 5 years. But
> > > > > > unfortunately not all fixes were taken / applied yet.
> > > > > 
> > > > > Hi Pali,
> > > > > 
> > > > > I replied to you in version v2.
> > > > > 
> > > > > Is the maximum MPS supported by Armada 3700 512 bytes?
> > > 
> > > IIRC yes, 512-byte mode is supported. And I think in past I was testing
> > > some PCIe endpoint card which required 512-byte long payload and did not
> > > worked in 256-byte long mode (not sure if the card was not able to split
> > > transaction or something other was broken, it is quite longer time).
> > > 
> > > > > What are the default values of DevCap.MPS and DevCtl.MPS?
> > > 
> > > Do you mean values in the PCI-to-PCI bridge device of PCIe Root Port
> > > type?
> > > 
> > > Aardvark controller does not have the real HW PCI-to-PCI bridge device.
> > > There is only in-kernel emulation drivers/pci/pci-bridge-emul.c which
> > > create fake kernel PCI device in the hierarchy to make kernel and
> > > userspace happy. Yes, this is deviation from the PCIe standard but well,
> > > buggy HW is also HW.
> > > 
> > > And same applies for the pci-mvebu.c driver for older Marvell PCIe HW.
> > > 
> > 
> > Oh. Then this patch is not going to change the MPS setting of the root bus. But
> > that also means that there is a deviation in what the PCI core expects for a
> > root port and what is actually programmed in the hw.
> 
> Yes, exactly this aardvark PCIe controller deviates from the PCIe spec
> in lot of things. That is why it is needed to be really careful about
> such changes.
> 
> Same applies for pci-mvebu.c. Both are PCIe controllers on Marvell
> hardware, but it questionable from who both these IPs and hence source
> of the issues.
> 
> Also these PCIe controllers have lot of HW bugs and documented and
> undocumented erratas (for things which should work, but does not).
> 
> So it is not just as "enable or disable this bit and it would work". It
> is needed to properly check if such functionality is provided by HW and
> whether there is not some documented/undocumented errata for this
> feature which could say "its broken, do not try to set this bit".
> 
> > Even in this MPS case, if the PCI core decides to scale down the MPS value of
> > the root port, then it won't be changed in the hw and the hw will continue to
> > work with 512B? Shouldn't the controller driver change the hw values based on
> > the values programmed by PCI core of the emul bridge?
> 
> Marvell PCIe controllers has their own ways how to configure different
> things of PCIe HW via custom platform registers. This is something which
> needs to be properly understood and implemented as 1:1 mapping to kernel
> root port emulator. Drivers should do it but it is unfinished. And as I
> already said I stopped any development in this area years ago when PCIe
> maintainers stopped taking my fixes for these drivers. As I said I'm not
> going to spend my free time to investigate again issues there, prepare
> fixes for them and just let them dropped into trash as nobody is
> interested in them. I have other more useful things to do in my free
> time.
> 

If the patches are not related to unloading the driver which acts as a msi
controller, I don't see issues with them ;) But I have no visibility on the past
conversations.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
