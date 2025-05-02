Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF2F19DF5B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746207352; cv=none; b=O8CCbS7RqYU9gE6/9qBfBco5T3MPC3TLwoVQyplJxR8FqpZbRSEYgfHiBNlvYQTICEC4pyYM6+vJ0yW6OceSlq7Pqz1hh1/1t9uL0r+I7IYqtOe7kkZBpRld9IaTXOrwyp1+yyuKRMT2nKFTIteZFRqeulA4X4kOWSvU0EVY+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746207352; c=relaxed/simple;
	bh=qwDDJIMY3SmfHF6RfD11Zji50ZeYXaTD7oE39CiI6/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaAppuKXGA8DiFtGMTSoOVOnFqo4jW1Igy2dRXlfN68mEmM2cFdXiGAkbTQNG/4LceYr3LimG4kXIN28o8uJ691pKv4x8HOv8uAxr1L5qNHbKTYzOOGBr9NCUbYUekKgfsJltSWrMCdcXCcblHDGEQH7XnNLRGy4ztF8mGUPYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=SzXCmOyN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="SzXCmOyN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33ac23edso28316865ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746207350; x=1746812150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYhAVQlokiByUgWXBup9K48iVS+b0vgtDdhC/WcTVzQ=;
        b=SzXCmOyNfBUW7SNbgfHGOAG8iQjRDoAwJAJfGwKJrxZYeORRUt8jvlnamGAszF/geG
         FLHgwVaMx/CMqgbtPVip+hh2v1Cx5Ql4cQqqqmKudPK/E8H7CDxolt5cNmayHNNGQ4fU
         TSayzkr8ueST0jIe+OJ4Lqz4MhKDvLp8cyatiDeafKz7lXrJgXRnCvCZp4AU42mvG4cg
         0GxBbuV27s0yHEJynznochGjzPbm+kk6m98xXlUCCV0k980QmoVXra9kMyvztMSU6seG
         PWlJcR75gJ1+V42AU5tt8bctntepnrdUPCh3h3y4LZ0PmEC+m1S7MaeSvg6879VitX52
         31Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746207350; x=1746812150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYhAVQlokiByUgWXBup9K48iVS+b0vgtDdhC/WcTVzQ=;
        b=bq8/KCSNh7pXW03vh9RJwuM/JrMu5uRx1LLhuFBtkEzORWkLaZZeaacpXxBntBJ7md
         OFRv4VKqs0DTnv/cgar7AmZYzK2ttVuL64D1gzBTN/oDc9teil4OA71oRnMhRKy2PpSo
         ygEo7L1KloKxLWqEiqyaQYk4O7NuFX0PnC46UDxYrvG1UVfnd9P1gvUVkxbnuYkhz2jl
         aN72V/s9kHblO5txw8GbLYmwirtEBtvTQMquuw7QMvw/Axt+ELaV7rMCNq1LcgqbBkax
         ymvozco3YE/cJLsag2LkQhW8vl/1mL3auMmTSvTmzzkvHxZDk5/Hej4AWZ9ByU5jRQTW
         SGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhCQX1K5qGKdRdk0Y24rn4ejoFnXF431wln3bw8IxAhnwfHkFZ3cDDcfC3P6gJlTiV5sQFIA2CrNXSyvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcDgXlsG0mJIbAscsGq2Ck/c97WB+HRJllQMV5075CG9dUNx24
	3Km16Mfw1tcTLPtacxJxI70Y2E5UnGjC2Rv+CkFQSFVa0ZeNfleYKxFW4I9WvmY=
X-Gm-Gg: ASbGnctAucoQ4NDKcVIVscgeMSR/n34C5ATB+NuUtCuS9MHFL3a+7/LzF9GuoMmhbCK
	5mj5nTeJwROFu8OScQVsrc74dOWtvlD0Gwo6B8ZuN4fZjPSPV+7WTaG0Op/l2UpqjDpkTJ/S+tg
	lV2ys7hQiny+UtSug/3G4JxRyQc/3MqGu4+yIRa59IcRG2YUcDeWX3AbrmBwPIsSHZX7IZyoid8
	VB/3VGceRKrQcorujgmApFZZ4g+A38tfEP1bwwlCbeoKXxiHne0LVlVeqNeSbI2Jw5fRS+YojSj
	DZ8akpOq96FifQf2pxG2NQdd+QW+ihqH+rxCEEZnWFx4S8KxjqbuWt+3lQ==
X-Google-Smtp-Source: AGHT+IHBxa82j3Roorwj2Et3r1OrV5OkcZFDFTDmDeIMXs4BMM/H2pad3CjPCcSgOfU4YoigoF7IqQ==
X-Received: by 2002:a17:903:3b88:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22e103965femr57603255ad.40.1746207350292;
        Fri, 02 May 2025 10:35:50 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232797sm10306915ad.240.2025.05.02.10.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:35:49 -0700 (PDT)
Date: Fri, 2 May 2025 10:35:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>
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
Message-ID: <aBUCdA0ZSQL1n3i4@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
 <Z/BoQIXKEhL3/q50@x1>
 <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
 <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
 <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>

On Wed, Apr 30, 2025 at 09:52:29AM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/30/25 00:29, Stephen Boyd wrote:
> > Quoting Michal Wilczynski (2025-04-07 08:30:43)
> >> On 4/5/25 01:16, Drew Fustini wrote:
> >>>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >>>> index 527336417765..d4cba0713cab 100644
> >>>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >>>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >>>> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
> >>>>                      #clock-cells = <1>;
> >>>>              };
> >>>>  
> >>>> +            clk_vo: clock-controller@ffef528050 {
> >>>> +                    compatible = "thead,th1520-clk-vo";
> >>>> +                    reg = <0xff 0xef528050 0x0 0xfb0>;
> >>>
> >>> Thanks for your patch. It is great to have more of the clocks supported
> >>> upstream.
> >>>
> >>> The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
> >>> 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
> >>>
> >>> I see on page 213 that the first register for VO_SUBSYS starts with
> >>> VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
> >>> CCU_GATE macros use offset of 0x0 instead 0x50.
> >>>
> >>> I kind of think the reg property using the actual base address
> >>> (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
> >>> in the manual. But I don't have a strong preference if you think think
> >>> using 0xef528050 makes the CCU_GATE macros easier to read.
> >>
> >> Thank you for your comment.
> >>
> >> This was discussed some time ago. The main issue was that the address
> >> space was fragmented between clocks and resets. Initially, I proposed
> >> using syscon as a way to abstract this, but the idea wasn't particularly
> >> well received.
> >>
> >> So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_CFG
> >> I need for resetting the GPU.
> >>
> >> For reference, here's the earlier discussion: [1]
> >>
> >> [1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org/
> >>
> > 
> > In that email I said you should have one node
> > clock-controller@ffef528000. Why did 0x50 get added to the address?
> 
> Hi Stephen,
> In the v2 version of the patchset, there was no reset controller yet, so
> I thought your comment was made referring to that earlier version.
> This representation clearly describes the hardware correctly, which is
> the requirement for the Device Tree.
> 
> The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
> starting at 0xFF_EF52_8000:
> 
> GPU_RST_CFG             0x00
> DPU_RST_CFG             0x04
> MIPI_DSI0_RST_CFG       0x8
> MIPI_DSI1_RST_CFG       0xc
> HDMI_RST_CFG            0x14
> AXI4_VO_DW_AXI          0x18
> X2H_X4_VOSYS_DW_AXI_X2H 0x20
> 
> And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at offset 0x50:
> VOSYS_CLK_GATE          0x50
> VOSYS_CLK_GATE1         0x54
> VOSYS_DPU_CCLK_CFG0     0x64
> TEST_CLK_FREQ_STAT      0xc4
> TEST_CLK_CFG            0xc8
> 
> So I considered this back then and thought it was appropriate to divide
> it into two nodes, as the reset node wasn't being considered at that
> time.
> 
> When looking for the reference [1], I didn't notice if you corrected
> yourself later, but I do remember considering the single-node approach
> at the time.
> 
> > 
> 
> Best regards,
> -- 
> Michal Wilczynski <m.wilczynski@samsung.com>

I chatted with Stephen on irc about setting up a thead clk branch and
sending pull requests to Stephen.

Stephen - are there changes in this series that you want to see in order
to give your Reviewed-by?

Thanks,
Drew
