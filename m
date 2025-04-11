Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B218FC89
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382114; cv=none; b=jpqRJLXbO/DPuHzZ2YbOlBUIp9Rkhpm600lnS3pXejOK5fE920f6o+tDzEcOX8QEDFdthc8Ovx4KVWnjwHZQk/Re169SUYvYM8VEdedxYAP0/4DoEIGdWqeIgTduuNNcyR+H4Z2I1Mpej13t4/7iDp3nLLi3YMfGydkxd+vY7II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382114; c=relaxed/simple;
	bh=+JX5U0EjJREG9HSMHYCRyXVbgB+tK+mvxRwn25oBnj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzZV5yROpSFyGGqiDHUtHnLk8EfJoKr/+pQM4h8DugJOViC106uLwWhBwnXnRz1o00einGwYBQDYDpij3BlSaCBYhuCqMa95tVhBEYe4lDRnac9ZjmqhFd7R4oQNbEfsP4KUH4jf0KZRk+2GLAzuC1WgD9+h7USe/jvjOL4oNNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TZntA8cP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TZntA8cP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744382111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vf0r7l4Ywoar8pkovwpvugRV/uWgMLgm0xBNpY+jCXE=;
	b=TZntA8cP/L7y2I8TOL4OqAeGtYUUeRhWOEfJM60SqJkoV56MnA7/LzfVjnXjlpF6v8eTaU
	5/aqJSuWKwZd1GO1nbVZvojyLLRsr5ASQgnxduV6e3q9G3DfOIpdmiR9OQYpxTD+5yc4jz
	AGudPIzRLd0p/rovYHpIvWP9YWyKNzw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-sR3XawTJMJOcxYVZIYXxpA-1; Fri, 11 Apr 2025 10:34:31 -0400
X-MC-Unique: sR3XawTJMJOcxYVZIYXxpA-1
X-Mimecast-MFC-AGG-ID: sR3XawTJMJOcxYVZIYXxpA_1744382070
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e72c1bf151so2171151a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382070; x=1744986870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vf0r7l4Ywoar8pkovwpvugRV/uWgMLgm0xBNpY+jCXE=;
        b=R6aGnb3GxamZdNCCtazjZDzVUZOMMSBOdy2rQsA20JhLsytTbkjSkx3e/M060ZqtM7
         HLC+ltX79fdg8k8mM9kmZnuwEN7sLYoX3wtd5n7ZbKWpmeIQJ4SJsfJOc7mAnxpuTqaY
         UUXIDcsaWQr5Om40tZQh5sQCmjVJ9OEgSMARDXMwqy+W/Ekn2pVQDQI8RVL64lg0fEYM
         UDilGpYmPGJRfciVn6DDiFu2tqRsC+ybIATLMFF2MovezOnUmaKzN4m7tQQHKVf/YKss
         FrQkXhQh/pNLEJ0DcZaRcmgTBlEJcqo4BQ0eQcMZ174NlgagtHCDRrGLoGu1extsLl2p
         zp+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXV05207tGV2XVmNcSgnm+a2dGv8YhlK1rc68UYW2mAAnZPww71p+4uqMzLxAmsZ/4ld9Kq5mijxAqVdL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkELUtvB6XAeV27xn3ItQVxc6z+xTwpknQvEUdNhSWfb0q14Bb
	w8QwozBA6wJApqYXMNmgcNVIO6cTc72F2k8mkfq2TyPFR4SwW5ZKdN+BA7G/QI0gn29QyL1rz+O
	0CQCptr+0ElAB/H1+D1BmyRhwVtLFZ416g+nxSPOCeMGnUWUIE4tMQvUC/G0tKw==
X-Gm-Gg: ASbGncuq22PU+8AvpStc8SVqTqO6MUwus1wEu7sJYuVO77QFrn9e1uF206n8BEB7uiL
	+afoYqjrZEYuCGpHe1aSqRABFKPWJPAbWcX+QlLE72Amyvs4pA7BVdkf2NMChtKF99AVkMIechA
	frTwN6oPaA/k+H+SSnY2qmmIOclRq3NVfk0nKxAYE95lJj4cYtEBlyM6Eqskyt3BIn73uukYcj6
	Mb0fb7GfUD0GHttDpOzId5ORxn0F+zZidhbAcjYt1oHKaA7vghHA/6qnH3KKpf9d4gyjcTYWfVx
	3ifeb6ySiqbMLvcSdLpQF9oSDP1g2/cbfudvrm8KUiGu6atjb2hiLaJBOl7MsPzi9Zr2pSooVbR
	78SV1OultHwBA/tL1fUDZJC2mrDpBS0PfrTAUC4jgpatZoWsIlZxuc9gIOLLNog==
X-Received: by 2002:a05:6402:350d:b0:5e4:be64:b562 with SMTP id 4fb4d7f45d1cf-5f36f525f8emr2157744a12.1.1744382070353;
        Fri, 11 Apr 2025 07:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsyMGRP3aENMWxFEhPPQZuAAVo/qXO98QCyQRyDjgRoGmFZl6CSgQGNG1R6VKsu1/p4Nf+hw==
X-Received: by 2002:a05:6402:350d:b0:5e4:be64:b562 with SMTP id 4fb4d7f45d1cf-5f36f525f8emr2157726a12.1.1744382069836;
        Fri, 11 Apr 2025 07:34:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f50567esm1070601a12.61.2025.04.11.07.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:34:29 -0700 (PDT)
Message-ID: <347b59ca-e655-4064-aefd-a8355d426962@redhat.com>
Date: Fri, 11 Apr 2025 16:34:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4] platform/x86: ideapad-laptop: added support for some
 new buttons
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ikepanhc@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250410212937.28772-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250410212937.28772-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

On 10-Apr-25 11:29 PM, Gašper Nemgar wrote:
> Added entries to unsuported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
> ---
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

I missed that below there is a "if (priv->dytc)" conditional,
this means that it would still be good to send KEY_PROG4
when a keycode of 0x3d is received on laptops where
DYTC platform-profile support is lacking.

For v5, please change this back to KE_KEY so that KEY_PROG4 will
be send when the "if (priv->dytc)" check fails. Sorry about this.

Note please also address Alok's review remarks for version 5.

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

