Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A61EC017
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254355; cv=none; b=cJsEQbsalNTNfl1HUumrMIzH4SJGqn4HfHXSn11nZQ9828c2GRcNLOhIeEdtJqBV9pirE31ZdOnAMEo+yqsx8mje/JDxM/CtGJz4I0svJVUEQTtR9jm88MjKMBoAGNqWDAtQpeC8f+MX6jR7P/S2uk5rnmfopaUKcWRgQsSQCDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254355; c=relaxed/simple;
	bh=7Lqg6NREYGWflm64mxMDprVkTQqsuRwJjcE3EcFO/II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0WA/5oaM5gkNQ2NBvnRICbw2ptk/Xm2IvCiy6IREaRWBcRD3azy62KjFDFEwH6hzJ3/kTvvkpaoHqwU+o7dA6O7RLatQimjGZTdZImfV57riyMIbxDlGl8u6vp4Bx2mtjcMbfvBguTnsLiIhVDTkTdFvYqgREBdAPfsuUzdkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FaDOceWH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FaDOceWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738254352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hy38aCSXSqQp305EOx/F8NrfvRtmqoW5j4bK8F6Fzp8=;
	b=FaDOceWHJHIfO6NPmM07Yw7DZgQTqPuhAF9rjOOnv2b9BknlLZ2daKyKSZL/6SdYQDVMLF
	QnU5s4HkqwGCJ5yFrH44tT2vXB8pRjOrM6JPnZLAhTQZ7ldQvGxjhia+l2yYMRk6L8Tok6
	6EMJ+LPwhpiMzALBaM1ujm3zrREV61I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-WSpAXTfJMg6NycTxhi0xnw-1; Thu, 30 Jan 2025 11:25:50 -0500
X-MC-Unique: WSpAXTfJMg6NycTxhi0xnw-1
X-Mimecast-MFC-AGG-ID: WSpAXTfJMg6NycTxhi0xnw
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5dc5beb5eb0so755094a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254349; x=1738859149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy38aCSXSqQp305EOx/F8NrfvRtmqoW5j4bK8F6Fzp8=;
        b=kwsywbyVeefbnKNF4WFUxqVh1ftgYQVWiavlTf+jcLMq2X8zIo5tL+ijjs2Zvoc10d
         O8OXRdQun50F6tYRSO6eS33Ej9iqHJ+1W1pMNKw6WPrf9hJ2lrAMSoXIsY8YwOsUdlP/
         1fkpsB5MIS14mGq4YV7PINObGRa6hwlwJ+n+cMf6XwR3S/W3NDkp+yxBN78Xt/XpJ2lk
         rBakOrcAQwy9+XWQJwIzhp0rRvrhTITYYALGqQyuSYYOB1s+IeVW3lTl6GZgtEd6+SO8
         bj9fBtS7DxJ7wHFoCW3ALPu72JUkwFy1yywU49giMpKLl2Ji6ZB2TCr2/eVVizLnE79g
         u45Q==
X-Forwarded-Encrypted: i=1; AJvYcCVut2wiIs2fwsezbhDxxHm6Ky7Z7tOmMcgmhZlMkja+cr06hyB5thgPbxUJm1PCVmr8k9nGRYKe13uzWj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YydG1T8J9eyxFt261bE62l8/frHpEd8nqB2bop5wQfNc+5KnFeu
	Osic74xW2/uQsK27y6RP+7UvcC0u2tT7IWX4VxAO46UEv6LdQ5RVrpfOvfEpcjlW8lzguG7fuyK
	z1EzvoSZN6B6jOAAj3xecHkvyOjMHhjAszDdANILS1CX2cHM3fu8UoVfNMcZQ0Q==
X-Gm-Gg: ASbGncuuNDTZRNaPnW+WfVjz6elhtjK4h9cXNBMPT4eO9IkiONpTQz67QSBQnNBdNPn
	2G7j7AmKml2mDCwuPV5DhOniMe6BcTnYKUp/uc0l6mNXeb5wElITbPSQ1xQB3l29FY5le8xYB7o
	wzsXyQAwBgbz7TSDaORyjwVBk5YZm9rz+hHaIjs4OcVimiVIKGT230vcQff0RKpWkT5HihecIRa
	WfF8GMhZ+fjVU+uI1bAYyR4pFtqnvS2dguj8Rn51PrKpdnIzbx4p/+Cw3BfsuW2t4tAGyL5ftu4
	om1XXkIm75/H/iQ4xuYJIUlLmwmRSbYaCLSY4Mfs0iU4wigtUEay6moKblwtDmX+DiTut+f1Sgp
	+iZd7KGKOgEPEn/BT+Wj7yqHYayPmlBqN/Y+JSNRtfx62+Uwa9AW8PdA=
X-Received: by 2002:a05:6402:510f:b0:5dc:5ada:e0c7 with SMTP id 4fb4d7f45d1cf-5dc5efec13emr20789185a12.26.1738254349193;
        Thu, 30 Jan 2025 08:25:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY3KxKvpN5lcr79kxTwcKeoCjuuN7CRVhpaL8K4DhHdEjBE6BXjDzpVPAmsIVIOyQNxYzWRA==
X-Received: by 2002:a05:6402:510f:b0:5dc:5ada:e0c7 with SMTP id 4fb4d7f45d1cf-5dc5efec13emr20789130a12.26.1738254348717;
        Thu, 30 Jan 2025 08:25:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a56cafsm142919766b.168.2025.01.30.08.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 08:25:48 -0800 (PST)
Message-ID: <5a12b6f5-c501-4c7f-b27b-c9e63fbcffa1@redhat.com>
Date: Thu, 30 Jan 2025 17:25:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Support for V9 DYTC platform
 profiles
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20250130154520.26469-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250130154520.26469-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 30-Jan-25 4:45 PM, Mark Pearson wrote:
> Newer Thinkpad AMD platforms are using V9 DYTC and this changes the
> profiles used for PSC mode. Add support for this update.
> Tested on P14s G5 AMD
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 33 ++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 1fcb0f99695a..cae457bc0b07 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10319,6 +10319,10 @@ static struct ibm_struct proxsensor_driver_data = {
>  #define DYTC_MODE_PSC_BALANCE  5  /* Default mode aka balanced */
>  #define DYTC_MODE_PSC_PERFORM  7  /* High power mode aka performance */
>  
> +#define DYTC_MODE_PSCV9_LOWPOWER 1  /* Low power mode */
> +#define DYTC_MODE_PSCV9_BALANCE  3  /* Default mode aka balanced */
> +#define DYTC_MODE_PSCV9_PERFORM  4  /* High power mode aka performance */
> +
>  #define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
>  #define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
>  
> @@ -10339,6 +10343,10 @@ static int dytc_capabilities;
>  static bool dytc_mmc_get_available;
>  static int profile_force;
>  
> +static int platform_psc_profile_lowpower = DYTC_MODE_PSC_LOWPOWER;
> +static int platform_psc_profile_balanced = DYTC_MODE_PSC_BALANCE;
> +static int platform_psc_profile_performance = DYTC_MODE_PSC_PERFORM;
> +
>  static int convert_dytc_to_profile(int funcmode, int dytcmode,
>  		enum platform_profile_option *profile)
>  {
> @@ -10360,19 +10368,14 @@ static int convert_dytc_to_profile(int funcmode, int dytcmode,
>  		}
>  		return 0;
>  	case DYTC_FUNCTION_PSC:
> -		switch (dytcmode) {
> -		case DYTC_MODE_PSC_LOWPOWER:
> +		if (dytcmode == platform_psc_profile_lowpower)
>  			*profile = PLATFORM_PROFILE_LOW_POWER;
> -			break;
> -		case DYTC_MODE_PSC_BALANCE:
> +		else if (dytcmode == platform_psc_profile_balanced)
>  			*profile =  PLATFORM_PROFILE_BALANCED;
> -			break;
> -		case DYTC_MODE_PSC_PERFORM:
> +		else if (dytcmode == platform_psc_profile_performance)
>  			*profile =  PLATFORM_PROFILE_PERFORMANCE;
> -			break;
> -		default: /* Unknown mode */
> +		else
>  			return -EINVAL;
> -		}
>  		return 0;

Maybe replace the removed '}' with an empty line instead of
removing the entire line?

Currently after your patch the new code looks like this:

			...
		else
			return -EINVAL;
		return 0;

which look a bit weird, personally I would prefer:

			...
		else
			return -EINVAL;

		return 0;

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





>  	case DYTC_FUNCTION_AMT:
>  		/* For now return balanced. It's the closest we have to 'auto' */
> @@ -10393,19 +10396,19 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
>  		if (dytc_capabilities & BIT(DYTC_FC_MMC))
>  			*perfmode = DYTC_MODE_MMC_LOWPOWER;
>  		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
> -			*perfmode = DYTC_MODE_PSC_LOWPOWER;
> +			*perfmode = platform_psc_profile_lowpower;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
>  		if (dytc_capabilities & BIT(DYTC_FC_MMC))
>  			*perfmode = DYTC_MODE_MMC_BALANCE;
>  		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
> -			*perfmode = DYTC_MODE_PSC_BALANCE;
> +			*perfmode = platform_psc_profile_balanced;
>  		break;
>  	case PLATFORM_PROFILE_PERFORMANCE:
>  		if (dytc_capabilities & BIT(DYTC_FC_MMC))
>  			*perfmode = DYTC_MODE_MMC_PERFORM;
>  		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
> -			*perfmode = DYTC_MODE_PSC_PERFORM;
> +			*perfmode = platform_psc_profile_performance;
>  		break;
>  	default: /* Unknown profile */
>  		return -EOPNOTSUPP;
> @@ -10599,6 +10602,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (output & BIT(DYTC_QUERY_ENABLE_BIT))
>  		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
>  
> +	dbg_printk(TPACPI_DBG_INIT, "DYTC version %d\n", dytc_version);
>  	/* Check DYTC is enabled and supports mode setting */
>  	if (dytc_version < 5)
>  		return -ENODEV;
> @@ -10637,6 +10641,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  		}
>  	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
>  		pr_debug("PSC is supported\n");
> +		if (dytc_version >= 9) { /* update profiles for DYTC 9 and up */
> +			platform_psc_profile_lowpower = DYTC_MODE_PSCV9_LOWPOWER;
> +			platform_psc_profile_balanced = DYTC_MODE_PSCV9_BALANCE;
> +			platform_psc_profile_performance = DYTC_MODE_PSCV9_PERFORM;
> +		}
>  	} else {
>  		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
>  		return -ENODEV;

