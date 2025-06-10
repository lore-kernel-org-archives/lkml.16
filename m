Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C62741D3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589992; cv=none; b=GY/iUrYR01w2WeKKARqVycX9GsXKItHXtLCutwaIBfr1H4UlEGWYDlvd7T73XkNpolNEMccrWTZX0FNspe37Az4wUhsNg2cNBmPi6unsAtidh5dk//HRNPqALoD2zg9xAEaiY2/KNXIYLTkpuahv4Z9bku3wd1Wq/wmi8lX73zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589992; c=relaxed/simple;
	bh=LKWM/AKNK8qV65zQK7Jy6+2LGnIoiSxOh8JQeCjGVoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Okb1qfxXfRK+I5yirtqOBBu2kdF7GUiVZJ8Ae1DxhWsumXXNjGYwa0G4aUl3yLJIRpV0vluaIaG6Btn0FB/09iv6wDr0jgZ+atZnUnf1IFOrJXb9IWoGMouQHh9eMOqiJquNemvTxQ+eL2Q5nfHDlGtT7E3wDeV6FhHLizAx84A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwXFrcy4; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwXFrcy4"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32a6c473e28so4724761fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749589989; x=1750194789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Jm3QNJuhpnWPil7MXWGSQJymiOAg47jty10YrAXHYA=;
        b=KwXFrcy460yCn7r6faVdnqJ6U2Ht5DCc9sZMY/Xui2HztaOriVCYRN6MG0NRyVpt4N
         Z6j8IP16+UQXuLlWPk0CuzUxfcQWlmi2qxfp30YBIyWb5rS0McZ1Yz7uWMxz+7EPLQH/
         OVUpo6DfgMehivtbVBhZmkUWGrR6q3usOyHZel6VoXoP19rcybLalrk/UVb+KOB4vJhm
         FnSWilA4xgqLuKTXcDlwTsXUzbiwrLoQH+wRZvll5lT8WUj2xo9B1mSNKeX4wXl3J3xS
         EBgIubWNU+ytE7DQKWYmUegbQ0lsOp6D4Slbgx7T3PvhCbwXE1/TrmI9J64CqkT6hyV5
         JsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749589989; x=1750194789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Jm3QNJuhpnWPil7MXWGSQJymiOAg47jty10YrAXHYA=;
        b=GPPQ9RlZN8yCRV/kf4tC6hiQNU0Kg+TwnXcahmWs0Z53WscHQ/J3uAjEqpbIQ9sUAq
         vy3h8V4vhuboKrpiS+00P8hiHebZ6JCqXcijR6/bVzEmIbqW+h2rrajVi4/e15WI4taW
         LF/ILntl2C7QP2Zjus6VmT5D//+vTijKy9VUEEn8j4nAzG0/ZZ9nSpMGdLYBb7mVrT1L
         SVfUqwRPfVyec/Ml30SvNhdvjCEBMA52cvrhM7z4E+/y5zFN4lwIetrQvxMijUKD+rj5
         CzeHXAjyam12vOd3QWYeWMGmUXYgv7GGmKL0OjTvVSbSX6orjcDdWk1/xZ6QI7KYgY7K
         9Sqw==
X-Forwarded-Encrypted: i=1; AJvYcCWxS6U46c1VfEtQApKdSrywg/WTGHVUwmSE+eCB7tBIRj62ZlAzTa9gW1g8dtxo+aeoomBT42bVXeHQbUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAPCLnASsKhaVcdWOuSbQS7A9za0kmavuzitlODsMtbTP8IcHC
	q85UPnzE3eusVVCUW21UXURJsYJb3zOrqtyraHFMhjx+paZVrBn6H/dZJsGJxHP5N3STFZR8WBA
	OYMkH
X-Gm-Gg: ASbGncskzS66ujGySLLiQZtXCNW9N/9Y3u+9n3H/kZ2tZuAoVmu9T6gOy0ZWYakIU6c
	mXYIBCLVNeMQ9sPzflBXweLoTdO2s6EzuTXGkX9vdOR1R9C3LmRIXamjHG2vajltzXalCN0u16+
	/lqJnTE7uqzxzrqx+ZjykIcdotsGRgkWtZkwKSVlptMR+8G3/2gJawnsCKcOmlESi5KMFgrh2wW
	lJocEnFqnJ2iZLx6rgS9x7anWVFikopzIKbIK5LoFqWiMa00mmWTQFuMHHnhD1GJzcXtn1I+jen
	xI8TsOIFiCCyBbuGiV8NYQ3Z09BSveab3V/bR6A11Ytr1LIb0qpg5Hf2gPaILCV79Rxftc4dJnG
	4BAELBUDz5/XeJQkZEk2DWN0z+6qYULqaf0KVSNsI
X-Google-Smtp-Source: AGHT+IETS+TB0TrvfrEPPA2p4kx9c0fT3yVUwc0NfXrGV2E7vpHmY4Len4elBMuw0mxhWpUCsDohWQ==
X-Received: by 2002:a05:6512:3daa:b0:54f:c51b:d828 with SMTP id 2adb3069b0e04-5539c0c55b3mr101719e87.4.1749589988651;
        Tue, 10 Jun 2025 14:13:08 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a9d2sm1710622e87.186.2025.06.10.14.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:13:08 -0700 (PDT)
Message-ID: <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Date: Wed, 11 Jun 2025 00:13:07 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad.

On 6/11/25 00:04, Konrad Dybcio wrote:
> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>
>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>
>>>>
>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>
>>>> The expressed concern is about the novel label name.
>>>
>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>> not camss@ and I agree.
>>>
>>
>> Let me repeat it thrice, it's okay...
>>
>> I don't object against the properly selected device tree node name "isp",
>> here I object against a never used and very questionable label name "isp".
>>
>> Please feel free to ask more questions, if you still find it confusing.
>>
>> Again, I may missed a discussion about the need to get and use a novel
>> label name, then please share a link to it, it'll be very much appreciated.
> 
> To hopefully help out:
> 
> label: node-name@unit-address {
> 	property = value;
> };
> 

Thank you, here is a link to the wanted section of the dt specification
for Bryan's comprehension:

* https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter6-source-language.rst.

If for whatever reason a proposed "isp" label is preferred, then
since a label rename is not an ABI change, it would make sense to
do a massive change of renaming all camss labels. Otherwise there will
be an outstanding incorrespondence/confusion of the label names in
board .dts files, and that's bad.

--
Best wishes,
Vladimir
