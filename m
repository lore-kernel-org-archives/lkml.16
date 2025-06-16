Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE711B4247
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085236; cv=none; b=LZMaeiPD6IRPXbnQMKBFeeHbKbnm9h97hPxDm0TlSOeueH5Hq0MkXsO9+BY4Dd0oFBmuRMs/Uafa9KWhJQ4PWY7qgLsQDF7HR9go/ZQcjV4COI5hnr6WKdmCnPPT6CJFbK5CZEOX/xPdqji6Gf88ns/e8TsKAvqJNxPy2O2CIlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085236; c=relaxed/simple;
	bh=xg24GodcE/R7QwlKG95Q6b8SkO55s4EXCY89KpOFH6g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZxgQ+4QbiJy91Sz5nkkTPg+6JNaNKh4N20rZLeWJE2zgWPtsQFAJNKXUC9PFsXgl0wudYUQmpFxNbd3PQ/eL7NhMrlwJgMCtTTbqk3Q45FpHK6FOL/BlLo8UTq6V2GSicAEujAJFEclez5d53Q5gUfpZ7KsjkiHCU8mVdBfmW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQg+RWsk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQg+RWsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750085234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1oMCwmhoJuX3afov1EeRHX/PbEgzpQwOebgiLZxq3lU=;
	b=DQg+RWskM5YN9IFUTc3JqbFqjWOGjGuCun37QXUtjL8u4NM9tEdvCpEdo4mkDu2nw23Pwk
	Qy6qZFIUwtvXjPhnD1pJ9OTXS2tPE5zZglqD1QHwDfimjnc+bgiznJ0gppVDuXBKhA4IQK
	an2OhZ5kzv383+v1frGWgh23Jg0vUaU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-3OHxTiIDMJidpBBc8Ao19g-1; Mon, 16 Jun 2025 10:47:12 -0400
X-MC-Unique: 3OHxTiIDMJidpBBc8Ao19g-1
X-Mimecast-MFC-AGG-ID: 3OHxTiIDMJidpBBc8Ao19g_1750085232
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-875fff4d6afso496439f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085232; x=1750690032;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1oMCwmhoJuX3afov1EeRHX/PbEgzpQwOebgiLZxq3lU=;
        b=Ecl+HSP0itIhOdHSApdDo9ATsSsm7WvqmXScUL7l0JSSaOX3Z7EYZu4WH2MUpySYRk
         yGT3jLOXj2zHvbWZ/TOLMXsmSW/6fcC8bzBQKhu90QRuuU5rJFwHsrfbjWoXph+eAE0X
         mhqX0el1YroZ0pSfr7WNYdZvI4cjBBSdXFpo7yXl0FSJNC/12dIMLZnMP5ka+Zlq/QOW
         mq5ybYrRW5x6nj73XNOdci9xdi5eZKlboNNNT3vgiX1Ah3FVNB0s/JC8+zavPNFuiIZ9
         DiPTsJTQTzNOnd8s8kMtstDChXYpbNeOuj0rOaw7J+sMiKDZMJDUrs59b3jLeOcujQJC
         AysQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQN5GFi4M1QgRcMj+asUq8sFjrlulNFXqJoFN7x8zIg1cf8UvuMWp0HKqBlZSMsFMTIdf/sFuzCUcFX3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0l59q91t3UV4TlRxObeKi7EvLSvRFqV9Ar9RqtBrkq6K7/+F
	5FmYq2huJFE6nC1goZ6swYf+HUbwr2UXyskus8OPo5uIrC6jB7AFglVcPehVtkA3KtIqYMw1TjP
	ebZehno6y+cvgi6Al2rh5/E8JIvAONiFbld50rIJuMKv+W1Sb2R8pfd3c+6qaQvqWww==
X-Gm-Gg: ASbGncthToPBXMbEiwOVq3o+tu/D0AaK7XHv0d36bQRzGf5C9sOp/C+jPxC+fGUp7k7
	1ErVBQRv7RHIssdcqXEhbplMXceX44gapIGPGvfZLWC1JaFynnNdVW3v3jT7msc+zExu+xCeZnn
	DrYVttzjzbt5P8unxOLK3K4ilNHV6meHn9FmwIjt6Lj0AbJNuLkg7rc//Efd3Gc9F417R8lsXcj
	T0XrPZceVq9j0qL+wrHjQGwlUKlg0mScFx6ua2/YbYmQ8m9FKGFwIHc5k48bfCmxeRF8khurDec
	vu5zGOxPrBQ3zCmiGy4xqmylQA==
X-Received: by 2002:a05:6e02:380a:b0:3dc:8423:545b with SMTP id e9e14a558f8ab-3de07bb2627mr27839335ab.0.1750085231892;
        Mon, 16 Jun 2025 07:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLpLGsMkr0KWba9uSXUpLEeujlM/8bc3J1BFXjs68sqnUor1wGTGtN+OZ3Xm3jdQMZTJM55g==
X-Received: by 2002:a05:6e02:380a:b0:3dc:8423:545b with SMTP id e9e14a558f8ab-3de07bb2627mr27839185ab.0.1750085231534;
        Mon, 16 Jun 2025 07:47:11 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a4541esm20253865ab.46.2025.06.16.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:47:10 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:47:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "Liu, Yi L"
 <yi.l.liu@intel.com>, Zhang Yu <zhangyu1@microsoft.com>, Easwar Hariharan
 <eahariha@linux.microsoft.com>, Saurabh Sengar
 <ssengar@linux.microsoft.com>
Subject: Re: [PATCH v2 2/2] vfio: Fix unbalanced vfio_df_close call in
 no-iommu mode
Message-ID: <20250616084708.5a94ead7.alex.williamson@redhat.com>
In-Reply-To: <20250614001555.GR1174925@nvidia.com>
References: <20250603152343.1104-1-jacob.pan@linux.microsoft.com>
	<20250603152343.1104-2-jacob.pan@linux.microsoft.com>
	<20250613163103.3bca27cd.alex.williamson@redhat.com>
	<20250614001555.GR1174925@nvidia.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 21:15:55 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Fri, Jun 13, 2025 at 04:31:03PM -0600, Alex Williamson wrote:
> > On Tue,  3 Jun 2025 08:23:43 -0700
> > Jacob Pan <jacob.pan@linux.microsoft.com> wrote:
> >   
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > 
> > > For devices with no-iommu enabled in IOMMUFD VFIO compat mode, the group
> > > open path skips vfio_df_open(), leaving open_count at 0. This causes a
> > > warning in vfio_assert_device_open(device) when vfio_df_close() is called
> > > during group close.
> > > 
> > > The correct behavior is to skip only the IOMMUFD bind in the device open
> > > path for no-iommu devices. Commit 6086efe73498 omitted vfio_df_open(),
> > > which was too broad. This patch restores the previous behavior, ensuring
> > > the vfio_df_open is called in the group open path.
> > > 
> > > Fixes: 6086efe73498 ("vfio-iommufd: Move noiommu compat validation out of vfio_iommufd_bind()")
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Tested-by: Jacob Pan <jacob.pan@linux.microsoft.com>
> > > Signed-off-by: Jacob Pan <jacob.pan@linux.microsoft.com>
> > > ---
> > > v2: Use a fix from Jason
> > > ---
> > >  drivers/vfio/group.c     | 10 +++++-----
> > >  drivers/vfio/iommufd.c   |  3 ---
> > >  drivers/vfio/vfio_main.c | 26 ++++++++++++++++----------
> > >  3 files changed, 21 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> > > index c321d442f0da..8f5fe8a392de 100644
> > > --- a/drivers/vfio/group.c
> > > +++ b/drivers/vfio/group.c
> > > @@ -192,18 +192,18 @@ static int vfio_df_group_open(struct vfio_device_file *df)
> > >  		 * implies they expected translation to exist
> > >  		 */
> > >  		if (!capable(CAP_SYS_RAWIO) ||
> > > -		    vfio_iommufd_device_has_compat_ioas(device, df->iommufd))
> > > +		    vfio_iommufd_device_has_compat_ioas(device, df->iommufd)) {
> > >  			ret = -EPERM;
> > > -		else
> > > -			ret = 0;
> > > -		goto out_put_kvm;
> > > +			goto out_put_kvm;
> > > +		}
> > >  	}
> > >  
> > >  	ret = vfio_df_open(df);
> > >  	if (ret)
> > >  		goto out_put_kvm;
> > >  
> > > -	if (df->iommufd && device->open_count == 1) {
> > > +	if (df->iommufd && device->open_count == 1 &&
> > > +	    !vfio_device_is_noiommu(device)) {  
> > 
> > Why do we need this?  
> 
> What I was trying to do is put all the logic about noiommu into only
> vfio_df..open/close functions instead of sprikling it into a bunch of
> other functions. That seemed to be the right point to make this cut.

Alternatively we could be consistent about breaking out of the
vfio/iommufd.c functions that aren't relevant to noiommu.  The
container side handles noiommu internally, why should iommufd push
handling up to the device file layer?  We're really just missing the
bind path.

TBH, it seems like special casing iommufd in the device file layer is
what led to the issue introduced in 6086efe73498.

> > int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
> >                                     struct iommufd_ctx *ictx)
> > {
> >         u32 ioas_id;
> >         int ret;
> > 
> >         lockdep_assert_held(&vdev->dev_set->lock);
> > 
> >         /* compat noiommu does not need to do ioas attach */
> >         if (vfio_device_is_noiommu(vdev))
> >                 return 0;  
> 
> So this should be removed, I missed it
> 
> > > @@ -54,9 +54,6 @@ void vfio_df_iommufd_unbind(struct vfio_device_file *df)
> > >  
> > >  	lockdep_assert_held(&vdev->dev_set->lock);
> > >  
> > > -	if (vfio_device_is_noiommu(vdev))
> > > -		return;
> > > -  
> > 
> > Why not keep this and add similar to vfio_df_iommufd_bind()?  It seems
> > cleaner to me.  Thanks,  
> 
> Same as above, we don't check for noiommu in bind, so we should not
> check it in unbind to have a symetrical API design.

Or check it in bind since we already check it in unbind.  Either way,
symmetry.
 
> With this patch we move toward the vfio_df..open/close functions being
> symmetrical in their decision making.

But is it?  We special case all the iommufd paths to filter out noiommu
but it's inconsistent with the legacy paths.  Thanks,

Alex

