Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970629B791
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340299; cv=none; b=Ui9RTbzHaBm2ComA5A6R6wMo6Pg1KtCNpULfxB4nQ1geEVF4TlZL8FarlgBhNbL6us7SYNtgsR7vGIwlHROSjal1i6t5KRjy1vLf8ELOQFfbAORJI/ybCxdRAikJigvYrR9QXEI1l5vjZyG5Ccywkn7rs4h+dvxXnVi6qlSmf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340299; c=relaxed/simple;
	bh=FiWbJnwmfT0QMs33chSC00Ix1UbDLNngmaPHlzd39Bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWLWHeiEkJX14m1xchdnwpwkUR5HXVDlkmXfW1AZ5w1GsoJs572OX6IidV3z1tNOzFzU5v6VsbdZZmA/uRiMYYNfJ41PsphEXFQj6NlTpv7emXxkDgSqexZK/pQ6CwOXnqsX1jepvlv9quoWfzyXj+NKS6tewnmThYa5zRAOZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFOqarp9; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFOqarp9"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-731e277a6b0so1616448a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747340295; x=1747945095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORIH55nECeHA8LdRURYjVDonMGKHgsrmuMpr+vgfdSY=;
        b=NFOqarp9+Bkke7Rg3OxO5UrVxghEAwU+/aP7s6/6IkMptNR3ajQzu7LbBurQEPOejK
         oFyo/BODcUZV/mZfl4MiBDHCDhsQ2uJvWcrgABeYRcBAxxfeT1GO8ErRSZUK7MGx44jd
         yPVgm27VswQfeSgjYpuvWh7xz2x1+EaRRv3ZHSpPboZALbSvHSmy1j+8DRtyThjm9kkt
         SwT1tO8QJW3q5RKl//AL24h4g6u4CYxM9BihCsCE5Gstv3iKqZEvevuw5BXIG+jGq5uo
         Gxkt+1q9a8u/YZy3CaWxFzDKspNNEwVXTjR/SiLlPqBoCvDZmAOrhwZ8CApl0EaTf8TA
         rfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747340295; x=1747945095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORIH55nECeHA8LdRURYjVDonMGKHgsrmuMpr+vgfdSY=;
        b=FpstgfpUv26aIV8uIx9mg/VowHDtRqt4lq7r3HefKNZxcX06jQtvzBs6mb+l2KQUQZ
         nOxb7zY4y1WdmnqEsGcGaK9j7eW1HPYa2rO/M5lZgdwL7tA5lHYeVU8EA5ve+zj2fssd
         LXrim2hlJ3h2I5M6L42p/DRDzGEXAQe1w2UFvK0JetRu3M/0xrhrPrj4T0UEYo/lPzuS
         /SRBBWRlfzwPizreWHIW9kPV2+Y4DK0drH1k3KVFwLEn4YSaT+7IU+l3K4DzlBaqk0bk
         63d6sYQRqWAv49ZIJ5y9sA9mgyXcHseR0g0B4XdIg4nF434GIt11ENVMt2t069nuNqTt
         zKEA==
X-Forwarded-Encrypted: i=1; AJvYcCVBp+ytvl2CJhc296xImMLftk96tbdx2euGeXQZ8JBeBoYIKyovnf9yncgscZoIp/LweNaWT4204VWFUNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYd0kVm/la6UpEfMylE/qfIqM9voEbnAcH302cXQ6GUN8pVhlU
	/Vt0YjvezYlQQl9R4TfTCZBEzQlkfNY0jjTJAv3aTsDeXMTOEOzhXqSV
X-Gm-Gg: ASbGncscswrfIw9sTMJskDSC+rG1HqhzxNcI8REVd/zJ1u3E9uwdjMLTKnCEsF73/pY
	/wd5+Br3EZH91Uz8tZXNQBZ8HGc6uuF6WU/7+jqP7QV6V5OAwtalOMNSwUzksM5Fuest+ANG7/7
	wln205Vp7+1jjk4yZQoMrpkXoWuHUcXmT/qFGNsdjiRkqZAV+ZygHbETE4yio4m4HSey7Ht+9Wi
	WA4CyVir80DDQHMbRBzdP6jdfKTX8u45ZWSd//t54WgUT3fECSxm3fcIGFtnEWytnCY4wx2jNmT
	ScEB0bFu93NFt0xl4/jqbTTWhRw3woKznMKkB85isWVMhrN89ewmeKLx/Lo+r9c5298nQXaYWRG
	pN/eZtzqV4TqcemlDiV/A
X-Google-Smtp-Source: AGHT+IGZ6iGkEs8/AH2Bd1WLfM05uSAVYmHniGGxt7DIrP1bhSS+eA9OMmxLChw99pSYQjBXZX778A==
X-Received: by 2002:a05:6830:681a:b0:72b:9c34:1361 with SMTP id 46e09a7af769-734f6b0465cmr757134a34.15.1747340294735;
        Thu, 15 May 2025 13:18:14 -0700 (PDT)
Received: from [10.0.0.9] (104-50-4-201.lightspeed.sntcca.sbcglobal.net. [104.50.4.201])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b5ffdesm87785a34.60.2025.05.15.13.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 13:18:14 -0700 (PDT)
Message-ID: <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
Date: Thu, 15 May 2025 13:18:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/print: require struct drm_device for drm_err()
 and friends
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, gustavo.sousa@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org,
 kees@kernel.org
References: <cover.1737644530.git.jani.nikula@intel.com>
 <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
Content-Language: en-US
From: Bill Wendling <isanbard@gmail.com>
In-Reply-To: <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/25 7:09 AM, Jani Nikula wrote:
> The expectation is that the struct drm_device based logging helpers get
> passed an actual struct drm_device pointer rather than some random
> struct pointer where you can dereference the ->dev member.
> 
> Add a static inline helper to convert struct drm_device to struct
> device, with the main benefit being the type checking of the macro
> argument.
> 
> As a side effect, this also reduces macro argument double references.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   include/drm/drm_print.h | 41 +++++++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9732f514566d..f31eba1c7cab 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>    * Prefer drm_device based logging over device or prink based logging.
>    */
>   
> +/* Helper to enforce struct drm_device type */
> +static inline struct device *__drm_to_dev(const struct drm_device *drm)
> +{
> +	return drm ? drm->dev : NULL;
> +}
> +
>   /* Helper for struct drm_device based logging. */
>   #define __drm_printk(drm, level, type, fmt, ...)			\
> -	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
> +	dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
>   
>   
>   #define drm_info(drm, fmt, ...)					\
> @@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>   
>   
>   #define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> -#define drm_dbg_driver(drm, fmt, ...)						\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +#define drm_dbg_driver(drm, fmt, ...)					\
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>   #define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
>   #define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
>   #define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>   #define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
>   #define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
>   #define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>   #define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
>   #define drm_dbg_drmres(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>   
>   #define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>   
> @@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
>   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
>   ({												\
>   	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
> -	const struct drm_device *drm_ = (drm);							\
>   												\
>   	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
> -		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
> +		drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __VA_ARGS__);		\
>   })
>   
>   #define drm_dbg_ratelimited(drm, fmt, ...) \
> @@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
>   /* Helper for struct drm_device based WARNs */
>   #define drm_WARN(drm, condition, format, arg...)			\
>   	WARN(condition, "%s %s: [drm] " format,				\
> -			dev_driver_string((drm)->dev),			\
> -			dev_name((drm)->dev), ## arg)
> +			dev_driver_string(__drm_to_dev(drm)),		\
> +			dev_name(__drm_to_dev(drm)), ## arg)
>   
>   #define drm_WARN_ONCE(drm, condition, format, arg...)			\
>   	WARN_ONCE(condition, "%s %s: [drm] " format,			\
> -			dev_driver_string((drm)->dev),			\
> -			dev_name((drm)->dev), ## arg)
> +			dev_driver_string(__drm_to_dev(drm)),		\
> +			dev_name(__drm_to_dev(drm)), ## arg)
>
Hi Jani,

These two changes introduce undefined behavior into these macros. The final
code generation becomes this (from 'bxt_port_to_phy_channel'):

	__warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
		      dev_driver_string(__drm_to_dev(display->drm)),
		      dev_name(__drm_to_dev(display->drm)),
		      (port + 'A'));

The issue lies in 'dev_name(__drm_to_dev(display->drm))'. After inlining, it
becomes this (pseudo code):

	struct device *device = display->drm ? display->drm->dev : NULL;
	const char *name = device->init_name ? device->init_name
					     : kobject_name(&device->kobj);

	__warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
		      dev_driver_string(device), name, (port + 'A'));

The issue, of course, is that the 'device' may be NULL when attempting 
to get
'device->init_name'. The compiler sees this as undefined behavior, which may
lead to unexpected outcomes, especially with Clang where paths 
determined to be
undefined are removed entirely under certain conditions.

(Note, I'm working on making this behavior less draconian by adopting a GCC
pass, but this will take time to filter out to Linux devs.)

Regards,
-bw

