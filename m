Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5AA1A2632;
	Tue, 15 Apr 2025 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716824; cv=none; b=n0cc+YQsvilt7Ja8wfI/syRgKWkphNex4+AASVlXMWZ/FzhJv+NGrQWvUBPmCj0kNkpu9MvW5RaWCuFAXC/lfVeoFA2mg7NHmDVGBqeUZrQRnBCBWVjDZZRDRDr4pYxGsTf4SvKckVzax0I7Yfq99APmoW04K5MXyIuX4fJT0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716824; c=relaxed/simple;
	bh=UySWb7DE/4jjUVFy5D283u54nEUkfVIzvcKtZZVJoOg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZSgLSkr/MTkbst7A1Zfh+TgHFuCf1aFjO1bh3WC3Mwei8/tGq+ccmQhE8XAVa388J8Xd7bh0Gtc2d9WM3LqITJAtMGOJjM/dEGBL9ZitExtatq1Bl8x4zqopAWbtoCNMC+nFkwDd5etAyd75ki8U7QVn+wEvkP01MrTKZ8djX3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=a2GtEIVX; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="a2GtEIVX"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 4755860DDB;
	Tue, 15 Apr 2025 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744716813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn/K4EMIl2PBfUi2u8eilvhlvKBANZeEcdbvG8VYM2U=;
	b=a2GtEIVXory+IgYl0EmnoCOcxVptYv4o7dG/MwxsKzW/G4mQwgLwN0x4TD010FCxaxF57J
	Gs/NzzX7KKjaV/JadskIj18TqOiPj0DHJBsiCZdPFyxz8lA7t9Uv2EyS88oLSosadxy2lY
	ce6YWG0NW+JzKP1yX7l6o9dRnoKEJWw=
Received: from [127.0.0.1] (fttx-pool-217.61.148.30.bambit.de [217.61.148.30])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 4858136014D;
	Tue, 15 Apr 2025 11:33:32 +0000 (UTC)
Date: Tue, 15 Apr 2025 13:33:34 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 frank-w@public-files.de, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_3/5=5D_dt-bindings=3A_power=3A_Add_binding?=
 =?US-ASCII?Q?_for_MediaTek_MT7988_topmisc_power_controller?=
User-Agent: K-9 Mail for Android
In-Reply-To: <bbb81e79-95da-4cf9-9eef-7cbaea191ebb@collabora.com>
References: <20250413085806.8544-1-linux@fw-web.de> <20250413085806.8544-4-linux@fw-web.de> <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com> <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de> <bbb81e79-95da-4cf9-9eef-7cbaea191ebb@collabora.com>
Message-ID: <0B0447D6-0495-4BBA-9F44-8A5191F00377@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 5c3047d5-1951-4654-9899-7fad06ca004b

Am 15=2E April 2025 11:59:06 MESZ schrieb AngeloGioacchino Del Regno <angel=
ogioacchino=2Edelregno@collabora=2Ecom>:
>Il 15/04/25 11:52, Frank Wunderlich ha scritto:
>> Hi Angelo,
>>=20
>> Am 14=2E April 2025 12:25:23 MESZ schrieb AngeloGioacchino Del Regno <a=
ngelogioacchino=2Edelregno@collabora=2Ecom>:
>>> Il 13/04/25 10:58, Frank Wunderlich ha scritto:
>>>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>>>=20
>>>> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988=
=2E
>>>> Add binding for it=2E
>>>=20
>>> That's the wrong binding=2E=2E=2E check mfd/syscon=2Eyaml :-)
>>>=20
>>> P=2ES=2E: Is there any reset controller in topmisc? Any clock?
>>>       If yes, syscon=2Eyaml is also wrong, and you need a driver for t=
hat=2E
>>>       Remember: If it turns out *later* that this has clk/resets and t=
he
>>>       bindings are already set for just a syscon, it's gonna be way ha=
rder!
>>>=20
>>> Cheers,
>>> Angelo
>>=20
>> Ok based on the power-domain-cells property i guessed powercontroller i=
s the right place=2E
>
>power-domain-cells, but without any power domain assignment, so that was =
wrong :)))
>
>>=20
>> But based on your suggestion i tried moving compatible to syscon bindin=
g and made dtbs_check here=2E
>>=20
>> I can confirm dropping the unexpected properties reported by syscon bin=
ding (power-domain-cells,clock-cells,adress-cells and size-cells) are not n=
eeded for function (xsphy and ethernet)=2E
>>=20
>> For verifying that there are really no clocks/resets in topmisc (have n=
ot found it in public available register documents) i asked mtk (waiting fo=
r answer)=2E
>>=20
>> Also got it working without the syscon compatible by changing ethernet =
driver too (after this change xsphy was also working)=2E
>
>Perfect, a bit of a cleanup and you're done, then!

If i do not have to change/merge driver code=2E=2E=2Eand i hope getting re=
sponse from mtk soon=2E

>Cheers!
>
>>=20
>> Eth:
>> https://github=2Ecom/frank-w/BPI-Router-Linux/commit/d866e648717800b6f6=
395ad36c38f9effcf0498d
>> Xsphy:
>> <https://github=2Ecom/frank-w/BPI-Router-Linux/commit/0121a94df99700487=
704ca056b210b13db07e90c>
>>=20
>> regards Frank
>
>
>


regards Frank
