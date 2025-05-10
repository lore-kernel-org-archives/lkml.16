Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988782747B;
	Sat, 10 May 2025 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746887826; cv=none; b=T3Y/KWX5H6Zg2I8vjpQ4MNlMnPlsUxTbXeMdRxdBpY2/VWX1ER4b0I52glnI3ON5v0R4OG+UfrcKt6+A1y7WemM/Z9CSIjtv+KSIWj1JrP+a9UDnKti8FcwVTlR4yqAcXfOwWwhn3jo1LGDNlcd3WcqCg29cMe2DQ5v61F8vwkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746887826; c=relaxed/simple;
	bh=cXKYXDUGIvJ8XJqAcE3axA0eN/VtAOwr+gbT5qxDUtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAYTdFtaX5YQoH+G6adVhyrNPb9lUvtMhhWRYAOv3Kxy020kSbzAHeyvzmEBh+MGSxmMLrX6rkvleubw4fwwrwuzS4Rs2QrOEwzMwlphOZBv/GX3rHhRHYeQ+uK8mTkDMYi2zBG7PRsrTBLWIrZ+ZWwm1fjn+NKTs7D2PTo3qDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaTbuUaq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaTbuUaq"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7415d28381dso2329680b3a.1;
        Sat, 10 May 2025 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746887824; x=1747492624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ia0OowHQimB3R2cgVF/bKFgpv7NDBWk1Z1mPJcaYRVk=;
        b=TaTbuUaqUqBmRKpI6Cv9Eqw+Dq+H66zhNbcDnxd/aCxyI445yuqNoEjkKiwgr9/Sj1
         uc9s01+JysJ0bfxsIuUg32eDlBcylPI66yOrwFoNVPugIBVmFFEi39DMAXibSGfqmRlH
         sS5/1LPbyBnKMou9O7tSNa4OWLtf8/QfJgfbp1QS1zQeG81XDj4DPhKj8FbvhodWjE3j
         WHlmDuroqYBam+s+sSoV7x+UqCOCXju390IunXVIRhA2bCMu9b0wt683Ip2zM55z4izX
         9cYw+EXBPOB2SXEYVNdNU9cAtnNXwu4FL3snT1ES7hCQ1DnFyQiwpepsEt76YRwFYljl
         a3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746887824; x=1747492624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia0OowHQimB3R2cgVF/bKFgpv7NDBWk1Z1mPJcaYRVk=;
        b=GttqIWa84piBgA6ZcTWPIJYX7p0a0ipKEOPAmyyWaGj3ynOue8P2MPJW6kcFgUBUIq
         scjQs1/1pvauGIyWJflakSa39stIP4+okgtvuxkqwJyu9ITaB20prXUZVtEf5rlj9djV
         oGefK1KPkhnk829wQdnUh2s9BPTCiFgKFTSkUY8TrQypd746echwvSq3vlV3l5KK6eF0
         tUE/4h8y7xULuh409Ecfh8up+2ZjsNWnf9O8A7Qlnv//5O+f1m/5dCIQW2S4hclgEA2h
         0Z17SowJQ7bW1xxo/ysWn5gFGFfIHcZ4HTywaSU3h0DvUQzVxRQXuOZCii005r3Hq433
         YVQA==
X-Forwarded-Encrypted: i=1; AJvYcCVeWDNTTpyfLc+sRvWre7R1+u1WHCjTpGjsBU9zTDfY4In11IRHk/XBLcYFtLMS2bJGBNlASOtg4yEN@vger.kernel.org, AJvYcCW5VYoxs9nDanUEyQK3cnbTncmc8bGTusYkOcl490UBG4dhhagG9Pe6fzTAcox7B0Y25+Jy7tQZyH6R@vger.kernel.org, AJvYcCWRgKiCS0rwn5835MuVm4VbtbB7rx4DMrJazs4egQhC3XfrAz4elu3tEYeS31h6S0+bugOGHMnioLaquU0=@vger.kernel.org, AJvYcCXskMn/VQFkBSKbQFGde+m0j3mxfIetRZ4EG6G4Znofad9yuZvgxzGtNsXVFbGWtf4gMS5y643Zzy1SuMEu@vger.kernel.org
X-Gm-Message-State: AOJu0YxTxcDgZcCE3G/AEjNzuwfygYyHp3ERMVCKYkQYeEJltd6HRanV
	aTpC16oux6BFmLhSNe7VL9kYA1ZqD9FY5Uy7p5bsQ0Pk+0ets/ZT7PW7Vg==
X-Gm-Gg: ASbGncuD4AqYrBlGBXkZ2OOCwke6Y4rhMTWFX5p07mkLuszwO7J/UGmiZBdFj5JaILv
	nYdE43zMrJyQPGWA8jCMUlCh6EU7rOjI1pRg8rs+bCjyII7Q4nEvp6Tu8W/HuGfV/80hEXhTOaV
	kDKlqiLzfliOBy4YTySVnaInibo+/UrkctwHJ4NYoqapeu6ZWdukewdP29g5VmZdWhapd771LGT
	dEUDGkyL8oc7FQp4+xZHWN28ZBb/eah6Z9x03D3PZuvKxKigE/UxsIXwqOpXexruNnVwPBNumfD
	Mrg2THtJQNHrBd93gEjRfqNxzO5m6/3DPjj/bUE/dmCsHSVkLxTaZYuZQBDhMdZgU8qd4/kkSlY
	50i1FWiVxkBm/JsBKpPIkxKQ+
X-Google-Smtp-Source: AGHT+IEb3O+BNHNgwNY8TNW7k5LdtOxkw8k7MPRUikWvDGlEtUNPWTvFfV7myj0qFAyh5umM73hWEw==
X-Received: by 2002:a05:6a00:3e16:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-7423be886e6mr9553697b3a.10.1746887823633;
        Sat, 10 May 2025 07:37:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8f4ffsm3255578b3a.162.2025.05.10.07.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 07:37:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77d0e89a-6085-4470-b530-74196a174e20@roeck-us.net>
Date: Sat, 10 May 2025 07:37:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: pmbus: mpq8785: Add support for MPM82504
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>, Fabio Estevam <festevam@gmail.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Michal Simek <michal.simek@amd.com>, Grant Peltier
 <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 Shen Lichuan <shenlichuan@vivo.com>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250510091937.2298256-1-paweldembicki@gmail.com>
 <20250510091937.2298256-5-paweldembicki@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250510091937.2298256-5-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/25 02:18, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM82504 digital voltage
> regulator. MPM82504 uses PMBus direct format for voltage output.
> 
> Tested with device tree based matching.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> 
> ---
> v3:
>    - fix alphabetical order in multiple places
>    - change PMBUS_READ_TEMPERATURE_1_SIGN macro name to
>      MPM82504_READ_TEMPERATURE_1_SIGN
>    - use sign_extend32()
>    - fix typo in documentation
> v2:
>    - fixed signedess for temperatures < 0 deg C
>    - removed empty lines
> ---
>   Documentation/hwmon/mpq8785.rst | 20 +++++++++++++++-----
>   drivers/hwmon/pmbus/mpq8785.c   | 33 ++++++++++++++++++++++++++++++++-
>   2 files changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
> index bf8176b87086..b91fefb1a84c 100644
> --- a/Documentation/hwmon/mpq8785.rst
> +++ b/Documentation/hwmon/mpq8785.rst
> @@ -5,6 +5,7 @@ Kernel driver mpq8785
>   
>   Supported chips:
>   
> +  * MPS MPM82504
>     * MPS MPQ8785
>   
>       Prefix: 'mpq8785'
> @@ -14,6 +15,14 @@ Author: Charles Hsu <ythsu0511@gmail.com>
>   Description
>   -----------
>   
> +The MPM82504 is a quad 25A, scalable, fully integrated power module with a PMBus
> +interface. The device offers a complete power solution that achieves up to 25A
> +per output channel. The MPM82504 has four output channels that can be paralleled
> +to provide 50A, 75A, or 100A of output current for flexible configurations.
> +The device can also operate in parallel with the MPM3695-100 and additional
> +MPM82504 devices to provide a higher output current. The MPM82504 operates
> +at high efficiency across a wide load range.
> +
>   The MPQ8785 is a fully integrated, PMBus-compatible, high-frequency, synchronous
>   buck converter. The MPQ8785 offers a very compact solution that achieves up to
>   40A output current per phase, with excellent load and line regulation over a
> @@ -23,18 +32,19 @@ output current load range.
>   The PMBus interface provides converter configurations and key parameters
>   monitoring.
>   
> -The MPQ8785 adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
> +The devices adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
>   control, which provides fast transient response and eases loop stabilization.
> -The MCOT scheme also allows multiple MPQ8785 devices to be connected in parallel
> -with excellent current sharing and phase interleaving for high-current
> +The MCOT scheme also allows multiple devices or channels to be connected in
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
> +external components. The MPM82504 is available in a BGA (15mmx30mmx5.18mm)
> +package and the MPQ8785 is available in a TLGA (5mmx6mm) package.
>   
>   Device compliant with:
>   
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 2e7c0d0c3f81..1e12e7267a7f 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -4,14 +4,19 @@
>    */
>   
>   #include <linux/i2c.h>
> +#include <linux/bitops.h>
>   #include <linux/module.h>
>   #include <linux/property.h>
>   #include <linux/of_device.h>
>   #include "pmbus.h"
>   
> -enum chips { mpq8785 };
> +#define MPM82504_READ_TEMPERATURE_1_SIGN	BIT(9)
> +#define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
> +
> +enum chips { mpm82504, mpq8785 };
>   
>   static u16 voltage_scale_loop_max_val[] = {
> +	[mpm82504] = GENMASK(9, 0),
>   	[mpq8785] = GENMASK(10, 0),
>   };
>   
> @@ -41,6 +46,23 @@ static int mpq8785_identify(struct i2c_client *client,
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
> +	if (ret & MPM82504_READ_TEMPERATURE_1_SIGN)

When using sign_extend32() is that the conditional is not needed.

Guenter

> +		ret = sign_extend32(ret, MPM82504_READ_TEMPERATURE_1_SIGN_POS) & 0xffff;
> +
> +	return ret;
> +}
> +
>   static struct pmbus_driver_info mpq8785_info = {
>   	.pages = 1,
>   	.format[PSC_VOLTAGE_IN] = direct,
> @@ -63,12 +85,14 @@ static struct pmbus_driver_info mpq8785_info = {
>   };
>   
>   static const struct i2c_device_id mpq8785_id[] = {
> +	{ "mpm82504", mpm82504 },
>   	{ "mpq8785", mpq8785 },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(i2c, mpq8785_id);
>   
>   static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
> +	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
>   	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
>   	{}
>   };
> @@ -92,6 +116,13 @@ static int mpq8785_probe(struct i2c_client *client)
>   		chip_id = (kernel_ulong_t)i2c_get_match_data(client);
>   
>   	switch (chip_id) {
> +	case mpm82504:
> +		info->format[PSC_VOLTAGE_OUT] = direct;
> +		info->m[PSC_VOLTAGE_OUT] = 8;
> +		info->b[PSC_VOLTAGE_OUT] = 0;
> +		info->R[PSC_VOLTAGE_OUT] = 2;
> +		info->read_word_data = mpm82504_read_word_data;
> +		break;
>   	case mpq8785:
>   		info->identify = mpq8785_identify;
>   		break;

