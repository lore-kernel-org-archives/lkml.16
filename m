Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A2B661;
	Sat, 17 May 2025 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747490586; cv=none; b=nZ8EyM8tVrPk4SkJf+THNKN2sXE6ZUTvIzo32qCroziVfLB9DtyBqjv3YWAO7lUyZheN1Ci8EosEWZ65eE4FlMuj/ZD1yfjH2m1AEUnYRkN6FTHJvCAdVxoJwkplOo9XJnci/9W2VT+wWJ952kSaG56/0fyGTvu5Dp1F9q+SwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747490586; c=relaxed/simple;
	bh=GuOGpFxQOypXeXtTZiCIfNiDHN4HvXpvL8eGxDkgXbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCO2ClLFhzKK9OKKICdaARCLa87qhkJUulXCCjQMIzpqK9PNApfV8GSCZEJ+ipIVinEVj+Dvkwl4imAzUTIIFEerMwfIy8Hu1ySZhXwk39QlvgkzGgSOQpumVnHojKhtk9V1NLBtWcVfOZPK/UQRlvLh3a5EfXfkAGZejFNjKGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=CzriSmSP; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=PHge0Z+I; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="CzriSmSP";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="PHge0Z+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490576; bh=GuOGpFxQOypXeXtTZiCIfNiDHN4HvXpvL8eGxDkgXbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CzriSmSPG0+aVPkm08mfXYwS7WtU/E/nXPmu4vKcHg3l69pGuy7vHg9C0od/aKcnK
	 PApkNv1OrViMJfDpe4MQVFCiG/z+hy/BXFPj0T4DTi2MMNSqb6zE8Jy+5Ho4DXvW3T
	 e2O8PO0kjqSpbHB9r57kpk+nTGfi4u5kkpGql0tZ9RSQDuLfrTBoluExfNC3s1fNTo
	 F2ftvu/WvckFbG65vAk/sfHiLxfNK/iGZraFFkaMgNyijzgWQlpbKK8PUIS4R+Uq5w
	 uM0jK2Hr+4F7lJtjoXWAewdgsmgEu0eAQKD/YiWX8cI05aSS4XooUADYUPMRLxAxvs
	 d5kdj6BqeVPCA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 034073BAD92;
	Sat, 17 May 2025 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490575; bh=GuOGpFxQOypXeXtTZiCIfNiDHN4HvXpvL8eGxDkgXbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PHge0Z+IlGRFEtcMJZIK9qRLN/KW4I3ajwSbWCIJgFUD5b9HK8Wue9I3s8wOsMx8s
	 UOSjUdXVAue/OYIvIvjlBhRvUqr5leo5WQZ9bSBcTqdFEt9uHH05J185uaz2Hf4WIP
	 cjpXCFepowDQojHrsRlvfKSag84Y6JRdnc1D4O8dSUUiRe254Mmohtd30VqWovv2PP
	 UMA53O6ENbI57+WxuUXLQUFrGt+CzfTHs7xG6Okwu5MDfu023/h9hakPcKtVi0Exa/
	 b6BrmTvfaG82yLk/8nLgttf0crO8oQ/3SwbxZIb2dS7zrOcLkXoCHTjZ4JXgna61DE
	 XklApRkcWctoA==
Message-ID: <97db26c1-6d03-48ce-a1d3-cb5c7c604cf2@mleia.com>
Date: Sat, 17 May 2025 17:02:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC
 PWMs
Content-Language: ru-RU
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
References: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
 <hbz3gikjqwuqmexzrxis43gmxcviiryihi7pdp3btdb3sopqi4@mssyr62bunxk>
 <ss6jqmpz55wz3sb27kg7mu555qowf5enu3fe32zlxgqeix7odi@zhs3ns4euljf>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <ss6jqmpz55wz3sb27kg7mu555qowf5enu3fe32zlxgqeix7odi@zhs3ns4euljf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250517_140256_037668_6E11B1C6 
X-CRM114-Status: GOOD (  14.53  )

Hi Uwe,

On 5/16/25 12:53, Uwe Kleine-König wrote:
> Hello,
> 
> [adding Arnd to To:]
> 
> On Thu, Apr 24, 2025 at 05:05:29PM +0200, Uwe Kleine-König wrote:
>> On Thu, Apr 03, 2025 at 12:49:14PM +0200, Uwe Kleine-König wrote:
>>> If these PWMs are to be used, a #pwm-cells property is necessary. The
>>> right location for that is in the SoC's dtsi file to not make
>>> machine.dts files repeat the value for each usage. Currently the
>>> machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
>>> there are no properties to drop there.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
>> I wonder if this patch is still on someone's radar. I didn't hear
>> anything back and it's not in next.
> 
> This is still the status quo.
> 
> There is a patch in next touching arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> applied by Arnd. So maybe the problem that my patch wasn't picked up is
> that Arnd wasn't aware?

I've just started the process of getting my kernel.org account this
week to be able to send ARM LPC32xx/LPC18xx pull requests.

Right at the moment it's better to rely on Arnd's and other ARM
maintainers to include the correspondent patches, and for what it's
worth let me give my tags to your change.

Sorry for such the inconvenince and delay, I believe it'll be better,
and thank you very much for the change.

--
Best wishes,
Vladimir
