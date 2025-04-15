Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966AA148FE6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730298; cv=none; b=upWHx/yVHe06EImKtdnpqPK7r9Y2EW2BW+b6GjblfwTNIXgoW9LSSLD/YTQrdQVYYKEnUOVJGC/Qd7ba60WPpbA3Ylp5OBIuPG4E2uBSkYFYZH5DhxzTwSrvsrpssk4+ez47s9icVfMIj9+lB/2WGsaGFDddRGwxshEXwSGu6ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730298; c=relaxed/simple;
	bh=WsiZVen01hmKAjOZ2ChAxXZQMdWcpZsL5oQexIMtuPw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvclCnHPshj7tBvn+3+hgkcYi3dNdb8BHgmuNe+pKmNDM1F2t3KTWCNYM+cQ7OpwJeA3myoILQs3sQpSIQC/+ghgU7IhyCmXrw3I6bZMkkXumpbko9sAKGrAaVgctGERU+ZKUEk/YnM+/VSdbEyXGb0bo6RWuTzDBIb8A8o4iEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QJKRvT8r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6N5Mqx5e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QJKRvT8r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6N5Mqx5e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QJKRvT8r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6N5Mqx5e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QJKRvT8r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6N5Mqx5e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 918982111F;
	Tue, 15 Apr 2025 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744730294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=QJKRvT8rgtE1f36xdAaLQAej/rtjhc1DbET7dmW+wH8+O7Oc89e9kRVCPyXiapgAHOF8kT
	McumyOKQtHUWI+a8ZAH8vNWc398/ahUYaNIY7KuvCAJWiXFqiYKAaj0z2FrI0Tl3BujCZ/
	+3MjheThOk7BY2x1B8raJYx+PfI50ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744730294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=6N5Mqx5eQ5Gyjh7U13V0h/100O3NnGEoibFJblgxqvuEp1KTXrtSnkDLwOLJ91dVrTSskG
	OUmwdXkLQmpti4Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744730294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=QJKRvT8rgtE1f36xdAaLQAej/rtjhc1DbET7dmW+wH8+O7Oc89e9kRVCPyXiapgAHOF8kT
	McumyOKQtHUWI+a8ZAH8vNWc398/ahUYaNIY7KuvCAJWiXFqiYKAaj0z2FrI0Tl3BujCZ/
	+3MjheThOk7BY2x1B8raJYx+PfI50ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744730294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=6N5Mqx5eQ5Gyjh7U13V0h/100O3NnGEoibFJblgxqvuEp1KTXrtSnkDLwOLJ91dVrTSskG
	OUmwdXkLQmpti4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 475B5137A5;
	Tue, 15 Apr 2025 15:18:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TPofELZ4/mdxTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 15:18:14 +0000
Date: Tue, 15 Apr 2025 17:18:13 +0200
Message-ID: <87y0w1xxl6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<robinchen@ti.com>
Subject: Re: [RESEND PATCH v2] ALSA: hda/tas2781: Create a common header for both spi and i2c tas2781 hda driver
In-Reply-To: <20250415070913.679-1-shenghao-ding@ti.com>
References: <20250415070913.679-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 15 Apr 2025 09:09:13 +0200,
Shenghao Ding wrote:
> 
> Move the common macro definition of kcontrols into a common header.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v2:
>  - Follow IWYU principle, add sound/asound.h into the header file.
> v1:
>  - Revise the year of spi and i2c tas2781 hda drivers.
>  - Create a common header for both spi and i2c tas2781 hda driver to define
>    the common macros and declare the common functions.

The code change itself looks fine, but do you need this change for
what purpose?  Is it meant as a code cleanup?  You wrote what the
patch does, but why it's needed isn't mentioned at all.


thanks,

Takashi

> ---
>  sound/pci/hda/tas2781_hda.h     | 44 +++++++++++++++++++++++++++++++++
>  sound/pci/hda/tas2781_hda_i2c.c | 29 ++--------------------
>  sound/pci/hda/tas2781_hda_spi.c | 35 ++------------------------
>  3 files changed, 48 insertions(+), 60 deletions(-)
>  create mode 100644 sound/pci/hda/tas2781_hda.h
> 
> diff --git a/sound/pci/hda/tas2781_hda.h b/sound/pci/hda/tas2781_hda.h
> new file mode 100644
> index 000000000000..fc741fac419a
> --- /dev/null
> +++ b/sound/pci/hda/tas2781_hda.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * HDA audio driver for Texas Instruments TAS2781 smart amp
> + *
> + * Copyright (C) 2025 Texas Instruments, Inc.
> + */
> +#ifndef __TAS2781_HDA_H__
> +#define __TAS2781_HDA_H__
> +
> +#include <sound/asound.h>
> +
> +/*
> + * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> + * Define two controls, one is Volume control callbacks, the other is
> + * flag setting control callbacks.
> + */
> +
> +/* Volume control callbacks for tas2781 */
> +#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
> +	xhandler_get, xhandler_put, tlv_array) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
> +	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
> +		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
> +	.tlv.p = (tlv_array), \
> +	.info = snd_soc_info_volsw, \
> +	.get = xhandler_get, .put = xhandler_put, \
> +	.private_value = (unsigned long)&(struct soc_mixer_control) { \
> +		.reg = xreg, .rreg = xreg, \
> +		.shift = xshift, .rshift = xshift,\
> +		.min = xmin, .max = xmax, .invert = xinvert, \
> +	} \
> +}
> +
> +/* Flag control callbacks for tas2781 */
> +#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
> +	.name = xname, \
> +	.info = snd_ctl_boolean_mono_info, \
> +	.get = xhandler_get, \
> +	.put = xhandler_put, \
> +	.private_value = xdata, \
> +}
> +
> +#endif
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index 29dc4f500580..9d94ae5fcfe0 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -2,7 +2,7 @@
>  //
>  // TAS2781 HDA I2C driver
>  //
> -// Copyright 2023 - 2024 Texas Instruments, Inc.
> +// Copyright 2023 - 2025 Texas Instruments, Inc.
>  //
>  // Author: Shenghao Ding <shenghao-ding@ti.com>
>  // Current maintainer: Baojun Xu <baojun.xu@ti.com>
> @@ -30,35 +30,10 @@
>  #include "hda_component.h"
>  #include "hda_jack.h"
>  #include "hda_generic.h"
> +#include "tas2781_hda.h"
>  
>  #define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
>  
> -/* No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> - * Define two controls, one is Volume control callbacks, the other is
> - * flag setting control callbacks.
> - */
> -
> -/* Volume control callbacks for tas2781 */
> -#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
> -	xhandler_get, xhandler_put, tlv_array) \
> -{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname),\
> -	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
> -		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
> -	.tlv.p = (tlv_array), \
> -	.info = snd_soc_info_volsw, \
> -	.get = xhandler_get, .put = xhandler_put, \
> -	.private_value = (unsigned long)&(struct soc_mixer_control) \
> -		{.reg = xreg, .rreg = xreg, .shift = xshift, \
> -		 .rshift = xshift, .min = xmin, .max = xmax, \
> -		 .invert = xinvert} }
> -
> -/* Flag control callbacks for tas2781 */
> -#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) \
> -{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = xname, \
> -	.info = snd_ctl_boolean_mono_info, \
> -	.get = xhandler_get, .put = xhandler_put, \
> -	.private_value = xdata }
> -
>  enum calib_data {
>  	R0_VAL = 0,
>  	INV_R0,
> diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
> index 399f2e4c3b62..c6be2be1b53e 100644
> --- a/sound/pci/hda/tas2781_hda_spi.c
> +++ b/sound/pci/hda/tas2781_hda_spi.c
> @@ -2,7 +2,7 @@
>  //
>  // TAS2781 HDA SPI driver
>  //
> -// Copyright 2024 Texas Instruments, Inc.
> +// Copyright 2024 - 2025 Texas Instruments, Inc.
>  //
>  // Author: Baojun Xu <baojun.xu@ti.com>
>  
> @@ -38,38 +38,7 @@
>  #include "hda_component.h"
>  #include "hda_jack.h"
>  #include "hda_generic.h"
> -
> -/*
> - * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> - * Define two controls, one is Volume control callbacks, the other is
> - * flag setting control callbacks.
> - */
> -
> -/* Volume control callbacks for tas2781 */
> -#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
> -	xhandler_get, xhandler_put, tlv_array) { \
> -	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
> -	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
> -		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
> -	.tlv.p = (tlv_array), \
> -	.info = snd_soc_info_volsw, \
> -	.get = xhandler_get, .put = xhandler_put, \
> -	.private_value = (unsigned long)&(struct soc_mixer_control) { \
> -		.reg = xreg, .rreg = xreg, \
> -		.shift = xshift, .rshift = xshift,\
> -		.min = xmin, .max = xmax, .invert = xinvert, \
> -	} \
> -}
> -
> -/* Flag control callbacks for tas2781 */
> -#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
> -	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
> -	.name = xname, \
> -	.info = snd_ctl_boolean_mono_info, \
> -	.get = xhandler_get, \
> -	.put = xhandler_put, \
> -	.private_value = xdata, \
> -}
> +#include "tas2781_hda.h"
>  
>  struct tas2781_hda {
>  	struct tasdevice_priv *priv;
> -- 
> 2.34.1
> 
