Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43F246BC9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562404; cv=none; b=Xl0rb3v99qlTMDVirBzskXD+zC4LeoznhwxXWMRkWqzyqE3huwsDOGn9FfOHiZe0NPOYnLdQTZlfsYmTOHFHsy0FLXNX64Vg0CvRaFfxBm0LR4yWQ5mIrVR1TnONYdwgNj4CFqbTpPKQCHLCIU58CDFGSh5iD7JlPnO0kD5IZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562404; c=relaxed/simple;
	bh=kBu2U59AaQV7icfovVyvlI2+b63QrLthVpms/gIWz2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeG+8qBFisNMzKGgTQrHctfx5rc+QBAIbjLuyhcAhccZWL3++2jxOPKINWLNdTf8rkcK34YHDBqk1EmA5NPs0VOGp89FGzrZnd4earcdIQ3XeTlwtGlMqPsOw4p4dhEduIIGV9mG18PfmTXHqqZXziJCJmGMvPOwHw6lsKqmO8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9LWYs6v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9LWYs6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749562398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AtqlHRGptORwtIvFn6KwxIkuSp1lm8xfaqwxzgijrrY=;
	b=E9LWYs6vyiyn0XxFFvQN1i0pJnFGqj7gzkfSr0OEoFtSClk4USq4J4H+VTTwfZAlcDuZWc
	ZpIEUTE4p68JAarFEhGzreFXUXY4KCwCNzE1Kap2cvApRKse6FN12TsAqmeLkXbTbiTHwM
	N2UR+z+A4kf43hkL8M6/RRUr5xfoVMs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-kK4ix4mDPEqhlMj_0fF01g-1; Tue, 10 Jun 2025 09:33:17 -0400
X-MC-Unique: kK4ix4mDPEqhlMj_0fF01g-1
X-Mimecast-MFC-AGG-ID: kK4ix4mDPEqhlMj_0fF01g_1749562396
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-adb33457610so508707366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562396; x=1750167196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtqlHRGptORwtIvFn6KwxIkuSp1lm8xfaqwxzgijrrY=;
        b=XfQdIuF6+E1Ve2dxjURxE7GJbcb0te9CtNMyXxEgpm0Ndp1WkPP2ASC9QdgGG8LJU6
         Vw0AteU0y893JKdETZwtuWMndBbN+W/fTP4UUDi2oVAKBRB1ut4TVRfO4i2Dx68FzIws
         Uy2k2UebiQGdNPd7lHNFwSM+p9ri8XB6am2uquzQNXu7vY0gbabKgeHuUXsacRjbnGJx
         fJ3UcaSXCog0UwMl7KuJwCGDbKvCDTMaQRHtJ9qPLZqB2VDaFyLiK5jkvkc98fupGRme
         nHv2LLu+weg5iAXWlIYy6uJNULPuy4rjMZWWl77ut9PkI+yXtwzbMkFQ0Z9KmdeQTRoh
         Sq8w==
X-Forwarded-Encrypted: i=1; AJvYcCWS44lr1dxQbgc+sFsxQDKXWcWgZqBYwjb6KZzJhLEbzkFJX9jGE0n2nsZX7FEm0C1vjPFRUreuE9qLfno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzidAskWFi+rMISUQx4bHQDrB9fLQBsjxHGyqfClEotYTB4P/BW
	f5MYVZ1DblbhBuZv+/N+OTYNV9xAQoZg1jg6WUBZM2UABy8bkyag82yEfufJlEy38m1DkrQDL0n
	fdWHCfxiWxu4pQTu6OwU8E2ymnjmtWTvPdgN2BgUrWarj9cSpUT6W3xxk58nYigtILg==
X-Gm-Gg: ASbGncsnoQ3MEvRB9UbkIXR+LI+CjR8JA4Tmwjp7xyUMTM7ZeF46Kk56dhEk/eHABNU
	aY9dGA8YUZBD94z8AqM7TFEg9dJncpp5NmwUT1jL+1oSfw+wL6gujOhBwCWy9GzNz9p2e7Cd6vL
	ypxyUUmJHLho7KYID1NLfHk7rIoY7o7F3A9P6u9KnWMSzB95ZaD+YJz90oIo1ZAc2bHkMNkdGM2
	Urz/YiqeY76Q7tlMn9NjFOXZFDddq1IQKN9co9p6RSrB8TxY8Qwq583E0wTFe9St8aI9fUsGZYX
	2XshnqX//P+rwf/BP3YVnbLLrXhJ
X-Received: by 2002:a17:907:3f89:b0:ade:4121:8d32 with SMTP id a640c23a62f3a-ade4121a383mr1222161666b.3.1749562395877;
        Tue, 10 Jun 2025 06:33:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbCYWNhgV43RFZfnzAeG7ctwgQxrUyNw/JhykbTR3vkEQZBONy5pO/0Uf1BHdqc/iqEcYmPw==
X-Received: by 2002:a17:907:3f89:b0:ade:4121:8d32 with SMTP id a640c23a62f3a-ade4121a383mr1222157766b.3.1749562395268;
        Tue, 10 Jun 2025 06:33:15 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b55bsm721616066b.160.2025.06.10.06.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:33:14 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:33:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] virtgpu: add virtio_gpu_fence_cleanup()
Message-ID: <4izeqsk6wgptwbk37qlbsp4fmxwgen6xyqqscrvgcejkoeh6nn@7g433deykx3x>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
 <20250505-virtgpu-queue-cleanup-v1-v1-2-810923da2b1e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-2-810923da2b1e@linaro.org>

On Mon, May 05, 2025 at 11:59:15AM +0300, Manos Pitsidianakis wrote:
>When virtio_gpu_remove() is called, there might be in-flight command
>objects in the virtqueues that the VIRTIO device hasn't processed. These
>commands might use fences, which end up being leaked, as reported by
>/sys/kernel/debug/kmemleak.
>
>This commit adds a cleanup function that lowers the reference count of
>all in-flight fences, resulting in their de-allocation.
>
>Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>---
> drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
> drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++++++++++
> drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 +
> 3 files changed, 14 insertions(+)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>index b3d367be6f204dbc98bf1c6e5c43a37ac8c0d8b3..c94b5edb2aec42fe5cd6416e243cf40e4e2b060f 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>@@ -465,6 +465,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> 			  struct virtio_gpu_fence *fence);
> void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
> 				    u64 fence_id);
>+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vdev);
>
> /* virtgpu_object.c */
> void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
>diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>index 44c1d8ef3c4d07881e2c4c92cc67f6aba7a5df4f..3e536d190c0464f4db8955605bbf0aa4aa3612bd 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>@@ -157,3 +157,15 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
> 	}
> 	spin_unlock_irqrestore(&drv->lock, irq_flags);
> }
>+
>+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vgdev)
>+{
>+	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
>+	struct virtio_gpu_fence *curr, *tmp;
>+
>+	list_for_each_entry_safe(curr, tmp, &drv->fences, node) {

I don't know this code, but I see that when we access `drv->fences` we 
hold `drv->lock`, should we do the same here? (or it isn't needed since 
we are in the cleaning phase?)

The rest LGTM!

Thanks,
Stefano


>+		dma_fence_signal_locked(&curr->f);
>+		list_del(&curr->node);
>+		dma_fence_put(&curr->f);
>+	}
>+}
>diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
>index da70d9248072b64786a5d48b71bccaa80b8aae8f..7b3c4d314f8eee692e2842a7056d6dc64936fc2f 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>@@ -286,6 +286,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
> 	flush_work(&vgdev->cursorq.dequeue_work);
> 	flush_work(&vgdev->config_changed_work);
> 	virtio_reset_device(vgdev->vdev);
>+	virtio_gpu_fence_cleanup(vgdev);
> 	virtio_gpu_queue_cleanup(vgdev);
> 	vgdev->vdev->config->del_vqs(vgdev->vdev);
> }
>
>-- 
>2.47.2
>
>

