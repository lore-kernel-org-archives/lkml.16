Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D33C22F76A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576008; cv=none; b=ojvtjR62W8BhwsmYTaV45+/vFiesHbAD8e38KUZjOGyXJG6wKHeYSa9SQHwbce8q3NVL/yV3FfJRlN4RVHlZ2fyYPrhvLD1Z+9sHV9jmttu5XG3MO0fY6ldHgocf+0/ZMz0FKd5eyeUnSyfdXgHWqrjAMP9ToLRBL0XatNZST3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576008; c=relaxed/simple;
	bh=G/slIN/YQejFKxJKe0AEMCbMJu1x7O2oA2+moybJ5hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=METtVHvRTMwuAHKG96yt7S7uYFn4/w+lfcW3973xJzO+qOpMZ6Xk34/lzJlZPv/THCR8xNuX9PK4EfyXsPXJKD9xRwV9dfkhpQA2m1hdb/CwvNpnM5rRid0Y+BX1YiRIZYfszf0dO2J9q47S8QoOYWa9gbnIjdNxA1RJLfShS5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gVmXPmUD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gVmXPmUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745576005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3mmkWVGcSdiSfH6kfLgKeVG303ccg/Ai5NqIFewYeI=;
	b=gVmXPmUDSevHRLEHPrmN6dDIT+qpbIS2/y4sn8tQPifqKzE8MCeNAjpyjKy6/nQ7AuMc1r
	lCfA4OrIQ2SYZTNm3SW+KFIjSKlo+SNFsOIJWopauCdrqadTu1qI81oiXPr1l7qRwgzB3g
	n5v+ydIqKqYlOfejcJBAFrARtInciAY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-i2tlEop9Onu3jPLxhvFL1w-1; Fri, 25 Apr 2025 06:13:24 -0400
X-MC-Unique: i2tlEop9Onu3jPLxhvFL1w-1
X-Mimecast-MFC-AGG-ID: i2tlEop9Onu3jPLxhvFL1w_1745576003
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac6ef2d1b7dso190545366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576003; x=1746180803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3mmkWVGcSdiSfH6kfLgKeVG303ccg/Ai5NqIFewYeI=;
        b=ZsjltdARxsKO7mz+mmPpx5ZGURDwbT8cRKIJbuMYG8i4VZ8lYUtTBa0/4bl6I6wIKr
         8w42APVMUtlPWpXbLQBv99kMjqbbkL+o3/UVqg0UuZzcu2qOAfK/l7Qh+Bjefg/08LEu
         rbS5VwWbapCvWWtrPKjAPwLaCE6/v+9Zkavxeikp6GUoO6lWYFPME7CgbLlIskCAdJSy
         4Fup8rAzmiqIOILc5TanOmYpwzrQHeByEEnhSCaQYuHWO2jVLhHpHQwerakj1fj25vNz
         ruZhrmD2S0jiagGKYRNq5pD3BOrpSGtBsQE63Et/+TcMbdI/h+4TKZ43ekfd+egOLaFU
         fM/g==
X-Forwarded-Encrypted: i=1; AJvYcCWbJEDzXhfa72OLyPIzqz7NKW6A2DrFBM7haAmtN6jDFTXyus5kX0suFkzidfTIOUVRjaYTjVohRXpyRF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3IJQdu41I7KYwlCgNSePsRzPKeKHzN+u+tkuQ5euHfP0+UzP
	jPmuF/H5bqngaG3RyVUBJBnsW4vLRrZ1DqF/bwi6/eRe7qGfs8s2yzoR6yRrUkw9UYDw7kKkrNJ
	C5CH8qIMFn2twdarZ1ssbSc040K5tMdxJNw5Ga6jIHxh+adQx4FMcSoox/3K7UA==
X-Gm-Gg: ASbGnctRu7uB3ncsYKIgz1f04TM1muKwtF3QJv070DGKpd583M8GV47LlshHpVc0+Rz
	L3DbHb55mjQatknI8IDPxQBn5P3S4LB9jR6apjkq9kvW3GZajATWcdP5bxJ2wqQQXW8Kq7FI5Kg
	DQYy1CfyQHq3z1zbppMSPSNd0Tee2UlCq4Q05VJNJRQnH+6Y6TOTh/Z03KJ2Kg2aLtXCt86hiax
	ke0SK0Nq8HKrxln7BgyjM+Ub61fz7Vr1cXRWBHOPKtaNdyuhWfnjnBUjhkIEOqCq61wgAQbvQJx
	05TtRLIURtwyhb6VCyQ/3VENo2XwAy1Yu4Nx2zVt8atgdrJBKkubO3sonbsAtCWOIc9v+Io0Pzg
	HYQeD/4jxNAbyb+tpnMVMnWEkAPah9/or0cGeYV1Bi9cofZ4ptgtOUTxhm91Icw==
X-Received: by 2002:a17:907:1b22:b0:acb:94d6:a841 with SMTP id a640c23a62f3a-ace7108a209mr151850666b.16.1745576003163;
        Fri, 25 Apr 2025 03:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7hpa0BS6PG9ebdCJ6WIapt6vCC/k4yEO6v7ADZBdEUPa6WQN3zZ/a7svwpaovIE6s9cT1Bw==
X-Received: by 2002:a17:907:1b22:b0:acb:94d6:a841 with SMTP id a640c23a62f3a-ace7108a209mr151848466b.16.1745576002717;
        Fri, 25 Apr 2025 03:13:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c898sm112354166b.7.2025.04.25.03.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:13:22 -0700 (PDT)
Message-ID: <0db6de06-9d74-47d5-8625-7875bc376ecd@redhat.com>
Date: Fri, 25 Apr 2025 12:13:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: int3472: add hpd pin support
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250425100739.3099535-1-dongcheng.yan@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250425100739.3099535-1-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Doncheng,

On 25-Apr-25 12:07 PM, Dongcheng Yan wrote:
> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
> 
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note my handshake control series has just landed / is on its
way to next, see:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-ilpo-next

Please send a v3 rebased on top of this to resolve the conflict
we now have.

Regards,

Hans






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
> index 30ff8f3ea1f5..26215d1b63a2 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> +		*con_id = "hpd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
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

