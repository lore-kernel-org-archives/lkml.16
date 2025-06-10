Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307A267AED
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589368; cv=none; b=HnFL9MAMShSsADARcXrFdsTGmOLESfHbR6IA7qsI66D0fOfS+Rwe6BjqVD9fhHbZ5YlBrEregRI5FCMdbiaCF6dMw/ykd3C41XBi8+2hkRClJCvCXs7YEKbKfjJvNMgKY6kbhOcJUN+LVomNhgvgMkoK3FDf40BjSpTrpJDF0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589368; c=relaxed/simple;
	bh=qfhSjwvyRn6KR8oOKBXXu50Bff40BG2bB9yxr/8s93M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUt1jAYsTgaK0H7Jp/YY2K3w1qPYfMy0AME1+vTEsAwZUrstJyKHiwPqvbWvJ8buJIaJx8Ja6ya4Z3/sQtM9UQSyInJMCmESNTakRnKNaHrJzwHUcarquXzSnVb4zk0NQUuX3nOljXISkWPOxt2ChKHM5T2axTZpq9hWBdccr9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfzyURAa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfzyURAa"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55329e42551so726381e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749589364; x=1750194164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEX5+m0SmtzPkAXHZnRUD0tql0bHqOfER1OA5um3tgo=;
        b=nfzyURAa3ozGMebl/W0JwT6lMFFWqD5gF6E5cooeyI2qhKTh2MBmE8fR/HHIDB5eKZ
         ZK17ByhiKIajULlZTtMXzkZJ9MgHRhcPvemmkvkdw5MQRdepNU2GdfWfk/jV3vzEofrJ
         UXEOdczJsBTn1Xtd2KuXoPcuhxMXykORPcMDRLwTaaeMr9r89GyeespKWKjZR4wAetYs
         vHd1AVb8uF+cql5Q5lLLCpuzrk1RsJuRr+nqUAUXk1l821OHC76r1e8Cozf+Of5kedeP
         2KLIKuq8EytLmLvaJxnsGehEl2EQq/uzqX7PDokMQoh3vL0vHkvv3eMTOzXO+Dwh1OO0
         irMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749589364; x=1750194164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEX5+m0SmtzPkAXHZnRUD0tql0bHqOfER1OA5um3tgo=;
        b=YmRFNBdP+dXVdpuOofwPd4jEDygTaH//HcU+Zpuq9mUvc0+yjzE31KVDYLY/A0JPLA
         wkG96tb8BET5BxVMLyNCt34Aia2MKr+WIQ/Gks6qciUmxjniFjYPxROGe7xaRXHGZuCt
         IUS6Ehldw+f7TxNcHzUgIjbOwcXG1ZH+AU1KdtCJNt4QC81mnOQoQcUtN0I/jUWO5we3
         HyriY+YecNXmYSVbo1cht1nlkkvIpeNz7T5gnCm0SSpaY9/8y3HWG+U0BESgQfGCvbLe
         /EjCaQLvyN6rNhPaiGaCHLPdH0/qQtilVBu1QE/qhWGxgZpUv8h0e7WbUoNC47uBQyKS
         kZNA==
X-Forwarded-Encrypted: i=1; AJvYcCXtTcnbb+GuPpmgEPgApAJxpLp26T349xGvGv5fcCV17KZzXjLqTAfQxPMf8otPiLFw+Ut3MxhhIvBlEUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD1PZSpwK56tHX7IJQ64WnBbwxQhmuYWuY0NaeFSaj42AOveth
	aLWPoGF7oWCm3ayDqrW3UtgwuALhAPlhZdxWYzlEZ/Vl9O68ag1TnjN+ZvU4xQlTsNI=
X-Gm-Gg: ASbGnctgI9jEdb1dS6v6qNZlRaLWD/IW78L3fd5utHleeqvauwBT8KCG7y6bKnICi2I
	T1QfB+2xRimkdAFZc/SfuC586rLm7ThpQOATgYBsB9uz2ovBIF3lr3RkHvjFX4F8oxq/Ifu78NZ
	f8nsGWaYSKpPO5mV0mf7p/BQTQZuuPKbQbNASCjQnkYBBgRi31we+Wx/Dk/O2dpJuRHc21fHzAT
	E0VZ86bX3LnHcYBA6ZL2aJh/xt8SKUugPFL9hRy83+GXHmcj95HkWqUd4F9WSivOSAyo3VdRTk8
	FcD+hmGZjGp8hT0EKy9lcKLn5BOqCGbhsRB73OuNCtQbp9xr6TQ9BbJNWrJeJmLy1GdWXlX2ZVE
	1zY54MTojV7Q7AtEB/FuteaQW4p3eriM7SUPCNyZd
X-Google-Smtp-Source: AGHT+IFEFIJWrRfj6+Pu7NhQKIOTBe12JY90TCUN9nzhGZ8nBRQCkhDsR7KECb1Mi5qTpg+TryH5fQ==
X-Received: by 2002:a05:6512:1509:10b0:553:3a0a:188d with SMTP id 2adb3069b0e04-5539c106d7bmr77460e87.1.1749589364478;
        Tue, 10 Jun 2025 14:02:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7b37sm1686862e87.67.2025.06.10.14.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:02:44 -0700 (PDT)
Message-ID: <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
Date: Wed, 11 Jun 2025 00:02:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 22:02, Bryan O'Donoghue wrote:
> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>
>>> List feedback from DT people is isp@ is the correct prefix.
>>>
>>
>> My bad, but I don't understand this comment, it seems irrelevant...
>>
>> The expressed concern is about the novel label name.
> 
> I mean to say the feedback from Krzysztof was that we should use isp@
> not camss@ and I agree.
> 

Let me repeat it thrice, it's okay...

I don't object against the properly selected device tree node name "isp",
here I object against a never used and very questionable label name "isp".

Please feel free to ask more questions, if you still find it confusing.

Again, I may missed a discussion about the need to get and use a novel
label name, then please share a link to it, it'll be very much appreciated.

--
Best wishes,
Vladimir
