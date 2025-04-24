Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D850127C15E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509548; cv=none; b=W2byF0v/ovtz9x17Cg5Q/UckAtlM9lp4xNk0B50+Nk23LYnwQ2oJKA2/y3UIJJ72MZ7QnZkIvFglC77f8swI6Us9eTNVoxFg/+O9UPfuJarCBEAqEPoN/oNsNwld+N8+B3h7la06ijVEOiQOU/7+E4bkN9o4zCDlB6oVZCUvXhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509548; c=relaxed/simple;
	bh=m4WbnWF7hOg6KRt7LappWX+88S14yt6lsIPXp9lyGP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFbLEKSnlFYsnVZe1+Y08JY8VEVS/o3G6IgCGXzm43szdXkkhU07baVYYktMMowQEx965SGcAbPrge52sCTsovJJCE2d+5su8aq0bjfvT8Ozy68O1n0zPEw2AbU+CcwivBN3d+/wlEse/DEuxSfnS2GKpl70OOOda7Acb7SrF0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V3HqOTgh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V3HqOTgh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso8499635e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745509544; x=1746114344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYKmLWCuVbbnS6eIg6jW3CASv6d/Gi88yqzFbMCKwu0=;
        b=V3HqOTghesXjI28RkthhqQQRY43uzseyK/+bT9ZASfgV8mNPmgHjJYv759F+uJeti4
         RyXx1Ysebgl0Mpx5b+xgYBMVUcEaY5GZytod7Gu7REVygHKQiaXTLdjDutPPfWzIY1RD
         4VsqYDSfiPig0vq924xREfgbBOAGjSYfGUP3jBPn6eXwmojVpy/1po9WDeDi4bNiGURp
         WvE9/AZyhhpp+hJaBuRkY0hmg+/1E0d/r+zskMpgfOzqZ6kjAXKj8XdoDMEueBRrQsbC
         qRB5W86h0QVY6RZ/7X+L9x7+2UZLxk5T0Oop1INDceToyNk59+p4FMnxDJvwa2T7916w
         VjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509544; x=1746114344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYKmLWCuVbbnS6eIg6jW3CASv6d/Gi88yqzFbMCKwu0=;
        b=e3v28MLJ8liefuggm5lU0BVc6HwuS49tZ0FB/g2CGZhoaWxI0D3ajRM/0Nk+jQKF/T
         3HtvMn17jpwPtdvm3+HmU47Rzh3IP698yjJ4b+vFV5C2O7N2UNu03qwwV+h1dV4Fjd0F
         RZv6NEVBV/KBW+WD0tPKbU/P8OwrK5p6ZHGWZ6EwgA+v7rBGYDhSXWJDV9h26IsP5NFI
         uFQbIjePdS9CvMXJ23QFyRPI87Poli+Cq5vsc0wVLfG6YDwNEZyTq6Jh6aKy8YQFkQJX
         CV2gwt2C1R6p2tT5PZPyWcUKUJlfhqmJ3QZNX858xBLx6WbARwwNQmMwGNKnVEf8cdfo
         Ka1A==
X-Forwarded-Encrypted: i=1; AJvYcCXcOJCgPpDekQGhI0vtg5ha1Ge+NCg3gn4jCI0kvg+GmJcXu3iSr9vZLOSzVod/uWB+nAlaLWRtANSoJzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvUFWiAIME7VSWNdTrUMZhtzuOj+ZZy0dkXI1qZo+wYFTU7nT
	++lbkovteOPAsMiCjs0NXBcpNYfOxfq/cmzCGvMmZNAgrxuZ+YGdnLvOAsJA23M=
X-Gm-Gg: ASbGnct23tpvK6FRcX+1ZAMGNhMhII4klClDJanXfj/lmtTRA9PY0HkIevX/6lDKWAh
	n66Q52ThdA1tD2bXBwlI+8Wg9axErS2u670xFrM5ZIStH0UVuVdf8WeOTb0BJPbSaQvVHcX7oRk
	Bm7EXiQ0X1wOLAx2DvI0ul1GcWdqOqDnnhJtX49ENVZw94viO0mB3zc2ZcHrI4qul1lYRLGNN4U
	fcEX6/qqwLvOD5ag24G571siwaGTDtAQwb5z2pt/LIhWyrSbtXOioyvZTopGWe8v8BvBiD3xt0E
	4xSLeulPLfw96Lvd+ISxJf3MvjJTMGloy0aO+KoVodObNhYDrLNl9z6R5J6PJ5nlGgLJt3n/3NW
	kHqIYJw==
X-Google-Smtp-Source: AGHT+IHqzSozUZBGJRu1+oc+heY9EUUpamdaoOpxogVzGWw2jOs4uYMoj3kczTLG+0fz4WAByZJEXw==
X-Received: by 2002:a05:600c:1d86:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-440a3055814mr329155e9.0.1745509544048;
        Thu, 24 Apr 2025 08:45:44 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d88cdsm25225555e9.25.2025.04.24.08.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 08:45:43 -0700 (PDT)
Message-ID: <b356cbb9-0a7b-49a8-8c2d-8dd3de3f7c2b@linaro.org>
Date: Thu, 24 Apr 2025 16:45:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add x1e Dell Inpsiron 14p
To: Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
 <CAF6AEGtiMLQ6xWrmbkmdkpb7gsdbkXaFw7V84nXDDWtLA=4f9A@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAF6AEGtiMLQ6xWrmbkmdkpb7gsdbkXaFw7V84nXDDWtLA=4f9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 16:42, Rob Clark wrote:
>> - Bugs
>>    Occasionally when resuming I get a fencing error with hyperlock and
>>    freedreno, TBH it looks like something in the GPU or SMMU according to
>>    Rob Clark:https://pastebin.com/AWjCyaap
> Did you have the same issues on v6.14 or earlier?
> 
> The smmu pm usage count underflow is concerning, the smmu pm should be
> tied to the GPU device via device_link_add().  I've never seen
> something similar, but I'm still on v6.14.
> 
> Could you try reverting commit 0a679336dc17 ("iommu/arm-smmu: Set rpm
> auto_suspend once during probe")
> 
> BR,
> -R

6.15-rc1

I've seen this bug exactly twice. NP to revert but not so sure with only 
a sample set of two, I could say the change fixes.

Anyway, I'll revert and if I see the bug again, we know its not that.

---
bod
