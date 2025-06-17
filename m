Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C6923AE84
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185298; cv=none; b=A594mMEenh+H7h31rOKSAL53hbrNea/rDRAmRXdvQafadqDnLN9VfRRucL2R40GXdwA6fs3c/SG3v/TJMp4KZZjEztndi4NTdZ7KOtC4nvI5kDOWBZek4Al1NqQv8GsQ1Zfb9d5sGBohrw72ct478/6ucmTF1EVzEzPCB7BhCiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185298; c=relaxed/simple;
	bh=vNXK4oDmkZ/5vEde1tk21+hvLrX1mK5D+uSj7F3uoxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qi2YJ6OEVAotwh0We7wni2yyTx3AbCntd3qReODggqXwk7PVfHeCUTpIUZfz/f7lsMsAMf6mGhd1Kfhlpplr8YPMPKTkkUiiFYUogtgmOLypTnq0hbdLKntPEp2/JCi2AO/kgd6tMp1aQ2ER38mZd6RNunlQXhaDQ5xiRXojYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SW6fBmVh; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SW6fBmVh"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a585dc5f4aso78894561cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750185294; x=1750790094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IkUw7K1fNTUFr0XSmkjhiZVRjINQnKgrdCWIYf4LhiU=;
        b=SW6fBmVhRIDyMil9P+ONyamLGQ+q2K8ad+OW+owAVvPuliycX23+XDnXPKi29J5uQg
         YvXvKp2hUg7jUzUmBIjnmT4zPQLzwAg5LcPSAMOIskePlaxqMaGZvIBy+nufqbc4J7cQ
         6m/25EF0/S8ptbo6HUSnGApHMRBM6Ow1Fh6+Dck2t6WzLvCo10vZJIjwDoFVl58/Rn7x
         W+aQX8r6NAtBN0okuV0/CAzA1S9vdQTD/i53ZtZV6a78RkSILxyL/bRlBIsb/yHZb+2Z
         K+ySpHlALFM7Op+GnP31DpQF4Je9/A26J1XQejZ37kUOlFehgmMcqWCTY1T/5QuhHb3K
         L1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750185294; x=1750790094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkUw7K1fNTUFr0XSmkjhiZVRjINQnKgrdCWIYf4LhiU=;
        b=DPFFbsYX57+l77BODYlpJ2EgAkrUJh94j1uIzJWXpSe2k6080OkWQFIlZXZDI1lpgI
         Wx20yBYCZY/Vn6SGGT4254lmVQrLGIsFbQlHD2k4/suwAb1YcazHCGQz7cNeyz50R0YR
         S741yYSNVWYC/WXukxe3CfRshamwM0PLfvKlUhQSyQ5Mvp4x5Uvic9MKHzChBEVAG+vd
         c0ZZN2mMS04q6+z2KB7+wEOaMv8/sQDA7kSjHrYzPgFO3GMDwpGlAdTgML5pdz6D2wZi
         e5sHcGbTAEC6d35qdFlbeF8Rvd8ThcfeAhW86oGKzm5hGokd372TYsuKFSY6UxqLF7b+
         WqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQZsgQffOD8aShzWDIBwQCID2VKcmnXWsj9n4noHc5aoQDmt1P3LXMVziXthNM5meORyvsSbzoHhlmFaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0d0+Y538SZMHnyFTOLb1PhZoh+r6d1CZV8xI46sf0Avq16jl
	3I0uDl/qSUqyRE8qyEdSF2giAg+/GxRPBsIkN23q1hmlZ4NFoR2ho0Ipnya5R93T8p4=
X-Gm-Gg: ASbGncvAr5IzoyekHl3nPCjy6oYPkpoPhk7BNTme/by8cI8i/2aaUB/Dt8/Z3KmSZE7
	9X47GS6IAnh4vTvc/P/CIupohCCIopp3q+BL28rpB9YcSwOKv+UGBc2L4HuyBsJuo+TWpiqogDk
	0AD7bR5s5+vWlZHFBS2nn8rwLIFBXoljsYuwO0FvJsew3pj64DjNp5pnVDTaX5VjwhDJTCK4sQh
	y6QEmHAWUxQuQG/hWBQJyGvXT/Cz1mm9Tx4TNwmwQ17cd0sB8s/ISomhRQdCDourGb8wJ4NzaxZ
	GU35bKNg9Bmnpxq7KwN7x/C2QEZEoprR3FqfZhQ+/rai6i/ZKh8+Uf3liCLhVemL4SQBfCIJvab
	hyb9fDm98gEPKqBvTP1VkMbAlU/qLnG4VH0Ca/g==
X-Google-Smtp-Source: AGHT+IF+gpQV430tU9VpFbWOEEO9nCtbhkf7JKZT2vfz8vbnYNPhZr+BRPLWyOfEF+iclrfKMJ7agA==
X-Received: by 2002:ac8:598b:0:b0:494:a2b8:88f0 with SMTP id d75a77b69052e-4a73c589061mr236405141cf.33.1750185293762;
        Tue, 17 Jun 2025 11:34:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b0cb9sm64018831cf.50.2025.06.17.11.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 11:34:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRb92-00000006bm4-2q58;
	Tue, 17 Jun 2025 15:34:52 -0300
Date: Tue, 17 Jun 2025 15:34:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] iommufd: Destroy vdevice on device unbind
Message-ID: <20250617183452.GG1376515@ziepe.ca>
References: <20250610065146.1321816-1-aneesh.kumar@kernel.org>
 <BN9PR11MB527606182417BB7A35349F598C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250612172645.GA1011960@ziepe.ca>
 <BN9PR11MB5276B467ADCC57BC6571CA458C77A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250613124202.GD1130869@ziepe.ca>
 <yq5abjqotim7.fsf@kernel.org>
 <BN9PR11MB527633CA2F698E83E12BFBD68C70A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250616164941.GA1373692@ziepe.ca>
 <yq5azfe6ssev.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5azfe6ssev.fsf@kernel.org>

On Tue, Jun 17, 2025 at 01:37:04PM +0530, Aneesh Kumar K.V wrote:
 
> How do we reclaim that object id for further reuse? 

Maybe just don't? Userspace did something it shouldn't, it now leaked
8 bytes of kernel memory until the FD is closed.

> is it that if there is a request for a iommufd_object_remove() with object
> refcount > 1, we insert a XA_ZERO_ENTRY and convert that to NULL entry
> on IOMMU_DESTROY?

Oh no we can't do that, if the refcount is elevated that is a problem,
it means some thread somewhere is using that memory.

We can sleep and wait for shortterm_users to go to zero and if users
is still elevated then we are toast. WARN_ON and reatin it in the
xarray and hope for the best.

So the thread that will trigger the detruction needs to have a users
refcount of 1. Meaning users needs to be one while idle in the xarray,
and the idevice destruction will obtain a users=2 from its pointer
under some kind of lock.

> -enum {
> -	REMOVE_WAIT_SHORTTERM = 1,
> -};
> +#define	REMOVE_WAIT_SHORTTERM	BIT(0)
> +#define	REMOVE_OBJ_FORCE	BIT(1)

You can keep the enum for flags, but 'force' isn't the right name. I
would think it is 'tombstone'

> diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
> index b7aa725e6b37..d27b61787a53 100644
> --- a/drivers/iommu/iommufd/main.c
> +++ b/drivers/iommu/iommufd/main.c
> @@ -88,7 +88,8 @@ struct iommufd_object *iommufd_get_object(struct iommufd_ctx *ictx, u32 id,
>  
>  	xa_lock(&ictx->objects);
>  	obj = xa_load(&ictx->objects, id);
> -	if (!obj || (type != IOMMUFD_OBJ_ANY && obj->type != type) ||
> +	if (!obj || xa_is_zero(obj) ||
> +	    (type != IOMMUFD_OBJ_ANY && obj->type != type) ||
>  	    !iommufd_lock_obj(obj))

xa_load can't return xa_is_zero(), xas_load() can

We already use XA_ZERO_ENTRY to hold an ID during allocation till
finalize.

I think you want to add a new API

iommufd_object_tombstone_user(idev->ictx, &idev->vdev->obj);

Which I think is the same as the existing
iommufd_object_destroy_user() except it uses tombstone..

The only thing tombstone does is:

	xas_store(&xas, (flags & REMOVE_OBJ_TOMBSTONE) ? XA_ZERO_ENTRY : NULL);

All the rest of the logic including the users and shorterm check would
be the same.

> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -213,6 +213,8 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  	/* vdev lifecycle now managed by idev */
>  	idev->vdev = vdev;
>  	refcount_inc(&vdev->obj.users);
> +	/* Increment refcount since userspace can hold the obj id */
> +	refcount_inc(&vdev->obj.users);
>  	goto out_put_idev_unlock;

I don't think this should change.. There should be no extra user refs
or userspace can't destroy it.

The pointer back from the idevice needs locking to protect it while a
refcount is obtained.

Jason
