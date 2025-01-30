Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A2C1EE7DA
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244915; cv=none; b=V5povtoQgryot3Zs9HByK0jg2DZCtHOAU8vRvqPCJ3DfRIls8xrcPK7uFPy7iaU2V7rDyDNWHbN10o+CGZmu3Up7Z/vRTU4+EVB2+SEPqG3t3eWeeHc6w+ocu0QBSGsIlR19Q7+f7E5oGNfMBt0UGlciMQIP2fYIeW4RfFIbENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244915; c=relaxed/simple;
	bh=43L69UphyWyMqeZk43aaNkuUM4FvoMW3nuCDqunybJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdMJeJQaI7pgGVoAN4kov6ndagtTOPXIYMLuq+yjNofRxzb2+zD6vOUuuwiNoquEXwQNJCXptCaNJnIIjOeid5ENImkeipukKgSbuzaQd/AnqbVTiOybITGAZg5hG2bDIYVT8dvlGoz/R6N5NiaCoXfLiw4yqaSykOtcOc/JTes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kpvlUAoe; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kpvlUAoe"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9CD044296;
	Thu, 30 Jan 2025 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uQmB25EJhB+8/HLFAr4UH4azwGCGo+vs6Zi+bry4J4=;
	b=kpvlUAoexrm8muR1mbmhp/JeCUEtGZOeeOL08ScXyfKp+0vLRMoMmUyuc34CYCPuZIcxZg
	V0p42CTAgYw44P7i5I3eFuAuC1msuxa29wM1pF+z06mglTnljKS000qFaI0XJVprrmomII
	Mlbj83hS6vwuMrK2XZiW3H1rORW5UmjSeaMPRgALrIKWTaWsO9G6jUnhosKdsUWxfkUUo2
	FT72iO0VuZ1tCx6k87BUixhp3E1n+D8PEKMwAdgx+6ieie90p+lkTyP++fo5IKGH/X3Ug4
	uNL6iLpKNCDWjj5E4Y6dRiA1sMXI1JQUvIlQeKaEEjZcqUPeoJ3PoVTtg1gx9g==
Date: Thu, 30 Jan 2025 14:48:23 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/13] drm/vkms: Allow to configure multiple encoders
Message-ID: <Z5uDJ00o6Hqm6i9a@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-11-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-11-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of encoders to vkms_config and helper functions to add and
> remove as many encoders as wanted.
> 
> For backwards compatibility, add one encoder to the default
> configuration.
> 
> A future patch will allow to attach encoders and CRTCs, but for the
> moment there are no changes in the way the output is configured.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> +static void vkms_config_test_valid_encoder_number(struct kunit *test)

Same as before, can you rename to vkms_config_test_invalid_encoder_number

> +{
> +	struct vkms_config *config;
> +	struct vkms_config_encoder *encoder_cfg;
> +	int n;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	/* Invalid: No encoders */
> +	encoder_cfg = list_first_entry(&config->encoders, typeof(*encoder_cfg), link);
> +	vkms_config_destroy_encoder(config, encoder_cfg);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Invalid: Too many encoders */
> +	for (n = 0; n <= 32; n++)
> +		vkms_config_add_encoder(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}
> +

[...]

> +struct vkms_config_encoder **vkms_config_get_encoders(const struct vkms_config *config,
> +						      size_t *out_length)
> +{
> +	struct vkms_config_encoder **array;
> +	struct vkms_config_encoder *encoder_cfg;
> +	size_t length;
> +	int n = 0;
> +
> +	length = list_count_nodes((struct list_head *)&config->encoders);
> +	if (length == 0) {
> +		*out_length = length;
> +		return NULL;
> +	}
> +
> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	list_for_each_entry(encoder_cfg, &config->encoders, link) {
> +		array[n] = encoder_cfg;
> +		n++;
> +	}
> +
> +	*out_length = length;
> +	return array;
> +}

Same as before, can we use an iterator?

> +struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +
> +	encoder_cfg = kzalloc(sizeof(*encoder_cfg), GFP_KERNEL);
> +	if (!encoder_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	list_add_tail(&encoder_cfg->link, &config->encoders);
> +
> +	return encoder_cfg;
> +}
> +
> +void vkms_config_destroy_encoder(struct vkms_config *config,
> +				 struct vkms_config_encoder *encoder_cfg)
> +{
> +	list_del(&encoder_cfg->link);
> +	kfree(encoder_cfg);
> +}

Same as before, can we change the add/destroy naming?

