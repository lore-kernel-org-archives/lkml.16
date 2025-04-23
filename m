Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB059460
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414282; cv=none; b=l9/I2lBu3AwIO0dJNPLBx9teDY+pr/Z3y6UDAOaEcXacbcSVGZ2Xyzsye9NOAnijnjeKlRN+QKQD0z13s/pQbY3SHq/3MJsFH8wSReayHEsKinV5BHXen10Q5xylP4hcQT0TMqtg2UKPG9qK0H16iFrzuob2PpFpugCs1yQi91E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414282; c=relaxed/simple;
	bh=SHjWYbn5WkeKcmIqhVF+HHwMxRYFZfSoxCXUjjtCIxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u9tYk20YArjgSM+YI1M6+1M86p+Q9a0lRj10ufTvmNJ7MO57FW1fwh5MchKsH+6dPXxsbJxVruVR+ZUw1rnKOVMkpvtE1PSYg4belKruhqstAsPwtNBF1aJAPhdfSoo0iPcvtXloaW1zHIiAvZWuzlfwozaD5d71v2Vemx/UMqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S5bn3l+5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S5bn3l+5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4654488f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745414278; x=1746019078; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ba5AfVNw33NAfhYW0ZQ8jsvM44DbHtT1wO+n7IyhglM=;
        b=S5bn3l+5xAOr2hPLy7pax5VkihG5Mh+gIzxm1+WZKPlny4cVA3d23b1jRsjJEVqcuK
         e6vm6pb7xSW49UnvhY0HTnfQQRewKiqggneTgmxXAHHxkwWOQOgMSr2ZQoK3OHELcxH0
         K1QZuXIhxLk/fp9e138+42Bxo479S3S6FJjD//2ghqzvxZz3tXyF+C/u3JoZt8vsj+lR
         slsBlPCSZVo3ZJCbEsAbNohpnjuJxYVvACO0BuRJDlI+w1tHUTJN4P5tNJHtesYCDcmq
         sNlA6sYeoWOeLlw8Fv4XOjbkEThpJIRMwMKSAvv9PL4oHAlM51ZNjU10K6lVBtu2qw6k
         wsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414278; x=1746019078;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba5AfVNw33NAfhYW0ZQ8jsvM44DbHtT1wO+n7IyhglM=;
        b=UZ1Az9pENw3k+2/de6+VzK/L5GyDur61CD37PG1svtidttlBa6u9lA20V9WbUkfhbd
         dvOZmkto4/rcFceicKd0QB01cgrUA9q7zDf45wXvYy9/1L9Qh0dxGKf4bozCucXGbQiG
         +ybXc6IeszY+A7SfmK96C8lDPvpUZ3EZGIbz20hpCO7WeWAfmdhXZL1SlKIInTCpxuZH
         JKWGaS+eO4c5v4t5WNQc+/Y2Bi1JDau/Yi6FqSoo0F39or7+b5zOBTSeqqtg5Siq3YzI
         2AxkoFCnX9UP9yBmyDui/bsRIVN22LG92nRqIChnswT/7PzdKQ49ZY/A69biToRQkvlk
         RO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZozAx5T0d3Z/f/2hsFRTf2h9SBWTIAglUQTGs+ZEpR47XDzYqGuxGc6eZwRbN/8xkUdIOT/HoKhR4fjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXE5/MSld3P9HKck5n5EspB+P7/v/NT8nDAh19PVU2jT+UODQu
	eSDDT+UGhHfZLuYJ9y/omex897ldsgCEf/JfaLYSqiR+5KuUWl9qLHbMwpM+ObA=
X-Gm-Gg: ASbGncvZp3ZQ569JMaG5/lM6cOarDMxqnoeaate5kEJ5NqKD86jr/MLQW0zLkF1+17y
	CfDHfTE9zZ0cAy658j0WvM3YIkkanZ6PWpHdiMDZd3zAzb1B6YA2V/AyypX+3lG+eEjDPwtf465
	PfrulOXl0MMIASPueTbgSBzPdbysvQ+nbNjwO5nzDDCbHtu+8zKuVCfVWUZkrBANWL0tRyL+TYv
	g4k8jqd5Y1is2r0n8fNtnwvOWpiOPdapfrJkX2xOFWJhlNO9miE+wcEOIxNHykq/F1v+MKfzKis
	E90sKrdYnjexmfCmjTwdjXOIUq4KTvcTTwhfJ8pYhmQ2sjPsmZk=
X-Google-Smtp-Source: AGHT+IEOWCFtN8WC6LmkUw2g4vml73X+8RArIcZBxgibY4zfqw3U4CU4njM2C2foaCrE7QcWo8jVCg==
X-Received: by 2002:a05:6000:4282:b0:39c:1257:feb8 with SMTP id ffacd0b85a97d-39efbb0a99emr15239383f8f.56.1745414277943;
        Wed, 23 Apr 2025 06:17:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf73:b178:1f43:c630])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43ce2esm19098407f8f.57.2025.04.23.06.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:17:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  Leon
 Romanovsky <leon@kernel.org>,  "Rafael J. Wysocki" <rafael@kernel.org>,
  Danilo Krummrich <dakr@kernel.org>,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] driver core: auxiliary bus: Fix IS_ERR() vs
 NULL mixup in __devm_auxiliary_device_create()
In-Reply-To: <aAi7Kg3aTguFD0fU@stanley.mountain> (Dan Carpenter's message of
	"Wed, 23 Apr 2025 13:04:26 +0300")
References: <aAi7Kg3aTguFD0fU@stanley.mountain>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 23 Apr 2025 15:17:56 +0200
Message-ID: <1jtt6fnhiz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 23 Apr 2025 at 13:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:

> This code was originally going to use error pointers but we decided it
> should return NULL instead.  The error pointer code in
> __devm_auxiliary_device_create() was left over from the first version.
> Update it to use NULL.  No callers have been merged yet, so that makes
> this change simple and self contained.
>
> Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> v2: Originally I just updated the check for auxiliary_device_create()
>     failure and returned ERR_PTR(-ENOMEM) but obviously the
>     auxiliary_device_create() and devm_auxiliary_device_create()
>     functions should return the same thing, NULL.
>
>  drivers/base/auxiliary.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index 810b6105a75d..dba7c8e13a53 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -491,13 +491,13 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
>  	int ret;
>  
>  	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
> -	if (IS_ERR(auxdev))
> -		return auxdev;
> +	if (!auxdev)
> +		return NULL;
>  
>  	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
>  				       auxdev);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return NULL;
>  
>  	return auxdev;
>  }

-- 
Jerome
