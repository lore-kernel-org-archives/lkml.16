Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6D1EE7DA
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244926; cv=none; b=EfpHwKJgAJOllbjIFy+/iDbwaJLH1rD/Tg7mf6e08CpANZfPKFRkWevPABcCM4QxwGl9PRLYp8oOUrCA/sXyTHHvasD/6QT99z4PC295fhD/jycnVU+QIIiVM/a728Odz0Jx41atz7oCtLtqkapSrVYoxPN6nIqjtRrLzXfRSsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244926; c=relaxed/simple;
	bh=fc3XxLk16hJoVi2XKGQSPHK6jUSptrvGOFLG8EK5X6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVAyllDNpqt/DbpaOI1CxWpNlUU05jEs79rdVE3h885IG0qz/VGReTsUtHlhluhNn0uW/6rw4XIErQHjIAvFaFkshPrS+T6FR8Caa2LqoRak9hBsX78P56v0XBn9sPBuq9XfbHoUFnFsWFzqzlUheCxlkGdwogqfH4tyQcBqCJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Kcyf3DXS; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Kcyf3DXS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70B7F441B3;
	Thu, 30 Jan 2025 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85kJCHv6mcyuCfmx7l4s0FYyTZf+9J9uLLR+dRb0d/A=;
	b=Kcyf3DXSrLfcfJcX7+OatitxPkf3mLxsWYjTso7LMROsoQA0FnOuFb3ygkITKozS87k5Di
	/WQIwEv2yg1M2LoFUaTF7GZE2/Ypv1FN0zsFyfxsE/HO7fIwP59ZP3MrVzqoDuaOhvrJe4
	VMaDog0VYVz2oSUj33Msb9A3GViJf97mZOTROY4ZsRS0c8wOjZTs4TF2CJxMgJ62poqM5q
	i6pVGJWNWZr/HxazHNv7zPRuBbg3ZcjPccdZd/S9uT3mufE7YZ/c+d2asjbZm/uOIKtz6R
	5baVQz1SrJMiMxtaTTGbE+WrYRZgGKP3lxtUV6tzpIk/5WVrzV9aRz3rlf9AGQ==
Date: Thu, 30 Jan 2025 14:48:35 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] drm/vkms: Allow to attach connectors and encoders
Message-ID: <Z5uDM-AGkxoGcKPg@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-14-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-14-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of possible encoders to the connector configuration and
> helpers to attach and detach them.
> 
> Now that the default configuration has its connector and encoder
> correctly, configure the output following the configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 62 +++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.c            | 69 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 33 +++++++++
>  drivers/gpu/drm/vkms/vkms_output.c            | 57 +++++++++++----
>  4 files changed, 209 insertions(+), 12 deletions(-)

[...]

> +int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
> +						      struct vkms_config_encoder *encoder_cfg)
> +{
> +	struct vkms_config_encoder *possible_encoder;
> +	unsigned long idx = 0;
> +	u32 encoder_idx = 0;
> +
> +	xa_for_each(&connector_cfg->possible_encoders, idx, possible_encoder) {
> +		if (possible_encoder == encoder_cfg)
> +			return -EINVAL;

Is this really an error? For me this should be valid: we want to attach 
the connector and the encoder, it is already the case, so it is good.

> +	}
> +
> +	return xa_alloc(&connector_cfg->possible_encoders, &encoder_idx,
> +			encoder_cfg, xa_limit_32b, GFP_KERNEL);
> +}
> +

[...]
