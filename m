Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4AD293479
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360442; cv=none; b=F673JfAnXSOcnxgLohC0/OdKaJykEV8oOiSEbRhySox9cg8drUEwik5ZDpzWE0Mn/KDgrPsOGGranREcDSfLUUaMmtoorSXgTKmJaAgYvEd0609RA5BrchCgp8NowCgh4gveIhosYBuEyz6xm/ULsb1p4cyOPGcZbQqhyKsDEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360442; c=relaxed/simple;
	bh=/qo4gcSDylw9y3Y13r/kFOd4wQ4zfDTtcYDq9dLoHDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYsxKXwCSgvKT/4v71x+QBMFolp6wCUyEoqXb+TFOIR7Pab7tv96HE92uhYEqPwDDLO/I2FKy3xe3+FT+Elav1XIN1wb8A7RQBliGTLeK9u42CNW9jsh9HQhSfpzyO1ogmkxlu+NZJMGn6qPTZFShplz7hD0AwllfIi17ZfKf2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZPitmSi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZPitmSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744360438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rauBmq3K5j+aZ4ym535sl8BVfHytZNjgSVdV1u6bHGA=;
	b=JZPitmSiQ6UC6DL5Q7rcEeeuISdV/nud8xqBWChvAXkg3Df5W7k5YHDd3iAOHji16P95d7
	z50SGVnOClLx1gEpKMq72FFz4sSqhpMBX9MIc+IqK+m5XBdyvcWeoesQX7KgUQS2x3S7Xo
	X9P7Fh0Zjm7LJz70fNOjF4sGsoUiv7Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-MFlmbM-jMaeP2_YUC3Eb_Q-1; Fri, 11 Apr 2025 04:33:57 -0400
X-MC-Unique: MFlmbM-jMaeP2_YUC3Eb_Q-1
X-Mimecast-MFC-AGG-ID: MFlmbM-jMaeP2_YUC3Eb_Q_1744360435
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e5c76fd898so1438123a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360435; x=1744965235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rauBmq3K5j+aZ4ym535sl8BVfHytZNjgSVdV1u6bHGA=;
        b=TnR+pJBOCyvOYOp5pAeFD6rQJwMriTcKMkZ+dPu9DwpsqE/kvYLHTIoC2Me9C2Nusd
         9UU7Rlbr6LtVNAiN29EZYtTpzPV7g1WlcC+hRDYGgSyeE4nQL/0RdsI63PmTQoU0sFHl
         Qi7Rhu0gHAnV5eccn4UHn9KoX0ug/13GJN+xI2CuAIcisxrQF6+iFr26lpyXDTtz2rOx
         kQ1fDsmtI3hsOC1d2/8kAOGYp0DssvTCBjAMs4TObGvhX0skTAx+qm4Ru3s4jKJgFA6r
         /BxmW3aVwj+uTCT9sSk01M2xyF44RjMkB41c3JpYyha3wh+rjyhiV2bEmDUFrG5a/q3k
         fnQA==
X-Forwarded-Encrypted: i=1; AJvYcCVVfRdwPtUckd7Rh91JxSV8B1QNgmbXoLMMCvlDGrd4e1r4e4aksYdBfe22H6QxbYjginNhGmg5fSuK+Es=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0XRepLCx9XDAhfKlaafUUcekO8TOGMqwVrxxYfzn1+ZKSNbz
	YLomUzE3EJ5qiBpRgQAlsN1jl96aG2hlOkEZNxap3HaPPAHyZmmwfLdZWoOGLmCZBy1DyBydqiv
	XMRwAQVM1mirna95M5EjH4dsMF3ADQhXzGnIMKoUQe2U2bkMu3lZhG6n6F0CfDQ==
X-Gm-Gg: ASbGncufSUngPGwl13t3aj724V5UmzEOWmLF+3H2u9lt4QNXmri+/8Mb55lcb4otOyH
	WpY1Wc1qIOPPOHNH4hX4EjCQvba3/m++5Seu1tWEFschXJ2+DySaYd8pPRwmkzeFT9wMfKTAaNv
	pXjXC4zSNlNSBI0Ql+ThJ1fREJSnPrsrSxSzy8faEZzHtO5f4bepm9n7t3JYDQhfl2wC9dszqLf
	BxWdBU5dVxNLgpQjXBXOCAYJ/mSNbVQcMgAzFM2/vB4yNJ7yJVsmja4atPFWNL+fPLV5MKeYK/v
	2qdofLG+r3eYHoGelVacm23msq89nTmsPDHlV92oqy5shp/J7gxdHWLm8YFkWIR4oaBAHqBozeN
	Nfj+wDhDIprua6+8vqzaZDpXuK0UZxT2MjEwYp8LeCSRgDA2zH3xXyZoNs/uoQg==
X-Received: by 2002:a05:6402:1ecc:b0:5e4:99af:b7c with SMTP id 4fb4d7f45d1cf-5f36f644fa1mr1206351a12.9.1744360435262;
        Fri, 11 Apr 2025 01:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ETctPXgmYy/3kOvhR7THcmsbYSpYhk7jhIPW9DPlhKebFvCO4nVWQ6lXtvrje1+ZZMpM1g==
X-Received: by 2002:a05:6402:1ecc:b0:5e4:99af:b7c with SMTP id 4fb4d7f45d1cf-5f36f644fa1mr1206330a12.9.1744360434865;
        Fri, 11 Apr 2025 01:33:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f507687sm624677a12.56.2025.04.11.01.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:33:53 -0700 (PDT)
Message-ID: <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
Date: Fri, 11 Apr 2025 10:33:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250411082357.392713-1-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
> 
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> ---
>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 145dec66df64..db4cd3720e24 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -22,6 +22,7 @@
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 30ff8f3ea1f5..28d41b1b3809 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> +		*con_id = "hpd";
> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;

This looks wrong, we really need to clearly provide a polarity
here since the ACPI GPIO resources do not provide one.

Regards,

Hans



> +		break;
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  		*con_id = "power-enable";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -212,6 +216,7 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> + * 0x13 Hotplug detect
>   *
>   * There are some known platform specific quirks where that does not quite
>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
> @@ -281,6 +286,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	switch (type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";
> 
> base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763

