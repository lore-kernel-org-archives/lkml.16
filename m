Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751C158875
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317206; cv=none; b=ex7ip0qXFGMFY9Fn8TxF4hocpyr/ktYJjqtM0qiZJYYG5NxIPRbxh3y3rseVfx09wP9M1pI+7dAWmX9OmaplJM/0L44MDjKG3LHb+X5qHCmGr+p8GrJuk+5tLC/8D80z4ADcOHXgADdmwBBH0mjHTdL6LnwbHeSpdA5Ti5p4WNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317206; c=relaxed/simple;
	bh=gQx1+tDUa/o5oUEEv7Os1uWdhPEbX08y5vPFXuyTfkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/hRPCHrhtHaMEDFZZYvHv4eixhRfM6Me4VgH0fMK6BMgKbw7NfbDQXqDX/jirVigdQPZdSD3Z/BogLGqw/6VaJjxCHISfFJUQ7F/5VZM7uT/ejmi4UAS4zrZVGdzYDNniVuzg4G9tkvr+lGSDpcfE8YV58lcqkilXwHiu6OJx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gDxkapfV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gDxkapfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738317202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uajASmGIMbCd44bsRWwEgMTlXo5KZrl/APLt2266+g0=;
	b=gDxkapfV9vhrenBXR5DKY9AGUhOYV24Vl9BoF5PzE2CidBbu2KHddxHAgViVw2oz1g3lv+
	FIUQiqGACp053mxUtYQEdTtv+D4xioK2C5bZ7JSlnnKVq+EcJBL/D3xtpMBG07lGGGtUG3
	yYx0s9pZyw9232KtbUqFRAO49CxAlQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-VEMfk4HcN5mXxSGPg4pgVA-1; Fri, 31 Jan 2025 04:53:20 -0500
X-MC-Unique: VEMfk4HcN5mXxSGPg4pgVA-1
X-Mimecast-MFC-AGG-ID: VEMfk4HcN5mXxSGPg4pgVA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-436723db6c4so13024485e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738317199; x=1738921999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uajASmGIMbCd44bsRWwEgMTlXo5KZrl/APLt2266+g0=;
        b=wR/+OZOpbYX9v/L+zbm51RCxQlshwSK23O3llJ8zprrddJkc5Ji9KUlcf0Ybi7wEBK
         hWHB/SF5eVtEfINPVTAAvLCKqV/l1lOCXA7FrnJRXYh+FMrW1kLFQEVBe+6p8Q9ZqOuL
         e7kR6bvlQs9h881JyVWm2DxxUufVisZRYI1e0zjEHRDWgHHdwutLoPLFl82OtHTt8G9J
         TGN4vYDWmgGPi8sO4mnBWB38wxl2BAUuc1kEafoKAtWXtyUUZRkbxmm9kd4pHA21d1uG
         W9fY7bGPNFehFrl75GJYMI8y5lOTIwjFqfvGY6iV0syqsCcGXCgDnCgKEffeyZ4wdYEW
         womw==
X-Forwarded-Encrypted: i=1; AJvYcCWmcpnrRUNvXqV61aa5nfP0X26W6Ae/PjnGjw95hZXN5U7hhG812cQ/pNV5gvP3VdQ70DcqZm5wbrWCBc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfMO1AXIppcZrnzekJpUn4vWxWRM9TIKIF9m01Z56Rc3QEnlq
	zhgF33h2/6ma0Eyn3Lt2+hgkweOVntAg65hjDDKgHDDMVVmXizSozN9ockEmNhkTDIGdYIZLEx7
	fVdMUjTtBVgJ1C5+gAEseNTjhG/PcTmBpWf8e6M/8dJ2WVefFs1B+vAvErVDLZA==
X-Gm-Gg: ASbGnctV23MziM/gS/emlgo2llG4trLXjM//aUgwsP8bhmG/3/+YcA3EQyf629RvdvZ
	fEStcrguIurc1FGOS5GwmaXHiYqHqMXCtjmPzQ2ddQJZR1bAkTOMCq22bP5oAEc7SvuhqdqAkSL
	gU+xKc0AEmlJpiqppPS+ea0+fXbGgxuRO0Hcc0gLW2f+QHGUN6o9b6JVDtLGm/U6YQUWPCKx9aZ
	TygAfvYBPkztNukE1hGmJHcBB4nx4l66FM08sS6yeMM7KwGujoJ/alychGRsvFeyxFW19DTlbe5
	Qmb207Pka74JaRF+MEI0SkKdBHc6hBmd8VaL2YZ5caEaVck=
X-Received: by 2002:a05:600c:4594:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-438dc435389mr96806315e9.31.1738317199271;
        Fri, 31 Jan 2025 01:53:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9agM/gN9KCJCwTPfEsB/nqsCB4iC9TItldvNsE0LRJ8Zf+lk2M4cbay/0pg2M0FAK8bnoSQ==
X-Received: by 2002:a05:600c:4594:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-438dc435389mr96805975e9.31.1738317198817;
        Fri, 31 Jan 2025 01:53:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244eb0dsm50145615e9.27.2025.01.31.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:53:18 -0800 (PST)
Message-ID: <cc7312ca-2745-48a5-a5ac-9ee1d1c4bee0@redhat.com>
Date: Fri, 31 Jan 2025 10:53:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio: Remove virtio devices on device_shutdown()
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hongyu Ning <hongyu.ning@linux.intel.com>
References: <20240808075141.3433253-1-kirill.shutemov@linux.intel.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20240808075141.3433253-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kirill, Michael

On 8/8/24 9:51 AM, Kirill A. Shutemov wrote:
> Hongyu reported a hang on kexec in a VM. QEMU reported invalid memory
> accesses during the hang.
> 
> 	Invalid read at addr 0x102877002, size 2, region '(null)', reason: rejected
> 	Invalid write at addr 0x102877A44, size 2, region '(null)', reason: rejected
> 	...
> 
> It was traced down to virtio-console. Kexec works fine if virtio-console
> is not in use.
> 
> Looks like virtio-console continues to write to the MMIO even after
> underlying virtio-pci device is removed.
> 
> The problem can be mitigated by removing all virtio devices on virtio
> bus shutdown.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>

Gentle ping on that patch that seems to have fallen though the cracks.

I think this fix is really needed. I have another test case with a
rebooting guest exposed with virtio-net (backed by vhost-net) and
viommu. Since there is currently no shutdown for the virtio-net, on
reboot, the IOMMU is disabled through the native_machine_shutdown()/
x86_platform.iommu_shutdown() while the virtio-net is still alive.

Normally device_shutdown() should call virtio-net shutdown before the
IOMMU tear down and we wouldn't see any spurious transactions after
iommu shutdown.

With that fix, the above test case is fixed and I do not see spurious
vhost IOTLB miss spurious requests.

For more details, see qemu thread ([PATCH] hw/virtio/vhost: Disable
IOTLB callbacks when IOMMU gets disabled,
https://lore.kernel.org/all/20250120173339.865681-1-eric.auger@redhat.com/)


Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


> ---
>  drivers/virtio/virtio.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index a9b93e99c23a..6c2f908eb22c 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -356,6 +356,15 @@ static void virtio_dev_remove(struct device *_d)
>  	of_node_put(dev->dev.of_node);
>  }
>  
> +static void virtio_dev_shutdown(struct device *_d)
> +{
> +	struct virtio_device *dev = dev_to_virtio(_d);
> +	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
> +
> +	if (drv && drv->remove)
> +		drv->remove(dev);
> +}
> +
>  static const struct bus_type virtio_bus = {
>  	.name  = "virtio",
>  	.match = virtio_dev_match,
> @@ -363,6 +372,7 @@ static const struct bus_type virtio_bus = {
>  	.uevent = virtio_uevent,
>  	.probe = virtio_dev_probe,
>  	.remove = virtio_dev_remove,
> +	.shutdown = virtio_dev_shutdown,
>  };
>  
>  int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)

