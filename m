Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167823CE;
	Sat,  3 May 2025 23:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746315622; cv=pass; b=bapdrg38Cz+ThXl4eno173KZZenDIfmspFw3xuja+jdNIkzW7LBJhonYj1vW9++iHnGBRpSRhBmBJQM9X74RPOOJCTRQZ1OKGMSamH/qeh0MYMomOGKTHkcLdc2v364+AiQrZQUcaKWBcEo1yTxRP59ic0KrlKdvrnnFZwTa2/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746315622; c=relaxed/simple;
	bh=+xlzu7TY4i23oFD1lNRLmD1idANXcHza33SYA2DDfAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+6Qh0VOs03PKUGO7N/uJ4Q06UgQy+gIK0tT0QfkLQ/ZBMmSYUfIxaN6PgfZMjJJG/YWKQ6yl9CxGMpTIq0qTsDuMTGCQKRT+/BAZDpLLPtvmwKK+6wLndN0ogpDms/sdrnNM+dMfjx5c7LjS1ZH4G/HZ0TOWkuH+c3JrhMxx6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=DmLS6uue; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="DmLS6uue"
ARC-Seal: i=1; a=rsa-sha256; t=1746315604; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h3oBEbQ4Tc0PcFmrW0gG3E/hrZdrTsdDgFj8Uj1xu4hzo+R0KOiLBcbU9aZFrHvMOh+1HTwkJ76tBf3ZzLAbkuNjlwwUgjJy4Qdvr+xw6oGLZPIkudfN2mwp2++Y7cznAI1YOSq0XBFxT1qtlhuOynAFfPvmEZBmeWr9vDxVI+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746315604; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FC4UR7XY6OT5T5snA1Y0JUXPeWUT8yWLzkhZXauwCIQ=; 
	b=DjTtMgUEg8NSpNDsxEwM4k2xv1SEpWm7hiVzcctpTsgQeHpr4gTm3aMaNLwgNpcn2cD/R5onNbVl3UxLk236Osz6ntEfZukqwYAdADAebro0cLkAKZ0+4OxpMVXti+YrS9kSK+teOTYCDGxc7VcwpIIAhhD35EjG54kFioekf0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746315604;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=FC4UR7XY6OT5T5snA1Y0JUXPeWUT8yWLzkhZXauwCIQ=;
	b=DmLS6uuezndQrfFIj98tyWBnpryS4HCrbFmC86mqM6wze6bniA/+jbI3Bh9PxUIn
	nBvozmjKtBipWAT7EYrTncxcF52HKoj4dypfOydSsL0h8BMpnyK9vpSvJY6Sjmscslk
	es88CBpWuJIDeYiFparjMkUZuI4PtEte2LsoCPZI=
Received: by mx.zohomail.com with SMTPS id 1746315601890223.16037950078783;
	Sat, 3 May 2025 16:40:01 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: heiko@sntech.de, John Clark <inindev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 detlev.casanova@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Clark <inindev@gmail.com>,
 sebastian.reichel@collabora.com
Subject:
 Re: [PATCH v1 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Sun, 04 May 2025 01:39:56 +0200
Message-ID: <7462454.lOV4Wx5bFT@workhorse>
In-Reply-To: <20250502205533.51744-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 2 May 2025 22:55:30 Central European Summer Time John Clark wrote:
> This series adds device tree support for the Luckfox Omni3576 Carrier Board
> with Core3576 Module, developed by Shenzhen Luckfox Technology Co., Ltd., based
> on the Rockchip RK3576 SoC. The board supports various peripherals, with this
> initial implementation enabling essential functionality for booting Linux and
> basic connectivity.
> 
> Supported and tested features (on Linux 6.15-rc4):
> - UART: Serial console operational.
> - SD card: Mounts and reads/writes successfully.
> - PCIe: NVMe SSD detected via lspci.
> - Ethernet 0: Functional with RGMII PHY.
> - USB: Host ports detect devices.
> - RTC: Timekeeping and wake-up tested.
> - LED: Heartbeat trigger works.

Hi John,

> 
> Disabled features:
> - eMMC: Not populated on the tested board; believed to be functional but disabled.
> - HDMI: Disabled due to mainline driver maturity issues (basic 1080p output works; audio and 4K untested).

that's not a good reason to disable the node, in my eyes. HDMI 2.0 4K output 
should work AFAIK, HDMI audio will land with the already posted SAI audio 
controller patch set. Is there any specific issue like an SoC lock-up you ran 
into that is keeping you from enabling it? If so, please do let the mailing list 
know.

> - Ethernet 1: Disabled as it does not come up, possibly due to PHY configuration or driver issues.
> 
> Patch 1: Add luckfox vendor prefix for Shenzhen Luckfox Technology Co., Ltd.
> Patch 2: Add luckfox,omni3576 binding to rockchip.yaml
> Patch 3: Add rk3576-luckfox-omni3576.dts and Makefile update
> 
> The new DTS is covered by the existing ROCKCHIP ARCHITECTURE entry in MAINTAINERS.
> 
> I am aware of ongoing RK3576 upstreaming efforts (e.g., by Collabora) and
> welcome feedback or collaboration to align with mainline driver development.

I can't speak for the longer term outlook as that's neither my area of expertise
nor my position to make statements about that, but I can give a general overview
of what I myself am working on right now in relation to the RK3576. The general
theme is that most of the low-hanging fruit has already been plucked, so the
bigger drivers remain.

- RK3576 USB Type-C OTG stuff: the USB 2 PHY driver needed some changes to make
  this work. I've yet to send out v2 that reworks the way we detect a type-C
  port, but that part of the code is already done. I was basically just letting
  it stew on my local machine for a bit longer to see if I can figure out why
  superspeed only works in one cable orientation, and to give the mailing list
  some room to breathe, as I've been sending quite a bit of stuff lately.
- RK3576 HWRNG: has already been posted by me, and it's a small enough series
  that I don't see many problems on the horizon with it.
- RK3576 eMMC PD fix: this needed a few revisions but was merged just recently
- RK3576 Thermal ADC: v5 is currently awaiting review, and it's quite a mature
  series by now.
- RK3576 SAI (Audio Output): driver + binding already merged, sent out a v3
  recently to fix an issue with the clock driver part of that patch series.
- RK3576 PWM: v1 of my MFPWM patch series needs some changes. I plan on getting
  around to this in the coming week, bar any other more pressing things on my
  table.
- RK3576 SATA: I sent a tiny patch series to enable this, and it was already
  merged in time for v6.16.

If you do want a small driver to work on that should be easy to port to mainline
and hasn't been done yet, I recommend SPDIFRX. You can find it in
`sound/soc/rockchip/rockchip_spdifrx.c` in the vendor tree. It's around 400
lines, and on your board you should be able to have a pin on the 40-pin header
that can be set to pinmux to the SPDIFRX controller, namely pin 35, aka
GPIO4_B2, aka the third-to-last pin on the side that ends with a GND. You will
need some source of an SPDIF audio signal at the right voltage for that. The
most humorous choice is either the board itself or another Rockchip SBC.

If the driver is a straight-forward port and minor cleanup, leaving the original
author in place for the patch sent upstream is the courteous thing to do. If
there's more work involved than just a few lines changed or downstream-specific
parts deleted, I usually like to include the original author with their signoff
in a `Co-developed-by:` tag, to give credit where credit is due.

I should also mention that Collabora has a public issue tracker on our GitLab
to keep track of Rockchip upstreaming matters. An issue being on it doesn't
necessarily mean that we have any plans to work on it, it just means an engineer
remembered this was a thing and noted it down. Things we actively are working
on are usually assigned to a specific person, unless said person (me, usually)
forgets to do so. You can find it here:
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/issues

> 
> Signed-off-by: John Clark <inindev@gmail.com>
> 

Kind regards,
Nicolas Frattaroli


