Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2C3D76;
	Wed, 30 Apr 2025 04:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745986240; cv=none; b=OtLjBUrrzjnImw3BuvSBKbAaWcHikrdIbtx+5xXsbSxUJb2PnPGPg2L+DPNy4EQl79zfMgoRf/dkYmYZXUDYJJpOWrdB/o3/lJJ4fs0YB0WAs5lqEBud7br2lhURlQfxKHQSiUQt2CfgmvohI38jMLtfFiGQ/UIAkEejr4M5u1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745986240; c=relaxed/simple;
	bh=Ox8hQA4pma2LNR/4jg74fqC+4NZYhl2GWnc8ESUhnkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCfITUxG4wd5fMDLmYHrwdURovRI2sNknMI4dKVjLMvtrc4aqeKx7tvnG7dicDywk+cBLRkLgLdw6PbCYWSd1HTMrvqBRfSNjI/+eRuJ6w5rOJzqgcWw2GMzIP4KQrRp8Ev6Sxw3+8ouBhckVP2e9n2YcB2vAihX+Urrzxk1sPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew4Wgmgj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew4Wgmgj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7376dd56eccso7255884b3a.0;
        Tue, 29 Apr 2025 21:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745986238; x=1746591038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IyOk3rfCGqpg2h2CmgIwmApfkvduFLXUPz/5GKtOsrI=;
        b=Ew4WgmgjKz5Nzk1W30o6ldDBprKbOEPj1nP+WPYxAZIPejM6plCGhWBka08W6eYyFF
         suoy+vM2xHtTe+70myBnmhQSw6gbIBmq+aLIOD0GOWeQNSEwKkxuGpllLLRN0nJ7cZy8
         fBrXv/zFQDYLxBZNH/p6iOE5qg5abkk4NsgrZ3jQYmyuBLChy34pFGNripHF+JCMhYWg
         CqxlVpK2Ub/uKhf9UOOBYXxs0z2mn+2eNV8XiMmI1neOAGn4NLPHYXNTdJ+J9Fcl5Yyl
         /33aLKgaX0oDE7FJ6i0k4UJXMRQvJ2vdQUati4KtDR6ubdll5hhQIYI1EoqssPbvPi0P
         zTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745986238; x=1746591038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyOk3rfCGqpg2h2CmgIwmApfkvduFLXUPz/5GKtOsrI=;
        b=ORJfxr+M0Sbxn001Pe+z6yDCyscFvcVyi7R5ySgeaHNYRU+eYpgsyyXkHdg8+IMXUd
         FiN/CVV6IQrJdoLA5d6Lih9BDd2Ofz3eJHZTGxaDERvNr4wQvQli+M+lcpydWSY7A2y9
         glWPhBt3WBQ3cMzi9zlijsWCp8MjnL9yPZiljbD5EBALobqe8UxLUSr+CHOXT6VUgHNY
         g+IeCFFPUkXN7C0z37B6XT0pxMTNmhj921YhngQBRhQuyCxCFAIvWv/jk1Lvc/TpxnIt
         VODaNus9G9jXgJILIofLj+Wy4rRcYS6TLRT39goaKY9JFpRBdw6in8PJfjI1ODLmqV6j
         l1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6oQWW7s8+lNDfONjysZGTWhBsKa4wp7nR//6JqpIrcgfIZ35bSJhjy7CjUsLLOZ55Z7hzIDB/ktMTCs=@vger.kernel.org, AJvYcCVmhoIk4nUjhikejrZdnklcQ3QPoUb3R27nXXrOL3cntdPHMzDd1THOT7NbvGSJOWuPsZHnY5azzV9Fk6Ia@vger.kernel.org, AJvYcCVxtLz5upwC6S20mjPJhM1NcS9rGyl3kX6Ar6KQpApKWYdywWUYkjlMXNC2vd++Bu3iySl5bBjER3x8@vger.kernel.org, AJvYcCXAP+dqIqWX5N8q3Vp07Fe0S5aIKGAuGpB1vlKiYtdgOzZuvuMFnRUs7XF8QGYU+njYNLOa7PK7UGLy@vger.kernel.org
X-Gm-Message-State: AOJu0YznTlJGuP9dYeg9AROajcwV8nABtiG2nFv6alzzgf+i+KzP6eBc
	9HrYHC/b8vB1ZKs4E9kgtJK/gDXfUTF0q6i1jZPy+1IQGC70PRrM
X-Gm-Gg: ASbGnctCKvSeWf+DgsPSZLEiuE4qC+LjHTh6RKfDizbEPKEcOLguscPBFMCaPizrfjI
	1GS7CVkBrIK2vlIm72CMgRUGzcsxeQcUCPaI+JCuGQqlh0BDDjqGvDqBjHjQHBA+lUEMJTd5tGo
	hMtwX77Vfx9TGtZf7RvUyX6UUUNCiZU2aYIlDiUtarVvhMmq9wRqF5hRlfVJplqek5GJBOKj+c5
	dcTjt4+34gK8nHXXMZwpE3OK0HYdh1Xr9nVCDOGeANbuchBHadaFFrUnZct1LyTo4iTjr/IRNPR
	pRZ1DH/+wlP07+fUI/z4j5Cct4zDzhCz+0uO+zX3pCIrRFOtex2k4L+nGl9mEQt2HU9w/EwSb6n
	szkhZZR9QuMYxDA==
X-Google-Smtp-Source: AGHT+IEjFI/5NL0QMrikKzIC2Nzl+TsmbSCKE7YlFVqxsokop+vaJJb2HacY693j3bFRB8Ue7wPAwA==
X-Received: by 2002:a05:6a00:9a2:b0:736:520a:58f9 with SMTP id d2e1a72fcca58-74038a90ac3mr2261496b3a.17.1745986238017;
        Tue, 29 Apr 2025 21:10:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a30de0sm607874b3a.104.2025.04.29.21.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 21:10:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <544a9f3d-1262-4668-90df-c767d3fe85ed@roeck-us.net>
Date: Tue, 29 Apr 2025 21:10:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: pmbus: mpq8785: Add support for MPM3695
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 Shen Lichuan <shenlichuan@vivo.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
 <20250428221420.2077697-4-paweldembicki@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250428221420.2077697-4-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/28/25 15:13, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM3695 device.
> The device is PMBus compliant and shares characteristics with the
> MPM82504.
> 
> Tested with device tree based matching.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>   Documentation/hwmon/mpq8785.rst | 13 +++++++++++--
>   drivers/hwmon/pmbus/mpq8785.c   |  5 ++++-
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
> index be228ee58ce2..20d43b8bba97 100644
> --- a/Documentation/hwmon/mpq8785.rst
> +++ b/Documentation/hwmon/mpq8785.rst
> @@ -7,6 +7,7 @@ Supported chips:
>   
>     * MPS MPQ8785
>     * MPS MPM82504
> +  * MPS MPM3695-10

Why the restriction to the -10 variant ? I found four variante (-10, -20, -25, and -100).
Unless I am missing something they all use the same parameters.

Unless you have evidence that the chips are different enough to warrant separate entries,
just refer to the chip as MPM3695 and explain in the documentation that there are four
different variants.

Thanks,
Guenter

>   
>       Prefix: 'mpq8785'
>   
> @@ -29,6 +30,13 @@ The device can also operate in parallel with the MPM3695-100 and additional
>   MPM82504 devices to provide a higher output current. The MPM82504 operates
>   at high efficiency across a wide load range.
>   
> +The MPM3695-10 is a scalable, ultra-thin, fully integrated power module with
> +a PMBus interface. It offers a complete power solution that achieves up to
> +10A of output current with excellent load and line regulation across a wide
> +input voltage range. The device’s 2mm height enables it to be placed on the
> +backside of a PCB for space optimization. It operates at high efficiency over
> +a wide load range, and can be paralleled to deliver higher current.
> +
>   The PMBus interface provides converter configurations and key parameters
>   monitoring.
>   
> @@ -43,8 +51,9 @@ over-voltage protection (OVP), under-voltage protection (UVP), and
>   over-temperature protection (OTP).
>   
>   All supported modules require a minimal number of readily available, standard
> -external components. The MPQ8785 is available in a TLGA (5mmx6mm) package
> -and the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package.
> +external components. The MPQ8785 is available in a TLGA (5mmx6mm) package,
> +the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package and the MPM3695-10
> +is available in an LGA-45 (8mmx8mmx2mm) package.
>   
>   Device compliant with:
>   
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 7ee201550554..e6a643856f08 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -8,7 +8,7 @@
>   #include <linux/of_device.h>
>   #include "pmbus.h"
>   
> -enum chips { mpq8785, mpm82504 };
> +enum chips { mpq8785, mpm82504, mpm3695_10 };
>   
>   static int mpq8785_identify(struct i2c_client *client,
>   			    struct pmbus_driver_info *info)
> @@ -60,6 +60,7 @@ static struct pmbus_driver_info mpq8785_info = {
>   static const struct i2c_device_id mpq8785_id[] = {
>   	{ "mpq8785", mpq8785 },
>   	{ "mpm82504", mpm82504 },
> +	{ "mpm3695-10", mpm3695_10 },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(i2c, mpq8785_id);
> @@ -67,6 +68,7 @@ MODULE_DEVICE_TABLE(i2c, mpq8785_id);
>   static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
>   	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
>   	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
> +	{ .compatible = "mps,mpm3695-10", .data = (void *)mpm3695_10 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mpq8785_of_match);
> @@ -92,6 +94,7 @@ static int mpq8785_probe(struct i2c_client *client)
>   
>   		break;
>   	case mpm82504:
> +	case mpm3695_10:
>   		info->format[PSC_VOLTAGE_OUT] = direct;
>   		info->m[PSC_VOLTAGE_OUT] = 8;
>   		info->b[PSC_VOLTAGE_OUT] = 0;

