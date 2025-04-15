Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7769313D891;
	Tue, 15 Apr 2025 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725793; cv=none; b=AjvUYKIMMXqMSuuOl/s8KseGuhgY8HwKdx5sHpsAklTxFZYZmSq0usZ0Q6VTC1RNtnPGtfYfAB8DOX2Ox2nD0ZfFkp4kjmeoUaYsGAEc89ge0o628VcKoP+vVN8FXtHJC8lHLG6LY43vSM95Q9SQTtNiYv2fGHCUUGLWCUFmW+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725793; c=relaxed/simple;
	bh=dWstC39SdFrDst2ywOOogXmGgAIeSacKJeUE6kDQgr4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UvjYmjEMPocB08Z9LMlD+H0WIZ/x8JXFj9Wo3LgDJXUym/hXhLRaixskfxMQsVlxY+gyXM8o/3UJtesR9IdCnwh5f7NPIHJEQ0T+uA6N17/OTPPofsJCGh9hDes3MzBGkHSQAHAFcyYDSQCAlTrQeuMMff9oy26ITQ342Rp0GsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=nYmUjMHX; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="nYmUjMHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1744725782; x=1745330582; i=frank-w@public-files.de;
	bh=AJATmyjm2eijeuuPsjt7QjMYsSq4CG6lw+58QD8jKh0=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nYmUjMHXFsev/dNDJDi7pjjPr1EsqhdfzUnQAB7/a+X1gNhe9qs0AnAOEtsUYRz+
	 MIitZ1TDPeS7nBA/kMXTFa+oIIIGoNZviTiHmTbETCpqNMf1OggPyzPllSR/aNJFs
	 S8xyUEISv78LA16U1u2V4K3Ko2v8Q0qmxEgQV9MygL2WnXZT7IOTa8W7Z7cTpda9A
	 LcML4t+cx0XGT7cL/6qqiNu8t7xcW8QqprEIiJdCi0MVW4aDjeeVgPTVRKOFz8rdM
	 NrCkuX3n1nSstOx0VsqBgZhJQ0cyPDGVkbY8Oc42h9PNYrzpjRwTNbZ9+rJ6mfamw
	 u9C/XLTWdiiWcHkJXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1tzkvP3too-00Bho5; Tue, 15
 Apr 2025 16:03:02 +0200
Date: Tue, 15 Apr 2025 16:03:02 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
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
Reply-to: frank-w@public-files.de
In-Reply-To: <bbb81e79-95da-4cf9-9eef-7cbaea191ebb@collabora.com>
References: <20250413085806.8544-1-linux@fw-web.de> <20250413085806.8544-4-linux@fw-web.de> <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com> <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de> <bbb81e79-95da-4cf9-9eef-7cbaea191ebb@collabora.com>
Message-ID: <AC7CF61A-A8A0-40B7-B5B5-51C56A1D3E81@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pEE0QNLaCjGOh1Q3A+m2eGYrUmWJexG4y4QniLuUTqDVWg4CIOB
 84GmAnGh6QGkVbhwiumdWdvKVApuC2JIYMqVYiI2UJ8kXwUFnoleHNXl7yc7QrRK2yKcCIA
 3I5SoqqnMHQ4CVxWJe3F86siWLEd074Se1G0CnkRyrhWEsyWM91xeQei1J++PcvHaZSDvtG
 xrOEUf4OgwvpgvHHD/pBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7lIXNkQsibE=;ecACNA+AaIzPbg8w5bjKrIo/tsr
 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
 pKptU6VyxXIk2QK7Kx481TFV0HrsMyhgeJ

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
>
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

Got response from MTK and basicly topmisc contains a powercontroller (for =
cpu and internal 2g5) but currently not needed because ATF already switch t=
his on=2E The second part is the pcs/phy muxing and 3rd some unneeded switc=
hes (where i have no detailed information)=2E But no clocks or resets as th=
ese are handled in the connected platform driver (xsphy/ethernet)=2E

So my original binding imho made more sense=2E

The syscon binding seems to need syscon fallback and shows error about une=
xpected "compatible" property=2E The binding itself does not contain any pr=
operties but references syscon-common where iiuc compatible property must h=
ave at least 2 items and requires the "syscon" fallback=2E

Mtk suggests splitting topmisc into the 2 blocks by only using the mux par=
t as syscon with splitting the reg=2E If powerdomain really is needed then =
a second topmisc node could be added and bound to a new driver=2E

But this would need a bit more of testing=2E
regards Frank
