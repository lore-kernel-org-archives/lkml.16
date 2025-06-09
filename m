Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5127519EEC2;
	Mon,  9 Jun 2025 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503923; cv=none; b=Flp9zIz8cCal6ZLI1TQzU5akLCmHgj4VWrYK6ka1TvHThjq9h9bJIpFNYcy8Fzo8Zx/VDjAr4vYkLV2Zz+S6Zlq0p6YqbahnBKFcMqFGQ3EuXd7bR97Ng6C8Ib1Xp2XACfGl5p1S2HwyCrsGgEDLvvG0sMwnX6a0kOH0qQ2QQZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503923; c=relaxed/simple;
	bh=xJoCkzTHFII2Mi60zHRabBW2A+evDpfveUNUFpmcOpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4aH+06LD2EP6Y6LPjEXneKo60fELTRfyAOQ1EB7Mh3l34oIv0tHmaOKduGw26U8fB/EJIPJL1g3YpjT3ApdRp9FYiYFdFPbP8ZDKkOY2oKnURZwZvonWZQ0/q9mhujO9VjuREZvi0DbttYRXzGzZOCptTuVM42xhueji+a3c6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMp+l+FA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMp+l+FA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33677183so38750695ad.2;
        Mon, 09 Jun 2025 14:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749503921; x=1750108721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSsMwwgSqr4BTCjxRJOoDw0y53MnRU+ZBYefF29MVmw=;
        b=DMp+l+FA/5gxc0EWMya6tIhmyjHtOpMIvIVBRV7Ab739IGxY7woCfO89Zz87JWS2VL
         RhPLUNVI0C3gAJ0kFfr5TZchgmtkbtIyyhSFXDJ4zh04dKeBQ9g7Pi77AgKvBb8VcfAn
         5Oj53CD6QTpRSQ3vVyCufx7fnsxq+3tkcWSxG83hxQq2lernwIHZg+yuarYAYosWaMRu
         kiG0hZivRHn/VmPEGHA6vr0FSCc2pM/DBVcccPtsrk8IDoE4EPMevCZBB+dQ/cWEXjtF
         +07rePvfI46tACFPVOaQMMkhcw9BbzfteJSaEtcDt99bo9sqpgNBtht/TN98VN88jvzc
         7HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749503921; x=1750108721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSsMwwgSqr4BTCjxRJOoDw0y53MnRU+ZBYefF29MVmw=;
        b=MHF74xZ41xIWb8AUhesqc8Ij9Q7OgSLBgCbaJk7ENS21EM0mSVP+6cJs5/p7lrdNjU
         6EA9gJbUmIHnZMEnIpeFpbYoJcM9kX8xUnZeSWBEAMRMBYZmZTJUWIQ6z83c+YX+6hyu
         VbOefbmVbkW0p9dNgNukl0fMU8wda/uMEKf1dvJuj0COR1kcjt/s0IerX5ld+e/p5Fh+
         Nmm650vth4OIqfC7L1OTggJ9R9XsM1RWY2zhgNNOOyf7v/fme40YRabJWirxQLenyRdj
         7wyrMKUfudqcj5I9/onFUXlR/FmG7EhNiezMROl2sBdM1ikyt1P8lhGRU1NGddR9bqR/
         VOjw==
X-Forwarded-Encrypted: i=1; AJvYcCVfq4ysBVgVwOGhi0W+5QrhWTy+4dHZmYWewOhlb3xF30bWB1ztLrp1o1dBTCmZUAe+C35yxsIdV0mP1phI@vger.kernel.org, AJvYcCW+Bs5cy0ytwvQbkY2FoI4x2BdMx64WGs3AJhPzlHNV4smmJf0Jhl6M5cXdgmgQTiwLWIrn+PwlkA3U7RM=@vger.kernel.org, AJvYcCX0ku7F8ufNMOXef/tdyzF6fta1LzoSWaXodLs4avrX+sHR9NqkJxj4kb0fxKVpBBfwRW6ukDQIrR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZNopD/K2m8SEkiAxH17Fe4gm1mrtLQznAXaWdmYayetIuRjX9
	0eWz2G8CeMUqN6Dod88kBJA9gnR17RjG/hlpfqLa0pwYtyJMSrTVzDgII4ZgrK1P
X-Gm-Gg: ASbGncsNzwjQX+eQuWtEkNkOaojQX1zIshFRKndNhCJq5kT+ZB76oMeJTaifMzXUsi6
	V7P0FkU2jojNcT4Y+tRp6ShJvLNkSYWxZpyOlep8v7VktErpRaQ4mvzwrSxiD3PgCI0mmt4dGum
	hWlJTSyR3q/SLH9tC8iVXK9Qdccz9N0K4RoLWJXMNsuGK9lFKEPeFWbpABwRVVyd4bqJ9YA9qUC
	arXXzW0BjCQ+Y6ovDzLL05FhcBJXarIeOC/veqsy/pRQN4uIuaGXet1UIi2KDjtjHq/JjRTk+3C
	IfTXwLvB4A4r3tJRzTgKlD0V99xO463HE95tI+2EjzCbeuQvYy5q2a+J2RXebxphvP5JdjnAZnw
	=
X-Google-Smtp-Source: AGHT+IFhIr1NPEGHCesvFUOsiL0IbRIaLKXdGMqiphb00NZwhIILS8nAWrOn9dPj/kmxBziadbS6uw==
X-Received: by 2002:a17:902:f602:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-23601d4ed01mr206224695ad.31.1749503920640;
        Mon, 09 Jun 2025 14:18:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034109b9sm58318125ad.207.2025.06.09.14.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:18:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Jun 2025 14:18:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ProArt X870E-CREATOR WIFI
Message-ID: <3bcc0bf3-d9c0-4788-82ca-ed352c27a8d6@roeck-us.net>
References: <20250607102626.9051-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607102626.9051-1-eugene.shalygin@gmail.com>

On Sat, Jun 07, 2025 at 12:26:14PM +0200, Eugene Shalygin wrote:
> Adds support for the ProArt X870E-CREATOR WIFI board.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

I get:

Applying: hwmon: (asus-ec-sensors) add ProArt X870E-CREATOR WIFI
error: sha1 information is lacking or useless (Documentation/hwmon/asus_ec_sensors.rst).
error: could not build fake ancestor
Patch failed at 0001 hwmon: (asus-ec-sensors) add ProArt X870E-CREATOR WIFI
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config advice.mergeConflict false"
failed to apply
Fix problem, then apply manually

What is the baseline for this patch ?

Guenter

> ---
>  Documentation/hwmon/asus_ec_sensors.rst |  1 +
>  drivers/hwmon/asus-ec-sensors.c         | 28 +++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 502b0faf3b31..de2f2985f06f 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -11,6 +11,7 @@ Supported boards:
>   * Pro WS X570-ACE
>   * ProArt X570-CREATOR WIFI
>   * ProArt X670E-CREATOR WIFI
> + * ProArt X870E-CREATOR WIFI
>   * ProArt B550-CREATOR
>   * ROG CROSSHAIR VIII DARK HERO
>   * ROG CROSSHAIR VIII HERO (WI-FI)
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index c3d5bcbd63f8..4ac554731e98 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -165,6 +165,7 @@ enum board_family {
>  	family_amd_400_series,
>  	family_amd_500_series,
>  	family_amd_600_series,
> +	family_amd_800_series,
>  	family_intel_300_series,
>  	family_intel_400_series,
>  	family_intel_600_series
> @@ -260,6 +261,20 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
>  		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
>  };
>  
> +static const struct ec_sensor_info sensors_family_amd_800[] = {
> +	[ec_sensor_temp_cpu] = EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x30),
> +	[ec_sensor_temp_cpu_package] =
> +		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
> +	[ec_sensor_temp_mb] =
> +		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
> +	[ec_sensor_temp_vrm] =
> +		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
> +	[ec_sensor_temp_t_sensor] =
> +		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
> +	[ec_sensor_fan_cpu_opt] =
> +		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
> +};
> +
>  static const struct ec_sensor_info sensors_family_intel_300[] = {
>  	[ec_sensor_temp_chipset] =
>  		EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a),
> @@ -377,6 +392,14 @@ static const struct ec_board_info board_info_pro_art_x670E_creator_wifi = {
>  	.family = family_amd_600_series,
>  };
>  
> +static const struct ec_board_info board_info_pro_art_x870E_creator_wifi = {
> +	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> +		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
> +		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
> +	.mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,
> +	.family = family_amd_800_series,
> +};
> +
>  static const struct ec_board_info board_info_pro_art_b550_creator = {
>  	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
>  		SENSOR_TEMP_T_SENSOR |
> @@ -575,6 +598,8 @@ static const struct dmi_system_id dmi_table[] = {
>  					&board_info_pro_art_x570_creator_wifi),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X670E-CREATOR WIFI",
>  					&board_info_pro_art_x670E_creator_wifi),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X870E-CREATOR WIFI",
> +					&board_info_pro_art_x870E_creator_wifi),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt B550-CREATOR",
>  					&board_info_pro_art_b550_creator),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS X570-ACE",
> @@ -1087,6 +1112,9 @@ static int asus_ec_probe(struct platform_device *pdev)
>  	case family_amd_600_series:
>  		ec_data->sensors_info = sensors_family_amd_600;
>  		break;
> +	case family_amd_800_series:
> +		ec_data->sensors_info = sensors_family_amd_800;
> +		break;
>  	case family_intel_300_series:
>  		ec_data->sensors_info = sensors_family_intel_300;
>  		break;
