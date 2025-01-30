Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549A1EE7B7
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244914; cv=none; b=qjNuW9ijstYDcEOndSARukHdbWdjzR2RDk25t4zdIRmc/euZCLvTQ4X+KRkyrtreGMG5EAqfxZO1qhHTWZtTdrvtCBaSdZrljvkwBD10fSwDPmP1eiruqh1V3FxjNQ6/h5OwASc14Qr/YQ4TVmvKRXLvhqXB0fIIHR1yZYGgayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244914; c=relaxed/simple;
	bh=xJWIvSN+l2XpX/ADXHkzUUOA+zx8sxUQoAoKUeEUf/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVoVUETAIgj34tWI3PTOi2xSheb6CS5nEw9wwyYoqeYjyx3rmIJJdZiQuxZ5APwBPhKngdxbyCji1Ic/yZDAZiysHH5fZUmjhnMj00AzB79Y26YnsA1NLYbgvCNW3sdaRZTpyW5vj7tX7vMpR00eT3VDTT96q49sc2ibnyZZ/wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lRhCZi/8; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lRhCZi/8"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05A47443CD;
	Thu, 30 Jan 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eH/Z+gByAJwUFVDz5FkDRyz1/FIuT3KGBVj+zs6yvKU=;
	b=lRhCZi/85aIrIGfAJVrPqbbQu97cU73Xfmw4rApblzHpQinoCAJ6GMXVMU4MyHctL9a5es
	vjEKurZ0YKZGMNUdgerP0QzomaJpHVsjpZ0coldQjg0CW74EZ/buhZ9bFik3GN7tijeoTO
	fOdFnEHRSTamVUspsg2zqUsqZV8CFI7rpu5pSegnP2NWLxqHTg77EIUrqw1yaFaGWOD/wf
	FCd7JpZroxk+fGl6KTIEnSdIeG0xMnNYoBUAivpdG7vMc5nWwzEeAAqjjDDMg9qg/qTq8k
	0bjDwK7BQgde8Bnx76CqkWc23xKp123+YvM40Y6XtOhZ0os8PLuu7KAIaAyfHA==
Date: Thu, 30 Jan 2025 14:48:24 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/13] drm/vkms: Allow to configure multiple connectors
Message-ID: <Z5uDKKlLPTWHtFzr@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-13-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-13-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of connectors to vkms_config and helper functions to add and
> remove as many connectors as wanted.
> 
> Unlike planes, CRTCs and encoders, connectors can be added and removed
> once the device is created. To reflect it, add an "enabled" flag in the
> configuration and filter disabled connectors in the
> vkms_config_get_connectors() function.
> 
> For the moment, changing the enabled status of the connector has no
> effect after the device is created, but a future patch will add this
> capability.
> 
> For backwards compatibility, add one enabled connector to the default
> configuration.
> 
> A future patch will allow to attach connectors and encoders, but for the
> moment there are no changes in the way the output is configured.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Same comments as previous commits:
- I am not fan of the add/destroy naming
- I think it is better to have an iterator to use connectors
