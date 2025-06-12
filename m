Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04FF2DFA38
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767865; cv=none; b=q0F0QfIW/pEh2rQSCN0IW2dZSByZ1YU0omi1ByZ0hnK/U/BI+pmDIN0SszgStdsNwz5mcZmH5htbqfHplUgE+hvgK3owjrxYOcpZ4U8N5LXl0sV+Dluf4McTkQr8JnNMNoJrlWY8rbqhzsyuazZA6P9QBpkjWK+7kf5f2iIn+gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767865; c=relaxed/simple;
	bh=HHBQEYQNF/8iEYXZ5SjXLKleYW8rVfLIa1UfuspHa0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4FLyk0Jlz9k1ZvVmZ+ToATDglpsBVn4saPQ9tzmWbpf7Bx9VA5Q7TJ/KGW9MbWBH76yXWcK+MZBgLkFoJfRJUd1XduKtLJaT+Ec15RK7UzOVsX+4xKqALwilqAlZZvI6ZLnKncHcVfQPMNLVyBjucY45OPU8oapY43T0/NZDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E5fpCkp1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E5fpCkp1"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c3d06de3so1962384b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749767863; x=1750372663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LtsssPi/+gGOTsI2cJ5/IE29IoNJ46aiwJ6dZko1hU=;
        b=E5fpCkp1kC6/4RFLCnHk85m6mUIezLdCUDzQnFxkZuZ/8WCgDKfsSyDxDA5uXRH8xy
         XqBtbswWb1h1Y6TbggiF6qNKilOTbY1Fe+lqPGKuwOJrwefflV2IO3QmvArYLFc48JiW
         a9TB6WF4IU5fCDF0blMj6QDkZjZrsJz2wAsl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767863; x=1750372663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LtsssPi/+gGOTsI2cJ5/IE29IoNJ46aiwJ6dZko1hU=;
        b=scZODrt2aTMRo7GyiZUYJ9+39ELt3bQqCntd5JhG2t8pciCn1gQQA4it0qvOrs4wHq
         46pAx4UZxp5ZSygBWYl/MR22XdVAsL5gfyGdwtHCHFnnSOgr81SF+ausqiGtGjwauJ5f
         BvR5Q592/B9r6Fj161fXzpPkY/2Ly6bwaljFtixsfM6+XNtDxqkLE+HvzXlBGzoa7QAp
         FwIhcHGhHaacq+vE+UQl0exOxe0o98/Y9pYwUj8wK6IoOaprv791FyMwI0Stxl2SQsn+
         +9iYag6s8YYgpe98GuZSjurtSw0zy1czl9dUmZrdsDpekglRdRLoiwY5rpYHK22YloE6
         CtZQ==
X-Forwarded-Encrypted: i=1; AJvYcCViXZxyzu1E1wTSB5BMo71iNnZlj1vFyIYXDPwpbqU73sKbDvBBFwtk3JFnuRPMEGQimbvnSjRsmsqLtgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYP/nzruSPxwSuG0j+U7V5upvIXhKU0HT7OTC69Mxj1U/wP9t1
	w1UarxVu5jWrOdO2WKJvs7Tvo/P0u9wWUT2fSoU/wrCJ6mpXMRMzWoCVEbvNuJ8eKg==
X-Gm-Gg: ASbGncttWDBK6pXVN2d6UKTANrif6Ha13v4nIhsHttC/rV+HTc+LbPlgGR1osJ/VL4u
	LbnoDMstwG7tCWGC2Ur+rlKQoV62QxDsCGsr4J73R6JVKyF536qds/ks2RONL8lFgQHP/cP0Y0l
	fjHioBUSxhJIsXAokKxV7mW8F2SvkQ6i+Pnem71upkX+O7SBPbbh2Ica6WF3VMk3by0yLLwa2tP
	aFQTl61HY7Okb3z/AazEZJwCwrGLdwKpLsfU6i8Bfx+hfDEmIFoDA8/V+5MkCjTBbt3oDMl8YQV
	juUCB3mdfpGMgadOs7Bi/Bt/aKtvzTdx7vhVAbIpcjYb2BSh0xaRqzK67vTuUCXNBli05UIGxUJ
	XEMAO149+LIEO5golqxJrJH7xdkxx/Q/uTB0=
X-Google-Smtp-Source: AGHT+IEw/JbZv5ynkL7Za4u+3CAce/RTUMoNI00hDb4bZ/UIOB+tjKCYE3OGTdw9GoF3EWRRxm6TlA==
X-Received: by 2002:a05:6a00:1814:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-7488f71def1mr1410149b3a.18.1749767863227;
        Thu, 12 Jun 2025 15:37:43 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:9a04:ac66:831d:e4a6])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7489000519bsm271514b3a.38.2025.06.12.15.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 15:37:42 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:37:40 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aEtWtBKfNhDT1bF9@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>

Hi,

On Thu, Jun 12, 2025 at 04:05:48PM +0200, Michal Gorlas wrote:
> coreboot exposes (S)MM related data in the coreboot table. Extends existing interface,
> with structure corresponding to (S)MM data, and adds parser. Parser exposes this data
> to the modules executed later.

I don't think I have much opinion or knowledge about this feature, so
I'd probably defer to someone actually involved in the coreboot project
(Julius?) for some of that.

But a few cursory thoughts on the driver mechanics:

> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  drivers/firmware/google/Kconfig          | 12 +++++
>  drivers/firmware/google/Makefile         |  3 ++
>  drivers/firmware/google/coreboot_table.h | 34 ++++++++-----
>  drivers/firmware/google/mm_info.c        | 63 ++++++++++++++++++++++++
>  drivers/firmware/google/mm_payload.h     | 58 ++++++++++++++++++++++
>  5 files changed, 158 insertions(+), 12 deletions(-)
>  create mode 100644 drivers/firmware/google/mm_info.c
>  create mode 100644 drivers/firmware/google/mm_payload.h
> 
> diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
> index 41b78f5cb735..5d918c076f25 100644
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/google/Kconfig
> @@ -81,4 +81,16 @@ config GOOGLE_VPD
>  	  This option enables the kernel to expose the content of Google VPD
>  	  under /sys/firmware/vpd.
>  
> +config COREBOOT_PAYLOAD_MM
> +	tristate "SMI handling in Linux (LinuxBootSMM)"
> +	depends on GOOGLE_COREBOOT_TABLE

This all looks highly X86-specific, so you probably need 'depends on
X86'.

> +	help
> +	  Enables support for SMI handling by Linux-owned code.
> +	  coreboot reserves region for payload-owned SMI handler, the Linux
> +	  driver prepares its SMI handler outside of SMRAM, and lets coreboot
> +	  know where the handler is placed by issuing an SMI. On this SMI, the
> +	  handler is being placed in SMRAM and all supported SMIs from that point
> +	  on are handled by Linux-owned SMI handler.
> +	  If in doubt, say N.
> +
>  endif # GOOGLE_FIRMWARE

> diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
> index bb6f0f7299b4..e0b087933c5a 100644
> --- a/drivers/firmware/google/coreboot_table.h
> +++ b/drivers/firmware/google/coreboot_table.h

> @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
>   * boilerplate.  Each module may only use this macro once, and
>   * calling it replaces module_init() and module_exit()
>   */
> -#define module_coreboot_driver(__coreboot_driver) \
> +#define module_coreboot_driver(__coreboot_driver)                  \
>  	module_driver(__coreboot_driver, coreboot_driver_register, \
> -			coreboot_driver_unregister)
> +		      coreboot_driver_unregister)

You're making arbitrary whitespace changes in this hunk. Try to avoid
that, please.

>  
>  #endif /* __COREBOOT_TABLE_H */
> diff --git a/drivers/firmware/google/mm_info.c b/drivers/firmware/google/mm_info.c
> new file mode 100644
> index 000000000000..55bcdc8b8d53
> --- /dev/null
> +++ b/drivers/firmware/google/mm_info.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * mm_info.c
> + *
> + * Driver for exporting MM payload information from coreboot table.
> + *
> + * Copyright 2025 9elements gmbh
> + * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#include "coreboot_table.h"
> +#include "mm_payload.h"
> +
> +static struct lb_pld_mm_interface_info *mm_cbtable_info;
> +struct mm_info *mm_info;
> +
> +static int mm_driver_probe(struct coreboot_device *dev)
> +{
> +	mm_cbtable_info = &dev->mm_info;
> +	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
> +		return -ENXIO;
> +
> +	mm_info = kmalloc(sizeof(*mm_info), GFP_KERNEL);

Error handling? (Needs a NULL check.)

And might as well use devm_*() (e.g., devm_kzalloc()); then you can drop
mm_driver_remove().

> +	mm_info->revision = mm_cbtable_info->revision;
> +	mm_info->requires_long_mode_call =
> +		mm_cbtable_info->requires_long_mode_call;
> +	mm_info->register_mm_entry_command =
> +		mm_cbtable_info->register_mm_entry_command;
> +	return 0;
> +}
> +EXPORT_SYMBOL(mm_info);

Why non-GPL? IIUC, EXPORT_SYMBOL_GPL() is the usual default.

Or, I suspect you don't actually need two separate modules, so you
probably don't need this EXPORT at all.

> +
> +static void mm_driver_remove(struct coreboot_device *dev)
> +{
> +	if (mm_info)
> +		kfree(mm_info);
> +}
> +
...


Brian
