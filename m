Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAB2DFA2E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767906; cv=none; b=UINpfKq0EVJRlnsMFAF6rwNOjYx9Nhp/sdtyMdsi00QfGQLVYTdAlRVO5Eq8l3zu/3ezy8yuzRxUmiMDKGRXgGvIPJh8A2o7Ko39dpzdQCqJ7O3gxFXcYXbGj1XOp68f0/WQbQRMYJSrk8kGYJpFI8T6DKgDqqXy0lXB/UszSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767906; c=relaxed/simple;
	bh=sztdsTy4wa87P27KIh0T1takdVyve9oLKd7HhMANHuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM1Gksv6VFNKOnHiH9cV3pd/6iXeT0KBBSQEWHxTBZMaNSp3vLcZIqaLn8FWkLd0PatwGzw703F2tkW4+KJS3K5LjWUSXs4lN/MdC0X1M77mzXtO+YMpE94Zl4RqUiQxK9nD8qky6mAT72y2lqryMAxf8AA7r+3W6zXcOetZbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RUZS1/8Q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RUZS1/8Q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23633a6ac50so20612705ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749767904; x=1750372704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fda6FxdHT/voycTXa7lxHxxCOeerrK6XiPZedwQDUNg=;
        b=RUZS1/8QjScUEBYfMwe7kKugDHP/UAFe6m7dEwNKdCH2tb+6qinA83yXA9F7NTTVLd
         HoahoBbMVilS2Q2LaViWxRXFcc8kO4xtFszKmZHQpnEnNgBNPphzv17dIZ9LYkPXYrCt
         CQk+r3chjW3JwoeKoSyuLOwAkMfvyBd9emiIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767904; x=1750372704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fda6FxdHT/voycTXa7lxHxxCOeerrK6XiPZedwQDUNg=;
        b=X/KKoVzfqLBbRWvfR/XUoMzUaE0cxPB7vvK+/26UbYFVL6jD/RknM7Qtr2hVaNflCl
         DIAvHXtzOHlnmaEE5LU7mgpgpUFhnxFg5GIF/puBCfAdIswThgjkY6mbviMM6CJeOcPm
         rgYE+POvoXQKXKVJmhqR4sd+pGvJj9hAd0UY+wpZJJVcFvYQp9/3mGrBaAFxjbwRkyjW
         iTB4On2ebTZ3Eg3yol10GWOdrfP0MkDAMt2S7W6z4uDq+LgLA0zPMkymp4mvbPyVYKDu
         cimISYck8HN2nqkhL9BuwOWUXVIs0QzPSgL1V3H1F1CNU4DKMcyRIB8NuCiMcigCd3P0
         UUug==
X-Forwarded-Encrypted: i=1; AJvYcCUpck4CF87QN2juqJit84lOOSAt2jjjAHag0Zk4peucAPcYFk40RJe9BAsYdUk5Xfjm9Ku/dFAAQ6RBXbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqnSLxC4hSOGcbp1fc9vdG7/gvLA4uzW2oXXg+3HyeDF7Rqnv7
	OBq2HUNdu9OTX1sWCnbK2yqfv7aUaVTOBg7VAej7gdcgJtqknm22uyKTrEoASpcUhQ==
X-Gm-Gg: ASbGncsVvMYEvctFgf8sH0ELSZVHPkX9Ih7VbjuvwRrhP9YpW6IGdG/Z2e8bMyvomqR
	AmLfpYaRnFgVc2QBuKTTIMzrhpbpLFQvZGHWogtRjpTocFNWEjkNbjUBWs9dvVj0bNZNcPBTrRa
	cTj5PBAKA76ys77khtX/BpIhAmlkc2iOXZKFUwbEMjvE69z1cg7X9Apc+V0CPWcR47Q6w/Gk/V6
	teigjMNmhYT6ShknhoGCSjELI6811wuM+sWTAsvAyHuWb4ZhCJ7ZAtREoyjFzMbm8pDI8w3Mmar
	g6ZaEgueja+jeW5odRz8E+TX38M8rzUpt730+LzVx6bOSTFru+ASaAnUq9CiOW2hu7vLH84oT+F
	Zf9qJ9U1ik9yi0F6uaOWinmoq
X-Google-Smtp-Source: AGHT+IHNrBQDYFUbwAQiVtbeP7J80oAQ5zRsvtDdeTdUWMr9CI9SHerDWzXPw5mfWEBomTlmMULilw==
X-Received: by 2002:a17:903:b50:b0:234:ed31:fcb1 with SMTP id d9443c01a7336-2365d8c55e7mr9712975ad.20.1749767903699;
        Thu, 12 Jun 2025 15:38:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:9a04:ac66:831d:e4a6])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe164406esm301867a12.27.2025.06.12.15.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 15:38:22 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:38:21 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aEtW3e7mwjTTvfO9@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>

On Thu, Jun 12, 2025 at 04:05:49PM +0200, Michal Gorlas wrote:
> Places a blob with Linux-owned SMI handler in the lower 4GB of memory, calculates
> entry points for the it and triggers SMI to coreboot's SMI handler
> informing it where to look for Linux-owned SMI handler.
> 
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  drivers/firmware/google/Makefile    |   9 ++
>  drivers/firmware/google/mm_blob.S   |  20 +++
>  drivers/firmware/google/mm_loader.c | 186 ++++++++++++++++++++++++++++
...
> --- /dev/null
> +++ b/drivers/firmware/google/mm_loader.c
> @@ -0,0 +1,186 @@
...
> +static int register_entry_point(struct mm_info *data, uint32_t entry_point)
> +{
> +	u64 cmd;
> +	u8 status;
> +
> +	cmd = data->register_mm_entry_command |
> +	      (PAYLOAD_MM_REGISTER_ENTRY << 8);
> +	status = trigger_smi(cmd, entry_point, 5);
> +	pr_info(DRIVER_NAME ": %s: SMI returned %x\n", __func__, status);

Don't print this kind of debug stuff at INFO level. If you need it, use
KERN_DEBUG.

Once this gets attached to a proper device/driver, you probably want
dev_dbg(), if anything.

> +
> +	return status;
> +}
> +


> +	/* At this point relocations are done and we can do some cool

	/*
	 * Multiline comment style is like this.
	 * i.e., start with "/*" on its own line.
	 * You got this right most of the time.
	 */

> +	 * pointer arithmetics to help coreboot determine correct entry
> +	 * point based on offsets.
> +	 */
> +	entry32_offset = mm_header->mm_entry_32 - (unsigned long)shared_buffer;
> +	entry64_offset = mm_header->mm_entry_64 - (unsigned long)shared_buffer;
> +
> +	mm_header->mm_entry_32 = entry32_offset;
> +	mm_header->mm_entry_64 = entry64_offset;
> +
> +	return (unsigned long)shared_buffer;
> +}
> +
> +static int __init mm_loader_init(void)
> +{
> +	u32 entry_point;
> +
> +	if (!mm_info)
> +		return -ENOMEM;

Hmm, so you have two modules, mm_info and mm_loader. mm_loader depends
on mm_info, but doesn't actually express that dependency. Can you just
merge mm_loader into mm_info or vice versa? Or at least, pass the
necessary data directly between the two, not as some implicit ordering
like this.

> +
> +	entry_point = place_handler();
> +
> +	if (register_entry_point(mm_info, entry_point)) {
> +		pr_warn(DRIVER_NAME ": registering entry point for MM payload failed.\n");
> +		kfree(mm_info);
> +		mm_info = NULL;
> +		free_pages((unsigned long)shared_buffer, get_order(blob_size));
> +		return -1;
> +	}
> +
> +	mdelay(100);

Why the delay? At least use a comment to tell us. And if it's really
needed, use msleep(), not mdelay(). scripts/checkpatch.pl should have
warned you. And, please use scripts/checkpatch.pl if you aren't already
;)

> +
> +	kfree(mm_info);
> +	mm_info = NULL;

This is odd and racy, having one module free data provided by another,
where that other module might also free it. Hopefully this gets
simplified if you manage to combine the modules, like I suggest.

> +	free_pages((unsigned long)shared_buffer, get_order(blob_size));
> +
> +	return 0;
> +}
> +
> +static void __exit mm_loader_exit(void)
> +{
> +	pr_info(DRIVER_NAME ": DONE\n");
> +}

Remove this function. We don't do prints like this.

Brian

> +
> +module_init(mm_loader_init);
> +module_exit(mm_loader_exit);
> +
> +MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
> +MODULE_DESCRIPTION("MM Payload loader - installs Linux-owned SMI handler");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.49.0
> 
