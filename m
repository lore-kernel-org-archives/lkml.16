Received: from server.atrad.com.au (server.atrad.com.au [150.101.241.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490352907;
	Sun, 11 May 2025 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.101.241.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746965785; cv=none; b=surB9jm8L4Az5jsYNnj6wjxYkvmUiIH6L8AuoWclRiy7yuRlCj3xmHS8H50TKSUruSnX/KoQ+NCUyYKPEoNzUpaqGYE2jr+rleyzs6mV5CLHuWDWZpZd+8WJWvq5xFqDiDTmbWrZ1nbLaXR2vQ4VFKyg7VZbAa6itGPnTCTBjKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746965785; c=relaxed/simple;
	bh=ih7wmAXVhDCJyYBR3vLth3h9hrhkplcPDL2t1WrCTpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXVKj0lxrGJwo36vJfuPPH/3ZjQXz8L6sJUt9oCfnEG+pmSuBfVYCX2eXcBxssybeeFsYWVkR5fMB5//XdyZ25t64ZHJhHXk7uB0UGfywHTjU1qUyrYZ/ZFR07FAddPB8gaua1T+ONtBbDqWwNtz/AE8zrQOimZcwHeFyq5nRxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=just42.net; spf=pass smtp.mailfrom=just42.net; arc=none smtp.client-ip=150.101.241.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=just42.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=just42.net
Received: from marvin.atrad.com.au (marvin.atrad.com.au [192.168.0.2])
	by server.atrad.com.au (8.18.1/8.18.1) with ESMTPS id 54BC8bUa030948
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 11 May 2025 21:38:38 +0930
Date: Sun, 11 May 2025 21:38:37 +0930
From: Jonathan Woithe <jwoithe@just42.net>
To: Valtteri Koskivuori <vkoskiv@gmail.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Support Lifebook S2110
 hotkeys
Message-ID: <aCCTRWvlYKX/fObR@marvin.atrad.com.au>
References: <20250509184251.713003-1-vkoskiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509184251.713003-1-vkoskiv@gmail.com>
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.86 on 192.168.0.1

On Fri, May 09, 2025 at 09:42:49PM +0300, Valtteri Koskivuori wrote:
> The S2110 has an additional set of media playback control keys enabled
> by a hardware toggle button that switches the keys between "Application"
> and "Player" modes. Toggling "Player" mode just shifts the scancode of
> each hotkey up by 4.
> 
> Add defines for new scancodes, and a keymap and dmi id for the S2110.
> 
> Tested on a Fujitsu Lifebook S2110.
> 
> Signed-off-by: Valtteri Koskivuori <vkoskiv@gmail.com>

These additions look fine to me.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> ---
>  drivers/platform/x86/fujitsu-laptop.c | 33 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index a0eae24ca9e6..162809140f68 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -17,13 +17,13 @@
>  /*
>   * fujitsu-laptop.c - Fujitsu laptop support, providing access to additional
>   * features made available on a range of Fujitsu laptops including the
> - * P2xxx/P5xxx/S6xxx/S7xxx series.
> + * P2xxx/P5xxx/S2xxx/S6xxx/S7xxx series.
>   *
>   * This driver implements a vendor-specific backlight control interface for
>   * Fujitsu laptops and provides support for hotkeys present on certain Fujitsu
>   * laptops.
>   *
> - * This driver has been tested on a Fujitsu Lifebook S6410, S7020 and
> + * This driver has been tested on a Fujitsu Lifebook S2110, S6410, S7020 and
>   * P8010.  It should work on most P-series and S-series Lifebooks, but
>   * YMMV.
>   *
> @@ -107,7 +107,11 @@
>  #define KEY2_CODE			0x411
>  #define KEY3_CODE			0x412
>  #define KEY4_CODE			0x413
> -#define KEY5_CODE			0x420
> +#define KEY5_CODE			0x414
> +#define KEY6_CODE			0x415
> +#define KEY7_CODE			0x416
> +#define KEY8_CODE			0x417
> +#define KEY9_CODE			0x420
>  
>  /* Hotkey ringbuffer limits */
>  #define MAX_HOTKEY_RINGBUFFER_SIZE	100
> @@ -560,7 +564,7 @@ static const struct key_entry keymap_default[] = {
>  	{ KE_KEY, KEY2_CODE,            { KEY_PROG2 } },
>  	{ KE_KEY, KEY3_CODE,            { KEY_PROG3 } },
>  	{ KE_KEY, KEY4_CODE,            { KEY_PROG4 } },
> -	{ KE_KEY, KEY5_CODE,            { KEY_RFKILL } },
> +	{ KE_KEY, KEY9_CODE,            { KEY_RFKILL } },
>  	/* Soft keys read from status flags */
>  	{ KE_KEY, FLAG_RFKILL,          { KEY_RFKILL } },
>  	{ KE_KEY, FLAG_TOUCHPAD_TOGGLE, { KEY_TOUCHPAD_TOGGLE } },
> @@ -584,6 +588,18 @@ static const struct key_entry keymap_p8010[] = {
>  	{ KE_END, 0 }
>  };
>  
> +static const struct key_entry keymap_s2110[] = {
> +	{ KE_KEY, KEY1_CODE, { KEY_PROG1 } }, /* "A" */
> +	{ KE_KEY, KEY2_CODE, { KEY_PROG2 } }, /* "B" */
> +	{ KE_KEY, KEY3_CODE, { KEY_WWW } },   /* "Internet" */
> +	{ KE_KEY, KEY4_CODE, { KEY_EMAIL } }, /* "E-mail" */
> +	{ KE_KEY, KEY5_CODE, { KEY_STOPCD } },
> +	{ KE_KEY, KEY6_CODE, { KEY_PLAYPAUSE } },
> +	{ KE_KEY, KEY7_CODE, { KEY_PREVIOUSSONG } },
> +	{ KE_KEY, KEY8_CODE, { KEY_NEXTSONG } },
> +	{ KE_END, 0 }
> +};
> +
>  static const struct key_entry *keymap = keymap_default;
>  
>  static int fujitsu_laptop_dmi_keymap_override(const struct dmi_system_id *id)
> @@ -621,6 +637,15 @@ static const struct dmi_system_id fujitsu_laptop_dmi_table[] = {
>  		},
>  		.driver_data = (void *)keymap_p8010
>  	},
> +	{
> +		.callback = fujitsu_laptop_dmi_keymap_override,
> +		.ident = "Fujitsu LifeBook S2110",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK S2110"),
> +		},
> +		.driver_data = (void *)keymap_s2110
> +	},
>  	{}
>  };
>  
> -- 
> 2.49.0

-- 
