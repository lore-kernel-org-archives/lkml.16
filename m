Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31B201276
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117553; cv=none; b=fl6QmklE25XG+UYBrRauruFs4s9usUBMEKhqlyM568QdJam+CtbqGBAegu6qZ6BuUj730k3rixswaY6a3vAQqkM+oZAvCNNr6bUYdYnav3IyHrBBemSfFPH50JjhGJmYmlacGmOyQoYaYVvg8s108KU38A84zbIXWGClZYY+glw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117553; c=relaxed/simple;
	bh=OhXqVvV2jok1I00N0CwDqLUrzDi937D39pRWFVrmM+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxcMkfc7qrCxq8UaIklepwXVu7l5Zcz2akxV8Yjm3F7QnVERACVaHSBEXlT7SOmeHwjU567vxXkRn+3QOB7wFQFusPitfNKGkEcdMFVcgs8QtLZgN8N4X8Bb0egkr0fOsa10UWMbQXUTes8ub3npRKr1wNng6zIJzIAkJXi0bj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZYuFzB8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZYuFzB8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso1485555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117548; x=1746722348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=blFO9nj94W2sQqi74hSHTooSl7uV3ZKhQoJ+90nLCFw=;
        b=rZYuFzB8FiWtckj/bgnhaDpCXhGFJ6/uURfyG4LGkhpz3KV3srOZ0lTxrMHN428pQG
         XjI2j+1vcNPEJhxmbHfIIFMpqW1n1DXrBuqKHEP+RARSllrxD7EP2kef67QJxlmIAbFR
         5OfRzWRDYw88LTaeF0cHW7JORxhhwhZ1P5AR7PTJW6j0Vi1U3w76+M5KE9afKiaek9Xm
         dNuQEHBJ/H5237hJoktAXhdc0IBfDyO+qBPyFfJmLRyuV6uGxyZAEwMxF8fxHiEwxW4A
         V/W4wbWCnOqeHsmiOcZhBoNYq0qpRa7Jj9k1cEhDsbJfgwZiRnoBwUAsm7ROR3WbJU3N
         1RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117548; x=1746722348;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blFO9nj94W2sQqi74hSHTooSl7uV3ZKhQoJ+90nLCFw=;
        b=tJR8Jz4dqNflMs/NgmSV7odYqaZCzfUDzAbXw0QTKdzr0TLxMXr3Y4gktuZ/kOTPM0
         6tHP8AZKMv66wg5yfhuUqwQx8xcbucbiMQcGChZcGpZxwU/VaHLynFy1/JJuymaWbsj6
         J5r0D02OzbtkGsEaYTUOgGezz45Pz2YSlVgQATfxHEIlsJ5d6PLnPgkk3/N6YT4Jh8/0
         F2lKZjYWAgmtZwwUGkdtbHh/hUlW5JrGb/vbpGg8LJuu3bZvu2up09u439BxX/pcq4FQ
         F/VkWBarFfHQjPDGqttVckMC7mwx5S7wsF6hKAVQ6fDHtZmRfn6ZmffVTgEFeuZP2Vq3
         DJOw==
X-Forwarded-Encrypted: i=1; AJvYcCXr0OJjM9z9Sk2FXU44SDRp+IA0muuHb95lZJTL5FO0HFtauUVng86H7108k3qSRyIAY34jm6benfpDDfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9XXefcYDWt/n0wiYIQX/Zssx8huUDJJFYiNDtCUWFnHyOufL
	0sBpSi0mim0g52a04T34XyvV0wllZLMjoj7smrDVxi82+5T8ucrINHX+I5HaF5Q=
X-Gm-Gg: ASbGncueYUS+iBU/XKC4TuYr04zFjJ/IOXebQDoQ7UHcuz61y1ZNayKoCy0vWezr6+E
	rNIo+FfAe4PUeMMBpG0cQTQft5yQlOc7JbMhucmOVS0B9MbhRlprr7MlEYEPsJPU14eJTk34Zc4
	C86tIrcMCtjHFjjtPzJbRfm6lOVx0IS0o+fI6Rq7mHqNdmP520T56UDpno6uYkFUe8zJHvhtCJj
	TrxHYe+3VaDyDWmTGK5qmICBf0Az63P1q2WD5psICi7Nfc/L/SwaqLIw7jDCfo/fN+AirA0EEDm
	nVC6OBaKwPLIV1aI7Y/ld44WxyB2S/MhnCdCSEfBB/LjpkJzFprW7l+DUOXykN2itPQxGQ==
X-Google-Smtp-Source: AGHT+IGyNaNrDJUN4KrX6FLJUPQ7uE9Qq/8rComdsxtYw1MA/vRdRpy2qCoOwiHYoDt0Ee2LtLh7RA==
X-Received: by 2002:a05:6000:430c:b0:391:277e:c400 with SMTP id ffacd0b85a97d-3a09009aadfmr2159212f8f.13.1746117548514;
        Thu, 01 May 2025 09:39:08 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a46b23sm1258988f8f.34.2025.05.01.09.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:39:08 -0700 (PDT)
Message-ID: <af3e3007-edfc-4fdc-82cb-38457ba60d3f@linaro.org>
Date: Thu, 1 May 2025 18:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/3] iommu: omap: Simplify few things
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2025 18:36, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Combine patches #1 and #2, add dev_err_probe() and drop the comment
>   (resolving Robin's comment)
> - New patch: iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable
> - Rb tag
> - Link to resend of v1: https://lore.kernel.org/r/20250212-syscon-phandle-args-iommu-v1-0-c3fab486b426@linaro.org
> - Link to v1: https://lore.kernel.org/r/20250111-syscon-phandle-args-iommu-v1-0-3767dee585a6@linaro.org
> 
> Few code simplifications without functional impact.  Not tested on
> hardware.

I forgot to drop the subject prefix from b4 - this is not a resend, just
v2. Apologies.

Best regards,
Krzysztof
