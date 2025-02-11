Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677101EF085
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264037; cv=none; b=mr8kQY57LAB12by8XO4seQYjFrDX2hdcDg5f9vO1h5dOT2PPq2ECVofXcmMBrh0Uuvf2VwN2FBGt9hAyZso9knP+ImaPOjbG+FYPXVNUtRPntjM7srnTJhbIkCkB0EnNsYMPXR7HAcRD5U9AZvmW1AhO1MISg4vLAvxNSJrZYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264037; c=relaxed/simple;
	bh=E97S9Di08n2Zwttga37TWY/Ab91xIrEIh6c+b1GeuY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBdRJiy1gk9B4Zs3DEgeqczJAACC/M/7BIrer46XQkv31LSRHQdVazhGBkQv+yQWaC64zaAAPVrggvRXwy3S4agCrzxqG3Lmhyy/9qLz+RAQgnNQejL3uPbCew5DMGsAuu9dPp9f3FmhY56ZbeGHsTWCvLh/lC7RF9uthEhyZrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BAn9ulat; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BAn9ulat"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so3450545f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739264034; x=1739868834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wn7f5KmIzBSGwAjAxMKL/5WhoZoIiEa6FOztIQtXGwY=;
        b=BAn9ulatUqXcxf5V04lalC1ewJcwtpz8hrCdhp0XwtMRy48Lnt1yVKJpPnLg5HIsCr
         M9nj9vwXzE3f5Rr7I21LV8hPH4KiKqLndmPQqQsIHWptP9IcYnTfmSdjPdy2BPfNwJlx
         VfamofOv+2+xzF0ymRcfamI4XqWCeKhI7NWvVEUftFHDnHD3Ru9Kd8T7aJ/qcFYaweRM
         gTfS1gRP3wfXiBueqFZPC5ilWkL/EqgiyAbYyDzMeSJh7ShN4AO+dyFHyjiZQqI6MQoD
         idR5B7mkS3SJ21QqCJfhBuVunNd+vlkMWcba6MR9qXboHZjblIHqlIp54nByrqMll0ag
         kOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264034; x=1739868834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wn7f5KmIzBSGwAjAxMKL/5WhoZoIiEa6FOztIQtXGwY=;
        b=OoqkmnHHHI/zIsNdkmtZNML+PrSkZb7sYX7vA2Zz4QB/YFbVd0y4SMpkv7NsdMag0R
         gWLdhSVXw0SO8cvM14FlFUnyN8zbS1hYwW79U725ctnd1qLL/J8Y7K8HgCQy39olqeO/
         MMf2c2ilwa7enF1J3pyRhjrwQMyCUEbhV2WfEb3OVMjy6Im/tLnjWEYOnh9N6UH4J4Hc
         JBfS4jesQpI7P9diEe15+Ix7tu56xTq6lcfByHVaMDxZVu7e4UokQLuR5KI6YIRYeef+
         nqlnNu7x5n2BeKKLJUqvL3PlpYRutBd/pEHGtClQn+27b96MDw7UXNpQPTklQ2qPLwEu
         rKZw==
X-Forwarded-Encrypted: i=1; AJvYcCVJRq0uwpedxs1t+h82Ru96s6upjiMyLcQKLhRbxuGxuBp1JWEoQwJGXxXmueGvj8uff+mdD+HkNFTByNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHBPrpATh9VXnLJ7+19Pn8KJh3GFmSSUqYuwfkcLJLawB//GZa
	NOyyhqn2lX0XRZfu7ixlQJPEnoByM6DP4vPN76r2fHbjA2mlSQssuA1rWzzBGYg=
X-Gm-Gg: ASbGncsumo0Ig3zNFGOqln9xhlO9LN6NFiRt4zutbaflVrMI9nu0CIa1Lk/EKTciF4p
	zg2FaszTb9GQcjWwkYp4I0LXko07d9y1v381WiHAKl22E4KASOC9PrT9g9czroQ+xiXwhHsuebU
	z2z8XzOvcZIhfCIgasJMltqbbwqK0QUcuancgpk7uwywmWonpBn63Yhw9etXBcDAQY9MUJGDCCG
	RejgOd63ELSDd9YM6mXPjfNOJBZLP0ZtTP9/Rlnq/dBYQxdDWk0sfLdxCJtDwODohbM4CyJlvIy
	iezaW7Vy5a5sHCQ+pXfuih9xMVEHXAnl9vQUgyi+cdSiygRwjV1DtA4=
X-Google-Smtp-Source: AGHT+IHJl8az0biIroaElZQMVe7CvDinXzmDIW3C9slxWarkLuaunRbzDNQ1/xMc93YOJwVs4z36yw==
X-Received: by 2002:a05:6000:400f:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38dc8d985c8mr12045557f8f.7.1739264033847;
        Tue, 11 Feb 2025 00:53:53 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dcb4410e6sm11284454f8f.8.2025.02.11.00.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:53:53 -0800 (PST)
Message-ID: <843953fe-4c81-4176-845b-0ce9ecb0f84e@linaro.org>
Date: Tue, 11 Feb 2025 09:53:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Thermal support for BCM74110
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:BROADCOM STB AVS TMON DRIVER" <linux-pm@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250116193842.758788-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250116193842.758788-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/01/2025 20:38, Florian Fainelli wrote:
> This small patch series updates the existing brcmstb_thermal driver to
> support the BCM74110 chip which uses a different process node requiring
> an update to the thermal equation.
> 
> Florian Fainelli (2):
>    dt-bindings: thermal: Update for BCM74110
>    thermal: brcmstb_thermal: Add support for BCM74110
> 
>   .../devicetree/bindings/thermal/brcm,avs-tmon.yaml    |  1 +
>   drivers/thermal/broadcom/brcmstb_thermal.c            | 11 +++++++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 

Applied, thanks

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
