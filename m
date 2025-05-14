Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E50F3EA98
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200539; cv=none; b=T5EHU6J00lh91lgSPPJFTdpIycSocOVQAknYZ7vliTIlFUn2mCQNhSXXZErF8wddkfLF5VV4iabr1/z8j5sJCLu5v/Ywunjt/tp0TvE5vjVeDZa6raynJjMZdA6LzRvWIVtcYDw3M94bZ75gmrw3qLrPka+J+q0txGKC/xVXEfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200539; c=relaxed/simple;
	bh=5dTwjDqUGC71o92UrTZQlZyU+5wMlvQZNqYAOZynkT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1y5LRANaoAgQZVe4bJ8l3Ne6AnKRZNQqXXszgsh6cADNFArXx5I8cULhtVttRJsDI3VfrjvedZaFDGJmuW/An0imgItNM16TM//pPB6QO4FKmwRNsEFzxv7L7nKLfcE1xW/MqLdtOA9gldzMkc+gFBvLEkpIvI1SfZlsXSGBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpwJv5xR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpwJv5xR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso4406160f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747200535; x=1747805335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmEU5NrY0WO7E3ww65s2y0b0wKsXCEAa4aBHaeCuKV4=;
        b=TpwJv5xRrFdE281NAmtGg71gLpjkMOJScZz0UndpQiYQQoMgtol4h15g8DIIfyj+Km
         RQx03bYO2KNoRqakOpwSvYtY6mRKw61uJQCZDhvawAZzafUWoJqYhXHs+iKGOuw5iSlD
         8gZCGcl5ne09ay4/NfPIZK3VyK2E93ALlJylb8awh8OHXQlHU9R5rPPuS8aUJHHNJ5yF
         L97a5uFPCZWiKAcDHegMPiHKMIrWEWZBPXfvUEnBLZI9IvYjr++3bzvW6+DNSHBRbWL/
         Abjq6+/STJqRFfE6ov+byFjQeTLtxt6lHkgtEWKAUJbWoHxHyT6pwlm8yqqyAUppqjUn
         +SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200535; x=1747805335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmEU5NrY0WO7E3ww65s2y0b0wKsXCEAa4aBHaeCuKV4=;
        b=QZ0wQzdQAuoT4B3K+JQmSCEVzwuY1iWJwfHgQw9/dezuXBVSN7mLCgkt/jZij9p11J
         ZPa1kM4DMkcywUWCIA7VgVC0EZGAUx9H/6AnZd0qXO7CW6yjpvudWUlahAvIRkHBDK2D
         KzRL6dYEp2ERxwbzGp5cHwa/m8dHXb2d8UG6tXq06hHdyAuVV2RAKstIsLJEvcmqhyzj
         jLsPiZQrBDol7rOPjOgFpmPGB1uihlq6LYB0asO87fJ/L1q6G9y+/7H/cmmyjE2bNS0E
         WhiuSFnYefj+395SNP+oedAQLX2Awnd5UMRaB/nEUSFqcLUTJSKTKCSLuOdB7iX/PAQi
         1uaA==
X-Forwarded-Encrypted: i=1; AJvYcCWqcaPtydbHJKn/p3ZJgi2UjvSKx1nLXTaJNbYJ8KCb9zSW2/EhSsgBiYYwGQPrBwBG6JtbAnxoPg3TGO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoztjNKsn2W9AuH0LQTazVL1TsWUl0K4vaM7pqoqlRf1VuFfSv
	xSiaxreawYKvXQsnG8bxfnIJU4bWU8zmjpbmZWiPoPhSX4p+isF92JwUIU+aA3I=
X-Gm-Gg: ASbGncuHy9bPvcklBmD+TNwvSLV0jxeiAr9meF3wWxpb/wx394eOPBoa/ZACuHWrJgl
	EEz0mdTKohQ3SwR+YJJuoe6xL6DC2XM4Rl3kx1rpi6bagXy51MDTOhReDpsMwOgwqP5nR905wG9
	4eBSsOX9Z1poeGXlHlrU1hiA4dxdLgY9eX00ZuzW4pg1R8ysSlHBMVz73jrGgyY+Uo0PewJL3Zb
	Q8ad8NtHuHYp33hBt5j5qWdcB6EGO3pjDtAvwv3/u/oel8928tRYv5CRaIXAWua6bvsvdILkEX2
	Y91yJNLz8r0A53/mB/hJw3xl1zUsgT+GvL3VDUOCWXspDXPfnDzPXSMXTMxOOIP6nNODlW+ZO2B
	pjiraruoJ5VVgXJse35/Byo0=
X-Google-Smtp-Source: AGHT+IEGAcfwKJBoQWtEXI0dUeoF2qoiKr1YbPO1n5TUPTbwmsk0AI4hKrFkPAFUSxZdY24ZnvFA2w==
X-Received: by 2002:a05:6000:1786:b0:3a0:b4a7:6e56 with SMTP id ffacd0b85a97d-3a3499512d4mr1435912f8f.56.1747200535475;
        Tue, 13 May 2025 22:28:55 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c583sm18144903f8f.84.2025.05.13.22.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:28:55 -0700 (PDT)
Message-ID: <684be594-85e2-49ee-8b9b-cf0b6d444cf5@linaro.org>
Date: Wed, 14 May 2025 06:28:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: Add sa8775p cci dt binding
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Add sa8775p cci i2c support in dt-binding documentation.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..117e9db86d0e1b3cf7c5366860fb56e8e72a4059 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
>                 - qcom,sdm670-cci
> @@ -184,6 +185,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
