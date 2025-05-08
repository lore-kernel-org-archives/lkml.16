Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999F226170
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708209; cv=none; b=gAM/TWfKLST6sGBGCkS61HnrVCRJREVxTWVKh9dvrqx15iAjNWMj6SJu6c9EFuqDRySORckueaxtuXAd18MIzmi3VNpnu06DoOjzHDkh2GWy3ersHL5NxRdYmFC685GnQFCewHYEFDpIbjw5RqdvBHcPqsQeAC6Bf+IH8ZOaY+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708209; c=relaxed/simple;
	bh=zG7qqson8ltj7u0zdwfOfJteViT6Z7xCoIr6JY2V/08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YUV7L5gE3LS6dRhYjKSizU4Y2JRVBU2aIjg5VrOjIFZpLtPFDJoFsPGjeNkvLEC6EiZk6pnWSF3/EHdaWmYCfkItksUQjr3tFPNBa8QGko+3r/gXd4wTjHKeqtAjZZiEVF1CkmScutUcrnlK9iCFmki+Z7FQnJpih8Lwti4PxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=OIkSZspv; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="OIkSZspv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746708195; x=1746967395;
	bh=0+XgH0rIRqKV07OTyvhe5YqpcOYz2bBf5mCHrTax72w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=OIkSZspvQ4QqIyHkLoBDX1f0k8Cunqwe+LQyURHMMvZxOEboElm85r6ayAoW35GlN
	 Z/S1BfBApmOZQvIiuTd1GIczM8VrooixpwCUYIUrKRMsf8kFNGwfR/H7qO0muDfsEP
	 6kc+cxcFZ91D5BldZqvDZqWHo2Cb3L0xI31exXwPqjmy9kFcMtVgLl2pITatMJq/XR
	 +2YnTkC038n5zWlehvX3OvTUI0G4yuNkNPwhdx57ZYDbhFdJXYlD3TkQBNDRlJxTl2
	 q+id2RrZuiE4lR58Rh9pLtTayn/3CTIYodWPlCO127xpaX9+A6DG/O/kb1e0By0xOU
	 /T6jR/nOdLUIA==
X-Pm-Submission-Id: 4ZtWy62rNnz454
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <5724399.aeNJFYEL58@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 14:25:44 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<7023673.LvFx2qVVIh@steina-w> <87ecwzy0pw.fsf@geanix.com>
	<Etws1ew28TLJxt4SyQRijrPqBXWRnMQ518XgfauJ5tEfgI2y1mms25jjdVACQnjc2jZmc-PHiK4BIVQ4M8a09A==@protonmail.internalid>
	<5724399.aeNJFYEL58@steina-w>
Date: Thu, 08 May 2025 14:43:09 +0200
Message-ID: <87a57nxogy.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexander Stein" <alexander.stein@ew.tq-group.com> writes:

> Hi Esben,
>
> Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
>> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>>
>> > Hi Esben,
>> >
>> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
>> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> >>
>> >> > Hi Stefan,
>> >> >
>> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> >> >> Hi Alexander,
>> >> >>
>> >> >> [add Shawn and Esben]
>> >> >>
>> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> >> >> > Select PINCTRL for NXP i.MX SoCs.
>> >> >> could you please explain the motivation behind your change?
>> >> >>
>> >> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
>> >> >> disable pinctrl")?
>> >> >
>> >> > Ah, thanks for the pointer. It might be the case.
>> >>
>> >> The goal of the patch mentioned above was to be able to build a kernel
>> >> for LS1021A without pinctrl framework enabled, as LS1021A does not have
>> >> a pinctrl driver.
>> >>
>> >> With your patch, that would not be possible anymore.
>> >
>> > Why? LS1021A is arm, not arm64 which this patch is touching only.
>>
>> Good point :)  Sorry about that.
>>
>> > BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selection")
>> > is actually doing the same for arm as there is some fallout from
>> > 17d21001891402.
>> >
>> >> > I noticed that, when using arch/arm64/defconfig and disabling all
>> >> > platforms despite ARCH_MXC before running make olddefconfig,
>> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
>> >> > noticed this when building in yocto and non-IMX platforms are disabled
>> >> > for build time reasons.
>> >>
>> >> But is that something that needs to be fixed?
>> >>
>> >> It sounds like quite a special use-case, and why not simply enable
>> >> CONFIG_PINCTRL in that case then?
>> >
>> > PINCTRL is crucial for any SoC to even boot, so this is an option which has
>> > to be set if that platform is enabled.
>>
>> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
>> You need the correct pinctrl driver.
>>
>> Making the various SOC's select the corresponding pinctrl drivers makes
>> sense if it is required for booting under all circumstances. And this
>> should then indirectly enable/select PINCTRL and anything else needed
>> for that driver.
>
> If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
> (e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
> SOC_IMX8M.

For SOC_IMX35, it should be selected by default.

    config PINCTRL_IMX35
            bool "IMX35 pinctrl driver"
            depends on OF
            depends on SOC_IMX35 || COMPILE_TEST
            default SOC_IMX35

For the IMX8M* SoC's, that is not done, as there is only a common
SOC_IMX8M config entry, which corresponds to multiple pinctrl drivers,
which we probably don't want to select all of by default.

>> Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
>> Enabling a driver framework without enabling any drivers for it, when
>> building a kernel where no SOC's requiring any pinctrl drivers is kind
>> of weird. If you want to do that, why not simply enable both ARCH_MXC
>> and PINCTRL in your yocto recipe?
>
> PINCTRL is currently only enabled because other SoCs happen to enable it,
> just this feels just plain wrong. If these platforms are disabled or
> removed for whatever reason, the other platforms should still work.

As it is now, to build for let's say i.MX 8M Plus, you have to enable
    SOC_IMX8M
    PINCTRL_IMX8MP
to get a kernel that is likely to boot.

If you enable
    SOC_IMX8M
    PINCTRL
but not
    PINCTRL_IMX8MP
you won't have pinctrl support, and the kernel will probably not work as
expected.

What am I missing?

/Esben
