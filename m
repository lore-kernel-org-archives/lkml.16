Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B6B221568
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686677; cv=none; b=BXbLgeZrfq00vd6dUstRlPibaepF8bUAxGZJLGE9N7S1HutbRj+Oj+KOw+8Xc18wtVZ+lREAAbvP5VAHshvrZ7x381oer7pLx4hPh7nQRqgW4MWMwfZBJ0FlJk/GHeAgu+TEZ/HP5kydwDvJ0ZDcy9PKmTZStviPNQlVqRbyj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686677; c=relaxed/simple;
	bh=EjIflxf0PMqL3GkKCchBLJ00PdYJCgwDSzaUEWiKaCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZwrCN7U0OZgZ9pyTVZYoI/LEn3VbtaQOWdzROM50jtjLnNmNGxe/ccOnS72nYCDiTI16fcj/jhpVKFx0KhT/KBVESUcFIDRmNweFnYvivKkS6/RN9KD6FURAWYlhLIzPiVm+ptw69l3J0tMxzhMqWj6rKuVIpPKc2gpPVpXNHFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=JG/Of3h2; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="JG/Of3h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746686664; x=1746945864;
	bh=PA0DZjgWtTMK+N921iS75B6LpBzP1P2gEVRwQX5rucY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=JG/Of3h2F8CvXIqft9IesNqX/4lGuDOODZvye6cTGBQ1DJkQ9bKXxGcH9Xz9M+s6E
	 2PBYjFlVWtClSHAyJbDttvI2EErBnL8jqtT8AFc8FnI3utE1VvjKSJ96g+nH7F0O+A
	 0namVmqKMw02mIGCHRKJEQh5YJtbW2lafKRJ8qRxpovf0ECOuQSikPUzmZ+FQkczkO
	 Wnv7Xelg0S3ZDAWdASYCRZytlJuT06cKRt1/bpHq3W8aUreea0eF1JgGrle5fTZIqH
	 7lkIa8KanSgrZONmDGhhe6o9hSWTIcsFKIT/uSCm08wDldEQ+oxG32PmIetCWkJXwo
	 BNU8MPqccCWDw==
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <8259306.DvuYhMxLoT@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 07:52:58 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<5af33290-e7d8-437c-a22f-5b873596d67a@gmx.net>
	<rp4MSsRpdVGoLk5RPFi7xIPZluJJG97RxbkgWMHmLHRCp8gVdt6GN4xz2Mh7vZ7XAQ9uT3HgrjxAf1toMvIt9w==@protonmail.internalid>
	<8259306.DvuYhMxLoT@steina-w>
Date: Thu, 08 May 2025 08:44:22 +0200
Message-ID: <87ikmby52x.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexander Stein" <alexander.stein@ew.tq-group.com> writes:

> Hi Stefan,
>
> Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> Hi Alexander,
>>
>> [add Shawn and Esben]
>>
>> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> > Select PINCTRL for NXP i.MX SoCs.
>> could you please explain the motivation behind your change?
>>
>> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
>> disable pinctrl")?
>
> Ah, thanks for the pointer. It might be the case.

The goal of the patch mentioned above was to be able to build a kernel
for LS1021A without pinctrl framework enabled, as LS1021A does not have
a pinctrl driver.

With your patch, that would not be possible anymore.

> I noticed that, when using arch/arm64/defconfig and disabling all
> platforms despite ARCH_MXC before running make olddefconfig,
> CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
> noticed this when building in yocto and non-IMX platforms are disabled
> for build time reasons.

But is that something that needs to be fixed?

It sounds like quite a special use-case, and why not simply enable
CONFIG_PINCTRL in that case then?

/Esben

>> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> > ---
>> >   arch/arm64/Kconfig.platforms | 1 +
>> >   1 file changed, 1 insertion(+)
>> >
>> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> > index a541bb029aa4e..49c3bc25e5f68 100644
>> > --- a/arch/arm64/Kconfig.platforms
>> > +++ b/arch/arm64/Kconfig.platforms
>> > @@ -219,6 +219,7 @@ config ARCH_MXC
>> >   	select ARM64_ERRATUM_845719 if COMPAT
>> >   	select IMX_GPCV2
>> >   	select IMX_GPCV2_PM_DOMAINS
>> > +	select PINCTRL
>> >   	select PM
>> >   	select PM_GENERIC_DOMAINS
>> >   	select SOC_BUS
