Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522EA1A5BAC;
	Thu, 24 Apr 2025 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507414; cv=none; b=bfcK0m5OhaMDPQGGt6RYmfZ+CzedVjqfz2/T0dKVoV5jbb941qkmGfAmR7eBgt2wGCOzB6iEJXF5K/hiayOEu62YMVg9MegpgH6ow0hp8egE1BGByTpy7HvKWBTQwRPOKxtdxLXczbRoknflGDh+Qo3A1N+yjROjYMb8/V9YFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507414; c=relaxed/simple;
	bh=bK/ci+8ASAlkbVw/HpHtFd/CU0jQDuHOox/SqV2bF7M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QFLrD5p/gggWSZXq/5hWe3MFkwQpLYNn00MOSXzyzKaRaDBEsB3vDYL1TmpSBUp9zM0C6VBQ6CKCfTQ26QKdmshX0i5ReB+qganKB7CJ4XIRMIfDPKXmore0sJF1hi4AuJQI88PelYwTa6Zxqbac5RjgNagmLCGjjpBlZ1opON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=fa6hxiJk; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="fa6hxiJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1745507392; x=1746112192; i=frank-w@public-files.de;
	bh=uH3ELgiPVf/JDQvg8WabETxlcSaCrtptXOhZsz2D374=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fa6hxiJkZeCXcR0ELG30FSkT45qQKVJsCJOPd799m9IiHwnewyUu6MKtG5EXCIdx
	 jm+z0YG887amL2hsnVI7zp85sVWJPJE3/IvKQEk2mRU4RfVadlTqpAjadnNrjjEfy
	 juLrHkIom8vpnne4yH0bC+3N+2ivkKn2J+XdO93z3ua1Ej6wM2pQ/Kl6IAgGjjvv4
	 L9DY7shVNlcHShzIu6bk6dU/PIhel1Zvw+RBJdKXCCYwxw288iDeD1xut07T7zIFk
	 TiBgqB4RQHH0boc975yv5EfhvLkINi+5Y40Zyx2ocO/6RYTZtPgsKOc5AW68ocra/
	 WwmszkbnR3qJH95Wuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([194.15.81.133]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5vc-1uTso33zd2-00J2sr; Thu, 24
 Apr 2025 17:09:52 +0200
Date: Thu, 24 Apr 2025 17:09:47 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_4/8=5D_dt-bindings=3A_phy=3A_mt?=
 =?US-ASCII?Q?k-xs-phy=3A_support_type_switch_by_pericfg?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <20250424-auspicious-boisterous-pheasant-7d1f9f@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de> <20250422132438.15735-5-linux@fw-web.de> <20250424-auspicious-boisterous-pheasant-7d1f9f@kuoka>
Message-ID: <01CBE61B-2611-4DD6-9EB3-C2AB3BDC9D3D@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1PcTuTg3PzRAWB9L+BtgCx0Y4dnJKegKmx6dmykL1u64NlkyWMm
 0gAZwKvWxn8bYvZFLQ5uRIyP6NaXWxW9EOIQeRNBlWtw0sM01Ryzdkrfs1Gp2fPllz08VB2
 Fu0JF4rQaKaUXwPj8PBtwyEHArO8AQ/1nQDAYr3yBgUsxo0g9Vv6nZOPy7JEYx5XitDh61R
 Pwdk3Y9n46rn65Y/E2V3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kZCNP73SocQ=;jBlNtqVBgN5JsVFNqJZnidUrX+C
 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
 /zAZjzzii8bTwU87G4cX6yHcy2TLUgoEuF

Am 24=2E April 2025 09:35:11 MESZ schrieb Krzysztof Kozlowski <krzk@kernel=
=2Eorg>:
>On Tue, Apr 22, 2025 at 03:24:27PM GMT, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add support for type switch by pericfg register between USB3/PCIe=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>> v4:
>> - changes based on comments from Krzysztof
>> - change to phy type configuration controller/register
>> ---
>>  =2E=2E=2E/devicetree/bindings/phy/mediatek,xsphy=2Eyaml   | 15 +++++++=
++++++++
>>  1 file changed, 15 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy=2Eyam=
l b/Documentation/devicetree/bindings/phy/mediatek,xsphy=2Eyaml
>> index 3b5253659e6f=2E=2E0bed847bb4ad 100644
>> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy=2Eyaml
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy=2Eyaml
>> @@ -151,6 +151,21 @@ patternProperties:
>>          minimum: 1
>>          maximum: 31
>> =20
>> +      mediatek,syscon-type:
>
>Although this should be probably mediatek,phy-type-syscon, because now
>it feels like you define here type of syscon=2E Anyway, keep Rb tag=2E

I/Daniel took same property name like for tphy=2E
Thanks for your opinion,but i hope the series can be merged now :)

>Best regards,
>Krzysztof
>


regards Frank
