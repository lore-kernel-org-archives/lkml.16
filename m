Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553951F0E2D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749709881; cv=none; b=sTOgm9dQaGQENPF1wbQou5Y/ech8AJbuH4kNMeWPgDs8ncknWLZoQHNynZCzzcUrU/5OKG1X2D+sgCsfZXmpDlUGRFDLB9rAkGJwvxy384Rdm5XT01T9WLhiL/k9bfn+cTg7dea+VhoYeT7AokeKR9oFEYfdpIfohlNJNmMHnQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749709881; c=relaxed/simple;
	bh=uVP9puXoIew/Ys15nmcdCzBtIRCr9QIJfdWgIpcR6wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7+jUNSq5s2gt26dFwo2NyBeTG7dx9/CpULY0D5hwTC2xpfHJzOaWr/4T7c+RwBoBgqnOfIavhYSrA4WB2PWKfLCA2CJNCOHaXJJxl2I0lx8GZPyLe7k8Gg+UVsDSrum07vKpDWp6pfpJA1T4FGJ3yKHfSpqD68tWg+0tnxACNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PPWCls6E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PPWCls6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749709878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u3UuqHSkhoCWjsmKvKZgvB4q0ePA6YJ5VWAJGZfkLJg=;
	b=PPWCls6EuOVxzAFB+j1IZ0fPpQBEWlxXEAsN28azayMSpndqgg0AA5KX/XTH7fAPUJ6klc
	aNeDOp6+TCThUlSQlv6fEmVCd6P4FREx1g1VZi2cREvPid0KLWTjoT9zhlzw2BMkGUtqHl
	Gz+Mnb23TPTTuG/W+gW/qIxOoISEhh8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-lrylldFFMD6Ed-d0yrcXNQ-1; Thu, 12 Jun 2025 02:31:16 -0400
X-MC-Unique: lrylldFFMD6Ed-d0yrcXNQ-1
X-Mimecast-MFC-AGG-ID: lrylldFFMD6Ed-d0yrcXNQ_1749709875
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d50eacafso2968005e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749709875; x=1750314675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3UuqHSkhoCWjsmKvKZgvB4q0ePA6YJ5VWAJGZfkLJg=;
        b=unU1RZQMLWGpXaAsg4QgB/uf6wIFHtEUR5CXGiZ0YsbpYznBzH8704wnDUdnuikKFH
         oCuE6Vvkm2xg/Kb6yk+4KEmR8JsUz3xqEr0w1XgjBz7+Jab95raP2FjOpjb3eCsMIa8R
         eH73O8was+hBalHX4Hy770U3pHIFG/SQcOcd4SxKKfGboUjmk5kflRbW+us6GX+/whv9
         KMicaCHmO/GTM7Y8QjQ745ZK1Pd378GEPDCzaBjHjwPsOU+P2oRmPfpy9uUDhZlqsMQg
         j3cl8/plQDGk26MRaUXNcs48eBxADZD4/PQS6lFmlQClSsjGdxIvDi3k1Gk2S/S65JaV
         lvDA==
X-Forwarded-Encrypted: i=1; AJvYcCUDNQol25+FJB/nGtWvaHs9NQ1bh3ANXE2qKEb0n/B0hUZlWVh6zALAVtXMXA+YXi0yq88vHyD2vXGKK8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwSDF81TagI1FohGonzceOBPCeMYYCnKgIPliAkK9cWezpU56Z
	pAhDsGzmWRZ+oNJ65iAVFqeOAq18PFZKrKvS0B0RngPYKjt1gokHbmyH/Gdvr+bhCp8u5k920wR
	PfUfl6FCmMXBC+DrCK+FsahMSZ9L3wX4nTixG8aeVRWXSXug/YAgHWMdHYO3SuglWjA==
X-Gm-Gg: ASbGncvyp/jZz5AQ3B8UzXATmX+6TLs+8NGNxrnA5PbLm6fHEfs7xysft+mtdxJ0ReH
	xy8Asb7tkCCy85pCPO1Jwv3CIrRIRRKajM1+UB3i5d5VCmi6URAYhl/cH7sJUGjajFF3TP2PFUL
	5ODzr2uYBBRHn6uFR+5iFq23/gYDqRFcTkX7LvqXA/nnK68Mf/dWrDXjo7oC1h2tqpg81mWJ9xy
	YqwaHul/jbn498ZeTlqU4MqfAFeuDQajNY2Co8mAbJHNTgzUKQAB5Wc2OEiAovgimVQXUhGzOEA
	/aNJKNtdc93nOziY
X-Received: by 2002:a05:600c:4f06:b0:453:608:a18b with SMTP id 5b1f17b1804b1-4532b28d858mr24218465e9.9.1749709875305;
        Wed, 11 Jun 2025 23:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG42kNG+HqM89NPvBcNZFAzJ3Vn7GxaF9vIvrfn2F0Rh/ycFiYHni3pyzMMLUuiDLbmUb5Kuw==
X-Received: by 2002:a05:600c:4f06:b0:453:608:a18b with SMTP id 5b1f17b1804b1-4532b28d858mr24218175e9.9.1749709874848;
        Wed, 11 Jun 2025 23:31:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24155bsm10020445e9.17.2025.06.11.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 23:31:14 -0700 (PDT)
Date: Thu, 12 Jun 2025 02:31:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v11 3/3] vhost: Add configuration controls for vhost
 worker's mode
Message-ID: <20250612022053-mutt-send-email-mst@kernel.org>
References: <20250609073430.442159-1-lulu@redhat.com>
 <20250609073430.442159-4-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609073430.442159-4-lulu@redhat.com>

On Mon, Jun 09, 2025 at 03:33:09PM +0800, Cindy Lu wrote:
> This patch introduces functionality to control the vhost worker mode:
> 
> - Add two new IOCTLs:
>   * VHOST_SET_FORK_FROM_OWNER: Allows userspace to select between
>     task mode (fork_owner=1) and kthread mode (fork_owner=0)
>   * VHOST_GET_FORK_FROM_OWNER: Retrieves the current thread mode
>     setting
> 
> - Expose module parameter 'fork_from_owner_default' to allow system
>   administrators to configure the default mode for vhost workers
> 
> - Add KConfig option CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL to
>   control the availability of these IOCTLs and parameter, allowing
>   distributions to disable them if not needed
> 
> - The VHOST_NEW_WORKER functionality requires fork_owner to be set
>   to true, with validation added to ensure proper configuration
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>


getting there. yet something to improve.

> ---
>  drivers/vhost/Kconfig      | 17 +++++++++++++++
>  drivers/vhost/vhost.c      | 44 ++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/vhost.h | 25 ++++++++++++++++++++++
>  3 files changed, 86 insertions(+)
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 020d4fbb947c..49e1d9dc92b7 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -96,3 +96,20 @@ config VHOST_CROSS_ENDIAN_LEGACY
>  	  If unsure, say "N".
>  
>  endif
> +
> +config CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL
> +	bool "Enable CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL"
> +	default n
> +	help
> +	  This option enables two IOCTLs: VHOST_SET_FORK_FROM_OWNER and
> +	  VHOST_GET_FORK_FROM_OWNER. These allow userspace applications
> +	  to modify the vhost worker mode for vhost devices.
> +
> +	  Also expose module parameter 'fork_from_owner_default' to allow users
> +	  to configure the default mode for vhost workers.
> +
> +	  By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL` is set to `n`,
> +	  which disables the IOCTLs and parameter.
> +	  When enabled (y), users can change the worker thread mode as needed.
> +
> +	  If unsure, say "N".
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 37d3ed8be822..903d9c3f6784 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -43,6 +43,11 @@ module_param(max_iotlb_entries, int, 0444);
>  MODULE_PARM_DESC(max_iotlb_entries,
>  	"Maximum number of iotlb entries. (default: 2048)");
>  static bool fork_from_owner_default = true;

Add empty lines around ifdef to make it clear what code do they
delimit.


> +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL
> +module_param(fork_from_owner_default, bool, 0444);
> +MODULE_PARM_DESC(fork_from_owner_default,
> +		 "Set task mode as the default(default: Y)");
> +#endif
>  
>  enum {
>  	VHOST_MEMORY_F_LOG = 0x1,
> @@ -1019,6 +1024,13 @@ long vhost_worker_ioctl(struct vhost_dev *dev, unsigned int ioctl,
>  	switch (ioctl) {
>  	/* dev worker ioctls */
>  	case VHOST_NEW_WORKER:
> +		/*
> +		 * vhost_tasks will account for worker threads under the parent's
> +		 * NPROC value but kthreads do not. To avoid userspace overflowing
> +		 * the system with worker threads fork_owner must be true.
> +		 */
> +		if (!dev->fork_owner)
> +			return -EFAULT;

An empty line here would make the code clearer.

>  		ret = vhost_new_worker(dev, &state);
>  		if (!ret && copy_to_user(argp, &state, sizeof(state)))
>  			ret = -EFAULT;
> @@ -1136,6 +1148,7 @@ void vhost_dev_reset_owner(struct vhost_dev *dev, struct vhost_iotlb *umem)
>  
>  	vhost_dev_cleanup(dev);
>  
> +	dev->fork_owner = fork_from_owner_default;
>  	dev->umem = umem;
>  	/* We don't need VQ locks below since vhost_dev_cleanup makes sure
>  	 * VQs aren't running.
> @@ -2289,6 +2302,37 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
>  		goto done;
>  	}
>  
> +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL
> +	u8 fork_owner;

Do not declare variables in the middle of a scope please.
This one is not needed in this scope, so just move it down
to within if (yes you will repeat the declaration twice then).



> +
> +	if (ioctl == VHOST_SET_FORK_FROM_OWNER) {
> +		/*fork_owner can only be modified before owner is set*/

bad comment style.

> +		if (vhost_dev_has_owner(d)) {
> +			r = -EBUSY;
> +			goto done;
> +		}
> +		if (copy_from_user(&fork_owner, argp, sizeof(u8))) {

get_user is a better fit for this. In particular, typesafe.


> +			r = -EFAULT;
> +			goto done;
> +		}
> +		if (fork_owner > 1) {

so 0 and 1 are the only legal values?
maybe add an enum or defines in the header then.


> +			r = -EINVAL;
> +			goto done;
> +		}
> +		d->fork_owner = (bool)fork_owner;

		!!fork_owner is shorter and idiomatic.

> +		r = 0;
> +		goto done;
> +	}
> +	if (ioctl == VHOST_GET_FORK_FROM_OWNER) {
> +		fork_owner = d->fork_owner;
> +		if (copy_to_user(argp, &fork_owner, sizeof(u8))) {

put_user

> +			r = -EFAULT;
> +			goto done;
> +		}
> +		r = 0;
> +		goto done;
> +	}
> +#endif
>  	/* You must be the owner to do anything else */
>  	r = vhost_dev_check_owner(d);
>  	if (r)
> diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> index d4b3e2ae1314..e51d6a347607 100644
> --- a/include/uapi/linux/vhost.h
> +++ b/include/uapi/linux/vhost.h
> @@ -235,4 +235,29 @@
>   */
>  #define VHOST_VDPA_GET_VRING_SIZE	_IOWR(VHOST_VIRTIO, 0x82,	\
>  					      struct vhost_vring_state)
> +
> +/**
> + * VHOST_SET_FORK_FROM_OWNER - Set the fork_owner flag for the vhost device,
> + * This ioctl must called before VHOST_SET_OWNER.
> + * Only available when CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL=y
> + *
> + * @param fork_owner: An 8-bit value that determines the vhost thread mode
> + *
> + * When fork_owner is set to 1(default value):
> + *   - Vhost will create vhost worker as tasks forked from the owner,
> + *     inheriting all of the owner's attributes.
> + *
> + * When fork_owner is set to 0:
> + *   - Vhost will create vhost workers as kernel threads.
> + */
> +#define VHOST_SET_FORK_FROM_OWNER _IOW(VHOST_VIRTIO, 0x83, __u8)
> +
> +/**
> + * VHOST_GET_FORK_OWNER - Get the current fork_owner flag for the vhost device.
> + * Only available when CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL=y
> + *
> + * @return: An 8-bit value indicating the current thread mode.
> + */
> +#define VHOST_GET_FORK_FROM_OWNER _IOR(VHOST_VIRTIO, 0x84, __u8)
> +
>  #endif
> -- 
> 2.45.0

