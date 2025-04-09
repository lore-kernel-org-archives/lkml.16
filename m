Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F682899;
	Wed,  9 Apr 2025 02:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744164873; cv=none; b=lFuXuvB52dHGzJdQWNi6lJPcHN+qILNhwyJ8UGQqcDnxaqcdvRrynf6apU2LpGdcblXJJYBEiqe16TNEp3Jd9ppxtqmtsQPkdKBGHQUrRQgM7FjbdDzIt/hOJPHTy32uJaTluV17rZwVHjiCLU1i0+fiVdrzCUHQr32zLMbbeMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744164873; c=relaxed/simple;
	bh=UP0FQR/n1zwynJlG9G02mJ86TJ3qtx96xbpDMqupU8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha9igYX405sTAIJVBuctF5TAIJSUXHp4hnNY5nCRqQkn2i4WK1CBx7bW/CBL2WGJaWzkwgtSIfOeom1EqZPJvOy2Re4fQYJPYwLbo03MQs8YHySH+yd6FnY5nevbtFudpVriHurYWQFrpsikllnY5wgofoEwhZY42LoskfA7q4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUcNOP08; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUcNOP08"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso4146455a12.2;
        Tue, 08 Apr 2025 19:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744164870; x=1744769670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpDgCF4RC4kIU1sVwLFc1hmL/y8zp2nauAmOE/PaU40=;
        b=hUcNOP08LJvaROQDnfBSCBnw4s44wle04hHq6eyXMpYoYgxAPNSGflvZWGt79S4P9B
         3kt6ZTQ3qweI7As/N+YxLp2E9vtn5jE5xcggRszRNJxe3GJKmqbPLiMUVT0tRuAntO7O
         XjHbpPqHyALUheeXTQH942OqkOH78ox6Ywql+eekf+n9ZmplCVoBzDfYrQcIyifxRdTU
         vwteHbuUo0XlTDO0ZnEbEbIFmh/IXiXRwxeI/ecwpf9tZJbj8YRhVy1wpVvuLxUWu3Vn
         OVzlEUofSjI64s1a5Zjb/ltK6I3aWd09tR7D9N3ILi3crgKFBsZ8nO9xd57+dU2ozTX3
         Un0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744164870; x=1744769670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpDgCF4RC4kIU1sVwLFc1hmL/y8zp2nauAmOE/PaU40=;
        b=pC5qgnE15E9xj/25HHjFtbcGej81U72ree8gr0oZQ46J9nYZuORGqw/snngxNeNql4
         7wXywxwTxd2Bl5oVDrhok21PDozshKiRS2XMVOryLiWYsqUr/JDPhtYvDjPdfdjevWA1
         YQAOcJdV6LZ7lsXjcB2JXYfk311NCiSAonUSsZAOeX1jGVvP4ivmZ0FgQVj4yiypRtiZ
         2o9WqpKVhf7UZs2wUwPCta5uGptRWbljBHQ2kdEQU5v7BJyr/ljCGEWw3LhpIrPlOqFY
         j5EAYugWn6/mVY6//sv/U84hT57y7RzoMvDAVjWILggzgbvpQO8HZxqAIHxHa82TSTI6
         fhAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHtX7DyuNL6iUSoS/oDoCqiVHkXJNNOh1UB5LgBTjdEsNmdqlHbN38+N76EdWT8UmGdTgSkm8W1JDsQJwc@vger.kernel.org, AJvYcCWNZACbUJ95+nPqHWNZ77d9UIgo7lKDMZm1pMh2pGGnt0lGeHshCJDtI7V6ZnbrDz8G2vx4sw2V2K0Mxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzT3kduSbIFF8TQBmF4fNkchLP3aTHdy3kNdTkAVuLzoWivR/7
	8d4h+KM0mGOxJY/gcyJlP5NrW5eLcPSs2SdI8hhoFsp25joSKOmt
X-Gm-Gg: ASbGncvSPR3KVvTM34VrTgLBkuMX7Ty0maPil3OvcenfratTt3X9/xtWGhiLH+MbXio
	cCbTTDNCcLKhGhtuCtSwCefSVQAkM3K1Wo6RHQ4fN4WVUqxbYxO4/F27LmtaEBpbuKm5ES2tZZs
	sBR56pGr6S0VZtYxuo3ye9N6BS/Uq/5Wm7PeDea1Oic7v/nE9y90zAv48yPtISeqTNt/Gmi6zn3
	ty7dhro3mIDVe22EZt4EomuZ6J4UQNhLxx23xK06JZIoIZYtjM8k5azG3I6pnJyT2De7q2Gy7d+
	2gvkyyJCwNjp29LOtRHraT3S1ftS0mCwrxGnMJ9fIWLtZu+QWx+vR2mF4g==
X-Google-Smtp-Source: AGHT+IHSZ14NomQz3hALXnGcow5TBpBzj55daEIsWeRV7i8LA3ITmKaDqDlVX3vcaOOZLZG55FAXGg==
X-Received: by 2002:a05:6a21:3a48:b0:1f5:81bc:c72e with SMTP id adf61e73a8af0-201592ad38fmr1515616637.33.1744164870250;
        Tue, 08 Apr 2025 19:14:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69b2csm83128b3a.166.2025.04.08.19.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 19:14:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Apr 2025 19:14:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) sort sensor definition arrays
Message-ID: <faefe6df-8e2c-426a-a22c-7cc0eeba3387@roeck-us.net>
References: <20250408204505.11412-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408204505.11412-1-eugene.shalygin@gmail.com>

On Tue, Apr 08, 2025 at 10:44:57PM +0200, Eugene Shalygin wrote:
> The arrays have to be sorted by the sensor register bank and index
> because this is what the sensor reading function expects. So sort them
> and leave a comment for future contributors.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> ---
>  drivers/hwmon/asus-ec-sensors.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 006ced5ab6e6..ec428c5e97d4 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -169,7 +169,10 @@ enum board_family {
>  	family_intel_600_series
>  };
>  
> -/* All the known sensors for ASUS EC controllers */
> +/* All the known sensors for ASUS EC controllers. These arrays have to be sorted
> + * by the full ((bank << 8) + index) register index (see asus_ec_block_read() as
> + * to why).
> +*/

WARNING: Block comments should align the * on each line
#123: FILE: drivers/hwmon/asus-ec-sensors.c:175:
+ * to why).
+*/

I'll fix that up and apply the patch, but _please_ run checkpatch on your patches.

Also, this is not the network subsystem. Please use standard multi-line comments.

Guenter

>  static const struct ec_sensor_info sensors_family_amd_400[] = {
>  	[ec_sensor_temp_chipset] =
>  		EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a),
> @@ -183,10 +186,10 @@ static const struct ec_sensor_info sensors_family_amd_400[] = {
>  		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
>  	[ec_sensor_in_cpu_core] =
>  		EC_SENSOR("CPU Core", hwmon_in, 2, 0x00, 0xa2),
> -	[ec_sensor_fan_cpu_opt] =
> -		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xbc),
>  	[ec_sensor_fan_vrm_hs] =
>  		EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
> +	[ec_sensor_fan_cpu_opt] =
> +		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xbc),
>  	[ec_sensor_fan_chipset] =
>  		/* no chipset fans in this generation */
>  		EC_SENSOR("Chipset", hwmon_fan, 0, 0x00, 0x00),
> @@ -194,10 +197,10 @@ static const struct ec_sensor_info sensors_family_amd_400[] = {
>  		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xb4),
>  	[ec_sensor_curr_cpu] =
>  		EC_SENSOR("CPU", hwmon_curr, 1, 0x00, 0xf4),
> -	[ec_sensor_temp_water_in] =
> -		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x0d),
>  	[ec_sensor_temp_water_out] =
>  		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x0b),
> +	[ec_sensor_temp_water_in] =
> +		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x0d),
>  };
>  
>  static const struct ec_sensor_info sensors_family_amd_500[] = {
> @@ -239,19 +242,20 @@ static const struct ec_sensor_info sensors_family_amd_500[] = {
>  
>  static const struct ec_sensor_info sensors_family_amd_600[] = {
>  	[ec_sensor_temp_cpu] = EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x30),
> -	[ec_sensor_temp_cpu_package] = EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
> +	[ec_sensor_temp_cpu_package] =
> +		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
>  	[ec_sensor_temp_mb] =
>  	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
>  	[ec_sensor_temp_vrm] =
>  		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
>  	[ec_sensor_temp_t_sensor] =
>  		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
> +	[ec_sensor_fan_cpu_opt] =
> +		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
>  	[ec_sensor_temp_water_in] =
>  		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
>  	[ec_sensor_temp_water_out] =
>  		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
> -	[ec_sensor_fan_cpu_opt] =
> -		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
>  };
>  
>  static const struct ec_sensor_info sensors_family_intel_300[] = {
