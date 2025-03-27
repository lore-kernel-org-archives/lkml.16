Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FF91DE4DD;
	Thu, 27 Mar 2025 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119356; cv=none; b=Kct9ku7UkG7IvyIX+1a6LSD988bB4T8Xxx3mprdBpot+qrLZL0n0GRBjJRR1DzVi43CPGOGbbBLmQlxCtyjwxx+x5l/LnWHxzDsWQpvHZ26t+xxaohT8Wqz5P3yPPiaYegkCG9AcWDoJgmbsZJkCvikmOfGtidmNG3trFoOxLEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119356; c=relaxed/simple;
	bh=wds/SXwWp30qjm1yP1bfXhyuI7L+kRjLXGg4fB6peYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XpvkPMcf3zV/VCwOg3uJYoGBjGln+irwZlEoiMfOFeKWlnh63kXUU118g9xgdNohWlfX6aYPuolar9WxMys+WfTirvk2RDD+Z14lbaSkE6CKOXnntJbPuP/xFisBRCT49svDIky+92dnV+zkZWFADGPKWokTQCaTv4rFRKJq+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEqOcq7T; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEqOcq7T"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22403cbb47fso35851995ad.0;
        Thu, 27 Mar 2025 16:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743119353; x=1743724153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bDhjNnNoWlhtFHtM04RQD6tTe1//X7iKSustfb43rJE=;
        b=jEqOcq7TFUSwpfiJ+t4IrK4e+HjDr6a/8V1nR0ltkmieS7EyoMKYC+pknwprrbLCXS
         XoF4uovwMwBUFTPVTecVyJhoe5K82O6hNxuUQ0rqg+ucCVU9OELZLNiTnO0/R7t8uqdu
         jX/2oizc5o0Z57TYDUB1XNHVCNP0QMeJGzDxx5wi5gL+x58U6i9k+FF+LHUq4Ydqb8vG
         ljZyZoDuXPGql2Q0ltg9Buy3G20A0ob8hyAgASWezhgE4xWKNcc/XrbrSiTfetraYTcV
         0VUbs0bkVq2wQhIvBaSnpGWK//PyM91U2MODqyq75a3a8aDcQhgWsiKlVSGaGU3PklVC
         MVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743119353; x=1743724153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDhjNnNoWlhtFHtM04RQD6tTe1//X7iKSustfb43rJE=;
        b=kj8efckw/yi94hIKRfL4WAsOI5AKAXMWgXyroZZOK3AS6sEYlBl2/BT+fF+vG64aod
         vBPuBO0RDw1fOKcyOAqKQgdM1Mq4q9EWuLkpPVlOHHw1/mQSD2pC1XmWpMvz4w+pLueU
         XfmNOxJR3z9zyGsfU7Y9JfzRgkwyUkDL5mOtlp+4/A1o3JE+Ft2U6PU6GnJxadp3zbPi
         N6dHXMBu6IoQ9KscEydvVa/WDW0R5zT4nnoMOws/kNz8Lt/L26VWlqGvNy8VtzmggD1+
         U9TYtacOPhcr/b/3pnFO0eBZygvbSQveI00GFXw7zlp+xqpYw30CQYQToAnZjtz++cRa
         8ZMw==
X-Forwarded-Encrypted: i=1; AJvYcCVWOnVgNqeYAkjAYbAiP6CaNQWgKz6VXD8p2z+qJTb1a6INu4jPlUEySnweIuyHJ1es5YPBAXW4phkfZKWh@vger.kernel.org, AJvYcCX/wX30n+ApNkiPIavurOVAsoWw5yBIQqeHVSpZLxRml+C6cJWbTXGigc1IyZqEmvu42QF+GeRGUivF+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIi7kjTWuvMxLXv0E0YLhZWXy2C3zS+z4ME7WtWeaQBPBhFJK
	WcQBrjZrfvipbXFw8VvWNrGEMZ5V19pGDJNmvASKeisYpA3ohUfc5d+rRw==
X-Gm-Gg: ASbGncsDKSp4WhasDYDKFcRVMy8m6tMv1RHAsclFIDcQD8i4eeuIXVtK6+3PcI1bLus
	YABt4NUgfuRwlUDq9BW1kJHOpXGjcM6K0BYlFYZzy8SZ6setY3nQaxSplgZejgGl9LBBT1Uy8Dw
	QVf64OKjRCzSV47gC+ja1f40szeAtUZY8Sv5nHIBLyUVf2IzBDcGo1GSdNxX06zOorqQNj7j0Jn
	fmzQTLjtOaAq8bq8H8orom4SA1DNTsznZ3ZwgN1gBMPc0mWWnhKVZXINt92uw9vzPoC/yH+1lB3
	W/GuAZFH3DN3Vq8Fw9BOQcYnDlZUGkANfn2cMtqQYbh46CDi9a17jLAUAbLcs4z3vT4KUYVoi/L
	4O49I/j0Ctm+PJ+OqJg==
X-Google-Smtp-Source: AGHT+IGmMdKnzet99MyKbzBBEhKz/DAXlZzQYHMp9/yrgKte0cqjo840PoGISPo69hKm/kyQ1N6D5A==
X-Received: by 2002:a05:6a21:99a1:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-1fea2f4cef5mr7721402637.33.1743119353101;
        Thu, 27 Mar 2025 16:49:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106b1d5sm453904b3a.108.2025.03.27.16.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 16:49:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <765d66c6-081e-4b32-a63f-5fc784ccdbe6@roeck-us.net>
Date: Thu, 27 Mar 2025 16:49:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH]hwmon: (k10temp) Add support for Zen5 Ryzen Desktop
To: David Hows <david@hows.id.au>, Clemens Ladisch <clemens@ladisch.de>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z-XcdvkyUo1m1alv@archibald.hows.id.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z-XcdvkyUo1m1alv@archibald.hows.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/25 16:17, David Hows wrote:
> ---

Is it so difficult to add a couple of lines of description ?

There are lots of examples in previous patches.

     hwmon: (k10temp) add support for cyan skillfish

     Add support for Cyan Skillfish (AMD Family 17h Model 47h),
     which appear to be Zen 2 based APU.


     hwmon: (k10temp) Add support for AMD Family 19h Model 8h

     Add support for AMD Family 19h Model 8h CPUs, which appear to
     be the Zen 3 based AMD Threadripper 5000WX series (Chagall).


     hwmon: (k10temp) Add thermal support for AMD Family 1Ah-based models

     Add thermal info support for AMD Family 1Ah-based models. Support is
     provided on a per-socket granularity.


     hwmon: (k10temp): Add support for new family 17h and 19h models

     Add the support for CCD offsets used on family 17h models A0h-AFh,
     and family 19h models 60h-7Fh.

Even

     hwmon: (k10temp) Add PCI ID for family 19, model 78h

     Enable k10temp on this system.

is better than nothing.

Ok, ok, no problem, I'll do it myself, and add a note saying that this is
Zen 5 based Granite Ridge. If and when I find the time to do it.

Guenter

>   drivers/hwmon/k10temp.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index d0b4cc9a5011..cc2ad7a324f9 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -502,6 +502,13 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   			k10temp_get_ccd_support(data, 12);
>   			break;
>   		}
> +	} else if (boot_cpu_data.x86 == 0x1a) {
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop*/
> +			data->ccd_offset = 0x308;
> +			k10temp_get_ccd_support(data, 8);
> +			break;
> +		}
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(tctl_offset_table); i++) {

