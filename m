Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5519DF5B;
	Mon, 14 Apr 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625970; cv=none; b=BziG/IOOKkMuD4E9huaK8oHtuNNDM+PUFlPk2Qyh99mTXedluFJYI6yLbraBZvAEghU+0xKs4dvaAo9KJVAGEPNZ1vKdxtbCYeDs3inY4EkZpNUMfV9h0wHdMoezxvON6jXDzeHr6iObKNyVPJbjdYtL/DMxVt8A2ysoXhNfI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625970; c=relaxed/simple;
	bh=8AUDCa2bFbhDxocnhMJLUL4mVzjPvMbbO5QvuwMN9u4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=o7UsvOx6LXfGYyaVOG+7uex9gA3Wytm4dlxoXV5aAcX70lTi6yMNmxwsA6yzzTVIa6KS2ELTLGaL82MEek/42vAIy4fiX5hoqL7wmL/wi7bm3nCGL6oFhxIzeZizNM+rBFEblu4GoNaki1UofEeOcLQ7Rcr8qejTNXoOnvyAZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=pb9uZvtX; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="pb9uZvtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1744625955; x=1745230755; i=frank-w@public-files.de;
	bh=Nz/9LoleswJOBMWWarfwfjIyzjFuTnSEnL/vauq1sKg=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pb9uZvtXdzGEjcgCHOiS+oh6j4V6S2FQLH82vu7wakvgOBX+GhWI9DNIIG/KlOYy
	 Q+pAlRpxvF4vrS/uUD4e12SFg2VYHI8t0XMZj4IMwbiS72oMIa9fwUwEPMW1rmXNA
	 uZ6eSIqovyxPqCGrW98wMwlx6DlxYNnD/zPNjuIlBLonZOpBmG2Lhqn/3IgLKnZ79
	 261/VR2h8FZF3no2vk293JJcLGIIHBieji0nAsCVHlkK3XUARxpJxqXhQGFbYXkBX
	 8v/BNPl6FHfWPEgFXuEAfNj5t5NoUXj7KmeY3f+0FYT4HPoC1kWUFpSPIh8VEyaZ2
	 pMJNzI4FmfHhixD16g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My32L-1t6QUm1hDL-014uo4; Mon, 14
 Apr 2025 12:19:15 +0200
Date: Mon, 14 Apr 2025 12:19:14 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_arm64=3A_dts=3A_mediatek=3A_mt7?=
 =?US-ASCII?Q?988a-bpi-r4=3A_allow_hw_variants_of_bpi-r4?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
References: <20250412102109.101094-1-linux@fw-web.de> <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
Message-ID: <4469DD7C-1C73-4767-867B-729819C2E1B4@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7N69bXK+N3CyD9yoadxJ+FNeOP1TdMUlX1+6VoOVQDAAEp790hl
 tb9IDasVWc79xuwtucNLQrhtJDVyVxuoyiOP03reEP+SU6F0EpEPqgCWA31UbMMOG2ZHsiF
 Zi3JU+pMyba8343VHHrZ08U/fX/4XMfEbOF47yDOmfYb3TOmWkGAMG0CZzxDU3ufwwKPakr
 IQcmKlP3gkrmYn0liaVMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oOI1oI2Z4BA=;xPw9U0HDGPXNc/8qxdsPfLjU219
 qSDCrcrU4djg3UhmCAWTDuWM1vKG+vWVQXZyUmqwqcWqyGntoWjyJY/Jnd/W1S2Nz4REr3cga
 iRYIzL/0SuAT0OXShwfT0Tlzh0uSbbNmiZozG/xlP6pRez9rlEHmluFn6tDl3oqIjdBInouA0
 GZcYsepbWcJD3G0hSmNxArOoGUMdnSTdHWi/wtidDi/tHZd52ZLutZn1SzcWc/ItGToPzdgnd
 PphdErxKjrKFUDnZts+KY3K54J1NUGJ86og+fUdwtXnc9pP8Onp3Spm70d6Z60yEUzIWO7CJ1
 i46EWAyDbZjhbVevEmMfnw0f2fvt+hQMJBDVdeDPJzN3x3c1SAweyW3KUlX8WcZkNMc9VCVXW
 SB8bKn6lEqfkk668oFKD0D36jejVr9XmWJz3RoBouXbjh4A87U+0/87OIyLZOpP9uIxBKnczh
 sA6NLc0ey6rFCTdBmjp9+UBv83i0v1onIwL5O8WA0PspkolM8bO2MiYcNiGwRkYvp9yFp1Dx5
 8iYEATClWcFIKf3soiUwl2pAke2XVnjI5TijNWvuW5dJakKaKVNB3SmVMBPrH75zaESL51RN1
 BXBaeF0582VlLEldHf+/rzU3ucP4AruWLrT0ngK0GQY5MqO8wTeIpTPtn/sUMKJUePRldOanC
 fzffB56qZqRDrjasaxDXIDtpJMRLjFbqT6ZXbNGa+7IcGLbECzaY/soyK50AINhmVmc3TG439
 DaLwA9+AENoJKEMO5rY4LgwJeuo5qSZqqQazZMoVtnGAKUwa5/YHlaOMECkNS/qWZzMy7z2M0
 jBIPLsQ+yMWkDFbzsSHJ43eledJVLeCnFvjjhQSA/O+vYQYj/t+PkZOyoGcpoz3ewMQWCGmv7
 rU+dAsNWzsqlfHELinIqDoy35aHaM4Ghpy02tKPD1An3rFB3q9thljXORUqcDOkrXNKWGmh1A
 J/N+qlvPr+543bCYvhm8Mchwkd0NoLFSazU3k241XndpIgu4GOFejOPZIFLA3HVH37WFmomNi
 hfrRdCn/wsKZOP1SjQwpTHuC3/PldeBfuBS85OFpsS1Lzlu3UEJYKHm8EJcY0jBRF94/ikpeN
 r8ROj0uJg2YntBJfTGCgsZCVasAKCKa/qxaPc9M70HCxtnVeCih2Uv8U3sebQAZy9gJ+zhkRJ
 qOtHEfcnWXGth3yjW/t/WklvHfpuyBGGhxHMN+HgENSI2eo9u6xuKebOsNCqrapfuCsZQ22Tv
 RKOgSFxvpX3Svq4lRxwT8FOkyg4q6U3MG+zI/dBOqi64+FqcZ0UAlJRk2VSsnziKssK2fBed3
 BA+Q2JMILPEFE0Ets6v164lO+RamTEJ7ZkSM6O5uCvH6ZUEfrOFnyyWgYEIycKo7lsLDI2zrX
 oN3J5++EAbHOIdCbAZY+XLmpPvlujgfLqEIClMjHD2ag9geT1UIbQoC+gu6boFEOnn8EhAufH
 TAGdCnzTFDZenv5XUH2beX+lUWCw1LVzLHX/g4XHvpu0v1tDb

Am 14=2E April 2025 11:27:23 MESZ schrieb AngeloGioacchino Del Regno <angel=
ogioacchino=2Edelregno@collabora=2Ecom>:
>Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
snip
>This should at least have some different compatible, if not probably also=
 a
>different model string - as it's a different device=2E
>
>	compatible =3D "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt798=
8a";
>	model =3D "Banana Pi BPI-R4 (2=2E5GbE)";
>	chassis-type =3D "embedded";
>
>=2E=2Esnip=2E=2E
>
>a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edtsi b/arch/arm6=
4/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2E1ab09ed2f151
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edtsi
>> @@ -0,0 +1,403 @@
>> +// SPDX-License-Identifier: GPL-2=2E0-only OR MIT
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio=2Eh>
>> +#include <dt-bindings/regulator/richtek,rt5190a-regulator=2Eh>
>> +
>> +#include "mt7988a=2Edtsi"
>> +
>> +/ {
>> +	compatible =3D "bananapi,bpi-r4", "mediatek,mt7988a";
>> +	model =3D "Banana Pi BPI-R4";
>> +	chassis-type =3D "embedded";
>
>Please keep compatible/model/chassis-type in dts files=2E

Ok, should i add specific compatible to existing board (like 2sfp)? Just t=
hinking how binding should look like=2E

Else is there an example for adding optional compatible without adding a c=
omplete block in binding?

>Cheers,
>Angelo


regards Frank
