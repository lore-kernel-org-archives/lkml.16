Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B221C177
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982384; cv=none; b=DrrwDFUB2Dd1HdBwkp8oRpu4jXzeLwwFI8EbC8vq47n05WSNt/m7ol9BNm20rvHEkEjgcadL781S/F/UfnBfV/vzfM6Jo5M9TKkm7KA6lfIAaUuC0LcohxMlBnWVjmyuzQYKJexD/iCN+RklJ3vQ3ZrQLOdFRCdxUrKKI9aYoS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982384; c=relaxed/simple;
	bh=a4LMODi+7I0yUCL/C7dKE+C7Px1J8u/IvHv9wlwt5SY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LDl/4PRcphwdcKQ+iwJfrRaftDm8mWQzsIy2pmij0FaCz5ruHpc/DklR9RgkrkmhiF4OpMdsCwP38ThTpm9/REV1J2EkuaRZ4H/msiqqoD+YBzkX0eCayn8NLzJENdx2RQdSJGlHiJ8+sDSV2UPrMyBSjuonAhGPQN0Ezy7rRY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oJIZPYWv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oJIZPYWv"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aca99fc253bso288681866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982381; x=1745587181; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18xAiPNjvUXv4YiBT+Xfch3sUCPEgtZ0YaB8+xTlS7I=;
        b=oJIZPYWvGGriSdy/3KcCOEliBQqS54S/1JotBhaKtK9reB+d8jJfFh0uUWrw+p4eiV
         x9YN5LmW+rNCQme8efssVQUDHYSVqxhCYAFAhsnkyQUsjBIrlBeorobxae3MqKGvpTlx
         +1etet910ZnUCB+gxtUoH6h43nd590SKAB2SW1rAxEGKichk/JISDCCGvQ/dYp0l+X/y
         yHx/iVFP1eXF6W7AKPXy4dKnJsJMmlZS8+Ahika8BlDI0PqGLuGHFfv+OgshCFR/sdqn
         m3k5MvVoARuUUtP+WwVQ5SRVyOv7WGpT/TfEMiN/j4sy+H80oihhsFQPD63Io0NQTrrf
         SbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982381; x=1745587181;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18xAiPNjvUXv4YiBT+Xfch3sUCPEgtZ0YaB8+xTlS7I=;
        b=K7KoqzL1fB94OssJ78hHQT/JCLfueA/ejI1rxrD/YK2hH+Y8vlXyJBrq8m1O+j04t4
         pWXa4Z9DdrTVXgeZT3lO/IY0dHYqsbVP8U7S3tUFlUt+s/1xSk/yGfD6Tld7+ESvZ+AC
         JpN8tc4uKdc2IR8/BytqDFmkbwc1kEpQuz9HBNK47C2adKxY/LxEyrpuTf5443EVTOeC
         TbtXdIEbavQl6G+hCH6elUMBX8yQxfLGQ2Ks3mzympwU4aYeqTzFrj1jTXqZEipL+UZr
         MLlkRCRbym+86a1xobsy11QXefMnoe54pYmxh7TbkMHtQSuVHGt6YyYb6u5vinCj9tdN
         QsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfHuQ3IAZO7/4yemBRghHrTBxP0sz+sgj37tAGrJ0gplZHGLIGJEL0203vxtJnXj6tSkglzFdL/jb0dfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxa2p7uRetmuo2nvyFyxlsE+zaqHCF3FvgFNwu5vDmPc28SYOo
	tH0HpOCpPjmkeouPQr0/t/LaL/ibpNOBiWwCYmr04hrHYQW20/awtjBPeRJ21eQ=
X-Gm-Gg: ASbGncumcmyvMe5Oh/UGmymtHipgq5nt3MqJWFpzAHW54pqzIzT3oWDILWxejuwAHCs
	D2ZhCdGx4CmMbTc2y6VZ/CqkKdpNkxck/ydfNi113jwlkjE6u97Dkjfn7+F7PjoygbbjiWkKePC
	5s2AOj1Vs3128FQeu5FIqRJNQR2ZEzAWWYz5/bn52sSRl9wIfSLEkqbVMWlmzYWR+zWVjnH2aak
	0SZiIPVqmDr4pHItYYxC+NwtOmUsSp1YzoJLgFgkLmQrE56i0o4oHpA2KGZViAIGjFkA646Ani2
	Al6WNIvzTBpoA8CdOGeKI6eFGxFPafXEvDVBhVMHRV5Vzpgmr1TAdg5zl+rCB4orWcMlaqfsmaB
	3pCt9UA3xzw==
X-Google-Smtp-Source: AGHT+IG9hmqHtnwikphn4JKKRRhE693TgEeX/rNe9Dak00b8UouYQMcQlMnAXGGeKz8R0LWLtIqogg==
X-Received: by 2002:a17:907:2cc7:b0:ac7:82b3:7ad with SMTP id a640c23a62f3a-acb74dd54acmr221017866b.46.1744982380544;
        Fri, 18 Apr 2025 06:19:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef468d3sm118642866b.136.2025.04.18.06.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Apr 2025 15:19:39 +0200
Message-Id: <D99SMMHTD9DV.15UGEM2T6E1JB@fairphone.com>
Cc: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@mainlining.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, <neil.armstrong@linaro.org>,
 "Danila Tikhonov" <danila@jiaxyga.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250203113857.34728-1-danila@jiaxyga.com>
 <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
 <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>
 <D7J77FB0GLG2.1SDETF63DWW8Z@fairphone.com>
 <842284b1-343f-4991-98f4-462f547ad2bc@linaro.org>
 <D7JKR1YB6PSS.PRWFJ8NDA9BZ@fairphone.com>
 <7ac9b23a-6138-46ad-8af8-fe283b765565@linaro.org>
 <D7JKVM7P6ZUY.24LUVX621VEPC@fairphone.com>
In-Reply-To: <D7JKVM7P6ZUY.24LUVX621VEPC@fairphone.com>

On Tue Feb 4, 2025 at 11:09 AM CET, Luca Weiss wrote:
> On Tue Feb 4, 2025 at 11:08 AM CET, neil.armstrong wrote:
>> On 04/02/2025 11:04, Luca Weiss wrote:
>>> On Tue Feb 4, 2025 at 9:19 AM CET, neil.armstrong wrote:
>>>> On 04/02/2025 00:27, Luca Weiss wrote:
>>>>> On Mon Feb 3, 2025 at 5:33 PM CET, Danila Tikhonov wrote:
>>>>>> On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
>>>>>>> On 03/02/2025 12:38, Danila Tikhonov wrote:
>>>>>>>> When using primary mi2s on sc8280xp-compatible SoCs, the correct c=
lock
>>>>>>>> needs to get enabled to be able to use the mi2s interface.
>>>>>>>>
>>>>>>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>>>>>>> ---
>>>>>>>>   =C2=A0 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>>>>>>>   =C2=A0 1 file changed, 13 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>>>>>>>> index 311377317176..03687de1ebb0 100644
>>>>>>>> --- a/sound/soc/qcom/sc8280xp.c
>>>>>>>> +++ b/sound/soc/qcom/sc8280xp.c
>>>>>>>> @@ -14,6 +14,8 @@
>>>>>>>>   =C2=A0 #include "common.h"
>>>>>>>>   =C2=A0 #include "sdw.h"
>>>>>>>>   =C2=A0 +#define MI2S_BCLK_RATE=C2=A0=C2=A0=C2=A0 1536000
>>>>>>>> +
>>>>>>>>   =C2=A0 struct sc8280xp_snd_data {
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool stream_prepared[AFE_PORT_MAX=
];
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card;
>>>>>>>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>>>>>>>   =C2=A0 =C2=A0 static int sc8280xp_snd_init(struct snd_soc_pcm_ru=
ntime *rtd)
>>>>>>>>   =C2=A0 {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int codec_dai_fmt =3D SND_SOC_DAIFMT_=
BC_FC;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int fmt =3D SND_SOC_DAIFMT_BP_FP;
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc8280xp_snd_data *data =
=3D
>>>>>>>> snd_soc_card_get_drvdata(rtd->card);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *codec_dai =3D snd_soc_rtd_=
to_codec(rtd, 0);
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *cpu_dai =3D s=
nd_soc_rtd_to_cpu(rtd, 0);
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card =3D rtd=
->card;
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_jack *dp_jack=C2=
=A0 =3D NULL;
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int dp_pcm_id =3D 0;
>>>>>>>>   =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (cpu_dai->id) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case PRIMARY_MI2S_RX:
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_dai_fmt |=3D SND=
_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_sysclk=
(cpu_dai,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>>>>>>>
>>>>>>> How is this possible ? sc8280xp uses the q6prm clock driver, and
>>>>>>> there's no
>>>>>>> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I total=
ly
>>>>>>> missed
>>>>>>> something.
>>>>>>>
>>>>>>> And prm is neither a dai nor has the set_sysclk callback.
>>>>>>>
>>>>>>> Neil
>>>>>>>
>>>>>> Oh, thanks for the answer.
>>>>>>
>>>>>> This comes from qcm6490 compatibility. Actually it is needed for
>>>>>> Nothing Phone (1) and Luca Weiss just suggested me to use
>>>>>> qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
>>>>>> closest to QCM6490):
>>>>>> https://github.com/sc7280-mainline/linux/pull/5#discussion_r18489847=
88
>>>>>> Actually I also think it is a bit incorrect.
>>>>>
>>>>> For reference, this is coming from this and following:
>>>>> https://lore.kernel.org/linux-arm-msm/e8a24709-de96-4d09-ba00-1e084a6=
56c68@kernel.org/
>>>>
>>>> Sure, but do you use sound/soc/qcom/sc8280xp.c ? it's designed for aud=
ioreach
>>>> compatible audio architecture (post sm8250).
>>>=20
>>> I would've also thought qcm6490-idp and qcm6490-rb3gen2 are
>>> pre-audioreach, so sm8250.c would be a better match - but these two
>>> devices already use sc8280xp.c driver for some reason?
>>
>> I think they were added to sc8280xp.c because it has the logic to change
>> the card name and some other tweaks for record channels setup,
>> but it can be easily added to sm8250.c.
>
> This is probably a better idea then...

FYI I've sent these patches now, confirmed with DisplayPort audio on
QCM6490 Fairphone 5

https://lore.kernel.org/linux-arm-msm/20250418-fp5-dp-sound-v2-2-05d65f084b=
05@fairphone.com/
+ following

Regards
Luca

>
>>
>> Neil
>>
>>>=20
>>> Maybe someone with more insight on these devices can help clarify this?
>>> I'll also need this for qcm6490-fairphone-fp5 soon.
>>>=20
>>> Regards Luca
>>>=20
>>>>
>>>> sound/soc/qcom/sm8250.c has already support for PRIMARY_MI2S_RX via
>>>> the Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, and it compatible with the previ=
ous
>>>> audio architecture (non audioreach).
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> Regards
>>>>> Luca
>>>>>
>>>>>>
>>>>>> ---
>>>>>> Regards,
>>>>>> Danila
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(cp=
u_dai, fmt);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(co=
dec_dai, codec_dai_fmt);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_0:
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_1:
>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>>
>>>>>
>>>=20

