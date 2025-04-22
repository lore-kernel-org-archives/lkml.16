Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007227C875
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340554; cv=none; b=IzjMLrAdTmDv8Ck8Gwt8we3fqLxnbcBUzOnvdX883W0K8WpS+hpDTmVHsxURWzy6RAp+yashtXAk3rbMrAeYnfBo14LXoxbZFRroQ0RVl5vnlEbECb2FZ+dyKoXi/foirbMmAV1zlHsqjWj4w+omjpkhgF7W9nIlk+dO9iC1X/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340554; c=relaxed/simple;
	bh=OnwSNDn64S8aCsL+BPdxyk1KPcCrvENt7q1PLD17rCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ny1QtYl4FP5/0U+EE3rinaAgblel4hXy4hbfhy59vRMjtAzQzVq/9Mwh+yJd1Z1yg06x4IOcBWYpSNcKtNEWt2PbyWswJqJrx4/bkCZNs5RBDTQ5gmJ9V+jKDdRKvZ+dNF0p2w2BQd1/7rVKSGfxTip/dNNcvzOKqzHXWRiVAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZD6OZhB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZD6OZhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745340551;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrsd/3p7dvdW/2Y1idz3MOxsrZjO4oXnRPdIb4aDyus=;
	b=FZD6OZhB6PUKbnyJ8Sx/oQhiW4OJcg0RhWK3eQOao1iVUbGsj2hVgcoshj0ExRBOUNM5iQ
	ocBZ58GRZNSXSnXhTamL2hhEF+769icgcV+0CPAPSxIkwKBvUpLiRfTaleagwe3H2UdDD9
	NjnakHJ+x/5cjMoZJh+i49IaaqJo2co=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-JQL8dQJKMAaCpkBTRa1VYg-1; Tue, 22 Apr 2025 12:49:09 -0400
X-MC-Unique: JQL8dQJKMAaCpkBTRa1VYg-1
X-Mimecast-MFC-AGG-ID: JQL8dQJKMAaCpkBTRa1VYg_1745340548
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43f405810b4so30110755e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340548; x=1745945348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrsd/3p7dvdW/2Y1idz3MOxsrZjO4oXnRPdIb4aDyus=;
        b=j++ulQDYdLee8+pfNTRd+cPedhfEb7UET7Ajjaa4+guSCRa+SixOVyX26lYUgkoJCN
         W5J1x2EAH3sKplmTZAzYUm5nowo4WWGZqfU5snKmd2eO8VmbSO7ax6qmEFZQnERVwtz5
         b8zz+WUynDS5lyne/N3+w37h9OI06Ig8/VrTzb/VFk85JhrG+m/p5iWZamPTtHQWTHWH
         lDN/Jj8k82GJ8r2llYrpOloLRtyrlT7ozE2QOd/SgP5rg8SSftd54JXJ7CWdN2/hmGhi
         qAgp+SdjoveJ3ECyFlII6cg700X94PcwG+LXjXmY/JF6jYPUbuDfyFwHRh2+5ebmOcbj
         NOmg==
X-Gm-Message-State: AOJu0YzzjIJPSjXSHgk8PK5s+dZlE/nW9ZaU3D4ppMAhNqu0rnu469/C
	QGRifBp538oCV75tS82XQqQMFblHN84vr7qhaVMYdUQvWN563cWGC5m/3c9bOXShdPTMUEishTf
	GU3jYuxtDPE210cbKWzqgp27Ox3WIB2//lzyJpYmqgxdGgE3rRrTlIA+i226avg==
X-Gm-Gg: ASbGncsGfzHE5E4vj+N6dNtsWnqY3PFTCWhmYLSBV23ZrTihC7RQcLsyjfbqm7ITC84
	0yRfeTL476lqpjMjVXij26IMg3Uo2ndD3pz4nshYjMtMQuesTf3Wr5ca3CNo8JGJRc5dJ9o62LU
	9amF691I6vzBEjS7YYSIDY9fDmTOSJTVlMIwA7rOjEokfRLXRYFHg4GF/Wc5Okwpp8afo4cvb5u
	dpLK0fV/YUQrfV0AkHMXD/tRBFv6z4WRBqOcWjSnlEoGqmhrJ996UDN1R59fHHya8ERe5qCReng
	GYA+Qmi2JJto4kU2UYKQJpyjiWNVbH8z4AHl2aWHKH/PWunu9dhyWghu4bc=
X-Received: by 2002:a05:600c:1906:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-4406ac11581mr132427895e9.33.1745340548367;
        Tue, 22 Apr 2025 09:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL0BTg1501d7TjC/8u5Gc8ZzZQofR/EdbhGN5AMF4Ozt8Ub8BwgAm98X6mqgEsGUZkPjE5Lw==
X-Received: by 2002:a05:600c:1906:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-4406ac11581mr132427685e9.33.1745340547956;
        Tue, 22 Apr 2025 09:49:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5ace47sm178502985e9.15.2025.04.22.09.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:49:07 -0700 (PDT)
Message-ID: <5aede4c4-5dfd-4ec1-9fd8-a5d6700678bd@redhat.com>
Date: Tue, 22 Apr 2025 18:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2] virtgpu: don't reset on shutdown
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Eric Auger <eauger@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
References: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
 <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
 <20250415095922-mutt-send-email-mst@kernel.org>
 <lgizdflxcku5ew2en55ux3r72u37d6aycuoosn5i5a5wagz6sc@d2kha7ycmmpy>
Content-Language: en-US
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <lgizdflxcku5ew2en55ux3r72u37d6aycuoosn5i5a5wagz6sc@d2kha7ycmmpy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gerd, Michael,

On 4/16/25 3:57 PM, Gerd Hoffmann wrote:
> On Tue, Apr 15, 2025 at 10:00:48AM -0400, Michael S. Tsirkin wrote:
>> On Tue, Apr 15, 2025 at 01:16:32PM +0200, Gerd Hoffmann wrote:
>>>   Hi,
>>>
>>>> +static void virtio_gpu_shutdown(struct virtio_device *vdev)
>>>> +{
>>>> +	/*
>>>> +	 * drm does its own synchronization on shutdown.
>>>> +	 * Do nothing here, opt out of device reset.
>>>> +	 */
>>> I think a call to 'drm_dev_unplug()' is what you need here.
>>>
>>> take care,
>>>   Gerd
>> My patch reverts the behaviour back to what it was, so pls go
>> ahead and send a patch on top? I won't be able to explain
>> what it does and why it's needed.
> See below.  Untested.
>
> Eric, can you give this a spin?
>
> thanks,
>   Gerd
>
> ----------------------- cut here -------------------------------
> From f3051dd52cb2004232941e6d2cbc0c694e290534 Mon Sep 17 00:00:00 2001
> From: Gerd Hoffmann <kraxel@redhat.com>
> Date: Wed, 16 Apr 2025 15:53:04 +0200
> Subject: [PATCH] drm/virtio: implement virtio_gpu_shutdown
>
> Calling drm_dev_unplug() is the drm way to say the device
> is gone and can not be accessed any more.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index e32e680c7197..71c6ccad4b99 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  
>  static void virtio_gpu_shutdown(struct virtio_device *vdev)
>  {
> -	/*
> -	 * drm does its own synchronization on shutdown.
> -	 * Do nothing here, opt out of device reset.
> -	 */
> +	struct drm_device *dev = vdev->priv;
> +
> +	/* stop talking to the device */
> +	drm_dev_unplug(dev);
I have tested this patch on top of Michael's v2 and I don't see any
splat on guest.

Feel free to add my

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>  }
>  
>  static void virtio_gpu_config_changed(struct virtio_device *vdev)

