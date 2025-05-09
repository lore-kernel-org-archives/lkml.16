Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9009028C2BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789986; cv=none; b=KcY64QAr1/qFY5g5LSIO1/UZyfSN0Mk4l3dyswxQapkW1Qj/X+E//CeAwCIJxAHO9Nz4nTZlua3sA4so/0s8F6QRnKeIjjaS64XuyAo207FmweTkLNgtkrK/JJD0/SMLRbxuO0vpt/CcXixLUYv0OdDK41mmY/KCtldUgvJAu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789986; c=relaxed/simple;
	bh=MHHca0equBuNB6LxXbIoeLvc+sprxjrgB/yI56MtObA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7k3u0sEP8Jf8RRhc7T3//p4Ylpyrb7SrydepV7B4G9uSRNDxvnLF5BO6SYAo17fQnlZCsb85odqYqGyc7Rt8qSfFFDK4qLQP8lmPyIpdViXUdV5V0u6ENTv78cBjZEsEORW1rg17iRrJf9rgvuAmiBoagdbYxf7sUQ14puhnlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sr3WYoKc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sr3WYoKc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so14900455e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746789983; x=1747394783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lz2WGV5DsARe2ef6xf9hB2gw824v2BlYjF+3OFaRa+Y=;
        b=Sr3WYoKcehU0lLwLrOtxRAuHIEAqg24DGVpv9de9EsmP3orYOKGLENqSYn+hsSjCZM
         JEbbuTuNoU+QqhzzkJQD0m7DERk7Fz2/6WnyJyf0/Uia1X+WsABSk6QbSdTKHxmuzWZK
         gQZrKYCFfk4DH/aLcvQxJddji9hD4xHs2XOH33SxVJFXUHRgN95E6kCnh77e4n4yJ9rj
         BZwLm0ws032l3wxmNoJu4aAdlKG0xUkolYFTZRZpO+3CKTPbsKy96Zqa0Z4uCODfWqF9
         RdqZPifpgiC02HzPAt8z6l21aw7bAi68QdRyPcfpf6cUzWLEomewtkRXoUZF1kJ0pIfd
         jvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789983; x=1747394783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz2WGV5DsARe2ef6xf9hB2gw824v2BlYjF+3OFaRa+Y=;
        b=fFbeQ4e+SB+j5uMgRVB1OuyHyTAARcV9X+WvoSXFcf4ibaSoA3ojUhCehj4O472RO2
         47iAB7RnoKzpeKrbJjfgEZOVrSQDHQ0hA8QRCswVfMmOOtOqzt7HWl8bB0asa7ih82dj
         voikqc78Penqr15+kE0TLLgoi7PlyugO6ECFVJmEHoOOcV9F967/56V1Rm6sqzqQCJGx
         xjFjg+PrkjmUljuL7WlB8zMLijEC8vigxz/0oMXxJX1QdGpW8VHT7rL+IMZd6QOb9J66
         ypmQfTHsW4GAouHfbtkNya65FoSUVqQ4Ggi7SWwwrZl6mcDN3/GeAzDF93uNv4eaza1v
         iMRA==
X-Forwarded-Encrypted: i=1; AJvYcCV9uqhngE42wTVtrPjRQ4BWRLDXRq4Sr/VYdkrcXUr9iSb6+7Hezta7teMw9J/eTF4eBTD4CuQtvGQmNcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyggXeV0Vy32PoU/W9XsAfbwkoCcoa4NUTKGjmNH7AryDCofG
	FmwJCajkL+87+KZb4qsKB7QX28YeRx3B23lWt8l40WrUfX+dAlNhLaQIX0RCVXc=
X-Gm-Gg: ASbGncuWHmux4+FxrZ80FFlzsIsdiN3DytusGKFll0ktqqXfVojoLQn7wfik/J0m3xl
	84/vtqxblTM+LPl9nfjByUHUsGcyiPZooCvNfjGdgqa8rjzugLKRgRi+YFoduGOcPxJrKblApfX
	ARBUBDJun1At4YybFYqELSRC0Zu21mb3GAlqxLGhBMCMDPXTztKR0uxcbqKkWZdRwJ444W+fbV2
	J32jJ7DUI0PI8w30YjVRksn69scX354NC12npPLu8QRFj/Z5zJUE1s0dOSQ7SiNYl2dV6XL60sM
	y06w0z1uA0wk+sWUiXFjzHwxSMSrFhjeU3LnLz7c65s=
X-Google-Smtp-Source: AGHT+IF1DqZRXwnqEDJC6RoEDZ05/IxWbN0y1MNMAHjLg08+G1rqNk/P8xMlNeorPMh/z66y3/jqUw==
X-Received: by 2002:a5d:4fc7:0:b0:39c:1257:dbaa with SMTP id ffacd0b85a97d-3a1f64b5a66mr2078868f8f.58.1746789982795;
        Fri, 09 May 2025 04:26:22 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c7a5sm2992122f8f.98.2025.05.09.04.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:26:22 -0700 (PDT)
Message-ID: <4dbe2a87-2c03-4565-a486-41d4116892ae@linaro.org>
Date: Fri, 9 May 2025 12:26:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] dt-bindings: spi: dspi: Add S32G support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-12-32bfcd2fea11@linaro.org>
 <af92e978-e6f1-43db-8a84-334e7dd0d43d@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <af92e978-e6f1-43db-8a84-334e7dd0d43d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2025 12:14 pm, Krzysztof Kozlowski wrote:
> On 09/05/2025 13:05, James Clark wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>>
>> Document S32G compatible strings. 's32g2' and 's32g3' use the same
>> driver so 's32g2' must follow 's32g3'.
>>
>> The SPI controller node in dts can define both host and target pinctrl.
>> The selection between them will be done based on pinctrl-names. The
>> default pinctrl will be loaded first and will be used by the host. If
>> the controller is configured as target (spi-slave property is added in
>> the dts node), the driver will look for the "slave" pinctrl and apply it
>> if found.
> 
> 
> I do not see any changes in the binding related to above paragraph, so I
> do not understand why are you explaining driver?
> 

Yes it's probably a bit verbose, it's just a standard SPI binding that 
also supports target mode. I can reduce it.

I'm also not even sure the "slave" pinctrl part is correct as I was 
testing it in target mode without any special naming. I will double 
check that too.

>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,dspi.yaml | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
>> index 7ca8fceda717..b5fac0bb142a 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
>> @@ -23,6 +23,7 @@ properties:
>>             - fsl,ls2080a-dspi
>>             - fsl,ls2085a-dspi
>>             - fsl,lx2160a-dspi
>> +          - nxp,s32g2-dspi
>>         - items:
>>             - enum:
>>                 - fsl,ls1012a-dspi
>> @@ -37,6 +38,9 @@ properties:
>>         - items:
>>             - const: fsl,lx2160a-dspi
>>             - const: fsl,ls2085a-dspi
>> +      - items:
>> +          - const: nxp,s32g3-dspi
>> +          - const: nxp,s32g2-dspi
>>   
>>     reg:
>>       maxItems: 1
>> @@ -114,3 +118,17 @@ examples:
>>                   spi-cs-hold-delay-ns = <50>;
>>           };
>>       };
>> +  # S32G3 in target mode
>> +  - |
>> +    spi0: spi@401d4000 {
> 
> Drop unused label.
> 

Will do.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

Thanks for the review.

James

