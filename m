Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D51E9B09
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001459; cv=none; b=LpKnOwKsktzqIGcL/59ILW6kyo8rbDykiIaemwODspzgRMHE+DXhKgeNefQgcVkDXOMiFLBP1RIfxXKLwUopriFrrriEEvKVK09SURBW3ni+FvKGhxJP2My8yJQybPY2ht0pX/qAYFnLgx7nZd+FAU9OER0wx/bJ1XTMTp/TdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001459; c=relaxed/simple;
	bh=jE4PEp33a5PU1lnBYNlqWTkmTy/oubM5i2hDNHSJbAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1s6uMXjGR8ZQXUUYi7J2fvg0poLVy1KDSm1WmztL1vpPAkZY+u9D1Dora4vu7aEJJny9dHVB3eaVL71obLVQjOZleGkvtK72y9wo5CYo4K8uWBo00Nv1ws1He7FzCvraTpJ//WntedX9QKVjJTyj22QY9QoAPCWSQ8o5qpXU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MT6BVCvi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MT6BVCvi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so68227355e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001454; x=1746606254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufqPEbOwWYWB18ZCf6Yh3nDmouH/kkXVRtJyRpSOlpU=;
        b=MT6BVCvi4SjxHWopj6rBSu7AnH/4VuaLDr2PkcC/8L6gpfME+CZDsRgjnx/MDxpX1f
         p97tH65b5RveQsOu48w1vURisczLNAotr/jt/Q9SfEWk9mgFTORUfzz+MLUa6B9nPkoX
         ZsrdCC5gPY7/FhCRgZax709889dSGfCo9H+gvyG9z3nr3jwTJgEjJYYHuEAnoYDDTXvu
         jwDX+832UnaLyL44zHbV6nhpGSfiG7bY5RTCcKCa+mZkr4X60w7F3j5+W9SIn4EzQTdd
         T606BMMmZc8vcT9+/FoF1Y/1gIcVMsqwotdI2Y3tKrC03I44+/QIzLclNONGF72mKdwF
         AMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001454; x=1746606254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufqPEbOwWYWB18ZCf6Yh3nDmouH/kkXVRtJyRpSOlpU=;
        b=llK4jJPO72p1lb7V/jEZTfR9aYQz/NP4sFTdFwmnAulxF4ncPoIldY8PTlMXHPhJG8
         FkCnr/ApKLbPxB0nb9/urvqguWrDSETd3E/QLMefMy/BVNS21wB2yHzQcdpI0ofK7A9X
         Rm1WjQVItKjxcdd8A/CcPkrFB/I+ouPpIa9aeyBpMjPyQf9I+UjK1wOe1eYe0ZGEmeo2
         YMcE7zOVk79/LB+rbToHo7HxarWFN1go9qy1L3A4QCAwqz1SzhOPeYQ7V4a89gVC6U+V
         vzdEfVPvVPIXo//J8zV2r2Yo/Hx9ld/Fu6IJi0fgNpWQqscgrfVlb3XfWIEqO2gauzzU
         jt5A==
X-Forwarded-Encrypted: i=1; AJvYcCXL3qH5//zvAQeczBorM9jvTvXBu1cyudPYFp6GrWR7+NzkUe4H2cdtk+W4MInFOpyo4Drg0fExeBh/38s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEzP+dLQrLNWih/eAwDtTr9S6i8WeiOdF2aiJiN1bc2Z3Rw6b
	U8SCfZu+7eHh/ozrJye9lBENP8wi6+85GupyyyGy4l7LIbSntb5uCtQK+baFlXk=
X-Gm-Gg: ASbGncvjKQhlHgEcwkSiR8FLLZYUGqGW/mHBCFU6e4ni1T8njIJ5Fl+yZXZTNHK4JBG
	DI+IeJ2IaRKB4K/2DxkJt/phjsyeCb9WPo47E7537aqbt+4s8mjJ4ZQUSXvVSDq5kGyvrB9jVd+
	XMzXuMeUV3YLM0RDO72SJXmDNM+RTNf5mBEcImCVQWDYSbNTJH1uda0kNieA8n2GyG9+oY298s4
	iC8sPeHRBpKtxJVYqndnHU06fZdc3ixK9YK+8ponBgJJyDCl265NDpVGXpq7ZURmRgdXPJxKTfb
	0BVn7XMbnN6u+5K6ikCIbBFLly+blvagEL8GCNgvyQJaO9RAFzSagMKP95QjTsMnTZPWZIiB4Bb
	BmJOT1Q==
X-Google-Smtp-Source: AGHT+IEC343GJFUazvyxQ/kBdVhvDtloUR9+rS6OZvl6aiNt5CYM4RgWteI3bMKGtRqRGwvmyMmn9A==
X-Received: by 2002:a05:600c:3153:b0:440:6a37:be09 with SMTP id 5b1f17b1804b1-441b1f3865fmr19065115e9.16.1746001454638;
        Wed, 30 Apr 2025 01:24:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bbf046sm15474325e9.35.2025.04.30.01.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:24:14 -0700 (PDT)
Message-ID: <c2ba9738-a383-4a53-a7ad-fc65a97d1c4a@linaro.org>
Date: Wed, 30 Apr 2025 09:24:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Johan Hovold <johan@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aBHQejn_ksLyyUm1@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 08:25, Johan Hovold wrote:
> Unfortunately, it seems Bryan missed that this was a regression that
> should be fixed in 6.15 and only included them in a pull request for 6.16:
> 
> 	https://lore.kernel.org/all/20250410233039.77093-1-bod@kernel.org/
> 
> Bryan, has your PR been merged? Can you try to get my fixes into 6.15
> since this is a regression in 6.15-rc1?

Let me see.. there's a -fixes branch, I think I should be able to PR 
anything with a Fixes: tag there.

---
bod
