Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B126A0BF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754460; cv=none; b=o7ZQdpGKtdFZ1RKoyLbliz1e/eLpzNSq9hO8wXFpHIDN69qRZF6tvFedgIxJikJ/Wwb2aIeNA5Z8KcQFzydhUCA4xxb6FaT3ZgJroGIbSVoSpUaC/y4SmLsZmUU4NIlhrhDVZBM99oVFr3Vha8qg0z15EG7Y31NFQoKyLK80VbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754460; c=relaxed/simple;
	bh=1ArujaSby248nq0Ixxis4Ti8lW10a7X+xjWEEBIgTDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRZ3gVxCsWtlpGng56FTpomlUepJ6jLgX8K8b6fR7nsZxokDVTQazl4+TtS9DnSY8mv6mtSGeWyqcBk6DGlLkNFiDjJIiFteViXNkZKTT+B7sq8Nc50MQqh9XW17XvZjfs6r0qHxFhyWqAye0me9kVK+mUCSJo8X2jPhfAt0Pc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E0pbBCRD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E0pbBCRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750754454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=izTadSmlT9HvOMZUre9d1OR1XTl4340RTPp1hiorFzI=;
	b=E0pbBCRDrpBMi+V2ZhuCM/hoXaIl2NyALGGB5wonRzNN7oIeQY9lYj5FvXGIUrfArcQ2Sw
	9uZHgluP1eJGD6grrA4ai5meyzLX3cIQ5EgoROGuhKLJNqtMictxNtBwZ0jO2nNcar546V
	Bq6TMB+FRNVmsm/DtYIuT3Omnb/Iu/4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-Hxst_CZyNk2kZxyrJYUKmw-1; Tue, 24 Jun 2025 04:40:51 -0400
X-MC-Unique: Hxst_CZyNk2kZxyrJYUKmw-1
X-Mimecast-MFC-AGG-ID: Hxst_CZyNk2kZxyrJYUKmw_1750754450
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6023d9a86ffso3095881a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754450; x=1751359250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izTadSmlT9HvOMZUre9d1OR1XTl4340RTPp1hiorFzI=;
        b=p9SiS+UOY3ZPv8LmKSEAzfIeq7MF7eCmHojtq1Y7oqLt7gzNA/lJ69HJ0iYNqbgmT6
         tfNvOrDrqXGZlH7YFw9OrVDk7TQmsBy0MCwVBTe1mzsM8bNVfg+9btomGlpj6dUXwlW6
         3TDOCdeAJLMblN9mn++i6c/Dyp9Lksu3eBRk+fXKfIPVTtt0X0+/K8EKT8HruJV/mRxm
         wm9FxzWEMV8Hd2CIsfZ4nAAt0E+845QPvibi39d30PVD9pO2mLwQb03Y2iH4k0DZPfwk
         6o3VbB2fq1F+Pz325GoKmi7oMokSYCDmtWP6nh4NzIKl1YZOHMTry/cBVe+oxhIiJLhr
         6jqA==
X-Forwarded-Encrypted: i=1; AJvYcCWKVDXIP0CQevATRRxLWJ1HBC/+6E+FlgLRTTvzUIERaNXGJzrXMm3tg6qHGh8K1THjp/ulQPhJ/+Xtfn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPYroSOD2OROB00DOuTt5U7lucNQP6at7s81Rmu0V5ybL0qr8
	TZt0dvCPFDRHBylKJ55he/NqRFeHTzQd7CltwFhj/zdtxOIPoXKi9eYP/FPqqaELkeN3cLDvKay
	6r76MTILQea0czwQjHw6iTYG1ShYga2kSxAgEJk1WayQ09CIIX7nCbGEGCP7sgla1eSxM8MWeb2
	G7
X-Gm-Gg: ASbGnctlz2DmOLGzbCo3RAkoJDVpXu1zBSeUsUnknrLi/BUv6E4DLlN4yU4Pr2U+WcV
	Tp46j5BMpBBT26PAOaSgr1tEc/062SOV0GtAHF1IVqM2Mom/P5dbWaNX0Q7uw6KjGDPWIg7cXYZ
	yTjp/WszfshFL4b4H+Tcq1TPiqm+7byV/AXQ35RRsINYxBBcvNyGt4PNZu3Cve8QT3ODVOjD03F
	MO2knm2nXGwKABuxZxkA2FCrn9J43YshlKfnLTTAe0vCFxvHcLHL778gqJWuaMXMIqIt1sAftzj
	eiCYiWdvy4QPXytooeE2taIrIHcjTHA3I5LtPkCwG6hmPJI+EmXkZsJHlF9vjnebE0A1pC8TubW
	ZANHNyA+UniODtDOa287bpAyd6FdFOa5uZtcyUmxDYYCcHt/c9V/2ARG8VKd8FtHWWpUk96F6jQ
	==
X-Received: by 2002:a05:6402:5246:b0:606:df70:7a9f with SMTP id 4fb4d7f45d1cf-60a1d167770mr15597997a12.19.1750754449638;
        Tue, 24 Jun 2025 01:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBreMHGcPq5pSjhKO9uagTn8eim+PFmP1VKqozyussO7lFzogiKEHW7qTXTthXNa3R0y9jNA==
X-Received: by 2002:a05:6402:5246:b0:606:df70:7a9f with SMTP id 4fb4d7f45d1cf-60a1d167770mr15597980a12.19.1750754449174;
        Tue, 24 Jun 2025 01:40:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4812a6sm704365a12.60.2025.06.24.01.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 01:40:48 -0700 (PDT)
Message-ID: <30565c88-fb3c-4970-a7c8-bb81200a13aa@redhat.com>
Date: Tue, 24 Jun 2025 10:40:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mei: vsc: Remove unused irq functions
To: linux@treblig.org, alexander.usyskin@intel.com
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20250617003450.118751-1-linux@treblig.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250617003450.118751-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David,

On 17-Jun-25 2:34 AM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> vsc_tp_request_irq() and vsc_tp_free_irq() last uses were removed in 2024
> by
> commit 9b5e045029d8 ("mei: vsc: Don't stop/restart mei device during system
> suspend/resume")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Alexander pointed me at this patch because I just posted
almost the same patch:

https://lore.kernel.org/lkml/20250623085052.12347-2-hansg@kernel.org/

Normally I would say lets go with your (David's) version since
you posted your patch first.

But your patch is missing the removal of the function prototypes
from vsc-tp.h, so in this case I think we should go with my version.

Regards,

Hans



> ---
>  drivers/misc/mei/vsc-tp.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
> 
> diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
> index 267d0de5fade..99a55451e1fc 100644
> --- a/drivers/misc/mei/vsc-tp.c
> +++ b/drivers/misc/mei/vsc-tp.c
> @@ -406,37 +406,6 @@ int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
>  }
>  EXPORT_SYMBOL_NS_GPL(vsc_tp_register_event_cb, "VSC_TP");
>  
> -/**
> - * vsc_tp_request_irq - request irq for vsc_tp device
> - * @tp: vsc_tp device handle
> - */
> -int vsc_tp_request_irq(struct vsc_tp *tp)
> -{
> -	struct spi_device *spi = tp->spi;
> -	struct device *dev = &spi->dev;
> -	int ret;
> -
> -	irq_set_status_flags(spi->irq, IRQ_DISABLE_UNLAZY);
> -	ret = request_threaded_irq(spi->irq, vsc_tp_isr, vsc_tp_thread_isr,
> -				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -				   dev_name(dev), tp);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_NS_GPL(vsc_tp_request_irq, "VSC_TP");
> -
> -/**
> - * vsc_tp_free_irq - free irq for vsc_tp device
> - * @tp: vsc_tp device handle
> - */
> -void vsc_tp_free_irq(struct vsc_tp *tp)
> -{
> -	free_irq(tp->spi->irq, tp);
> -}
> -EXPORT_SYMBOL_NS_GPL(vsc_tp_free_irq, "VSC_TP");
> -
>  /**
>   * vsc_tp_intr_synchronize - synchronize vsc_tp interrupt
>   * @tp: vsc_tp device handle

