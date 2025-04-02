Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBEE1EFFB8;
	Wed,  2 Apr 2025 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595247; cv=none; b=GuHpcwjVGR7tqiT3rGWTTgO6Jj04MSL7SiWQGZAkPLd5oKw/81zrZ5xBFTN+iQ5GHcGchPc4CgpxNjfeMFTC5h4/1JXk11776W0MwlJVjOdd74oTOdqKq63IROvm4cyedmSHggs5quNWbHuD9V6xVaxLCyt28i1ZI2VEt/UXX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595247; c=relaxed/simple;
	bh=biiHfzYRwZ2WB4z1Udj7tWwwJsZRXda9wz+GtB2FHUI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=KHU/XGbnjCpM+m7jDi5y2CPh86y1UJsELAtkNuydHsx2R6oF5XsA3EWuDm7Cj5xNABzV24lTRBQAw3x8QhCBAOcof/xFJVaQDuyZ2Y7elkbZeOWIvRfxW6nU5VmLJbuo5MbWZD3bWAZtfnkgJey5jjhyYIq7UZVTxZIP1u0Kjh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=g+urfrPC; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="g+urfrPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743595235; x=1744200035; i=markus.elfring@web.de;
	bh=+kTTVKp8MB5zMDhSJalEGqfKtggbtbQDZdY2yroZ2bA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=g+urfrPCOOslY/iYoKewDhn/hrgfpsdnTw1hIrFIy42q8yg4PDq7WQZKLqJ61nNx
	 bK+tcjMih0MCWZfusa5RH8MRoVLJFzWXbY4hpB4fIUtpBzarZod1ijno/rnzfFcjx
	 atcMbITvvCqJwvfpPTR35CqE2dlfUQJTeIvDPHHkOXtQ59xWflNCci7cE9kK3atYX
	 kUYhBhMvBTTb5wTDKPdRktDhAn168ugSBKj7atLqBBKRCQbHLvppx1IQ2yBLsn9d0
	 8DmEaLwtyozoUg3Ak4fGhocjkw1CqPPzhs1vDlmZ+CpoNxzUh6F15IOwjNcAAMgiI
	 RTL6ko4PwoMPOMMdNQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMXxF-1thaPE0Sil-00S9Hn; Wed, 02
 Apr 2025 14:00:35 +0200
Message-ID: <ed1be43c-99e0-4afb-8f98-9c7f39611610@web.de>
Date: Wed, 2 Apr 2025 14:00:31 +0200
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
References: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Add NULL check in avs_component_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KW5W/WGVFkIkd6FI9+9Xb/yvurVcGFNnAATSjSVWSEaAH00wpUN
 hFn9pG5j75zN7uHYMB6XdTChv85LGu+gIE5UiWWfqgNVws9tkrVMz4P/HB3W9v65+669QLZ
 Uhbk0vyLcZb71Gl28Kak1JBmA7vxY5qz9nRQgpjQwaQn9fU2VKCRSHOLOEFf00GvbRD1JhO
 vmMvGGOewokU1qWv0jl3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6IpDgYfJbHI=;RALsUgA0qQXtKAennUfzkr6t0DA
 EkJxPZQZuMG1GtF/bhjmhPIEu5wpxorfeL0Lq3eofIO3gMd7LvM+CZw3Pdd7Jv53uTQfzFy0a
 F7rf2VlwBxq+YdAi7PiKjB/t8Cv/0k00mbEPDSdLcb4JhiwR6non6iZASPZ+kMM2wFi1i/syy
 aQBQsfQlPjAsnTA+V03vqfKqaY3ANbLunf+S/nx1Q3ASR/cRzIhjBZAkwZM+1GUESPrrsuGHC
 hdk/yMxeZLm9YDS1YLQzeeOSMcK2wgbkRWp+UJVtCIJ8ngR+5grluzepK+Bg1cM9e+cLdeuEa
 Y02nUBZXIWnUvYzUN87fWRDW7XupbV1ll7jhwxTaDb4jUfKBFlcIyBcFgVGEWMfVA0HH3su/Q
 NU/XotTWZJBZPLBQtoYCpgeyx+I8Tq2vLhbO3zhUPb8uBqcrwxMqaHfrySXF7FcMKfEEQQK+f
 bLRrJDI9hFGv4unZa7WGjdaSEz7E4Ld40zQko84qb73dowfNn+K0uLcq8iXSsEQ3x+zkg0mrD
 9+KNx8fIUF475IHPct+rW+28OdXW3fGMwulBlwYuWOa1wXmCe//ze11RdDoD6H9WAvNLpFG17
 /Yoy6n+KtxnO8eodYROPO7LcY4MnmLT6+WOd6to5GI+IW1QAsbPgBKIVJocKamTLiWH9y3P+4
 JE6Yjjnd+Vax9bzgSzFLRVF0judsF68+8jHrT3tvw1ZuyaT0ufoR0g7r/FhdivMPqvCfPlmvz
 hRJ/NZrl6tbUZNFKFMaJpoE2AU80bkrEv4VETgUGyqeYEbaqGbWoGl+2UtxAQKZCp/WGz1bmw
 e47AhSSt3On6I039WQ98SpXLQblTBptf5XU1evdI6aTsEf3ydWTP6TPd8+V4tpmCLlXM6gR4P
 ufTMNc29xeQUKQgIzCnD2P8cD0ioQlzaN7eHKnNmfmbaLGuKb6qTgvKQkxxxH0FiZ8sI5tuah
 AXJbuzQ0+kbMdnmaPEFIRPvoiEDcY34p5jsXcm16s3ASf01mxRQWEVCFqPyV2Xuf/DAwE/gPQ
 FS/Je8kyK47kS5fhdin3vUPK9oU+aU6B+0ABfX8V24m9OjNsOzINvRULXampb3+u6/S5DcFhB
 sRlHpEdWBYVhY3a+d0q5PYTx3iyGUujBMXl2yrcfDpUmUQf07c3f3Ra5ON6EUhssUJMGTeAcO
 3HIdSZ4VqliNUeKlRcCVE1C3PihYn3vGDB/SLZTB5mPq0xJwTLaBzXP8wDBOYNWP8L7eei3OT
 RQo1Ki8JRlet0/OAyrXH7BsWGRi3hbYNkC0SUCKeAbl+ET4QY5kuw5JsY929HSKGwxSdaLmXt
 dUHmmQQnkBJQsz1FlhugDLYyzgZjuRZ3RovITuDW7lqvyohac8lM8C40jHy5vDyfu96zfDMyE
 thKTT0AkjLXG3jdHsGm3n9uYQhPBf3L+D/nFPhcnj5Ylnsv/SqdhkoAoE7uTz6D0IyiWkvPv5
 CDTFQ2DureKctMD1V9FxtPltnb8ijVThhZ4tjfE/6FSRHsb8WobVrVfmGMU7x9hWBTAte5g==

> devm_kasprintf() returns NULL when memory allocation fails. Currently,
=E2=80=A6
                call?                                  failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you generally propose here to improve the error handling?


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
