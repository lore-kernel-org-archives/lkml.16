Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7846D1EB5F0
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746062107; cv=none; b=FIrV8tSfYz/M7LtQSm+AUxkI2iiMCaWSvFkqug+Baz4QepKRE+Y5xGMDRbRY1ssogmLtn55249KL3BZY/c+2Kr5LPniIDuuvWVFBhAjKOWfi5OF2U3nmZPkKmYBdyuZOugTMJc/EGpA3viW5PXW/T3oqf0ZdfzKAdLkko1iEJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746062107; c=relaxed/simple;
	bh=ywSIwL4X4PiO46fJeYKVtqD1FlF4P6XlRIo807NL+LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWIoV00gOtITC9JewWtgW6Rpxh2bHBhGI2+kZ/p1EtfwfqKU9IO6Is+JIKE/0CdJuQYEoaIZWLpWP2KNdPS4ucDYczVTCiiLMlHxQe4AQRsRH7IMNY6sDil+RZRtM+DEJeZ5JWh8PLkHx3FNaDlCyKtlbCmoEbG5NcaIUqF4PV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U06sw7QC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U06sw7QC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a064a3e143so159088f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746062104; x=1746666904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p565K2Tscj5dN7OaQ3H/wX4KTJvoaNhcwUqyXzV+hJo=;
        b=U06sw7QCq4BuHGXotQldc3KzZk60XA49qndNNF9h5TYwG00/yh6803Nt/kqfGO0cp+
         xxYTmpmVkSdMt1zRCWGCYCSKCcGIuZEUb38AOrNZUxqASip1CHOfpfd1PPatxxT8pj07
         8ffesOmbryUp8CXt3tMTyzxPxkXAXDjKAvrw04DNut1Ud5gBs+RkJdRYx6a2oooWMKHQ
         tTeBxaEAJHOCUcTIO3TMcsKkQ1CZ4zbgEsYQQt2tWpp4Wqx2n0ZtO4TC6JgQE4tHfkMd
         G3OW4pXHmSk/UtSInzjpVo5ClmJqiV+zsO5PibvQWvjmGLF5osAaQJ5LC+Ak04NV+KYV
         udBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746062104; x=1746666904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p565K2Tscj5dN7OaQ3H/wX4KTJvoaNhcwUqyXzV+hJo=;
        b=m+u/I55SpFMRhhN7NEJySjKZH0jWKmHNKnDI93LB2rRTQ6/EPU/DTU5w7r3eC8oz1C
         KW9O9g0TVtliXI94Vd43j1110xwZc0IXBeqZT9cGf1kWKnzDsG5Dz74tyvuYlaJXSTUj
         pbU9mHdOT18o+AowwSAwRah75Ikx9NnGE3Fa0LXGYlU5b512+BvnsnviPtdJnslt8c9O
         4AATXT/SgJPDD1q74OOIleaO7//SUJ6nxa0vYku+v1hO/Trvc0myFx4b/u0f58g4f/pM
         AzC0tdqeN1aqSJx/28vZ4qkUf4lmu+3yoQUAKIoDhFSYgcxEbw1FJs9AO/B8FwuAiFkj
         mvHg==
X-Forwarded-Encrypted: i=1; AJvYcCVMMQGEfI+vbTxv/H6eC9wo2NWDWSVK/PHXsQXJQjPk3KLl+/a4m0vHvwttv4ebq3HdO2TMAPYvUxRtYOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMETq2j6hTqXiFH/Q2Db4Mvan7Y4hqHhThijec3gIF8WeATeKY
	bVas7BnPAUE73eBBFO4MclKKJMUhRKCDfq8WBXb6ci+4eDI9ukDXU9YpKptxmBw=
X-Gm-Gg: ASbGncu0xX3yZr9q+ttH5WrcNNjkaNkZjQhkUxp1U3XM2wIH4Ud1msHJG3MruYN7Nvu
	+30lF77Vjvdb9OForrIQW34lOpQqRSgWAQdWtNsw2Je2U3Dc5EpKRmVyaaAS0KUmq/MYA16GPx2
	G3mZRo9x5LEb5rfeu8hZWojggUetmoFsoCvnsFbvzDikbz5zIVoc0xztCmsMpE2A2KYAQ1uFc2X
	KLDrG0pOKbQOY1Yts1TFIuUPaex2WK8RwlLJETNCFtO3oaky4G57SuXloKnbyhJspworLUxSGYv
	mGa3KsKo9S8bNdNy6ukEJKqb+4y+1GIGF4r2smEID2XEEZjFeWbww33MCSoWq9vQ6OEtiqdMPLC
	HQUh7+w==
X-Google-Smtp-Source: AGHT+IGw0DQYAnAOxEpiixNvXozVZ/EZXnSgb2BFqQ2gm4zWs385rrcA0j76FBVCrJDetKCzw7puaw==
X-Received: by 2002:a05:6000:1ac6:b0:390:f738:246b with SMTP id ffacd0b85a97d-3a09404c7ddmr351517f8f.15.1746062103842;
        Wed, 30 Apr 2025 18:15:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ccb8e1sm18588910f8f.59.2025.04.30.18.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 18:15:02 -0700 (PDT)
Message-ID: <4e81a1fe-3ee5-4f5f-b958-13e6cf9138f7@linaro.org>
Date: Thu, 1 May 2025 02:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add support for camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>
References: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
 <wOxjiEBKO2XU-PikPlT8IMpSGOrP4ocgZEIj_zNhLzzBjySkhGQzupjmJAFhUHcnknLKSASwk33LjBI6WrZ9vg==@protonmail.internalid>
 <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 12:11, Konrad Dybcio wrote:
> On 4/15/25 9:38 AM, Wenmeng Liu wrote:
>> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
>> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
>>
>> SM8550 provides
>> - 3 x VFE, 3 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 8 x CSI PHY
>>
>> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
> 
> [...]
> 
>> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
> 
> It *may* be 689 instead but I'm not 100% sure
> 
> Otherwise the numbers look good
> 
> Bryan, Vlad, please also take a look
> 
> Konrad
> 

+				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
This should be 689 yes

---
bod
