Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CD51DF270;
	Tue, 27 May 2025 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344731; cv=pass; b=kn/aNP5MjFfKRc02cRLfsBw3wKPO0K8J+rnDRdeoJitkM3m9j+VmoiQ6od6fqe8tVGC3Odwzv+XG34E1T33LsyKv6iuHtmO+e/Go2uV92HZVcDKyhN1WEt447RgbBJEkPEpXT04WqQntWFZKRsbo2SXgQTESFzZFvh0lePMMIyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344731; c=relaxed/simple;
	bh=x+KjAG5FU2IKs9NhJhGw09OeA2gyYSndUkJcawuzLmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttZVU9+84vr6wXx/RNNpAIdxpi+KlNn/NW9LauuzZTOTJrVCoIM34Ce7A3z9N3wTt0nb56CTXSxgFtgKC+F71NnwHnjObJwPREDaiT2MfW8BzH18Zi0GtO4XOf4aN+NPJjtSCHuOQbdcAf2nR88I+YCwUG7ROr7h1eK+zifT0LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=NLKCZ8t4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="NLKCZ8t4"
ARC-Seal: i=1; a=rsa-sha256; t=1748344707; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OjEgOVngOzj8l+dowMDZx9/zcZW/KtH42PWDJWw8aQbd/7Jq6g+VqwWNFIzDTy/YcFXA6AT4rdZuUl8BKNvIimCkrlvftz6d3YEE3pBNBEcKecEXWpNKNJkA/hqfQTU8Fxli5f9DOrIHiDhkhyrrFfAGdNF2J9gF40bZpg4g0cE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748344707; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0/VHCtcXRMZriu1nB8uzMBAKyPh887u/wlS2pjs87xE=; 
	b=Sq6VJK+ZnGPTNH2DmmWQJcryqNc3hr+8bYcmBNEGQVWv27LkfR1ue6ZIM4k0VB8kCjJ9M0U3/REg9a2X/f0Di8fbsoMZn6itllu+uNLx2p1y42s9stRIZlWLJ9zDLL+ERXDVG9+ymrs589dj1HOuz/69+e9IIlCn9I61V1XEC8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748344707;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=0/VHCtcXRMZriu1nB8uzMBAKyPh887u/wlS2pjs87xE=;
	b=NLKCZ8t4vuGbM54XFGJE0/ez8Kivmga5chUE+jTrPesByu7GQVHYEVmNkU0O5tPp
	BKqL9OsQL6eMCmCLJTK4kiQFBrfKAm0QGYnNxsqNt//5XUDLEZtIUKmNaSfbDDnaF4F
	opzoZ/T6vDt8sS2i8iAeJBjvqJ5XYmgfAEG3QlzA=
Received: by mx.zohomail.com with SMTPS id 1748344705103666.6724010540661;
	Tue, 27 May 2025 04:18:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-rockchip@lists.infradead.org
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC reset method
Date: Tue, 27 May 2025 13:18:20 +0200
Message-ID: <2577051.irdbgypaU6@workhorse>
In-Reply-To: <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
References:
 <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
 <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Quentin,

On Tuesday, 27 May 2025 11:26:49 Central European Summer Time Quentin Schulz wrote:
> Hi Krzysztof,
> 
> On 5/27/25 11:08 AM, Krzysztof Kozlowski wrote:
> > On 27/05/2025 10:48, Quentin Schulz wrote:
> [...]
> >>
> >> likely a purpose to it. Especially if they also change the
> >> silicon-default in their own downstream fork AND provide you with a way
> >> to change their new default from Device Tree.
> >>
> >> We can hardcode the change in the driver without using DT, but I wager
> >> we're going to see a revert in a few releases because it broke some
> >> devices. It may break in subtle ways as well, for example our boards
> >> seem to be working just fine except that because the PMIC doesn't
> >> entirely reset the power rails, our companion microcontroller doesn't
> >> detect the reboot.
> >>
> >> If it's deemed a SW policy by the DT binding people, is there a way to
> >> customize this without having it hardcoded to the same value for all
> >> users of RK806 and without relying on module params?
> > 
> > sysfs, reboot mode etc. I don't know what is the right here, because you
> > did not explain the actual hardware issue being fixed here. You only
> > described that bootloader does something, so you want to write something
> > else there.
> > 
> 
> We have a companion microcontroller on the PCB of both products which 
> needs to detect if the board was reset. When the board is reset, the MCU 
> FW does a few things, like essentially resetting its internal logic such 
> as the PWM controller (so the beeper stops beeping), watchdogs and 
> reinit most user-exposed registers so that it's like "fresh" out of 
> reset (even though it actually wasn't reset since it's continuously 
> powered, not from the PMIC).
> 
> To detect a reboot, it senses one of the power rails (DCDC8; vcc_3v3_s3 
> on our boards) from the PMIC. This power rail is only "restarted" when 
> RST_FUN is set to 0 ("restart PMU" mode) according to our experiments.
> 
> I assume it is possible other boards do not want this (all?) power rail 
> to be quickly interrupted when rebooting? But that I do not know.

I agree that this sounds like a pretty big change in behavior, yes. I am
somewhat suspicious of any silent mainline difference from silicon defaults
as being the result of cargo-culting from downstream hacks to make things
work, and are unresolved technical debt in need of cleanup.

On the RK3576 board I'm currently working on, where an RK806 is used as
well, then DCDC8 cutting out would wreak havoc on warm reboots I'd wager
as it's used for a lot of 1.8V IO voltage supply things, including one
instance where the DCDC8 rail going low would feed into a downstream
regulator that's being kept enabled as long as a different supply is on.

If you don't want to deal with DT bindings people (sysfs for reset
behaviour? What?) a workaround for this could be to add the necessary
register write to your bootloader's (probably u-boot?) board init code.

I do think however that "what does this board hardware expect to happen to
power rails on reset" is a pretty strongly board specific non-enumerable
hardware difference that belongs in DT as a declarative property, but
perhaps in a different form than the bare register contents for this, so
that it can hopefully be used as a more generic (even if vendor) property
for future PMICs going forward. Think regulator-always-on but for this
specific case.

> 
> Cheers,
> Quentin
> 

Kind regards,
Nicolas Frattaroli



