Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB332367D4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375663; cv=none; b=Q/Y8tS67GdeUkdZ3MR+Qeko54LUJHKPfG8dzvQnGG7n+8EQC4z2csLAuxVW4M2oCG8lUpMlyA9GisW6SQIlH8HoEYZ0ez4aNZPAgn+ZiS7+dwEiy0Yxl4HFV0A8CndeDsORhMy7J6BW5Ey8kmKf+C2HLe2HNg0tVOaeakT5kLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375663; c=relaxed/simple;
	bh=/9exeZYC0ln75OqXryQRe+XV1cck5q9ppQ2F9YveTOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NC7WLVhAJ5NpyVIKVCLAH6k3gvm/fLVcVQaOZ3bmG7kcNednzQKxCmzCLx6nOIAxhJZQCdDULham690WO2s7ZySuWm0bcqOEUVZ4oj7uks+5VXh2pe5bPrImrlTIRtTTydbjsyj1r+N0p8nEjzh/AsviGYaOEu/njCHym4zCVLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kX+bB0R+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kX+bB0R+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c14016868so1657927f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375660; x=1744980460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2nnzdriq0ONqeToErv6soefY0Ll+iz/nW/gayWNpY4=;
        b=kX+bB0R+snfXBgtf6Zt/6qE+IbIniXskm1Swsk9vgNXOaoBq54T6M6JON9iULN1V9x
         rZwzuP3GtRYPFR8OGvoevGsK1jLy03zepPxfInaofowkZ1LQ3HRQ2CGVWDTUG4vXzRfN
         Y14+D3C9L5a9wKszkEFmZwefmu1dUbgun87XkJmz8iNWiBNbldhJFylHl0nB0Sdfbhaw
         utOOTRybSw1FkiaiAMLiFJtnxWMbfTrVhDUeV/11NSZN+WIAsLFPWPOPjvar7Znx6ujo
         TITsqybx3EXV/mphJDMGLlBNbYNtc3ruj9i4SoYekHJGl2zSN7+4JT7ATTNGLI8N+VsP
         pabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375660; x=1744980460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2nnzdriq0ONqeToErv6soefY0Ll+iz/nW/gayWNpY4=;
        b=YCsN2NQ/yVvc39MGmNu8tR9jSBI8vLsjs6pTUVvYjuSc99GQWsHI4pVGRRwvJaxaxg
         plL1r2LlXchm/DlgkeGDbRkJpAoRW/+sXBneee/3m6ejgJeIupIBWxD4vw8P//c3OMCK
         Opm+ceLuzrNl4LE8DnUpEGSIAfFWL/3dnqLgQ1fwfGgoWVyBA+U+aivcEa/fZcp/JRY2
         j7JVD6gSS1Jo8ug7+XDHqdU8mBhEgT2pBJvMV5DjzmBr9Nb6KRIi6+lg6O+EtPtq4Zf3
         hGHgBkV8D4h9dItLljm/e9CoPROpr6OTOVuOMRUG0mJdirXYDiHcEP4CWTfYZrG14o3k
         WOpg==
X-Forwarded-Encrypted: i=1; AJvYcCWWxb7fZTzZL6aCXtKmTws5i3FhExacWVXyQPKpY8EvVsGHoV+DXenV6Pv3ngNmnoTPkYoxtlMj3fhJf4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7KVZ7jjx8vN41dVsfq8AQXLwZEFiufKHnQANXuYKtu+k0wqBn
	FDdoeydXMbUZSkCw1zkg0GhF4LzTpv2AQdzB9SpgTCN0nvZ+pPLVj0EB6AIwAmM=
X-Gm-Gg: ASbGncuHdh6E10MmuPIKWw4BeNNmRnfgENXhUP4Ht3jpCywA2XD5oN2hzzvKNEYEF3W
	wA3mY7AXKFw1PtjPsCWMtiGYIYVyaPyloaDdFYxtMfMXa292usscCb/MT1ylV0Vii8c4gwjf6Ha
	VajW1MZ8y+Fw3YZKz8PgDaKfGKPIByQ1hlk4xylwEtHDfbea4UWE4+bC38gGrekHuabI3/OFMIW
	ln9ccG5G4jCAlbp9Krp0mXAlbm8B6gdwwidAn1IX/nZuG71lb4dcoQNoYYH4+p5NpdkNRpwvfIy
	6rs15YsLCC0zsomXqM/Lrw7McmGCE96HWSoUxPe58nrll/xCKAGHeVLlKsJONFuHUgg990chvlU
	1dAZGpg==
X-Google-Smtp-Source: AGHT+IGUsechKPxsJWJXcfLxTXrYk8Q3dS5jwa5ESYt5puLqb643rMkJ3V+3UBY2DLpDKknF5+jlAw==
X-Received: by 2002:a05:6000:2483:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39eaaedcb75mr1817205f8f.53.1744375660089;
        Fri, 11 Apr 2025 05:47:40 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm80924125e9.31.2025.04.11.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:47:39 -0700 (PDT)
Message-ID: <159f1df0-6c7e-40a5-9c62-ef6ebcb189ba@linaro.org>
Date: Fri, 11 Apr 2025 13:47:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] media: iris: Avoid updating frame size to firmware
 during reconfig
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-4-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-4-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
> 
> The alignment mismatch would then subsequently cause the firmware to
> send another redundant sequence change.
> 
> Fix this by not setting the resolution property during reconfig.
The log implies to me a missing Fixes: tag

---
bod
