Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED124C67A;
	Tue, 15 Apr 2025 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713055; cv=none; b=ZA8MtadYGVPLRLs9ehjL1Jg3i9GojfLSaQPmyE9MiPfSNfP1IBGs8AGIAkt29gzxUxL8QbuJDk48P31Y6B7UjOq1BWRjRhasysUkH8l0hGZx70rjiCqBDS7Kpw4TLqowiom2GfiHMkjymrmM0KMFnI32B4n2STrh9CD+tyOg/28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713055; c=relaxed/simple;
	bh=Q54juk+v31PrpOLCs3PzMZAzlsgDwULR2WsC5y+MfCQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qoK0pnlownSDnGLPNNK+KyJUJNnf/RkYbP4FZ1q1IuWRhIdx1KAdCkJvXJR+ev0ngoRGRwu87kTaV9Ig+O6QLryip3ksxvNEQf4vpwywhBR5LyLeDQZaA0sFFXX8CBoih6WotYOyfIxNIited+rlhXUgZSXKhCs0bDZfhbd2wNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=KBKRB/+h; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="KBKRB/+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1744713033; x=1745317833; i=frank-w@public-files.de;
	bh=WgqIUu9ojr7beR3hG5sdV5nNo9HnDoiSsjOcC+kJudY=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KBKRB/+hV4VwsG13/u+SDHwxEdTIc5MWNOTLfsAfmiAiNisKI8u2qYTwxuFKDrao
	 uGrl8cjZPYN4epfmln5w1JjkV1R7ikHrz18h2HRljODfQR7RS4qhfBPcuxg9JkD7L
	 Skc3m+Qb35/kbDbzvEdLippNpkeS9J7K0uM/f00RIPcAOwxo7/UF3skIXcCugbYEm
	 bOQPNAqrdmz8G/BNq76ohSfeZjIksLA0WjqkojRDK3bqVbj+NnfcOvIKjcJhwf8cL
	 HQgyxpOg9ExgGvS1YY8MV7jYBU/Dzj6zNiokB306hs274Rs0Ltji+HPxbKFobOTBu
	 YdPRRjMDtQcP2e0/Qw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.30]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1tiPqk3DHP-00P9pF; Tue, 15
 Apr 2025 12:30:33 +0200
Date: Tue, 15 Apr 2025 12:30:34 +0200
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
In-Reply-To: <8fe762e3-a9eb-4a9c-81a2-b7a10539b615@collabora.com>
References: <20250412102109.101094-1-linux@fw-web.de> <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com> <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org> <36fe0778-399a-4406-8516-54b968cd9073@collabora.com> <D7682B25-5BEF-46D1-A5FD-32D2AAF84EFF@public-files.de> <8fe762e3-a9eb-4a9c-81a2-b7a10539b615@collabora.com>
Message-ID: <48DEC6CC-A81B-4DD7-9F55-CA1179FBA2F2@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lLJIj65VGXw+6G0LOY49tgPACHjwE3VmkBrGn+7shtl1EW3b2pG
 87M+pcoS5dfrkhJV1oEnCSXo883Gg8iJB2t6prExwVn2sOM3ym2YdLBEYKOI5iEwjOakmPD
 Jiuflz9K6fxopQjHYtG4qCcgMKu4raqvuQX5r0l4Zllzf0MSihg2UOE1sScINe55K1NQX1w
 sok0WiGqjFLEmC4tC77lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/3vDsJWtv0o=;QGAKzf3I6xXFSnXdXYw9JtixUZR
 v/Jr3O2zcgq4wWSgbg4j7rPEJCpMei+48d83imI29JgDOWg9lz6V0i5tC19RalvNnijHfk6rl
 NDW4jtZRx9QEsTUC7hi4xXaxedKIuCE859QJltFtOIV0J7hmL5N2KPlbD0QJVUevkC889cNRt
 og15QY5/wcG6ch1JonLkOAXPdcqndUoll/z8AVVFAqwR5DwU4MZhFhM34BrXxzJgAm0kFL8JF
 0so6of1X+oJ2QBRx/Es7x/pm07/WqK9SJt/bs8SH7LtLgOjlAjXzeEOPIFGm1pZnEV42+CI8U
 Rcs0cj86+H3P42qZj6Yz1k909PHeWNonkZl4h6Dk5qJhgtIirqmbEjhwgpROjJhKYQGkU2GCN
 vk+E+Nvg+BSEJplTExpi2Oy12Q7gMcEi5MotIiGkelR1xITAlMKwoX1cy2QYo+djgmkq8d1xN
 35znS0oLfjAbB18q6ive0ToCOEBeMV7MbaddZrO9wOtYCMLP6m5DK7lfcovO8iYk55U2FfASD
 sZs4UhadMLYNehBEhEmqFDPkq2b7Erl5K1uaGFD01dC/yCpiLCgnmktTRkKwKKAchR1MCiXnl
 g8B/fuN1XDlLFt7D/wbQ51NfO0vN8NbB5qimULGNSv6EzU1oacQ4zyVIlyi6YeLO5FCvFrchk
 pLLLWQLMMmkIK4CgsbUdjFu3rlCxC1dxw5rfUhX5Nla1yZgQmcsUttwViseLP/PLPvIxrakUj
 Fwdvh9/mQBdSKblK4rDYKT5j2F5wgoiRnQI5jAD3i0K4RdfOqZvWwzEFBK5STLotoGVvqvrW+
 VlSJJkkO6KqFZ/T+saf3jXPdGEF4JD+DEbdUgQ7Qyt+8/kEJlQpM0bjBpoCQkixi732vl4ojO
 fROZQ11i3MRv2ldocIREGhbEgytuHDMkmWWj5P3ny+9HX07+K77JOkD73DA8dsaQNNx4ahl8N
 v7g1ugZ1Ku/ybZhZgFlFfJ6YBVPa6daB4/o9NbkxMgA0wwJ62SIoZKXXsViWPXg/cVz9XISYp
 TV52ckCzlEdPk1ClGjqwVrqxZkzM3U9+jNhKyx1MO8gnHzbVQJrhdMWAxnHD15ZJrRBZvSBPM
 6BRodsAokbbMx8UVFZWcSbu1F8ZaSD7knRomIVZNLcIVxs+JHAGmmE1mJOUQUATynKJNl+Hq1
 iK58dagAlTZe6rAmD4iruqKkiRd7uAm3x0C1719njucipZUwASy4yU+KH9LuOTKnFgTAAwbqQ
 k0Zo68MIyg5YSzNnc1XUr5Zi040LFFC+qtFK6OOy7Ra2ojz2zKFrQevatMAim7Gje9XRAVGPM
 sjN1UozOIs1ydU63P9H9+6sauUJHn3ObOT+3l1czMTL87fT3YHBa/UbM99wqQsPbuKFMWt7N3
 V0QW1p3QBWVVnNDWyNq20Hk5ZLNx2SF7qP7i2Qe0vICZMUy/A9kJayzcSQBG00TOCncczpaNv
 WSjEKuEdR8yRUPQukvhe8prWqaQ2tZ2MnuG/2n2UJRMwAaUcj

Am 15=2E April 2025 11:56:37 MESZ schrieb AngeloGioacchino Del Regno <angel=
ogioacchino=2Edelregno@collabora=2Ecom>:
>Il 15/04/25 10:07, Frank Wunderlich ha scritto:
>> Am 15=2E April 2025 09:36:43 MESZ schrieb AngeloGioacchino Del Regno <a=
ngelogioacchino=2Edelregno@collabora=2Ecom>:
>>> Il 14/04/25 14:32, Daniel Golle ha scritto:
>>>> On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno =
wrote:
>>>>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>>>>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>>>>>=20
>>>>>> Sinovoip has released other variants of Bananapi-R4 board=2E
>>>>>> The known changes affecting only the LAN SFP+ slot which is replace=
d
>>>>>> by a 2=2E5G phy with optional PoE=2E
>>>>>>=20
>>>>>> Just move the common parts to a new dtsi and keep differences (only
>>>>>> i2c for lan-sfp) in dts=2E
>>=20
>>>>> This should at least have some different compatible, if not probably=
 also a
>>>>> different model string - as it's a different device=2E
>>>>>=20
>>>>> 	compatible =3D "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,=
mt7988a";
>>>>=20
>>>> Imho it doesn't make sense to declare compatibility with the
>>>> "bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with=
 the
>>>> "bananapi,bpi-r4"=2E It's a different board and using firmware meant =
for the
>>>> "bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will r=
esult
>>>> in a non-working Ethernet port=2E
>>>>=20
>>>=20
>>> Is this device a BananaPi R4 variant, or is it a completely different =
device?
>>=20
>> The only difference is that sfp-lan is replaced by RJ45 socket with mt7=
988 internal phy=2E
>>=20
>
>Perfect, then:
> - The only difference is one routing
>   - The base board is the same
>   - Same hw project
>     - The two machines are compatible with each other
>       =2E=2E=2Ebar one difference
>
>=2E=2E=2Ethen the compatibles shall be as I said before :-)
>
>>> If this is a completely different device, then it's not even a BananaP=
i R4,
>>> otherwise this is compatible with BananaPi R4, with a small variation =
:-)
>>=20
>> Sinovoip now announces a R4Pro with some more changes (e=2Eg=2E an exte=
rnal 2=2E5g switch),but we have no detailed shematic yet=2E It looks they a=
lso plan a R4lite which is based on different SoC (afair mt7987),but this i=
s for sure different device (and so not using this bpi-r4=2Edtsi)=2E
>
>In that case, R4Lite shall not be compatible with R4, as the name may be =
the
>same, but in practice it's a different machine=2E
>
>>=20
>> But basicly all are named BPi-R4=2E I guess R4Pro will also get own dts=
 as too much changed=2E
>
>If R4pro is a redesign of the R4 board, that would not be compatible, as =
it
>would not be the same base design; otherwise, I'm sure you have well unde=
rstood
>how it works for the compatibles, anyway :D

Yes, should i use 3 const in the binding (as i do not expect another hw va=
riant of current R4) or still enum for the first compatible?

>Cheers!
>
>>=20
>>> Cheers,
>>> Angelo
>>=20
>>=20
>> regards Frank
>
>


regards Frank
