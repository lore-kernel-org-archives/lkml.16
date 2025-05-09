Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53410270EC3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774534; cv=none; b=kAD001MFGRUtoUSzvvWmHEiOgQwsSk4ICvWhTyxdg8XyV0zTAQBUp4co2kEsh4pR3OGqFCvAZkrQoDAosYlfcLO2rejdaIdNkPvBVtKVI31aUucdpFCCisBd3kzWKLTiqYj4pDDyT1V5QzyCc3cbfkK7EC6VXB3TQZJ1ycVlwiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774534; c=relaxed/simple;
	bh=oZnnaQahcN2zA4vvZs+wzg11udFQZV8cb83SiP8IQXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppSFXT+xqD99mF42Jj76gMAsvOwe8F5HKtOGS1S1HaF/7g9IBeI2UL8jXczlxy1zKazkWoOqHYZmaIIcu4lTzWzPDGW9nJc0xmv+cgiSsCWND3um7XDL5TIDFXoLPRtuvJ9ezdaUVHtW3qLhRXr/Wy57EN++pZFwECdapXyx5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GBmFxLYS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GBmFxLYS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf680d351so16348405e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746774530; x=1747379330; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77qkoKjDKq6SXETuhF5rMrUj8XsUUdj7U8eiTVCOHj0=;
        b=GBmFxLYSjCjfIfMTnXY09zej7BMiTYFQvhkBiY96e9Mb/6Qw2KfokBCwzvM0hb+CyX
         iLKfBMfxmdD8yYkIUGmBXKvTspn9YjEYzwvbPdmlHYEvfzzmFicQvnHU/+AgOpYi00G1
         SyY/66gpbyZ+L5B8NlStieSur/Thyn8IxZIl1R3V8bWYAU9BJUi3TYFZFdDp0DfzNdDc
         cC6ulrBISaNuBmBcVlkoDaTrxvwrKCbUF3uEleGNTIziez5fzemlETeSDIpYl2Zo0Q5j
         GrC2PTRt7gJftxSLw4RqJ1dJamPey3c1r4dnfGYrtYMhOoeaJ31WhJtB1lrRfKJpTQeF
         ee3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746774530; x=1747379330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77qkoKjDKq6SXETuhF5rMrUj8XsUUdj7U8eiTVCOHj0=;
        b=OCjOTFD4gpBnlPOyBkhzRQltlan87dkvNmSMQpjgLIdQi3ySAvPx1G0oO0whmxeBo4
         B78K/BeWQQ0KZne0ad0R0c1vDhg60aWmJEzqLpJxFOuhyYR2Kc2QPjC22jDUYqniEmEO
         74NidPCvkpjZi/2YeyGSGYIshrQ6G2QrNyIZLEFJl+Klg4gp6q/j3kb5kK6GjTE/UHe8
         QztkU6xZVjjaheDAn9sT0VaqQBa8FokO8aiSWiQ28GUbcW5ZiGiXGgE0AD5wNki3oA0v
         zCdHO/YSKmBiNudJaHpMqpK7mmeYQwoougZJHN4/OVQOr99wB+QD4SQIxuRSbl2RhTII
         xLhA==
X-Forwarded-Encrypted: i=1; AJvYcCUtujGFA4g39+dHgQ41u/kGpB4KEb+8BfQunhSKWgJaRqXgikBoS4CX8RqPySfDyPPh9Sb7C70ob5Ak7BQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww7g7Ivypj7KXTQqzzLFRkmP3chy2gIQk9WRTXuYGWAr94fJg3
	Al7JDMdA6fYNHzFh9acQPojbDy8mfYd476fcMRwn6/z6Jnkk5A7b/gp7ifkDTw==
X-Gm-Gg: ASbGncv3K4vryqjFeOO6uBCYYf1xdaYEZk77QHG0r6G3Vw+sVij/4jdioGS5nRnD/US
	ia5z2a0L0f9luA9Tb80ORoifL5xpIkbTdSy3jaxxAy/io68yWkPIB4LGq8NVsKa+MJ5zamEsYw1
	XfgX+6ahJKP/QXKxVNC4+fUQqDjLPk3bYqN99dZJ8dYPyOurCJoOOomGw6MILxc6ynJdk80aoro
	cgjj2u2qCmfTCcXIfGvk956wYIgp2rVWIva9qGDEy03wNoKjateTpueCpKz9Xf//MEO4cmOtiEh
	P8PBH+3+hDEHyF18OJ2+QyY+6f4OGaL2L2Qod1LAy9rjANfjYbA+5CECLo+0kDZiJ6DLXPPCuBt
	7iaytoNFmjCoQIYJtzNJzirw=
X-Google-Smtp-Source: AGHT+IHR5+ZqZWgRoRLa1o1Gg2Cvw+npoLGEsXcz8CnQxm7QZTBi9ul3cXloYS+TYHobQ2CzSJpuaQ==
X-Received: by 2002:a5d:5f51:0:b0:3a1:f563:f84e with SMTP id ffacd0b85a97d-3a1f6a4370emr1630423f8f.16.1746774530584;
        Fri, 09 May 2025 00:08:50 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde1asm2305688f8f.8.2025.05.09.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:08:49 -0700 (PDT)
Date: Fri, 9 May 2025 12:38:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de, yue.wang@amlogic.com, neil.armstrong@linaro.org, 
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <oy5wlkvp7nrg65hmbn6cwjcavkeq7emu65tsh4435gxllyb437@7ai23qsmpesy>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507163620.53v5djmhj3ywrge2@pali>

On Wed, May 07, 2025 at 06:36:20PM +0200, Pali Rohár wrote:
> On Wednesday 07 May 2025 23:06:51 Hans Zhang wrote:
> > On 2025/5/7 23:03, Hans Zhang wrote:
> > > On 2025/5/7 01:41, Pali Rohár wrote:
> > > > On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
> > > > > The Aardvark PCIe controller enforces a fixed 512B payload size via
> > > > > PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
> > > > > core negotiations.
> > > > > 
> > > > > Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
> > > > > PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
> > > > > during device initialization, leveraging root port configurations and
> > > > > device-specific capabilities.
> > > > > 
> > > > > Aligning Aardvark with the unified MPS framework ensures consistency,
> > > > > avoids artificial constraints, and allows the hardware to operate at
> > > > > its maximum supported payload size while adhering to PCIe
> > > > > specifications.
> > > > > 
> > > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > > > ---
> > > > >   drivers/pci/controller/pci-aardvark.c | 2 --
> > > > >   1 file changed, 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/pci-aardvark.c
> > > > > b/drivers/pci/controller/pci-aardvark.c
> > > > > index a29796cce420..d8852892994a 100644
> > > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > > @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct
> > > > > advk_pcie *pcie)
> > > > >       reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > >       reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
> > > > >       reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> > > > > -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > > > >       reg &= ~PCI_EXP_DEVCTL_READRQ;
> > > > > -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
> > > > >       reg |= PCI_EXP_DEVCTL_READRQ_512B;
> > > > >       advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > > -- 
> > > > > 2.25.1
> > > > > 
> > > > 
> > > > Please do not remove this code. It is required part of the
> > > > initialization of the aardvark PCI controller at the specific phase,
> > > > as defined in the Armada 3700 Functional Specification.
> > > > 
> > > > There were reported more issues with those Armada PCIe controllers for
> > > > which were already sent patches to mailing list in last 5 years. But
> > > > unfortunately not all fixes were taken / applied yet.
> > > 
> > > Hi Pali,
> > > 
> > > I replied to you in version v2.
> > > 
> > > Is the maximum MPS supported by Armada 3700 512 bytes?
> 
> IIRC yes, 512-byte mode is supported. And I think in past I was testing
> some PCIe endpoint card which required 512-byte long payload and did not
> worked in 256-byte long mode (not sure if the card was not able to split
> transaction or something other was broken, it is quite longer time).
> 
> > > What are the default values of DevCap.MPS and DevCtl.MPS?
> 
> Do you mean values in the PCI-to-PCI bridge device of PCIe Root Port
> type?
> 
> Aardvark controller does not have the real HW PCI-to-PCI bridge device.
> There is only in-kernel emulation drivers/pci/pci-bridge-emul.c which
> create fake kernel PCI device in the hierarchy to make kernel and
> userspace happy. Yes, this is deviation from the PCIe standard but well,
> buggy HW is also HW.
> 
> And same applies for the pci-mvebu.c driver for older Marvell PCIe HW.
> 

Oh. Then this patch is not going to change the MPS setting of the root bus. But
that also means that there is a deviation in what the PCI core expects for a
root port and what is actually programmed in the hw.

Even in this MPS case, if the PCI core decides to scale down the MPS value of
the root port, then it won't be changed in the hw and the hw will continue to
work with 512B? Shouldn't the controller driver change the hw values based on
the values programmed by PCI core of the emul bridge?

But until that is fixed, this patch should be dropped.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
