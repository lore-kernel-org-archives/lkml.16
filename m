Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036DD293B4F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360493; cv=none; b=SQjVYhuKN1zLUrAr5bERmaHdVpKoPQ9WzP72mCSO0UgL8PNTpA1TzVTW0pigCi1qaczsW9a9FudHQsXUXPyao1tEXPYQlYoJ/0wxlvqMZz8GnXGm34mvpbxCBleT7267544KdG8NzlcME4FJ6S0d9tMZR5OERaeh0axrnIeauX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360493; c=relaxed/simple;
	bh=SxEOvlRNSCwnamHv37LnY13ONkLeA0bnVhGqy2H0MVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbVV3SvfxOq8qctHygRtBwNP70jcurXWaSQ0pIEIEgYzhnFRM9phgbWP8F2vJGp/YWGB10Mdddu0wl8YYRJLYz51uDH3uaMSlJDMGxj9gc7fg859lfFMpmLr5Fh9+5tj0ihuuL6KQXQ8WTCrqBh3lmDbxzBvACbCrBSMro1vqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VaFdFzqt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VaFdFzqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744360491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hPEB9IovulTp9jemDnCHGCaMReQM8u/sCUs3hKREk5w=;
	b=VaFdFzqtW+VQNyErGaG4tf3hIm4IUs266qe4BLF1Ci45YvMWUSd2vZEp2TdrCP5BFyU5eh
	K6g0FHjz4GslR2xBI84yz/YmdooSlwkoJhXIX7Qj+rE7MHt8wOwKVHwfDveB4XDJ/nqnnY
	V8KWadfgtsH8qH1MnBY2KL2DqKU8jDM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-qnvFC2R4OOiLuIa2S6BFIw-1; Fri, 11 Apr 2025 04:34:49 -0400
X-MC-Unique: qnvFC2R4OOiLuIa2S6BFIw-1
X-Mimecast-MFC-AGG-ID: qnvFC2R4OOiLuIa2S6BFIw_1744360488
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3c219371bso155931366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360488; x=1744965288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPEB9IovulTp9jemDnCHGCaMReQM8u/sCUs3hKREk5w=;
        b=PUgY2IA5d6dGJtYS+QyGNNkkhDCBHkju6+/CAbhqzRzOmeEQOglT9hMN5Nykf7xEjm
         oB8jQIkLV/GS9RJPpVHoQQBv/JqqP4ZYuvJ0OuQK8oDGUpQaJEGZtI/eW94YGLZf4YR9
         UxBuidvUdiI1qnwHtIwSupqFgWjQhuLQuqaBXDkWl28waxVf3lmlSaVJ8RQXyob6Z7l7
         w1p0YeGfCJQtbeEj1d1kWVFEsskTfLUtIXoyCjXZS5Y/VPzJfEPQCfwiJN3HilZ1dXnL
         LLCMGDETRwM+iT9kW9f5LEstcNqtibti4T4priyz7+X9208vVlGNHHg3IvJ8rdkeBZjV
         uYzA==
X-Forwarded-Encrypted: i=1; AJvYcCUgub65kn+v28frBHRafUI00jw9xp7Xu1HOgLrtoauhYJ1Vh5TEMU19h+gyNiEaHK5oQ62E9VtR/tra4+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWa1IdpChz/+qizIG0gl5dWBgaY1fHj6y710+b+KUNk7PMFOev
	MzqKS6dKXdYoVBYt7ugnWb5u5fQ7S3wXA3F9hIr1vnG+ZXupXv2BSk5tT6i0ZkpmRP4l2zwBpet
	dzroPF5QvSFVOPSR/7wbZPM2vYgnCHxmLcpZIe0zP2G5gV78fYuIUvtkJouidgQ==
X-Gm-Gg: ASbGncu/xMFUI97MricIRmwnNFslwEyM6q3MUyGNPHp5NEaHJGQ3Sv0AsQGJbDIvZ7n
	fLUq4i3C47701xQ7t/b+FcDT0pef4TLUui6KOZTUOGD9+4IsJNqvkiDoMWtgcP4PIbwu/zditdK
	2Sq+dkdYGAgfftmtE0PVJAZ/Y45GBcSUQUKHzeng+j/ZPZ9rqHuRytmGwNXZ3iMeW1dvdq+m39f
	/4dgliXwIPSU3/t9CQnb+9jJwSAYWTjuisunl+khgIjyG1rYj8MTR0I1CxVG/ixl6uyKe2toIto
	wT0hNbzrevslRrYvR1Q3FEHIWIzLn4JnwazJ8A2NARcwec9gfWwb2LAR47JjctdBm3w/hxye9rB
	2RcaLiivx257BriXdJP01c06xPfoHhG7Z8JgjKALOpa4labcNZkPCYsH1FnPdFg==
X-Received: by 2002:a17:907:7f07:b0:ac1:e53c:d13f with SMTP id a640c23a62f3a-acad36d7d8fmr150816766b.50.1744360488162;
        Fri, 11 Apr 2025 01:34:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6pWWSi4ZddLNGE8X9DxVLsJsPyLfarGqt4dAhpX0DvdFBYFdRGsy0qsVpjpPb+WaJjDXMjA==
X-Received: by 2002:a17:907:7f07:b0:ac1:e53c:d13f with SMTP id a640c23a62f3a-acad36d7d8fmr150814266b.50.1744360487788;
        Fri, 11 Apr 2025 01:34:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4110sm411444066b.91.2025.04.11.01.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:34:47 -0700 (PDT)
Message-ID: <3fd83bea-abd2-4d2c-b39e-20d3eb981a99@redhat.com>
Date: Fri, 11 Apr 2025 10:34:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] media: i2c: change lt6911uxe irq_gpio name to
 "hpd"
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <20250411082357.392713-2-dongcheng.yan@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250411082357.392713-2-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
> lt6911uxe is used in IPU6 / x86 platform, worked with an out-of-tree
> int3472 patch and upstream intel/ipu6 before.
> The upstream int3472 driver uses "hpd" instead of "readystat" now.
> this patch updates the irq_gpio name to "hpd" accordingly, so that
> mere users can now use the upstream version directly without relying
> on out-of-tree int3472 pin support.
> 
> The new name "hpd" (Hotplug Detect) aligns with common naming
> conventions used in other drivers(like adv7604) and documentation.
> 
> Fixes: e49563c3be09d4 ("media: i2c: add lt6911uxe hdmi bridge driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>

The commit message needs an extra sentence to explain that this change
is ok to make since at the moment this driver is only used on ACPI
platforms which will use the new "hpd" name and there are no devicetree
bindings for this driver.

Regards,

Hans



> ---
>  drivers/media/i2c/lt6911uxe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
> index c5b40bb58a37..24857d683fcf 100644
> --- a/drivers/media/i2c/lt6911uxe.c
> +++ b/drivers/media/i2c/lt6911uxe.c
> @@ -605,10 +605,10 @@ static int lt6911uxe_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(lt6911uxe->reset_gpio),
>  				     "failed to get reset gpio\n");
>  
> -	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "readystat", GPIOD_IN);
> +	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "hpd", GPIOD_IN);
>  	if (IS_ERR(lt6911uxe->irq_gpio))
>  		return dev_err_probe(dev, PTR_ERR(lt6911uxe->irq_gpio),
> -				     "failed to get ready_stat gpio\n");
> +				     "failed to get hpd gpio\n");
>  
>  	ret = lt6911uxe_fwnode_parse(lt6911uxe, dev);
>  	if (ret)

