Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39286289343;
	Tue, 15 Apr 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744711152; cv=none; b=mTwifieDHJWj6sZTS3Th7+8pQ6gwxSmcSI7JIIw7VM+Tr3yUTgPLfPYcglrWOO2+c9f+kxXxVRne3V64A1qudzOzxMqmJOJOxquD+6dVWuRr1C47p91m1NcsTnVzISz68gyA9YJFa3lCKcWmU8PE1JqzdQnXmbpjlDU92YCFkgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744711152; c=relaxed/simple;
	bh=vymqsKww4x6vksA8VtZI/fKOGW2FY+7jrdaZBFUWKnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uh8mZMsaAMX2BRdxq5smAV3Hx+Cgub4ZfTFlo13YaXZqMGhh77gxfqfI/D+yZ9PzwvfobX4tGHVgEvKbTlLJph+Wl4D0OrtF700rvwvxNpydBHykI0lMQ28aFeYuv/aNId0Znk1YKr6pnaWo8/UlQ9oLhtRWlVDtvRJep5x9sTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TE82IOSv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TE82IOSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744711148;
	bh=vymqsKww4x6vksA8VtZI/fKOGW2FY+7jrdaZBFUWKnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TE82IOSvUEmzPXbMQJ2EoP851YmhYFzTC5zQPgwfF33E0+gAcUdGwbEJFP8OXBQXd
	 yGBZJI+CeWbXAgkEYhpr74oLj5KPjK9P9yvMRhfMaf7NFBcLdcaSI0au0WXYUNyaxQ
	 v3zkD7kVVnjWm858jX9dLieI0WPu87ky3ykYHWSrvWI5pDTdpGv10JBeFTOGRTMhUz
	 wnds/V/dmY+o/xfDll9c5NQHS5KAe1ylm/sdNZyjkdPPw6CvH6v3mCDLWvtiRZhO5n
	 KtRsNpdn2nGSJz4lF/HchbJd1h/rDGn1e7pwH5YkPuma+lXZWT49l/b4lRYYrIXW5V
	 UX1enncHHBECg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53DF517E0FA7;
	Tue, 15 Apr 2025 11:59:07 +0200 (CEST)
Message-ID: <bbb81e79-95da-4cf9-9eef-7cbaea191ebb@collabora.com>
Date: Tue, 15 Apr 2025 11:59:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988
 topmisc power controller
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-4-linux@fw-web.de>
 <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com>
 <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/04/25 11:52, Frank Wunderlich ha scritto:
> Hi Angelo,
> 
> Am 14. April 2025 12:25:23 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 13/04/25 10:58, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
>>> Add binding for it.
>>
>> That's the wrong binding... check mfd/syscon.yaml :-)
>>
>> P.S.: Is there any reset controller in topmisc? Any clock?
>>       If yes, syscon.yaml is also wrong, and you need a driver for that.
>>       Remember: If it turns out *later* that this has clk/resets and the
>>       bindings are already set for just a syscon, it's gonna be way harder!
>>
>> Cheers,
>> Angelo
> 
> Ok based on the power-domain-cells property i guessed powercontroller is the right place.

power-domain-cells, but without any power domain assignment, so that was wrong :)))

> 
> But based on your suggestion i tried moving compatible to syscon binding and made dtbs_check here.
> 
> I can confirm dropping the unexpected properties reported by syscon binding (power-domain-cells,clock-cells,adress-cells and size-cells) are not needed for function (xsphy and ethernet).
> 
> For verifying that there are really no clocks/resets in topmisc (have not found it in public available register documents) i asked mtk (waiting for answer).
> 
> Also got it working without the syscon compatible by changing ethernet driver too (after this change xsphy was also working).

Perfect, a bit of a cleanup and you're done, then!

Cheers!

> 
> Eth:
> https://github.com/frank-w/BPI-Router-Linux/commit/d866e648717800b6f6395ad36c38f9effcf0498d
> Xsphy:
> <https://github.com/frank-w/BPI-Router-Linux/commit/0121a94df99700487704ca056b210b13db07e90c>
> 
> regards Frank



