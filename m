Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF86E2797B0;
	Tue, 15 Apr 2025 08:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704434; cv=none; b=QKZ5yR3SS2GjIy4YbHmb/2OdOsW+D1hLTN7Ftf1IaE+/zo0DsuSYtlGFI1qy6OMb2wcPTDNwFCSdYfFgKS/eDHHnoQUKkw0ttNphHj5Dz/ZXye6y+FmPqinaTkMu6bQsAwuHunovJzqBmUM5V8BHaj5hPT3UpZnKmxpkRh0gtes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704434; c=relaxed/simple;
	bh=+m+uNy+59Q122M1MZy6kii8sx83LYMOv463vHliVczo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NhUdra+ZDLjk+pLJBDLoY+S51dGXJXurvfEI2UbA1gbUioDB6sQTLeAIsy9GnE31l1ZfLz2oaAnG2rEwSBXNgJU1+j3VB4Bi6iblHqYKRL1zu6mlUE1HWkYpgIJuLkR+NwoYZOA73qbegNLyv2BIJP/C+OO2X53nvJ15b4xjjYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=qxHviqfs; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="qxHviqfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1744704420; x=1745309220; i=frank-w@public-files.de;
	bh=XClP9NrLHwO9fwyHdOh4Auz1PVrNeq/TxoOgtoY90n0=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qxHviqfsMTqZ1v990RvfJ9bRejEDPM0U7zJhNy/0Jz/s823RYlcXko39BUK7gDBk
	 ZhsuG+0A9/Y8gHs1taDTTVHTmEsa9qJFT5ASKK93XvH4uU+unsxSIAddfWIrRZK+6
	 zzohCcaWpcFIE0fdCHQbysIfaEHC+NfO5+j9DfW2RdGQURNPoCJdX0Vq6rxc5MzhR
	 5WN7K8KKXsA0jKHeZWFXybZxdZzY1B0wnx98xesCkFU4krFxaUITraweE3cyDUAIO
	 2uWpljywdxKA7muLP95/90h1xtnDfFIOfnszdYQ2n0Kbemr4xffaYsMmjzrQNqubR
	 8EGNdXS+0u518+F8xA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDkw-1t7P002D2u-00zhBt; Tue, 15
 Apr 2025 10:07:00 +0200
Date: Tue, 15 Apr 2025 10:07:01 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>
CC: Frank Wunderlich <linux@fw-web.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_arm64=3A_dts=3A_mediatek=3A_mt7?=
 =?US-ASCII?Q?988a-bpi-r4=3A_allow_hw_variants_of_bpi-r4?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <36fe0778-399a-4406-8516-54b968cd9073@collabora.com>
References: <20250412102109.101094-1-linux@fw-web.de> <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com> <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org> <36fe0778-399a-4406-8516-54b968cd9073@collabora.com>
Message-ID: <D7682B25-5BEF-46D1-A5FD-32D2AAF84EFF@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pa0vggB9lm+W0OPebuX0jYpX0yjxP/JpOSgB44M0VVskPM3DXyD
 9LogsfM/xLxC6PLuk+GPj2lPIj+CtvYDf3dqHiqwYp+1+ps1ov8I/5nqfuf8HkliFx46miv
 2ji2rqWXr0YnZB4RZbPRjU72vNPHSgRp7NBP74IVwtTQSLijfJwg3ShW2lHmIExQfDiS1mI
 S5jTXNRgwb52P104LTVSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:urNve2rXxnY=;yiVEU3OJuoqbJPWsNk3xJFPrslb
 6XgS7F0953EiOMGLEpbanm9yU02fg8ccgzjIi0iXX3k0JbeVJmatpmQ0OxrvwBozA9scOQwtB
 LeWsYLKdKmMC7QK5IiZDJQNu3aqlCFRUFY+GdZBJBsLsEq9w/NACKuhqn4MWuWQhUSWE7fOnC
 PrX5inR6etO5xToJwZsDUisQ+SMdnidz9banxNUDlKnRcmDN0vP+ejNP+wwc8oKTnRXC+NXT9
 VhJoIvkkjeS2MuibBDBFH/4kzziiCM2GBZTjU69EGpCtS/PSX6VYbL+BU4O0nnY5HBoqzbckv
 /SuHRxbQLbf9HWGHgwtpCVKhM/riHH0iT3IbtPmnBz0HeTf1QbykqDmdN4v3IqpXjbp3T5p8k
 1pLnRsKOlP+M1CKqTIqY274QCeAE9KeIGE6AIQMkEr3nLT2evNKLemkG/ne9+RNncC/WO0aPF
 KTkP0IS1TqjHtgKd6vXdxSaYbqzJ9wPHOu6/AES0HiIqEL+Y8lFR70PZfELIH7arD2RyKdl9J
 Igu0F9CtNCKZmcBVOgfHuTGrKHRE+lhZk229WhmKgNPhgEOFK5zHlNlPYPCvcRT5jA2U48rk0
 HZyOzDTdqWxeMA+lTTmoFKDHLFkKchhz15QjnMq9QKbxuWJYgOMp3cen6Hi72vZQwzaoQ2XBy
 b3+Emgoie2bcxIvittQuIGqQMHkhnHm/9Yd6KiChBPUnXGT7JbeYFbKSFj73RWQ10Kj+5u94F
 AnaTrqIQhYT6FQxGcpjPM3dNj39H/93cp5srg8MYx+6GnVOAcWfwLWsgjTUHDVHje08mkfMsN
 4cnJ+3fZHF2BYOHw4bVcJ7YnpC1F9XPX9+ryNE47Erez086ZTT6Mhyr9EqKFG68lKzlnjx4An
 dl2hTJSW/u5LJHj0Rlz1pB7ngcHAfcNq7akmimLdUPIloS9kk8PVl7tUo5ZqLQAx9rTrzcg8R
 Snh9QekEJwREWFzPX6WqGSWTUr78SXEjlTOiIZclYuq8ijLAqSBYJ8EZolMRaT+mOieEEsGYL
 JNEeMdgdjMG8YV14fJl1j/EalciKqiN9NPmtmKghF3ALIVD9V2Beu8E5CPA3L2osLQN5sd7lU
 YAKSO51USU4lq3J4/XaUzvSA5vbfh8MuX1LsbyYsvZHs16JkRtqPv1io+9WZuATW/2Rvx80zf
 8zuje60L1jI87s/w7Kr2LUbbF7KlbFDWF3NI8vZXAVGYOtTnAVvxQV2CCmdRMBZP3ToA8X9r7
 8dTnfIJrnnd2rqukxpcuof4UVfcsD3UJ8Za4ofC7FPScImpdXYFMXXwbeyy2hRET1f8RXe2E5
 BSxa8e4dkzAdAmFGiJc2WnHcm+H0ibda5TzgR9M5zfmOO8D3m0K+vMt/oAJNT8CjALXAOcHxu
 VXZMc66BXlRBdfnotXsGsbyJJCqA+cqwBBdpgz/Ae8MJ3IgBdCv0bvttpfExjDPiuz2kscm36
 kGEPDeYkQPSpHY6Ilqqq3Ml01/vHudSElaMy3TzjSMSrSZJrr

Am 15=2E April 2025 09:36:43 MESZ schrieb AngeloGioacchino Del Regno <angel=
ogioacchino=2Edelregno@collabora=2Ecom>:
>Il 14/04/25 14:32, Daniel Golle ha scritto:
>> On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno wr=
ote:
>>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>>>=20
>>>> Sinovoip has released other variants of Bananapi-R4 board=2E
>>>> The known changes affecting only the LAN SFP+ slot which is replaced
>>>> by a 2=2E5G phy with optional PoE=2E
>>>>=20
>>>> Just move the common parts to a new dtsi and keep differences (only
>>>> i2c for lan-sfp) in dts=2E

>>> This should at least have some different compatible, if not probably a=
lso a
>>> different model string - as it's a different device=2E
>>>=20
>>> 	compatible =3D "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt=
7988a";
>>=20
>> Imho it doesn't make sense to declare compatibility with the
>> "bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with t=
he
>> "bananapi,bpi-r4"=2E It's a different board and using firmware meant fo=
r the
>> "bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will res=
ult
>> in a non-working Ethernet port=2E
>>=20
>
>Is this device a BananaPi R4 variant, or is it a completely different dev=
ice?

The only difference is that sfp-lan is replaced by RJ45 socket with mt7988=
 internal phy=2E

>If this is a completely different device, then it's not even a BananaPi R=
4,
>otherwise this is compatible with BananaPi R4, with a small variation :-)

Sinovoip now announces a R4Pro with some more changes (e=2Eg=2E an externa=
l 2=2E5g switch),but we have no detailed shematic yet=2E It looks they also=
 plan a R4lite which is based on different SoC (afair mt7987),but this is f=
or sure different device (and so not using this bpi-r4=2Edtsi)=2E

But basicly all are named BPi-R4=2E I guess R4Pro will also get own dts as=
 too much changed=2E

>Cheers,
>Angelo


regards Frank
