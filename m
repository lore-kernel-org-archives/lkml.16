Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840F71E9B00
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244906; cv=none; b=th8PzOR0NVaLAchj3HvzrYxfCFS+RPbSn0ehqKhKMZHNYKNWUmtgNEwoUq9EIcS0TWspVVs5hbPjtRJ3DURdy0+W0c6wizKjuLRVbvDUL8hZcEuXzDWBbv4cfLGinXQbCsNLJCa6sHb0U1CL3OPirYYE5f7nq20xvcfZ+1CAm34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244906; c=relaxed/simple;
	bh=/RKesL3pDU/5wSH8US0M8xou+SHJMHoKNgrLZiJ3c40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oX7AO1StheKJzdDI4AWAL7ZyK8gCyx2W7OOe15nzG64EollVRSaOTnntM5dQ3QPn9WHbOBmFMhgP8rOcZmf2l3cEPVpvU51gSA1YTdnqwucJJ/X+0/BglS9Ny55w3E3q+tABHl2sMhZkVbzv120FKgCVfviL+QCMV2M18++EDmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iKRm1b4Z; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iKRm1b4Z"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 605DC44328;
	Thu, 30 Jan 2025 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvbVA5XBjbaLREaV7gUhD+Rw0JXtJ8CAVxLKiUEFvkw=;
	b=iKRm1b4ZeRbDw1kWWPgaYmkcDSPROTG8NLvlU17X1STCS4DefbL2fujrlBcvAy7lsOklLI
	bTXeetn1fYbDfNx/tHzgBPzGHf7AVvcvpa+xz0hY0/3hbYejrMmaWXfrx9gjenVUB3xHu6
	bm/7KoBWNC1w309+K9pT6hQW9uyWkrsN7oTiNymBZrzg39udOW3n99ilvxLeep1LGv1Uay
	DLTC3oEmEmYjyIAYsxIcBP47kN9jSw9Ghtc8xHA3E25nZ3QkeNSgqrLtYZ4lc8+IqpuCS2
	l9QiFYInMoMjb5LqWCo+Iwy/g6Waqx6j8iq1cChNxIq3L4m2RSXACgG9/bU5Pw==
Date: Thu, 30 Jan 2025 14:48:15 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/13] drm/vkms: Set device name from vkms_config
Message-ID: <Z5uDH033JbPvC1to@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-6-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-6-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> In order to be able to create multiple devices, the device name needs to
> be unique.
> 
> Allow to set it in the VKMS configuration.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index d8644a1e3e18..526800b1afb4 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -15,10 +15,15 @@ struct default_config_case {
>  static void vkms_config_test_empty_config(struct kunit *test)
>  {
>  	struct vkms_config *config;
> +	const char *dev_name = "test";
>  
> -	config = vkms_config_create();
> +	config = vkms_config_create(dev_name);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
>  
> +	/* The dev_name string and the config have different live times */

s/live times/lifetimes/

> +	dev_name = NULL;
> +	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
> +
>  	vkms_config_destroy(config);
>  }
>  

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index d0868750826a..3e4f39cbe2e2 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -10,12 +10,14 @@

[...]

> +/**
> + * vkms_config_get_device_name() - Return the name of the device
> + * @config: Configuration to get the device name from

Can you add here that the pointer is only valid while vkms_config is 
valid?

> + */
> +static inline const char *
> +vkms_config_get_device_name(struct vkms_config *config)
> +{
> +	return config->dev_name;
> +}
> +

With those modifications:

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
