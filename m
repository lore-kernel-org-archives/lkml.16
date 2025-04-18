Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A085475E;
	Fri, 18 Apr 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967906; cv=none; b=XybZM9eAOTa0oFL4vDkDn6bxh2KYDI+JgcH+7CkevjyMDeasnS/VVCTAaGeO7/f2xtuzaiGxGinV6OXNVpb0/MCqSczbhyKW75Isy2Rh3MGqN5GfOZ3uWMmJ+EyjCM3ASz8qokM0R0q4ph+q+VLLu07Tm11bo022U2RTi89B8s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967906; c=relaxed/simple;
	bh=q7NI9QSwQEjqNUjXhs5GV15e0XPvbfa0m0ws1XHC090=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GH1kVlKTOlz1/Ff2wUSLJlLSF0d3rX70PoFBUhAsoPdmaAlss1AXKBEyuAwtmWh3QnaTH/UaGEt7iE4Ftq1dhw1FecWxkqvN5iPIkane5assnyIGqcaO0ec2Q4io1f/OmoETtgikTlF9jY0x3zRNyaEFbY5AqjwRW90oDHl/PEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=BIGmK1GJ; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="BIGmK1GJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lpFv20DDYxhbAWqqo0/MdXt9VXqLpTTMSrFUKJvS/SU=; b=BIGmK1GJEUKd12IfLt293mn2V7
	O4xV5c4T5puHm94czvjBEhCz0ZDMk/Wy4QK+lSx9I+yPmPnQy8iSIZnbnJmzbNPp5Q2c3SlqcOf3X
	wHTpmRR5rr2nO71jU7MAP/u6NnuwrHISVL8/3VT2ZyDGu2sw1Kk3XV/t0LEsvlcF+sFr776lKOj0u
	w3sDUTyc9UfEY+czKOyrYKBfBvW2c3nB7o6NEFcbTLfJx7GrG3nKKxSnWk8OVJh10Mc/vu7hr/UXK
	fy518A15GUXHT/lMj4uKlAHPHjykswYuTL7C6E39tTujuGEIhgxcdLdFEe/fsbTsa7nbmaE/XYzQy
	M+SbqK+w==;
Received: from [89.212.21.243] (port=36688 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5hra-00B3iy-2o;
	Fri, 18 Apr 2025 11:18:22 +0200
Message-ID: <63ba0243-ae07-4e8a-beb3-447e903ba9fc@norik.com>
Date: Fri, 18 Apr 2025 11:18:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/15] arm64: dts: freescale: imx93-phycore-som:
 Disable LED pull-up
To: Dirk Gouders <dirk@gouders.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
 <20250418063104.2202085-4-primoz.fiser@norik.com>
 <gh1ptpkhpi.fsf@gouders.net>
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
In-Reply-To: <gh1ptpkhpi.fsf@gouders.net>
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

Hi Dirk,

On 18. 04. 25 10:16, Dirk Gouders wrote:
> Primoz Fiser <primoz.fiser@norik.com> writes:
> 
>> There is already an external pull-down resistor on the LED output line.
>> It makes no sense to have both pull-down and pull-up resistors enabled
>> at the same time. Thus disable the internal pull-down.
>                          ~~~~~~~              ~~~~~~~~~
> Sorry for disturbing, but I couldn't resist: the above somehow
> contradicts the subject line -- at least when reading this just by
> chance.

Yeah... it should say "disable the internal pull-up".

Great attention to details :)

Thanks,

BR,
Primoz

> 
> Regards,
> 
> Dirk

