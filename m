Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028D284B35
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434773; cv=none; b=nMLHhNlB++ykosks5tIF94IqURFnGKoy3lG5ug/a/8vQ5G+wheEJri0IeVovCA1ApxNdZ31rOeSxElicM+lm0WHGkoSnLqn7c0M3dUb4KD7VLJygkgKovRZq8vTRsWetW2bhYxO9PNp2aABR3IK2I2Xm4FdBC4fGOiug6KVHk2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434773; c=relaxed/simple;
	bh=UTy+PEU7tr0mOQr1WcfZgDzuuEmIiCfQAFSll5QPB9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw0XrxgSyIu5v/mMJHbmmrxDiC7Cl74aLcPRuiga50shjBcWTDLHt4cuX5hZVHJWpf9baYumUTPnsH7GHNd1BOPpWd0qOrmGVzIUcHu066mlpqcRk+SZWtF84/ZkUNZcZAGGmsSnz1Oeqc02DV3A9OtdwiqL2L7DqtV9/MAtYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kLTei5vg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kLTei5vg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6045b95d1feso7544590a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748434770; x=1749039570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUs1WGbpbtSdkN7Nj6CphSlTzl8HeW1Wjos25VNHfcc=;
        b=kLTei5vgu21+KKSJf3ODIz96GYG117NrrT6qfl9k2/mzeS9baqjonSD53BfyJ/8ENl
         oyN1ajvts6hopw7+BxxOXmV4KriXwyGJTyIUCePFDSkiC+8Jds3OGWKcpodX4TtG8ib+
         tX4qEdqbKD3ljMD6zmGAlhVb7sWBX0GCN5bwHzeVYVbF7mKn2CJ18hg14pPIFayaAz4c
         X1JbZ2AGhZUDXtYFxRtLwC6aXrJWw1WCuXH8jgWWdYdRj+xVujQ9d0PcdWkAJCuclCk1
         kndcUMQudzKC1hiPkesJR5wTy9Tfz8fniYn2zn17YKbMGjEo0kdn1dMCwiRSYjnnZf9m
         Chew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434770; x=1749039570;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUs1WGbpbtSdkN7Nj6CphSlTzl8HeW1Wjos25VNHfcc=;
        b=PgX3or4dnHOLd6FbebFj4UGGnxtprWnl36bJqTBqfUk30HXi9B2riMI4owoaKnIOlb
         hQLhcg99GPE68cGxKGBAcQ60XquGoYOoasXP8nPtH7hfgLdA+5SuPrclOhTODE1xXBVy
         oJzTyqoXdDEZW/xjp44jibyr2EMv7HMr/JeknxUhn+fXoEZP85T8Myy4e+5Webdh6Zl3
         rY8yWQaPQu6yHt1K7y2alepQe+i5jzwvfH5uzLuCZG71IIWoz3OIwHSY8g7wELOBflX9
         N0eVM5BtRtb+Iw1JBQu3H2j3k4Sl+L8R9vq69by1jpgDYw9zXalIrqIv0Kr2SGzahWaU
         cLZA==
X-Forwarded-Encrypted: i=1; AJvYcCWvTzuEukt7fCWwui6WmOHxG88pAAeUIkYySstziJX3E3rjLdDRg1+UbLjtB5UmC5MWSF8DCDjeGCnbs4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xN3J4/hscPfEehybpDlm7V5HLeBZQzD5OjA40tiJCH/orQXZ
	vtX+46UaH7QEM0+p04bds2bILeIdAr+QCS35YKr6HOuzoaRtWwFNNeGUyDcVeYr1YPQ=
X-Gm-Gg: ASbGnctkLCuesIeTBRXJpw+PsD6dIsoCbC81Qf5fU16TdhSFPhVqklmt+hW9xQs/uee
	jNhbjW+sb33mxIQcSLu+RJl6OpQs/BSYvhov4ksDm1frXfMvcPbyrQ6KCGXHSi3Z2Uvu8H1oSlO
	CgUb9tmv1rz5xL+AGhYkhp15aNf8SlxSvNSDvdlYAQm40cFtZbOxKQhmXyaFUgSGybI8VeigQtm
	J+rN33vNfVU9GmZ3Dq7jMFMCHX36Ga9b+lVvnFwlWjigQ7OVLcnEFCSK02Fo8dmliqyBW6vWP4C
	SHQwRBQ5etXzfTNOo58j55tuGV5j4QzF7AkZChmruUxPBkcaCf7jhc1c09Kt
X-Google-Smtp-Source: AGHT+IGGhc5A2T3ca464ACVEsiUUFLDwI1rD81PEkeAvBkW4x1BJfuPs5Bg5vFJS51y64CfcmLZiFQ==
X-Received: by 2002:a05:6402:5113:b0:605:878:3560 with SMTP id 4fb4d7f45d1cf-605087843demr4023398a12.26.1748434769848;
        Wed, 28 May 2025 05:19:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9936sm706164a12.7.2025.05.28.05.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:19:29 -0700 (PDT)
Message-ID: <8bcbf37b-b70d-48e3-b435-a097d351f786@tuxon.dev>
Date: Wed, 28 May 2025 15:19:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PM: domains: Add devres variant for
 dev_pm_domain_attach()
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 len.brown@intel.com, pavel@kernel.org, jic23@kernel.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, bhelgaas@google.com,
 geert@linux-m68k.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
 <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com>
 <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
 <CAPDyKFptNg5t6RehRNNfnnuCqpfiaQLaHBEdh4aRXfn7X6rYQQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAPDyKFptNg5t6RehRNNfnnuCqpfiaQLaHBEdh4aRXfn7X6rYQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 28.05.2025 12:31, Ulf Hansson wrote:
>>> +
>>> +/**
>>> + * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
>>> + * @dev: Device to attach.
>>> + * @attach_power_on: Use to indicate whether we should power on the device
>>> + *                   when attaching (true indicates the device is powered on
>>> + *                   when attaching).
>>> + * @detach_power_off: Used to indicate whether we should power off the device
>>> + *                    when detaching (true indicates the device is powered off
>>> + *                    when detaching).
>>> + *
>>> + * NOTE: this will also handle calling dev_pm_domain_detach() for
>>> + * you during remove phase.
>>> + *
>>> + * Returns 0 on successfully attached PM domain, or a negative error code in
>>> + * case of a failure.
>>> + */
>>> +int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
>>> +                       bool detach_power_off)
>> Do we have examples where we power on a device and leave it powered on
>> (or do not power on device on attach but power off it on detach)? I
>> believe devm release should strictly mirror the acquisition, so separate
>> flag is not needed.
> This sounds reasonable for me too.

Then I'll drop the detach_power_off in the next version.

Thank you for your review,
Claudiu

> 
> Note that, in most of the *special* cases for where
> dev_pm_domain_attach|detach() is used today, the corresponding PM
> domain is managed by genpd through a DT based configuration. And genpd
> via genpd_dev_pm_attach|detach() doesn't even take this as an
> in-parameter.
> 
> So this is solely for the behaviour for the acpi PM domain, just to
> make sure that's clear.
> 
> [...]
> 
> Kind regards
> Uffe

