Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5E02F42;
	Mon, 14 Apr 2025 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617767; cv=none; b=JSmf+MYygiTwgtgGS/A2KGjCTiOb3PkO/vSRpbez4e2cCaX4CNon1641j3XiQy61/eyHR/24YcfJFzQoLLYm9n2HEVm0OF6ilCkRKj8vQWR71Z+av8YGMYZKs8xoRhuKVjeYth2cjy0+X8FIMmzlhVNI4JG7PJ6e2tuwdULKGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617767; c=relaxed/simple;
	bh=ZuoDYhZgQ9D/0t1zWRqqcz1yH1nnJRZLbD2PvZP3Xxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR8YhM3Kt4/rndpJDGt+PT0QyBxUwGIaddf/Ozu48pmZ+s/nRo2kuTqWbZ/tYX/Xv3gZQTSV80uq66W5OO6vqO65Uek6VYp/tJzdH4Ck3D45GBDtXTPTJuBuZ8WhacizCl1M0uix+1mkLAzpmLNRf8oGLJ/Y2hb4Ly/6lVUFNRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=ROakJ9Y+; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="ROakJ9Y+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YpQSiQvy1hnifDQxt9SKOFDxpRliEXMBm8AYZHweb8Q=; b=ROakJ9Y+q0ECieFlwrTFMktMUn
	XLNOr33NXrnIQeB14gm0uUCA6yzpUweg29px4LkdTzZ4qWXJWTM2MFRD9OQYgiGIiHAoPsaOTzgRO
	sEGBACSi06vZsRTX2sZeDdutQyIwOCGke1qG03xmWu2wgZ5cTtxEVO3yJHNtCcdCKqZ2E5reJHCdk
	FWn2sdFUvpI5rVisCRgrJTT4wxaN1CwSSuGBFnwuyzhHgdfW4UE5lUTctgEW80PLBC3w3GtnvGv0l
	/AbJS9f8ZA+U0S3WsINIzpenutc/rqRf/LXlcEcXsT08fisRL87BwLJCJK7POFeLsC0ra3dngUu/l
	bgmvZDbQ==;
Received: from [89.212.21.243] (port=49436 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Em7-00DMch-1a;
	Mon, 14 Apr 2025 10:02:38 +0200
Message-ID: <1571414e-5e7d-4c9e-b69d-11a6fdf454e2@norik.com>
Date: Mon, 14 Apr 2025 10:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>, Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
 <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
 <ef74e49d-c413-4719-a174-42df91384469@norik.com>
 <Z/knehHQeTTUXgr3@lizhi-Precision-Tower-5810>
 <20250412-tentacled-rugged-bee-fd7e9c-mkl@pengutronix.de>
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
In-Reply-To: <20250412-tentacled-rugged-bee-fd7e9c-mkl@pengutronix.de>
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

Hi Marc and Frank,

On 12. 04. 25 15:41, Marc Kleine-Budde wrote:
> On 11.04.2025 10:30:18, Frank Li wrote:
>> On Fri, Apr 11, 2025 at 10:08:21AM +0200, Primoz Fiser wrote:
>>> Hi Frank,
>>>
>>> On 10. 04. 25 17:23, Frank Li wrote:
>>>> On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
>>>>> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
>>>>> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transceiver
>>>>> chip.
>>>>
>>>> Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy instead
>>>> of use hacked regulator-flexcan1-en.
>>>
>>> Sorry can't do.
>>>
>>> This doesn't align with other i.MX PHYTEC products using flexcan such as
>>> imx8mp-phyboard-pollux-rdk.dts.
>>>
>>> Even the i.MX93 EVK uses the same mechanism.
>>
>> I think previous method is NOT good enough. Suggest involve CAN and PHY
>> maintainer to discuss these.
> 
> Since d80bfde3c57a ("can: flexcan: add transceiver capabilities"), which
> git mainline with v6.15-rc1 there is proper PHY support in the flexcan
> driver. So from my point of view, there's no need to stick to regulator
> hack.

This arrived at the perfect moment. Just in time :)

I will switch to this mechanism in v2.

Thank you both for your input.

BR,
Primoz

> 
> regards,
> Marc
> 

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
