Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312882488
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341824; cv=none; b=Gbwl1oZPvjSAfeol2iHIVounJ/uhy50UsYRdgAHOLTNmsNPYfQBuQ98UJaymEsVP9fDJYA0M64JpysQ3mZAEzEpCfCGLJr90fnCEIwFENUffNnkiCW+cyU3miytpABUxSMMezR+nOj8yWt7XHyvsK19//fOlhGyoFX27waRGZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341824; c=relaxed/simple;
	bh=fPfqv55n+maJhM4Z/lJsyd7pxciSwHhdgo2Eu7dcPLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKE12JM4XBS9Se4d7T87MUtQpCgxMyzSNsGB3ac8qULjFA/Xy9V0RKE3AnFuGiT1mQGVqGXA7Dqul3jCQgB4I3Mf7zY0UVRTn7azRxFOT8jalJYhl/Al1QIWSYdr2IHvM4/M/inN/Zo0NGn6d3qSO9Wpqbq7afhlax6Fl9agkD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qlj9WnMs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qlj9WnMs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so22010505e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341821; x=1738946621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
        b=Qlj9WnMsEFAlqv9x6qwONDArwWY70REiknszE1HBkJ8F1PP88xr7egMfBKOe1s+czf
         TayB1T8NigVjq8audoSMK/BPhivej3jPCT/PuSM7TV9XlptJ3+0jFfF9U6LkSC7qdP21
         RNNYSFtmiTbCwEO1YEdk3ml+uAbtg3BUgM304/13KfnXF/9IkHMGVQwaGJewkv5FdSto
         CQ57ZnBzx15FKiI6JQ93c0SzVchMZvnZSQ2MqdqyVXnFgQoKi5fM78h7tUgGppgPvyuU
         xGUILjsndDYFVnSbS5ZGoz5E05YyomwP7V9UKtV+3bI+5AqWX5QGzEQjQ/nPEj1II9FU
         uZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341821; x=1738946621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
        b=nxjOzjxI6zZGWve3vXDl8W1tHr2uQRMyJuwc6hbMIEznNxH7fr7RoXn2pMIGue7k4I
         p3MARAsr5LCL0jeCyP64peUMbesT9jelYG9rCXC6XyGFn9RT8AvWPkhuY5THUD5CoUKD
         q/1vUVQk+cpDPUsrHl6nMo2k9jy3m7gBjkQG6rchOgZ3BjI4TwObUrEftyJhQo2E6/4m
         rkKsvPg1UOowCx4BqU5s9cOKnGeROQsOWiCnRgksPWgpWakt6irtaoulKeR+72jRDUpc
         ImShx7/bLoFC04qqz2k8f46mGZrYfslHY0C1AOigpTbMNLjyh3Va+jl3ObaKL7o/oUcG
         J8nw==
X-Forwarded-Encrypted: i=1; AJvYcCWywnH3oazJzXS+MsB5RIcWzg8xttHA06NAJHZGx5vAfKNW1pjQvhr5n3mad2sAdxYDOq3nb6J5psngNUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLYsKBPakjT5pqVQUBI9KcOjuNdKbM7ZWgqxFRBXEDz8oRXsl2
	ai18sLVciE6RGv1JFbLomQS5MFPvPa15PKpSQJH//7ASHLuv2+96nOiK0y7S3lI=
X-Gm-Gg: ASbGncs+51o3lAbScbeX4b1MiGaVG6/W4b0k8CJabogS6bv3woZMf568wHtb6XIsPoc
	PHDIW+Ot1bGBJXXUjM+kSP4Xpn5o758rJ0rKqcmigMvgxOsLKw8NF8/qlDysdMiv5ZnpTf/8aQ5
	JtGVWpt2IjUQJDw9WIJbZwMDalziy6L7cdfBJrvFrC2hcvbuVs0DO/c1WG9DmhW7ykIJhAn3quF
	0keuecuLsozTmXKnwWeEaGO7sIb01RqDqV5TP7BuFYVlVfJBEZEgDDcINEJtVXud7qsUBxiHo86
	+UQ6QrxE2Vctnq74zAZPkfXRPw==
X-Google-Smtp-Source: AGHT+IFTTPVO+a34Yzx36UVXc0Rk4aOZPFhQnFzSj9GM9HcFqkLze7zFulEsR/ai1dusk+GIBTsVkw==
X-Received: by 2002:a05:600c:46cb:b0:438:a20b:6a2a with SMTP id 5b1f17b1804b1-438dc3c8676mr119292945e9.14.1738341820745;
        Fri, 31 Jan 2025 08:43:40 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc27130sm95257635e9.16.2025.01.31.08.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:43:35 -0800 (PST)
Message-ID: <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
Date: Fri, 31 Jan 2025 16:43:31 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] Coresight: Introduce a new struct coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/01/2025 7:25 am, Jie Gan wrote:
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure
> will be transmitted to the helper and sink device to enable
> related funcationalities.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
[...]
>   	/*
>   	 * If we still have access to the event_data via handle,
> @@ -595,11 +599,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (!csdev)
>   		return;
>   
> -	path = etm_event_cpu_path(event_data, cpu);
> -	if (!path)
> +	cs_path = etm_event_cpu_path(event_data, cpu);
> +	if (!cs_path)

I don't think renaming 'path' to 'cs_path' is worth the churn. It's in a 
lot of places in this change, but I think path is already good enough.

>   		return;
>   
> -	sink = coresight_get_sink(path);
> +	sink = coresight_get_sink(cs_path->path);

coresight_get_sink() is always called with cs_path->path, so we might as 
well make it take a whole path struct. The same with any of the other 
functions that operate on path like coresight_get_source().

