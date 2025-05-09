Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47D277003;
	Fri,  9 May 2025 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798899; cv=none; b=iilQvdw2bT+0XBTytoGCFir2EMnup55Mr87Y2B5SlNt6nnx1HqV9Gpuz2QNZ6I/u1xxe9T1XRhLKwkZVi0E6BKSCSNkyJG7m4ru+2DZ4vB015UpmSfZXuHac/kHpjX+/ZRoBLn/bY5BZ4huBzFUitzxxpO85kicUbcsBgoUcltU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798899; c=relaxed/simple;
	bh=kOK8ffgLkfBZTjFDWR6huYmQ6GfSpjDsOUCV/7DmqTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOjtGR94rgBQYse47qX9cK8VQOkKOQcY9UtqRn4O/j2TmnL3zFkHfpIAtn8QIHjeVkq+9gyPdRc1pp72wQ8cDkYHPEP60DjSZvuVnkpQo0pRXf/13b1mMhj5pNsZFvlktPLIeS93WXuYZz7WU3yvVjjSUh0wqE8U/aitdQhj9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1pZv1b9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1pZv1b9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e7eff58a0so20186825ad.3;
        Fri, 09 May 2025 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746798897; x=1747403697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HjPEbAslOM8khAqWQvdf6mvMkrymNkVDTRKMIC8N4zI=;
        b=G1pZv1b9QV0QhKxjMwwT4NdiLnVI83WDw8O1NfLI4AGGdhadnAWkSeupXM2BgNMWQ2
         ENnlal61gFhyDK9ZUgefPaJkLCSGhPxO/179jINbeasTOyrrYBRMwGAj/DJpCDKluHGk
         lhJ7OXUvvjP4Q2ao4Ma58j0INPUH8dG6stpWyptOtjRcAU6kDaFBrHVhyvRjgtilG77d
         U3Caa8yOd+kVna19YuqVOCqBN6qSVYD6PtQcOcJOsLsUWMf523EDQ0nr83sJTUPUPmFg
         hoHQEyUxl7l4k9pkwp04M83XLwNmvkwTJ3Mu2Hpk8eVtiwCMkyJu142wg9alfl1m8+rL
         70Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798897; x=1747403697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjPEbAslOM8khAqWQvdf6mvMkrymNkVDTRKMIC8N4zI=;
        b=ekGEgGdhRd1jFmq/zOSEjjrrNaXx5dghgFqMfzMNrQcdV4sLlyxBLp62ctAXoE6bSd
         nUvZ57zaIMsmbZN/wEIcoZHh5yGRaE1h7vNyCyVPU9MQknB8KtVq2QBkJ7r5Z3nmzUBZ
         AzPzzzAoHQmaqTo0P48Yf2yXtQ/IDU9quyp/tbvtKGyB6c7KeZHuf0jDhHziDNVWy86d
         gpFyfr7JGWJ+2B4hzK9Q5yNojx1gKf0ZREiJD1tr5MCaWMM/4OMp3Jg7GKD6OxRX/NFa
         1AZN3h/TDbuO2kHoyRZpndZTTwcRm0161GP/Gff7JDxI/3k3b3jq4Y952HAVILx3Zo6U
         jJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy8NZjwm6RhROssNBt81tKl3D+9YmDU2gH6Lq/Z8HlcSe5+uauKvPwgvWfI4timjKjLTkHG4q9DLWm@vger.kernel.org, AJvYcCWLTBcwMEAU4x1GehZ3JfzCMYjKEWUa7eXcIwFcrRy4MPtmUlJDJ/x+jzjOYNCEoJLzL9J5cAWUDDezrBIO@vger.kernel.org, AJvYcCWfxq9/zWc8Ozlq26fscVipX1ORw5o0ymWjySlqpliJbRjjCSPgr2y0V+gjc9U2mVbYaa1YgJTkyC2W/h8=@vger.kernel.org, AJvYcCXjmZuCoTaQSFmsW72ll+mK+a8Z0xGyV9hl45YSykEDmjrnuie3e0TD0/L03RdulxsDb+Gj/7bgXu2Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1rJSGoE9d9rJJeiL72Wc8wYXYd9lx7lamEexYzoyboLrE9TN3
	jxhMB9pGdOXhk5mINteOmjSQkAwtUh3MW3FNtL4jEBu07QC6IUkr
X-Gm-Gg: ASbGnctG4rduaTpoXn0ZBVrhdsxxFKbeITPXH2vtepEsM7cOikPSDw1KFDpRD5riajg
	w2+OS1Q+DWqgSmQUpIqfD1Hi7DnPsPU+KxnTLjxZsMhyFktX+yRPflG1g13OtUpTufyYeAz/s+i
	GCaFy6/Z66S4ZMI7C4CeAm4QnReVYUPbzYEtmV0eVdYMwn3UvcBSixMXZU2nDMpJERdbwdNYbX1
	EDbzkwWyYy6H+enkAYGfvKJIlovN2efmMvBig9lq80HAUT2sGqkQ/htXsSfL+gft5fMTrxqSJXu
	yQvs6/oHnYDYQIz0rd9ILes+HMRISiZtenKCJ/AM3XEvpF9263MKw9XKqXkaf4ENs/UM0m77f3l
	vtMG35XzmvduarA==
X-Google-Smtp-Source: AGHT+IFNab2h5nbWwNqPeIs4h1OD9ciEWSqIsqQkZOIEEjog19nYd0vsEvL4MLY6A9E1QOb5DkmddA==
X-Received: by 2002:a17:902:e84d:b0:22e:62cf:498f with SMTP id d9443c01a7336-22fc8e961a1mr55842795ad.38.1746798897167;
        Fri, 09 May 2025 06:54:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b4d9sm16938695ad.191.2025.05.09.06.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:54:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <45d1a08c-8a7f-4b6e-8068-4ab0e63abbf3@roeck-us.net>
Date: Fri, 9 May 2025 06:54:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] hwmon: pmbus: mpq8785: Add support for MPM82504
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>, Fabio Estevam <festevam@gmail.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Michal Simek <michal.simek@amd.com>, Grant Peltier
 <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Zijlstra <peterz@infradead.org>, Shen Lichuan <shenlichuan@vivo.com>,
 Greg KH <gregkh@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-3-paweldembicki@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250509065237.2392692-3-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 23:51, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM82504 digital voltage
> regulator. MPM82504 uses PMBus direct format for voltage output.
> 
> Tested with device tree based matching.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> 
> ---
> v2:
>    - fixed signedess for temperatures < 0 deg C
>    - remove empty lines
> ---
>   Documentation/hwmon/mpq8785.rst | 20 +++++++++++++++-----
>   drivers/hwmon/pmbus/mpq8785.c   | 30 +++++++++++++++++++++++++++++-
>   2 files changed, 44 insertions(+), 6 deletions(-)
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

channels

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
> index 00ec21b081cb..9a4a211b2aeb 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -8,7 +8,9 @@
>   #include <linux/of_device.h>
>   #include "pmbus.h"
>   
> -enum chips { mpq8785 };
> +#define PMBUS_READ_TEMPERATURE_1_SIGN	BIT(9)

s/PMBUS/MPM82504/

because this is not a standard bit. Needs to include linux/bits.h
or better linux/bitops.h (see below).

> +
> +enum chips { mpq8785, mpm82504 };

Please keep those in alphabetic order.
>   
>   static int mpq8785_identify(struct i2c_client *client,
>   			    struct pmbus_driver_info *info)
> @@ -36,6 +38,23 @@ static int mpq8785_identify(struct i2c_client *client,
>   	return 0;
>   };
>   
> +static int mpm82504_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	int ret;
> +
> +	ret = pmbus_read_word_data(client, page, phase, reg);
> +
> +	if (ret < 0 || reg != PMBUS_READ_TEMPERATURE_1)
> +		return ret;
> +
> +	/* Fix PMBUS_READ_TEMPERATURE_1 signedness */
> +	if (ret & PMBUS_READ_TEMPERATURE_1_SIGN)
> +		ret |= GENMASK(15, 10);

Better use sign_extend32(ret, PMBUS_READ_TEMPERATURE_1_SIGN) & 0xffff.
The mask is a bit odd but there is no sign_extend16(), but this makes it
more obvious what is done here.

Also, this needs to include linux/bitops.h.

> +
> +	return ret;
> +}
> +
>   static struct pmbus_driver_info mpq8785_info = {
>   	.pages = 1,
>   	.format[PSC_VOLTAGE_IN] = direct,
> @@ -59,12 +78,14 @@ static struct pmbus_driver_info mpq8785_info = {
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

Alphabetic order.

>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mpq8785_of_match);
> @@ -88,6 +109,13 @@ static int mpq8785_probe(struct i2c_client *client)
>   	case mpq8785:
>   		info->identify = mpq8785_identify;
>   		break;
> +	case mpm82504:
> +		info->format[PSC_VOLTAGE_OUT] = direct;
> +		info->m[PSC_VOLTAGE_OUT] = 8;
> +		info->b[PSC_VOLTAGE_OUT] = 0;
> +		info->R[PSC_VOLTAGE_OUT] = 2;
> +		info->read_word_data = mpm82504_read_word_data;
> +		break;

Same here, with case statements. Sorry, I should have noticed in v1.

Thanks,
Guenter

>   	default:
>   		return -ENODEV;
>   	}

