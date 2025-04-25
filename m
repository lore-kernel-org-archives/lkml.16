Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800681DF759
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610893; cv=none; b=jmVIZG9KoM/P9gBY3xE9fvkqF07esHsExhx9P7Ahq909BpxDDe4CK/6JUUNeglYo5/bTdjHnm5naagK71q8RdG43QvYRtLgeJ9b2vmiotONbGi+XVtv/5h18BoQ90pBsVN96fsDCMv8YXb9EOY20coUoaTpedQNGeRGPgE9fKV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610893; c=relaxed/simple;
	bh=UQBhajw/JeL4r5v3Rs1yPTsRAOgc9Sros05Xpe1hjEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB2fN+/J2rt3/Psjfomby2w4CgQrnpcRaqbjTWGTB2o/niGEV7VccTY6w65yboleFhgKvE5P1ebmAlBWA5seQkiUkyvXOLwi6EBSgApwEovJ//yoa/9dBykZXkZb8OPIS+kFwCf3RlWtGtm9EyNfQ/VjPcwIJHyPwki76EHn5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9ntPESG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9ntPESG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so1766005e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610890; x=1746215690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iZKFrHcJZYCujaNEaq92E0EBbUbzkFvCWqG/Nj+BFbY=;
        b=X9ntPESGh9ca3poctWd5OfWOAmXK2+EYTwtlxYwMbF0GIP627+07AEBw2dOUf1bqI8
         jkGf+FF7KHq7h1Qp5dmkMg228cbxzr3xEHQCoG5R8vDdUPOvkNIRTrgVPb3DvKA77Y4D
         mnncaurRatZs6kpJKf9WeWO/E7T77lE5eUUdu78gBBmF6FP/nEpoahUCjb+91C/JQCfX
         u3OMmussNEyhz6Me/J6kugQNfQebiLfGxfwOvkkQ524RXwBPpOP9fv/6/cVESwab1ncJ
         clcv0GwWPD9d1e8/fqLBLA/xrPjW44vCxUVlvY4ycMzDuxefxwMkXx8E9T+XqCtvzLlc
         OmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610890; x=1746215690;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZKFrHcJZYCujaNEaq92E0EBbUbzkFvCWqG/Nj+BFbY=;
        b=h5NE+8q2OEp/yoRC98xSgCipNJQlNEU3o3NGgSAJOBp7MdlLhcdx0ejUl9CD/PeIRj
         OSA4UWW1Hp66xi/RjLQ+9SsGIZDwWJDnzKitYJBmL5CdhgM2G+Ly3e6f5dk4YTuZ1Q4F
         ibx96tUgOAH9LbLz/Y/8sPTjAbEHO/j9OZpFWaIC8i+Pot0kd5/F2R9tlesNa8paN7II
         hh6vJj1Qy0/OIdhbZrmKPj99W8zjhES1K+Vy8Fg0HVCf+P9WJetrcaqBGurcu8FnTpU9
         iJ854uXXcWaox3VsVdPEZpQPnU4skYd6iBQXU/IwuOtRCA8n0MnPFFo+750PSlzJ10Ms
         gwMw==
X-Forwarded-Encrypted: i=1; AJvYcCVgWYUvWoowJhIp4MqusCJV7Qdn+CuAXJGvt2v2biVNYWl12sOe8+9FjSQ4PXrce4S5dDPjvAUczR2wGdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHuRLROPYpv7/blVsRgRHU5v+CHdhdOJa3FdemIB9Upf/FiXlG
	38XJsb04yzq2SbYeAIgjSLXtBm8ka5ANTwEnfp+RtK6Z4NHs1zVpW6auhHFg0+k=
X-Gm-Gg: ASbGncun9ZkvH0MXpb6pgE17au/gFeQFYQgnvZRPqCBjCQeB7m8ahjMEgWDIr0MBCUL
	DKPO3E8sk9yP1bilov2fMGqsyCpQlyFauKQUO9duSLST95SbQwTM6MBYl7nOjXr6MN8s2AZ+T3/
	oS21nB2S/hx/IN4v7dQH5mYsZRQ1Ufo8fcQz1cwIlne+SdzxfdqMroFMnALffXY8usva4Oh+7aW
	mX42aco4fzTe2N58VLK99QsRR5iLZvLeduhizbzsligfu5wchTQP8KTIWa88NjlUqqKSzC6shu4
	1qCpCRSZ6PEe90zs4Myd0W80k+10ht81M/e/hhq6tR1mz8slBSkwLSsGM5U=
X-Google-Smtp-Source: AGHT+IHwTzyAUXv62+tiLEY59G5UWbHcmL+HqGpSUG6e3gApg3OCpfZYoz7ZdQxCg5phwwl3AXVPtw==
X-Received: by 2002:a05:600c:4ecc:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-440a65dededmr12565205e9.3.1745610889764;
        Fri, 25 Apr 2025 12:54:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e06d8sm68733805e9.39.2025.04.25.12.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:54:49 -0700 (PDT)
Message-ID: <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
Date: Fri, 25 Apr 2025 21:54:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan@quicinc.com>,
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 21:34, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
>> DTS is ready and I consider it ready for review, but still RFC because:
>> 1. Display has unresolved issues which might result in change in
>>    bindings (clock parents),
>> 2. I did not test it since some time on my board...
>> 3. Just want to share it fast to unblock any dependent work.
>>
>> DTS build dependencies - as in b4 deps, so:
>> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
>> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
>> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
>>
>> Bindings:
>> 1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
>> 2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
>>
>> Patchset based on next-20250424.
> 
> If the DisplayPort works on this platform, I'd kindly ask to send
> separate DP+DPU only series (both driver and arm64/dts). It would make
> it much easier (at least for me) to land the series, while you and
> Qualcomm engineers are working on the DSI issues.
DP has also issues - link training failures, although it feels as
different one, because DSI issue Jessica narrowed to DSI PHY PLL VCO
rate and I have a working display (just don't know how to actually solve
this).

Best regards,
Krzysztof
