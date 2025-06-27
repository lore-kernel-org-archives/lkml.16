Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB102EA495
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041824; cv=none; b=J9SKxuIYSTxQ4skWvS8VhkErwxaGPgWnUW4TLunKhDMsspcv6yAhYIDNT0jnhMrVZ2k1hx0mbX5PfU09Exd3BWr7U8A3rL/ihg36TCkoXgNeTewb8I9A+NfTG9JTnmWhxrz7NQBz726CJO3XvEx6Kc5beMmKt9+TxVMl8tn882Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041824; c=relaxed/simple;
	bh=+ky15PA9sAU81b8+V7nmFYxwth/v2pUQufrrrH6DTSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWpUqZlIkchVH+zLL/3e0fFBMbEOAPzVVBD1foc6yMhZQeTocmyp5MQfjyGMLPnvzEO+cVfjyAewAuwQ8UOmGF+aiTTWjK1GW4YRraU5UBtsGho+8bix+/FMKIP+aiT2ZLC9XJ4tkv8dekYtIy+ee5fIQB0PIBdv4abWlEjuqv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3ju6iLw; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3ju6iLw"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-453643020bdso21333195e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751041821; x=1751646621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMfsTlgLNGWbyjCpDV2kNGIGNepZ5m2Z+f7NA8cGiMI=;
        b=a3ju6iLw0ZHfoLG6cZru2H0lhvbNIw1nR7Vy73N3HMsS04XQUMiGpx52+JWXqofAXB
         cZv/r1tFU4BkfExWCCITskeMRvYA1JHcHFiz8YVAvYBDIB14Qg1jXZqaSsTQp3KPSRql
         Erybc5dAYUMmKI0lxVrohxgwlRL789vnOtkOE8vNT5vrbkgOT/+VfGrJGCpHZzad0jBu
         XTcaQEcGkH599Gwi8wYMS6Lqov8Bcf5LN8kL7Sk4dbv8pWLpJz1AV4i+w8z55RAYSACB
         7vDz/+z1aU3pHEDSdDZ0lEkD3t+PgjqFiTqKImsZOhRWqINX6oMgE+UmfhjZvszolUsq
         ucmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041821; x=1751646621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMfsTlgLNGWbyjCpDV2kNGIGNepZ5m2Z+f7NA8cGiMI=;
        b=UPjxJgM4Ro6cLW/qTfxK7km7KQOnwhM1R8JCshRNnzdDimp7hpLRXvBETlxhZB8wnA
         J9L9UDYGT28VvKtQ5TMZswU7k6sou24M3QzAVThBMqwzYLshah/R7P9UEY9sLWUJuJxF
         iwWS7sDaw0STitR0b7mV8wiMtKdC+x8CKiynH90qXqDVZ+tfq0t0OWAXNx9upiUygRVC
         6QOkO4MdmgQ+LSzvqDJcVonc/DJtEATmEr5m/RA3dcu8UPqhlbhXeViupzhC26pagKMf
         9eP+kbvFcnf8/rTv7ooWvKFN0r4UoocB1P5m3C96mb0yubwfIrsvZ7Hm4FAM3b88lYXE
         YJfg==
X-Forwarded-Encrypted: i=1; AJvYcCVr2HD9PGaM9mURno21vKa/bB/76RNsLlgWbTVQCZDshHCdwcfj6TWphosHvOi+zydcQKXSak4S3y5VHJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqefkIrB7lVDyYlhyw2a6nOhO1KnnYY1TsNPOkY+q0lDf7TKT
	eirf3P3H5WpRrJXct1EuMQVW3IUZq/23PVsZXqROR61RDFbHjFE2hpvUwrM/03lvrg4=
X-Gm-Gg: ASbGncsFfpScQm0JQmSDbGMOa+yN+4HdSA2EYLiuH/WkXnVAhYmqh4nRxwxZicM7dtG
	+i4KNEJURPgMSXjvv1NXzvgE0h8McUdP3DxfWVoKVmCXjmy9sv/gmnMHCXYFZx6rbaNWBmD/XPC
	8ahmNlfWhtNh+jpjeL4cV9Ete/dCc3BiTqpbnu1FYglvgmHSp4ACh19w3iOtgdjXV7yvGbNb2yA
	4q48PNu+hO/zs89d+9+Jr17wTnH6B+N7bSEh8WbNgX6kbr63ClDibizBGHnqG9hD/Oxus6MIrtf
	p+ZzXIixbydNvFX5vYSzeUJ7fKK54jZyyHog1FyPcX9stLesVvsFz9SNBSKDtscFk1DbQPE8fQ+
	k8czRTZPElGviogf51RN52ZGbEL0=
X-Google-Smtp-Source: AGHT+IE6RvCylbJtuXzitjd3EIhVHVaEWYawghuzYHxPMnQLEtrSpXpyi025NQRd8ywU2ZWXXTQ42A==
X-Received: by 2002:adf:b64f:0:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3a8ffcc979fmr3582621f8f.27.1751041821125;
        Fri, 27 Jun 2025 09:30:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3110493f8f.24.2025.06.27.09.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:30:20 -0700 (PDT)
Message-ID: <306223e7-b760-4d37-b5d2-ac04e3c98842@linaro.org>
Date: Fri, 27 Jun 2025 17:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> Changes in v3:
> - Add info about change in iommus binding (Thanks Krzysztof)
> - Link to v2:https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com

Hmm.

I would be nice to see what also _wasn't_ done i.e. why you didn't do 
what Dmitry was suggesting, IMO that's as important as stating what you 
did change.

Not a huge deal you explained in a response email your logic already but 
just as suggestion for future, I think its good practice to go through 
each point and say what you did do, what you didn't do, perhaps what you 
tried and then decided to do in a different way.

---
bod
