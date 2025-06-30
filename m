Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141A28C2DB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295062; cv=none; b=u8Ru8mZB+sBgUym5mBDhAjHEIjpZGbUTP0mxC9y/UqooGh14QpZFGbd05b3soCbl59yFyxLyS09k1Fp23Gvoh0IUWl29+rh9CfSJ//7VMFV4xLzSP6dDeSB/Kvad9jRkIy+aGshgZWd538ZO08Mvjr7oBWIAfxIqoNTd/LiONVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295062; c=relaxed/simple;
	bh=Q7H5Mae2lfyZ9olxXdhg244usOkP0rN8020MYLRd/AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8BBKmhK1cix2LpfaRRMOdYKoiIU4oN7yEuNFcnFlbjkKv1iu2CmN7TyPhl7Nd7lMwKCEkuJ+Lt77hjGiBwkjSCjI00Vgh6lntWJYtM7XIAGxw23VLHL5bbXKhPulo4hR69J9e1WWwY/r0vvMlEIih4K3Yt/b04wEsJC8GHT3Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CSxzbjT5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CSxzbjT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751295058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AO0WwxoEv5pQePQjGxtMRKG2m7KTBBV9bH1zDwVxzZE=;
	b=CSxzbjT5clEKmwaBg7P4CSRwOicZYBD/BENsMZXbvrCWKVqgthceFA1/jC/L74xSWp7wzB
	dxmmgeuJo1ni5o1SU6aqIX6dgugRiipMZamAT6yTy0lslWhAwh0aubC38z7lf1MOxohHuA
	0LD8EBGnZPlgY9nRiCM3ZByPl5ADlm0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Mm4b77lmN9CBfnt4EbYNfQ-1; Mon, 30 Jun 2025 10:50:57 -0400
X-MC-Unique: Mm4b77lmN9CBfnt4EbYNfQ-1
X-Mimecast-MFC-AGG-ID: Mm4b77lmN9CBfnt4EbYNfQ_1751295056
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb66d17be4so307728366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295056; x=1751899856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO0WwxoEv5pQePQjGxtMRKG2m7KTBBV9bH1zDwVxzZE=;
        b=ngOSyZtOCMfJu94QOTPPsIIVMeRgKbKdnsI0VBY115rPHzFhl3hTRn7nmmSyY793us
         tCGvOLTyGkeVgDHdgdM6Jlo+AXY9DwY/KvaLk6zsm+/43zWDxSP0JhbUkNHQ9zAzux0H
         yepmR4KWxNh6xrU0fZI0p9Cg8YyJyeVaG3Gsno92bZQ8SvWajH+KNrNfii3rClgohMFb
         S1jA32ct9DaW4RwjQ3LwKe2Y7IzjVBsaF4l+PnReJ05itEsGl7tBmWt/n6ZXuMsftIqv
         z/M6cc4f8v+Hb3dCvhOQIiVnVDrQkvnuHZV5WHmcRLTTGFIR7hLsQwwfs6Asvm2azeGo
         9uBg==
X-Forwarded-Encrypted: i=1; AJvYcCWmal2U3d1SzBmbmUGsdHEHux2cipPz8YDJQ2rfhbCW9K6WrlIGMiLCKkYa7C+4/6z855IymaOBUffaV5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIT+C3IP2EdZUSrDO2BmwST3bK12BVBMqR7X8E74vjNJXGsNZ9
	wQIQ4tgTlmZTKOaWCNVWiO9I2DTFSw8e7eM/RgVN0KmPOo6HD+bX/ptYMs4qAe2/R6jf+fax7yh
	eerWlSquuMkjLSkWqhxlniIrQRZMTkVMAj9JJYGcF61O5v+sGd++Lfy9obc54HB/MdQ==
X-Gm-Gg: ASbGnct1rEesRdi4ISklRrqnA2tlRV0EywgKJ+VgrgfGKbrqWww81b3QCsrTn/dOEX+
	D/Ajb7Ev8ZjadRuzgwIr7Nb+/oyA3usDa3GSifKTjw1rzOzu+nbyTL8fsRSADvnswbL6G37JVVB
	lNXKqSfU1JMUTXtQBcYpVTCkMKEjbIGltuMdxBBwSWP0EQE979KVlymEO68nPctVfRfg9xUWBbD
	FO7fkLZTqouhY9tD7QaaQ/wlNGkw8urdekw2zVSdMn/ZlnWquek18Sn4koq+UtNK5tHDAAk682u
	eC5mQBakK/E=
X-Received: by 2002:a17:907:9721:b0:ae0:c539:b89a with SMTP id a640c23a62f3a-ae34fd9a108mr1344305266b.19.1751295055903;
        Mon, 30 Jun 2025 07:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFilcEWZAtf/t0KvGdfF6PuE3xyw4eeo9DeGU4E65CUTPm13/SbEfKyhA0n6NQJnmwGy8DrnA==
X-Received: by 2002:a17:907:9721:b0:ae0:c539:b89a with SMTP id a640c23a62f3a-ae34fd9a108mr1344301366b.19.1751295055299;
        Mon, 30 Jun 2025 07:50:55 -0700 (PDT)
Received: from redhat.com ([31.187.78.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a0a8sm689409666b.71.2025.06.30.07.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:50:54 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:50:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zigit Zo <zuozhijie@bytedance.com>
Cc: jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] virtio-net: fix a rtnl_lock() deadlock during probing
Message-ID: <20250630103240-mutt-send-email-mst@kernel.org>
References: <20250630095109.214013-1-zuozhijie@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630095109.214013-1-zuozhijie@bytedance.com>

On Mon, Jun 30, 2025 at 05:51:09PM +0800, Zigit Zo wrote:
> This bug happens if the VMM sends a VIRTIO_NET_S_ANNOUNCE request while
> the virtio-net driver is still probing with rtnl_lock() hold, this will
> cause a recursive mutex in netdev_notify_peers().
> 
> Fix it by skip acking the annouce in virtnet_config_changed_work() when
> probing. The annouce will still get done when ndo_open() enables the
> virtio_config_driver_enable().

I am not so sure it will be - while driver is not loaded, device does
not have to send interrupts, and there's no rule I'm aware of that says
we'll get one after DRIVER_OK.

How about, we instead just schedule the work to do it later?


Also, there is another bug here.
If ndo_open did not run, we actually should not send any announcements.

Do we care if carrier on is set on probe or on open?
If not, let's just defer this to ndo_open?


> We've observed a softlockup with Ubuntu 24.04, and can be reproduced with
> QEMU sending the announce_self rapidly while booting.
> 
> [  494.167473] INFO: task swapper/0:1 blocked for more than 368 seconds.
> [  494.167667]       Not tainted 6.8.0-57-generic #59-Ubuntu
> [  494.167810] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  494.168015] task:swapper/0       state:D stack:0     pid:1     tgid:1     ppid:0      flags:0x00004000
> [  494.168260] Call Trace:
> [  494.168329]  <TASK>
> [  494.168389]  __schedule+0x27c/0x6b0
> [  494.168495]  schedule+0x33/0x110
> [  494.168585]  schedule_preempt_disabled+0x15/0x30
> [  494.168709]  __mutex_lock.constprop.0+0x42f/0x740
> [  494.168835]  __mutex_lock_slowpath+0x13/0x20
> [  494.168949]  mutex_lock+0x3c/0x50
> [  494.169039]  rtnl_lock+0x15/0x20
> [  494.169128]  netdev_notify_peers+0x12/0x30
> [  494.169240]  virtnet_config_changed_work+0x152/0x1a0
> [  494.169377]  virtnet_probe+0xa48/0xe00
> [  494.169484]  ? vp_get+0x4d/0x100
> [  494.169574]  virtio_dev_probe+0x1e9/0x310
> [  494.169682]  really_probe+0x1c7/0x410
> [  494.169783]  __driver_probe_device+0x8c/0x180
> [  494.169901]  driver_probe_device+0x24/0xd0
> [  494.170011]  __driver_attach+0x10b/0x210
> [  494.170117]  ? __pfx___driver_attach+0x10/0x10
> [  494.170237]  bus_for_each_dev+0x8d/0xf0
> [  494.170341]  driver_attach+0x1e/0x30
> [  494.170440]  bus_add_driver+0x14e/0x290
> [  494.170548]  driver_register+0x5e/0x130
> [  494.170651]  ? __pfx_virtio_net_driver_init+0x10/0x10
> [  494.170788]  register_virtio_driver+0x20/0x40
> [  494.170905]  virtio_net_driver_init+0x97/0xb0
> [  494.171022]  do_one_initcall+0x5e/0x340
> [  494.171128]  do_initcalls+0x107/0x230
> [  494.171228]  ? __pfx_kernel_init+0x10/0x10
> [  494.171340]  kernel_init_freeable+0x134/0x210
> [  494.171462]  kernel_init+0x1b/0x200
> [  494.171560]  ret_from_fork+0x47/0x70
> [  494.171659]  ? __pfx_kernel_init+0x10/0x10
> [  494.171769]  ret_from_fork_asm+0x1b/0x30
> [  494.171875]  </TASK>
> 
> Fixes: df28de7b0050 ("virtio-net: synchronize operstate with admin state on up/down")
> Signed-off-by: Zigit Zo <zuozhijie@bytedance.com>
> ---
>  drivers/net/virtio_net.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index e53ba600605a..0290d289ebee 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -6211,7 +6211,8 @@ static const struct net_device_ops virtnet_netdev = {
>  	.ndo_tx_timeout		= virtnet_tx_timeout,
>  };
>  
> -static void virtnet_config_changed_work(struct work_struct *work)
> +static void __virtnet_config_changed_work(struct work_struct *work,
> +					  bool check_announce)
>  {
>  	struct virtnet_info *vi =
>  		container_of(work, struct virtnet_info, config_work);

So this will be schedule_announce instead of check_announce?




> @@ -6221,7 +6222,7 @@ static void virtnet_config_changed_work(struct work_struct *work)
>  				 struct virtio_net_config, status, &v) < 0)
>  		return;
>  
> -	if (v & VIRTIO_NET_S_ANNOUNCE) {
> +	if (check_announce && (v & VIRTIO_NET_S_ANNOUNCE)) {
>  		netdev_notify_peers(vi->dev);
>  		virtnet_ack_link_announce(vi);
>  	}
> @@ -6244,6 +6245,11 @@ static void virtnet_config_changed_work(struct work_struct *work)
>  	}
>  }
>  
> +static void virtnet_config_changed_work(struct work_struct *work)
> +{
> +	__virtnet_config_changed_work(work, true);
> +}
> +
>  static void virtnet_config_changed(struct virtio_device *vdev)
>  {
>  	struct virtnet_info *vi = vdev->priv;
> @@ -7030,7 +7036,10 @@ static int virtnet_probe(struct virtio_device *vdev)
>  	   otherwise get link status from config. */
>  	netif_carrier_off(dev);
>  	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_STATUS)) {
> -		virtnet_config_changed_work(&vi->config_work);
> +		/* The check_annouce work will get scheduled when ndo_open()
> +		 * doing the virtio_config_driver_enable().
> +		 */
> +		__virtnet_config_changed_work(&vi->config_work, false);
>  	} else {
>  		vi->status = VIRTIO_NET_S_LINK_UP;
>  		virtnet_update_settings(vi);
> 
> base-commit: 2def09ead4ad5907988b655d1e1454003aaf8297
> -- 
> 2.49.0

