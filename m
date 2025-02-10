Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924419CC33;
	Mon, 10 Feb 2025 11:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186311; cv=none; b=JOi7R/wOPQ4hfsgBpz3UsTibzP0XNQ36YgB4BZFhvEjUvWohLdcWOJY7UCMGgp5AjQY6mMJK5+LpuZBUdbHdgseG80rFOGN01amHNi8xtfPohpOdRz6e8IS5py0az8Q04ImS+sh2PrfTjjLQoVJ98A33yuNaD5laQZbDYD0m3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186311; c=relaxed/simple;
	bh=2HcDy5BNfv+9o3ehWem9KjVCh3qqQnf3GauidfHjWKM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gcq/5rRmZnxB3j3Ti4V2VlelydPrjxZoNuK6o15kqgZaHzjq2SQBL4s0+URYaqYC6pFyvCSfCM4eBeypL48+HJi9G7/PTV4hYQ4aKOyE2B1ZXpIS8i/UzLdEbpL6QGPcc6BdFRjI0LG5Wlf6oPq53KZv+tUbb/VKhSVVEgTc5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=XguuVXkS; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="XguuVXkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1739186306; x=1739791106; i=frank-w@public-files.de;
	bh=MRrN1tWDeaJ7i6/rFG0b6OeSwpoxIWxTneKR/1obUmU=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XguuVXkSas9wYqgCyI9iMyWsQzxDgGPrTbKwjzcin1hupG+abFu6t544hil5/CP6
	 nRESHFK1bzQyZ3RMhLOQltk24EgsMhzx+7rFpWPsfZMdHpymg9cUpKL/FkkgRw6p4
	 SH7IqxGRMVCPo/VshyKuhMVnzBnrQv9+EeKYx1+ksyM7mxSrYYK3g397SjOuESdnk
	 6DjwWdEr2rcb4oLtSlYKRrzyTm2wMdbb5ZD6spLS6MHPs0NDkJGiBjRIouTM9DyNc
	 idb7/sMzoUVHCXawVD7VVuS7cafFIvPJ+Q+Ii50tK0BZ6whlZxaoHPzIZv5q4bYV7
	 gLag3KFkhdLV007frQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.69.174]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1u22AO2nNN-00UEAg; Mon, 10
 Feb 2025 12:18:25 +0100
Date: Mon, 10 Feb 2025 12:18:23 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_dts=3A_mediatek=3A_mt79?=
 =?US-ASCII?Q?88a-bpi-r4=3A_allow_hw_variants_of_bpi-r4?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <b56a7597-fa39-4e02-b601-db05bfa48472@collabora.com>
References: <20250207135501.30741-1-linux@fw-web.de> <b56a7597-fa39-4e02-b601-db05bfa48472@collabora.com>
Message-ID: <EADAC3BA-3D8C-4E04-B8E3-629CAFF0194F@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fh0DnkQD1cSAk3kEV8uLTJFU4fKtgHsxg3UVKYznYNF6N6PLYNL
 ac+bVkUvkC2h9HHY5Ldd2XwBYdG0GLXfx3Uy4g0Gj9nFK69AnbPL1GoLCidiHyPuOqNoEt0
 sJtGHaZRhXC9oKcT7KkdWqP9sLc+xlzrKi7422l6pbzRb3qbdnSSPyM0BV00dOjiUWxy8O3
 uxLdxrlkLgFtC1ZPe0nkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P+2RQecfEzY=;FwCZ6grwvk3/b9RmcG92LoQkEY/
 HiymK7VJhujTVnV8u3zUjqBwQmNUW3iahixTDK0CfgrJareC8poJqLPWqRRKodcythmv8RaRx
 GjsXQW6d/5wJxUSnFh1MDjXG/P0Q3Miv6kyvogGHZCifeG9cmK1pCWoe1GA6sqMCbqur60HyB
 HoPbc9QZAUlbPpt3v9UQfDWX34XwJSJ3zNYsLhxtKQifhxUrgXif7IYvOG3cfMXsrdb9O1+qW
 p7GpJ02s33QXQiF+pQm0NNSe/SBqcCr0HVSRimyzgS8vSqm6366U/ECR+iU9iZ6aNiLqZEKj/
 jOpZIu0z5XIuxOhgIlEDdwwyse3iakIitnUk/KZAwtSxvUkFQTwE+xQG115ZI2lo/HMjHycYy
 ed9vf3cmlHtaO/kIE4ioxlTFJlNL6GQqAw8+uXTk/F3pw8h8/A96BsM3m6ExjtfDBuxB28kLY
 9svePqMVJ/MSSvBSyGAlT/HqbotRd5Ldc+idEE0/yoB1jTfAdyPeN+HT+fSsM5BZkMVRvXxar
 0og1jcjFIJtEEQNjAMMZnWK4KyL2FR5L6mE6kB/EMpl8LGMZguVM4S3DQwstWN6dLm1WS0wZe
 yNTFVwh7giK7uYC3ZoRfiDmQREHpAR8I7L+30QRsDEY5fg6WO5w1i6YnTlJDMV6ih1xfGfHYI
 ysxLrEFAKRc44140jQwP+/IlJmODfMiiPab+6PG7CkkIRssIO1mK04StcSKbMangctkfVjL9O
 iGjK8dQ0PZIAizaKgWJBsFJ+B8MbanKiZ/Fge5fevoAak866mwiXXQj+Yrvh9jmrVnZFUjsGn
 CbOXSP8fiUgNHDNn/fk7nDwZF2W0ZvlR0zDGc/e0SclS0qxK2l2OM4kYuP1kevqTCWvzXR5JP
 w3ieCU/AKXfd1zBb9AYb8CFbDCe4uMh0p1hP+13fjgTiontYWJpdomRySKPxehFFm5JgCrW9c
 U65VaTcxIxm7xrIgyRc7Mr/pw0FQUSHYLzA9uFxIifMtrD6CFDBaCtIvMWQ7WTMNjJ8OxPqFr
 e/RygEEYssYugYHzVbM/EDWGPxjdPCXtcMvK8qD003k4PZz/eRWcFfz3wiu9oxt3ilXbYhlh+
 zWOsNlW5N46ePOmioLvP9kp0tszKtZuf48vjSwyTf2Tl3hXO6+0oBU8a9AwrYAdBS2OPMnn6p
 0Tc+o2nmOZPzx4mDqKzZSei3DeoAmEeP6orfd6guK6llZuyfnNTil+4SfxKCCR9sb6ARvH6J7
 OLmcq2ngkSuhAObRT0AtAqhWFUhotzaocOrqE12W6TTgKh5yHomoEgiH8MpuYFffOap9H2pA3
 nqFw+DeCbVEdExwHyHHZv2YZsGE3aCf7nthH60n3damF05cP4OcW0ZuQOv5b5lIjUcpMiR2TY
 x83Ks6KSA4ga5Dl7ylxfsFE2l5PSUjCgMrTRI=

Am 10=2E Februar 2025 11:56:40 MEZ schrieb AngeloGioacchino Del Regno <ange=
logioacchino=2Edelregno@collabora=2Ecom>:
>Il 07/02/25 14:54, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Sinovoip has released other variants of Bananapi-R4 board=2E
>> The known changes affecting only the LAN SFP+ slot which is replaced
>> by a 2=2E5G phy with optional PoE=2E
>>=20
>> As the SFP-Ports are not upstreamed yet this patch simply renames the
>> current board dts to dtsi, creating new dts for the board including
>> the new dtsi and move i2c-mux channel for sfp lan to board dts=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>
>I understand what's going on, and I agree, but this change alone doesn't =
make a lot
>of sense, does it?
>
>If I were to see a commit that moves everything in a dtsi, and justifies =
that by
>adding two dts for the two variants, though, things would be different=2E=
=2E=2E=2E :-)
>
>Cheers,
>Angelo
>
>> ---
>>   =2E=2E=2E/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts  | 404 +--------=
---------
>>   =2E=2E=2E/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edtsi | 403 +++++++++=
++++++++
>>   2 files changed, 407 insertions(+), 400 deletions(-)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-=
r4=2Edtsi
>>=20

It is preparation for adding additional nodes like sfp cages=2E I only hav=
e the dual-sfp board so i can only add these based on schematic=2E The one =
(wan-sfp) would go into dtsi and lan-sfp go into dts because other variants=
 using a phy here as described=2E
regards Frank
