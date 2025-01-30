Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2748462
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244288; cv=none; b=KqrVSAVpsP5lH1jh8KlyB/v7TeZLvG4XGP3pTu12Re6VEQX8Mb/8P55fwh9PPrGI0nlZmYzhzSYmxdc+pbvcZuFeKfL8i0GssBN+hiCCsw5i7za+/BYwfFXFqqGNrfmBEK+XtlKJ6BM2GFdfQWH/Shj3ygzoLR5FbRH7j52npC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244288; c=relaxed/simple;
	bh=bHYkToOxCaW9lVxedzz18fvvWvyPAtrma08TTY7Ex28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLQ1BvWLQnxulrk7ZjSs8UouYcmUacqAflWQGHXP2CKTIuvT7kBzm5BWaIhVA9XTnPyRywdLXPSPbFtgXfuIlu3gHmkx8farptJ1E9Rl4GVEEBvHxxWPHHPmW/l5hPzZ8mXIq9aKQg9EiT+0VuJHTdi5524iMXLjGV5mZgDs0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsyFkTLk; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsyFkTLk"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ebc678b5c9so432175b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738244286; x=1738849086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IaOqkqi4ZsckMMcVlfVzFatudJFOKDndawaygsJAlnk=;
        b=UsyFkTLkTOfwoRjvG7JxL6g7F6PWUYLN0l7tCin7Jafn/L+V9234vtJNSUVdszw6yg
         p4zg5xExATWa05c88c4eHauPTC1Ft0ZWELV005LX/FlNJuuuwpA3trHMtjySuE3qVMaF
         M4zsFVJzEnjYUDRDG5mqMAc2VgKsdVJF5Ysr1mi8u5HbYZmhRvmfuHf1Bx2ScVhKf45M
         yO9qxNBVf/T3RYA2A5MjsC/atTsoJsK+ZDRm+QkGK1vWsPzGU2SlxGsPspZSu2mCDNPm
         YtsT8l2yClhfiPCogXlj9JEVEnS2BFSShMPwlYb17nJ1vhlIaM1JZ6fHpjBpcfPGFw0+
         N56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738244286; x=1738849086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaOqkqi4ZsckMMcVlfVzFatudJFOKDndawaygsJAlnk=;
        b=RXVBMSrmP+xLQr4PeJ7rrvfg73dD5AC7nWr3YnNnInLMju6X/u0npLs42QZS0UZy4v
         ZAgS4Q8CycGY3YwQIoJXNXssnoFhj+qcD/6pduxW7vG9AlTWWRPJxl1Cy1rOe4PNVtsp
         kGtbKOjdJhtKOvHxbWBz4lQYICmHy/7OHT6xq5Aj1Bvw+KsxpAfO+t/71tqR3msDgnDS
         lAoKeH62LZ/aDPatSGbfy0Vg/VXDgwCtRF+vL9okzQpPqRgqOr1Zsx6/FUzEX/TLnqud
         HW01WCyQwlYuwYsV9Ts0hgbygb7COWrKV3ttLBQ+4XbFzRzIYB+L5eXuWhkijWJmFS5x
         CirQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWwfF1p9j9khdL2x+TYwDTHaHMwi7Mgcq6PoETAr8TKVWX2tux0aymT3q8OIvtwyMr65BWd/lRHpo88eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YydQQJ0mI8/NGmX6T+Dt/Z147j5nWxD4cWLwjD14e+qS/emDlj4
	YbRA3W0jsX9bbknyhja6MXpmZZExYhh0MHT8Tplkag4lcg3yuko98D9CL+FMk58=
X-Gm-Gg: ASbGncuhrk6Udv2jO4q6xTush58EZCzL8UiTzvYB2xlUYqHGlAzcs3wRBXwpXOQ+u/m
	ZSNZoaGXue9PHkXmThwFnqZsBtuBGLXHLR+vQEf+bX2qcmOv2xwnX5N4SWVLMQzpjCR6aZU1JOn
	zLq5QrGp7sqSA1nWY06xrcBYbUSuH/5gmUQBTu+d02qlH5ZmQDPUkFn1JKHd55KNIU+jEwPIm9L
	HO2cI9s8NO52isSajrCR54189fSo6p3cIJaLkDPfTqPs/JqtWF2P46UMAR9Kvw3FRn4UrcxISyu
	N3bl
X-Google-Smtp-Source: AGHT+IGFWTM916CiHup+GvXXTaGukMyyxcRzxGKJc5oj7MHmJp2ub5HMhM/2b9dpAzf0/kTivKI5/A==
X-Received: by 2002:a05:6808:3a19:b0:3e7:b644:e4ec with SMTP id 5614622812f47-3f323b674acmr4766306b6e.26.1738244285909;
        Thu, 30 Jan 2025 05:38:05 -0800 (PST)
Received: from halaneyt14s.local ([2600:1700:1ff0:d0e0::e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618cb8aasm310109a34.64.2025.01.30.05.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:38:04 -0800 (PST)
Date: Thu, 30 Jan 2025 07:38:00 -0600
From: Andrew Halaney <ajhalaney@gmail.com>
To: Nishanth Menon <nm@ti.com>
Cc: Daniel Schultz <D.Schultz@phytec.de>, 
	Andrew Halaney <ahalaney@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	"vigneshr@ti.com" <vigneshr@ti.com>, "srk@ti.com" <srk@ti.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable PCI_J721E
Message-ID: <wqravmnyudex3wcwhkbcbanxsqrmplpq5fmyueyaniya2dkqec@axu7nmb2xbbp>
References: <20240807-pci-j721e-defconfig-v1-1-b97e5f4564f6@redhat.com>
 <8b700897-1653-49f2-8fba-e5fce13a5447@phytec.de>
 <20250122145822.4ewsmkk6ztbeejzf@slashing>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122145822.4ewsmkk6ztbeejzf@slashing>

On Wed, Jan 22, 2025 at 08:58:22AM -0600, Nishanth Menon wrote:
> On 14:53-20250122, Daniel Schultz wrote:
> > can someone please apply this patch? It's actually required by all TI 
> > AM6 devices with PCIe, e.g. AM64x.
> > 
> > - Daniel
> > 
> > On 07.08.24 22:15, Andrew Halaney wrote:
> > > Enable PCI_J721E for usage in both host and endpoint modes.
> > > This is used by boards such as Texas Instrument's SK-AM69 and
> > > J784S4XEVM.
> > >
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-By: Daniel Schultz <d.schultz@phytec.de>
> > > ---
> > >   arch/arm64/configs/defconfig | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 01dd286ba7ef0..e5222dbedd387 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -225,6 +225,8 @@ CONFIG_PCIE_RCAR_HOST=y
> > >   CONFIG_PCIE_RCAR_EP=y
> > >   CONFIG_PCIE_ROCKCHIP_HOST=m
> > >   CONFIG_PCI_XGENE=y
> > > +CONFIG_PCI_J721E_HOST=y
> > > +CONFIG_PCI_J721E_EP=y
> > >   CONFIG_PCI_IMX6_HOST=y
> > >   CONFIG_PCI_LAYERSCAPE=y
> > >   CONFIG_PCI_HISI=y
> 
> please make them as modules. no point in growing the default Image file.
> 

The PCI_J721E_HOST config only supports builtin, which I think has
something to do with [0] (but I only re-skimmed that this morning
briefly). I don't have the hardware any more, so I can't test what goes
on if you make it a module etc unfortunately.

[0] https://lore.kernel.org/all/86o73j3vea.wl-maz@kernel.org/
