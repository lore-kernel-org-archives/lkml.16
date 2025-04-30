Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B38615A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011924; cv=none; b=OSQw9CSu43+BJBi/+D6U0tt+v8RqfWyNUmxSjI865I7J0LnyNmkaktOD3Zf2zTN3eGx0lpPXSx0NO05WkwGGKqNQJPxZS0bk5XgmbiyX/OvwPIhOHVVEedy12LG//bqkGO2P07N2gCPY9+dZpn/t17gljNwKdiTIEhhBpBJWnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011924; c=relaxed/simple;
	bh=qHVzRzYAX/G0uh2vhOZ3aWaU/ZOWTDKyqUKeO1jnO5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihvXeJCStbnSApN7/qzcGq7dPJFLTxZtzIWPVkPfvU7VIWwh+/GRGTCV7emVDFO/pokWT8u6IZHvu5ScTtUFnwlh64kRbSSShcwMRKO3DEUCVqD54PvRepbWXzo/gqiX+Wb68Q3/OI9BWOX01e0zPm6oAY4TLx1fR3W6tZL+OcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+04w3u9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+04w3u9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf861f936so12401485e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746011921; x=1746616721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XeqJL94ThFHVPWwTL6Id1PoIB6EHm0lFkz8p7+A1PcI=;
        b=E+04w3u94AfDVehvRgQnaVZhXEjysF4OtMh0i0VFNLZlHvil0oM9tAbuBbIXWQ5yDh
         rHLtCjce6Cr7XDOjUWCQhhv5agbBD9BfQWOC6yn32XKvDWD3qUMgS/uIAvnpNMWLkuCO
         mTz8vKngnhpJqQxBYOFEJSgGVoJLUehqsKzgniZ1g0WqOEeICvS6EGuI0s8CDqR6abJJ
         mEwh3S6KdmmbW6OKmO/Ol8gikVPZ6WcYlHZwvItri401dA8XmYAzy/ZbfRLyieEPmrLQ
         44Cm9s1Ei23pEeOBKmMqQBM5+jdwMQWlGyw8/rOo04uF4XoieR4SRrCZDUIY+xn0ddJo
         q46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746011921; x=1746616721;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeqJL94ThFHVPWwTL6Id1PoIB6EHm0lFkz8p7+A1PcI=;
        b=HdzBpwXUGVGoZ1sJ6KFowJOrjXW/znAWhtd3UGbRQYXKpUzlD/ZAuykMwZtc2YwSaV
         ulXIz//Q0naeHnR84eSA21hCVWuXuoGVF3DoYsrouIb0yCDI/oYOC1OLaJIIZa4yMOjr
         9A1SFojrTbmDbyMSfzVU6Mt+rLTLEHNhEyFsYDR8Fxf2h6UiuwmbML2U8LZQWIUhcggC
         rD6ipsJkFK42mUtgDBz/UXOzyvawct2Li4ovXvtyEFzXUMgPKbbUnJKkeiNLUFqXJGSY
         BMU2gu5t6utzO97X2FcUkwYaFl2Iymrl1DmqbHzErPKhyFJAPjG9t0GRVIp8xRmuBnYy
         G4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3fjwInh++k7PsSRXQuZ8hqoziFD/rmD4IpfcMMkYa+I45kHfPswGJ6WjWtdEYZuLGVD77BNH+8ibEze4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZ/IgRNKup8s+5HsmXEdU4Gsk1gUE21glDDW6MuE8NeuO3AnB
	hcj8Q0xuhvKlTOrdb9AvXe65jDsqSBigvxf1S8HyF/hr+yjWAAygNZK+ayyE6Wi5P/4u+U1AArO
	P
X-Gm-Gg: ASbGncsZrz95jeOldfOg7YBqdrsOgxKrO/qEKw9yg5AikkFXyx+DST1lMmDk3y6LqSo
	DbJziP8fg6/uAGjXqjo2VcdWWdKLtiMNGOCvFA9rdBEMD+ygkWXZiQvrhuwKJ26IEGAzAV27Ygc
	emm0cKsN7anIFSdRY0uu5S0CWUITgJsDY+2eZQG6jBnb1Yob/95dpHIwBRs8EerhWjMtsQBruc7
	lkRiKzpzAvTV/FrsbwLmIavCS5Wao+wuGbH7m6q+EKNo/ViM1yoTADsCf40M+DQKlL5YeU/MBqS
	AWfAdCmVJ3T2cHq8pSl9BZt6NrAu5O0UjHDBXsatY8uJc15t4D7/xaQoGoR+5d1i+4fUNA==
X-Google-Smtp-Source: AGHT+IGMVVqPePXkKCXFynpGT4g2L/ibpr2Dk9WAM/NQR5SfHVcdCwSDcn2Ib1PLbSP35M6anFFqzA==
X-Received: by 2002:a05:600c:4691:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441b2dfbaa0mr5646845e9.9.1746011921207;
        Wed, 30 Apr 2025 04:18:41 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4b1fsm21178325e9.15.2025.04.30.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
Message-ID: <07354130-999d-4f8d-9deb-49b72d8e4577@linaro.org>
Date: Wed, 30 Apr 2025 13:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
 <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
 <e61e17ca-fed7-4712-96fc-a9a2339de1fb@linaro.org>
 <9b6c5f67-0bbc-490f-9982-4e28218aa6eb@oss.qualcomm.com>
 <0e007f7f-d9ff-4b2d-914d-ad62b9983bba@linaro.org>
 <3a29e34c-d286-4673-adac-1fd8627c3eff@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3a29e34c-d286-4673-adac-1fd8627c3eff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 12:48, Konrad Dybcio wrote:
>>>>>> +		/*
>>>>>> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
>>>>>> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
>>>>>> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
>>>>>> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
>>>>>> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
>>>>>> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
>>>>>> +		 */
>>>>>> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;
>>>>>
>>>>> Does this deserve some dt-bindings constants?
>>>>
>>>> No, because these are hardware details/constants. Drivers do not use them.
>>>
>>> I'd argue it makes sense here - it makes more sense to pass meaningfully
>>> named constants to the driver, rather than blobs with a comment
>>
>> Sense of what? You want to make it a binding then answer what does it
>> bind, what part of ABI for driver is here a binding (answer none:
>> because driver does not use it)?
> 
> Sense of the magic numbers that otherwise require a comment.
> 
> dt-bindings don't exclusively contain enums-turned-defines that are

No, they don't.


Best regards,
Krzysztof
