Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B357244195;
	Mon, 10 Feb 2025 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203823; cv=none; b=gYtv5hmZsM4+2bJt2UHGatvufJCFA+Ibii/Pk0LJ90JJYcDG14ZlXzkbG1WbrtF4vfoqEb+ySw3qJ4+m4KygerziH2RlWcdusd1U1YoR987xv3XXLYulKi09Eg5UOsLWzW3zSgnNwnXw72OiirZqwDXEvluOfRq2gUYLDGlHLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203823; c=relaxed/simple;
	bh=kQSx4IU/m6R9MPvDY5/22wbi1KGghWKBeHhjKPuP/Sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYPoY6RwIV/d+f64OVBS9a/sovC3OPkZpiDeDTN3I6b2xYm2G7n++drLQDDAbp83TINwsidx/TBIsG7sHMG6EahLLOMxXSP0b0sZdNC9UGXyyCOjiqawWMyp1uJimw//mPprMmbYku/CC0hIM6ZVY5Zy7yCrzWKFeoUfv0eSgfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3JYh9j1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3JYh9j1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f7f1e1194so42457005ad.2;
        Mon, 10 Feb 2025 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739203821; x=1739808621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+TJgYMmTYcZw8reK5LOjccSW5UTYnPTpO1MNsbf/OOI=;
        b=V3JYh9j1FT7usZimTDMOjw9MkWGFyyh1VEQDiRbsFusiHPwsosgo/663GvbnXbewI8
         d5GqDSpD4wg+N6rWt37PqV1t3+JdlHp36rZ5skYmCvdxWX/CQV3YC9O3gdL+1nyurZuh
         UJ6pGbX/VTGgUWbL/xow3hVCrTfW9M8ogGlvmsqtjPt4PCvzxX11BZu+iDQpmImaXWW/
         N3aF0CbPcC5iZ/MlmYZ4p5Z3lyJFc5pRt8fZMrbnH48tTW9OfIs0iVyknyvlEBozzi3U
         FIwvJ1YGoQBCc0hokkY5+Dg87+6xjAeqi/oooA0TGx+Jl8BAq55+2YP5UwG5/qASlt8T
         44NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203821; x=1739808621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TJgYMmTYcZw8reK5LOjccSW5UTYnPTpO1MNsbf/OOI=;
        b=aDVWZKXjtU/WvA6d0bFx2LNXA5kIrhHLDyLl2k/c5fcWwwB6aaSpDcwoi80nc490hO
         ysAaITgN07Io9emQEGTLctqlZcKdVikTks5CIpxybtLyCoZobbpbGZw+xgxs+b0e0ZGo
         ThcsRdndW283D91hFLezQdtQ9ERw6l57aHD4/s4k955DlQ+OOsSxN3hwfQG2We/cj+9/
         ptO7YwWpkpQ1J4FJCsrFeiQ2yC9kc3dmG336BYXcDPCKvXSWNZUsNgY8j7SrEEdXrDPt
         914xKXLQAGuS4qgFxV9Ts2R7Usae3tgdbTW36TxGPAx1A6GLOouJrhhKlenixW07+uY/
         ZNjw==
X-Forwarded-Encrypted: i=1; AJvYcCWHaC0hzMpHpTHc8K6kBl3XTZN+8Fd5ydn6kXQ56uiFmP0VOFpu67mg12+sfXgv6BlL9UP0blW+U9CjllpD@vger.kernel.org, AJvYcCWVg7DakAnuEubJS/wE/Z+Bogd4l7U3uf4oGc4BIP744/M3tHWiyvNCS1EJqiUpt/8/3BIEvvj0rs/v/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbO3cJjQ44ganDS7nsnk7Y6fA3v2bN3SGD/NSmr6o7AwE72kqZ
	Q3jC/upI0w0l8Dq5H0LcpLo7TjTKSUtwr0b90LaXAv0l4CaFuz6L
X-Gm-Gg: ASbGnctx2JSM72Ogi8qx4SNZQWAzy1os9KzM8UALYgIm+SmJHb1yNvhxPtxozKqdNfA
	kfp7vtrbuMAw6rALQyEjSLy25dWM3VTn54xy9tB9A8P1J80SI6a/vs/h1TMRqmxpS5mQBpB6Foi
	zmTsqTdTpLNhNvIn6kl23G2jpRJauV19WczD4d5xSa53QYLDLW7dgpXDQz6khVwxQe89Yket+sV
	nCwJEEtj05GbZYfNvvAOfgSBxJTEUmuzlkPGbpBnK70Fzzsaw5nz2b98KmqfoExbUKKNRhCEuRX
	lJNVRluRpp/xGMzSci0/ApjNfqaMpmyl/1G68o2pN56ejHeU3LlYvvUrE6e4xlOu
X-Google-Smtp-Source: AGHT+IHcwFTzmEqZWtoeh7mWEArFs4yJg+WNPnZYC2w6JCoYCAfFh+25IR89qFyLWfT2M7UzYZ+kfw==
X-Received: by 2002:a17:902:e802:b0:21f:35fd:1b6c with SMTP id d9443c01a7336-21f4e76372cmr225654315ad.45.1739203821295;
        Mon, 10 Feb 2025 08:10:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c997sm79890705ad.78.2025.02.10.08.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:10:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <637e2e72-2799-4914-aa96-9987edc1bfa4@roeck-us.net>
Date: Mon, 10 Feb 2025 08:10:01 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: emc2305: Update cooling device registration to
 include device node
To: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 viorel.suman@nxp.com
Cc: Florin Leotescu <florin.leotescu@nxp.com>
References: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
 <20250210073158.336522-2-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250210073158.336522-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/25 23:31, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> This patch updates the EMC2305 hwmon driver to register the thermal
> cooling device with Device Tree (DTS) node. This change allows
> cooling device to be configured based on the properties defined
> in the Device Tree.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 4d39fbd83769..18e765902d32 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -293,8 +293,9 @@ static int emc2305_set_single_tz(struct device *dev, int idx)
>   	pwm = data->pwm_min[cdev_idx];
>   
>   	data->cdev_data[cdev_idx].cdev =
> -		thermal_cooling_device_register(emc2305_fan_name[idx], data,
> -						&emc2305_cooling_ops);
> +		devm_thermal_of_cooling_device_register(dev, dev->of_node,
> +							emc2305_fan_name[idx], data,
> +							&emc2305_cooling_ops);


The use of a devm_ function means that

         for (i = 0; i < EMC2305_PWM_MAX; i++)
                 if (data->cdev_data[i].cdev)
                         thermal_cooling_device_unregister(data->cdev_data[i].cdev);

and thus each call to emc2305_unset_tz() will be fatal after this change.
I don't mind the change itself, but emc2305_unset_tz() and all calls to it
will have to be removed as well.

Guenter

