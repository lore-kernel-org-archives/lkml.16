Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A15286D49
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877527; cv=none; b=LFF4oL4PxHIUNdSU0dsc2Vzd0M+ga1HGq0rlMc8eIuEjv0IR5c3tOqpi+CfLNcZqrWknbpDSJIEhbYhwaHGK0DJTFbzERvEHFQKY2YhzFe10qI2JL8Ds8jJfonaY7tXOvnZa8YCxyI8+AoLJWusSUnY7s7E/ANF0IGO1lnYLywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877527; c=relaxed/simple;
	bh=9xBalXmnJgD4RmmIV/V6wnjZTZ9oSv6heR/g4f/2kZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8l/9fYCWDuEuj5c151YhuvQQbJBy4S3MqMNbJ7pVLosmHEsqPkM1o0/cWLQQ3yMvkDBTzhF6LsqZENeMZrUsKv0iWOfDo0XYKd/AxucDW94Xdtbc1D32Jx8JXMvhCKheyTbLY2+agLvjcN5OcQTPQb12U4MFL3pmfV6chAj6hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=M9HPD12S; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="M9HPD12S"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so2151261f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751877524; x=1752482324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7aL18uBiZMw/FWxoKoVSvm/jRO6BDbywt1DvLbU3XB8=;
        b=M9HPD12SaZJS9ElrYZwvnTw1s9jInt7WNp/e8hYRFlSnM4NDnrHzWfQYvbvlxkqqVN
         0FJtHpS55fXWw2A57xnWoo+lTBHYbEqOpjHuxsz6RZHbP/F8Kqjsfu30EyciP0XVnJG3
         q80/A3D/4XrbljezffxiAYrodcZFgGgJ5JkT60z1COEcD11IjPPyrvrfLmJau/RFsT30
         f3IQlO5uw4QMS2FwYvp32AThq4nf3Ll/qhA+zjecWJnjD8P4f68JenX0qZI2Jw6aFZg8
         Tk62dIhYC8n/ZEAIfPmKKUgxgh8/9IkW54z8hViYhdqcNzGT9B7Rg32g6s8CogXw2xiH
         rWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877524; x=1752482324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aL18uBiZMw/FWxoKoVSvm/jRO6BDbywt1DvLbU3XB8=;
        b=m4e9FygtscCABq3EZXWs/hFfAwRY1nvyOTdNbnMjaF9E+dEzFeYVig9DqJDxh0aEz6
         wF+ZybGslhD1KMnK25btzFzmIjvAS3bZN43q/dvfEya2iEY7mxgnZHDhWZMUjUWcEIAF
         urbaFgpl9NMrn4KXp9TjetNtNmKDdGVqjynncF2m61lFXMpzJVGrkQh+Kdsqu79+mNDJ
         +4sb+AYoRi9xl8rsZglIXLA+rC1sWdoZQNfDUUezG+ix08ccXFmq86zTZtpwYAL6pogj
         g3st4FNgELL+VyxiMCfeq0jNWA0giFoiuPeuz5Qlo9YOT6fzQ+3smeOXB2rCJHc9XkVN
         V7bA==
X-Forwarded-Encrypted: i=1; AJvYcCX4+3cc7EatLAu2CKzIGb718Hi3jyWdXrfOpzpfHJX9Ov9oakx589iNrw2JoOVRhgr9JPzBTtqdvy0Bds4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyza2IEc3fJzDYO39YECAZdUNfnqXbZ3nbZa06QL7ztlkHleWfM
	O8AmEGJwdqk0VdaWBMFQs0gLPJMdnSYRR0tFhmOWETbZHD7tq62z5AHWLp83q3JAAFw=
X-Gm-Gg: ASbGncuzC6IxIV2+RPDRp+vk3TuxBBiAcPjUfoaZt8N4zc8t8ACy/BvJtSe9ex6i1b5
	mXgQsXlK2ckXiCjZx/8y437eJ+VBye3ZPe4U7FhORVjl9+d/qMaWiVkv+1S98uK+XfH1ZvUjMI5
	fKifYReSszf+rUSTmxdJKP4CqvHUp54BWw83ewD3CHmZW3vp4eKvLeZzC+FceAtiMhw8zL7UOlk
	or8hOK/aLf6ZEA9WbtpQ0curOac2cuWdDmVvIouz8M7hzhYrORNyYc87Chrg9VK51/MPQc535AT
	Hsb6A36Od+uzRC6vnibq+7cvLvQrwvJSZWWxuycsf7N2PzXpJ/a+6jVX36yTxJ4=
X-Google-Smtp-Source: AGHT+IHOL134zxv2M5TIxjn1JcbIuqigNn/BoslUPqMt07/pkuCY3NvzphTd4fkc6LrVVlovNM0TJQ==
X-Received: by 2002:a05:6000:24c9:b0:3a5:541c:b40f with SMTP id ffacd0b85a97d-3b49700c57cmr9041350f8f.9.1751877523572;
        Mon, 07 Jul 2025 01:38:43 -0700 (PDT)
Received: from jiri-mlt ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1696ca8sm106595425e9.28.2025.07.07.01.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:38:43 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:38:41 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v13 00/12] Add Microchip ZL3073x support (part 1)
Message-ID: <cuqmu4cy52vj3njjltr3uf3ozsnmnhmo7v4lzzztftvupnf5wu@eekmg4a2wkla>
References: <20250704182202.1641943-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704182202.1641943-1-ivecera@redhat.com>

Fri, Jul 04, 2025 at 08:21:50PM +0200, ivecera@redhat.com wrote:
>Add support for Microchip Azurite DPLL/PTP/SyncE chip family that
>provides DPLL and PTP functionality. This series bring first part
>that adds the core functionality and basic DPLL support.
>
>The next part of the series will bring additional DPLL functionality
>like eSync support, phase offset and frequency offset reporting and
>phase adjustments.
>
>Testing was done by myself and by Prathosh Satish on Microchip EDS2
>development board with ZL30732 DPLL chip connected over I2C bus.
>
>---
>Changelog:
>v13:
>* added support for u64 devlink parameters
>* added support for generic devlink parameter 'clock_id'
>* several patches squashed into one per @jpirko's advice
>* renamed devlink version 'cfg.custom_ver' to 'custom_cfg'
>* per discussion with @jpirko, the clock_id is now generated randomly
>  and user have an option to change it via devlink
>* implemented devlink reload to apply clock_id change
>
>v12:
>* Using 'return dev_err_probe()'
>* Separate zl3073x_chip_info structures instead of array
>* Use mul_u64_u32_div() to compute input reference frequency to avoid
>  potential overflow
>* Removed superfluous check in zl3073x_dpll_output_pin_frequency_set()
>
>v11:
>* Fixed uninitialized 'rc' in error-path in patch 9
>
>v10:
>* Usage of str_enabled_disabled() where possible.
>
>v9:
>After discussion with Jakub Kicinski we agreed that it would be better
>to implement whole functionality in a single driver without touching
>MFD sub-system. Besides touching multiple sub-systems by single device
>there are also some technical issues that are easier resolvable
>in a single driver. Additionally the firmware flashing functionality
>would bring more than 1000 lines of code with previous approach to
>the MFD driver - it is not something the MFD maintainers would like
>to see.
>
>Ivan Vecera (12):
>  dt-bindings: dpll: Add DPLL device and pin
>  dt-bindings: dpll: Add support for Microchip Azurite chip family
>  devlink: Add support for u64 parameters
>  devlink: Add new "clock_id" generic device param
>  dpll: Add basic Microchip ZL3073x support
>  dpll: zl3073x: Fetch invariants during probe
>  dpll: zl3073x: Read DPLL types and pin properties from system firmware
>  dpll: zl3073x: Register DPLL devices and pins
>  dpll: zl3073x: Implement input pin selection in manual mode
>  dpll: zl3073x: Add support to get/set priority on input pins
>  dpll: zl3073x: Implement input pin state setting in automatic mode
>  dpll: zl3073x: Add support to get/set frequency on pins

For the DPLL related code:
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
