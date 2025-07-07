Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C5261595
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880601; cv=none; b=KT4WymSnmhthfMkCbq/Ut9O6X9qk3zsHF4WM1N0ds2njCBamXNKRcu0AysTSNC+y5wvXWQkOukvaRUlI4vpuSfTmjQc7Y4utDK4iJQftAjjTbVCY7n4iDaFdMSS+cKIuwoZa8BmELchfd5v0GY59OeU5GtVu66eyVumJjaQhdK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880601; c=relaxed/simple;
	bh=Tcz/ZSON6tyal3jWImYScvZPwBqGMsZpcQToQ5CN7DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8xb2bshGD0wfTC1aLPoMt/uazpXKHa0vOmgp8OSeEz9Zrc+tK2WAv0EyiIWK4TGgi9EpxdfpPzuHNPLMVxymPL4Oqo+5eAMaMA2VcFLHKismLZkiQ95vO2UJtupgIDB+Zoc85tB5IVIkFBMNb9DyjnUUK4HFj0o/m67F4OCqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wahg4mq8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wahg4mq8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1723345f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751880598; x=1752485398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IG5Dp7YEckX2tzrC76ZgnO2aWG2ab/HrAoOTloA/d6s=;
        b=wahg4mq8wZ3AoWxrd8aqF0xLGbOmgqzToBp7PaAZi/yW4e07Ky64sXpFueo7mF9ptp
         n66O2IBKAUiSNnA1HaBPThAiSQn4nxrCedyHkzoMNUSLn8lS5g9aEpJFGwSnbm/EAv9P
         yKEzOSugrv28+S8KJOefZwfvVrKwtUqZdsKjvjkMvEfYhmSl1d1ltM2kSYkZ570zF0OL
         zNqLrAMw28uXZWhtnEO6Ryn0vMF4hDPT1lEWVWkEktAObBtdfyRLHgPIWEwbKpx2twNC
         AzXEMz28dnVkZGBysQKzw1nwMMd4X4/WEZNLEKchGonDEgihp18q3qcF32toZzeBMEfw
         3www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880598; x=1752485398;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IG5Dp7YEckX2tzrC76ZgnO2aWG2ab/HrAoOTloA/d6s=;
        b=gLNdWDt8ntfqeDAhvDL1EtRUQHSXgZRKWfq1vKDasIMPHSXCdy6KPAzdBP8WPc6th0
         GBvV8ZujuON/qQqXU4wjf2gf1AjkVOU8JIokvbBPHmUgCOUhD1T3v5YdgGxSefXwFmWe
         9QBat6bmHm5AVJNJNXaU+0vBin9AMP1HhoAE8FwUkQGrcMDaKUH9qY1T7ZR8wK6fRH9/
         8r85tCUw7d9mfgu7ZzmuPFbhsDWju/E2XDDdzIw2znAMR/HHXzrhlG1Zl0OiEoBXTL5a
         4K5xi0tdIppXxOOXMEG3RvLG8emwvQVFg897vAV7ZyHAbWy+BGlePbOQryu6O7Nz1bi9
         FPvA==
X-Forwarded-Encrypted: i=1; AJvYcCUTqh4OER24x1ifmOSoNqSg7vQLt+ynir0dOPv0NkGZIazqrwDXNzGMDkXaWmhOrJYYwoeA71YsG+cEzdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7kZpQUIokYG/Q097vo2n+ZyfN/nE+7fYit4MI0ZCy4/y7qs7
	n+QGLODshAEhZGJU5PNWql2JvA1dI0geLjm8NrjwBWqL8UEdpuIzMEhggoHqzStrzJE=
X-Gm-Gg: ASbGncvyZ2CJePDpWYYcZKpkSXOtAyyGA2wTvM7kl5rmdfEwO/OBv8rcFhsuv1VrNvG
	oHmfgVDaSK5goKqOPNvZD+4yyyuFwANZhnsRAcDxAYitbksTOB3ZaheIMEc0ERZVwJ7vrOJHt5J
	9ki3OSB3IPsK4VvmfO0YOXyAB5Y+xAQKJ5HreAkNuwfK5/ouzIDNRs0pFL8rLzkHZLKE8xmfI+W
	XL1m2lLWh+va5ohJccYL7+jVMex/Q38SQsKLYAFGqHe5AKQE1NZxix/OWZ2kIo2jYbxf4IwSDus
	Q1pBxAxDCH+87+o6DNmL0h1L/Mc+R2+rkn4RjI3hjJKX9xdmb1lwN1HczEwbUZx6u5RCXSaQ6G8
	Bo9BAe4CNtLRhPzy7wle/RqonSbz6JDsZ5hbLnA==
X-Google-Smtp-Source: AGHT+IH6vBe89bzij44XDEItcxOcNLjzsQbkPRwS+ZfcpIFZigGMShngtte+AasQfadHQ7sAC2jgvw==
X-Received: by 2002:a05:6000:430a:b0:3a6:d403:6e75 with SMTP id ffacd0b85a97d-3b49a9fed4emr4082140f8f.4.1751880598209;
        Mon, 07 Jul 2025 02:29:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b46d4c8619sm9520972f8f.0.2025.07.07.02.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:29:57 -0700 (PDT)
Message-ID: <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
Date: Mon, 7 Jul 2025 10:29:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
 quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com> <aGuOMrjfQBNYAjmF@trex>
 <aGuS1X+RfX38krpf@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aGuS1X+RfX38krpf@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2025 10:26, Jorge Ramirez wrote:
>>>> +    maxItems: 5
>>> 2 should be good to support non secure usecases. 5 not needed.
>> ok
> isnt it better to just leave 5 here - thinking of the future support for
> secure buffers - and just update the dts?

It should describe the real capabilities of the hardware, not the 
expected use-cases.

---
bod
