Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81E2C15BC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749905612; cv=none; b=FQMNvSI+liU9OLo7SIWTv/vAUoeLmy/UOxmBzQS8T9bBBD34X7dd2FdnrZP98CrGrrwpjDMtgA8C4838ucAE5PFHBeXsby0x+8fiS7U5dSUSyv6JwABGdnnMm+gMVe7BOAIWwRyMtuE+HKYCmrkaeMHxygeyBq1t1rvMW4NKPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749905612; c=relaxed/simple;
	bh=ToJshkcEyLwRvFclTqTyawtN4G3ZoPLyAg2jYPi+ETg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPwdoChmWyxC034xYL/+NgqxoZqnZKFPzwm9LD7JuLbMqnDQpbuWjyQ3kEqinMVJm56hCa6/uUpEbBLoi969z4uDYIdSBFG8XJJhZMenLtd0qDytBMcrr7TcyYLs9LLIDH7Alo2umilDgtbo898c14kksrFymB9EeduYXVFTR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=LUhotnp1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="LUhotnp1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so35620125e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 05:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749905608; x=1750510408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wkREfIjwCdSS/Av/sbgiO9IpKHvCzSSDUVEPCSGdPZI=;
        b=LUhotnp1f+LpwrnjpM85sfyOXzTJ3n+2LMK3Cej8xP/9xZu2LOtid2eyLwT6uqAEyK
         EQWyWGuWHTicYUsFfGZoJJqyL2C2zOLe2KVmX2xR4SAcYxvB3PQy0tWbVQ9JCF8kdMQO
         YWgFZULUmW9CU2oyJy2LIovbV2w8dOCIrJr0yFDWzXhC3F1lV98tJXj0GQW+AQ6qjHNZ
         8cQ+r4nMixhYUPsAfqWAl/a/PqPoLabTr7IBIaroG4L35LZEeSurLOThdNIHSf7WS2F5
         GWvAg5/6g643mJNyklgD8b1qzmzzjVn6Mu4il+pr7c+yDGVSddKqscsJJ588X7KaDGSJ
         l/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749905608; x=1750510408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkREfIjwCdSS/Av/sbgiO9IpKHvCzSSDUVEPCSGdPZI=;
        b=AlbyTNFv9gkTK4aP5feoSNiwyt2lPZ+At8wIcQ3zWVpHAA/XWlKK7QnjysVfhiE3cX
         nmoqt/iZ5K2PJUEup0c8ocEgR9bWgz9+AvI4KYLpgIkrPntGaPKIitJ4Rzy2mx9fBv8F
         fkTMIpwPzsY6vNulaY71Yrj8oS2nQZP5mL4wY0I28Xz/t2Ws+6vpajND+LuzHpga7oZz
         3lpnqGw/JoyA0Pe6U/YCxrAkyrmWNYg9ndRzIolh2dsnbmU7igvLN/TqW80MixFCvEDT
         7waZun5hw9DsMgCD+D38ywpHtglfzqb0BNli9xa/uLZi3g27QVcr+mn7PHg1ocrG+cNL
         S91Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRos/XuEWExwAALQGsowMbsg3AGq2Ny/FuaXR1DjoO34nFnprgYLsJQgf2KRS7WlPcnGga/FmwUOx71x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYN8zn08z/DFFGYnLh1e1Z6osiefNxJM2L2Ly2/MiKo82Ygo7t
	Py/4gOGuhpnXTn+DlvkaKpV6wCV4l4pSBuvRPm884jMz6hK+UIHQYOkTnPDcJK5oKQ==
X-Gm-Gg: ASbGncvoL/6/R2MSEiTC6NlLWJg0M1kjdUSefogT8OMcZ8PpEUkfhZwM1/YtlFc3/TZ
	5bvfJwGWEj9PvDBrxRtHLCKmPBSVrDqocYsA3li7aatMr2sLjXSp4LXUiLZOcWFX71xBKJElMsq
	GXONVcq7B0SQO/J0Po918+z1GU6BrqF4N+ZuT3V1ut+oCJ9H/OT97Z4HzKpsKUiZzZwaHqxS9GV
	izvkJw2uuFIs4tzGmpTTs0L+boFuLv7Q9+Q0JQn43KshShms/9kmZjyolLXLdmcjBFPnkfWfhqv
	eNXHpSCdpQfcpixPcVQ5lb91E0LT0YaDiZqMgTUYsNco6OG5mvF6TT4y
X-Google-Smtp-Source: AGHT+IHRodzhlunFMz+eKrbtmZROtcyK1UcFGPm84SPSS9puCFJ64hOc4gISQBo3WbGbUH1Ve1yKwA==
X-Received: by 2002:a05:600c:c16a:b0:450:d614:cb with SMTP id 5b1f17b1804b1-4533cacab63mr27851035e9.33.1749905607856;
        Sat, 14 Jun 2025 05:53:27 -0700 (PDT)
Received: from cyber-t14sg4 ([2a02:908:1578:7a43::64fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm81655735e9.4.2025.06.14.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 05:53:27 -0700 (PDT)
Date: Sat, 14 Jun 2025 14:53:18 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aE1wvuamXqVTzpny@cyber-t14sg4>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
 <aEtWtBKfNhDT1bF9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEtWtBKfNhDT1bF9@google.com>

Hi,
Thanks for taking your time to go over the patches.

On Thu, Jun 12, 2025 at 03:37:40PM -0700, Brian Norris wrote:
> 
> This all looks highly X86-specific, so you probably need 'depends on
> X86'.
> 

Indeed, this was also why CI build was failed.

> > @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
> >   * boilerplate.  Each module may only use this macro once, and
> >   * calling it replaces module_init() and module_exit()
> >   */
> > -#define module_coreboot_driver(__coreboot_driver) \
> > +#define module_coreboot_driver(__coreboot_driver)                  \
> >  	module_driver(__coreboot_driver, coreboot_driver_register, \
> > -			coreboot_driver_unregister)
> > +		      coreboot_driver_unregister)
> 
> You're making arbitrary whitespace changes in this hunk. Try to avoid
> that, please.
> 

Sure, will do. It came from a style warning when running
scripts/checkpatch.pl. I thought it could be useful to fix it on the
same go.

> >  
> >  #endif /* __COREBOOT_TABLE_H */
> > diff --git a/drivers/firmware/google/mm_info.c b/drivers/firmware/google/mm_info.c
> > new file mode 100644
> > index 000000000000..55bcdc8b8d53
> > --- /dev/null
> > +++ b/drivers/firmware/google/mm_info.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * mm_info.c
> > + *
> > + * Driver for exporting MM payload information from coreboot table.
> > + *
> > + * Copyright 2025 9elements gmbh
> > + * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +
> > +#include "coreboot_table.h"
> > +#include "mm_payload.h"
> > +
> > +static struct lb_pld_mm_interface_info *mm_cbtable_info;
> > +struct mm_info *mm_info;
> > +
> > +static int mm_driver_probe(struct coreboot_device *dev)
> > +{
> > +	mm_cbtable_info = &dev->mm_info;
> > +	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
> > +		return -ENXIO;
> > +
> > +	mm_info = kmalloc(sizeof(*mm_info), GFP_KERNEL);
> 
> Error handling? (Needs a NULL check.)
> 
> And might as well use devm_*() (e.g., devm_kzalloc()); then you can drop
> mm_driver_remove().
> 
> > +	mm_info->revision = mm_cbtable_info->revision;
> > +	mm_info->requires_long_mode_call =
> > +		mm_cbtable_info->requires_long_mode_call;
> > +	mm_info->register_mm_entry_command =
> > +		mm_cbtable_info->register_mm_entry_command;
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(mm_info);
> 
> Why non-GPL? IIUC, EXPORT_SYMBOL_GPL() is the usual default.
> 
> Or, I suspect you don't actually need two separate modules, so you
> probably don't need this EXPORT at all.
> 

Yep these two definetely can be merged into one module. Will do that in
v2 series.

Best,
Michal
