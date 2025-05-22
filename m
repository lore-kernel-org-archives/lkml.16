Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A618DF89
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935954; cv=none; b=Kmqdxj+AKCZ76ffcziSEFivt+yEAttvSXKy7TYhSXu7SGf909icJm2QI4R1nlCga622wp9Mb0Sr+xA4A/sW6sJfUdTdGVaodaFm1WCv9/6r6/GvxymATtcmUFh3HrY2uz3JQLNVD7AO3u4DQrdtcl2y+44spoLODYSoQsVW5K6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935954; c=relaxed/simple;
	bh=ZBmHmRhlynqokVz5epHFmdHwl3Gre5xfbPOKGf20HRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7Qs5nEpUSHzw4mygiKlX0ueJa6KM+mYHiEuGbamOVlt4eY3YECQ7nutqKiCpxZ1sV4g/ywcMkaTPVWKvMAABhZSR+0kzzM2RF5UmE3h7hRpzT7B2RbJdbOL93KnlM5pYpdyAr8KzPswjr6YXsNQzpKBx/hOhyugxXjXaJTXgYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUmpyajS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUmpyajS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a365bc0af8so623960f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935951; x=1748540751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wNaKrT6jTjUIFUZ6pIaMtvSc1T3Q7lOQddtn+8yHQeU=;
        b=kUmpyajSA00nv6NX6RK7si0kRkMph6dkdsNOZNByQ3Xp3mysHIOgd5YKZSfHC9iew/
         /8Im6fp7qdkD2DnksptH4ZSwA9Y2E9/YzU/X1ISLKhx41UhfqcIoF0ss2y356OQlecxU
         +GSQiS1pFcJXrHEiwkyC5drpzGYjC+M8F8jMNerR93YAO/VauyI2gI4T+ynYyRBL4qRA
         RCW7f3Ac5R+8gi+Nac4XgNuVPiVNV4FPL9rMijeZPEROIurfpRE6hSf15GuJWYNCE5Qm
         GujjEPZrzeRxLVw07bgmY2syqlWmUxfGCdoqDodlDVA2U7H901aJFXTzK6f9WlfDIxoR
         ZgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935951; x=1748540751;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNaKrT6jTjUIFUZ6pIaMtvSc1T3Q7lOQddtn+8yHQeU=;
        b=XYfgGDizR20VrFIYk/PhSEz09lHYSWuS4HusRmfJXTKt5MVqmsK72Ht3pvgl72sOkG
         0vUTr/pAYNPuuqKxNBE2kbRJZfDtrLq2gaofS84K0+gXPzJsvtJ/HMKPtX3XljPQxmSu
         A4ntcYoWKhGZuy1J/GXubvvRH8du6mhm5D/4oJMQnNZ/BMH9aCgvRpdMfZ5gdwX2XD+7
         xY2B8VuLP95GtgNGT93bKAB3j69Gc4l817piqFHSqnjWCaXnP60hNQXtGWEMbUgttXyj
         U5OcWs8FYfy/RRWrtqmDSt9TeXFvRqKmg9XA9dfmoiQWkvpzHwoH4tiL/v+VSsZyhv4k
         /TRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvp7SVP9tMYxl73wAUEk+/WwRXyn9fANCbdOw5exxNOLmwgRvK+ZBVJYTMNzc3ytnTwvV8oN1ymzbdf64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx311HiH1+W0ycP5ZHhR8mb9Ppm8MxUqCYTO1atjFLKFcosb3sp
	SJFTnK+3oft6OTWV1HaXXVbBM585R+Ek+bvwPJM3LxkkCkTTDxjIexoRACAmMJA/s5w=
X-Gm-Gg: ASbGncumn3eJYM1jtNypGlYfKSAQ/E7dtsBFIUPU+Nx0UqT5vK3gyM5nJzbypM68naB
	Ic8460hek75Mcos23UFazuXl+/zudyP9ozRC0lsi6Jtnf6dDZen+7FawloTW6SW7P7Oy9foQk4D
	UXwyZwzm9OyxrqRCfR6EpeOrhIHUBiM0C7mUWYDGdpyzTT0oQVd9QXn4t85mP04Z5zmOsAa5U51
	MAQWQmNfDvNmahENsiSSibiYnU1J+/zivE74RVm0FHEOL0tgTb6E4FD1cm814CcamhuaE1JuWjv
	GqGurVkh64OhsD5nDJfaERcQQiKiG9xq3NjyWWauznTs8V3R+8rMXzQa4ETrEWOtqzXxVlBk4ef
	NT35Ojw==
X-Google-Smtp-Source: AGHT+IGDLIEnT3V3B47/CP/HTDBa5Tkf2t1MDtbi/mmdM21aJvzpUUo7OUvBGc2M3FKq5BQH+RYTsg==
X-Received: by 2002:a5d:5888:0:b0:3a3:7351:6f39 with SMTP id ffacd0b85a97d-3a373517245mr5726785f8f.15.1747935950862;
        Thu, 22 May 2025 10:45:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36835ef41sm19802745f8f.94.2025.05.22.10.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:45:50 -0700 (PDT)
Message-ID: <b0f472af-6a0f-493f-aca3-65321931bebe@linaro.org>
Date: Thu, 22 May 2025 19:45:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 19:40, Alexey Klimov wrote:
> WSA881X also supports analog mode when device is configured via i2c
> only. Document it, add properties, new compatibles and example.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,wsa881x.yaml    | 66 +++++++++++++++++++---
>  1 file changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> index ac03672ebf6de1df862ce282f955ac91bdd9167d..a33e2754ec6159dbcaf5b6fcacf89eb2a6056899 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> @@ -12,15 +12,17 @@ maintainers:
>  description: |
>    WSA8810 is a class-D smart speaker amplifier and WSA8815
>    is a high-output power class-D smart speaker amplifier.
> -  Their primary operating mode uses a SoundWire digital audio
> -  interface. This binding is for SoundWire interface.
> -
> -allOf:
> -  - $ref: dai-common.yaml#
> +  This family of amplifiers support two operating modes:
> +  SoundWire digital audio interface which is a primary mode
> +  and analog mode when device is configured via i2c only.
> +  This binding describes both modes.
>  
>  properties:
>    compatible:
> -    const: sdw10217201000
> +    enum:
> +      - qcom,wsa8810
> +      - qcom,wsa8815
> +      - sdw10217201000

You never responded to my comments, never implemented them. Same problem
as before.

Best regards,
Krzysztof
