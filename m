Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FFA25A655
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356369; cv=none; b=ZpaYwySPXKS1RzSECBBs7VX9llXCGNOMUDeXqWjzzR0o5psEGwb/GxwuKoCUeQ3+N59FMTrlDgODQJr8ClpyhW0HrQmQcHF2xKftSdGC+11jn+wU+QrlCuAsJDAnwwcgR1Z1yUvsoQE/PepPI/iRRedsz8v12cXAznwNNE7WvfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356369; c=relaxed/simple;
	bh=iqtTO7BdgSOS0hugcE5p2vfRNGvtKPLOW4//tI8bFOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZELzmFzmQbkmfaFYDkH+VRj8mKQZfk3y2lxg24K6u6oMev7d32mPO2e+hbynq6N9g3gptevkdHI962tlc1juPppw4x6aWYAt3tAV+OswGut9sdgbZuHpeEEDvHYIM4L18A9Bsm2jaF1iJnoY3dG8Eg1JgKDxKezrYhVSdUcmVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Clj0XtqE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Clj0XtqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751356367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5W4qfJP5trIgKgYi+NpmwjcNUOZanDpnOGZEn8fp13E=;
	b=Clj0XtqE34PmdGzC1W2D7cdWD5jUL5Srr9XHtqpJ3JdpU1399kp3xVVv5kA4NsAU1VP3V9
	jGcfU76GM48LvMRDeyb3Df35FGGqURL9AmywFw5b0eOG3SIZ4xTP/utYFbQ0O/YeaGX0cU
	hyWaKb3XJrdqg+YqnMQhrEeJTO3Ih5Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-Fv9rWUr5PLqirjF3KDcgcQ-1; Tue, 01 Jul 2025 03:52:46 -0400
X-MC-Unique: Fv9rWUr5PLqirjF3KDcgcQ-1
X-Mimecast-MFC-AGG-ID: Fv9rWUr5PLqirjF3KDcgcQ_1751356365
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a58939191eso1015724f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356364; x=1751961164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W4qfJP5trIgKgYi+NpmwjcNUOZanDpnOGZEn8fp13E=;
        b=tdJRkpn87d2Q+xFs13pF/OIRztMmTqUUASGptxKvL2RVGMTAkC+EYmu8+MDwHzZm1x
         6gd+vKjdLa8VBxAHmIJ0ykiviponFA+xgmm4wF9QjNWli2r68OsH/lXTVWs/qYNCygbP
         zZHWairvB6jjqFBuHu/Y9QgWtRlBuPkBiDwOJH/MwlMMGTjBCkZHJZodGu7jWokOW6R4
         NnGBM7AHMqq2Cs3nf+BRdMBMXgcHKJruqHH3G+lLdnt5oeL4F/ClArydTaraR43vlVaJ
         6ub2L9Ou3Y4lbTsOA3k7kMSQVSCHnlADyvRjeKQVCy09Gdrapc13Tb2SUJjqKZhWVao0
         PJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/jklopkR7V+V8zwqPhrzDxBdYnnmSvo/e5FKSlsdB7FYQ3bN/IbXtF9CnkMuMaroqfXmlnJkTkDSmXes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt/RO9/rlUuWqXmt58i9GzrIWt2Uk8/PRtNPyGSN1uEm0nI1aC
	yeDRaICMiRI/GVqJU1+3KZhpI/YQojESw4NYMIZpJl2Lk3I1csFLJX/0ZoZ8D3+RskxZj+ER0Vm
	XBOtqVa4njWRNS8oJ0UovTfIqRBl3V7cnirmrS8AcdROfDdpuNf0tNgarRhSIXh02FXJZfn/q9A
	==
X-Gm-Gg: ASbGncs3QMxnSxRWF4QFQIA36Qdq/hdXyd5x0akwxs8J951AvhIkXMyxL/SGYg6pxOj
	nRYsAqKhZed3mmjlxFehUIf7W1iKSRuvS2KANHNwU9K1baXYqB3+AFxUeMhxNrQoDqAmm5om08T
	BsTG80ImN+bcWz/l44LKG76qndrxJyPlwLuW39ljKqo7Bm0nMwPVG3E8YGyTW35bhSgkKrrsSEO
	+lbu7qkCOLxh4q9lljijO5EoF3Ji/O/a0m9ey0FOmsk3W66WK1bZvIMmSh6kJjPTsNfsxuWys3o
	wHz98mjS/qDLoYDv
X-Received: by 2002:a05:6000:25ca:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a8f51c1a81mr12478143f8f.22.1751356364393;
        Tue, 01 Jul 2025 00:52:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXOoMiKZEJq6ceWK4Q10DrkD7JlKwDdbKrLj6V8anCMySNXNp0lfxDJ0dXtxq9+6g1HirIxw==
X-Received: by 2002:a05:6000:25ca:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a8f51c1a81mr12478113f8f.22.1751356363901;
        Tue, 01 Jul 2025 00:52:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a5asm12587008f8f.54.2025.07.01.00.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:52:43 -0700 (PDT)
Date: Tue, 1 Jul 2025 03:52:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zigit Zo <zuozhijie@bytedance.com>
Cc: jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH net] virtio-net: fix a rtnl_lock()
 deadlock during probing
Message-ID: <20250701035110-mutt-send-email-mst@kernel.org>
References: <20250630095109.214013-1-zuozhijie@bytedance.com>
 <20250630103240-mutt-send-email-mst@kernel.org>
 <20250630105328-mutt-send-email-mst@kernel.org>
 <f1f68fbd-e2cf-40c5-a6b8-533cb3ec798f@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1f68fbd-e2cf-40c5-a6b8-533cb3ec798f@bytedance.com>

On Tue, Jul 01, 2025 at 03:48:41PM +0800, Zigit Zo wrote:
> On 6/30/25 10:54 PM, Michael S. Tsirkin wrote:
> > On Mon, Jun 30, 2025 at 10:50:55AM -0400, Michael S. Tsirkin wrote:
> >> On Mon, Jun 30, 2025 at 05:51:09PM +0800, Zigit Zo wrote:
> >>> This bug happens if the VMM sends a VIRTIO_NET_S_ANNOUNCE request while
> >>> the virtio-net driver is still probing with rtnl_lock() hold, this will
> >>> cause a recursive mutex in netdev_notify_peers().
> >>>
> >>> Fix it by skip acking the annouce in virtnet_config_changed_work() when
> >>> probing. The annouce will still get done when ndo_open() enables the
> >>> virtio_config_driver_enable().
> >>
> >> I am not so sure it will be - while driver is not loaded, device does
> >> not have to send interrupts, and there's no rule I'm aware of that says
> >> we'll get one after DRIVER_OK.
> 
> Yep, at first we're thinking that when the VIRTIO_NET_S_ANNOUNCE flag set,
> we can always assure an interrupt has fired by VMM, to notify the driver
> to do the announcement.
> 
> But later we realized that the S_ANNOUNCE flag can be sent before the
> driver's probing, and for QEMU seems to set the status flag regardless of
> whether driver is ready, so the problem you're talking still may happens.
> >> How about, we instead just schedule the work to do it later?I'm not sure if scheduling the work later will break df28de7b0050, the work
> was being scheduled before that commit, and we have no much idea of why that
> commit removes the schedule_work, we just keep it for safe...

Well managing async things is always tricky. Direct call is safer.
If you reintroduce it, you need to audit all call paths for safely.


> Then, for plan A, we change the check_announce to schedule_announce, and if
> that's true, we do another schedule_work to call virtnet_config_changed_work
> again to finish the announcement, like
> 
> 	if (v & VIRTIO_NET_S_ANNOUNCE) {
> 		if (unlikely(schedule_announce))
> 			schedule_work(&vi->config_work);
> 		else {
> 			netdev_notify_peers(vi->dev);
> 			virtnet_ack_link_announce(vi);
> 		}
> 	}
> 
> >>
> >> Also, there is another bug here.
> >> If ndo_open did not run, we actually should not send any announcements.
> >>
> >> Do we care if carrier on is set on probe or on open?
> >> If not, let's just defer this to ndo_open?
> > 
> > Hmm yes I think we do, device is visible to userspace is it not?
> > 
> > Hmm.  We can keep the announce bit set in vi->status and on open, check
> > it and then schedule a work to do the announcement.
> 
> Okay, so there's a plan B, we save the bit and re-check it in ndo_open, like
> 
> 	/* __virtnet_config_changed_work() */
> 	if (v & VIRTIO_NET_S_ANNOUNCE) {
> 		vi->status |= VIRTIO_NET_S_ANNOUNCE;
> 		if (unlikely(!check_announce))
> 			goto check_link;
> 
> 		netdev_notify_peers(vi->dev);
> 		virtnet_ack_link_announce(vi);
> 		vi->status &= ~VIRTIO_NET_S_ANNOUNCE;
> 	}
> 
> 	/* virtnet_open() */
> 	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_STATUS)) {
> 		if (vi->status & VIRTIO_NET_S_LINK_UP)
> 			netif_carrier_on(vi->dev);
> 		if
> 		if (vi->status & VIRTIO_NET_S_ANNOUNCE)
> 			schedule_work(&vi->config_work);
> 		virtio_config_driver_enable(vi->vdev);
> 	}
> 
> This is a dirty demo, any ideas are welcomed :)
> 
> (I think in virtnet_open() we can make the S_LINK_UP being scheduled as well?)

