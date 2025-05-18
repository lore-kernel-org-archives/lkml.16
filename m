Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291F3B2A0
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605249; cv=none; b=NvuJvUjiX4lCf/XOZ+ErwjmIQ92fsdzD8hnaJU2pH6puqSCxvg8NYqOBkYH2SErSiVUwzqftqrHEz06TOMEmRoOEi5a8l3c/7nYOVhWh6rbG+pcMhyPoFYfIwud/+jq27HQB1rjNFLNghhkhrva31x0D+kS3K0qSxrSWgmI21Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605249; c=relaxed/simple;
	bh=20PnTSuJpTRB3a9rlj7kzIgZoWPhz/piVscbTKW0rhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9IWqvYlf3JjZxZHJMe+uDo/KubwHMZ1MHdg3nIhUWP7vR1AnHTu0BtI7oeDtMHWSjiNJfsiYBjtpHtAiBtS6oQKpZPkVfhGFzUTVoDuRMmcLwk3idp8NU6C8fcnDg74Et8+/EPrIyxszYhrRYTOt/20BUAGzZOweD7ao2DuepU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTnnvjtw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTnnvjtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747605246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIaIOnVIIar3oPXWrnvC7B8zNsFcZdASTSy76IqR298=;
	b=VTnnvjtwe2u2xdP0F7+DZ6n8k95lYaxxXZZLiJm2L+lpWzFGnIjRVwBUKe/HhDq0x5LWyH
	QNk3rkEvEP1GlML1MzLM/0vz2t7F2ekV0Ios06sxQkESmVw6n2lWyXo2Xphrsjaj/iplva
	3MNAWwq/3ds3SGKnlA4WMn16jOUX99U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-BVKwt8l6MWecIqTZfuiHDw-1; Sun, 18 May 2025 17:54:05 -0400
X-MC-Unique: BVKwt8l6MWecIqTZfuiHDw-1
X-Mimecast-MFC-AGG-ID: BVKwt8l6MWecIqTZfuiHDw_1747605244
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so21922815e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747605244; x=1748210044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIaIOnVIIar3oPXWrnvC7B8zNsFcZdASTSy76IqR298=;
        b=sJbjaEeHhQ24a+WCJopAPSS2u+hWjKIVCqLaAKt6H1CAb//076X5p20Pjom9/bW4gi
         r3VianPKr36i8ZkBJeoJgJvBmVVwhbPPGtC0ElcBgEifaj7I8626UqDNz98Sg5LJH/D0
         6b1CFB6I9PCVI8EUic4nVznuQzyVC1Sn8h1IudAx6gDsAqdUd2uxs5e12Uq/SVxM5uqA
         DH1rOLjYKPlRUPZHpaGpzhW4KKC3g7eVgjSOa1/rxb8Dwiwkzeeiv6c3ImF3LZJrQ59p
         r8pXyl1OGvVXj4ceG1p9r2i3SKegAPGDaD3XlP8XI9kkAO1Vo8u7NvPCWdSKWuwigaAq
         eqrw==
X-Forwarded-Encrypted: i=1; AJvYcCXdszu1LyCyTQFc72FUiXSticJ9qJtdL26xg6f+zZaWUIWe9ZGS97g18txfZou1XDDPZqFhYIfo9Ci2o8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlI8i/Mb4OWPIPmsAehA2MvRXz0BbpSlWQvpDcv6EMR50gMzK2
	dKTFZ5Y6XbzIQA7FbLmPeN3jAk090x2A5i7aoFLOI9WVYKRVdyEMGw9UD4S3vZaE3cBJdM2kE5u
	H6w2ONIqKe0wGBorMzDFnquV3INIEsC0hR1xHWXvWD4AwXiuaAapubd6yUDA9oW72Lg==
X-Gm-Gg: ASbGncuWVUwHU0ehtSOzXIrbVo81rh+Fysr7VFsPO7ZH8dtbZhTMbYpUsJwk+NLhH0w
	pIAwFuHBw0y+MhjDXT8Zyz0CmW4cEZPaT605pMNNarC1zcCE9XI6CohOm01ffs6vwjdtYvOX45Q
	znNZc93eH5DAdcWq/yZyh7Gnt4cw6wSiz6kRFomar2PNTBT/l9GO4ZA2Zc0tsJ8lSqV9xDVmAGJ
	xF4ewo6C4IND7/XXzaal/eeIyF76CSGgEoLbzKVhI+WM2DNI6IPTDgbwjkPW4FRnd9I7QBYfnYH
	ioBiUw==
X-Received: by 2002:a05:600c:3ca0:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-442ff0328b8mr73538025e9.20.1747605244355;
        Sun, 18 May 2025 14:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvqrHVss6NuJi0HAtzkEcNBJlsY/d82el2/IApsycphIjM1sMh75zLHZaVQnejymivmh22FQ==
X-Received: by 2002:a05:600c:3ca0:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-442ff0328b8mr73537855e9.20.1747605244018;
        Sun, 18 May 2025 14:54:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35e49262fsm10020425f8f.44.2025.05.18.14.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:54:02 -0700 (PDT)
Date: Sun, 18 May 2025 17:53:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	Eric Auger <eric.auger@redhat.com>,
	David Airlie <airlied@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: implement virtio_gpu_shutdown
Message-ID: <20250518175332-mutt-send-email-mst@kernel.org>
References: <20250507082821.2710706-1-kraxel@redhat.com>
 <urpxto3fgvwoe4hob2aukggeop4bcsyb7m5wflgru4c3otd6rq@aktopqufgxom>
 <iptz2uxajkl3l62piqu6tq5pembbmqho667otbaj7nneh5vk3r@sxdvm7e57nae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iptz2uxajkl3l62piqu6tq5pembbmqho667otbaj7nneh5vk3r@sxdvm7e57nae>

On Tue, May 13, 2025 at 12:18:44PM +0200, Gerd Hoffmann wrote:
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > index e32e680c7197..71c6ccad4b99 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
> > >  
> > >  static void virtio_gpu_shutdown(struct virtio_device *vdev)
> > >  {
> > > -	/*
> > > -	 * drm does its own synchronization on shutdown.
> > > -	 * Do nothing here, opt out of device reset.
> > > -	 */
> > > +	struct drm_device *dev = vdev->priv;
> > > +
> > > +	/* stop talking to the device */
> > > +	drm_dev_unplug(dev);
> > 
> > I'm not necessarily opposed to using drm_dev_unplug() here, but it's
> > still pretty surprising to me. It's typically used in remove, not
> > shutdown. The typical helper to use at shutdown is
> > drm_atomic_helper_shutdown.
> > 
> > So if the latter isn't enough or wrong, we should at least document why.
> 
> The intention of this is to make sure the driver stops talking to the
> device (as the comment already says).
> 
> There are checks in place in the virt queue functions which will make
> sure the driver will not try place new requests in the queues after
> drm_dev_unplug() has been called.  Which why I decided to implement it
> that way.
> 
> drm_atomic_helper_shutdown() tears down all outputs according to the
> documentation.  Which is something different.  I don't think calling
> drm_atomic_helper_shutdown() will do what I need here.  Calling it in
> addition to drm_dev_unplug() might make sense, not sure.
> 
> Suggestions are welcome.
> 
> take care,
>   Gerd


I suggest adding comments in code explaining why it's approriate here.
Want to try?

-- 
MST

