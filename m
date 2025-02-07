Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8E1DC197;
	Fri,  7 Feb 2025 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919792; cv=none; b=SRFHlSqnsTrO7COfzq0s5iXfXzrmFq5XPcBrchq1PmvqfDuJBlfg9qxI0K7LI5UsjaeBB44n59M+bDbnfp4Tx9jymkn4U0aWJD6eqz8YDkAlQolcI+XeiYSx3QenWqlb/k+snER4xflttEb4sZrs2aq/gK7kT6CRXLDuDy0eqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919792; c=relaxed/simple;
	bh=O2y8q4c8A3OyDmP9Ta+QDXoJmcctrhH3Se0qUIZkcAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgMvItfHTIDBYW0jT8KUJ0J6PxwZHEudfDHVBFscnc6FOvk9QwHSUqYgE6+9HvG9yy+BeO3BNNj+vjUxJkdm4MtVS8cA7wR3T0RuIvYld5oUQQTrECSUTrmHWQ4NgAJBJx3XG4Aq0Q87mqNinYK2dYOa1bc8760IZBbYBXmHVEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G06kY1ap; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G06kY1ap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7DEC4CED1;
	Fri,  7 Feb 2025 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738919792;
	bh=O2y8q4c8A3OyDmP9Ta+QDXoJmcctrhH3Se0qUIZkcAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G06kY1apGdLtO+MZA2A+LzA3C0VISup043MPcq89dtmhd9n/efKKvSCApfCtX8Yuj
	 8JDN13xG12mViXME+G51ORJrZ649U6MnEl+o2wmwIIWqrIgD2Xy6JmnMe/b8zhhAx6
	 PH8WG3ZHOUEc6zQL7CuBUXV2S4NbjtqSuJEQ8nus=
Date: Fri, 7 Feb 2025 10:16:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
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
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 8/8] drm/vkms: convert to use faux_device
Message-ID: <2025020716-research-renounce-85f6@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020625-unlaced-vagueness-ae34@gregkh>
 <900399945f614a3ebc885f2d9628f773e65c97c2.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <900399945f614a3ebc885f2d9628f773e65c97c2.camel@redhat.com>

On Thu, Feb 06, 2025 at 03:03:41PM -0500, Lyude Paul wrote:
> Lol, I wrote up a patch for this last night but it looks like you got here
> first :P
> 
> On Thu, 2025-02-06 at 18:38 +0100, Greg Kroah-Hartman wrote:
> > The vkms driver does not need to create a platform device, as there is
> > no real platform resources associated it,  it only did so because it was
> > simple to do that in order to get a device to use for resource
> > management of drm resources.  Change the driver to use the faux device
> > instead as this is NOT a real platform device.
> > 
> > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  v3: new patch in the series.  For an example of the api working, does
> >      not have to be merged at this time, but I can take it if the
> >      maintainers give an ack.
> >  drivers/gpu/drm/vkms/vkms_drv.c | 28 ++++++++++++++--------------
> >  drivers/gpu/drm/vkms/vkms_drv.h |  4 ++--
> >  2 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index e0409aba9349..b1269f984886 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -10,7 +10,7 @@
> >   */
> >  
> >  #include <linux/module.h>
> > -#include <linux/platform_device.h>
> > +#include <linux/device/faux.h>
> >  #include <linux/dma-mapping.h>
> >  
> >  #include <drm/clients/drm_client_setup.h>
> > @@ -177,25 +177,25 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> >  static int vkms_create(struct vkms_config *config)
> >  {
> >  	int ret;
> > -	struct platform_device *pdev;
> > +	struct faux_device *fdev;
> >  	struct vkms_device *vkms_device;
> >  
> > -	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> > -	if (IS_ERR(pdev))
> > -		return PTR_ERR(pdev);
> > +	fdev = faux_device_create(DRIVER_NAME, NULL);
> > +	if (!fdev)
> > +		return -ENODEV;
> >  
> > -	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> > +	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
> >  		ret = -ENOMEM;
> >  		goto out_unregister;
> >  	}
> >  
> > -	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
> > +	vkms_device = devm_drm_dev_alloc(&fdev->dev, &vkms_driver,
> >  					 struct vkms_device, drm);
> >  	if (IS_ERR(vkms_device)) {
> >  		ret = PTR_ERR(vkms_device);
> >  		goto out_devres;
> >  	}
> > -	vkms_device->platform = pdev;
> > +	vkms_device->faux_dev = fdev;
> >  	vkms_device->config = config;
> >  	config->dev = vkms_device;
> >  
> > @@ -229,9 +229,9 @@ static int vkms_create(struct vkms_config *config)
> >  	return 0;
> >  
> >  out_devres:
> > -	devres_release_group(&pdev->dev, NULL);
> > +	devres_release_group(&fdev->dev, NULL);
> >  out_unregister:
> > -	platform_device_unregister(pdev);
> > +	faux_device_destroy(fdev);
> >  	return ret;
> >  }
> >  
> > @@ -259,19 +259,19 @@ static int __init vkms_init(void)
> >  
> >  static void vkms_destroy(struct vkms_config *config)
> >  {
> > -	struct platform_device *pdev;
> > +	struct faux_device *fdev;
> >  
> >  	if (!config->dev) {
> >  		DRM_INFO("vkms_device is NULL.\n");
> >  		return;
> >  	}
> >  
> > -	pdev = config->dev->platform;
> > +	fdev = config->dev->faux_dev;
> >  
> >  	drm_dev_unregister(&config->dev->drm);
> >  	drm_atomic_helper_shutdown(&config->dev->drm);
> > -	devres_release_group(&pdev->dev, NULL);
> > -	platform_device_unregister(pdev);
> > +	devres_release_group(&fdev->dev, NULL);
> > +	faux_device_destroy(fdev);
> >  
> >  	config->dev = NULL;
> >  }
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 00541eff3d1b..4668b0e29a84 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -209,13 +209,13 @@ struct vkms_config {
> >   * struct vkms_device - Description of a VKMS device
> >   *
> >   * @drm - Base device in DRM
> > - * @platform - Associated platform device
> > + * @faux_dev- Associated faux device
> 
> Small nitpick - you dropped the space on the - here by mistake

Ick, good catch.

> With that fixed:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for the review!

greg k-h
