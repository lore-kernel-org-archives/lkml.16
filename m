Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4D26B976;
	Mon, 14 Apr 2025 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628240; cv=none; b=nsUE+CbCIPTG42jQ7K8Humw4k+mRmTrgn2V/SaYByXgZ4YBeFJIEXgACUFoA4mBap/tKN4zKyEFAVEohfgi7dCk6/tDsE/dSF/9ixaoWs/ux8P/w2uj/VNrMTQ+CtR/uyBG0EOY0CYbhFf4YJ4h5gqtL6GKqWxilG/mWhWozjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628240; c=relaxed/simple;
	bh=bPZlkgcUPRfvJOxv8cjuqePT1o85uVCyswf1SssPMwc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BPu4gef5sLnp9w5313JKPiiuN0/IJEd8xnjzIpplh2pHDT0az+Ngdrtpg3UV8c8NBcNyMyeVP0mlcYwyz1o8TCs6YQ4/NQhbfrd1EQumo/2WaN/SVSpoDwQBjg43XEfvuiczeF/z6okDmh1dGnZbiwCivU8PUE9M9qO68tyeorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=qYm6Eu8H; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="qYm6Eu8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1744628230; x=1745233030; i=frank-w@public-files.de;
	bh=Dox/3saUSMc6oBn1CpgQrpJElpnKUg5l+Q9XBb5++k4=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qYm6Eu8HjkxRq+gksNLYnlblLxQeP/SfqiGgjk/IZYaMAvhpdeEKBD9rMyZAM5xM
	 ZpcQ+vcehLK7IxyovlXIBVVFEUd8IxJvIjwaBm49zeZul6hi7HhDUthrdxKaTGwG6
	 0gP/fq4PhkH8BHtcXWDMCBjI+S33NCPZshFiJpS5vbkwPQdri2p1Vx24T4Ed/3jr6
	 Eif0GWfm4Wv3TeW6uUj3j6qIpM2ZVvZXI8faJ2LDGiQDV8Y4bvlNlxZ0Ol8Mx+ddq
	 4ISXphfQS1gzcPKL3o0G8NmKWHIT5jT1tCCUobengwlg7TGYmxNoDjtdf+A0ei20N
	 IyWxTr2+4dX8LBIQ+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9yc-1tnA5U2KKg-00KTDb; Mon, 14
 Apr 2025 12:57:10 +0200
Date: Mon, 14 Apr 2025 12:57:06 +0200
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
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_5/5=5D_arm64=3A_dts=3A_mediatek=3A?=
 =?US-ASCII?Q?_mt7988=3A_Add_xsphy_for_ssusb0/pcie2?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <e243cca4-40d7-4cd6-804a-7e63bb5581b0@collabora.com>
References: <20250413085806.8544-1-linux@fw-web.de> <20250413085806.8544-6-linux@fw-web.de> <e243cca4-40d7-4cd6-804a-7e63bb5581b0@collabora.com>
Message-ID: <E469EB89-A879-4B03-A3DF-C96D207E946D@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yi7cluxJXDq4OrQaFqXXh5JHsaAJJapY8vwQzCpkAbguc1XlrM5
 4Sdn2WvMB5StASOjsrQk4j+LwJh6ZnFxqayr4OGRuIqK9fj8sF9hXDWUfm5Rsy/dbM+Oabn
 uQ+J6oY5hVmp/Z+sdVHpMBXBdn3FghQBYSG6OyH7gCdIbYf62ADzYgd8c5SUNpVoP84n9wR
 qBqeARj2vXUvi9LqpESCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8QFW5mxT33E=;p9eKydGBnkydZTV5Tm8SBn3MzjQ
 zrEOtq6nYRDx84ugB0KbO22SzU8HCOwAg3QP8DZSk7r0aksEaBJ+3rapipjBW4neZOHrTfRsn
 Qp9r3s1mQiPQ1okWqdXSxl4rVC5z/GhSrqbO5keQrh9MjF6Q0YqGRr+EM/RwYveBlYaqY4xrS
 NMrH6uN4b5tBsxBhLWcVY3UzIm0BToz4iDgid1e76Pt4ivZJ/K7mQvFdCBQ1m2U0QQe28mZSj
 yqTKfrezqLu2Yzc9ANdjtT1gWriDSkUcBMsBQX/gUqIP0urMzKFiL2t2L+7WEtea77nkSsJ17
 Q1ep/vfvqrxhGL1fkBWPfDyGGP7k+gtCu3S/g81VdA3AN1msv2RRA5GSX97vf2cR6YBtSjZfe
 vkQig0b/U/J/Kv+sJlrcuAB13QbU03LMVzox6dSsIZh1PGOkk52NwffcoqmfLLL+5G5DNidvw
 zkadNDsfhN1xCmfF28SA0B7qB58b5S/55ihNqeVExyMp6GPJu0wvmX/fkEOGt6CJABqYXLSLR
 X78yJFURF4Ww6Vh7W3KI7vzCR103tAQuRVQKHD1YN7D93HaN+x8yp1K+GOoLxLRwwz2p4Qsb8
 5FwYv8ktLf2rcHw2jTQcZhuktJOnBlbldXWuPP+y5B5uS2Q/HIE1bcgPviLx/zeBmmFY1dH42
 82Sy9JAV1Kdc4Yj652ONnQ+4VjSLDxS3H/ht8vY50qAP+UIn4GcUVxRW9mNlLW5rUcKrNz2Ts
 UAYv27mou96tsYraliQ+BUDmkWnYJsS0d+d0dUKKEpTcB5+/XLSmOaGqCyJnWclA+x6lg2LBJ
 AuzMOLLBabSvIVXkgBCvPORzdGtdcjkIu8Dnks8JHvr4uTiFNavC4WSj2GwO3z3eKz9QOoiRk
 tS93ukqYYyoSxZm8cgcDwZ+25NT4IfO2s1KRcoSI+zB6PCaunoSEyvyO0ytN0EPmKrT4LJFrn
 vgleb0Mv9nQlOv76GFkxE6FKETr/n3/qOEdLJTyDbWkf9ZsTXzPpNVO1VwGJvSnJTa+V/k4ba
 X4X6Dpq0lUm3biCw6fEyyYP1oZ42NjCZTfGXAAVPMA5GR3+jzAyEgzSPp/qzL0iK5c8NYPrXi
 nb216mq/VAyxIkf7g3LuJdoBfWD8ZLwDhQTIx6WDzXvidxxPvixxl0BNO5TZYv4nwz6XuRI7b
 HXOmUg70tx8YJLTJLKTuCxPeKV/SAXc4E0dP3whvXmOJfF7H/4sOgqWtEKRoYjSgPmPdyRxnz
 szIAvbEjsLCsbNzZ9iuEtYFOsf9eHW7kUi7+husJIWa2dNFKHhVfkpv4gOrRZpiZ73av0QgY3
 h4PTdgydjIwkIJGUf6kQqfJ+teC9TtFSoL4G/opL5viSTh6Nr3+J+iaIzFx3Kxbbac5WvfBxh
 EC1qdOY4yCcJpv2LjqVGG04rTbkntjSThe1e4gpUfwYYfgXfcEetgU0tD4NsqWFV1Ur4vrK80
 DaUL2EXDN5eAncNe5vWCtYPBbzbiWOn25KJRQBbCxrMevMQrH

Am 14=2E April 2025 12:27:30 MESZ schrieb AngeloGioacchino Del Regno <angel=
ogioacchino=2Edelregno@collabora=2Ecom>:
>Il 13/04/25 10:58, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>

>> +		xs-phy@11e10000 {
>
>That shall be just "phy@addr"

Ok

>> +			compatible =3D "mediatek,mt7988-xsphy",
>> +				     "mediatek,xsphy";
>> +			#address-cells =3D <2>;
>> +			#size-cells =3D <2>;
>> +			ranges;
>> +			status =3D "disabled";
>> +
>> +			xphyu2port0: usb-phy@11e10000 {
>
>Perhaps just u2port0/u3port0 like done on the other MediaTek SoC DTs is b=
etter
>for consistency :-)

Mt7988 also have a tphy where we have it named tphyu3port=2E Leaving this =
imho would increase confusion=2E

>Cheers!
>


regards Frank
