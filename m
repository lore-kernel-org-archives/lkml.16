Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89822202C4A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738625232; cv=none; b=oppbPD0xT5KPbbKUqLkVD4k51sn4UeXK46WS3J6iF9WP/rP2hPPjWz1hUKPprL+6+kYpaw5PE9Ffo7MkNX3FE8ZUdEGunls3sAKSA9/gc7fVoWkcB2u4Bs1S4GexF2ppezHjbU8vYB6Y311Z5BCUFJcCqZu8K7/OEwwJgwbXZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738625232; c=relaxed/simple;
	bh=K7wihRwgcusVonD88DydIp9aglMQX2URY0cSBXWxNjM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=P8x934lz8SD/AC/kAT3EZK9Oc0sx+AWEjUrBOkfc/TnAYGTAP8yI9tlR2jepKJdDSnDU2va2eHhIlU7kCMOZI7ql6C+7Lb/Pv5BcdV8EOYrDBygcEWMA+8Ku7gWlO/rfUwmB3N+go9k35xzrhfZqRHtc5ukXIc+MWOUczy601uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=x6Fj5SkY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="x6Fj5SkY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso34192355e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 15:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738625229; x=1739230029; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7wihRwgcusVonD88DydIp9aglMQX2URY0cSBXWxNjM=;
        b=x6Fj5SkY6NNDTZQf5JYyI+EMyQUxnHMp1v+6bgHLy6zvRMW3eDWBBxJn5n2zOlUzMA
         z5Ztnd3BvoqEGPGul1zwy+nzlgE5nlKTS5AItjzhlaln20aAjce10YJROUzta3GfloK7
         yPqaYnEJ33E8h6/EFxC8TvxC38jbKyZwwPzxPuP2oJSDBRk0838wDyvQ+LCLDfVm1+eO
         U8M1jYuEFX6tPPPgAiZ1z+bPITcujdCCvEX8apRKo62oEfJ9soLAGXR/fMSI7D8UH/Y3
         QpFnzBTzAdIoBN3x4Ce94c92r1l0Qx8YA3i0SCpo1eGqO8puOIYc9WolgCHcPP8oWShA
         bAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738625229; x=1739230029;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7wihRwgcusVonD88DydIp9aglMQX2URY0cSBXWxNjM=;
        b=Jt5Xe7fWOoaeFkHJ31Jv5OE/Mx+7INXBf2Ig8mmOopnlgMRkT0fgQ5QiBtAApcFWgQ
         ESxSxtnZPC3vcao+eJSqPpY9UX9uzTng9CJk3AJuFMVrz8VJjwkgMWjsPIEsIlVXMKdg
         MQsvV+Qytf7fenZ7MxLEUkK+8VmI2/C3ERf9WqEcvhi4/glIAvTx0p6FTvOe5GI+p/qD
         i8pRIUP7oN3kV6OZmGijCtmWuyWWxl1WBpwdGVWHmiI9et6jVmF/++U9LS6MhfHubiG8
         GMI3U8KLdHxOHOfMfebpUTjZas9U0CknKB6GyGo48uU1vFtn3iDz+J98ePScS6yql7Vj
         t9zg==
X-Forwarded-Encrypted: i=1; AJvYcCWtRzwWbNa5+p5p9nGsnnoaPTWN0ZD1UcCvvHhX7R2vPF4aJsI9W8aQEuRn1GQh/m6uGgdK+vabAgmjP0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHHUtIyGJYZl6jnJbKeW+mkU8+yI2ShITPKc/HZF5tRmibAJCs
	Aylr3hqCBIIYGHG8hhzmsOs8HJsMrbzvxp3tF5IZUUVCMEwfFlkTsZJHuu47ZkI=
X-Gm-Gg: ASbGnctFjb0SRRaQbBLUfg3MLWyEaZYWINOrxRBhJVlijNt7AUiCNF3T5B/q52BdrBL
	IhI75MirTnARBjg5NVyLoPzbTqeiz6biMHlSmvLjLNR+yaW4SGs/zwLNOWXWwrF52SpKkjLmVOw
	P9w489QpPIbNNyUAe4NPBK0+qEmh1wL/x0opf9fsJAN09Y8eyCqd4P1s7MJkodK+XisfNqrB6Sb
	8bTLGm0/bfqaPlVBZ+ErNwPrAcw2W+ErVRWlIEh6jswCrLjnjF2aEZIoF//hQn9AiVXuqeetvmT
	1ytj0HwNacb6IOA/J4n4L/I=
X-Google-Smtp-Source: AGHT+IH7VglpuOrvoGelSu/OEVcUq3P12Ew/XlWE8HGA32pm+QlQ6mJlcZFbE4X9m982bWpBOTZiMA==
X-Received: by 2002:a05:600c:1f15:b0:434:f335:83b with SMTP id 5b1f17b1804b1-438dc3a84aamr235318645e9.5.1738625228711;
        Mon, 03 Feb 2025 15:27:08 -0800 (PST)
Received: from localhost ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1317fsm209055245e9.8.2025.02.03.15.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 15:27:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 00:27:07 +0100
Message-Id: <D7J77FB0GLG2.1SDETF63DWW8Z@fairphone.com>
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Danila Tikhonov" <danila@jiaxyga.com>, <neil.armstrong@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@mainlining.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250203113857.34728-1-danila@jiaxyga.com>
 <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
 <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>
In-Reply-To: <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>

On Mon Feb 3, 2025 at 5:33 PM CET, Danila Tikhonov wrote:
> On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
>> On 03/02/2025 12:38, Danila Tikhonov wrote:
>>> When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
>>> needs to get enabled to be able to use the mi2s interface.
>>>
>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>> ---
>>> =C2=A0 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>> =C2=A0 1 file changed, 13 insertions(+)
>>>
>>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>>> index 311377317176..03687de1ebb0 100644
>>> --- a/sound/soc/qcom/sc8280xp.c
>>> +++ b/sound/soc/qcom/sc8280xp.c
>>> @@ -14,6 +14,8 @@
>>> =C2=A0 #include "common.h"
>>> =C2=A0 #include "sdw.h"
>>> =C2=A0 +#define MI2S_BCLK_RATE=C2=A0=C2=A0=C2=A0 1536000
>>> +
>>> =C2=A0 struct sc8280xp_snd_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool stream_prepared[AFE_PORT_MAX];
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card;
>>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>> =C2=A0 =C2=A0 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *=
rtd)
>>> =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 unsigned int codec_dai_fmt =3D SND_SOC_DAIFMT_BC_FC=
;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int fmt =3D SND_SOC_DAIFMT_BP_FP;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc8280xp_snd_data *data =3D=20
>>> snd_soc_card_get_drvdata(rtd->card);
>>> +=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_co=
dec(rtd, 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *cpu_dai =3D snd_soc_=
rtd_to_cpu(rtd, 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card =3D rtd->card;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_jack *dp_jack=C2=A0 =3D N=
ULL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int dp_pcm_id =3D 0;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (cpu_dai->id) {
>>> +=C2=A0=C2=A0=C2=A0 case PRIMARY_MI2S_RX:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_dai_fmt |=3D SND_SOC_=
DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_sysclk(cpu_=
dai,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Q6A=
FE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MI2=
S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>>
>> How is this possible ? sc8280xp uses the q6prm clock driver, and=20
>> there's no
>> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally=20
>> missed
>> something.
>>
>> And prm is neither a dai nor has the set_sysclk callback.
>>
>> Neil
>>
> Oh, thanks for the answer.
>
> This comes from qcm6490 compatibility. Actually it is needed for
> Nothing Phone (1) and Luca Weiss just suggested me to use
> qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
> closest to QCM6490):
> https://github.com/sc7280-mainline/linux/pull/5#discussion_r1848984788
> Actually I also think it is a bit incorrect.

For reference, this is coming from this and following:
https://lore.kernel.org/linux-arm-msm/e8a24709-de96-4d09-ba00-1e084a656c68@=
kernel.org/

Regards
Luca

>
> ---
> Regards,
> Danila
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(cpu_dai=
, fmt);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(codec_d=
ai, codec_dai_fmt);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_0:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_1:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>

