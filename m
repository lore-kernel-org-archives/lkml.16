Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE42C1F8676
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811846; cv=none; b=fyKT9Y/dkM6SY4QjpgItOUZ0uaYJ4nYxDs/HX1Py0++sW5e1qp6/fQ6OMWCZIs8PJ5UfQtdwHwfMZo2nJW6FkJJdTQB7+002+Psd2fqmhiPQTWzmoSP0n5kWPVlnqRjksW3KAwfYHmRgv1qmDqvqyhcvmHnfUhgAqdgUGDv+F3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811846; c=relaxed/simple;
	bh=MNXVDNVfw5Twupf4cZaVoIvlSy9LnqYAExkWnEXMwE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHBQkqeZlgXyOjCxKxTfyBjqDoHB5V427PqRj/sSjhQV6tGKPHvnrHRFLQrUNHJ5BSW7uIMNIrddNyG5o5rtmB7Hn37IKVquamgXB9BGLReqOTQyB4kAtdl+6hiZetS6eXxm16DK0Gsc+8/F11J2ToTt4UQLw4rgfNlUt8i3wbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lxue+z7W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lxue+z7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744811843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8FZv3owO9XjrPT1Qe2b2EgoIB5J4qrwytxe3pIKY7Sg=;
	b=Lxue+z7WypC6qVnT1VsCVx3cZCrsjZzDFcbk5XfgEDekyWVZimKGAByXq7bMwbhqVPw2Mw
	drw+Z+hU1vcUFdcbLbKe67L1sj2fpe/Sg40p+TzbhZQ0hBxj5xXdN6AdXcfbeQZdUN7rmX
	gXRkg98Ne6E3NzZ03l8y1jZxzo6o1eA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-z8sKgJnPN2aC5T__Amqn7w-1; Wed,
 16 Apr 2025 09:57:17 -0400
X-MC-Unique: z8sKgJnPN2aC5T__Amqn7w-1
X-Mimecast-MFC-AGG-ID: z8sKgJnPN2aC5T__Amqn7w_1744811836
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B600E180098A;
	Wed, 16 Apr 2025 13:57:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.216])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C14F180045C;
	Wed, 16 Apr 2025 13:57:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id ED6CB1800387; Wed, 16 Apr 2025 15:57:11 +0200 (CEST)
Date: Wed, 16 Apr 2025 15:57:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Eric Auger <eauger@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
	David Airlie <airlied@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2] virtgpu: don't reset on shutdown
Message-ID: <lgizdflxcku5ew2en55ux3r72u37d6aycuoosn5i5a5wagz6sc@d2kha7ycmmpy>
References: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
 <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
 <20250415095922-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415095922-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Tue, Apr 15, 2025 at 10:00:48AM -0400, Michael S. Tsirkin wrote:
> On Tue, Apr 15, 2025 at 01:16:32PM +0200, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > +static void virtio_gpu_shutdown(struct virtio_device *vdev)
> > > +{
> > > +	/*
> > > +	 * drm does its own synchronization on shutdown.
> > > +	 * Do nothing here, opt out of device reset.
> > > +	 */
> > 
> > I think a call to 'drm_dev_unplug()' is what you need here.
> > 
> > take care,
> >   Gerd
> 
> My patch reverts the behaviour back to what it was, so pls go
> ahead and send a patch on top? I won't be able to explain
> what it does and why it's needed.

See below.  Untested.

Eric, can you give this a spin?

thanks,
  Gerd

----------------------- cut here -------------------------------
From f3051dd52cb2004232941e6d2cbc0c694e290534 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 16 Apr 2025 15:53:04 +0200
Subject: [PATCH] drm/virtio: implement virtio_gpu_shutdown

Calling drm_dev_unplug() is the drm way to say the device
is gone and can not be accessed any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index e32e680c7197..71c6ccad4b99 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
 
 static void virtio_gpu_shutdown(struct virtio_device *vdev)
 {
-	/*
-	 * drm does its own synchronization on shutdown.
-	 * Do nothing here, opt out of device reset.
-	 */
+	struct drm_device *dev = vdev->priv;
+
+	/* stop talking to the device */
+	drm_dev_unplug(dev);
 }
 
 static void virtio_gpu_config_changed(struct virtio_device *vdev)
-- 
2.49.0

