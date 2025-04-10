Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F2215184
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276969; cv=none; b=Gs8wgrvyGFJYMBfK5mLG1XZFqtNudo+jY/DBMnEAUqcBAJdZbiGRjYdMaL9roGyy9x+iJlc+7gkd8yzuAyIA16AUEDND0xd9TOGGTOo7GkUDEtXfYT3ZH6rTmMFQvccSCqCSPjdYwFlIw+ZN88TevSER0/KdQWCAb8hw3+G2x08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276969; c=relaxed/simple;
	bh=54OMzejBPoW7JG4ClqA1jmxyNyeWRl8XnFn+eqxMH1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0QjMh0YVPCWYuDTJEm61ct3TVduPm+3Q+MorQ8V4UIM4sF+8vvp1577tIrjHRMwDttWIy6A3Cpr36dmz52REIujVRHZyfO4C+uDw3Lt8ltNv1ZNaFcAnpywNMeMb2Tmk06aFqdz46bZzhqeOKRCd19HlCBYzX4iHX7SxBvfJ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TOcQHAoa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TOcQHAoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744276965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3G2dA/uh7y81gqcecMrUlskMZ6C+yBGFXBGfQTVR2W8=;
	b=TOcQHAoa0z+amQuU2wH9rkMVIwJBDhqbdfX5aSxGyTv7cHbvqDDfSimLe1dlUobCpTG6BB
	Xp9Cy44t/DfjQaSm1+ps0eK2BbLCGZuIjJkuU4YlHtd6CgbZYeGnx+bp6OWdk0lPoY/QUB
	FaBw8zymxw/XWfoOw/JRWFRTmvQBakU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-OvscgYb2Nq-Z5C0vf8WatA-1; Thu, 10 Apr 2025 05:22:44 -0400
X-MC-Unique: OvscgYb2Nq-Z5C0vf8WatA-1
X-Mimecast-MFC-AGG-ID: OvscgYb2Nq-Z5C0vf8WatA_1744276963
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912b54611dso286603f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276963; x=1744881763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3G2dA/uh7y81gqcecMrUlskMZ6C+yBGFXBGfQTVR2W8=;
        b=NoeXLl6epAx2HM0LBNNMbB8mPhUPTIAw+yu0kd0jGJZm5k1w2Rnm7u+rt6r5QUwZUF
         iNu3bOoTTcxe3w9UOea+FXOjWeE/5hpkqmZuSR+SVK/2ip9T1qL9PnWpDqQfQzCJi67j
         oiv/3nyew8ONOfUX6sL+eUHHan/uLgya9tzQ20bmUGrYwwAdlOfQncQnAibYLsITK7sc
         IVDq8gAajGoGHRCIeGe+zOBgRO3jxZeotzxhfci2RxziIxDerGXRmIV5Bwxw5aaRIQG+
         bBEa6ERNniWTZS/Ei1GbKA0feKTCm4e0oEUd0qr06SWtwl/iC9Llr8DtDxrQSkirLex3
         Z/1g==
X-Forwarded-Encrypted: i=1; AJvYcCWnCYXWJALAjrFvHEYcuqJamufsptxMaTnqBOBVqHDj/XygZyP3jaL87+Y7dElYO/S0xLK3KVpI200vSBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YydwdCzU3yyqJ6q2hAV/qH65cw2c/q29AoIUO8nd1PvYXr8DUXl
	uBIYCf5GqEudmL3HjxLRFggTMf4ZEZERs3Eg5pImCZKACRobppmM1PYhFezADJRb5zDM0wmLOHb
	MV0Sttvtt7arTZMrPHEN39LM/hSNNGQw9R97G/WfB3/GMNNz1vFkRzx7u5j6VYg==
X-Gm-Gg: ASbGnctO3SEgCe47ybkj/OBsdA7ngv47AwTuc4Y5WnqzEfsPQKKf2bDmzkfbMqIkRx9
	eIRfClKLk3m4eMZxMjT4z/MAJEiyI7tYD/P3hPA1v4AWq/1+WEMxfnDRgxZd3ljTCrbOfpvrKyG
	7jx6GZAAXZDXw0co+GHpKlieFXesFOAFAcLogkp1RumwguXmOj/tDZ/csomVb/Zj+He5EXHwinZ
	uJhfHwGACybIBLRwcwOEWFfn8IFJoGcbUVdpHkCTFWe5VNgK0FD6dnUIu7ko0XjtjjTVKSOGvin
	dG5N+PeoZx7xr1hfKMzqLmiB7jDoGJr5aQSVZKbKaT+O6NtBJPzU4g==
X-Received: by 2002:adf:b641:0:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-39d8fddf9cbmr1084636f8f.43.1744276963077;
        Thu, 10 Apr 2025 02:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3A4N/y2Xwm9C2hhIG46pgbuWM+iB7GhYucAHMLdNuEQ5EK13MQnN0EGjvgGsRE7YUym+Ksw==
X-Received: by 2002:adf:b641:0:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-39d8fddf9cbmr1084610f8f.43.1744276962538;
        Thu, 10 Apr 2025 02:22:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20901c58sm30744735e9.0.2025.04.10.02.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:22:41 -0700 (PDT)
Message-ID: <1beb29e4-0f11-4ed7-8096-436e0ac74679@redhat.com>
Date: Thu, 10 Apr 2025 11:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] virtgpu: don't reset on shutdown
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
References: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Michael,

On 4/10/25 9:16 AM, Michael S. Tsirkin wrote:
> It looks like GPUs are used by panic after shutdown is invoked.
> Thus, breaking virtio gpu in the shutdown callback is not a good idea -
> guest hangs attempting to flush out the panics, with this warnings:
> 
> [   20.504464] WARNING: CPU: 0 PID: 568 at drivers/gpu/drm/virtio/virtgpu_vq.c:358 virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.505685] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink vfat fat intel_rapl_msr intel_rapl_common intel_uncore_frequency_common nfit libnvdimm kvm_intel kvm rapl iTCO_wdt iTCO_vendor_support virtio_gpu virtio_dma_buf pcspkr drm_shmem_helper i2c_i801 drm_kms_helper lpc_ich i2c_smbus virtio_balloon joydev drm fuse xfs libcrc32c ahci libahci crct10dif_pclmul crc32_pclmul crc32c_intel libata virtio_net ghash_clmulni_intel net_failover virtio_blk failover serio_raw dm_mirror dm_region_hash dm_log dm_mod
> [   20.511847] CPU: 0 PID: 568 Comm: kworker/0:3 Kdump: loaded Tainted: G        W         -------  ---  5.14.0-578.6675_1757216455.el9.x86_64 #1
> [   20.513157] Hardware name: Red Hat KVM/RHEL, BIOS edk2-20241117-3.el9 11/17/2024
> [   20.513918] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> [   20.514626] RIP: 0010:virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.515332] Code: 00 00 48 85 c0 74 0c 48 8b 78 08 48 89 ee e8 51 50 00 00 65 ff 0d 42 e3 74 3f 0f 85 69 ff ff ff 0f 1f 44 00 00 e9 5f ff ff ff <0f> 0b e9 3f ff ff ff 48 83 3c 24 00 74 0e 49 8b 7f 40 48 85 ff 74
> [   20.517272] RSP: 0018:ff34f0a8c0787ad8 EFLAGS: 00010282
> [   20.517820] RAX: 00000000fffffffb RBX: 0000000000000000 RCX: 0000000000000820
> [   20.518565] RDX: 0000000000000000 RSI: ff34f0a8c0787be0 RDI: ff218bef03a26300
> [   20.519308] RBP: ff218bef03a26300 R08: 0000000000000001 R09: ff218bef07224360
> [   20.520059] R10: 0000000000008dc0 R11: 0000000000000002 R12: ff218bef02630028
> [   20.520806] R13: ff218bef0263fb48 R14: ff218bef00cb8000 R15: ff218bef07224360
> [   20.521555] FS:  0000000000000000(0000) GS:ff218bef7ba00000(0000) knlGS:0000000000000000
> [   20.522397] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.522996] CR2: 000055ac4f7871c0 CR3: 000000010b9f2002 CR4: 0000000000771ef0
> [   20.523740] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   20.524477] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
> [   20.525223] PKRU: 55555554
> [   20.525515] Call Trace:
> [   20.525777]  <TASK>
> [   20.526003]  ? show_trace_log_lvl+0x1c4/0x2df
> [   20.526464]  ? show_trace_log_lvl+0x1c4/0x2df
> [   20.526925]  ? virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
> [   20.527643]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.528282]  ? __warn+0x7e/0xd0
> [   20.528621]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.529256]  ? report_bug+0x100/0x140
> [   20.529643]  ? handle_bug+0x3c/0x70
> [   20.530010]  ? exc_invalid_op+0x14/0x70
> [   20.530421]  ? asm_exc_invalid_op+0x16/0x20
> [   20.530862]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.531506]  ? virtio_gpu_queue_ctrl_sgs+0x174/0x290 [virtio_gpu]
> [   20.532148]  virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
> [   20.532843]  virtio_gpu_primary_plane_update+0x3e2/0x460 [virtio_gpu]
> [   20.533520]  drm_atomic_helper_commit_planes+0x108/0x320 [drm_kms_helper]
> [   20.534233]  drm_atomic_helper_commit_tail+0x45/0x80 [drm_kms_helper]
> [   20.534914]  commit_tail+0xd2/0x130 [drm_kms_helper]
> [   20.535446]  drm_atomic_helper_commit+0x11b/0x140 [drm_kms_helper]
> [   20.536097]  drm_atomic_commit+0xa4/0xe0 [drm]
> [   20.536588]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [   20.537162]  drm_atomic_helper_dirtyfb+0x192/0x270 [drm_kms_helper]
> [   20.537823]  drm_fbdev_shmem_helper_fb_dirty+0x43/0xa0 [drm_shmem_helper]
> [   20.538536]  drm_fb_helper_damage_work+0x87/0x160 [drm_kms_helper]
> [   20.539188]  process_one_work+0x194/0x380
> [   20.539612]  worker_thread+0x2fe/0x410
> [   20.540007]  ? __pfx_worker_thread+0x10/0x10
> [   20.540456]  kthread+0xdd/0x100
> [   20.540791]  ? __pfx_kthread+0x10/0x10
> [   20.541190]  ret_from_fork+0x29/0x50
> [   20.541566]  </TASK>
> [   20.541802] ---[ end trace 0000000000000000 ]--- 
> 
> The warning is from here:
> 
> /* For drm_panic */
> static int virtio_gpu_panic_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>                                            struct virtio_gpu_vbuffer *vbuf,
>                                            int elemcnt,
>                                            struct scatterlist **sgs,
>                                            int outcnt,
>                                            int incnt)
> {
>         struct virtqueue *vq = vgdev->ctrlq.vq;
>         int ret;
> 
>         if (vgdev->has_indirect)
>                 elemcnt = 1;
> 
>         if (vq->num_free < elemcnt)
>                 return -ENOMEM;
> 
>         ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
>         WARN_ON(ret);
> 
>         vbuf->seqno = ++vgdev->ctrlq.seqno;
>         trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
> 
>         atomic_inc(&vgdev->pending_commands);
> 
>         return 0;
> }
> 
> 
> Add an option for drivers to bypass the common break+reset handling.
> As DRM is careful to flush/synchronize outstanding buffers, it looks like
> GPU can just have a NOP there.
> 
> Fixes: 8bd2fa086a04 ("virtio: break and reset virtio devices on device_shutdown()")
> Cc: Eric Auger <eauger@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

This fixes the guest WARN_ON()/hangs for me.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
> 
> Can someone who knows more about DRM and shutdown please tell me if this
> is a good idea?  Posting for testing and early feedback, completely
> untested.
> 
> 
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 9 +++++++++
>  drivers/virtio/virtio.c              | 6 ++++++
>  include/linux/virtio.h               | 3 +++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 2d88e390feb4..210464146a9c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -128,6 +128,14 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  	drm_dev_put(dev);
>  }
>  
> +static void virtio_gpu_shutdown(struct virtio_device *vdev)
> +{
> +	/*
> +	 * GPU is used by drm panic after shutdown.
> +	 * Do nothing here, opt out of device reset.
> +	 */
> +}
> +
>  static void virtio_gpu_config_changed(struct virtio_device *vdev)
>  {
>  	struct drm_device *dev = vdev->priv;
> @@ -162,6 +170,7 @@ static struct virtio_driver virtio_gpu_driver = {
>  	.id_table = id_table,
>  	.probe = virtio_gpu_probe,
>  	.remove = virtio_gpu_remove,
> +	.shutdown = virtio_gpu_shutdown,
>  	.config_changed = virtio_gpu_config_changed
>  };
>  
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 150753c3b578..95d5d7993e5b 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -407,6 +407,12 @@ static void virtio_dev_shutdown(struct device *_d)
>  	if (!drv)
>  		return;
>  
> +	/* If the driver has its own shutdown method, use that. */
> +	if (drv->shutdown) {
> +		drv->shutdown(dev);
> +		return;
> +	}
> +
>  	/*
>  	 * Some devices get wedged if you kick them after they are
>  	 * reset. Mark all vqs as broken to make sure we don't.
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index 4d16c13d0df5..64cb4b04be7a 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -220,6 +220,8 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
>   *    occurs.
>   * @reset_done: optional function to call after transport specific reset
>   *    operation has finished.
> + * @shutdown: synchronize with the device on shutdown. If provided, replaces
> + *    the virtio core implementation.
>   */
>  struct virtio_driver {
>  	struct device_driver driver;
> @@ -237,6 +239,7 @@ struct virtio_driver {
>  	int (*restore)(struct virtio_device *dev);
>  	int (*reset_prepare)(struct virtio_device *dev);
>  	int (*reset_done)(struct virtio_device *dev);
> +	void (*shutdown)(struct virtio_device *dev);
>  };
>  
>  #define drv_to_virtio(__drv)	container_of_const(__drv, struct virtio_driver, driver)

