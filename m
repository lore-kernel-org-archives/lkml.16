Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346663D76;
	Wed, 30 Apr 2025 04:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745986075; cv=none; b=NmpJ78uAOOH5o7087zszvaQo520iSBKmKDmY/B+uUc62GDtD7wo9LIFGS0GF1jtzgu0cyWKqfeH03xPPAUle7Ip98LRX6d/VorljU9PEx21HW6xD06hr6lN8xZ5VdFDp4EZpx0BxtbsLHQtrXNlgL8d6u4BSBfihsEtQ6PnRabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745986075; c=relaxed/simple;
	bh=Q3RQY8Fyx4dThC2EV3fdJ4rX/123UhKRHtsvH10xIy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jloDVqFNhlY8CxXYbLgUayXGwj9uzOSlFVtgqMQearydwN2cC905E3YX6qfEqAY6jiifHVAJs87uswMIgdnvkgxmjn7Vl5ktXdKKu3fVJWF1OfaBOfd0X2l+GLiVc4FJqxEnA8huOdFH5IX20gdFjBX0Gyj9/Y/7xsv/yVBp+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrD3w3+C; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrD3w3+C"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22c3407a87aso100688455ad.3;
        Tue, 29 Apr 2025 21:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745986073; x=1746590873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy402nPIu4HG8iwHKIzd/cGAMzsMF9UnGh1HtiJ0uB8=;
        b=CrD3w3+CpYYukPtkj3xEOIVldhAlTdMvub54W5y6baHAE7+HV17KybDC016hmTfgIY
         YXRJWxX0mZaxmCtnC2Oo+LQy8lrSyHbzQr5KGkLwKP7BgGLz+vAlvojq+sH7HsN+6dIV
         Esu3JlI8W2pmIBdR/zuep5+wKuDryJkfbPaoKsTbAzk0NcoyZwbK6J77XxE737TV6T3J
         VWo2qWeR0r5f99PKH13F/42Fn9/jxfk5AAVdO5KN0Ct+UlVFCJARl06eqEnOR+GRt1P5
         YFLP1nuaZ4CDsMyQh77Y9BTEjPfNLM28aMw2ZSRxZxbaFIUzNM/QmAZu+hRutJfvqvI+
         Z7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745986073; x=1746590873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hy402nPIu4HG8iwHKIzd/cGAMzsMF9UnGh1HtiJ0uB8=;
        b=eAfmRHwoEv25mxZlIo1EEt8uQvHsaeD9cLV0a/yvcskrG3gfBbH5Vfnnphav3qRImq
         NLMSCldpXuDRjqeTRYh9JgVfyI57a68RyFYUan0fUz8CkFy0hQv4KSmPz3in+QLWTfcq
         Zn93xCG6Xx2A1iDLyRgvY0WvwQ3gZhYrhd/hNdGJaw+13s9M2ZH5rG9f7OtQ2qHC1Jdb
         lxoNNNR5pj64/jw70+Ic49Ik7isp/lncoMhqDDYyAk3j70CLBpoYvu5iJrJtjyssTdAR
         OsksQRNESQ91O9WqFtT0JlULwBOy3ljaS9tWMqqgvkkUzcI+arqjsYJZSzWySqpbMr/I
         6z2w==
X-Forwarded-Encrypted: i=1; AJvYcCUO/PBTJdXhXiQfvyUMkTFM86+RKNWg9XFmJsj6dXOB6vnvpxs8ViF6s9X/Y8X3sKwDwNOFgJLJ7y98BU0=@vger.kernel.org, AJvYcCWOT4oyVgNmYHaqutUwLT5GPTMz9NXR4f37JvDEkU5doKqi16RG7ahjXGo403Brzg2zZL2szsWzYfGG@vger.kernel.org, AJvYcCWbVkCLsLI6EoTrb2r2w76NZZNGZNCl352ubc85uCGDs56OXTXhu3fRxgjcA0L/hG8Q29MhtMaTuKXi@vger.kernel.org, AJvYcCXqac0Os/BfJRwqzwbuQqOEhARY+qHfKSMTnvWo5BLGh7zS30XnJc2obBbunFBmwyB5w9QXzn93b5XblzYs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywarf7q0vXPyVZrYmfgfr4RTUSAe3RfEODuu1PZ+eGF6Ueu9tww
	fQuO0w0+Q7YS1K4OTEhMYVEP3Z1d/JOkVEoGiPPdIUM2Fq5JZL6d
X-Gm-Gg: ASbGncvEFUb4C2JdxLT7UEDthBauAgnRtjkulF8/0Oo/HK3n4+o9RiTMpmRh3ji7pbS
	l2whiE9oQNWXU0lVHoQb2PPcI2uJiIZR/VjxG8NZ/w9Rg2S8ZfEsh1HlpECpo784PB93DgNtLtP
	Rpkc/1qw6/alHnVH5+I6wVNqXp5Aw+5T4Z6ipzXEN9P6B8rxvfKRmbML+JcUWX87ZiGixeLhYLS
	VB3dqMJZjvvJQW+I+0akZ6KD+ajrqFqSuRL+B5NxOg7ZS+qnsf+xdBS4ZXL/D78LhRa9vQeFu9w
	V0Eniq0rrZr3nYvhEeIpXisvMTxYkfsPR857qy1OTf+vvGdbFzoffTrZ9R4OIVS4LQev4w5WBPy
	IBiqe6OkuNXlSvw==
X-Google-Smtp-Source: AGHT+IF3/kWE1+NfjZTNDO6y+20/k64bRxVu5ZoIUoNgL5qcGWZkcSS7X/xiUZrVXrEFp95/kjn6BA==
X-Received: by 2002:a17:903:3c48:b0:223:668d:eba9 with SMTP id d9443c01a7336-22df34a97c3mr31344365ad.10.1745986073366;
        Tue, 29 Apr 2025 21:07:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76fcbsm111939435ad.16.2025.04.29.21.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 21:07:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <759682b9-04b0-4e95-ab0b-e4d584ed6361@roeck-us.net>
Date: Tue, 29 Apr 2025 21:07:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hwmon: pmbus: mpq8785: Add support for MPM82504
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Greg KH <gregkh@linuxfoundation.org>, Shen Lichuan <shenlichuan@vivo.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
 <20250428221420.2077697-3-paweldembicki@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250428221420.2077697-3-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/25 15:13, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM82504 digital voltage
> regulator. MPM82504 uses PMBus direct format for voltage output.
> 
> Tested with device tree based matching.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>   Documentation/hwmon/mpq8785.rst | 20 +++++++++++++++-----
>   drivers/hwmon/pmbus/mpq8785.c   | 12 +++++++++++-
>   2 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
> index bf8176b87086..be228ee58ce2 100644
> --- a/Documentation/hwmon/mpq8785.rst
> +++ b/Documentation/hwmon/mpq8785.rst
> @@ -6,6 +6,7 @@ Kernel driver mpq8785
>   Supported chips:
>   
>     * MPS MPQ8785
> +  * MPS MPM82504
>   
>       Prefix: 'mpq8785'
>   
> @@ -20,21 +21,30 @@ buck converter. The MPQ8785 offers a very compact solution that achieves up to
>   wide input supply range. The MPQ8785 operates at high efficiency over a wide
>   output current load range.
>   
> +The MPM82504 is a quad 25A, scalable, fully integrated power module with a PMBus
> +interface. The device offers a complete power solution that achieves up to 25A
> +per output channel. The MPM82504 has four output channels that can be paralleled
> +to provide 50A, 75A, or 100A of output current for flexible configurations.
> +The device can also operate in parallel with the MPM3695-100 and additional
> +MPM82504 devices to provide a higher output current. The MPM82504 operates
> +at high efficiency across a wide load range.
> +
>   The PMBus interface provides converter configurations and key parameters
>   monitoring.
>   
> -The MPQ8785 adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
> +The devices adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
>   control, which provides fast transient response and eases loop stabilization.
> -The MCOT scheme also allows multiple MPQ8785 devices to be connected in parallel
> -with excellent current sharing and phase interleaving for high-current
> +The MCOT scheme also allows multiple devices or chennels to be connected in
> +parallel with excellent current sharing and phase interleaving for high-current
>   applications.
>   
>   Fully integrated protection features include over-current protection (OCP),
>   over-voltage protection (OVP), under-voltage protection (UVP), and
>   over-temperature protection (OTP).
>   
> -The MPQ8785 requires a minimal number of readily available, standard external
> -components, and is available in a TLGA (5mmx6mm) package.
> +All supported modules require a minimal number of readily available, standard
> +external components. The MPQ8785 is available in a TLGA (5mmx6mm) package
> +and the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package.
>   
>   Device compliant with:
>   
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 00ec21b081cb..7ee201550554 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -8,7 +8,7 @@
>   #include <linux/of_device.h>
>   #include "pmbus.h"
>   
> -enum chips { mpq8785 };
> +enum chips { mpq8785, mpm82504 };
>   
>   static int mpq8785_identify(struct i2c_client *client,
>   			    struct pmbus_driver_info *info)
> @@ -59,12 +59,14 @@ static struct pmbus_driver_info mpq8785_info = {
>   
>   static const struct i2c_device_id mpq8785_id[] = {
>   	{ "mpq8785", mpq8785 },
> +	{ "mpm82504", mpm82504 },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(i2c, mpq8785_id);
>   
>   static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
>   	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
> +	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mpq8785_of_match);
> @@ -87,6 +89,14 @@ static int mpq8785_probe(struct i2c_client *client)
>   	switch (chip_id) {
>   	case mpq8785:
>   		info->identify = mpq8785_identify;
> +
Please drop this extra empty line.

> +		break;
> +	case mpm82504:
> +		info->format[PSC_VOLTAGE_OUT] = direct;
> +		info->m[PSC_VOLTAGE_OUT] = 8;
> +		info->b[PSC_VOLTAGE_OUT] = 0;
> +		info->R[PSC_VOLTAGE_OUT] = 2;
> +
Same here.

>   		break;
>   	default:
>   		return -ENODEV;

