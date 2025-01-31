Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048A148857
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738324548; cv=none; b=Xp3G7l0FaqiyHtuETzIqjSWn16Fny8r4a8e4JBv8TzDSRnXRRNrF84eHGRoMkNxzG03wlqJJ17BjTnWaA//coa7C9mt7Xc5O5kQVuAH4QLzY8FwVNuk8tpK1StTg6xTY9wH0RXhfMOq3eW0Mqywu7zyVFb9FjtaPtLQ2T3yGaPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738324548; c=relaxed/simple;
	bh=scVrc/yjK/SkdVvfg1LnSKpnjQsYCshbaq6radawkR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0GsB6P5XwdCRplaFWSY/NhNrkFZ90LDUq9j2l8CcU70K/BJEeWH8JK/lKifBjjfAuo8L1YBKlIUvLdsJQW9FiQndUCnc+rHFXzqXtttlRLfio0JflaX/o4UKop9u6j/OasAE+Dm9zXZUvzOeYE7llh3YArfIpbZarIH0DoMBzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BZ0h82jG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BZ0h82jG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738324544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A82Hxy6SJcFBD073DJAR0nQpQvHwFh9UPNmB7dDRDxw=;
	b=BZ0h82jGbKCpEpUmVhsZeooiWb92znNT2+U8KE1ISYxGDTXo3SvNcpU2O0TLwnQtM2WHnI
	AkoclTF38DlGTt+tSGrkwLE3QWW3kbB+SpMMzGk+89AHmXmNykYrsii7+wJKd8CdZEZBKG
	JQhvZVJ5f1Q36hqvU+2vJm2gaAUk8HI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-9pQlezwnMRqB07QcfgJZxg-1; Fri, 31 Jan 2025 06:55:42 -0500
X-MC-Unique: 9pQlezwnMRqB07QcfgJZxg-1
X-Mimecast-MFC-AGG-ID: 9pQlezwnMRqB07QcfgJZxg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so14322745e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 03:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738324542; x=1738929342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A82Hxy6SJcFBD073DJAR0nQpQvHwFh9UPNmB7dDRDxw=;
        b=WwBN+bWG/6xVcxJmYHaKcT66fCGmyyd98OG/LXAm/PGToP5IBv2a7Kuq+lW2P1gBpL
         ze8QLmf5nnsMXLkvmwvXXVxaEFSU+4him9zRg1/eBW0aVXUL1bQSgZYVtqBTfh8gyagZ
         945dArIKWCe1hyH7nFC8ECmjhbK78Rew2PLBlN/WIvoGRPZZPI1l8ZzDJzEAMLVYS11n
         vVV9U56brHDIopXlcs7YWKdhFXOnhb+WvRlPL/b8ekn1G6wnvD5xSxM0NwMc/NVW1y0d
         PI5Wzcf2cHSBSd3lXLlo82nVhHLo7rqimHbNQDHkfA/sJssbv0Fh26fe77i9GP6deNXF
         QTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjbPOV80pkHmQEQERCizHqAgNmDaImzAt8QABYxoz5VhCzCfBFD6+CMHC9qLQ7I81WC9bWivZxGC7zCQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYr2PCetDs9Xyvz0vsylgoGwEzulb0XvuKJ+dMEBntIsx/Oxb
	fJQYGT1yQfT7BfT/qxbj0qRO+AbTLwgb2mheJ46GDsm6J+J2VoP8+aGzMqryjl3X4PxToGp0zST
	A3NjSSqkh37jaoRTSX5LP9YPjYFd0f4OvBULGDAEk872nuj4pCspYn9L+mNSWew==
X-Gm-Gg: ASbGncvszbd3N839lzG+k1IC2LkG02NvlbG1VDPnB5mBFO1bGwIif3RljaOOZ5ePOdG
	Gi1PRbHUAiZGzC+g6lLlLZdWvxAqECdQ7Ik5MIgwVALf/2oVrRH7tayncWPha0ADBsgTsuaYW1r
	fVCMBxgkrYbJhVf03OznhpBm7pCydKmPIISD9uwADgp1zEogr/ECdpTQ65qaad9cR8Ww/NA2Yms
	tEp/PwNpTsMuAUs8nmaSjXnp0yyMhyzwqiCwxLPrRcWQL6jyh13RBVKsWdAE5S0iPhob/bpnb7Y
X-Received: by 2002:a05:600c:c17:b0:438:a290:3ce0 with SMTP id 5b1f17b1804b1-438dc3be2efmr102308085e9.8.1738324541664;
        Fri, 31 Jan 2025 03:55:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy3XXDXvUtmfGjiC0KpxrbpWF8jiQEcEO//6J+N25Sm2AQlT/WzpKdVXrYSGXtrNJ8Y8rAvg==
X-Received: by 2002:a05:600c:c17:b0:438:a290:3ce0 with SMTP id 5b1f17b1804b1-438dc3be2efmr102307855e9.8.1738324541230;
        Fri, 31 Jan 2025 03:55:41 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:25e:64cf:ae20:59ee:ed31:b415])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc26b15sm88397435e9.11.2025.01.31.03.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 03:55:40 -0800 (PST)
Date: Fri, 31 Jan 2025 06:55:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eauger@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH] virtio: Remove virtio devices on device_shutdown()
Message-ID: <20250131065357-mutt-send-email-mst@kernel.org>
References: <20240808075141.3433253-1-kirill.shutemov@linux.intel.com>
 <cc7312ca-2745-48a5-a5ac-9ee1d1c4bee0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc7312ca-2745-48a5-a5ac-9ee1d1c4bee0@redhat.com>

On Fri, Jan 31, 2025 at 10:53:15AM +0100, Eric Auger wrote:
> Hi Kirill, Michael
> 
> On 8/8/24 9:51 AM, Kirill A. Shutemov wrote:
> > Hongyu reported a hang on kexec in a VM. QEMU reported invalid memory
> > accesses during the hang.
> > 
> > 	Invalid read at addr 0x102877002, size 2, region '(null)', reason: rejected
> > 	Invalid write at addr 0x102877A44, size 2, region '(null)', reason: rejected
> > 	...
> > 
> > It was traced down to virtio-console. Kexec works fine if virtio-console
> > is not in use.
> > 
> > Looks like virtio-console continues to write to the MMIO even after
> > underlying virtio-pci device is removed.
> > 
> > The problem can be mitigated by removing all virtio devices on virtio
> > bus shutdown.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> 
> Gentle ping on that patch that seems to have fallen though the cracks.
> 
> I think this fix is really needed. I have another test case with a
> rebooting guest exposed with virtio-net (backed by vhost-net) and
> viommu. Since there is currently no shutdown for the virtio-net, on
> reboot, the IOMMU is disabled through the native_machine_shutdown()/
> x86_platform.iommu_shutdown() while the virtio-net is still alive.
> 
> Normally device_shutdown() should call virtio-net shutdown before the
> IOMMU tear down and we wouldn't see any spurious transactions after
> iommu shutdown.
> 
> With that fix, the above test case is fixed and I do not see spurious
> vhost IOTLB miss spurious requests.
> 
> For more details, see qemu thread ([PATCH] hw/virtio/vhost: Disable
> IOTLB callbacks when IOMMU gets disabled,
> https://lore.kernel.org/all/20250120173339.865681-1-eric.auger@redhat.com/)
> 
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks
> 
> Eric
> 


OK I'll re-review. Thanks!

> > ---
> >  drivers/virtio/virtio.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > index a9b93e99c23a..6c2f908eb22c 100644
> > --- a/drivers/virtio/virtio.c
> > +++ b/drivers/virtio/virtio.c
> > @@ -356,6 +356,15 @@ static void virtio_dev_remove(struct device *_d)
> >  	of_node_put(dev->dev.of_node);
> >  }
> >  
> > +static void virtio_dev_shutdown(struct device *_d)
> > +{
> > +	struct virtio_device *dev = dev_to_virtio(_d);
> > +	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
> > +
> > +	if (drv && drv->remove)
> > +		drv->remove(dev);
> > +}
> > +
> >  static const struct bus_type virtio_bus = {
> >  	.name  = "virtio",
> >  	.match = virtio_dev_match,
> > @@ -363,6 +372,7 @@ static const struct bus_type virtio_bus = {
> >  	.uevent = virtio_uevent,
> >  	.probe = virtio_dev_probe,
> >  	.remove = virtio_dev_remove,
> > +	.shutdown = virtio_dev_shutdown,
> >  };
> >  
> >  int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)

