Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA41C3306
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728985; cv=none; b=RnTjYgFeFuLsjhmwkMXFeffB0yycmH57qin5tkQ3bt1APqSPk4Th7gjUO83skrCRN2DO7T+/jetmq1kN8MhSM21KQ7d0opIKTrF+c4Z5HolYO84EsN7z/nmt7tscmIkvrAM9ru+OD4K7x/FXyF8/14HejHPwf5zfoyoY6KW13qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728985; c=relaxed/simple;
	bh=kyb04malG+RwKZmlL7WK3dUsz2SulfWs8ytrGBGsmbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M05nJNTMazQDm9HDQJTkaBPdJLdXC3m90jceLvJfd3R0reltkHa9SokbQbUUTBp27kUpSu8MUi7SDynVZZfQZMYFcIyMdoF2bE12G2+yL+dOgAatoz52dRs988T0bVM8TFhMiEH2MfGTjQKAHvOoaF9EFORacRG9u4ZwRi+b41c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=RMOll8aP; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="RMOll8aP"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f9832f798aso1142867b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746728982; x=1747333782; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3GC3nd2QY3ZXudwqT4kCMNlEBnSWQ4/Y+mWvsZzVRU=;
        b=RMOll8aPzeGnAxBZKrcN7Nn5HilaQpLD/fjUvJQsw1Zjrrs83yNuZM44/6cpswHhVz
         KG1WQqQHf8CVgVNs6h4kT+t3Rpy6ubU0+1Oqc6eJr2Vfy6Srg61E9shM3k0FqCy25Eme
         F3izRLA2Cr3aWh50Xjvy2WIAHYKc1XoHIPRw7x7plcls10BrBbZNsxFw83FWnsShvQel
         fT1m8j5P0GT0eCqXoM4rk66/vv/RLgCEzNF8d01HJ3Ojo/uU5+AAgfugcYYj1nlGyi5I
         FV7CaxAUv46t8wuXMoPMwuh0CIhwRuM884f8fKj63yEIhmFTGKpTaKM8C9Omp/rhrgSP
         8fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746728982; x=1747333782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3GC3nd2QY3ZXudwqT4kCMNlEBnSWQ4/Y+mWvsZzVRU=;
        b=VcxMrfluBPnWBK8pz1N4YhIZUay+SVg8cfXZXSidIkHpiUamuROOmpYFRTM/XQSn8M
         HgSQhHjAZ4uafS96TU5jIKU49bP6WdzqADBpwy+kcxNxzrgWaiWu/i/ZDEGyPOD5vO9Q
         ++twzFI5JQB/daJYDR6GYyPGEkkBNkdqYt35g37LuhCwcMNDUeQUCT+1HvoSGcpduLRA
         mhGQgeIS/w8Ymk85VNOoFdzKQpYAnAlRJ9lyVJZ9W2F4UiVYmeDXWsrB3Q2dBXHdihOq
         bHBsh4NS/rYH1hvI4AQ8jVjK4d8C8j2dibYKBTRhSugf4ic+RiIPvYDTwSQMPzAmoTe+
         06jA==
X-Forwarded-Encrypted: i=1; AJvYcCXcDwO07C/NLWNW+p8J6hGtVfvOX4DkgAz9/qUAGfBh7gF0I8mVPTf84iyZQ9CYHUF+UZnl7ewdsTBvKD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2+UzGbbS10v6cJfV4lzGpNyupzFHGsrYBOHzQeiq80a3xmCIf
	KN9PlQZwz4MYEVtBiZ8zekgF6RgcOaF8BoNmAgX5ZNtMEokPEQhLQLgcUuvtGA0e2EBzjL02MDN
	4
X-Gm-Gg: ASbGncuzgeg3wQJEseeMcCeI74gQD4V4OOqtBkfGzzL5k/RqU1cwQIohee5PvGu1bpZ
	19CD4EZqN09iWOybO1HUaL42/mhgBEIbQCNyDMTYQihepkbWrhpjwZJBMuXsMMPKjQzn1JK0+X7
	0plEyE7xYEZda8RE+hVY7JMpldb+qrejH3xr2HRsHeBhmyrjfF2XRIiRuhT5l0TkPFGtHXu9dX9
	60DaEXh38cHNVTapftmv3j412jYuhlR4oKyf74LNGqRx29THyzzi2HGe+AWryr5ALQaA/90X6aK
	ubfOsTLBFq6zA1PZaqZgj46y4CHbk4xWtlsF+03HHmB3YP7TpeQK5D6VeA==
X-Google-Smtp-Source: AGHT+IEsxgb6xpj/TfNH2Jats/rW7/6lQIZRnNAaVkD3rlO2gB/eCZLowl4BgQ20sS07u8Lsi9VRPA==
X-Received: by 2002:a17:902:cf06:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22fc9185e59mr5399955ad.38.1746728636019;
        Thu, 08 May 2025 11:23:56 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b37asm2411005ad.187.2025.05.08.11.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 11:23:55 -0700 (PDT)
Date: Thu, 8 May 2025 11:23:53 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <aBz2uePXAtY6c6jD@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
 <Z/BoQIXKEhL3/q50@x1>
 <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
 <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
 <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
 <c46de621e098b7873a00c1af4ca550a1@kernel.org>
 <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>

On Wed, May 07, 2025 at 12:04:01PM +0200, Michal Wilczynski wrote:
> 
> 
> On 5/6/25 23:30, Stephen Boyd wrote:
> > Quoting Michal Wilczynski (2025-04-30 00:52:29)
> >>
> >> In the v2 version of the patchset, there was no reset controller yet, so
> >> I thought your comment was made referring to that earlier version.
> >> This representation clearly describes the hardware correctly, which is
> >> the requirement for the Device Tree.
> >>
> >> The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
> >> starting at 0xFF_EF52_8000:
> >>
> >> GPU_RST_CFG             0x00
> >> DPU_RST_CFG             0x04
> >> MIPI_DSI0_RST_CFG       0x8
> >> MIPI_DSI1_RST_CFG       0xc
> >> HDMI_RST_CFG            0x14
> >> AXI4_VO_DW_AXI          0x18
> >> X2H_X4_VOSYS_DW_AXI_X2H 0x20
> >>
> >> And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at offset 0x50:
> >> VOSYS_CLK_GATE          0x50
> >> VOSYS_CLK_GATE1         0x54
> >> VOSYS_DPU_CCLK_CFG0     0x64
> >> TEST_CLK_FREQ_STAT      0xc4
> >> TEST_CLK_CFG            0xc8
> >>
> >> So I considered this back then and thought it was appropriate to divide
> >> it into two nodes, as the reset node wasn't being considered at that
> >> time.
> >>
> >> When looking for the reference [1], I didn't notice if you corrected
> >> yourself later, but I do remember considering the single-node approach
> >> at the time.
> >>
> > 
> > If the two register ranges don't overlap then this is probably OK. I
> > imagine this is one device shipped by the hardware engineer, VO_SUBSYS,
> > which happens to be a clock and reset controller. This is quite common,
> > and we usually have one node with both #clock-cells and #reset-cells in
> > it. Then we use the auxiliary bus to create the reset device from the
> > clk driver with the same node. This helps match the device in the
> > datasheet to the node and compatible in DT without making the compatible
> > provider specific (clk or reset postfix).
> > 
> > That's another reason why we usually have one node. DT doesn't describe
> > software, i.e. the split between clk and reset frameworks may not exist
> > in other operating systems. We don't want to put the software design
> > decisions into the DT.
> > 
> > It may also be that a device like this consumes shared power resources
> > like clks or regulators that need to be enabled to drive the device, or
> > an IOMMU is used to translate the register mappings. We wouldn't want to
> > split the device in DT in that case so we can easily manage the power
> > resources or memory mappings for the device.
> > 
> > TL;DR: This is probably OK, but I'd be careful to not make it a thing.
> 
> Thank you very much for the comprehensive explanation. Because the
> registers don’t overlap, it’s fine in this case. Since Drew also seem to
> agree, we can probably push these patches forward, while keeping in mind
> that for future SoCs it would be better to use a single node.

Yes, I think in this instance it makes sense to go ahead. I sent a pull
request [1] to Stephen for my thead clk for-next tree with this series
applied.

Thanks,
Drew

[1] https://lore.kernel.org/all/aBus+Yc7kf%2FH2HE5@x1/
