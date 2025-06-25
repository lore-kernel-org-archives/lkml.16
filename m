Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30425EF82
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854378; cv=none; b=u9qReu9581oFy9naBrMkJF5K5f18YCwRnk1atzmw7/4UOnramO6QSsGi+4gY/OHhY3gushyCOY/pahrtWB0x12SkHp9KKlzAXYdo6lwTfa4fn/2bTq+JyfvH7MW11blq+48Q2c6srdo78esvX9wMqKz1tlw9GT0ycXPczEkjjrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854378; c=relaxed/simple;
	bh=RJylVnltnYi62l6fnhJri2c9ENd6bS6fxc04Feonn0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AO3Nmjj4uo+RDoTg4KE5vY7WOE3xX2+qq3pcEnZOpvLjpZip9vn5uheG2XX3FyT+8Rl+GlH8IoPI0pr2nQLgmOtldgT7KCEzNoHtadn1nYCHFqnCT7YbWRb/K54o4Liho1u1UN5YGbA07w/HXkuWHfX1y0o64xbXJ2UbbhpaMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=LKGkajmC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="LKGkajmC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a46eso999447f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750854374; x=1751459174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MK0Hj58r5vfZoNmYyXjSjcoja0uU5HmHWhKlrdtiqP4=;
        b=LKGkajmCW/fwULw1ZQDjhfECiNC0U5PjRcuaMYSeSnD8jf+2cpo0m2AlJ1EwwNna+k
         z9yBswGEZrUIi1EyM6gFzDl0P3TNg5qEuiso1tnveHzm5Hx4E0paIuyE9oWXfaVtcXAx
         D/zrA4FGW/N3vuhUerU3vzzEJdFjlAaR9ORf9grj5+X5mx7msX7qgrHxc0/OjEwc4aDt
         sVfGIzzUEmgX5ELs1sy8OOKVUw0lDHOhAZIWJ72R8XyX5bVr2WxSxauE95eT51dEfC7Y
         OvTRf3dkd/6Ar78PFWjsP3/ozJJPP3rfPAmX3oBRJWAdsUOY34Csw7DJT2VT2d4hLfar
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854374; x=1751459174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK0Hj58r5vfZoNmYyXjSjcoja0uU5HmHWhKlrdtiqP4=;
        b=ZDFOkWg3x8kUwa0765PSGia35/LgbVW+wGYIOx0k4fHmSqPdVnrAHIfVRq28P+RUlf
         /In9h7RYBvCDphtG/i0564ALe0vMEgFpZRvYJyvPuafeq0LeTz0zPWWJk+HGP+7eAVgj
         cnDfbRA5GzYmMrHuj8lLkQ2iLVOszW+neTrKry1Jccmzq5pxxZq2eAD73jsnx0pBxjJK
         61d7n0mFSot65LKyAfk3VZf+dvs/280gTjx7b1+fAYTaF2kGjEt9+C188BwN5NR2f86e
         WjLlxPjTMvrWw3rnbqCLVpMBp5oP1t5VVL+u409zQ7zLmhf3SeVR1FzFksyYRSyl+SG9
         KAqw==
X-Forwarded-Encrypted: i=1; AJvYcCUB4kRJrW5eTY80rmk++kW93BZDU+ai5XL0xTo1qqiQi0V8aRfIMIdMcGirYhrXhGjwxVuFNtneyNAXtt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiASrg4aOO86+rram65xgIieUNJvFp+TNmWeWuLsq1uc+t7Kju
	T6+lu7/rKk9irwesJ9azhN9doxA8rvHl4yPmtW8uEhdfWWYzw8l9SrIDFuhlBdQbunJH96Kt4Gd
	8xWw=
X-Gm-Gg: ASbGncujfipeeo4tY56yRHipsS5qcnn8h4HMh8KORV+ny/csMWDaaFBHGfsjwBOXPiO
	R8VrlXf8vvBrrfNZsamXYYNdYUjSJouZDdRkUQTtCnacYVj/MWBPC34grlw89t6TYWAvyMfwR1V
	CTMDH4pH8Lu38iqFI/778KgP64586TFUCvr8CEWTaC24aec33uxf5aD+GGI6IJ4okCUlFtjp3rD
	Ug0jHmq7GEJjW1+e2mwRSuMf1RUzL4T0esDeL1dvGponfYG1fB2nWLMcyNY2XEhDIJxPHBJsHNJ
	Mwi6aLQ+iqOTr9ZNZBZG/AUWafgMRZDSXBRGCE7cdLm26OU4+ki0N30topYdUeFupGPqrOjcv59
	rYkxBzsxm+gsH2dD2ChiOgkylP8yCR6Sj/J2Nebmzsg==
X-Google-Smtp-Source: AGHT+IE0ZRp8hz87yz6pSXLfSGUZeMtxz5hwGB1i4LKMJooPymaYKx+TBLnM1kArAooUHdH2EKfAnw==
X-Received: by 2002:a05:6000:4b1a:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a6ed62eb07mr2151898f8f.19.1750854373878;
        Wed, 25 Jun 2025 05:26:13 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4537c3bf576sm24715685e9.0.2025.06.25.05.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:26:13 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:26:11 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aFvq49ODR3XfcwZJ@cyber-t14sg4>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFuQHqSd9kT87tsF@google.com>

On Wed, Jun 25, 2025 at 05:58:54AM +0000, Tzung-Bi Shih wrote:
> How about repharse the message to something like:
> 
>     Load Linux-owned SMI handler:
>     - Place Linux-owned SMI handler in ...
>     - Inform coreboot the location of Linux-owned SMI handler via SMI ...
> 
>     On success, the Linux-owned SMI handler takes over all upcoming SMIs.
> 

Yep, will do.

> > diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
> > [...]
> > +
> > +# LinuxBootSMM related.
> > +payload-mm-$(CONFIG_COREBOOT_PAYLOAD_MM)	:= mm_loader.o mm_blob.o
> > +
> > +subdir-						:= mm_handler
> 
> subdir-$(CONFIG_COREBOOT_PAYLOAD_MM)?
> 
Right.

> > +obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= payload-mm.o
> > +
> > +$(obj)/mm_blob.o: $(obj)/mm_handler/handler.bin
> > +
> > +$(obj)/mm_handler/handler.bin: FORCE
> > +	$(Q)$(MAKE) $(build)=$(obj)/mm_handler $@
> 
> mm_handler/ isn't visible to this patch. Separate them into the following
> patch of series?
> 
> > diff --git a/drivers/firmware/google/mm_blob.S b/drivers/firmware/google/mm_blob.S
> > [...]
> > +SYM_DATA_START(mm_blob)
> > +	.incbin	"drivers/firmware/google/mm_handler/handler.bin"
> > +SYM_DATA_END_LABEL(mm_blob, SYM_L_GLOBAL, mm_blob_end)
> > +
> > +SYM_DATA_START(mm_relocs)
> > +	.incbin	"drivers/firmware/google/mm_handler/handler.relocs"
> > +SYM_DATA_END(mm_relocs)
> 
> mm_handler/ isn't visible to this patch. Separate them into the following
> patch of series?
> 

Would it make sense then to merge patch 2/3 and 3/3 into one? mm_loader
depends on mm_blob, and mm_blob depends on mm_handler/ being visible.
I wanted to split these initially as the 3rd patch is already terrible
to read because of all the assembly code in mm_handler/. But if it makes
sense to have them as one patch, I'll do that.

> > diff --git a/drivers/firmware/google/mm_loader.c b/drivers/firmware/google/mm_loader.c
> > [...]
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/cpu.h>
> > +#include <linux/delay.h>
> > +#include <linux/gfp.h>
> > +#include <linux/mm.h>
> > +#include <linux/slab.h>
> > +#include <linux/device.h>
> 
> Please review again if it really needs to include the headers. Does it need
> to include cpu.h, mm.h, and slab.h?
> 
> Also sort them alphabetically.
> 

Right, I forgot to clean these up, my bad.

> > +struct mm_header *mm_header;
> > +static void *shared_buffer;
> > +static size_t blob_size;
> > +static struct lb_pld_mm_interface_info *mm_cbtable_info;
> > +struct mm_info *mm_info;
> 
> No. Please allocate a driver specific struct and access it via
> dev_set_drvdata() and dev_get_drvdata() if the context needs to be kept.
> 

Yep will do.

> > +static int trigger_smi(u64 cmd, u64 arg, u64 retry)
> > +{
> > +	u64 status;
> > [...]
> > +
> > +	if (status == cmd || status == PAYLOAD_MM_RET_FAILURE)
> > +		status = PAYLOAD_MM_RET_FAILURE;
> > +	else
> > +		status = PAYLOAD_MM_RET_SUCCESS;
> 
> No. Please use -errno in the kernel.
> 

In which line here exactly? In the conditional statement I explicitly
check for RAX (and hence status) being 1. Not sure if status == EPERM
would make any sense here. I guess you meant specifically 
status = PAYLOAD_MM_RET_FAILURE? Then what would be appropriate -errno?
I think it could be -EREMOTEIO or -EIO, since the APMC SMI which
trigger_smi does is an I/O write. But I am not sure if that's the
appropriate errno.

> > +static int get_mm_info(struct coreboot_device *dev)
> > +{
> > +	mm_cbtable_info = &dev->mm_info;
> > +	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
> > +		return -ENXIO;
> > +
> > +	mm_info = devm_kzalloc(&dev->dev, sizeof(*mm_info), GFP_KERNEL);
> > +	if (!mm_info)
> > +		return -ENOMEM;
> > +
> > +	mm_info->revision = mm_cbtable_info->revision;
> > +	mm_info->requires_long_mode_call =
> > +		mm_cbtable_info->requires_long_mode_call;
> > +	mm_info->register_mm_entry_command =
> > +		mm_cbtable_info->register_mm_entry_command;
> 
> Does it really need to copy the data from `&dev->mm_info`?
> 

Not necessarily, the concept of copying the data made sense with v1
patches where the "parser" was in separate module, and was exporting
mm_info to mm_loader. I think it would be sufficient here to get rid of
get_mm_info and just let mm_loader_probe check for the tag:

	mm_cbtable_info = &dev->mm_info;
	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
		return -ENXIO;	

> > +
> > +	u32 entry_point;
> > +
> > +	entry_point = place_handler(&dev->dev);
> > +
> > +	if (register_entry_point(&dev->dev, mm_info, entry_point)) {
> > +		dev_warn(&dev->dev, ": registering entry point for MM payload failed.\n");
> > +		return -1;
> 
> Please use -errno in the kernel. -ENOENT or -ENOTSUPP?
> 

Yep. -ENOTSUPP fits here.

> > +	}
> > +
> > +	/*
> > +	 * Gives SMI some time in case it takes longer than expected.
> > +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> > +	 */
> > +	mdelay(100);
> 
> This looks weird. Are there some ways for Linux to be aware of the SMI has
> completed?

Not in a straight forward fashion. On Intel SoCs we could read MSR_SMI_COUNT
[1] before and after sending an SMI, and wait till it increments. I am
not aware about any unified way that works for AMD SoCs. However, so far
none of the AMD boards supported by coreboot was tested with MM payload,
so to make it Intel-only in v3 is not a bad idea.

[1]: https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/include/asm/msr-index.h#L880
