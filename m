Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7790C1E98ED
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244904; cv=none; b=g/WttK8Io8jwXcdNoxsjDp6QsK5EziKECBA7SKJgzUkxZtoNXbF9RG150xF3pQCm6CrIaJaPZeAli4EU3KAz3fHmQSDY7Xi1BQP/IKull4eG1bXTs0eSUf6FfbBM/pZYM5DWNugOxeOup4zrMt+ljzgZUQWt6XqOOH27NPsW8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244904; c=relaxed/simple;
	bh=Au2vtnK4yR6HukFDFGlDoPQJESniMvYhnk6TiaRfzBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4z8A2z7V3b5WOgYWORedHJpcGAjJM8gNWdbhP9oQbRkyrdB1SztetLCQNtoi6BqhPnIw1PlmdJK8wjJ0vvvu+ghj4C0E1AWUtb5CKmjlicQ748ZIZUuq9PK3rY4yft9oiF/jyroVtSdY6HtG0dPjuP+5U7+2dgvi/uiYTgibLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U/lJAjwx; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U/lJAjwx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2465443E6;
	Thu, 30 Jan 2025 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvOUiKnN9Opt6ajTBRrAC5odrphVlk02TxkHxkY9zfM=;
	b=U/lJAjwxgD4TmKmOLCFeTyyxmn90Pi9zeNOfr4etiMcyE5BU1NvjU9RmIkFvu5DtqXa3Xf
	IwCWQh+8bzfZg7VYNXpI9837YLjakFs5XHqMuVTSn7yTkWIONAHKpuSJStVzsCXC6tWu5i
	ZvtxaK2wjJjfXsNmtbTxQAAvI3CoFvV0egoGzPMBH0sS0DllThQq6dYZfRpnOmFG+FfAv6
	qxJBAoq0cCXADdQRXi5nIaYC4Vg9b4hp9m7MghDzmWZpxWOYyVQjwdDigJGHnPR1I3fg3V
	YQJliEiUmrVaX+QBOz2mmjdLfXNAMQ8PcWJTQuyBGMnoN3O+8fzUkYV/RaM7Mw==
Date: Thu, 30 Jan 2025 14:48:13 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] drm/vkms: Extract vkms_config header
Message-ID: <Z5uDHcCmAwiTsGte@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-4-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-4-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Creating a new vkms_config structure will be more complex once we
> start adding more options.
> 
> Extract the vkms_config structure to its own header and source files
> and add functions to create and delete a vkms_config and to initialize
> debugfs.
> 
> Refactor, no functional changes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -208,8 +189,7 @@ static int vkms_create(struct vkms_config *config)
>  	if (ret)
>  		goto out_devres;
>  
> -	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
> -			      ARRAY_SIZE(vkms_config_debugfs_list));
> +	vkms_config_register_debugfs(vkms_device);
>  
>  	ret = drm_dev_register(&vkms_device->drm, 0);
>  	if (ret)
> @@ -231,9 +211,9 @@ static int __init vkms_init(void)
>  	int ret;
>  	struct vkms_config *config;
>  
> -	config = kmalloc(sizeof(*config), GFP_KERNEL);
> -	if (!config)
> -		return -ENOMEM;
> +	config = vkms_config_create();
> +	if (IS_ERR(config))
> +		return PTR_ERR(config);
>  
>  	default_config = config;
>  
> @@ -243,7 +223,7 @@ static int __init vkms_init(void)
>  
>  	ret = vkms_create(config);
>  	if (ret)
> -		kfree(config);
> +		vkms_config_destroy(config);

I just have a question here: is it not a problem to kfree config (and 
default_config) here? There is not risk to have a 
use-after-free/double-free in vkms_exit?

>	return ret;
>  }
> @@ -272,7 +252,7 @@ static void __exit vkms_exit(void)
>	if (default_config->dev)

The use-after-free may be here?

>		vkms_destroy(default_config);
>  
> -	kfree(default_config);
> +	vkms_config_destroy(default_config);

And maybe double-free?

>  }

If this is not an issue (ie we have a garantee that vkms_exit is never
called if vkms_init fails), you can add my

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

[...]
