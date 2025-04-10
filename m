Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A25528F936
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310685; cv=none; b=Vywh4AaFHrQL7k2lDSu1PZk0SvDuLoHsN8dwCxoiBKs4tMe0xKLgm+4+OfFtYyxUqI0mZwo7edKi8zrSqtsOS9E4rRvE0VvotO7/tCeEEAnegkyYhgDvcQNpM9hWZlVLzXPtkUZZBDvtyPdCe9kXzZtoZDsriDlciE3cVCHYLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310685; c=relaxed/simple;
	bh=KpyRu/5uzXa1GVCDyLIp/yfkb+u4/vjS1H4M3fliUd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GqSkQ3gZDU5HpsC0mXcZ43sRkpo4SGvE2GZuV0uFKxQFue0BnbVkdoceuPKxix6xc7fV7OtBuDwifyiXsl4OeBjFYQa29c6DRN/dMI/KgVv2CiNaAkokPEB2UyI1nzdSFcgN2CfGHSDbcazfPa+5BtNB7O7dAve0ls5lACCmz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=M0hUkb8I; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="M0hUkb8I"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2c76a1b574cso393006fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744310683; x=1744915483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRVVDW9J76JqylGutlcZ0/5veoOuiZW2PZ5wT20D9wQ=;
        b=M0hUkb8IJRGC1tx8fNtgkI27W1Ejyopc/hu6Ec/5iKjMRr2xpYJVkFm4JgVzxuBR9b
         Kt9EKhsBnkxF03g7yPXnyTWcYpU2DSqhDi9e/twmFrg0XDemYTAwhfcq/d7Ey2yRXNzd
         wCkfQeK3Ey4TSvmx8ys258yz2ygasHw5bu24c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744310683; x=1744915483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRVVDW9J76JqylGutlcZ0/5veoOuiZW2PZ5wT20D9wQ=;
        b=Se6aETl+oOrYrq0nan0pFkaNVU0d1+JfTain47f93E5Gue7HysRB2ctCxCs7Y5hzJN
         kDdx7V0Zyu1eiCJA3LjBeyJ7jmjaOLwM/mUyBjkraLlUuwRo8U0n85MRjYEG3EQE0zV4
         tmZLlstibi8tPb1K8QRItvRuSPfiEJUXJ8nFCadgdhoyOtYC5INUO4UWAZGWoBviBrpi
         n/gqlqWwYxiNCP7+vDMFUAyyI6Xszbh8SJLjQjrXCsn5ZR2wELKYgDXnfSqcle0ZegkA
         nsWQeQe/dMR1FvvyAQ+3NWF1DHB6dZWQkneOhDcUUHBRzz/doDUh3+NJehl6fVGabJHI
         2EwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjqurdqmulS0D2QUkB3wgZletmDuZYGNTr72VKImwaaaNu0oZ/QNF6ISUBpDVP+ffsXUZkJ74a0N5zZPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+bcmM88G9UfZhKjYUJFcn1O52Odvbt87wnTOJrubhldWd7ofa
	wEvOx+lFoQQe3ZHv98HJpBxBSYsyL7qWUyDsfO8wVlYQNMy126+P9PpzugjBzg==
X-Gm-Gg: ASbGncvS7AcraedNGV2LHu/xaZXnSg0nERACiO9Z6LdCZaAFFmXEItaiB9SWiIKY0bj
	ymXtpA847LAYfuw1ziI++lQpbFL5hN1p6e7flzf8Tmop5mzk2oZ9xwk5LYGCHpkQ5Eec1G2x6f8
	FNhfv6CzCFiGrSUrZDPVcIJ0PiW3YelVZk4ycf7rSLkrQEzuOfZxqVzJ6Euj1lseIFkEgBYFWrF
	yC9w7vqOSWYb7hWLhhFfx4Y/qv3FQbC4uO0pm5C7fLWwywTf6tDeURVWCPWY0tofhk49w98lofv
	AKb0Lzkpqf/SBBqC0O9nuab5bpucgWbULVigmbs73Et4dNn7odjRqg+4QRzkeAkWliTx4JzcmCj
	0twERP8gD9w==
X-Google-Smtp-Source: AGHT+IEyARd46f8Z+T3XUj4EtN2OgIy/eEG+61sY650PaxPU2j+xPISU0eje/zg6UkuoVB2yg0LwKQ==
X-Received: by 2002:a05:6870:b024:b0:29f:97af:a1a0 with SMTP id 586e51a60fabf-2d0b386de21mr1873388fac.24.1744310682914;
        Thu, 10 Apr 2025 11:44:42 -0700 (PDT)
Received: from [10.69.70.230] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm776184fac.19.2025.04.10.11.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 11:44:42 -0700 (PDT)
Message-ID: <e0e7952b-a308-4fb7-8af6-d4802e7a5080@broadcom.com>
Date: Thu, 10 Apr 2025 11:44:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: Add support for bcm74110
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jassisinghbrar@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20250404222058.396134-1-justin.chen@broadcom.com>
 <20250404222058.396134-2-justin.chen@broadcom.com>
 <b32aa644-6984-476b-abc0-a5416f551bba@kernel.org>
 <9088acd0-4650-4b10-88f9-6b6c0b1f9978@broadcom.com>
 <8abcf2bf-77cb-4380-bdc4-95c3796a96f0@kernel.org>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <8abcf2bf-77cb-4380-bdc4-95c3796a96f0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/7/25 11:05 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 22:57, Justin Chen wrote:
> 
> 
>> from v2 of my patch was copied from said generated DTS.
>>
>> Apologies as I navigate through the different yaml keywords here. The HW
>> isn't changing, I am just struggling with representing the HW using the
>> different keywords. And the different implications of using said keywords.
>>
>> Here is what I have for v4.
>>        items:
>>          - description: RX doorbell and watermark interrupts
>>          - description: TX doorbell and watermark interrupts
>> +    description:
>> +      RX interrupts are required to notify the host of pending messages. TX
>> +      interrupts are optional. The TX doorbell interrupt is not used by the
>> +      host, but watermark interrupts may be used to notify a host
>> waiting on
>> +      a full out queue.
> What does it mean optional? Board decides on SoC connections? Given SoC
> is fixed isn't it?
> 

Maybe I misunderstand optional here. We have optional from the SoC 
perspective and optional from a driver perspective. I was thinking if we 
have a HW feature that the software may choose to use, it is considered 
optional. If that is not the correct understanding, I can make 
adjustments. I will remove minItems, which from understanding, means 
both IRQs are required.

Thanks,
Justin

> Best regards,
> Krzysztof

