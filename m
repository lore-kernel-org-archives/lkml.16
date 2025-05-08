Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972AD2853E1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724211; cv=none; b=YVa0zfDgAAmnMKTe1lzQGRne3WJ9XrmUbqK6wH9HT39L5iQiolJfdyF83wJScwCvQS86vkW6Xx4GJxtYCnbjjm2xwQtDOCVVGxOU03Mji1bG+MYhtqVEgtn/U+iUhs/qo6qHVpsiDFmUjrgfo2gAlOsFw8KnT8kJ7UJVJLVup1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724211; c=relaxed/simple;
	bh=mdconGVaOKX4ffD7nWs+BKRFIhht7uTsQqevc94EmR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W2IxxntjpkMOvA8ajidV+wEhyNlXUpYGFNBD30gDha04xozKGwzIGOh0whxaL4mO1c9pSEEHewbLdH9D/Mm1QMgZnwp9CFKXXnTW/91CVxCqhLSLo1IxAlcmK7SVFXt2j9pNYW2v3U21ZKKE6bEEOyBGu59dkPXBZ6w/ZQh1K5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=AYvzsXxL; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="AYvzsXxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746724200; x=1746983400;
	bh=e/fd/QdmYac4W+wfV9CB8/vjp3FgLg+QnA/XaSaZSTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=AYvzsXxL6h1+eijXThsjW3ckLwn4A18iekWbFFgaqh6krd2I6ID1Ju4H7kyYVRMZQ
	 hwaQjesXHvcrTRMhqsKnNE3sgNjKC5QPcrFG1a0NVX4K1ReHOW6WizWmiPR5qkUT+p
	 tD9T6Mc4fXqiXA6TAByTNtz+TXubJlU4/d5uQ2BPzYGSRb7azDPfjRYrheonqnL6xz
	 H2dfgCqck8YfRJmSwPZGGkiFtVeHaNUHxDlflu8eyEpeQPxSmsfi7iFRKHoTcA55/k
	 vw70qKYyjkeNwvS3fRriaLekuXKuUJ3/zeipVekgm3aIPxGboKFshOm+4InXXsNR+m
	 6y+aM7lG61l8g==
X-Pm-Submission-Id: 4Ztdsy4mVWz4wx9Y
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <6002097.iIbC2pHGDl@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 15:18:04 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<5724399.aeNJFYEL58@steina-w> <87a57nxogy.fsf@geanix.com>
	<kUQplj_lxisPWthzRoWcVoRtp5bycldVvw8f7SsR3PVfpzcnS9VNTPmEfDeC7gIRGK6_FR2EFXSAAuoYGH6D_A==@protonmail.internalid>
	<6002097.iIbC2pHGDl@steina-w>
Date: Thu, 08 May 2025 19:09:57 +0200
Message-ID: <87ikmbav16.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexander Stein" <alexander.stein@ew.tq-group.com> writes:

> Am Donnerstag, 8. Mai 2025, 14:43:09 CEST schrieb Esben Haabendal:
>> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> > Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
>> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> >> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
>> >> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>> >> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> >> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> >> >> > I noticed that, when using arch/arm64/defconfig and disabling all
>> >> >> > platforms despite ARCH_MXC before running make olddefconfig,
>> >> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
>> >> >> > noticed this when building in yocto and non-IMX platforms are disabled
>> >> >> > for build time reasons.
>> >> >>
>> >> >> But is that something that needs to be fixed?
>> >> >>
>> >> >> It sounds like quite a special use-case, and why not simply enable
>> >> >> CONFIG_PINCTRL in that case then?
>> >> >
>> >> > PINCTRL is crucial for any SoC to even boot, so this is an option which has
>> >> > to be set if that platform is enabled.
>> >>
>> >> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
>> >> You need the correct pinctrl driver.
>> >>
>> >> Making the various SOC's select the corresponding pinctrl drivers makes
>> >> sense if it is required for booting under all circumstances. And this
>> >> should then indirectly enable/select PINCTRL and anything else needed
>> >> for that driver.
>> >
>> > If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
>> > (e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
>> > SOC_IMX8M.
>>
>> For SOC_IMX35, it should be selected by default.
>>
>>     config PINCTRL_IMX35
>>             bool "IMX35 pinctrl driver"
>>             depends on OF
>>             depends on SOC_IMX35 || COMPILE_TEST
>>             default SOC_IMX35
>>
>> For the IMX8M* SoC's, that is not done, as there is only a common
>> SOC_IMX8M config entry, which corresponds to multiple pinctrl drivers,
>> which we probably don't want to select all of by default.
>
> Well, is the SoC support is enabled, it makes totally sense to enable a
> crucial driver like pinctrl by default. It's still deselectable after
> all.

Yes. But now I think I figured out what I was missing here.

In order for the patch to achieve something meaningful, it is not enough
to select PINCTRL from ARCH_MXC. You should add default statements to
the various related SoC specific pinctrl drivers. For example

    config PINCTRL_IMX8MP
            tristate "IMX8MP pinctrl driver"
            depends on OF
            depends on SOC_IMX8M || COMPILE_TEST
            default SOC_IMX8M
            select PINCTRL_IMX
            help
              Say Y here to enable the imx8mp pinctrl driver

This aligns with the way it is done for the arch/arm pinctrl drivers,
and will automatically enable the relevant SoC pinctrl drivers, and
still allow completely disabling pinctrl if/when that is needed.

For SOC_IMX8M, 4 pinctrl drivers will be selected.

/Esben
