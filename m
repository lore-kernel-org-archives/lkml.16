Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1086334
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260197; cv=none; b=Kpcad5ip9iOCDiTOIOJSZvU6OwVdG3lUOYgLY4pnfcLa8hbpdRWnR5c4AScdmcz5wi4GU1RXnhY+oHToCiTMuqnLVQsxr5N1XOdqJA0KNindG3m5DiKFxHOxOl+XomiWtFIO33sd8PkTh4DrsTiP/kZeAzRl43TBgpSbyijWyVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260197; c=relaxed/simple;
	bh=hDzhEJ8+CkPrGR3a/Qo6pfD/2fm3i6GhTfgx7wr7dhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjDZYb0zvulVxEUur7KFJpLrJA58UfFWjPB6I9Xkjikt2tn4OdmDPSMGQdy03vivvm1UfkmctwiQt33YoZ4BGVGQCGeUM53//K8GXmvrjZHWcCtrXmk7pD7x9PNIRUowI2I9hpMtR78FmUck4dv6VqsExyujrXo73EggOi6tQPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Q1uhhzjk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SjIX2I/G; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Q1uhhzjk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SjIX2I/G"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id F10EB1380585;
	Mon, 30 Jun 2025 01:09:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 30 Jun 2025 01:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1751260193; x=1751267393; bh=w7wKs+qsxq
	BUzuc0366MPG4Jz3sxncJWG4moMfl3sRU=; b=Q1uhhzjkhkhulzqY0Ghk4Tba6O
	a33nvtuMzHTcO5uguhEODHIfqTMyC/IMFx9eJSm27ZPrhHwlN1Rc6mOHCV8CIK7y
	7gec28jyYYebL3lw/8uWllmm9XpLkMQe3IK3j3M+6FizYlrzP/+7ddIPO/caFWNw
	+fpLmZ1Jhbwq2rg5sw02ul/KnIktVa8ariZswySbat1IgJXv+s0WlfkB0dxuXrv2
	Je+wh/OCmBRXTyQWEJbwIOdnCc7WJ0DeT8Edsvur1l4V0CWU8k0ruqCDsb2Awm6d
	71GvpyZWUKGtbu9zd8seaaYMitzkULtYN14s56IJfvjMQxWW+q206kbTpy4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751260193; x=1751267393; bh=w7wKs+qsxqBUzuc0366MPG4Jz3sxncJWG4m
	oMfl3sRU=; b=SjIX2I/GIW5JmxGDivyDOKtngdk47VtdBmfu4ZtNC+ktMMpj9W5
	LTw8fliXTJGw8oJNXSH77yRw1nDLGCbnNgL9arT4vTT8Ra9GfoKrkqu5xKCIKqAf
	LZatg+Zw043ZL1FTcTY88r3aej6MH2IYb6QDMabqYK2UBVEZxKz7K1rgsn5+qNcU
	3HKn5GY8aHj+eckvF8oXGTyaEmH0EtP0QVPYgv1bb8xWd6Lr+37NQYakHqm4KaCD
	n9rag9xIFpYuqrXo18+kZhJ/8e8eQwbAfUVN/eUpsH2D9zAhs3ZpMBAgLB5LmT1M
	7BTtqe8W1dIzq1b5n51TPAbmX+8DSsvjmvw==
X-ME-Sender: <xms:IBxiaIwchHOmA6FeQ7PffxwcoSSB3-g1Z_ZnzUOg5IYcDGPqmhidnw>
    <xme:IBxiaMQL7OELz2kZexvdiO1vRd2CP8fPdlc30RROCsjgewHrrPZQWo7Lcdxg-a0Wx
    O_JkUNQrg22rg>
X-ME-Received: <xmr:IBxiaKVyIwxYKzJMfHpwzhGytsVuWOeLMjVnQ0x3zn_b58zyvq0Otxhl-zfDaYRYYBrZ0FWXBPy45Qt4BEO3g9jUuyljPTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepfeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehmrghrtggvlhhomhhorhgvihhrrgduledtheesghhmrghilhdrtghomhdprhgtphhtth
    hopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepshhk
    hhgrnheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopeimlhhktggrmhhpsdhprghttghhvghssehlihhsth
    hsrdhsrhdrhhhtpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghr
    ohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
    pdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvg
X-ME-Proxy: <xmx:IBxiaGh6Fw-RXzsEvIwmaBvaU1oxWtSorwjBkPn0QujLW7abjRPecQ>
    <xmx:IBxiaKBSHMkgJBETZYvnXs_MkD0sUN6-xl5_AfasrSwFPPTIm_keqQ>
    <xmx:IBxiaHKKsX_quCHlf_l55MONDvdM7abvMM50wSyL6KvfRJdDTGOsvw>
    <xmx:IBxiaBDwr9D-KtrWmaafwhPVk8b7zkkynaTYeR9rqaeRNvhOGI545w>
    <xmx:IRxiaCCowyhA3Rs2oRCJitMToWxsOdSp2RGm83Kxn4JsKOT-o7CgH9n5>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 01:09:52 -0400 (EDT)
Date: Mon, 30 Jun 2025 07:09:50 +0200
From: Greg KH <greg@kroah.com>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: replace scnprintf with sysfs_emit_at
 in debugfs show
Message-ID: <2025063006-recopy-playmaker-562d@gregkh>
References: <20250629233509.291786-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629233509.291786-1-marcelomoreira1905@gmail.com>

On Sun, Jun 29, 2025 at 08:35:09PM -0300, Marcelo Moreira wrote:
> Update the receive_timing_debugfs_show() function to utilize
> sysfs_emit_at() for formatting output to the debugfs buffer.
> This change adheres to the recommendation outlined
> in Documentation/filesystems/sysfs.rst.
> 
> This modification aligns with current sysfs guidelines.

But this isn't a sysfs file, it's a debugfs file, so why are you calling
sysfs_emit_at()?

> 
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 46 ++++++++++++++---------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 1383d1e21afe..98bea08a14e4 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3427,37 +3427,35 @@ static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
>  	struct it6505 *it6505 = file->private_data;
>  	struct drm_display_mode *vid;
>  	u8 read_buf[READ_BUFFER_SIZE];
> -	u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
> -	ssize_t ret, count;
> +	ssize_t ret;
> +	ssize_t count = 0;
>  
>  	if (!it6505)
>  		return -ENODEV;
>  
>  	it6505_calc_video_info(it6505);
>  	vid = &it6505->video_info;
> -	str += scnprintf(str, end - str, "---video timing---\n");
> -	str += scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
> -			 vid->clock / 1000, vid->clock % 1000);
> -	str += scnprintf(str, end - str, "HTotal:%d\n", vid->htotal);
> -	str += scnprintf(str, end - str, "HActive:%d\n", vid->hdisplay);
> -	str += scnprintf(str, end - str, "HFrontPorch:%d\n",
> -			 vid->hsync_start - vid->hdisplay);
> -	str += scnprintf(str, end - str, "HSyncWidth:%d\n",
> -			 vid->hsync_end - vid->hsync_start);
> -	str += scnprintf(str, end - str, "HBackPorch:%d\n",
> -			 vid->htotal - vid->hsync_end);
> -	str += scnprintf(str, end - str, "VTotal:%d\n", vid->vtotal);
> -	str += scnprintf(str, end - str, "VActive:%d\n", vid->vdisplay);
> -	str += scnprintf(str, end - str, "VFrontPorch:%d\n",
> -			 vid->vsync_start - vid->vdisplay);
> -	str += scnprintf(str, end - str, "VSyncWidth:%d\n",
> -			 vid->vsync_end - vid->vsync_start);
> -	str += scnprintf(str, end - str, "VBackPorch:%d\n",
> -			 vid->vtotal - vid->vsync_end);
> -
> -	count = str - read_buf;
> +	count += sysfs_emit_at(read_buf, count, "---video timing---\n");
> +	count += sysfs_emit_at(read_buf, count, "PCLK:%d.%03dMHz\n",
> +			vid->clock / 1000, vid->clock % 1000);
> +	count += sysfs_emit_at(read_buf, count, "HTotal:%d\n", vid->htotal);
> +	count += sysfs_emit_at(read_buf, count, "HActive:%d\n", vid->hdisplay);
> +	count += sysfs_emit_at(read_buf, count, "HFrontPorch:%d\n",
> +			vid->hsync_start - vid->hdisplay);
> +	count += sysfs_emit_at(read_buf, count, "HSyncWidth:%d\n",
> +			vid->hsync_end - vid->hsync_start);
> +	count += sysfs_emit_at(read_buf, count, "HBackPorch:%d\n",
> +			vid->htotal - vid->hsync_end);
> +	count += sysfs_emit_at(read_buf, count, "VTotal:%d\n", vid->vtotal);
> +	count += sysfs_emit_at(read_buf, count, "VActive:%d\n", vid->vdisplay);
> +	count += sysfs_emit_at(read_buf, count, "VFrontPorch:%d\n",
> +			vid->vsync_start - vid->vdisplay);
> +	count += sysfs_emit_at(read_buf, count, "VSyncWidth:%d\n",
> +			vid->vsync_end - vid->vsync_start);
> +	count += sysfs_emit_at(read_buf, count, "VBackPorch:%d\n",
> +			vid->vtotal - vid->vsync_end);
> +	
>  	ret = simple_read_from_buffer(buf, len, ppos, read_buf, count);
> -

Shouldn't this all be using seq_print() instead?

Again, don't use sysfs_emit*() functions for non-sysfs files, as you do
NOT know the size of the buffer here (hint, it's not the same).

And, your patch added trailing whitespace, did you forget to run it
through checkpatch.pl before sending it?

thanks,

greg k-h
