Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFE1DE8A0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745790755; cv=none; b=M889cKgCUptqU/Ivsi/MWpRkT7r93zBb4tt8KGs+gZHwyxHTd80VGFGP+HSb+F5JI+t+YJw7aXrCIXY8V35WmQEyVb7K/BvWWOmop91dpIq0HDLleumW9UBl3rsPAKwkPPdDHe0SlE0MrbEcLra03oifGcjOFCSbBQf3vTzScu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745790755; c=relaxed/simple;
	bh=NLCEKxqfnuKPb5qhY6v1wHEJ3q7ORDM42IQIZbtYrhM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MSlaGV+aM4XTXnvUgvK9wb0HJW5j/6dDyLJbAJtw3SGrt0/t7823VTOOqN9lIcRBF/TESxCcbxtTt7g73NbHUAs7yp4y8b9k5Y80fpABBwCpM/Wln/vHsffzpHbqET6KbS7K/Educrok5hyRRNITohYZHQ4eKNHIRV11Bkj5zng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzxNj1Po; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzxNj1Po"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf257158fso23577335e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745790751; x=1746395551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zP6Vr5wl96BWIJPHe0GcdZz6u57VK+LDg/4JZWIexRo=;
        b=TzxNj1Pojr7RTolJ10dsd6eT9YAdZyQxrutENJJtTaFcL6dnXfl2VfA4flUmLn9Y6O
         IA2VCJesCJZ0o+FNl+wc9PuCLi34SD9SM9htndynSGPDlZ1Y3HT/euRXNKqpBpRBtb2T
         vwvRk/PjAin6KorHfoc7H/nqoCt8FNBe4kkusgjQzSXLTftuBp5i+Ovj9oJwkKGKExl/
         GZ7B8CSBSSKzmf/0iRmqlodqsmBl2yjn+kpE98m5NsQr/93xFj2je091lhtW7kPQJAHO
         V1gpn5Udyuij0schJhvNotXZCFyUcr2MLZHg5T+upNOtdCd1MnrkQebwgFNRKF2RH/tC
         TEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745790751; x=1746395551;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zP6Vr5wl96BWIJPHe0GcdZz6u57VK+LDg/4JZWIexRo=;
        b=fJTcXnq5FQUiP0PgPPqqqzKM0Ja3DPtKORiCbMC5DS4YOB0hX82fYzANFNL+7v8P6I
         YwShJwG2210DWCaYA5k5YlgM086GCsbETs6FHlJW8o0azgDd3ddYx2rrgKyT8xaAVnuS
         yOOBWem+2WCrxjNyL/ltYWuvptTa6J0grCE9Bb9ww7pn78Fy+3NOCw3VooQnN1i8OOrf
         0yYbbLvKIl1yJGdq1MpLGqmy/yRGSB9Jo4cGTsxD0Z5MiDo+IWgPYHANQBNL1nQgGJgt
         QrY8FIXdW1DCkiqj0g8/gwh4eF0j143KOK/yCB/+mnVopHAAnuP/FsuYa1QED/jpmvtf
         Uh5A==
X-Forwarded-Encrypted: i=1; AJvYcCXETg84rMFGQuUDrPS7QTSQllje/Kf9LmkoRTSVVHNDOESl07USfzB+hCEqwpnSoLT8B+cz4i1FvXxwzNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVnG4fD/++b9nDoLc2mKX/WgbE3Q176RwZDj++0ivB7zFMaZ2
	MrWZLuSkmXY6k6t63PAOM798pBULRlpj2iNnJvf+PkRGLDy6jaTIhlrGm1AirYmoee28yIQHlYD
	/L2U=
X-Gm-Gg: ASbGncsIVP4+M4TzPExRnFxhikALyUWf5HwLn8eycCqDT0QxOoqzIS0JrKV9xlicDUQ
	eOaPqAcrpa7i1ohhmNPSPQaiQlZjI+pvqFXUjvTvUaJDzs/UjQ8HsNz9n5dMZH67WbcEi1ov3+y
	dO6QZIi8x66HxWXOlck3BTkuFm6+vzouCg8fjX2+xgHxTaS3Jp8H/IlWFvc+6Hb4sbWphrZvvfl
	qskrgqFh/g4yoD+W+wlcoa3Gr2NgXh4bZYBtY+jf93SunV5otQ535cOKKF5CfQ4QmQEFiES5s3w
	gXFwkhVka0w3UNnK2WUaqKN4R1S9UKVnA3jkUxqlU4+7E7jchGM1doBnjKxQ1yyyZmTW9Vt7pTm
	gTSmDFmmZqWFRh71y
X-Google-Smtp-Source: AGHT+IF9NtTwXVCry4ECIh7ifDI7xSXFecW32O3JGgQylC/n1HXWQ9lefOctYA70jHd9LbL7GdOPxg==
X-Received: by 2002:a05:600c:1d8d:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-440ab848458mr54631495e9.23.1745790751367;
        Sun, 27 Apr 2025 14:52:31 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a1544sm138759515e9.11.2025.04.27.14.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 14:52:30 -0700 (PDT)
Message-ID: <fcf5eb3c-a2c4-41ec-8c6b-d8aee5a9f906@linaro.org>
Date: Sun, 27 Apr 2025 22:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
 <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
 <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
 <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Content-Language: en-US
In-Reply-To: <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/04/2025 13:20, Bryan O'Donoghue wrote:
> On 24/04/2025 11:28, Vikash Garodia wrote:
>>
>> On 4/24/2025 2:51 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
>>>> Add the IRIS video-codec node on QCS8300.
>>>
>>> Nit: you can not "add support for the video node". You can either add
>>> video node or add support for video en/decoding.
>> Makes sense. Will wait for any other comments, before resending.
>>
>> Regards,
>> Vikash
>>>
>>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++ 
>>>> ++++++++++++
>>>>   1 file changed, 71 insertions(+)
>>>>
>>>
> 
> Unless you get another comment, there's no need to resend.
> 
> I can fix the commit log for you on the way in.
> 
> ---
> bod

Oops this is isn't one I can fix for you - dtsi.

---
bod
