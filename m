Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D31F27C875;
	Thu,  5 Jun 2025 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152522; cv=none; b=qpIPntFgR4V45HGwLIebBJZoTELO0sFqXJ19QBKgNvMRj+EW3ds2Dz+DFUwA5FARJp5ti0KtPxwfz+9esdRZ/b0675jpC0JEmu/gLsUVWir57ANH+Y2XFKnNUqOV65IFDaK1Nerrb92NQfkF+XmM8LvrkMw+Ar1GC9dPZMHAE8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152522; c=relaxed/simple;
	bh=/oeOikRCVc75mRYlz60dHqs3VC+0eqPN2O3dFH58FeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvpM0ypibZ1DUtHC/pOQDZe+/dABZQHQuMs7hUA3jad/hPV8baWL5VaVdABeat2GQHGvyMIjxSZomtNtbtxNaroCVJ5cukKj7/X+2lOveiOpC+DsrGXNoO85EMsUb/Ol0J800oWJc8hLJLSP/r97FGAfBO7reAB5nS9VN6bMnSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs4vplCN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs4vplCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424BCC4CEF0;
	Thu,  5 Jun 2025 19:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749152521;
	bh=/oeOikRCVc75mRYlz60dHqs3VC+0eqPN2O3dFH58FeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs4vplCNxnMotvO+YBSEbYEggdm/N7gei6jp7DyncaYzVGxaTpTcMNdz8P4T4ECIT
	 YeA0hr3Xz5W1RGNyVuPGwVBfGpqHVRZj8ezwhcPdjBbDEtGoRusvLu+cLUrsCa9moR
	 7ObaPX5SG3U7DaJ3JLiGj7rHbTDjw7u1MATAi2isa/OsKn5A30DaByjrqqCRyRurWl
	 CdUS94cwsVc633dF5knLvvljR6ghRm/kgA0BtT+nwTKYzFchEuVer2x5qqlCwp5u3w
	 wro77pFw0mnRG0XHNK4tUnhA9WWwD8iUsS7xwul3pOK9okOIOYhiOY/8BNtMySfGo/
	 hcjovGxHrtTHw==
Date: Thu, 5 Jun 2025 14:41:59 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-rockchip@lists.infradead.org,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset method
Message-ID: <20250605194159.GA3039863-robh@kernel.org>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
 <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
 <2577051.irdbgypaU6@workhorse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2577051.irdbgypaU6@workhorse>

On Tue, May 27, 2025 at 01:18:20PM +0200, Nicolas Frattaroli wrote:
> Hi Quentin,
> 
> On Tuesday, 27 May 2025 11:26:49 Central European Summer Time Quentin Schulz wrote:
> > Hi Krzysztof,
> > 
> > On 5/27/25 11:08 AM, Krzysztof Kozlowski wrote:
> > > On 27/05/2025 10:48, Quentin Schulz wrote:
> > [...]
> > >>
> > >> likely a purpose to it. Especially if they also change the
> > >> silicon-default in their own downstream fork AND provide you with a way
> > >> to change their new default from Device Tree.
> > >>
> > >> We can hardcode the change in the driver without using DT, but I wager
> > >> we're going to see a revert in a few releases because it broke some
> > >> devices. It may break in subtle ways as well, for example our boards
> > >> seem to be working just fine except that because the PMIC doesn't
> > >> entirely reset the power rails, our companion microcontroller doesn't
> > >> detect the reboot.
> > >>
> > >> If it's deemed a SW policy by the DT binding people, is there a way to
> > >> customize this without having it hardcoded to the same value for all
> > >> users of RK806 and without relying on module params?
> > > 
> > > sysfs, reboot mode etc. I don't know what is the right here, because you
> > > did not explain the actual hardware issue being fixed here. You only
> > > described that bootloader does something, so you want to write something
> > > else there.
> > > 
> > 
> > We have a companion microcontroller on the PCB of both products which 
> > needs to detect if the board was reset. When the board is reset, the MCU 
> > FW does a few things, like essentially resetting its internal logic such 
> > as the PWM controller (so the beeper stops beeping), watchdogs and 
> > reinit most user-exposed registers so that it's like "fresh" out of 
> > reset (even though it actually wasn't reset since it's continuously 
> > powered, not from the PMIC).
> > 
> > To detect a reboot, it senses one of the power rails (DCDC8; vcc_3v3_s3 
> > on our boards) from the PMIC. This power rail is only "restarted" when 
> > RST_FUN is set to 0 ("restart PMU" mode) according to our experiments.
> > 
> > I assume it is possible other boards do not want this (all?) power rail 
> > to be quickly interrupted when rebooting? But that I do not know.
> 
> I agree that this sounds like a pretty big change in behavior, yes. I am
> somewhat suspicious of any silent mainline difference from silicon defaults
> as being the result of cargo-culting from downstream hacks to make things
> work, and are unresolved technical debt in need of cleanup.
> 
> On the RK3576 board I'm currently working on, where an RK806 is used as
> well, then DCDC8 cutting out would wreak havoc on warm reboots I'd wager
> as it's used for a lot of 1.8V IO voltage supply things, including one
> instance where the DCDC8 rail going low would feed into a downstream
> regulator that's being kept enabled as long as a different supply is on.
> 
> If you don't want to deal with DT bindings people (sysfs for reset
> behaviour? What?) a workaround for this could be to add the necessary
> register write to your bootloader's (probably u-boot?) board init code.
> 
> I do think however that "what does this board hardware expect to happen to
> power rails on reset" is a pretty strongly board specific non-enumerable
> hardware difference that belongs in DT as a declarative property, but
> perhaps in a different form than the bare register contents for this, so
> that it can hopefully be used as a more generic (even if vendor) property
> for future PMICs going forward. Think regulator-always-on but for this
> specific case.

I don't have an issue with this being in DT as it would seem to me to 
be based on how the board is wired. However, how does reset work before 
you run something that parses the DT? Seems to me it needs to be 
initialized early (or power on in the right state).

Rob
