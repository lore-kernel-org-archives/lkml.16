Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D73198E7B;
	Wed,  2 Apr 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621535; cv=none; b=OvK/EDXpImOYqP4D1go10DIZZyW/vQbLkrTZLrY4AZC2bdJwCCCVHSYIQjrPTDzcj3gPghiWx/bgdBBjUzHutNib8OVT55x5IXFuIQHi8PJNJOd9B/CuoeT7/JAOIHwiKwcgHvrnF5+Z6UXPs9i+DEp+9rcG995o7im7gs0ugSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621535; c=relaxed/simple;
	bh=5rksUNhfAEgoUEAhKSYbrD5OLg3Xu3DvBNwAYhFN4EY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fAulNCpkMm9mOPHkX1EZbR9Omo6YFqkiqADihMz39O9Cs2jlnAb3leHrIg6WsDp7iK3BuTIqvG1/9u7uLF2PrHmQRYBt1lkS1cdRq8/qfFNm6XBnrzU+LXFnaZsu359/EXA/Kkg/HtL99gYEDK3jtClBc5Kh1Lwvy48a/cye/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=au/hJsu0; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="au/hJsu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743621510; x=1744226310; i=markus.elfring@web.de;
	bh=3eH/l7ZTxLi5ehoYXW+d9YDJb1SMcCdWqiuMvLAH5ao=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=au/hJsu0G9VGyIpC89R7foPIMKQiYAOUTEaHQ7pRCRAyKqv/owkDOXdWceDp+Uy0
	 XOGP0VloMe8nBzQ8lavvfSGU6WUNzmkz9PdAl8twIH8rrsTsZdZKIcQEAJvakFVwg
	 fh5JkHEziTxG+W/QfbZwzUp48zN1pupKCyKBKHwZeJS/g2KcE4V5Rto8wTU7Z1ZKt
	 vfPhjlqRdHtvtyGP8457jOAEXLmRxeqWlbtlaCafS+IgOCyMurOJ53/O3VTQur/bm
	 8lV0mSeS9LCavbtCg64IywOyXDRIJzWcp+j5Vmv8eO2iONTpWb+QomRuA4KXADOID
	 bB6d1J2WMzo5ceUhXw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mr7am-1tLoyu2zWI-00ky06; Wed, 02
 Apr 2025 21:18:30 +0200
Message-ID: <4481af92-9573-4f40-ad65-a2d6b3ca2e0e@web.de>
Date: Wed, 2 Apr 2025 21:18:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ethan Carter Edwards <ethan@ethancedwards.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
References: <20250402141411.44972-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: Fix null-ptr-deref in
 avs_component_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250402141411.44972-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:USzRAbRg8TrO7y1V7xg3AhCMahvxPxSUGO9OGvaLLNy9ZoSXChm
 OQzGOhC4N03NrAHeqs8E+Qd1f3Qv7RFuiyX6fPmkHRn0Q/wgLsGTfwIvlyrqg1+5/0evtoH
 FnCzHOm3pKDNBSoUAD5P5rF7T2VlCFCFZyYma3dGHhZpThmlq+ctQSmk1Xj4dQsQ7RShw3w
 M3Shsufz6vSXTMWxASJ0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LIaYJMxPng0=;4bNvREQBaUvnYTI5bCekXih77g+
 uHqIpqB0eH9So0yZ1dukiFcneMQot9L8bhiuVrUR0xM7VMmEJKOzS6IxNcQDiv1tbYbcFwogs
 k+GR5VcPS7nXs8BU6x2z3Jfn9F/zSCMzqkRfWUoVImQXs4XiDg8rDiOA8h4Gbc62V5WW3mNCd
 jU5xMTqN4X8wcpOJSeE9mUjDBmxUNFVh0YKy5at1L1T+DRlCPl6pwUnFeZyozkn4jT/liDI9j
 Cqpqmva5UQFwzgukGQfZ8LFGf/Rbe+9yI/LgU00JJ4a2WBgdfkiGxyuOq1+bN7U1foiI1FR2n
 04OFkAWeUGLU+tq3Jh1u3Sl3QlRuO6uycMBHTBNm4wpJ28XlzPZcR6L5W90pb/eAzCIgBNpAs
 XMgBZn12uqUSbgjInOtaURPabvX7IRa8PQ2tuXu00x8IXZ1Y8xkau7SVHQoCW5DuFwIx7Yi/v
 5l/TWRlLgAnluaIkyyzq0Kgz3qf0zPrF/cX30W2gZ27NFzJafkbaGsFnnBQunvIYBj0/NiUsT
 CpO5vwkWf5x+GNEAVq7Dtpa8OkSkK3PuA768IX0JB3t9tzYZ7HZHhTXth+edgqqutFE9ocChc
 TCkkMc+6N8cxTyNBxIQ9E0IjPhu5Jy5Q2ox2G7MDnCzxHWCxOH0RmXYuiTPHmHxknrw1y/vcw
 9SmEZpckngdb/zYxfp8i3nnRDR6NVGWV9cKGUvOHPx3wMjD+kcEQOERcW/SnouAT3mH7UfqP0
 VexB+BoFtTodVGFKTbtMjhE+fBIncjCeVIPhT5GC8MZcBNRKGdD4LELGsFXH2Qt9854rAJZWH
 jRHWNH/4r83K6DPnh2GwokHAhzuG1Qb5n29jCCa0vFSic+HLdYdaYfiwPnm+LeUR7oX5ulh9J
 ItPDC3XBmgCi2r1PL1inZZU3qlaCtF3MibGeTEg/5VgtL+TXckpbmnDweYI5xLAKH00t+wppD
 X74Y5oYYrxCkfzcwcjdtCgOqVHvcXwU2LUQJG6XXKgvuOuR+SoLI+S+/NiBX2fTv5ngA24BSU
 l0DwAmmFTWPDoo1ZT+92DYhhvSXyOiL8ZfY4WxE15UutL8s8AV5XC4GttwdyNmdNaWWlPdmmp
 1/cp3Jm0EoOXejS4aqW8D74ZG+PIvCQX0reXm6IVDsXlCBphaYjzwc0XzN1fpQl1xKGYhXpQe
 c8jeHcEXlJgPli5nHZ7QN5uyE1IfnBCKvH1AysRlsN9o+bUWPmAowp5E9cpwntFa/D3VX6GPj
 fGlApBuW50h3BQVenS0Bby8NV75iU9DSPYxiotTB1ULGcEiBrOxA0vAOGqd235fatnQRpZHJO
 vxncrXQYfECpBBlWpE2XviDy4w3y6IwAgHmzUQYC9lUVs6Ow7jMTcmmhETi7Usd7kqjiS1H8l
 LFKJYLt3O7lMbMJpSsFrkVBK0xoGd3ru+xU1kG8FMIwmZ8e6D3m/HZQYiKufhw3zZ19PuNaka
 6q/h7wIwBXl9nAt58LoITONA7XKN+tYsrCE/HjqTpm7Lyc6qw1z/wGu4bXm9qFD2tOV5UvA==

> devm_kasprintf() returns NULL when memory allocation fails. Currently,
=E2=80=A6
                                                       failed?

Can a summary phrase like =E2=80=9CPrevent null pointer dereference
in avs_component_probe()=E2=80=9D a bit nicer?


=E2=80=A6
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -927,7 +927,8 @@ static int avs_component_probe(struct snd_soc_compon=
ent *component)
>  		else
>  			mach->tplg_filename =3D devm_kasprintf(adev->dev, GFP_KERNEL,
>  							     "hda-generic-tplg.bin");
> -
> +		if (!mach->tplg_filename)
> +			return -ENOMEM;

Can a blank line be desirable after such a statement?


Would another source code transformation become helpful with an additional=
 update step?

-		if (((vendor_id >> 16) & 0xFFFF) =3D=3D 0x8086)
-			mach->tplg_filename =3D devm_kasprintf(adev->dev, GFP_KERNEL,
-							     "hda-8086-generic-tplg.bin");
-		else
-			mach->tplg_filename =3D devm_kasprintf(adev->dev, GFP_KERNEL,
-							     "hda-generic-tplg.bin");
+		mach->tplg_filename =3D devm_kasprintf(adev->dev, GFP_KERNEL,
+						     (((vendor_id >> 16) & 0xFFFF) =3D=3D 0x8086)
+						     ? "hda-8086-generic-tplg.bin"
+						     : "hda-generic-tplg.bin");


Regards,
Markus
