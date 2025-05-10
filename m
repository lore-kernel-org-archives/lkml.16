Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36EF213236
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746886877; cv=none; b=CWI7DgKo5VD94wupXTtyD+VIjPguCGwEOJX1iXWw8FP553fOh0sTxrqozIqnchjzOZXvA9O/h/zjGzj9ZVEtkdnLDiFxXXqDSNK39HgkSDlR2sRwRcTNG9jt6qLqLhy52pfbO/L7d0fpEHvJD8U779TnW7QwaupZwF4lm+dKdpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746886877; c=relaxed/simple;
	bh=m3/shMHp6hL+vo8Wb6ZbfpujLbkH5DvDEg7379bQm7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S47B+l9S8PyDhZkls5KxQjOAComWuW0pYiYPobyOe9IuIfDTaASrGFWSZ9f77fyCRXVg8c7kVkSQg3HvxSghc2lOcAdnkOUtaX899pUWkvUGn/RWbdaQCkV1rpc1jEbk4aWwJiR8VdJKz4molVd89rzbHBVBh3cx7d2RPEqDr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TamkfkIa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TamkfkIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746886873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+C8e4RywW1Vwmq8hW9JeMSlDsXKL2qQG53d/BRC9DQ=;
	b=TamkfkIaHdldHmq7I7H/YZmrlIkZT3Mu9zpPJPSlurhelUSF2arf31lUb1vWg0wkqvzI4S
	qz4Hy/J/UhW8UdegJoD4LW8UxSvVz/Fh76aKeJBixdEsT8kaqfTZNpSWPLXV5h9a2L8jmf
	+7Hdm9/KancT+S3BpgjP4jM51ITntZA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-naqupPgUOsy7zR-DgAqL6g-1; Sat, 10 May 2025 10:21:12 -0400
X-MC-Unique: naqupPgUOsy7zR-DgAqL6g-1
X-Mimecast-MFC-AGG-ID: naqupPgUOsy7zR-DgAqL6g_1746886871
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acf0113e311so327449666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746886871; x=1747491671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+C8e4RywW1Vwmq8hW9JeMSlDsXKL2qQG53d/BRC9DQ=;
        b=ACGzh6s8atJrvl4542sDOwNQDgUM7FWRBfb4RIM8g9Au/A3y+oVRNmnfg4jkpGrwFX
         f4j3THZs4Cic2AtzgZeXuJiIRs14SkQFUblFdyvbYp3JDCUe+5pATYvvGya/hD/pI1Oe
         iFqnsUsj0eQEkpciw+7u3rGrUC80Lk+x2u87zIaV3OHULfQpfUDQxYMU5jrIyN5OYb1H
         gjN60MhPxLZaGdU8cJ+vy5QsNdFREom+HMqlmRsx5SNVL22UP6Cv9HhJyx9foIOgGsUa
         qfTeleywT2tEtcQYd1JBE6bPPZkfmO878uLLd138EEjnw1Bm1sCvgEIJLQkPp2xEx9fm
         0GqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAgVrJHHgRUgCWO0liaLavHGzX2Brmf57t/JOqo8qJYlCnDjyCtlhX759dQn4DWIZvVeYIdNDVPNZyngk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9Tm8xSr2lbAMLizFolLoNM5vpdj/9Sb1+KjA27V6uM20RKVh
	/sXq8MA0idd96pUQMq9aJCPQv/vpw6f3sVwW3enVnlGnk0GRKDL3pPslHVtO7Mn1yKKvYRqFJgR
	A9fbNKLWkU3WQzcUK9yyymNypSTnkVsqarCwg4aqUvRJTMTD2BYAOpy1QI9YdLA==
X-Gm-Gg: ASbGnctMhjO3kwZkYvyIJyzB3L8tR1jLFiS8msRKQ7g7HRwJd/3wDUnchMzElZR2XWz
	CM4t6p9rrZrP+T0V8bVvtWpJ/I9simdgJYFWQV3xsQx3VafZvEORFE59WiSyfhUt+KzdhfX/1ME
	qploaS019oYez3+uaNniU6yO+ZFUMMYW0ChYqcYV8bYwLiEWK51NX7gPS09U+XjkeD2kqNn0HhE
	v9WMuxDnn5sZ4UaCrxgxZwllO6iwVL9gnqnAEU/gwhFNF4qMsohFfpNPBil06b3fdkcMFdSAdKB
	N/TwScMozuDLCTSrFchWmz9ZZ6RUF8UMJu7SIHlp9ZfcbMxHZh2w2Y7/Jq7KDG0bTncAfHHCvA/
	2KkmAJ6Fivo4n743sTQcKzmS2Gc4ThemW1fopwOW+oOCs4A+noGiVu60L+CAHtg==
X-Received: by 2002:a17:906:80d9:b0:ad1:81c5:5ec9 with SMTP id a640c23a62f3a-ad218e49d01mr614643966b.4.1746886871267;
        Sat, 10 May 2025 07:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq4+o7s7L+uFN+XzEBrlt/+7mp1F9jNbBcQ98Q86fc282vYbGCVyZwMhUeufQJ4FD0vu30xA==
X-Received: by 2002:a17:906:80d9:b0:ad1:81c5:5ec9 with SMTP id a640c23a62f3a-ad218e49d01mr614640166b.4.1746886870814;
        Sat, 10 May 2025 07:21:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad221288a91sm274295266b.15.2025.05.10.07.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 07:21:10 -0700 (PDT)
Message-ID: <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
Date: Sat, 10 May 2025 16:21:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining the
 clock producer
To: Mehdi Djait <mehdi.djait@linux.intel.com>, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
 mchehab@kernel.org, dave.stevenson@raspberrypi.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as clk_get_optional() except where there is
> no clock producer like in ACPI-based platforms.
> 
> For ACPI-based platforms the function will read the "clock-frequency"
> ACPI _DSD property and register a fixed frequency clock with the frequency
> indicated in the property.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

This certainly looks quite useful, thank you for working
on this.

Note on some IPU3 platforms where the clk is provided by
a clk-generator which is part of a special sensor-PMIC
the situation is a bit more complicated.

Basically if there is both a clk provider and a clock-frequency
property then the clock-frequency value should be set as freq
to the clk-provider, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020

for an example of a driver which handles this case.

IMHO it would be good if the generic helper would handle
this case too and if there is both a clk-provider and
a clock-frequency property then try to set the clock-frequency
value with clk_set_rate(), arguably you could just warn on
a failure to set the rate though, instead of the error
the ov8865 driver currently throws.

Sakari, Laurent any opinions on adding handling this case
to the generic helper ?

Regards,

Hans






> ---
> v1 -> v2:
> Suggested by Sakari:
>     - removed clk_name
>     - removed the IS_ERR() check
>     - improved the kernel-doc comment and commit msg
> Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com
> 
> v2 -> v3:
> - Added #ifdef CONFIG_COMMON_CLK for the ACPI case
> Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/
> 
> v3 -> v4:
> Suggested by Laurent:
> 	- removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
> 	- changed to kasprintf() to allocate the clk name when id is NULL and
> 	  used the __free(kfree) scope-based cleanup helper when
> 	  defining the variable to hold the allocated name
> Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi.djait@linux.intel.com/
> 
> 
>  drivers/media/v4l2-core/v4l2-common.c | 40 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 18 ++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 0a2f4f0d0a07..b33152e2c3af 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -34,6 +34,9 @@
>   * Added Gerd Knorrs v4l1 enhancements (Justin Schoeman)
>   */
>  
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
>  #include <linux/kernel.h>
> @@ -636,3 +639,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> +
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +{
> +	const char *clk_id __free(kfree) = NULL;
> +	struct clk_hw *clk_hw;
> +	struct clk *clk;
> +	u32 rate;
> +	int ret;
> +
> +	clk = devm_clk_get_optional(dev, id);
> +	if (clk)
> +		return clk;
> +
> +	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!is_acpi_node(dev_fwnode(dev)))
> +		return ERR_PTR(-ENOENT);
> +
> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (!id) {
> +		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> +		if (!clk_id)
> +			return ERR_PTR(-ENOMEM);
> +		id = clk_id;
> +	}
> +
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> +	if (IS_ERR(clk_hw))
> +		return ERR_CAST(clk_hw);
> +
> +	return clk_hw->clk;
> +}
> +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 63ad36f04f72..35b9ac698e8a 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -573,6 +573,24 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  			     unsigned int num_of_driver_link_freqs,
>  			     unsigned long *bitmap);
>  
> +/**
> + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to an optional clock
> + *			      producer for a camera sensor.
> + *
> + * @dev: device for v4l2 sensor clock "consumer"
> + * @id: clock consumer ID
> + *
> + * This function behaves the same way as clk_get_optional() except where there
> + * is no clock producer like in ACPI-based platforms.
> + * For ACPI-based platforms, the function will read the "clock-frequency"
> + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> + * in the property.
> + *
> + * Return:
> + * * pointer to a struct clk on success or an error code on failure.
> + */
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> +
>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>  	/*

