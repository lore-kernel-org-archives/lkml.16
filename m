Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC62698AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113377; cv=none; b=jpzvsejeekA1sp4D+Ir56AseAGNVXGxTDmMvaVP42qTpIm0c3JYFdVDi7Z0AH9xB0s4AudVCBcIEfF04omTJTxoZ3Kf8qLHOXYbEjqgDkDN4FJVQvM9TcPCcnLctK0p4ysLiX2x2hQAqRqjq4o7r6DpZdAVU1IlZEOfcHbTE9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113377; c=relaxed/simple;
	bh=wYW1XvzQSniRNKIaNun7g4wBLkN0tc7NLsGQ8V1kHkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0oev8KWcLDh3jJgFsTXMveeU+oZalte9JeyfaFpH3rYPsD0lQQdZGRx4PGJmeTSvOcHBsk45r9L7pJi/tU7JWhEgP4/gLM7Cev8aEQW6Xnqa955KT2leCsBbiu5Tdtyujqkfk83WO1ETLYyN56s4Yhd2Mu6nSKa8cxDln+9nuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cI0jjt7G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cI0jjt7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744113374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c8NmMOJUiBDf2Mnm/32fYSinOOAarf9NGUqN9KbURsM=;
	b=cI0jjt7GnZo3QPB/VTHMSBmY35fOOh8PvlPuAFRlXJebQEP66LlHN4l1X8mUoYGxU2d2kf
	DPPfOOO9D1ME9JO7eeBE4+7ZgoxZfrd9OevZIzD1/7k3qguqv298Jo9fJsGFl2LP1XXwlI
	Lr3krpbAZ4g/Itsf889e9Y5MXnDLAq8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-cRx485ISNo-IAYabZQIOkA-1; Tue, 08 Apr 2025 07:56:13 -0400
X-MC-Unique: cRx485ISNo-IAYabZQIOkA-1
X-Mimecast-MFC-AGG-ID: cRx485ISNo-IAYabZQIOkA_1744113372
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fe32b08so2977096f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113372; x=1744718172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8NmMOJUiBDf2Mnm/32fYSinOOAarf9NGUqN9KbURsM=;
        b=UASjpAohqiWR0SG152ff9GCgN4srIfzutTJPvwJubFAMX7+jSMRRAfmdKtnFgM9cfS
         JXa7ykx0QBc52HSNDTWoMaOzrGi487j3iibUTbX/NcZTfEvy0AY3oHGuU3qaht2Ss7fi
         ZyCGOwQ5W78PkMHUwAYc04BoH7TthfNN2tBJ4C8GmY9Pd1Slr6Bro5nOaNUN5JChG8ZM
         TMvOsXmRSUq8+F8y2BdPu97dXUjrextj2aWqfKJs37Zte4CkpO1kWuFSNsxR3d1REyxd
         pmdJyNK1kFxSSUTic9PxHAqWFIq0bgtJ68p6HoZgly/bqUmd+v2f14Q7+jKKu2UI5nbv
         MqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9dV4A1wLqvOV5qQh2PQUolg8tocSJtVa420tO8DMm1AcDu2tQWjLohmXBZS5FGajYQsEmwTQCnPVSkKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJmU1tQ5oYlzx5RE3Jxszw04MwNitsps/dRrDgFkgnFt9V66h
	6k12fhv+1Dymnqmin4qMhCT+c2LCeY5ltfxWoGgF5eN1WbAf7eriOVravWqWbTFDzl2nBFNNfZX
	C3potpgpeOaIpi6JjW8b0GZ/PS5SLIyBVKch6mQwHw0psJoX/b4UnXKA2XLz5Dg==
X-Gm-Gg: ASbGncuTrjLh6uMIpkdbnqvhjyuXW7uuIoInYkrxW8dUKeqC7EM5+8rGNbOWes+3MGD
	Cbdt+ETjEq85XCYMSZ4dZND/R0ern4kBUITWYJYo7ybTM6rybH4CF22XRtm9vZNNA+LEG/aG2qb
	5ny5P9Z8Rx5Bewkzknelui6kNA6JFMRaXX8zFyCvDfF/C06LoIHhtUh2MRnYf2XxuV6hlV3bm72
	dTHH0hgl1afbXPS8v9QqG4a56SO4n/ITdgncm8Z63k45LvwJu43bfBMic+k6D4Mmo15ZBeTqLyL
	PPtZ3fcsMw==
X-Received: by 2002:a05:6000:2484:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-39d6fc0c110mr8562981f8f.4.1744113371956;
        Tue, 08 Apr 2025 04:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcMsSZ5Gam/fQOpaIuoaRMdI4T7XugacA1lPSXA8mE0sG1MgVGLtGvlHpdN41g6650CZaIhQ==
X-Received: by 2002:a05:6000:2484:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-39d6fc0c110mr8562957f8f.4.1744113371519;
        Tue, 08 Apr 2025 04:56:11 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9da1sm14440447f8f.22.2025.04.08.04.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:56:10 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:56:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v8 8/8] vhost: Add a KConfig knob to enable IOCTL
 VHOST_FORK_FROM_OWNER
Message-ID: <20250408075426-mutt-send-email-mst@kernel.org>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-9-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328100359.1306072-9-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:52PM +0800, Cindy Lu wrote:
> Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> is disabled, and any attempt to use it will result in failure.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  drivers/vhost/Kconfig | 15 +++++++++++++++
>  drivers/vhost/vhost.c |  3 +++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index b455d9ab6f3d..e5b9dcbf31b6 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -95,3 +95,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
>  	  If unsure, say "N".
>  
>  endif
> +
> +config VHOST_ENABLE_FORK_OWNER_IOCTL
> +	bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> +	default n
> +	help
> +	  This option enables the IOCTL VHOST_FORK_FROM_OWNER, which allows
> +	  userspace applications to modify the thread mode for vhost devices.

ok

> +          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to `n`,
> +          meaning the ioctl is disabled and any operation using this ioctl
> +          will fail.
> +          When the configuration is enabled (y), the ioctl becomes
> +          available, allowing users to set the mode if needed.

no need to be so verbose - the disabled beavious belongs in commit log
not here.

Also either ioctl or IOCTL but not both.

> +
> +	  If unsure, say "N".
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index fb0c7fb43f78..568e43cb54a9 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
>  		r = vhost_dev_set_owner(d);
>  		goto done;
>  	}
> +
> +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
>  	if (ioctl == VHOST_FORK_FROM_OWNER) {
>  		u8 inherit_owner;
>  		/*inherit_owner can only be modified before owner is set*/
> @@ -2313,6 +2315,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
>  		r = 0;
>  		goto done;
>  	}
> +#endif
>  	/* You must be the owner to do anything else */
>  	r = vhost_dev_check_owner(d);
>  	if (r)
> -- 
> 2.45.0

