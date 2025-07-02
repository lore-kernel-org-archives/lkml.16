Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1C253351
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476995; cv=none; b=CUmLrwBq3RZ7EveldIRTH8LqSfbXA/y6zE5ldSgG0lSS9P1zDjnOhyTU3vIV/vfMzHtAJFUqo7BCgWkwjBwgYjbGX/mzw2M8MrnPnxSi2A3rruLKK/jWX9J7ShiUKVTHg6Z6ZS1xrHJg9iKu1slHf1vMDg4vVs8erQ3y3Cz+DI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476995; c=relaxed/simple;
	bh=gL7SST8K/mdgik/v+gFevpjjdC4l4ZuDnfHeUyVmmQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tfhxi143nEwBbBcpcJONYaTpHyfBwCEHjD+S1jvj+g0oIYqvayEk1UWaT0o4lRcuSxWcNoEc1LLzOcSnxudnj7R+zxA6b97hxnQL6KPs8ui4JgiAq1XMZLX6YhkbDU833k3vAk5wS3+NwQy5tBAmHlfA33xSVqSehBnsXjXmYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Izahd7YJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Izahd7YJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751476991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=11pe78CaZdqy/tsNep3+p3swsBKo7kc1iN8l8E0ERew=;
	b=Izahd7YJsfkuJCah+KN3iBgkI4SN1RiWBUHvjkcO9ixOIydiyyNCz/cxVPyoUXi7DALryC
	7K78KXKoZL+Bci9YDl5yAMUyBa4z45iJ4E8kuf/eCf97e5chU2rNSgJeaP77wmmOVBxPRH
	DGVIz22qEqtIdATKyi/JQSV4+8qHhYU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-1o5MH7kgO-uvcei0UsCaTA-1; Wed, 02 Jul 2025 13:23:10 -0400
X-MC-Unique: 1o5MH7kgO-uvcei0UsCaTA-1
X-Mimecast-MFC-AGG-ID: 1o5MH7kgO-uvcei0UsCaTA_1751476989
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d5600a54so48510275e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476989; x=1752081789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11pe78CaZdqy/tsNep3+p3swsBKo7kc1iN8l8E0ERew=;
        b=ffHpP9XAm9tKrkjpIFfjyK484bT2pPLyQsBJE/aR1n9qPq49Kug5Sh87AUQTIdIKj9
         y5sqkBWhOeV+AyMQUYawjoKMBdR4pStd7RMm8UX0HPfWN+QFf6c0XoomPcwnPGRdeUQ8
         UnRvQLAvTiF6ZpfUw7W5dfq8yIISkIctDPpsGktsI0gB9UJH0Bs5TzBOGdx8+rKvUfzS
         aSELKu1KGvUKLjY4s+9Nn2lEjj63Y5sGXSRYArOgpgDi6f0kMPF+M5Z6VpSdlJCHk5pk
         D2uEtR19/05uMjD592V3BAKleWAoFA58ESS/GwlclQsK4oQlg3hVgRnF/A+A5aH+UBTD
         uS0A==
X-Gm-Message-State: AOJu0YyGfrPZg+RvUL4tjg81M0G3XOxw/CTk0zeELyx/g4lXnEoQ9jp/
	zxA7eJ5UXRQi/UmD8sUbeQcracsuFBMAp5HaCkSb7aROP7Ay0omLosy7rTuI41J1VaI7dMxe6qy
	D1b8X+usUeAlKjuFmEJ+Kpky3JcQmyjtfWxVg6sCDnEn2VaG7jG0vyDnix5tr/ThB7pwkfCIunG
	kKayq4DYjvtfWDZPDq2F6g1C/chP/D1zH0hyzuUjCSMRo=
X-Gm-Gg: ASbGncsN7rbK8L1UWoCE8PXN6GY248BdfnThZeSNHYKTQak+Z8ShedUFg0pK8yC2Tx2
	UY/Lzg3g+YtXxuuALCgtcDp8Xn7mo1V4XqwOxtZBNfkbN7LNq6/9e0GDO6UUUVDa5Ty+QOMAXWZ
	VdGDSe6tK1XhxGe1jx4Bi+WADAiHYgImXKziZsotHdIHYGATjFNzZ3p8cXqwS/GPMQouK7ayila
	hQW0QGubD9zIDrnru39P14hQZ+Cu/kTEUJySiMe351QDvsykZWfUAQlnjK6nsRtRLRyJ1WqbmQh
	i/IF5+MstfC92ZtG
X-Received: by 2002:a05:600c:3b01:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-454a3732ff3mr51541005e9.30.1751476988501;
        Wed, 02 Jul 2025 10:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXPMZRpw9jEVmWiCcSmC6H1AmgN1xNVj8w+71GoQ2QajqNgkg+w87lm1hr/qtaDXOW0/lV6g==
X-Received: by 2002:a05:600c:3b01:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-454a3732ff3mr51540535e9.30.1751476987872;
        Wed, 02 Jul 2025 10:23:07 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa8fasm16455680f8f.28.2025.07.02.10.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:23:07 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:23:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Subject: Re: [PATCH RFC v3] pci: report surprise removal event
Message-ID: <20250702132212-mutt-send-email-mst@kernel.org>
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
> 
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

