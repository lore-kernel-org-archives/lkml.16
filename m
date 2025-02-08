Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70323C8D6;
	Sat,  8 Feb 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739003890; cv=none; b=XaMgZq1hPbOkc+Nc/33Dt6LnB2EhzK5HucwnxFI7x9vQDS6WboVeQHh+r2iZmGhKwk9+ktFq8u0fK3PKbsDp3ufRo4ldxlIB0/oHzSWxpN7/lTtOlVTBC9c6eN/ohZICeaO8M+19B1X14EoeKkLkowr98HPpOi8DVCpTXp5JVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739003890; c=relaxed/simple;
	bh=MS8vF7c7Rpsh3pAY2Mv8MJkEjOLBxODiDVCRbRv/g4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWS6nPFbIB9NAD43Ome+APE4/zUmvdS0/69BpSMjHgHeW7NpxLrVex5chQzLPgHpFTwlzr8F+ZragXZN9+6gJecfVdKNR9lKohudCKACYOq3QAqyvSB/edLuynCqTZorHHN7JnWy1Mjirc3PhhlSYVQmByKn5ge6x56aYTHq5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E9QFQKSL; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E9QFQKSL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD99F442F6;
	Sat,  8 Feb 2025 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739003880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EvJxtdAqRk11pGBtTHjM48jcZaiwtjZUv5lMTaJZ+Fw=;
	b=E9QFQKSLl27KxBvOwN8qvmMJZ6woA++CO2thLknO6yxIHxN/sUCGmrCvJCHNwAR+J6GBlf
	vwUcAOCaRbfGHz0tWysyO61ol1CslVV4KbLgCCX0gfiEtKfEcH2rfHuq/Dl+F6fizexMe+
	WzQ59VfZ2UxWKtvusrpdf43A90luk8SFQeZbsa72BmIiK1mfoYvx9aX3bGRuWbIzrWVyZl
	/Hh629V+VGCKL/pao6xx959ZJCt4u8+TxxiUATVb/G5ygNm/XB1aTC5Hpdf6FKO7MWryDo
	h07zp3dntJTvO4qcc/jo1tmNH3zX19OGN80ULTxLZLJE2Wzk7OfuEQxFehVWow==
Date: Sat, 8 Feb 2025 09:37:56 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 8/8] drm/vkms: convert to use faux_device
Message-ID: <Z6cX5MG3yM4XL9jR@Host-003>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020625-unlaced-vagueness-ae34@gregkh>
 <Z6Y72LK1UW86x8av@louis-chauvet-laptop>
 <2025020855-ventricle-slang-b705@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020855-ventricle-slang-b705@gregkh>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfeetffekgfefheehteefffehiefhffeutefggeefleduudeujeekgfduheetffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehpdhhvghlohepjfhoshhtqddttdefpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrfhgrv
 ghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprghlvghkshgrnhguvghrrdhlohgsrghkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

On 08/02/25 - 08:12, Greg Kroah-Hartman wrote:
> On Fri, Feb 07, 2025 at 05:59:04PM +0100, Louis Chauvet wrote:
> > On 06/02/25 - 18:38, Greg Kroah-Hartman wrote:
> > > The vkms driver does not need to create a platform device, as there is
> > > no real platform resources associated it,  it only did so because it was
> > > simple to do that in order to get a device to use for resource
> > > management of drm resources.  Change the driver to use the faux device
> > > instead as this is NOT a real platform device.
> > > 
> > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > >  v3: new patch in the series.  For an example of the api working, does
> > >      not have to be merged at this time, but I can take it if the
> > >      maintainers give an ack.
> > 
> > Hi,
> > 
> > This patch cannot be merged into drm-misc-next because we modified the 
> > vkms_device structure in commit 49a167c393b0 ("drm/vkms: Switch to dynamic 
> > allocation for CRTC"), which is present in linux-next.
> > 
> > Once this conflict is resolved, I agree with changing from platform_device 
> > to faux_device.
> > 
> > Apart from this minor conflict, I believe your patch has revealed an issue 
> > in VKMS:
> > 
> > Without your patch:
> > 
> > 	bash-5.2# modprobe vkms
> > 	[drm] Initialized vkms 1.0.0 for vkms on minor 0
> > 	bash-5.2#
> > 
> > With your patch:
> > 
> > 	bash-5.2# modprobe vkms
> > 	faux vkms: Resources present before probing
> > 	[drm] Initialized vkms 1.0.0 for vkms on minor 0
> > 	bash-5.2#
> > 
> > After some investigation, I found that the issue is not caused by your 
> > patch but by VKMS itself:
> > 
> > During faux_device_create, the device core postpones the device probe to 
> > run it later [0]. This probe checks if the devres list is empty [1] and 
> > fails if it is not.
> > 
> > [0]:https://elixir.bootlin.com/linux/v6.13.1/source/drivers/base/bus.c#L534
> > [1]:https://elixir.bootlin.com/linux/v6.13.1/source/drivers/base/dd.c#L626
> > 
> > With a platform driver, the order of execution was:
> > 
> > 	platform_device_register_simple();
> > 		device_add();
> > 	*async* device_probe(); /* no issue, the devres is untouched */
> > 	devres_open_group();
> > 
> > But with faux-device, the order is:
> > 
> > 	faux_device_create();
> > 		device_add();
> > 	devres_open_group();
> > 	*async* device_probe(); /* issue here, because of the previous 
> > 				   devres_open_group */
> 
> Wait, what?  It shouuld be the exact same codepath, as faux_device() is
> not doing anything different from platform here.  You might just be
> hitting a race condition as the async probing is the same here.

Yes, this is the same codepath, and this is a race condition. VKMS was 
just lucky it never happend before. 

> > How do you think this should be solved? I would like to keep a simple 
> > solution, given that:
> > - we want to have multiple vkms devices (configfs [2])
> > - we need to ensure that device_probe is called before devres_open_group 
> >   and devm_drm_dev_alloc to avoid this error
> 
> How about we take out the async probe?  You are getting lucky that it's
> not hit on the platform device code today.  Faux really doesn't need
> async, I was just trying to make the system work the same way that
> platform devices did.

I think this should be sufficient, and allows for a very simple interface: 
once faux_device_create returns, you can use the device "as-is", no 
need to wait for the probe.

What change can I do to disable async probe and test?

Thanks,
Louis Chauvet

> And as for the merge issue, not a problem, I just did this conversion
> for people to see how this works and ideally test it, as you did, to
> find issues!
> 
> thanks,
> 
> greg k-h
