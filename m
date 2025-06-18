Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B6927EFE5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750288300; cv=none; b=N+MVg87uDi3e3nb1ZgOiCz7Yk1xPf8Mb0rhOQYoZbarCjGjO6fbpyw85DEalWyyGWQDsn9wggewRCDRZaqOeHIcbNKPIHJtOlajOcQ0zo30uExPbTLjz8BKtRePJU855wq0maVB02adjMh/WOI+puA0oAV1BFeCQJTW0TRasWHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750288300; c=relaxed/simple;
	bh=VftgimLnnsmlKj+0PEXR/pU3gL5kE9WGutl83BgF1R8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/zDD7xSRn98cnTf1cCTqhgEWzjJyr4uwfQVuhwNwEZ/Zs5u51/BB5Y/rwkphJLgcmyZkXicSC+t6lVZjpGEkDepZsS771UwsjqBgv5HE5nzrbaKqJ541j7q8YilMVpsGOa19B5SO48WCt3h+h7LHq2I8f5YBR5ZawzYlb/UyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=rMZEEwlj; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rMZEEwlj"
Received: from DESKTOP-0403QTC. (unknown [40.65.108.177])
	by linux.microsoft.com (Postfix) with ESMTPSA id 540072119369;
	Wed, 18 Jun 2025 16:11:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 540072119369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1750288297;
	bh=DA/is/Ek2hBai3IoktVprxtBXAkjDgqz1K5Jp0l55wo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
	b=rMZEEwljjBFD7PWmwg9RgQ5JGj80V9QHkG3EJK806wJ7WtLIPo2QTVubU2JnKipCr
	 pHCXen0La9zV6fssVF74rzJMuZYuQBAEMVvDjMrlJ7u1m/Ze79p4ETHOc3o6fAndx2
	 Sn0uNIRPHgnZHCe0iUK4EKz7FjNwyb8lEykHdxy0=
Date: Wed, 18 Jun 2025 16:11:36 -0700
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 linux-kernel@vger.kernel.org, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, "Liu, Yi L" <yi.l.liu@intel.com>, Zhang Yu
 <zhangyu1@microsoft.com>, Easwar Hariharan <eahariha@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>, jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v2 2/2] vfio: Fix unbalanced vfio_df_close call in
 no-iommu mode
Message-ID: <20250618161136.39029872@DESKTOP-0403QTC.>
In-Reply-To: <20250616200558.GR1174925@nvidia.com>
References: <20250603152343.1104-1-jacob.pan@linux.microsoft.com>
	<20250603152343.1104-2-jacob.pan@linux.microsoft.com>
	<20250613163103.3bca27cd.alex.williamson@redhat.com>
	<20250614001555.GR1174925@nvidia.com>
	<20250616084708.5a94ead7.alex.williamson@redhat.com>
	<20250616153455.GK1174925@nvidia.com>
	<20250616134004.60105ad5.alex.williamson@redhat.com>
	<20250616200558.GR1174925@nvidia.com>
Reply-To: jacob.pan@linux.microsoft.com
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jason,

On Mon, 16 Jun 2025 17:05:58 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Jun 16, 2025 at 01:40:04PM -0600, Alex Williamson wrote:
> > --- a/drivers/vfio/group.c
> > +++ b/drivers/vfio/group.c
> > @@ -192,18 +192,18 @@ static int vfio_df_group_open(struct
> > vfio_device_file *df)
> >  		 * implies they expected translation to exist
> >  		 */
> >  		if (!capable(CAP_SYS_RAWIO) ||
> > -		    vfio_iommufd_device_has_compat_ioas(device,
> > df->iommufd))
> > +		    vfio_iommufd_device_has_compat_ioas(device,
> > df->iommufd)) { ret = -EPERM;
> > -		else
> > -			ret = 0;
> > -		goto out_put_kvm;
> > +			goto out_put_kvm;
> > +		}
> >  	}
> > 
> > 
> > And add a noiommu exit branch to _iommufd_bind, symmetric to unbind.
> > Right?  Thanks,  
> 
> Just comparing to the original
> 
> +	if (iommufd) {
> +		if (!vfio_device_is_noiommu(device))
> +			ret = vfio_df_iommufd_bind(df);
> 
> Isn't being captured, so it needs another hunk in
> vfio_df_iommufd_bind()
> 
OK, will send out v3 with this concise fix. I am also working on the
noiommu special mode as you suggested, then we can allow bind again.

Thanks,

Jacob

