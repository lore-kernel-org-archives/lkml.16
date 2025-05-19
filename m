Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353911FF5E3;
	Mon, 19 May 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660957; cv=none; b=kn7+1O/SIEyWNmOI9K1YdNxorN/il8/uThHl8OXguBfQz/hYm+DuY/Agf+bX/GrOfYeDcPuObOjPaVIGB1JYfXKCbpgjOrE6GvwOxUQsgGAgGXb/jYMtCCGjImeNd/BSATDlhj5HIUQGqfKfwhuXvQGpjtIeVCuSJHJ7eZTcEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660957; c=relaxed/simple;
	bh=h3RirWupTiq3ph0qoBGX50U2KSkdgMd4lvAREh03cdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWMzu1jUK6OG2aA5nXLjfjbrziM33b98TPvhENIRXkAT7L0XqP/xjxAO5ge30cxmwELMUt7oyramgvjqj4cVO6EK+xaMJM6hZKYxA1lbyxEZhb0/T1l5nQ77TgtpbCsJdAISr4zcf8my1uzpxCBHGrVrdC14LAeh1H8qb9/se8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksVFMnAj; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksVFMnAj"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7370a2d1981so3493584b3a.2;
        Mon, 19 May 2025 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747660955; x=1748265755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=85yjgPl/D7hyp3saZ50f5GyE/pfLpFoyJilLZqqr78o=;
        b=ksVFMnAj2A8BjRXyM4asETUdgSG1TvwlmnpLLcmZjkzOygxOrgpypzbWzWzVimICkM
         SOZ43hb3WbRYUh5Duy5QiiasIWBDTqatxIQmlFZjIsYV80MXUfpNZ8uqibVYv+CPESKV
         Sfy5YR7S8laperM9cs71hB5LpxfODXd2cb+FhRFjJCQT6Ee5bQqS/dNobOJNW6CAqZ7g
         mki8iVXSva1fFLnhdvAilOXZZfHRTreHgepn6EsD/aAcCsz2IKqzRlT9CskkeEmIrT5N
         9NWV2zLykhhip5JsRZVVDrQrbHBM7unWlsDYJEKw8uv3Uts4KMjv6B1OAvoJzWDaKcRA
         uQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660955; x=1748265755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85yjgPl/D7hyp3saZ50f5GyE/pfLpFoyJilLZqqr78o=;
        b=W0C6f6axT1DGK3IYPxiJEq/gS5aEDAoDGn9TL57BKKJ8Tm9YW+o4GgJhx0pN2165KZ
         kgqFowhKw6b/B0283GrfUHIjSELh7T6GcVwsOFqikpJhd7PeI1gFkR88XJ25COorHCct
         wBrtQSMeEzXZhQ95fU0vhOho00GENH74S5KOYMns7TjgLIZmbaC2NdzoO1V03ju0rL/9
         q+m8JTRxcsh0IM4OAGUsOHn6LqQ042xR2YOZNDS++X04MlJshLI+/LFiyU4F4ASAW0bk
         LdQitLkknSsjhVMWGhYvjcF/YTRFnIwnfZD+uI/lLWkAQWqwisJf65W+5lwSi3fLtrB+
         mIyw==
X-Forwarded-Encrypted: i=1; AJvYcCXk86+OGMaXNLqNgSn8UIMzXRV+g4Lwx3Kg49+5T16vsvbuaPXfO87LQ9GruAKI7QdPzaSGl72SSdTkRgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwbZdnpyddDra0euYHOia/iNAxvylsNw+9Dw4rwZtHs5PyG9Xl
	yIOG7He3/37TuZehNuCD282kjY/0JFS3Y1oErVl4K9/q4a68B/PD8CPx
X-Gm-Gg: ASbGnctBYc02OxCykmeVk2wsqVdtWHj9Pwq45BzM4t6iGQ5AkTXsWMVCXPgRWKZsBC8
	ce1b2qQmxldMib934Wkd26lID1OchJAxb8C3hxRnBL9I7BzLfPG2wcN0AFUQtsl7PIDPQT+9g62
	pi1v3eHvfYEI6BIrZkAmhPXOsfqJHbVHIMHMwVBqlj9iUlVsrAcbZ3PBG4Y8Jzi9Q7IO3YE1zfB
	34GjLkNhf9DTdyj8jybTN32V/+eXpVTjlmtk2Jl2jR+GeRE3ThhyqOogsm6D1g+Up1EknONCpug
	XpLQiGiw305udaUM4rJ/4hsbd11DLmTOW/V/kGsyg7I36ykrKZi4c+Tx+iuiE2hKto2CtjUx6tg
	dtlJZ7g0yWBxy6f3uxzzGOaRC
X-Google-Smtp-Source: AGHT+IF7dpsS9iFxEyD+PFTOc1/y++G0GTKvVv1kX/3PQ+ag+YlXc933NEzDF01REvu7Jzl6p0ENNA==
X-Received: by 2002:a05:6a21:1089:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-2170ce31534mr18821238637.35.1747660955225;
        Mon, 19 May 2025 06:22:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6fd3bsm6160784a12.23.2025.05.19.06.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:22:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <61b2f38c-ef37-41ec-9102-61903f2f044b@roeck-us.net>
Date: Mon, 19 May 2025 06:22:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Fix current reading calculation
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>, patrick@stwcx.xyz,
 =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519061637.8796-1-yikai.tsai.wiwynn@gmail.com>
 <20250519061637.8796-2-yikai.tsai.wiwynn@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250519061637.8796-2-yikai.tsai.wiwynn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/25 23:16, Yikai Tsai wrote:
> According to the ISL28022 datasheet, bit15 of the current register is
> representing -32768. Fix the calculation to properly handle this bit,
> ensuring correct measurements for negative values.
> 
> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
> ---
>   drivers/hwmon/isl28022.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
> index 1fb9864635db..6d8cdf80c9ea 100644
> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -161,8 +161,9 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
>   				  ISL28022_REG_CURRENT, &regval);
>   		if (err < 0)
>   			return err;
> -		*val = ((long)regval * 1250L * (long)data->gain) /
> -			(long)data->shunt;
> +		sign_bit = (regval >> 15) & 0x01;

Just use (s16)(regval) or sign_extend() [granted, the rest of the code should
have done the same]. At the very least make sure that the code compiles.

Guenter

> +		*val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
> +			1250L * (long)data->gain) / (long)data->shunt;
>   		break;
>   	default:
>   		return -EOPNOTSUPP;

