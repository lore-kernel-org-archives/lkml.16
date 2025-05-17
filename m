Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB601CAA65;
	Sat, 17 May 2025 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747490718; cv=none; b=Os/sIqNgPpc4VPCHnFsMdTTl/NJ3Ecup/WrUqGPMT4XvgFfmmI26+TRU1aYq6qjHMk6YMSx3ILaZp5purvDmO2xEKKprOsYiFA99rcycaZUyhe2+6I5E9Tk98TvZROKr8B2WMlrsiR9NlIF7Z/oAzBGvINwU30SZQV7rwBfrSSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747490718; c=relaxed/simple;
	bh=XC2yvQ/phwdwbNpoDCMdIp7eMzYCWnTFY+wKPxwsz/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5JQBgmFmNEnYbv+gk6B7Q4egi0vpJrl+o3Z3KiSy0MIN1lrnTPf3huSjNOxnkv0gLRcC3gcAyh14YSEEV84AG3bFvCLQa2Dy3iQamIW/5JeU8x8nyKNirwlUG6nY8uXT6hhyNgSRArOyPFqfhT3vosgftVEHoYi1I9KTvPv38E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=LLM8RqC3; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=LLM8RqC3; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="LLM8RqC3";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="LLM8RqC3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490714; bh=XC2yvQ/phwdwbNpoDCMdIp7eMzYCWnTFY+wKPxwsz/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLM8RqC3m5ulNp8y/PthQxJaBFjWQQ2BoAxPfcxM2mKbYo7Iaann7PCMZFFVdQ7gF
	 8FOahPWY0DdHJe6oLKVJPa9s6onLRh3oMEO2dhSAB1hXbLf4T3AW6Y6ql/wAVOODmF
	 qUvQWW2lTGb88mY3rpqXurjFbiYx2FsZvITC6XXtwq37RmK2pw5qOEVSNJ3t90hWxg
	 Hey41SYCPPm66bZ35lKSX/+1zRT5n9Xjr3GGnICR0MVQYjbVjIxrMQigBbwtWGGht5
	 Gr2UFVJqlKzXNfYjuLGEJ6NrCRhuwTTXmHNV3HNf8S0sSffd+krGkND2QxTPsmlKSM
	 ywszKUSPkfTTA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 914B23BAD92;
	Sat, 17 May 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490714; bh=XC2yvQ/phwdwbNpoDCMdIp7eMzYCWnTFY+wKPxwsz/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLM8RqC3m5ulNp8y/PthQxJaBFjWQQ2BoAxPfcxM2mKbYo7Iaann7PCMZFFVdQ7gF
	 8FOahPWY0DdHJe6oLKVJPa9s6onLRh3oMEO2dhSAB1hXbLf4T3AW6Y6ql/wAVOODmF
	 qUvQWW2lTGb88mY3rpqXurjFbiYx2FsZvITC6XXtwq37RmK2pw5qOEVSNJ3t90hWxg
	 Hey41SYCPPm66bZ35lKSX/+1zRT5n9Xjr3GGnICR0MVQYjbVjIxrMQigBbwtWGGht5
	 Gr2UFVJqlKzXNfYjuLGEJ6NrCRhuwTTXmHNV3HNf8S0sSffd+krGkND2QxTPsmlKSM
	 ywszKUSPkfTTA==
Message-ID: <38a9a30a-6dc2-4006-8f99-55c2f6562ffb@mleia.com>
Date: Sat, 17 May 2025 17:05:13 +0300
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
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250517_140514_616630_160D82ED 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message. 

On 4/3/25 13:49, Uwe Kleine-König wrote:
> If these PWMs are to be used, a #pwm-cells property is necessary. The
> right location for that is in the SoC's dtsi file to not make
> machine.dts files repeat the value for each usage. Currently the
> machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
> there are no properties to drop there.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Arnd, it would be great, if the change is picked up by you.

Thank you so much!

--
Best wishes,
Vladimir
