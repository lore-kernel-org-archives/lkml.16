Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3620B2066CE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378076; cv=none; b=A6gcWaYi5cYAbymnSBMtT9ogICc5O2bB4CGjip7PtIprWODfSqnpGZu6KmqAYh11u7jUAxFkvJ0uUEoYO/wfcq0K9EHt64BljtdfOvaK3wl+HhH9vZbkFUt4QIidMa+YclZwj+tFeH2tJAHcBurBUdv9rvkTyqcei2TmCKglgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378076; c=relaxed/simple;
	bh=Lk3vcO1oKeMbKUMeqUuClFL2qOenRvP/2/Pu/bcuHW8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=edAn9oHqfbcnf+shxfCdLT/HS0X/nwDjag+MhNmL2bF6yoxf9xyQ0Rl8XKHt32BFo4oG8hp4t+h/nemGq6q26GvzGfP3qjXIUTwnVoxmPPU1i0WQGdMbV8EqfjxKBS5PJ/UlgOiRF8hT6gzJiPr/aF9Aoyx75fOmsAq6EA2UoKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbdkxlQF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbdkxlQF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4c9024117so191253f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748378071; x=1748982871; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFJiAb2IUs00ZtUjOW77VpF9Eao8kfb+MFNiZYFFCXQ=;
        b=WbdkxlQFhvDJnz2+Mn/B5rfRdkbk4ILtPgpAtVj2q8pe4K55Zo9Jv6RZSYUQNzX7B8
         e2HGMvN5m9pVoKKRqo27ilrQnAq21Sc6BUzg6VRPHGxWe2zt8En1s9Nxq7AtALMOR8Dv
         3YTGavBBTqdnyqNeVa39KId7Fxj+3wNShqNj6Vd8S19O7G1Lf83Cg4G4tHXezzUMAjoU
         trmvI/+RNW/oucmoPPBZaIIahquzk0oLmqYK87AcGdqJPJ9L4RWSIE/hhS/B6BY1WkLs
         L9dctq+EYmP+NcASYWZAF1hi6gpjI5+1JAAvlGaNUW1MlfWReGF8p2gctv7FSGeFE5nJ
         jKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378071; x=1748982871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFJiAb2IUs00ZtUjOW77VpF9Eao8kfb+MFNiZYFFCXQ=;
        b=hntsEX+qMNtGkqhaeBx8PzWIOX290XfzEPgkXbtplBEryHyPRIU3t+Z+zyvOp+yxM2
         DcESXv1Jw4BcBFrVVkdFzavE7JTqbl8eN7dzxKgSfwp30QnOUSHhCYbfJsYRscQvnUQO
         HmSLngxK+giDBjoPb/v5wTfjVAj8DFpiPPha1gDNHbb1xH0QH/yVwCOEs3sZgpr6PO6f
         uA0V/v9plf5huA4zv9tmf3Mt69mi4e6fjVZdOlt7f2bJpJeaT4fJv8cy6sHjuwZomIEC
         UnndCMs1gLGILvLzqFsXTkADMi8YIEaoy978CUr6fu55H8euHk27788d3WbUpD0atyPF
         9INg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Jv24gH/5xDUqpGt7lZ+wAsxyV7Ar3MBrjtRZRwL8W+OMqRKMYk6qgehUJOp3upbiliucRf1iT5Bgr0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxor1aaFaoUQ+AFE2YTs+9yku93FYulUbaGglhyxUy+J4i5qMrL
	IF/XjO5WADO/TPINfOf7ciLjVG2mtiAYWdkxsRHg5TFrL/DFX9Br+UzDTdIh6hcnej8=
X-Gm-Gg: ASbGnctyo0CM60p64Ep/4PzNKpUqhPPGmqcLD/iilrg+lSybW6GiaOWdcIK8PS0XRq0
	DSU5oO7Pahx7ppTyUgB8S9K6KgSpIbeSjochmPYyuF6hFEFLL1k2dDgBq+aAOSm3Ufdo/IwPUCw
	MkGCm++d/kWKqshh8Ka27kUS15LkXspzJygYnwvygWtajqByxUiwberERcCKUsaGv2PDmjocPdH
	MirbZj/Zpofn/+jk6FJ7a3hUzFE5FSfKB4W8RX/gz+STL0sRVFiPKui5BOW5Vriq/CM3s44oS18
	ghq53yRz4GEQ1NUnKkJXHdBEEyuoiVC0FGpxV5umV7XgcjhE5xzlD9/OaA==
X-Google-Smtp-Source: AGHT+IHlDeoVP72Q/Uqyo+pZHURLBnl8XrfCspQPzPuFoQwwhDij8rvTNzWrNHORRzIve/wtI2xDsw==
X-Received: by 2002:a05:6000:1885:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a4e5e5dac6mr1861963f8f.9.1748378071390;
        Tue, 27 May 2025 13:34:31 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f45a8434sm292912855e9.0.2025.05.27.13.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 21:34:30 +0100
Message-Id: <DA78AT6VV956.3FZVIIIM3ZTFZ@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 03/12] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org>
 <b0f472af-6a0f-493f-aca3-65321931bebe@linaro.org>
In-Reply-To: <b0f472af-6a0f-493f-aca3-65321931bebe@linaro.org>

On Thu May 22, 2025 at 6:45 PM BST, Krzysztof Kozlowski wrote:
> On 22/05/2025 19:40, Alexey Klimov wrote:
>> WSA881X also supports analog mode when device is configured via i2c
>> only. Document it, add properties, new compatibles and example.
>>=20
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../devicetree/bindings/sound/qcom,wsa881x.yaml    | 66 +++++++++++++++=
++++---
>>  1 file changed, 58 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b=
/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> index ac03672ebf6de1df862ce282f955ac91bdd9167d..a33e2754ec6159dbcaf5b6fc=
acf89eb2a6056899 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> @@ -12,15 +12,17 @@ maintainers:
>>  description: |
>>    WSA8810 is a class-D smart speaker amplifier and WSA8815
>>    is a high-output power class-D smart speaker amplifier.
>> -  Their primary operating mode uses a SoundWire digital audio
>> -  interface. This binding is for SoundWire interface.
>> -
>> -allOf:
>> -  - $ref: dai-common.yaml#
>> +  This family of amplifiers support two operating modes:
>> +  SoundWire digital audio interface which is a primary mode
>> +  and analog mode when device is configured via i2c only.
>> +  This binding describes both modes.
>> =20
>>  properties:
>>    compatible:
>> -    const: sdw10217201000
>> +    enum:
>> +      - qcom,wsa8810
>> +      - qcom,wsa8815
>> +      - sdw10217201000
>
> You never responded to my comments, never implemented them. Same problem
> as before.

You don't respond to emails sometimes and, while I want to move this forwar=
d,
I am not taking any chances replying to few months old thread, so if it oka=
y
I'll respond here. Sorry for doing this.

Previous comment:

>You implement only one compatible, so does it mean they are compatible?
>If so, make them compatible.

There are two compatibles in wsa881x-i2c.c.
By looking at downstream sources and current code I think there is no diff
between wsa8810 and wsa8815 and it is handled by reading hw registers if
needed. So I am thinking that maybe it makes sense to reduce it to
"qcom,wsa881x".

Previous comment:
>Do not repeat property name as description. Say something useful. "GPIO
>spec for" is redundant, it cannot be anything else, so basically your
>description saod "mclk" which is the same as in property name.

>Usually clocks are not GPIOs, so description could explain that.

Should the "GPIO spec for control signal to the clock gating circuit" be
changed to "control signal to the clock gating circuit"?

Previous comment:
>That's not a valid syntax. Either enum or const.

>This was never tested.

>Why are you repeating the if?

These parts are no longer present.

Also i2c0 was changed to i2c in the example.

Best regards,
Alexey


