Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCE21D3D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750398996; cv=none; b=qzZejRoGcbxgnHKa2L2wwzNM4qTGFpGWFFQXKG3rR+5ydo0kGprTMeeKGaDaf3tNuNMH+CXDrK18r/1unnC39qVMpzDp4RDDUjBMCZ/p62xqYxI6/wkl7pPXAGhQ2n/llXF2GC0OMXnPE4QmBPMAZILJHi/2ma6rIzG3cyq4IGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750398996; c=relaxed/simple;
	bh=5/mWVtLGD24gCM1si9RPcf5SvCDoz6p53AqCSJC9PcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFWPWBPicRXaA9UVUe2wHe9pd1NZPx6MzBJazIz4UM7IQSLroCI1bTtq5283TViGrrPmYZ5jSWWBu/ql6fv56QpAKamnQ88uM5PG+va7d3pburFPv9U9Rtl0Oq35JLAVPR9XwCCitMyaQFguBPBAdQTmtvnwFLtA8diShIHEWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFJWUep7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFJWUep7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so296615f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 22:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750398993; x=1751003793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6xdA68MYggUa1w4ukHSrMIxDEwDuDuAxvHXLdqvwJY0=;
        b=IFJWUep74XQpWvrWThwcpOyqeIArG/WGF0RSkIDu3e8VXObyjJYuKDwCp8pVy63VsL
         6qF7ohcrAtD1J5bMSVzRu1v0q6JM5rOh01GjDBaw5cTfuNXLkjYT8EqSg2lbOFGAPuxa
         GcSYsFMBjTrE7Rqp2liQii/xE9OQe/KlOPoZnbR+rs194xvyVit7xCE4GB5RYJjiHM4z
         Tf6Nh49ncqUgiErfWc+Fi7dN3+aNbGX4N3SQEFER8UzcCyhUyVAiMGH1MTXMh2Xk2ybN
         hk++uQl2TbCvaDA4eUYw6B+MB3xHR5eSm4Jt4BrvdSMeZNTU74xbiWKiONDkWpzSfV69
         LvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750398993; x=1751003793;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xdA68MYggUa1w4ukHSrMIxDEwDuDuAxvHXLdqvwJY0=;
        b=qqatztollJHmaG1rptU3fCibdJH0n1WsyX27kV3+HBwDy03fv6mkOspdXlKEPIf9wm
         m7LZTy2p8u+4I8fPj+xch3DyC+iGzwnWF9fDTSAvFYH8r0coXc1P99OWQrVrJdLxrPTA
         bv1Ghcz9uybnKnb3cup9MA2XBAVRPciL/iqo+jm5OHoDhG69OM2TM/eKSkCNWqz3TYPd
         x3mT4Mb41nw+sfRxRutuv6sma2AV5dQ9WOC+aMkG3adYSv6XXo4gzp6RUsZgFuDJ9G/0
         yu7q4vCQRgA65GC7vfnMDg7OGXNSL3zk7sio/kmWDUMUJiXcvRpT47aduyIr1uaE+y83
         2ToA==
X-Forwarded-Encrypted: i=1; AJvYcCUZj//KjEHK2AIt9QIECRsmUyJ+tSb+ORFVfMT4LOLRcqaMYQZh9X0tJbWJBNw+zsZ2nMHp/Y+Qjr7GAZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAxPtxK/7DN0FN7zqpkKMLoF2wxs86EPxX7wAngZHpPM2Pghl
	HyviboIaDbXrNqUkpldTFNPH9dRTn9fHm3ZeE9s/N5UEH0+qT+bmR0PjQN56ym2Qyvw=
X-Gm-Gg: ASbGnctC9bT6G9X8DAgcYs7+2pvRETAInGYnNXJcr7BnL8idCLghSHERUFLP+xokc1u
	TjksUd10JBjqslN/llS0bPJQgNS1sAFGRROe4WiPgqDVA3OSNtdJkTU5ylFeggqWfftnwKfKaqo
	l543XyNPI//lbBr6L5tyDc3crDAPN0DDgnkzo+5PdEIKMdIf+RDITqK7CLa98Gu8clVXfXt6H9L
	ZVNuCVkO5CCRvG67v3/mhDcDicoQwKMZZSWcIYogbnZi/6n+jiWOQkus2CNi9h7/Xgsjs1fPM0j
	H4pA4wYjTc9XV/rJC8wr9wXRrq6aCqJEkJvGLjA4/sS9ZEdSv58Y/1L2wszpsNqeThQp7ztEDTI
	G2kf/AG8=
X-Google-Smtp-Source: AGHT+IG3gZgWQ6JAyDSzJW9KbdQ4hIpZgLdkML6+8ZihoNGPY7Ys650erfeEVxWvpsawBniEN4L/cg==
X-Received: by 2002:a05:600c:a09:b0:453:c39:d0b1 with SMTP id 5b1f17b1804b1-453653ba8cemr4510965e9.2.1750398992874;
        Thu, 19 Jun 2025 22:56:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm9867515e9.25.2025.06.19.22.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 22:56:32 -0700 (PDT)
Message-ID: <6068badd-8d33-4660-aef8-81de15d9b566@linaro.org>
Date: Fri, 20 Jun 2025 07:56:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-videocc: Add minItems
 property
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
 <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-1-02e83aeba280@quicinc.com>
 <4657c6d8-8454-478a-aac3-114c6194b72e@linaro.org>
 <5ed72663-da54-46a4-8f44-1ceda4a7d0d9@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <5ed72663-da54-46a4-8f44-1ceda4a7d0d9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2025 12:20, Jagadeesh Kona wrote:
> 
> 
> On 6/18/2025 11:56 AM, Krzysztof Kozlowski wrote:
>> On 17/06/2025 21:07, Jagadeesh Kona wrote:
>>> Add minItems as 1 for power-domains and required-opps properties
>>> to allow this binding to be compatible with both single and multiple
>>> power domains.
>>
>> This is your hardware, so you know how it works thus I expect here
>> arguments why this is correct from the hardware point of view. Without
>> this, it is impossible to judge whether this is a correct change.
>>
>> If I overlook this now, it will be used in discussions by other qcom
>> engineers, so unfortunately you see, you need to prepare perfect commits
>> now...
>>
> 
> These clk controllers mainly require MMCX power domain to be enabled to access
> the clock registers. But to configure the cam & video PLLs in probe, an additional
> MXC power domain also needs to be enabled.


Then your patch is not correct. Anyway, you should explain the hardware
in commit msg, why this domain is optional in the hardware.

> 
> Since the initial DTS changes only added MMCX power domain, this change is required
> to be backward compatible with older DTS and avoid ABI breakage as discussed in below
> thread.


So you send incorrect hardware description allowing something which will
not work? Or how exactly?

Best regards,
Krzysztof
