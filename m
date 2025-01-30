Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566901E9B37
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244910; cv=none; b=Qk0eIzv/XOhe4FZMt5VGMIXsxSuluu6R8EPRi2JrsQ1aFUGDsvjCbF2altrWQrXyxWdP83BltBUQLriy+4wjfODD50m309NWtmY27Ba5Q59S0+GpAmI2jLtC0q93jqwbx0wHHSBYcPs5FgDNCBmeRBGuyyMJRk0gc74qpIteoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244910; c=relaxed/simple;
	bh=rMZ14btJhhptqID9ovs1VN1w2N97LfuUChqbSNyEwoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzO3A1B7f1boTa3JeD2pgI0Ad8+KNJWX75WsNKOq0mFd/A6Id62zS7APPFqdQfzuY2L/H9mh0SO2HQDQw4t2/Ndl/rqkBJeXWKJ09ALZBNeRqY5Kv2RrntvYFscHWoTVrBSJ31eOeNZVCqTE9//azmVqWaNKVQXDLNNAsc2BKbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FgjmtF6h; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FgjmtF6h"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52F0042D46;
	Thu, 30 Jan 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZocM4giOQVihnodEGteLJuYb1jmPUBAiMkOwHG12o8M=;
	b=FgjmtF6hTRFo3m866G9nf13GdMQZc0CBg8K11E8SbDHJpLU/A8k0PlG4ksueixoX/XGPUk
	OwkdDT36P5gSeYyuNkhWQXkhiZpOxqUM88OeiclC14PwHGV4lck/Z2CtkqV7vOokMv58co
	yqQkMo3i0p5U9V0AMPATTRFYv/4KcsUU2bvuG75my2nq7JZzrAS0dFomDeGK27Bj3I2hHA
	EfhakddT3gqpJmAv6r2otVOmszEIJ4iVcSfYWj4kICg1zJCVtQFSsov4KqRh7uFOVpbsX6
	ZPP41OFxRmJCM1Cl7vPVqSunuGnuFKM4oIdWJ+r0sN+N4BmoAVBhgKprZVkicw==
Date: Thu, 30 Jan 2025 14:48:24 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] drm/vkms: Allow to attach encoders and CRTCs
Message-ID: <Z5uDKNye2pkivNWj@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-12-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-12-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of possible CRTCs to the encoder configuration and helpers to
> attach and detach them.
> 
> Now that the default configuration has its encoder and CRTC correctly
> attached, configure the output following the configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c

[...]

> +struct vkms_config_crtc **
> +vkms_config_encoder_get_possible_crtcs(struct vkms_config_encoder *encoder_cfg,
> +				       size_t *out_length)
> +{
> +	struct vkms_config_crtc **array;
> +	struct vkms_config_crtc *possible_crtc;
> +	unsigned long idx;
> +	size_t length = 0;
> +	int n = 0;
> +
> +	xa_for_each(&encoder_cfg->possible_crtcs, idx, possible_crtc)
> +		length++;
> +
> +	if (length == 0) {
> +		*out_length = 0;
> +		return NULL;
> +	}
> +
> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xa_for_each(&encoder_cfg->possible_crtcs, idx, possible_crtc) {
> +		array[n] = possible_crtc;
> +		n++;
> +	}
> +
> +	*out_length = length;
> +	return array;
> +}

Same as before, can we use an iterator?

> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c

[...]

> @@ -98,22 +143,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		goto err_free;
>  	}
>  
> -	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> -	if (!encoder) {
> -		DRM_ERROR("Failed to allocate encoder\n");
> -		ret = -ENOMEM;
> -		goto err_free;
> -	}
> -	ret = drmm_encoder_init(dev, encoder, NULL,
> -				DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init encoder\n");
> -		goto err_free;
> -	}
> -	encoder->possible_crtcs = drm_crtc_mask(&crtc_cfgs[0]->crtc->crtc);
> -
>  	/* Attach the encoder and the connector */
> -	ret = drm_connector_attach_encoder(&connector->base, encoder);
> +	ret = drm_connector_attach_encoder(&connector->base, encoder_cfgs[0]->encoder);

Why do you only attach the first encoder? Can't we attach all of them?

[...]
