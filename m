Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8CCEAC7;
	Fri,  9 May 2025 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797205; cv=none; b=qPUj3w5mfk8Eq9dd66is+PsV9uPNgn23MqnJ7oYjJG6WXFbx/Cw8klw+XGwpxLFEPw+qdsB6aH0gTsiPnV35HF6ceMvzsdcMns5mDCXhdUbP/NiTZGqkqSVjkFQmZMBG7aTGHSbxkLU87YuzGdDw4q3kf2junCHm5Z5+/0g6jlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797205; c=relaxed/simple;
	bh=4ljaswZvpLa11JnKtqLJZzlpXgbUNueMnGcwfKTV9KY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hnd61pGdTLGdfqCNBn+sTQE7qkah1h4xaaqite59A+PTv2CJE59A7gK/eKFLfnIzZC6LkFhNQk3uwcl1oFML0XT4sHVT29Bgulbk18LJePUJSdgGJeZacjiJRNApPT+U0nyCAnce1Ft0/madR5PuMnZ0ge7aylQ+Z3R+BmLYI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+ojOsY+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+ojOsY+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e6a088e16so15850375ad.1;
        Fri, 09 May 2025 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746797201; x=1747402001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=M99M9pqDd4HY7ZTat7gh8dmPe+mFUSH3NvZfT0ucCMI=;
        b=Y+ojOsY+a/sMZxNxgDofV5WF4P/9rq203HpyuwUMcZup2BS/do/JxdPYXwcpSCvAs6
         cH5sL2OZejeAPtUOGsGxYuYDuc5oJMeWnwdmSPCu2Ux8vnlW8sJpKCRuaUQJ+bel//J0
         ltwOTke/+Xk1PZWUOp9Mdm14apZcICG3EtMt6e1KzW+iQNSgVbwhILSYCvS61lRuJGwO
         6SqD2q/glWuCBeDhw8hE1EU0ixgPYfzBEiOVmYJVkzdujFbevQ7RqWEN3VK/vpazcd8Z
         41SusGstvv6grZyLLZnsMWhOl1Bgu7jfY/gkE4G6rZY7d2gHHidhA8DBA+jKQXB4HPnP
         BXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797201; x=1747402001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M99M9pqDd4HY7ZTat7gh8dmPe+mFUSH3NvZfT0ucCMI=;
        b=vd54j602V5GWSyshctNwDgBMwMhXvdrOq/TtYIt3CKpyNMv6wT+6S9yKnJRiIRKhf7
         BVVQ1tghOaKHSxwIV/8ln4KuqW/SfwcewBt5Nbfm6JS1geQUe+5rJU6Ab1y9dgHNDlwH
         SRBDZKLtVlv9wah3BFPBznVB8qlBmHJOHxo/uqxbYm6vFhNyreQYczvfegoNa6c4VtV0
         mTfiQbOcU9IQ14zEFFjsaVR0Z3k1WszrxZr4Hu6vOP6v+wdiiQKv5107TXrDmv1BF5fi
         /9CYBhHy3F4uGoWI9vZHChxBHvN3mBmc4k3r/bygeoUx/ACCZUPPd/hbAqUHhcODJ4Yp
         uKFA==
X-Forwarded-Encrypted: i=1; AJvYcCUY2t9+1XHvCZ6zaYxX4QCWl8Roya+K2EiuV2ENQYwwJU39UdkDzu3MVUeJvg5SrPTjypFTQr1uzH7w@vger.kernel.org, AJvYcCVNf2WRy786nijvNfaxRkXvaVmpocklyoYhtVivB17WeJa65K8IOFmump0XHjjWNIn27o8FM9Jk+jcW@vger.kernel.org, AJvYcCVxHKerErTmIo+me8uq+64h2rVONJX5uLl1K+QhCTIFuAIWWRls8ToWXDayxhXumfW1yyezqhbaCTncd/c=@vger.kernel.org, AJvYcCX1zM5qXio66AfYa0xKifQM0ZrC7NHKjKYUNEmJpUNWZSlzbnkWxvfhDw2HqYX1QWtB283jCISQ7a0G58Qo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IIEfDgng40nSwPRNUHdBkAsII2UGk7XbsreUTk0uod0vIdTT
	8YPZWougJXySLsz89kbp/PqVmpEZkgQ6EUqAIXJVAzJldft/in8I
X-Gm-Gg: ASbGnctOQ0LLYCEejTtT0WGbApl9iTvIClheXYacCO+1zShqSt3ChY+x8QpE6SOyd1a
	uzinS3IDIGGa44Gwp98bkYZ7lb1RmBhiMhrutN1J3emst6S85G/ZD2IJJY0vUYkKbe7rFlGGITG
	u3MBHDEjAvlid0cXx4wA0mwWPKyUvLQerRqfcJoTlkqmZkcvl4eyd6K/0zuC6gVz8ZlPc/fD8XV
	i7yck3BkmZtCKiyp+xL4+WwkdMKXkBVjCxUJnoRUDxSqO7iUfYMYiZa0NWNNiS/StXQzXRfZU6o
	LVtGDahgl3rl7zdesBl63XVn1KVO7hCrv2I2VrdzFn+gf8WfErWZIBWNz2XRyVOeBQ8rKh3/C/5
	cAC+vXu5S5RBlUQ==
X-Google-Smtp-Source: AGHT+IF1kr7NFCr8YU3Cp/1fNg8yu3Ky0zpKNpL2nfPUiW9hl80G8AZThU5x1ZRytfbBPlKxXYUu7Q==
X-Received: by 2002:a17:903:1c7:b0:215:6c5f:d142 with SMTP id d9443c01a7336-22fc93dbc45mr46429305ad.20.1746797201019;
        Fri, 09 May 2025 06:26:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7b2a004sm16950085ad.106.2025.05.09.06.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:26:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d578893e-167a-404f-bdd0-8e5b187af816@roeck-us.net>
Date: Fri, 9 May 2025 06:26:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] hwmon: pmbus: mpq8785: Implement VOUT feedback
 resistor divider ratio configuration
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>, Michal Simek <michal.simek@amd.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Fabio Estevam <festevam@gmail.com>, Grant Peltier
 <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shen Lichuan <shenlichuan@vivo.com>, Peter Zijlstra <peterz@infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-5-paweldembicki@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250509065237.2392692-5-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 23:51, Pawel Dembicki wrote:
> Implement support for setting the VOUT_SCALE_LOOP PMBus register
> based on an optional device tree property
> "mps,vout-fb-divider-ratio-permille".
> 
> This allows the driver to provide the correct VOUT value depending
> on the feedback voltage divider configuration for chips where the
> bootloader does not configure the VOUT_SCALE_LOOP register.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> 
> ---
> v2:
>    - rename property to mps,vout-fb-divider-ratio-permille
>    - add register value range checking
> ---
>   drivers/hwmon/pmbus/mpq8785.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 34245d0d2125..1d0e7ac9daf4 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -12,6 +12,13 @@
>   
>   enum chips { mpq8785, mpm82504, mpm3695, mpm3695_25 };
>   
> +static u16 voltage_scale_loop_max_val[] = {
> +	GENMASK(10, 0), /* mpq8785 */
> +	GENMASK(9, 0), /* mpm82504 */
> +	GENMASK(9, 0), /* mpm3695 */
> +	GENMASK(11, 0), /* mpm3695_25 */

Use
	[... ] = GENMASK()
as suggested.

> +};
> +
>   static int mpq8785_identify(struct i2c_client *client,
>   			    struct pmbus_driver_info *info)
>   {
> @@ -99,6 +106,8 @@ static int mpq8785_probe(struct i2c_client *client)
>   	struct device *dev = &client->dev;
>   	struct pmbus_driver_info *info;
>   	enum chips chip_id;
> +	u32 voltage_scale;
> +	int ret;
>   
>   	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
>   	if (!info)
> @@ -126,6 +135,18 @@ static int mpq8785_probe(struct i2c_client *client)
>   		return -ENODEV;
>   	}
>   
> +	if (!of_property_read_u32(dev->of_node,

s/of_property/device_property/ (and include linux/property.h) to make this
usable from non-devicetree systems.

Also, please swap this patch with the previous patch to address the concern
about patch order (i.e., introduce the property first and then add support
for the new chips).

Thanks,
Guenter

> +				  "mps,vout-fb-divider-ratio-permille",
> +				  &voltage_scale)) {
> +		if (voltage_scale > voltage_scale_loop_max_val[chip_id])
> +			return -EINVAL;
> +
> +		ret = i2c_smbus_write_word_data(client, PMBUS_VOUT_SCALE_LOOP,
> +						voltage_scale);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	return pmbus_do_probe(client, info);
>   };
>   

