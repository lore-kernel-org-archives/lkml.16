Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512682641CC;
	Mon,  7 Jul 2025 07:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872091; cv=none; b=RlOoYHRwIdoNU374fcP9KpmH5qjyueg3iwAGySYus04MbF1XgnF2e8dl13TLOcJrgkq9cRcvgzCj0xPE1FdOeheZysOVEUU3reyBy4iFVy+zeZzxy9OVT/Fm51r0Az6fxIcaD5zZX2rxkEwufnlmc/fwo53u+bMKvG8nCvLRS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872091; c=relaxed/simple;
	bh=yqETL7y0/Bx7NunW/VtXcWd1HCaEpUY33C0SCIjPCoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pT2fRD3bFT3UWABkieuItMLB2VKuLx7Bu5yjEtLqOA/nHta4UfJeKHEQq9YpQtruJHnYXVfx3wpJhDsDeX1WbCHDmUWY5vCPUyEsiLlfiQr9XUh+RchTqbuXr4OZmbECYCRAyZ29R5isyz3V5lwmo7UsEoCLU5X1tqSoH3YXz24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=54560 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYfxQ-00DTvl-0X;
	Mon, 07 Jul 2025 09:08:07 +0200
Message-ID: <1b20cb44-847f-4f64-a367-c3340468713a@norik.com>
Date: Mon, 7 Jul 2025 09:08:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Initial PHYTEC i.MX93 overlays
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250707061101.1194618-1-primoz.fiser@norik.com>
 <20250707080457.GB11488@nxa18884-linux>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20250707080457.GB11488@nxa18884-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Peng,

On 7. 07. 25 10:04, Peng Fan wrote:
> On Mon, Jul 07, 2025 at 08:10:57AM +0200, Primoz Fiser wrote:
>> Add initial overlays for the PHYTEC phyCORE-i.MX93 SoM based boards,
>> that is the phyBOARD-Segin-i.MX93 and phyBOARD-Nash-i.MX93.
>>
>> Overlay #1:
>> - imx93-phycore-rpmsg.dtbo
>> - add support for M33 core RPMsg on phyCORE-i.MX93 based boards
>> - applicable to both phyBOARD-Nash and phyBOARD-Segin boards
>>
>> Overlay #2:
>> - imx93-phyboard-segin-peb-eval-01.dtbo
>> - add support for PHYTEC PEB-EVAL-01 evaluation adapter
>> - applicable to phyBOARD-Segin board
>>
>> Overlay #3:
>> - imx93-phyboard-segin-peb-wlbt-05.dtbo
>> - add support for PHYTEC PEB-WLBT-05 WLAN/BT adapter
>> - applicable to phyBOARD-Segin board
>>
>> Overlay #4: 
>> - imx93-phyboard-nash-peb-wlbt-07.dtbo
>> - add support for PHYTEC PEB-WLBT-07 WLAN/BT adapter
>> - applicable to phyBOARD-Nash board
>>
>>
>> Changes in v2:
>> - reorder reserved memory nodes by address
>>
>> Link to v1: https://lore.kernel.org/all/20250619063954.1730231-1-primoz.fiser@norik.com/
>>
>> Primoz Fiser (4):
>>  arm64: dts: imx93-phycore-som: Add RPMsg overlay
>>  arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
>>  arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
>>  arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay
> 
> 
> I think it would be better to update License to
> SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> 
> But up to you, I am not sure whether dtso(GPL-2.0) could
> work with dts(GPL-2.0 or MIT).

Good catch!

Yes, this indeed needs fixing. Will send v3 updating to (GPL-2.0+ OR
MIT) as the base dts.

> 
> 
> For the patchset
> Reviewed-by: Peng Fan <peng.fan@nxp.com>>

Thanks for review.

BR,
Primoz


> Regards,
> Peng

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com
