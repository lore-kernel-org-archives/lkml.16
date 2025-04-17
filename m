Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57332241661
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891287; cv=none; b=NWgLjSskWA1SnA1ivLYZh9Ao8Ks9Ih1gve8pZeB3wRPtxBsjnW//hakBWE/hl//T+MIeiT/c+vuWl7FFBrQYOiL0EfQLJT/EoYE2ekadS/GjN6Efm3S4YQgmuV5+u5D9XcVPqYdpdcnqhk1UAhEn7e16OAggsVwtAwl5aCrzjRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891287; c=relaxed/simple;
	bh=q7I3/RpQmTN6MoNDGV1EavkWMU3XXdQLimSge7zDQMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0+kpglk3y2Hrscdm6v01QAETlnW6KOK6KNyNnP53Z5P+PjM4X2pVWAtCGrYl78pnCZ/p2naovC5pWWqZCbpd2r3p5DmtOkJGWGtGbHbBIneAlq/gUlCsWcVB4EqMkKIAS2XhU1hYqUXweAq+5VVcEIU9SgABBauxvbLYoWarXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQbGfHJa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQbGfHJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744891284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qOPCjuavnB7ezWX43SKhkW55SVINpFnQWoZnioCFjQ=;
	b=KQbGfHJayS6lRhGcNF/wo1y/s2PkKJY7Jri2B4EJSM/W43NJ0U5AVdFTAY/QjRG8ulz5Pc
	mYKK64nfEA05LdjgREQRmI+shajFEOaWxn2SZ8quuk0z6NPix2iWIZG4P/Rh9zVJXSjFC+
	bxBsv/W/27xlrbiH2o6OA4aZm8mICsI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-s9aEzaArPLS7tiw05h9tgQ-1; Thu, 17 Apr 2025 08:01:22 -0400
X-MC-Unique: s9aEzaArPLS7tiw05h9tgQ-1
X-Mimecast-MFC-AGG-ID: s9aEzaArPLS7tiw05h9tgQ_1744891281
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ab397fff5a3so70318166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744891281; x=1745496081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qOPCjuavnB7ezWX43SKhkW55SVINpFnQWoZnioCFjQ=;
        b=sXffQgJooL5L4CEpWgXa1CZo83L0OWnwzbdGjMnBCZNtlfYUu2Z/9+giJA8WL0QAv8
         rFFrKpQKCYmkcX/jlHu4Dgx2a180J0CQ9bieMN4Q/E2PiejGAAuzPJuRQHlFyOGYh7i3
         BWmClTonnfEpWOCrEgXzOe+0ANjdY0x+MXUgCZYVMu9Uwa2a/ntjcow7VpJXfmslK/CM
         okp2vr9LfFgOj2+QBD7IdXS1p3sSeIuC7RmTHDZ1tb3mu6rFuyRLg/Zc5yLaNptrUCFa
         llraUuQwZWMlE8/QkyiO+3hJeuldsDg9uRJWbEZaiq6ho0DL3GD5wsn+YD4mZQG09PCj
         h5xA==
X-Forwarded-Encrypted: i=1; AJvYcCXVitFGwtUjhhVTP5rexIPZMispL5U6UxGwEEj2DLH20bYo/fGHj7ZjGdWgWHQXpT4tHlo6KCDKs1grKxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4F94zVtn2IzoT68O3LF1RyXKINcOGgcxwq68h08wpWvtwl4o8
	puIL9ixAzeMubuWjOZ7h6errtU3D66YH7fq9FXERrlSiLz2JyzLExVyiqZXM8CZfaWpl5Epikz2
	My5K1BSg3Co32NjuX+E+a/SEF9F9wwW82OGhRb4DB/K9uQjwoyqDsyMlcpI3K7w==
X-Gm-Gg: ASbGncsZLJCNLtllGChnVz1tmiIIE3U0kJDs0R7kcpfSnu/jlOZWfePk3RBqJwFySIN
	Twcdg87AHAF8bP/sBI4gq2wvaMW0QFE7TW5QsMBfGozlKBtWZesQGkX1NtiCQWtO3HsbpKRVQdM
	HnEBMSSk+VrEjglRUnPuz/d+Sb9t3bv3yLaZnRBG6b+MyzL0CHZzPX+8D1MQmE6WNmwBC2rTXra
	ZqaiNzF3WPUapVBdtgw1S9vTQReMsNdGeZls8kuhZPZ0HSDZMvC7GEg+1oJkAQwokj68p3lYPhq
	H2fpNgLdUSVp1EVHfZlLioOsdz4XH4kkzTPxYCzhyZ4Dml1pQO4MMLimVl4f3M1XwDrn60/oQef
	VrXKfeSo6pYFKigtChj2nPgxiLrJ25ZpjtQeuLCzwiZAmfykUwKBVNxUNR7Z90g==
X-Received: by 2002:a17:906:9f91:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-acb5a6d2879mr215186466b.25.1744891280566;
        Thu, 17 Apr 2025 05:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCYG+OnjfWgFaSgXL5p8/4dv7JXzoaDKipsv68STYI5zQkFZ02diAwyfVQpcEHlXU5gm1yjQ==
X-Received: by 2002:a17:906:9f91:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-acb5a6d2879mr215177766b.25.1744891279734;
        Thu, 17 Apr 2025 05:01:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdddda0sm282554566b.63.2025.04.17.05.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 05:01:19 -0700 (PDT)
Message-ID: <f5577099-d7f7-4f37-b84f-5a57d2e11e79@redhat.com>
Date: Thu, 17 Apr 2025 14:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5] platform/x86: ideapad-laptop: added support for some
 new buttons
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ikepanhc@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250417113419.110856-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250417113419.110856-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

On 17-Apr-25 1:34 PM, Gašper Nemgar wrote:
> Added entries to unsupported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
> ---
> Changes in v5:
>  - Changed performance button to KE_KEY 
> Changes in v4:
>  - Changed performace button to KE_IGNORE
> Changes in v3:
>  - Minor changes
> Changes in v2:
>  - Added more codes that trigger with key combos (Fn+N, Fn+M, ...)
>  - Added performence toggle in wmi_notify()
> Changes in v1:
>  - Added codes for buttons on laptop(performance, star, ...)
> ---
>  drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 17a09b778..320ce9d2d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Specific to some newer models */
>  	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/* Star- (User Assignable Key) */
> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +	/* Eye */
> +	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
> +	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },

Almost there, you still forgot to change this KE_IGNORE back to KE_KEY,
also you forgot to bump the version to 6 for this v6 patch.

Regards,

Hans



> +	/* shift + prtsc */
> +	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
>  
>  	{ KE_END },
>  };
> @@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>  			data->integer.value);
>  
> +		/* performance button triggered by 0x3d */
> +		if (data->integer.value == 0x3d) {
> +			if (priv->dytc) {
> +				platform_profile_cycle();
> +				break;
> +			}
> +		}
> +
>  		/* 0x02 FnLock, 0x03 Esc */
>  		if (data->integer.value == 0x02 || data->integer.value == 0x03)
>  			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);

