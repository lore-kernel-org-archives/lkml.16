Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24E1A83E5;
	Mon, 19 May 2025 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660634; cv=none; b=j2F4lZRgMcOhwG+4WnouC7SgOuMXs3vaMMO+gtLM02rCHQIcUxg3mE9HZnm+bmRKsuWBwzSVJi2BHHFU9mC1PkD+brZIAL55unGdmMb10O/8SlBQnZrIhTLtBwDyy/4+ltNd7810yj4qxTvxtxSSx0Cj85BTS4jLeDmzEjfP1DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660634; c=relaxed/simple;
	bh=ShS45SLKyx9/hEQGf1873oppf6FARI9JuFIIMkNsylI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UmEyNHpxXvNMEDxSx/6yprqqFUc0mERSTE8Ce5ubK67iy4ROSD81kA15GALCF2NHB7cf2LTL31VgcfyGIDKS3Yvb9x/QLL1l0AXJDSZwKeduoNwznZoFjBp9yxkh7xm/G7YVxBpd2Ljh6slUVUIL1y0R+Zj2p6nPT/W7+ZddgJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOuay9lT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOuay9lT"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7398d65476eso3459273b3a.1;
        Mon, 19 May 2025 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747660632; x=1748265432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rKHxkVpPGrcJ5aoPUgUachsbB6pAEZeFNSzqYfEk8w8=;
        b=NOuay9lTUz/N5Ey4MxdHkm8PRDnM37cliB78egEK1MdhOve2YkqDHvrmV+OSuYbh+S
         BFZJUk8+ShwnwEvV+vvL6IqfOk0kQalFk6B9CcSLMQKF+6Iwp4CE23Eh0Tl5v39jjM5l
         PKNt+g2k3Klv7ffUBaGRnlZXT8e8vzyCgZQ8Ligz+7He97sdQrM5lPdaQ0cUh5ezS9G/
         KjKXdkPzY6DFJ0AycykRL4qloWMVLg2dkrITVr4mDB+lZHt1xbZc98/aAqO6N/Axq2Z1
         fyvuN/iT0ErRH6su4befBCavh2EiPk7novrzayf6HcKx+hFwUkXa/xifNUlLFPRCuuUj
         86QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660632; x=1748265432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKHxkVpPGrcJ5aoPUgUachsbB6pAEZeFNSzqYfEk8w8=;
        b=vpONHcX3b9GkimcVVvfFOey/SnjFojBXcTyFT6sk27sNGsKd+Gw3InNlv44nQ4sOsP
         KUBiJVkypRAhSMPCPZmUPF8k7PKzuPCcAYO39qmyyiC7qfz2xAzL3jBiuRx0t+7dbmqO
         cJIi3FcjFNW0p1pgitJu/4UNJbzo2aB+YYZIbNQvMScAhTnqlynVIMoDOwksX4pGzzmD
         uOXhz5EN05RBID7N9Zo61Jjpa1zjkP92QI+3+sy/1+1zkWEAPAHdZr4bUkQpfJMHXbyX
         WiIn4uoxMiCVsCRntKPmSLJS40OuIwPXTz/E/quIctcOsUEYPEvwOSLa5cRKCd8Fp8Lr
         0plg==
X-Forwarded-Encrypted: i=1; AJvYcCVpCy12mV3guvBRAEZhfoRwCrzqRsQNyZz36DETlbQKkfIW9DNHk7C13SJRQAYlmebt70YZ0hRtd1M=@vger.kernel.org, AJvYcCWWNe0GzciBNfapINLGszeqkfFF0HLchiWF4epgOVMYLmKg/Tg4O5EydWJTa4LeNXvZTxBGAlGZaZuKnFWq@vger.kernel.org, AJvYcCWuXQc45qPkqNVhW7zX3XTsz7rl/mFy4LOKOym9E1Jw4NRiYXsB72on2uo06QWvSZDn2UOfti8IcJbXKSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUDADlr9pBzQuBwtCTbsMZLxfMEMXXDKAWwg0Jg52JBCc0aak
	6u1eJMQNmVNTgFWGYrteDShC4bIH6TocHQnAOg3gOOfySjm9c45Etjlj
X-Gm-Gg: ASbGnctpneQZ7cjJVCI9dLFfhu5YI0uawXb2zc7ov0OIuJIblLZ1eqTCRj+4k/QYg5X
	aN6VJAqpSfjn4KGbhmF/ax8AjAlXhu9RTMMRlI0W6bpgvVzAoB3ayROX7pGrp0m3mDd94cHUnyv
	k0UvPcdoB6LAIKRVhYv3TQ97pqAl4+nJqUpQ+Mr2Cyx5LrByGT51i6FyzKmhTxUElSfZtPkM/p2
	akwsC96iRJk232rDXoaGecgCxc4KgVcfsrjhCrB2Pqxgje3f/wZaCZ7El9taVnIxaxbAVfF42GJ
	YJWGwusI5MHc14nQLkEwwSeQTc40xrC5j45GQebFPAVod56bcX/1UHGwyVbl32d8Y2GK37QDN4d
	2iDRjcBGK7lFM9/RU2yuoNeRD
X-Google-Smtp-Source: AGHT+IHeb6ElEWDfLEqIDtJznvPX4SYwbZxQpVzqW6uNySbEtm2tI0RaRIlzSVXQ/KwPteKi+EuBvg==
X-Received: by 2002:a05:6a00:10cb:b0:73c:3f2e:5df5 with SMTP id d2e1a72fcca58-742a9afe772mr14954748b3a.9.1747660631626;
        Mon, 19 May 2025 06:17:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b7bcsm6330137b3a.52.2025.05.19.06.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:17:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a82015f1-0a19-451e-9087-060a1d2c6c4d@roeck-us.net>
Date: Mon, 19 May 2025 06:17:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: hwmon: acpi_power_meter: Add information about
 enabling the power capping feature.
To: Shinji Nomoto <fj5851bi@fujitsu.com>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519072756.1512244-1-fj5851bi@fujitsu.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250519072756.1512244-1-fj5851bi@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 00:27, Shinji Nomoto wrote:
> To enable the power capping feature of the acpi_power_meter driver on
> systems other than IBM products, you must explicitly specify
> the force_cap_on module parameter.
> 
> Add information to the documentation about enabling the power capping
> feature with this driver, including the above, to improve user convenience.
> 
> Signed-off-by: Shinji Nomoto <fj5851bi@fujitsu.com>
> ---
>   Documentation/hwmon/acpi_power_meter.rst | 25 +++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/acpi_power_meter.rst b/Documentation/hwmon/acpi_power_meter.rst
> index 8628c1161015..334054afc498 100644
> --- a/Documentation/hwmon/acpi_power_meter.rst
> +++ b/Documentation/hwmon/acpi_power_meter.rst
> @@ -37,9 +37,16 @@ arbitrary strings that ACPI provides with the meter.  The measures/ directory
>   contains symlinks to the devices that this meter measures.
>   
>   Some computers have the ability to enforce a power cap in hardware.  If this is
> -the case, the `power[1-*]_cap` and related sysfs files will appear.  When the
> -average power consumption exceeds the cap, an ACPI event will be broadcast on
> -the netlink event socket and a poll notification will be sent to the
> +the case, the `power[1-*]_cap` and related sysfs files will appear.
> +For information on enabling the power cap feature, refer to the description
> +of the "force_on_cap" option in the "Module Parameters" chapter.
> +To use the power cap feature properly, you need to set appropriate value
> +(in microWatts) to the `power[1-*]_cap` sysfs files.
> +The value must be within the range between the minimum value at `power[1-]_cap_min`
> +and the maximum value at `power[1-]_cap_max (both in microWatts)`.
> +
> +When the average power consumption exceeds the cap, an ACPI event will be
> +broadcast on the netlink event socket and a poll notification will be sent to the
>   appropriate `power[1-*]_alarm` file to indicate that capping has begun, and the
>   hardware has taken action to reduce power consumption.  Most likely this will
>   result in reduced performance.
> @@ -52,3 +59,15 @@ follows:
>   `power[1-*]_cap` will be notified if the firmware changes the power cap.
>   `power[1-*]_interval` will be notified if the firmware changes the averaging
>   interval.
> +
> +Module Parameters
> +-----------------
> +
> +* force_cap_on: bool
> +                        Forcefully enable the power capping feature to specify
> +                        the upper limit of the system's power consumption.
> +
> +                        By default, the driver's power capping feature is only
> +                        enabled on IBM products.
> +                        Therefore, on other systems that support power capping,
> +                        you will need to use the option to enable it .

This is potentially unsafe if not really supported, which needs to be mentioned.

FWIW, if there are other systems known to support power cap in hardware, they
should be added to the driver in the dmi table. A more generic solution should
check if the _GHL and _SHL methods exist to enable the attributes. force_cap_on
should be the last resort to enable it.

Guenter

