Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1BF270546
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832847; cv=none; b=ak3/RdZimYYJeycruG5VWicduJP824h+kHNvuQpzRMFhZLcsr33/xvj83Jb0zS7bpVJf/DMJ4VESytOKVzAIbidlfw4FarjzvPmIHT2Cyy7OAQ8f9X5pms9Yqg0tb08JXbS/qEBeTGycEIP5nbxKwOpedWvqnOU+nEmPSlpiUhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832847; c=relaxed/simple;
	bh=/p8hi4Fb9JbhcU9eXGccjakCQbbweGLDyTOE826eGz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRR2Z7OcqnrjPuZLU01IjA+JBuoap8PnLfZDeMVKrk5DtyRH48HHuhoRYlOtCMn0mwmqW6bxGqQhESsq1WtMYnWVtjNtBbU/LuIH7BSBAPorZO/Wa+ppWEvgtucCM18GBRcFIY5gCG7Hwmhn57VEHNWQSq1SI+Bd35/RL2ylvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8uP9/0P; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8uP9/0P"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a3681aedf8so3607430f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747832843; x=1748437643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RpkuJlQUblTuXdXBYUHLsMDpcSWTTsmgm+ZR7X9N/YY=;
        b=n8uP9/0PXmH07oBxwjujbqu3lrb93tHq14FgXaRA5qH7C+Lm2XflNrUkq+MLLm2Mbi
         PrxJUPc7zbxgA89n8m6XgjDl+eXiHojeItuP9tcZGu3YhKT+wncTtOuXt0VkRRMIHfM7
         NHsYLbGhblbwZNicF5hLTcD6JAMlyncCpQ+u+GUd2VfYlaXvvBTp0yVZibkfHFFc1Xy4
         fKOvGLkrBydex7LbvAiJBe2f8gQzq9dOF/kTWjYCATzcLASHaDulxhDcLG1mLDehZoM7
         iyPuP3qwP/KNQvmg3GGHAn12If5lDYweZGvkkLAtyaWO1iBTWT2VO+kOcFBGxy4hwsLJ
         wQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832843; x=1748437643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpkuJlQUblTuXdXBYUHLsMDpcSWTTsmgm+ZR7X9N/YY=;
        b=Y3vTy8Q0WVw23yooKnuAeaqO691cUPsKEqbibFuhTo39UKvBKB+nXIvzaCTSNdORgO
         5NjN1DOzCF9mpZ/h849r+D6/IV5vLjG1h1zkmi5stU5Bd8A49Fe6XKIVatkj+a5XNGpB
         9GZ8vtCmZc2EumLPp6nx/LbUOyh7jwvnCLpenloU7Ch/bMAHcoOCZm8FIBXaHqYZYWuA
         SyxDPS8dPySlbZbmf/8w8bKLRe/gc6cBkgqbt2thpIhEDQ1vxqVpDXQVZrsbjAkQ2dbz
         MdA6fL67GpqciEdWdLoU7EIaGnFoOsYXQ/2QK6sfIACqaQ3UjhrIQiu3LGRx9biwMZOC
         UzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsRQgM9GrrJOnLtWM7FOhKCankQ7V6EKV5uec9dP6aJ76GRZO1XNVp8O7IQjbPPJDJIVPswFMy5LzOhRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIaevzJ9R44nW53w3WPJ4abzgAyTCbAHXoHQSUkrD922hVbWmS
	7wd+4MmHtXbwPiNbdjM0TCvHOW4PETZPBGAIWYfIkNXvb13OlptwYR//Lf3VjJ8vE94=
X-Gm-Gg: ASbGnctXkjNndkHgpK6r/POfNcSaveJmuCmbeW/LO5CcAXYOBGBAWg4EreGb2KkYMOP
	8Qv5PgryScoF971p56b/MsTL0q3trEgxx1uaGiVRGc28Fl5L8gGRwp1wePBz4lmTbypM0ghxrWL
	6FY3afA1FPubthM5bh2Yg+qn3yrO9LzsVUdWg7dJZHGb8Uj/wJWl5XmzT8Z4nOQ6ItKMDqYOvuJ
	FfO8TH9ugX0SGTsw5zkboLHiu9s7GZAWgq8MPdxr4/4/jjnGuggmIAhzw8HXQLeMPYKDkGDeqNY
	ihZ2y1niYi/J79V1GB2srNnCALltEsEO6pD1Ci8zozRNrnfJHgcr1LItcKmv4Km+leXpUx8kIB8
	uLojDKRopQh6eVOT8
X-Google-Smtp-Source: AGHT+IE+t/PYCXMw3FrDdML6YsWV5MqKEMrz7cLzul08Pv1j9GQdjSaGfDFVw2hwDw8YQywVgAFYbw==
X-Received: by 2002:a5d:5f56:0:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a365959288mr13967995f8f.36.1747832843294;
        Wed, 21 May 2025 06:07:23 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1basm20036403f8f.15.2025.05.21.06.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:07:22 -0700 (PDT)
Message-ID: <b2cf41af-756d-4e78-8df0-0350198d357d@linaro.org>
Date: Wed, 21 May 2025 14:07:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, todor.too@gmail.com, rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:56, Wenmeng Liu wrote:
> This change enables camera driver for QCS615 ADP AIR board.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "ok";
> +};
> +
>   &gcc {
>   	clocks = <&rpmhcc RPMH_CXO_CLK>,
>   		 <&rpmhcc RPMH_CXO_CLK_A>,
> 

I think there's some confusion.

I'm willing to accept CSID and VFE changes with the minimum proof of TPG 
driving it.

But - CSIPHY in CAMSS which is only proven by TPG is obviously not a 
proof and again I agree with the consensus here - there's little value 
to an end-user in just having the TPG for a camera.

No sensor:
CAMSS::CSID
CAMSS::VFE

Just about acceptable

No sensor:
CAMSS::CSIPHY
DTS::CAMSS enable

Is too much of an ask.

Just publish your sensor code ! We need more sensor enablement upstream 
anyway.

---
bod
