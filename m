Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5129128A1C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630439; cv=none; b=fA5V2ct5W1l0FAjmKWR00l5RRtWleIOPiBqy8QgAWbiyxqYUuJDNgI68YUzbFj9nFJ1cgam/2OHGbbmh6wAvDDe1puEFkx6/5WzHP1PV1HH4pqRF0fAXzw+5TgRncGPSfmN/WYTEizAW8/kOQ2UCEzoBI9+UceOlZKn+4bD1p4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630439; c=relaxed/simple;
	bh=pz8ye5e7M9XObP3UChOTHfnACy3PA0Ye6tCjNjm3k0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7BcRu7RSPtwJyQ/hi1lIJghIG9OSZG0cFXkv7Q1y0HUo1Bw2aAuOKsjP2XOyuK3LUuC+EaseVPNnbndJ+qOYfUBf12VwqgLMxr3g6aYlBhnDAaQLfFDMRp6US2I91nIGqYoCFS6rfZdo9v3gwrt4mKNMHr3qA3m+AF2mDwMO1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhPIAGv+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhPIAGv+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so2843465e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746630434; x=1747235234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0SsKd1Kg0MlyI8m8KzDXP/8dIexMnrpuvni7IgTwUM=;
        b=IhPIAGv+BadjeIGmE9UfOxWFUkWWVew1DM+20lDkEAPyw3bPsgAJfHPxdVoWUSxdrZ
         1+JvoTl+WdxMeZtbjCcWLAgldPnfORMZRGmk9VVPzfRI4+HM5+o8uopsh1QptYe0EXYH
         URwlTiNVsWkZmQ+jeA/VeM8bMWBt6RmwOy0o/LGslUGEDOJnhbsrsh+w1JHiB/NfAmiO
         cb1KKERXfe2WOxvU8sIF3BknVc/F6V/+Ui76l2yfmZCdOusXC1fEO0fhrvoRZJQOvamC
         qlLOCbkTNsms/P19BVxtFCfkNqttMzy3iPoXyukpTDW4cH70OQeESqe5mI9NbjnCBGJZ
         6r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630434; x=1747235234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SsKd1Kg0MlyI8m8KzDXP/8dIexMnrpuvni7IgTwUM=;
        b=jLCw0vAv4LCaSQgpHSoD0LlyLvWqre94AUzL2FZoOmX+PAbyC4B9l+2wHRriFn/tym
         nNi8dbcr8O5gzUUoX+xpAPBeKhdY6T0j+0q0WxgJHLXE6/wH1+dT6RsZ7Bt+oxK1zn7i
         sNucgVms3ksl9Veh+2bI2nIEdMlkLbmwTo2qa3BkaacQnTte7J8XjpSLkzFTvVp+fgND
         sgOWH5ZsvPBrWaryGbBChgfHojYSj9ygoKZhphSJ6+Onh8YFpGM/2lG/JGle0S5HSG7H
         w05hNX6UiO/IDD16F6T9cCfNzuHztHl+atgzw/9MgNfOV5/M/JPDbXOUj1eFB+PZcdOz
         YFrA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5OiiaB0YM0KsS3EmDmmtlzYv3G+tszsEHRNianO3xHanFSOV4GrB+wGbtQsY1kZp+sm7UVbrUn3bq04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIYorJywtEJyZSyJJ7qfc1zr/OZ78FaM+8S8hKIp4Mb26ZxeL
	tzBabaALQ09sTR1AJbasL/hNNx8J3hxUq7tdITaM28OTSjjU4FfhhwHBqk7Jeko=
X-Gm-Gg: ASbGnctp2AP2EEekxhYtZuZI04/yl2OGcQtW4ki9QF+AowUzA9DVsA7AssHv6zYoMUf
	sffAV2tW/+nEc2EglL9PnyheSl8DyIaYBvFUp0zGZ92Z5A8sszAgW5nFQK2ianHpXKIm2hHJHBm
	mdMlAhQ/RB/u5rHaL1oEywaSMuWb1eaFEwlCuA5ML4z5ORQq9ExLu4JX2FLG2oSVLbis4dOarfs
	k2h4vZp0g2IptmevaV+miAkn3c4/TAnYFx21ltYAXr6d9InvjWcR+FesRLtyc3PVhEtukDwHSme
	2V0E8/39o9QrtDCIjQ5OQl1pzaMWIAGx79sTp1HQinn1mKeLCvBFaPmb2KpuN8FMnGrDtFcLHXr
	D5DH6Sg==
X-Google-Smtp-Source: AGHT+IFe/RN371zSOT3geyllQKE/3rmj0Va8MGOVysneZBCiRZTbhKgyS/SuJAtLvsGkoEeFtxE4JQ==
X-Received: by 2002:a05:600c:1384:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-441d44bc67dmr36585625e9.3.1746630434334;
        Wed, 07 May 2025 08:07:14 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7caasm17416290f8f.54.2025.05.07.08.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:07:13 -0700 (PDT)
Message-ID: <dae06ff6-afd9-46a4-bd37-25bb367ba545@linaro.org>
Date: Wed, 7 May 2025 16:07:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/25] media: iris: Skip destroying internal buffer if
 not dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
 <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 08:39, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> Also, make sure that all buffers are released during streamoff.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

I'll take your word for it on firmware respecting the software contract 
on close() wrt to DMA - however I think you should split this patch into 
two separate patches along the lines of the "also" in your commit log.

1. Skip destroying buffers for QUEUED flag
2. Make sure all buffers are released during stream off

These are two separate fixes IMO.

---
bod
