Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45BB1F03C4;
	Tue,  1 Apr 2025 22:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547925; cv=none; b=jJqU6aFiI16jNMwmAu8xnkQNjbnmZl7//VX+EkcoTOI0WgGslSis3AvUDzZuY+YBsH5nzfsgzHvZkqxf/JsVNhe5kNdm8xIA9wcELEzDejA1cO9NsIZ5ejC9jyb/xngMzOSH6Ke70LUz1JBeBmfvH8ZzAZa2/W6+yVzo5/lDWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547925; c=relaxed/simple;
	bh=udUthviqdbl/kDBUhjIV3matUs9KwE1OPYs2mkIgdgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ie/vrvzblWT/TfJ6VDvlGkqeHrbTDREKNrHgLjZTZ5QFdsVJtcRQWldPcTWKL40HvZaeWS4HOYhPGC57FrEY6kUY7/QSZ8cDOPkT0PUrVmb7IlrTTUQxzxpNv5phen4Gp0ndWBAcL8HBbeddZV2RBe/CeKoXgBCMtEL0zaAusVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGMVxuRL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGMVxuRL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224019ad9edso39936005ad.1;
        Tue, 01 Apr 2025 15:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743547923; x=1744152723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rJIBFDDeddhNhvAZmCUuJxrKMzRlE3k3+cztdQ5hpV0=;
        b=SGMVxuRLBQ5EzjFIfdtgATNadaJ2WeinUG3Rozu79/SNDaGG6/Lo/xacH4OxIHbj6k
         PAvQqO6Y3+f3yRISFkGT9OSls95j92BezvLyUZR4pmgNyZsaAGbUXWkkc0N1Motnfd5f
         7GM8glL4kJYy9fSftrjDyf2YjuiTUWJObOef+EosYv4odHVc8k7Md23u8DJHu5EGZIYn
         fadozpm9pGSDzBXtpRuBzVC2sasaGXbj8K+G98HVi6I7TiouRf6iYo+Yz9Uy0JjGTcZx
         DgXrDbsVhOWGJuSH3C3YXAcHd68L36v+Li37qtTfuiq4I//vxF0NaLkMn1hfub/N5yuu
         aCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547923; x=1744152723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJIBFDDeddhNhvAZmCUuJxrKMzRlE3k3+cztdQ5hpV0=;
        b=VeNiYnan0IwBGceqstffX0u5zmDkrbMcT/lWCxVHFYn1ph5xFCebGo0JH/XfawfOyM
         pf1Wsmy1hCluC7ZoYot3s1IbRKHPNrrioRsSHtbZLdEkaKwwXKRXD5mJRIkuK4+zDR2n
         Hipdlf9fMAfy94Li14YSMBoB7vixZH9DLwh9EZs5z0YOko7ZwWPJrG1qAfArMOETTLmR
         K1oZiT7vY9bJxLNz66p2k7+K96lFf0NpBngEMF93BJtg+bsl70zxOlin55BAUe2GTB02
         9kw3hPRBOIHLHQRs5UPI4tdaYf9u4cid8Gsv+I3CJNb61NVqoTbREZ9o/EI1xNom1tIN
         GHxg==
X-Forwarded-Encrypted: i=1; AJvYcCX4us9acUOuy61Lc8EOKW16oksVh5FQHBNJyLL0QwJT320LZTtZEk12vcpiaoFrUW+B/y4wikgvaCTfFrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytRg1iYxE2Vjsu3HINIQSJmtd0IIwVmqU0jSoySFZp9/IdUHyO
	Et5i5nwqRNA+vTOsXdR4x6X6whVIBJWGYX+KwxxDDT1w6/zOXEpe
X-Gm-Gg: ASbGncsqS5ptj6V6vPjeW02oJp/yz9d8dcFqPZ94l7iReBGZDdgSsjVWx/eiXHgsvZR
	cqVF2Gr3ABFxdv9SB+E7y2jzi8olk33qjRdvXJbKDbRR2gOf5GsEslqeqz+BGzFS5cYSE1Bc0Hk
	V8wA403EwluNgjawK5tpofOQ8cbPgSZmDq+uoTnSyMzUC8tkIKEPOOC5rklyWB1TjMzKGLDSq7S
	UwkdcmUQS8KMGgDX0Kej9tqcjptUCfSTbj7JvUYurHK8/095eE1orkobnDeEgj624LxWufwHRCG
	NWuEiicXU1dGQDNNb4k0XpOqfCRDvIhLRaa9Nu4aG+bwMqxnVQQAz/WeD4qa6z3UZUobSI3Ink/
	n09QhT8Z1bB1Eb3jkmw==
X-Google-Smtp-Source: AGHT+IFKXn37jGxRJqYs9Z7cjgeslaYx5toXgQvIdubNYT0omtpkPxzSecRG1QF/6dIUtH6mITmLAA==
X-Received: by 2002:a17:902:f68a:b0:224:1294:1d24 with SMTP id d9443c01a7336-2296c603a02mr2311745ad.3.1743547922823;
        Tue, 01 Apr 2025 15:52:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf6e8sm94570265ad.131.2025.04.01.15.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 15:52:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
Date: Tue, 1 Apr 2025 15:52:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: "William A. Kennington III" <william@wkennington.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20250401220850.3189582-1-william@wkennington.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250401220850.3189582-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 15:08, William A. Kennington III wrote:
> When requesting new pages from the max34451 we sometimes see that the
> firmware doesn't update the page on the max34451 side fast enough. This
> results in the kernel receiving data for a different page than what it
> expects.
> 
> To remedy this, the manufacturer recommends we wait 50-100us until
> the firmware should be ready with the new page.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>   drivers/hwmon/pmbus/max34440.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
> index c9dda33831ff..ac3a26f7cff3 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -12,6 +12,7 @@
>   #include <linux/init.h>
>   #include <linux/err.h>
>   #include <linux/i2c.h>
> +#include <linux/delay.h>
>   #include "pmbus.h"
>   
>   enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>   		if (rv < 0)
>   			return rv;
>   
> +		/* Firmware is sometimes not ready if we try and read the

This is not the networking subsystem. Standard multi-line comments, please.

> +		 * data from the page immediately after setting. Maxim
> +		 * recommends 50-100us delay.
> +		 */
> +		fsleep(50);

I would suggest to wait 100uS to be safe. The function is only called during probe,
so that should be ok.

Is this a generic problem with this chip when changing pages ?

Thanks,
Guenter

