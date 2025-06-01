Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E625771
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748774960; cv=none; b=fokpy4aV2lAk27V2peYJxyFxqX6Lx7X8So8pxZX2W/943BFOVY4ImPkUZ9qiw1njwJU5eCJwJ8tZqxESArx2AiOBpzXm39lALmjYEVnsWOWCXODCoZ9rJpKIF6KJkp4PsiM88lxxHUh84vvTJzfH1VtrAx3xy31N17ql/mBOJC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748774960; c=relaxed/simple;
	bh=kBLKF1AdFh/RK7a1OTYX+QEN6rDtO9n4uA58wanc4Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptu6MaNeTK8mPc+75dBW9ffPtr+MHrjgJMtMdguXsVEgWciCeRAVSPoNYrijPw2DTtCrhph+mQMOzkVUnFaS5REOwPSUpXLDdM7T+hNimA+fZwhSFMZXIOOdZ9EnMf3a0sBp1kRBBARrFo7S0lLYkKFf2Rs7eqTVsY70iam54f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ItrkDrDY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ItrkDrDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748774956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BfBKjlttcg3nh+GmuVdjWfmJaLtSoWbkOCvRrt0qU0s=;
	b=ItrkDrDYDmR1lUcju1T0ZoEwDHC0JsiPPlHo1Pk1MHcoif2uwY3xHWhbgXdgmEG+NJRp59
	0j9KKcRamqkwFNATUJE1e3UhHKagwr7h+u5W/nH1tBEoPDbr78Uo+iPwwfaBgAe0jAi+J1
	d+SyASu5M5vtEZeY4orJmym1ZQKqzUU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-KtRAwNh5OoqK_v68Syjg3Q-1; Sun, 01 Jun 2025 06:49:15 -0400
X-MC-Unique: KtRAwNh5OoqK_v68Syjg3Q-1
X-Mimecast-MFC-AGG-ID: KtRAwNh5OoqK_v68Syjg3Q_1748774955
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450dada0f83so13498435e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 03:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748774954; x=1749379754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfBKjlttcg3nh+GmuVdjWfmJaLtSoWbkOCvRrt0qU0s=;
        b=Mu9XgtrWpFDZR6Nx1X95RionsaepjrBiHqNA44LhkW15EmTEv1PYyrpjfKpGDzJw91
         No9NDPUJiFtlYV9bfHZDeMdwa0Jchuqken6YCPP2uFypZaNBIfMI98Ph8kCJjapRCO09
         Xs77XyB47kqp3c17x7pZrq5g6nwIgvdSg0x7AXHBEXDT2YmcYEKA0j1S06NOflppSFTI
         NCIdWUkOvuCALu9htmBYsHtqUKFSJyHl65UwklT1BEWvI02o4/Enx+e0BQbuO8lEr1BM
         pd3r2itWqv/rQ9uREVeCBEvXeyx0TBSTP+R62iMtXUev/zUtemJnPvyqKBjxR8wP5SDg
         w2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1GFNaHe0kTY6I/l2u4+2m/mlHNJ6hjuesLNNiHm61jdiA6kk6RKLGbVcPD+gHwNbILCxza97ntbt8ZXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dKkpGckXFbYG5pZFj8P0Fk6TWHDw+tj/s9s34LiAhI93X0Ge
	uDYr39RyEaWJxe4upSrNsFQwnywpYnqngGydlShZ3h3+1L23XkiE5uVp1JknKUvBCv5lNw0tsAY
	MzgmRl1LZmKscr/YFPw2n6Oa86WshoyFBOecjMrFsIvsIMv3GWxuWNLo9fBZHmzQnjQ==
X-Gm-Gg: ASbGncv+mg5g/Lvd9HficR1AgsT3ZbkdzQS6pAR5h1UYST/6Vf4bDNKpCnNWlhMCfHi
	1pEYrB9TvRRtmA339qhNmtn1xw0MbaIw6IMCWFsD0yLKaas1Yj2eSvwcoXo0GFjkVnmofVJUnjq
	+TEZk2BE60btt5hYZti1YNiTq9DHrPecBAEkH4+OR29LzzyW+BDNoJAsd9tavuYPkF40SIaUMWJ
	TqCM+O/iZGiXIKdTM3hf5xGb+zdYfc9fZOWJ+mk5sv+uBvfr2Ch7rpDEwL8V3qmKuk4R/2RyuGu
	v0WpCsm0KGZRcqjk
X-Received: by 2002:a05:600c:620a:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-4511ecc3cecmr34788965e9.13.1748774954541;
        Sun, 01 Jun 2025 03:49:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs/RMZHHq7bLSa1yD1M5+XQCeStRNeaN+YhhV20HUyM/fKkQFejJBYYJGV/3MZkgRfuJE0bA==
X-Received: by 2002:a05:600c:620a:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-4511ecc3cecmr34788845e9.13.1748774954061;
        Sun, 01 Jun 2025 03:49:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc24d7sm82044335e9.36.2025.06.01.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 03:49:13 -0700 (PDT)
Date: Sun, 1 Jun 2025 06:49:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH RESEND v10 3/3] vhost: Add new UAPI to select kthread
 mode and KConfig to enable this IOCTL
Message-ID: <20250601064429-mutt-send-email-mst@kernel.org>
References: <20250531095800.160043-1-lulu@redhat.com>
 <20250531095800.160043-4-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531095800.160043-4-lulu@redhat.com>

On Sat, May 31, 2025 at 05:57:28PM +0800, Cindy Lu wrote:
> This patch introduces a new UAPI that allows the vhost device to select
> in kthread mode. Userspace applications can utilize IOCTL
> VHOST_FORK_FROM_OWNER to select between task and kthread modes, which
> must be invoked before IOCTL VHOST_SET_OWNER, as the worker will be
> created during that call.
> 
> The VHOST_NEW_WORKER requires the inherit_owner setting to be true, and
> a check has been added to ensure proper configuration.
> 
> Additionally, a new KConfig option, CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL,
> is introduced to control the availability of the IOCTL
> VHOST_FORK_FROM_OWNER. When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set
> to n, the IOCTL is disabled, and any attempt to use it will result in a
> failure.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

I propose renaming
CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
to
CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL
and it should also control the presence of the module parameter
and a get ioctl (more on which below).

Otherwise we can get a situation where task mode is disabled and
there is no way for userspace to override or check.



> ---
>  drivers/vhost/Kconfig      | 13 +++++++++++++
>  drivers/vhost/vhost.c      | 30 +++++++++++++++++++++++++++++-
>  include/uapi/linux/vhost.h | 16 ++++++++++++++++
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 020d4fbb947c..300e474b60fd 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -96,3 +96,16 @@ config VHOST_CROSS_ENDIAN_LEGACY
>  	  If unsure, say "N".
>  
>  endif
> +
> +config VHOST_ENABLE_FORK_OWNER_IOCTL
> +	bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> +	default n
> +	help
> +	  This option enables the IOCTL VHOST_FORK_FROM_OWNER, allowing
> +	  userspace applications to modify the thread mode for vhost devices.
> +
> +	  By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to `n`,
> +	  which disables the IOCTL. When enabled (y), the IOCTL allows
> +	  users to set the mode as needed.
> +
> +	  If unsure, say "N".
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 2d2909be1bb2..cfa60dc438f9 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -1022,6 +1022,13 @@ long vhost_worker_ioctl(struct vhost_dev *dev, unsigned int ioctl,
>  	switch (ioctl) {
>  	/* dev worker ioctls */
>  	case VHOST_NEW_WORKER:
> +		/*
> +		 * vhost_tasks will account for worker threads under the parent's
> +		 * NPROC value but kthreads do not. To avoid userspace overflowing
> +		 * the system with worker threads inherit_owner must be true.
> +		 */
> +		if (!dev->inherit_owner)
> +			return -EFAULT;
>  		ret = vhost_new_worker(dev, &state);
>  		if (!ret && copy_to_user(argp, &state, sizeof(state)))
>  			ret = -EFAULT;
> @@ -1138,7 +1145,7 @@ void vhost_dev_reset_owner(struct vhost_dev *dev, struct vhost_iotlb *umem)
>  	int i;
>  
>  	vhost_dev_cleanup(dev);
> -
> +	dev->inherit_owner = inherit_owner_default;
>  	dev->umem = umem;
>  	/* We don't need VQ locks below since vhost_dev_cleanup makes sure
>  	 * VQs aren't running.
> @@ -2292,6 +2299,27 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
>  		goto done;
>  	}
>  
> +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> +	if (ioctl == VHOST_FORK_FROM_OWNER) {
> +		u8 inherit_owner;
> +		/*inherit_owner can only be modified before owner is set*/
> +		if (vhost_dev_has_owner(d)) {
> +			r = -EBUSY;
> +			goto done;
> +		}
> +		if (copy_from_user(&inherit_owner, argp, sizeof(u8))) {
> +			r = -EFAULT;
> +			goto done;
> +		}
> +		if (inherit_owner > 1) {
> +			r = -EINVAL;
> +			goto done;
> +		}
> +		d->inherit_owner = (bool)inherit_owner;
> +		r = 0;
> +		goto done;
> +	}
> +#endif
>  	/* You must be the owner to do anything else */
>  	r = vhost_dev_check_owner(d);
>  	if (r)
> diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> index d4b3e2ae1314..d2692c7ef450 100644
> --- a/include/uapi/linux/vhost.h
> +++ b/include/uapi/linux/vhost.h
> @@ -235,4 +235,20 @@
>   */
>  #define VHOST_VDPA_GET_VRING_SIZE	_IOWR(VHOST_VIRTIO, 0x82,	\
>  					      struct vhost_vring_state)
> +
> +/**
> + * VHOST_FORK_FROM_OWNER - Set the inherit_owner flag for the vhost device,
> + * This ioctl must called before VHOST_SET_OWNER.
> + *
> + * @param inherit_owner: An 8-bit value that determines the vhost thread mode
> + *
> + * When inherit_owner is set to 1(default value):
> + *   - Vhost will create tasks similar to processes forked from the owner,
> + *     inheriting all of the owner's attributes.
> + *
> + * When inherit_owner is set to 0:
> + *   - Vhost will create tasks as kernel thread.
> + */
> +#define VHOST_FORK_FROM_OWNER _IOW(VHOST_VIRTIO, 0x83, __u8)



Given default now depends on the module parameter, we should
have both GET and SET ioctls. All controlled by the kconfig knob.

> +
>  #endif
> -- 
> 2.45.0

