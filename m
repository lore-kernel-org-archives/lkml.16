Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60362459E3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680318; cv=none; b=r+RQ4Z1Q0RxrtLZ7lbwjCcuhL8MlNPNZc3M6NPSbvQIjCwBgj7ZNeodp6tRG9GSTVkxigL9gUgPXM8Yf8d7C4Eo483l+UPqutA8Gb05HhQYdV8d+uLn2PqtEuhMoAWHx3z7NIztFMAASPd4V3bahaMFwe8ZGG32/1+217kKMMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680318; c=relaxed/simple;
	bh=zFzpPLRWvJKYZ3vv1uNrHujxSH+BHEn857Wl0SVSpkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npA4dsrUahipDIw4f1lKEtc5TnPXzFvnNfoEzajMQlQynUZ9h4UfHJpgCEuFKoQcIdqoPZzyrJI/19Dvm7K8mGHqn/V32yvho0IOk9Nj6Y7apG80Pt6az3EMtLS9R7IrDtkc5xQWmAW6LNSXAXpnp3oA7dBQ9ViCjBiOuDpglGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7fL1oal; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7fL1oal"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a582e09144so2462713f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750680315; x=1751285115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXygeYG2ER8n8opl/QaZp0fBLfSQqAobrPBhDjLcx/4=;
        b=m7fL1oalnZKKL8sxl5Ks2DHFkJUZjpRSypFG1gLDvP/eUjT2W94FFK/TF2clcWyW74
         NdZBpjgvO/q1e51+zr8XeKDmxfG2fdhMjbnURiP2qJ1UboSxmir/2E63B9jnHNwqoAms
         9Jv61hSQOqAYaMZKZKEfrEasOTOKijxXeX7lZtp0HuLYjBRzv+61iUvhv68bT64SZibb
         MDAvP6RoNV+6c9UwCgWXNP6ZdOBJiyuuUnEZmlsYV4qeXrNsNNSoLcoayOQbo8VoroYN
         a6W4NBadiD7Qmm/l516PPorPaXYkvt+mhde9EJavfvsVsgho3VE3L+QSYKE3xstvlDJb
         +JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680315; x=1751285115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXygeYG2ER8n8opl/QaZp0fBLfSQqAobrPBhDjLcx/4=;
        b=WDO5vjsWCrc5rZuc75nv+em8IoiB2vGYUGRC0aZ7IeDFJQAYdQfdFas/qN98psvd8L
         HkLR3XssfWkqwaVoDUpM2cwIqX+/3a5PSwo0DxeFUIyDTB0uD35wmtcsP3j+6Zf60aRD
         CvSjNw5baPBIGW5lWeRhqDFStvZB4Dhg1Sytvzver0Wesk559Jv3RRBNKHWv3O+zaaym
         dcnklpTM/gcIsVJ6mr6rjAD0yH5ULJf9ZF4yktnOsDSfPnpwzQIapTicfgPRJhmyo6S3
         KT7F5oTlHfh4BmKwzxK5OVQIYuV8BwtFHbUi/wzPxWdfMDuEQO6jqneD0bHEXNygUpe2
         hh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmDRLBZEuT12zPXrrqOXXiHNqX4VKKFzr8FISEZgT9JcviMScwWvXfaH1xSZ/TptFw4raBg1YAMxLtzKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Jl5ZqBdbhj2gf+1Cl544V9+i5gm0c9x4Ta3SOe/RieOGHdUk
	2TmW7FWQ+Pd7curNKtJ44OKrRA2GHfLd/EKRLvL5TnOTIopGVVwGLGroPj36GdlQMd8=
X-Gm-Gg: ASbGnctIa2D2wvFaBKOg3xhq/Uc7nyyGKE0oMJPod8x12hzKxYaypTI43mC8See5OFZ
	L+p7lCt9k4Z8YJMifXFNINFpvojcTMk4gkxtVsZuxdGwzETnt0m3g+ArjYJloQvvczzlzmSY2xC
	AehlKJe3DnnXkzKqaur53tFnypNNLiFY6fsoX+vdF2qzV9Zw6Yl8YKxSQJvJXQDLadPOqJ+iV9b
	0Y8AN/1fzryubPYUt4frztEOzhJTiSJY6pnFBDj4h52NhCYPuHkiMlA53WNVKZkctJNKHaaZ8eO
	RnjpiBBtI7l3vIdF1hcUCTYkj13Ign8YK/AewjcXNbiU7l7Vgleu2Ujx8WDPOjsiEPMbBUAqBes
	slA==
X-Google-Smtp-Source: AGHT+IHmt6Ms5ZEIheIusb0XCQ9yagDZCEgOERK9Hfni7mIiWLxie6KYGJVHY1uF8fttU9m+X4xT+A==
X-Received: by 2002:a05:6000:5ca:b0:3a6:d26a:f0f5 with SMTP id ffacd0b85a97d-3a6d26af312mr11836667f8f.21.1750680315026;
        Mon, 23 Jun 2025 05:05:15 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8bb6sm143547295e9.25.2025.06.23.05.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:05:14 -0700 (PDT)
Message-ID: <5428619b-db7c-4b5b-964d-1466e516c245@linaro.org>
Date: Mon, 23 Jun 2025 13:05:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] CoreSight: WARN_ON in coresight_disclaim_device_unlocked
 due to register reset on CPU power-cycle
To: Keita Morisaki <keyz@google.com>, suzuki.poulose@arm.com,
 Leo Yan <leo.yan@arm.com>
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 ericchancf@google.com, linux-kernel@vger.kernel.org, mike.leach@linaro.org,
 yimingtseng@google.com
References: <20250620101906.3762866-1-keyz@google.com>
 <20250623085937.894003-1-keyz@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250623085937.894003-1-keyz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/06/2025 9:59 am, Keita Morisaki wrote:
>> We have the ETM driver performing the save/restore of ETM context during
>> a CPUidle. This is only done when the ETM/ETE is described to be loosing
>> context over PM operation. If this is not done (via DT), the driver
>> doesn't do anything. This could be problematic. Could you try adding:
>>
>> "arm,coresight-loses-context-with-cpu"
>>
>>
>> property to the ETE nodes and see if it makes a difference ?
> 
> I tried this in our environment, and this worked well. The "arm,coresight-loses-context-with-cpu" property was what we needed.
> Thank you so much again for the swift response with the useful information!
> 
> Best,
> Keita


Hi Keita,

Thanks for the report. We discussed internally and decided that it would 
be better for the driver to always save the context by default, because 
this mistake is easy to make. Saving when it doesn't need to be saved 
doesn't do any harm, but not saving when it should be causes quite bad bugs.

So "arm,coresight-loses-context-with-cpu" will be ignored in the future 
and we'll add a new flag like "arm,coresight-save-context" if anyone 
wants the optimization of not saving.

Thanks
James

