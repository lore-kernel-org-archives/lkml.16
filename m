Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF942288C1F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624863; cv=none; b=JvOY6x4xJTQwK+ZmHMJHqByxMmXOc4c3IojELwTC52Mt0WW6ysmuIGXqt3LlclXYNBLXV/jFA0fvVuxggbgQfmL0qdfnqoJrq63xeAXunJbKRCn7Ic1K8/2wjyKeohyAuZcNOeeU1p1E+jf+oPHK9HxMtSCMEmfqpT7aJPfBd3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624863; c=relaxed/simple;
	bh=bUgRtOSGIIheBXHPUBc4u7ua3sa6xcHfao2mgrmxIH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UV3YDKlVuz2b3WAn7b79nL9mTvxlwbLNC2qD0Pc93NMJMiuoOyAR5inyVHG5uqFMRndlIoXT7exf55Nq9ULSf/Xhir6RzuunzGTQ7j0TkwHML90OO2huRlo9LBRitX2Yg7FVLgY9bTn3Hg0b7FN2Q7//P8Rs7K5aPUZQew2Kpl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PQoo9je9; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PQoo9je9"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-604ad6c4cf1so2201692eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746624861; x=1747229661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWXvIenX/6jiZJInoxV/hkglW1/muitYRDlj1FkN0YU=;
        b=PQoo9je9h7HRk48OeHTcfmCJAR2P1HkCKHP4GQzLogl9K+TuSBlMQ+91WiHT5pcAfZ
         35g27IL2kC/QjO4LGZn5MRLtfSBpt0srFdKXiY5SpnQ6aWe1AIjS/RS3WkJKqP1aQQ3k
         Fk9f08GRdnRrXKRem1vJcm+CGXq2k+nJqUPrPxQhJGNS0MikTw//3kHptHPLQPVt0PhT
         euzDGycj18M61r1/8FOUL92oe6RAMEwO5iGmN9ZG+fUcxT4qMP9iIRnbR9oxoZMMclXl
         7L5SnRrjeXEnNUX49sCc3K1DMM8Oo5aSCp7r2Ru/Atd+4ZkN6jPSq+a+HQeZJmeCfkkl
         cJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624861; x=1747229661;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWXvIenX/6jiZJInoxV/hkglW1/muitYRDlj1FkN0YU=;
        b=rVg2UROeVt75kqy7M4lwtVp/3gWeIAFDIzJUPMTkHHZhBHzHeLMqNVdtVZ/PnWndkC
         OAAC3DtpWPxqLrwH1+LcvEDiEtR7q5bqzkAsVs9AgiMgSmgQ9HybNM4GtGPSJnVXTvQM
         GBbEy04DINtpdsI7ipv6VdNSZ9dciEtfbUQDFl75m10zx/G1iWipZgrsRfq4FwaoMYZ2
         O0okhDJ6+bfrqXh04e6hBtpvZJzcTc4QyXXL4/oEaZW3ZmEeRsSzsszj1uzJe2lQTSsh
         WAbYwiYheiFW9by30pnzeCWYXsKJ8qAsvxpmZGnSwicloUcl1P41sc8+NXNkofSTAjD3
         /wMg==
X-Forwarded-Encrypted: i=1; AJvYcCULNF+03d2wmrg7SGtXhq0cinoa9gQgU0HVsm7P8gvBw/gSr6OThaPc/gotkaizaTLIQt/lKdcwfShQ3p4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVViHmc+P0YBOigPjQjcpC1bmqArYU+COZ3pCyXu7abUoCUr3
	QJqDhRsRQnhm/RS+EpWYGBFufb2OjaSWiZf8gW+sSl7uEPZLP8krVS6z3s/9a0k=
X-Gm-Gg: ASbGncsgXxFnmzlHugotCPIloeCb3vYmPOqOBUFepm+TgkTtZXHELIZfIXwiXocLDu0
	/ps1cQy5dDmcsueiUttJ2aPD6iT/kMD5n+R4OSxi6aCtlUN3cNsF3dX2774ut5e30fkK4s+r6bw
	TsVRxztCFTePiuwWvPUwKypFBIUOV/6J3DLHRNX7Jt56OdvIYVvMEPwXqpwxgLAxO/gKHBWpr67
	usS2WW4uhLALSH0pkOGkbx3E0d84Mihf+PiDL9hpKpbAESGwBbxfjvKrGWI2XbgIL1TEjJQlyNf
	m4lnQq483TSQlJbn521Te58O6UBmui5aGcn3ifOYcHyD76hSt0pTjj22FZuD5+WZ+YuJxjR9eFC
	KZ+/dWtbICD0/Eow=
X-Google-Smtp-Source: AGHT+IFWABUyQ9KrWW43rC0EUTNGG1v3mlrsBmKhdcVlqqM3Amu1ul/RyY+1vnEhszLvdaTDyKaUhg==
X-Received: by 2002:a05:6820:1890:b0:606:293f:d2da with SMTP id 006d021491bc7-60828d850b9mr1960367eaf.8.1746624860742;
        Wed, 07 May 2025 06:34:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3356:f6f6:bf76:a32? ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7db25f5sm2786366eaf.17.2025.05.07.06.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 06:34:20 -0700 (PDT)
Message-ID: <941655e1-676f-499b-81bc-1ed8230cb486@baylibre.com>
Date: Wed, 7 May 2025 08:34:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] iio: chemical: mhz19b: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>, Gyeyoung Baek <gye976@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aBtZFLFlr0slcYSi@stanley.mountain>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aBtZFLFlr0slcYSi@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 7:59 AM, Dan Carpenter wrote:
> Return -ENOMEM if devm_iio_device_alloc() fails.  Don't return success.
> 
> Fixes: b43278d66e99 ("iio: chemical: Add support for Winsen MHZ19B CO2 sensor")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

