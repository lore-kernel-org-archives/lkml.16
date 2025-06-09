Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB0D4C9D;
	Mon,  9 Jun 2025 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749454310; cv=none; b=Wix/ZyzGdqb372ZcUrzIMsVZ+0E6DmLTR4v4uV3dgahvcN27RWD/WQAM92l/7c27wIUg9EBvSFMDKHcyrNiTGETwgw3aV8kVUWXcLsVCcCZAHX61+gmWO+rbZzISgkFkTPWlVJerkuv+EA5qwfTLB/vD4tPqpPskus2ngLLVbuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749454310; c=relaxed/simple;
	bh=fb+W7sXAWzNH0PE19jdTc2gtT9i5OfB0Mtxws+pYHGo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mNwgAkHZUOAzXPvIry/mAL9be9ikqiwb3nxvPoc41g5qbQSdiRqj5LZ4GYfyimnILTbL6f4uLrDR3Wk0noZvu2Rv8b5iI+vJNLXVri6meQuxFt9vHxucX6PD/riq1MfAzpQArtDoVtx+oLYEY3Af4pW6K38lQFs5KZCwVZ7x9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHX0RLkq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHX0RLkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749454309; x=1780990309;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fb+W7sXAWzNH0PE19jdTc2gtT9i5OfB0Mtxws+pYHGo=;
  b=nHX0RLkqvW+TMfXSv19/4Y/pexFZMtdIe3GdCwKdR7XerRQeKQrxkpPr
   eEReKjrR+nzdesdTtC8jJ9r+JTfbenf03creSfeInsmmSmuK2IX778roV
   q5jLpOHqWQI4lI+6GIkCFhwGexm8ECyh0ACz/5BuNz6q43pudwxGE0IFP
   kblHdZWPI1LLtQV2DmyDrWA8zw/7in5d555G1jafK0PD4V3/rMS5TfkIQ
   6OmMAZs6Ea5wOhimsmg1F+T/6LMfKgiAnQGqH6KASGLdRLb4RN3OLGdjj
   JCQ0PpqC3hYwvbdE0mygW1sS/sglarDeZkLTAjxwuUJ80idCnW8h7CCLt
   Q==;
X-CSE-ConnectionGUID: XW+cYLo4TES4TCeTz3023g==
X-CSE-MsgGUID: cdfktCKbSgqpzg/W3iRYtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55189205"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55189205"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:31:48 -0700
X-CSE-ConnectionGUID: 6cneVES+Rq+Ta4vXyE514A==
X-CSE-MsgGUID: kLB5YLdoQWurUOmAbpFceQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146342223"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:31:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Jun 2025 10:31:42 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] asus-wmi: fixup screenpad brightness
In-Reply-To: <20250525204214.104030-1-luke@ljones.dev>
Message-ID: <c9b74180-8e3b-2ed8-bb68-03ca9d8ed074@linux.intel.com>
References: <20250525204214.104030-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 May 2025, Luke Jones wrote:

> Fix up some inconsistent behaviour involving the screenpad on some
> ASUS laptops. This fixes:
> - illogical screen off control (0/1 flipped depending on WMI state)
> - bad brightness depending on the last screenpad power state
> - incorrect brightness scaling

Why did you put them all into a single patch? I understand there's some 
overlap in lines they touch but if they can be separated, it would be 
much better and I'd likely have much higher confidence on each change.

> Signed-off-by: Luke Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 52 +++++++++++++--------------------
>  1 file changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index f52884e90759..cec509171971 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -123,7 +123,6 @@ module_param(fnlock_default, bool, 0444);
>  #define NVIDIA_TEMP_MIN		75
>  #define NVIDIA_TEMP_MAX		87
>  
> -#define ASUS_SCREENPAD_BRIGHT_MIN 20
>  #define ASUS_SCREENPAD_BRIGHT_MAX 255
>  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>  
> @@ -4239,43 +4238,37 @@ static int read_screenpad_brightness(struct backlight_device *bd)
>  		return err;
>  	/* The device brightness can only be read if powered, so return stored */
>  	if (err == BACKLIGHT_POWER_OFF)
> -		return asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
> +		return bd->props.brightness;
>  
>  	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &retval);
>  	if (err < 0)
>  		return err;
>  
> -	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) - ASUS_SCREENPAD_BRIGHT_MIN;
> +	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK);
>  }
>  
>  static int update_screenpad_bl_status(struct backlight_device *bd)
>  {
> -	struct asus_wmi *asus = bl_get_data(bd);
> -	int power, err = 0;
> +	int err = 0;
>  	u32 ctrl_param;
>  
> -	power = read_screenpad_backlight_power(asus);
> -	if (power < 0)
> -		return power;
> -
> -	if (bd->props.power != power) {
> -		if (power != BACKLIGHT_POWER_ON) {
> -			/* Only brightness > 0 can power it back on */
> -			ctrl_param = asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
> -			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
> -						    ctrl_param, NULL);
> -		} else {
> -			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
> -		}
> -	} else if (power == BACKLIGHT_POWER_ON) {
> -		/* Only set brightness if powered on or we get invalid/unsync state */
> -		ctrl_param = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
> +	ctrl_param = bd->props.brightness;
> +	if (ctrl_param >= 0 && bd->props.power) {
> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1,
> +					    NULL);
> +		if (err < 0)
> +			return err;
> +		ctrl_param = bd->props.brightness;
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
> +		if (err < 0)
> +			return err;
>  	}
>  
> -	/* Ensure brightness is stored to turn back on with */
> -	if (err == 0)
> -		asus->driver->screenpad_brightness = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
> +	if (!bd->props.power) {
> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
> +		if (err < 0)
> +			return err;
> +	}
>  
>  	return err;
>  }
> @@ -4293,22 +4286,19 @@ static int asus_screenpad_init(struct asus_wmi *asus)
>  	int err, power;
>  	int brightness = 0;
>  
> -	power = read_screenpad_backlight_power(asus);
> +	power = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
>  	if (power < 0)
>  		return power;
>  
> -	if (power != BACKLIGHT_POWER_OFF) {
> +	if (power) {
>  		err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
>  		if (err < 0)
>  			return err;
>  	}
> -	/* default to an acceptable min brightness on boot if too low */
> -	if (brightness < ASUS_SCREENPAD_BRIGHT_MIN)
> -		brightness = ASUS_SCREENPAD_BRIGHT_DEFAULT;
>  
>  	memset(&props, 0, sizeof(struct backlight_properties));
>  	props.type = BACKLIGHT_RAW; /* ensure this bd is last to be picked */
> -	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX - ASUS_SCREENPAD_BRIGHT_MIN;
> +	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX;
>  	bd = backlight_device_register("asus_screenpad",
>  				       &asus->platform_device->dev, asus,
>  				       &asus_screenpad_bl_ops, &props);
> @@ -4319,7 +4309,7 @@ static int asus_screenpad_init(struct asus_wmi *asus)
>  
>  	asus->screenpad_backlight_device = bd;
>  	asus->driver->screenpad_brightness = brightness;
> -	bd->props.brightness = brightness - ASUS_SCREENPAD_BRIGHT_MIN;
> +	bd->props.brightness = brightness;
>  	bd->props.power = power;
>  	backlight_update_status(bd);
>  
> 

-- 
 i.

