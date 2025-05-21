Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3FC22FDE8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806768; cv=none; b=Ab1SmrA9c4bKBWI2haHr/df8dpnVd5YsytTp1NykI/sXAuejWptuj2Q3s7Re15KXe2LNfVsiZ6mux1K9n2h5dGEPThLoo3VuQ8SswDNmHgf2hwQ7f9kHJAfYS6qZ4zsl4Anlh++aobF+reggOiWYqwNaxbCLtXQXz0pRTlmgvuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806768; c=relaxed/simple;
	bh=XK36jMGVzHFAZgmjJ27ea0/5+ipW+lWL7+7Z1Xg4B7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WM04eh+oIpHzfKJ4cMiKm0ZDbirHpWr1K4fYlgZhK1pN2dGCwvoM5uFeMqpZFKB1Ppla9WpCsg+I4KXSAw1nMfR9C3AhSEC3P57pevrbljVUyMLw+rAgyYaj5kifWQNKw66URTojQzX9/bFQozBM1eqIj0wD59FwJ1Ur2QdoS9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVI4FQgY; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVI4FQgY"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551ee6831d0so556835e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747806765; x=1748411565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+6EfRxcF6nuSTzFfX95UFC3FA7d4vYOazasa3XUuf4=;
        b=vVI4FQgYbHGS07oqkP+suv1E+Ur4SKl4SO1CHd2ajs0atL4HTpw7WSMFidMKTAnX6u
         1ynFH3xt/CAsBca2Y2JcI8uk1LKt3wZIZ8I1NiZQFSyVgUSo2q4K2r6HquaPurhxRwY8
         oQ1RU+ap6BXe0HOckvQkXkXaMvRHGD9CwF5JjatPBcePdGVVMWZ/Sz3bd9HoMa4FWEY0
         TEdLFq7rptGj+u4j+79cwNvVgXsLlSryvGs0rat5vgtQZPHmUtKGva7XcmJnlcLzpmXs
         JcfZaRtWTpmAG5yu/5fKGqXnpurp7QKinfMv3/WPEDQE8ZXypxVP1fwrzC8AaWIn0aAQ
         qAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747806765; x=1748411565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+6EfRxcF6nuSTzFfX95UFC3FA7d4vYOazasa3XUuf4=;
        b=rHE6F8Vrz3XRACV66Gx35/igd8D0W+8K5zwLeBgoU0hCau5GQoCfBacLAoynApHzrY
         ngZ2eNIIWcqbyYdz1K1m81ZgpWN5uDSCBsSj1wx3s3Vfe4D6b/V8Vh64pvgceGGXjnMn
         +mmmklr/xHK6Sq+TMzIb+wS8RdaTdgdj8EvSKnmaHAbwhhVBgVtadW2GPLOC7339xdQF
         FguhuEN6zpQApu+phx/hP/GpvND6Fpcu0DF/F21RGMwqyN3lURyDrHxWMcrP6LN9HiDG
         xm7M97RRi2fZWdOog943w1uPUUeru975ItAAhxsEe21WEpoHb8THU/jkYMP0xaDbYPmU
         TL0w==
X-Forwarded-Encrypted: i=1; AJvYcCXJKktXdqFRtnu4t/NBOqJiCRkdSVXkppBN4YOO/Cy7l7/hBKLuWUAEyBvtbz9iEV2iEuwLaIJBjNTgYGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymzw8v+a0QFHNW1RIvVEIkM+bJTrC4k5eTi/M91A9UpHTHdvwu
	Qy/85W8Sc7eoKCgcU81lYpiJbLxeojY7dXfQqM1sX7y6OTm79LpZJyftjGnnIkkAjq0=
X-Gm-Gg: ASbGnctfDHuhi+95U/xjvRVVuWrdC7eOYxmXm6shme3yDWNzOlF9wfBx5Yzm/EnxEMR
	aeKNgQlmz8CI8INsl2/o+mCwICCOK+o2MQL/WlqOZXyrPJRb5GSD++KSYkCZVy/y8E4pGsZaVUt
	5LZ5KioCXIa9hinWPV22rbcpLKjO1MZEqtCehWrsAcMXPVMyeCrHo6OEXx3djveIpc/qDbX/1Hx
	AMvRTvdvPTRXLj+HigW8RAFrwOVLcngjCZHJmafh1No494GPHoS1Y3novNYA6PcQbciIVtke/Sb
	K7AmjpQVqv7UAdhWajS/+FPDSBpnSt5hopYdU7K/0yCpRgDLrXqZWLM6qvwOGELg0TIS0wAoPJo
	lxtEb1CdNOMiZA5IuE+b+Y9YrhMqqWA==
X-Google-Smtp-Source: AGHT+IFfkKSuF3lu5EAykJJmWP101sRAftrK7GAUTkyq+we+sis+bJZidTWqi/zTuN0t5a5RTdKujA==
X-Received: by 2002:a05:6512:1382:b0:54f:bdfe:ece1 with SMTP id 2adb3069b0e04-550e7248054mr2031565e87.16.1747806764709;
        Tue, 20 May 2025 22:52:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55206407368sm246913e87.212.2025.05.20.22.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 22:52:44 -0700 (PDT)
Message-ID: <76052af9-96c2-46d6-85c6-65998c389554@linaro.org>
Date: Wed, 21 May 2025 08:52:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, bryan.odonoghue@linaro.org, todor.too@gmail.com,
 rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng.

On 5/21/25 04:32, Wenmeng Liu wrote:
> 
> 
> On 2025/5/20 20:19, Vladimir Zapolskiy wrote:
>> Hello Wenmeng,
>>
>> On 5/20/25 11:56, Wenmeng Liu wrote:
>>> This change enables camera driver for QCS615 ADP AIR board.
>>
>> what is the rationale of enabling CAMSS on the board without giving any
>> description of any sensors connected to the SoC?
>>
> 
> Hi Vladimir,
> 
> We can perform validation through the CSID TPG(Test Pattern Generator),
> so I enabled CAMSS.
> 

Since this is just a test of CAMSS without any sensors/CSIPHY, then

1. camss-csiphy-3ph-1-0.c changes from the series have never been tested
    and added as dead code, it shall be removed from the series,
2. adding voltage regulators to the board dts is void and shall be removed.

Not to substitute but in addition to the above it's still doubtful, if just
a hardware/driver test configuration deserves to be added into the dts.

--
Best wishes,
Vladimir
