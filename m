Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D1232364
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887932; cv=none; b=IBAgmcAx425kmSZec5Qf+0aGQ9D8LjRfGPgmbjQOstlDghNe4E5NDHn8EY64meT6ut/YYrerEYzivg33URhwypE8QucbZUp703LGGUO6KQI4nUBmZHxFX6pNvR5wlPCSNmodYuXbDyZky1lGqkIdyNDUQzInAEhNGrjWhi7wmAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887932; c=relaxed/simple;
	bh=2RTZR8IFl5oEN43eVttt7D87g+0xPwgs+88bM0fjK3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E125XjEsDuOdwzhO92HNC7M6kG2CptUOhCNi14AhLbK93p0MYqNrpu10H4M43AW/bGpJya0mEN2Fz6p6MFBQr6DhJl1UVGQd7uzhWwmD67WbMCHcVhhK8paEeCbqK5/71eP+eTqJlmH5sgYAodyaBg1OXmAxQ6ZM044vwuCqB/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LUvMhJom; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LUvMhJom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744887929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vb6ydcQpU6OPgxy5Yq868Uksnx40kbsFgq9Ph3XPow=;
	b=LUvMhJomxCmamgnozVDn4HZYarlfsQi9zZJAyOcPf723nfwfg+zn/BFMhG62fGApcdaM+o
	j6rxbf/vPbQY6HkdOZwpB9Eb2aeZXkcIqWWcRIFa5ikCwg8z7yYHbGeE+S5J33rQ0aCe2b
	wfrAUd45tsqcdtl6HbHDqB8a3+vM8nM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-MUXyWAKwOM-Rj3tzvFxVAg-1; Thu, 17 Apr 2025 07:05:28 -0400
X-MC-Unique: MUXyWAKwOM-Rj3tzvFxVAg-1
X-Mimecast-MFC-AGG-ID: MUXyWAKwOM-Rj3tzvFxVAg_1744887927
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3e0c13278so27764266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744887927; x=1745492727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vb6ydcQpU6OPgxy5Yq868Uksnx40kbsFgq9Ph3XPow=;
        b=J5hxCcOvD84fbAvqB/6+Y+o8CoCmhbt6y+HlyAQ7CMpSZ0HSiGpshL8BXKu9kdHqxl
         LdTzu2LSOVskQGL/rA1YLw6YzdW5ztglFb6Hw0QXKZXvF3bfQTM+UkJc02x/a2afGSHG
         f+KGiiHLSNTE2EiyK7AIUSRryOkMhNvAMop9/5/fBfEmL9jhdTg2IrlCSUL8ltKkE2OB
         cjUGCl2ulfQu3ciiMuRSuWbylTjsL+0pX75+DclBWssbROyLfw4PXAXU0Pq/4anEP7np
         EbHrFIPiCalKNZnNrjHDWeXS0bTPevrRjgOg/2uqvjDhyUNZYcgNpdf8zQIe1/R1mihQ
         TTRw==
X-Forwarded-Encrypted: i=1; AJvYcCWTC6Zqt5ec6DbiPfzHQdn9icYnP0kh6YB8xERgZ2BrhXZyltuLujFmTLVAqAfT61EVDlX2WwaBB/sxnt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfiahZL3Qe9OpS0SR/A2sE/rcFkTvWiR4wcJhrUUfjpEwJO2vQ
	A2ofACJo33DdRpDX8iSt/tFzXjrmVJsfLdN2aS30y1vnf+wD4MGfhprwudqlL1MIxS2nd+Zc8D7
	382KT3Js4xnGS21EGO/QnVxspdEMWXmbN80jEpV1mNqkhn0SjgxCGdDyLoPeRsif6ceUSPQ==
X-Gm-Gg: ASbGncsdv8Obx0U1qs50bzugc96TXwDQ84NRaMg/w6wgDqr+f47NUOK66orRI75F1Is
	4I0updB5x3LoNx/F9Xh8x4rkynadqbfMhzOv+WU4uZyuKDFgY6ebtDx2nqXg5hvWDtGHrgitjmz
	o0yTlX3BKXs314en3/wgDBcPdVbXO3R6uPkU32TUbF3QdK7x+myUE/goFE02j/gXDkzgCJ82uPr
	0YxxJHnazn8Z9Xt5VI0EhelAvkzVon9pzjaoVelduujZaK7JWL9KQktvdqj5JxzihzPbTS0OmVT
	RgWwQbLn2Fo7T9C9iKnkf5qV5G/ENiTnxf/2RSpOb4lLRpbNjkhRzbq7kuqdUvjhgCEfWymwVlk
	UjkPlqM5A619H3N/Qwy9KCfCP7jQB1pwtV97hFLn0N6qgF6BBk7GnpaaVd9v+KA==
X-Received: by 2002:a17:906:c148:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-acb429a7933mr563209766b.29.1744887926776;
        Thu, 17 Apr 2025 04:05:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNxdJjm+6wwbvCF7n4KinSDPJvG7sT2N3puLXQeS/vwZBN2/xet2oD5tb2zy+B+VqUwMEYqQ==
X-Received: by 2002:a17:906:c148:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-acb429a7933mr563206866b.29.1744887926350;
        Thu, 17 Apr 2025 04:05:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1cc9d0sm271604266b.158.2025.04.17.04.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:05:25 -0700 (PDT)
Message-ID: <fad8f831-c813-433e-83d4-0a45ecb6ad0d@redhat.com>
Date: Thu, 17 Apr 2025 13:05:25 +0200
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
 ikepanhc@gmail.com, ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250417105758.100675-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250417105758.100675-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

On 17-Apr-25 12:57 PM, Gašper Nemgar wrote:
> Added entries to unsupported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
> ---
> Changes in v5:
>  - Changed performance button to KE_KEY 

Thank you for the new version, but you seem to not actually
have made this change to the code.

Also below you still have "User Asignable Key" instead of
"User Assignable Key" (with double ss in assignable)

You also still have 2 spaces instead of one after 0x3d in:

		/* performance button triggered by 0x3d  */

(both pointed out by Alok for v4)

Maybe you accidentally send out an old version of the code?

Regards,

Hans










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
> index 17a09b778..72d3306ef 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Specific to some newer models */
>  	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/* Star- (User Asignable Key) */
> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +	/* Eye */
> +	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
> +	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
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
> +		/* performance button triggered by 0x3d  */
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

