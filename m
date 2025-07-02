Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF9303DEF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477053; cv=none; b=kEExsI6NdmrADrip+G9Rtu8iqKgcQjJTJ+Dr5um9mzqvaCSJj9KHRoLkCKhN4MPKw7AzpXrtt2Ru87eOuFZ7tK3TfnjcdcQwdII4byIZgDQAaQ/RDjeb+nn5c6yu9MFaOuPAITJLLPvBwV3BhpH3ahYs4nLSFAErP7iZz+dX/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477053; c=relaxed/simple;
	bh=j6tSWM2MmtY5Snd+L4biN9q/QN5sydD46OZT01T8stI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3YQoeGK5vc+J9DfZM0rLPuDgUQC0mIleviIymt4rKj/tX4c62BT7yvk7kZe8orlPMWsCmbzcWRT9WG5KlYKrn3t85l/4bqroJsaWLZ3Y4KTvsa/h9SJCuYR300JLc/8pXlVNPMVBDwe4UFHC5eIZQlc39xRvKD7hv0Bt909uFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LL3ah2Qb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LL3ah2Qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751477050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c8KEZC8yTTm9+bnWl3UEjRdviwfr4vXyezEnpJMb554=;
	b=LL3ah2QbCTrEA4f0ykideJEtv8iv4ra86cTi1ZVhJ2jCNXnqLaBternZj/6rjoYY+T1i4u
	XHrJgz2I7FazTudYkGSXqGMMh7J8yiFR2+MjhnN7KHcT139LalQRN6GEMBhPtG6ED6bEae
	/y2j5KlflHx3UpHvxz6FS/N+n8NBfgE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-gItbovekNCigTZxyek7IUA-1; Wed, 02 Jul 2025 13:24:07 -0400
X-MC-Unique: gItbovekNCigTZxyek7IUA-1
X-Mimecast-MFC-AGG-ID: gItbovekNCigTZxyek7IUA_1751477046
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4538a2f4212so33993655e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477046; x=1752081846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8KEZC8yTTm9+bnWl3UEjRdviwfr4vXyezEnpJMb554=;
        b=Z44orGEZZJsfh1NXce2qnRs8M2mtI3e/y8qcWGmtwtq8JZ5/CY9SDRjoBTztwEpSul
         T6VUeyGC9ekiz5wxIH+S6c7qAYQUfOd/BrSlE+r5PqRg/x+5Q8RLU57/2mzhU/RkRMjg
         nvUjkn7p7HRIckY/GxOmrArAW6S3uI+hrszQ5v7QvEfizcRWR4JAkkg/ERtZuBZujm4a
         z/yvXyLIMdgWC3mojM5AzNFOvKuPYdZO5IxqsD5U8QMk309emsI55mtZ+6P+1W7YAdGI
         6tNSgsV4xUNfQ/szQ9M8O8n+AGTrFE3O+ISd/jzVCOaPKas0leL+g2BQrz+ldKxhwx0x
         OtBQ==
X-Gm-Message-State: AOJu0Yw+uk3KHJhhPFdDuvzQrGgM/VkMM7r4F2SOCzI3C5hXZaSeUxmF
	xjk78lzdZYiSaNUa1YE5nW28+q8yCe8x3jnN58Nx6R4UrTyg1cPfDFG6eJdQ/eYVXA73FvumDqn
	mA1Ra+pVM6tPQxpgkilopIrOfan3PdsiADbYRZXX6Kjz1U5G30xxG6BxzQtajuSz1p0KqmWCexW
	qDxAfX6WwAwmM7qbsq3cy5ht/IV3s7D2xrqgcezMoFz60=
X-Gm-Gg: ASbGnctk/25kJByMz4/7I24B338JOXsxFmnz6/38e9l8WVPkG3Q6iTl+h7UO9tZ+K+Q
	DFzPhExWZ2r3iaMdmRJC9wOek7axZVkU98riAsFEjkPECTDHUbiFRzAm82sIlnV7Eb/XHd/ac5K
	AEKZkCmTDNe74RcDLI6AuUhiHes7UJRJeG26pVM+w/rajYqdMlxEwOIRDPVe6THU8HnfhFNCOqF
	DfQ5rLhig0QKAkYKr9PpArmY7SC1PQxr5iQCVa51fvH7pkG4PeqIMAsdPyi3d8Df/G3OcIoJzJ+
	CBwAt6tI2nl7u2iM
X-Received: by 2002:a05:600c:3b01:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454a3706e45mr36329565e9.20.1751477046060;
        Wed, 02 Jul 2025 10:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFosKF1NCfMbIU3NzAVisdfjF4e5AD2s5+xgd8/X8JSTXHMAiyyyuhYZOoZYqj6SD4ZbEvIKA==
X-Received: by 2002:a05:600c:3b01:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454a3706e45mr36329185e9.20.1751477045515;
        Wed, 02 Jul 2025 10:24:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9972d83sm3773415e9.11.2025.07.02.10.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:24:05 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:24:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	stefanha@redhat.com, alok.a.tiwari@oracle.com,
	Parav Pandit <parav@nvidia.com>, virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3] pci: report surprise removal event
Message-ID: <20250702132314-mutt-send-email-mst@kernel.org>
References: <1eac13450ade12cc98b15c5864e5bcd57f9e9882.1751440755.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eac13450ade12cc98b15c5864e5bcd57f9e9882.1751440755.git.mst@redhat.com>

On Wed, Jul 02, 2025 at 03:20:52AM -0400, Michael S. Tsirkin wrote:
> At the moment, in case of a surprise removal, the regular remove
> callback is invoked, exclusively.  This works well, because mostly, the
> cleanup would be the same.
> 
> However, there's a race: imagine device removal was initiated by a user
> action, such as driver unbind, and it in turn initiated some cleanup and
> is now waiting for an interrupt from the device. If the device is now
> surprise-removed, that never arrives and the remove callback hangs
> forever.
> 
> For example, this was reported for virtio-blk:
> 
> 	1. the graceful removal is ongoing in the remove() callback, where disk
> 	   deletion del_gendisk() is ongoing, which waits for the requests +to
> 	   complete,
> 
> 	2. Now few requests are yet to complete, and surprise removal started.
> 
> 	At this point, virtio block driver will not get notified by the driver
> 	core layer, because it is likely serializing remove() happening by
> 	+user/driver unload and PCI hotplug driver-initiated device removal.  So
> 	vblk driver doesn't know that device is removed, block layer is waiting
> 	for requests completions to arrive which it never gets.  So
> 	del_gendisk() gets stuck.
> 
> Drivers can artificially add timeouts to handle that, but it can be
> flaky.
> 
> Instead, let's add a way for the driver to be notified about the
> disconnect. It can then do any necessary cleanup, knowing that the
> device is inactive.
> 
> Since cleanups can take a long time, this takes an approach
> of a work struct that the driver initiates and enables
> on probe, and tears down on remove.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 

Parav what do you think of this patch? This you can try
using this in virtio blk to address the hang you
reported?

> Compile tested only.
> 
> Note: this minimizes core code. I considered a more elaborate API
> that would be easier to use, but decided to be conservative until
> there are multiple users.
> 
> changes from v2
> 	v2 was corrupted, fat fingers :(
> 
> changes from v1:
>         switched to a WQ, with APIs to enable/disable
>         added motivation
> 
> 
>  drivers/pci/pci.h   |  6 ++++++
>  include/linux/pci.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index b81e99cd4b62..208b4cab534b 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -549,6 +549,12 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
>  	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
>  	pci_doe_disconnected(dev);
>  
> +	if (READ_ONCE(dev->disconnect_work_enable)) {
> +		/* Make sure work is up to date. */
> +		smp_rmb();
> +		schedule_work(&dev->disconnect_work);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 51e2bd6405cd..b2168c5d0679 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -550,6 +550,10 @@ struct pci_dev {
>  	/* These methods index pci_reset_fn_methods[] */
>  	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
>  
> +	/* Report disconnect events */
> +	u8 disconnect_work_enable;
> +	struct work_struct disconnect_work;
> +
>  #ifdef CONFIG_PCIE_TPH
>  	u16		tph_cap;	/* TPH capability offset */
>  	u8		tph_mode;	/* TPH mode */
> @@ -2657,6 +2661,29 @@ static inline bool pci_is_dev_assigned(struct pci_dev *pdev)
>  	return (pdev->dev_flags & PCI_DEV_FLAGS_ASSIGNED) == PCI_DEV_FLAGS_ASSIGNED;
>  }
>  
> +/*
> + * Caller must initialize @pdev->disconnect_work before invoking this.
> + * Caller also must check pci_device_is_present afterwards, since
> + * if device is already gone when this is called, work will not run.
> + */
> +static inline void pci_set_disconnect_work(struct pci_dev *pdev)
> +{
> +	/* Make sure WQ has been initialized already */
> +	smp_wmb();
> +
> +	WRITE_ONCE(pdev->disconnect_work_enable, 0x1);
> +}
> +
> +static inline void pci_clear_disconnect_work(struct pci_dev *pdev)
> +{
> +	WRITE_ONCE(pdev->disconnect_work_enable, 0x0);
> +
> +	/* Make sure to stop using work from now on. */
> +	smp_wmb();
> +
> +	cancel_work_sync(&pdev->disconnect_work);
> +}
> +
>  /**
>   * pci_ari_enabled - query ARI forwarding status
>   * @bus: the PCI bus
> -- 
> MST

