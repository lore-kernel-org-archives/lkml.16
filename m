Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EEB21D5AF
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692323; cv=none; b=DsE6a2twPrZfs7EqD7fx6gsItNUBJXw9LeO12kNjBgnFmHDRPHvum+h7xZerzWbNzaRBqsn9Bg3H1vBSLcgiz2PbrN/NcftR188GoRxMqLp+U68KbVMXTQPqkMx7UZsEDRkbwmofr2lnH0M0lLnfd4qIFNpLSONdil0OvoLUT1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692323; c=relaxed/simple;
	bh=KJPAU3BlH/ZQ/V3KOeYUQg5NIF/bRnoT8SqeEZa+eYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QAei+TXImBS0B85E4PT0z7bt6WHsGqFJiitdztRtLuWogoNJlc7JlH5YSBh5WrybtmCMYbv3z8aUeOyPL9kgZ7y3Rhezy9BAbMt781twNWkFdpYnK5Obde4LYV4ht19p9GQpqMiTxE78nffFjkza43OUpE2GOdSAfXVV51pQpHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=R3ulwkpf; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="R3ulwkpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746692317; x=1746951517;
	bh=QNHOSukK1UcSrlpey88fVbHswOXSe7CxCfbANrroJZk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=R3ulwkpfSe4mEFDXNGvGmr+WwEJOcMYAs07M4nB4EBAJKxQd3Kri/eM8D8rRSutwf
	 XXohYvddj44SrrN6ptWZAfwhgS4R9J3PeQ2k//AwiHaMhJtI7B1vz7vUoJNvPGV1gv
	 y2tePcG43syU0fNczuGaX9kPnI5uVKB8S9RiZe8rKNRGsrP6qCOgnHBuHZuHJodP9U
	 nMlxN44/0MNIcmOFzsvUsYTw8fYv9+xatjHN32g5qbX6PVaSBZ/RKFCDp5KvOc5TBb
	 o2sm8jHbusjyV2OO3n9XD7b8hFbwumtELqY1wrau8bOUmWNCgMmGPyPuZ7i2NHvWNd
	 D3COFkyCUieZA==
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <7023673.LvFx2qVVIh@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 10:07:27 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<8259306.DvuYhMxLoT@steina-w> <87ikmby52x.fsf@geanix.com>
	<OcbHk6MrExXjxyTadV3NcE9xJDrgio7H-_tyJ9Gg3Nk95KDJa9rKDbVBh7c7pZp8ZyBe1tmmvriFglTBKbyI1w==@protonmail.internalid>
	<7023673.LvFx2qVVIh@steina-w>
Date: Thu, 08 May 2025 10:18:35 +0200
Message-ID: <87ecwzy0pw.fsf@geanix.com>
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
> Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
>> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>>
>> > Hi Stefan,
>> >
>> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> >> Hi Alexander,
>> >>
>> >> [add Shawn and Esben]
>> >>
>> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> >> > Select PINCTRL for NXP i.MX SoCs.
>> >> could you please explain the motivation behind your change?
>> >>
>> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
>> >> disable pinctrl")?
>> >
>> > Ah, thanks for the pointer. It might be the case.
>>
>> The goal of the patch mentioned above was to be able to build a kernel
>> for LS1021A without pinctrl framework enabled, as LS1021A does not have
>> a pinctrl driver.
>>
>> With your patch, that would not be possible anymore.
>
> Why? LS1021A is arm, not arm64 which this patch is touching only.

Good point :)  Sorry about that.

> BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selection")
> is actually doing the same for arm as there is some fallout from
> 17d21001891402.
>
>> > I noticed that, when using arch/arm64/defconfig and disabling all
>> > platforms despite ARCH_MXC before running make olddefconfig,
>> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
>> > noticed this when building in yocto and non-IMX platforms are disabled
>> > for build time reasons.
>>
>> But is that something that needs to be fixed?
>>
>> It sounds like quite a special use-case, and why not simply enable
>> CONFIG_PINCTRL in that case then?
>
> PINCTRL is crucial for any SoC to even boot, so this is an option which has
> to be set if that platform is enabled.

Yes, but PINCTRL (framework) does not by itself do anything meaningful.
You need the correct pinctrl driver.

Making the various SOC's select the corresponding pinctrl drivers makes
sense if it is required for booting under all circumstances. And this
should then indirectly enable/select PINCTRL and anything else needed
for that driver.

Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
Enabling a driver framework without enabling any drivers for it, when
building a kernel where no SOC's requiring any pinctrl drivers is kind
of weird. If you want to do that, why not simply enable both ARCH_MXC
and PINCTRL in your yocto recipe?

/Esben
