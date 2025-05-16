Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438141FFC77
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392067; cv=none; b=hsrRA+2WT2TbxAWr5uOs356kSF5XCc4o4cpcl5nCqEo72z89YGIZLvKA1F/SZVp7qhZro2Mi1vazEs1Dh/O2EUVTWagnVCbxmB1rcsz9/QmO9SqRzq3q4nUImY5NCBFQcjT3HpgVLUtnow9H5T78c/23l9Pqw+mpfTvehIQCieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392067; c=relaxed/simple;
	bh=JJ8vXiUW0U6U48IJH3VFUazK3FU4pVH1KXQ6O9widAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUwT9ENfV6264haNlP1clTZae4KafKTngFuNuxN5vfkLLlmLWLQqIrCwZ7w1jlP+ABYwsouLLqDU8tHlp8BoROhCtjVcA/9xoA7yyo/gCoKssctx7CzDdnOg2eiCC9Gx0Qc5Hb7QV4EM1A4ka11OYRELcgoyZ6tRYjNXWRrKG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMNggA6k; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMNggA6k"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1f8c85562so1349551f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747392063; x=1747996863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tO92LujsTUu4E4qe0APuNwo29/s1qsBe6W4/ruBxlM=;
        b=bMNggA6kWrViZSLCeyp3vn++mr+WkE48VNY9YOo717rv+4rDTaOangr5VvrfMHWrLR
         Lbgy9Scj0ccgIIgQ8HA9LfDKN/h9eS/Z3Ia3HrvObDZptmQ+3Jbnz0487NByVncArOH6
         st2xATPSpbb8KzsGlvsTr3NQQxvRJ0lCnUWlYhdiVwkMMar2uE+sduvmK5NUP4246cdP
         X1J8yJ2W4Sa5YSX4zeRH9yU1Q4jjxF9dRk9x5Gb5Njlc0/GFoVr2O7ShB42+CTYNwZAu
         cxACFLx7HAtOm2TgQ4g37CMM3IanejXXJH10DamSjYmQaJ1ssfElKrIIRqyMR+5cv4I4
         lq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747392063; x=1747996863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tO92LujsTUu4E4qe0APuNwo29/s1qsBe6W4/ruBxlM=;
        b=HbnxrpCHUtuRbv7dAUtW/eFR71PLc72roouIBrCNq9YBLDuV4pmLs7KB8fhbQf+iKa
         diX65wHXuexxcsxiLKms+ptNfRPWhMRA9ogJ5oxPCEjO9JhKEYf07zCBKKx6PDWksGNP
         5/Wht+AwxrKuqZ+pdhmJo2LdrtZHOUfSdMuPUpdkYdWUQaxLdVT2Yj6UF/ZwZdZIMGIh
         oarePfsxsdb22FSuQUqPixtNxh8y/LrNJqHfeFPbQi9H9IgidCi4DJKRdCZzwkuTJvpE
         2DpfkMso+ufxE534ElWVfY1H5FeOfgofdRZJRILVRB3SBLVLXT4ihS0c17UlYpZq74Fo
         sWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVndd8GWdCrU1CkgWQvVSTeY4pk7krWgO7TT8/D6AUxaPnGivN/4kDeU4BOVcFtJGM0qxWr5BnJgZx//Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EQbZBqltfGBxW45UwvTnTGaXSJnq9OTpuk4KuMg8A/h+J/U4
	CYiMS1Ss9mZyIysdWDGo78MExGf/jHdeaNJNz5caPH3j76cd2iF0VMTHclgYobq4ov8=
X-Gm-Gg: ASbGncsS7B2aIJUgdoVQlO+G8Aw5KR82/BTdqGNOZMSnH1iOi1Rts0CZlfc9P0Iv1AE
	F0v0blJFoepFgo8ak46zhf06yPf8YtzzpaKDQbpEREwV++hAhiSzWawowblAgHRWrctjVawj7DR
	70ryTZodirziD8iDWUfdY+MFdXvHEnmhcE5yu3bAgvKbO6Pge7L7lH1ckSdrRCBYpTL7CHRyV5V
	pPG7J2BC2WVXpExGRET1ZGqoFOXmgaj89LbjyCW1zXPdnvqJHixHMHHuysXOx2psmXBq7D+fX0s
	5jHV+jX2r8J1zQ13yVQ50NMG+p+hFefdaWssIHi52Yr4B6h1Xb9PRwZb8MbSptAH/vNcn/Qz6pc
	dHsrz4mtb32VQ
X-Google-Smtp-Source: AGHT+IF32T5XVdwbwxiiOP6vj4T8RjVPOe8zmd+vWmpBenfaU1R+up+rSQSvT1653B1phIGvMxs8tw==
X-Received: by 2002:a05:6000:3109:b0:3a3:584b:f5ce with SMTP id ffacd0b85a97d-3a35fe67a86mr1636113f8f.23.1747392063533;
        Fri, 16 May 2025 03:41:03 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889a7sm2454163f8f.72.2025.05.16.03.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 03:41:03 -0700 (PDT)
Message-ID: <020576a8-8edb-4d4f-a58e-6cf6e30f6df9@linaro.org>
Date: Fri, 16 May 2025 11:41:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>
References: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
 <wOxjiEBKO2XU-PikPlT8IMpSGOrP4ocgZEIj_zNhLzzBjySkhGQzupjmJAFhUHcnknLKSASwk33LjBI6WrZ9vg==@protonmail.internalid>
 <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
 <4e81a1fe-3ee5-4f5f-b958-13e6cf9138f7@linaro.org>
 <db059233-523d-420b-81a7-73b02beef4d1@quicinc.com>
 <36f02ed8-b440-4760-8d08-b633406ce92a@linaro.org>
 <72b61199-bb70-4965-9ca9-f21966195f60@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <72b61199-bb70-4965-9ca9-f21966195f60@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/05/2025 11:32, Wenmeng Liu wrote:
> 
> 
> On 2025/5/16 18:15, Bryan O'Donoghue wrote:
>> On 16/05/2025 08:34, Wenmeng Liu wrote:
>>>> This should be 689 yes
>>>>
>>>> ---
>>>> bod
>>>
>>> Hi Bryan,Konrad,
>>>
>>> I confirmed that the value is 688 instead of 689. The documentation 
>>> incorrectly listed it as 689. To CC linux-media, I have resent the 
>>> patch:
>>> https://lore.kernel.org/linux-arm-msm/20250516072707.388332-1- 
>>> quic_wenmliu@quicinc.com/
>>
>> Do you mean the documentation in the kernel or the documentation 
>> inside of qcom ?
>>
>> I checked the internal silicon definition, I think Konrad did also.
>>
>> Which documentation do you mean here ?
>>
>> ---
>> bod
> 
> I mean is the ipcat documentation.
> And if configured to 689, the interrupt will fail to request:
> irq：irq: type mismatch, failed to map hwirq-721 for interrupt- 
> controller@17100000!
> 
> According the mobile configuration, this value should be 688.
> 
> Thanks,
> Wenmeng

OK, thank you for clarification.

---
bod
