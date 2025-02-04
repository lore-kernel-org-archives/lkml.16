Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29720C476
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669614; cv=none; b=OShkgRGPF4RwtLp0PEY0adMbD8GTfIvANr79DPi9ng25PHq5d2AR7jLO7lN6HDrm+RB8Z/aXIZ0GEwNhh+zE7P4Av7jogUH2QdQ+rklkdNA9JD/DAp70+k9Cb3YzhaSeg07X7Jy0vYjmirVcTyjKz6q6uAycoSH02nOny+9OOR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669614; c=relaxed/simple;
	bh=kyCBzsEvksiy34XuPM2mafO6HCLpkjdC6BbFlcWVjDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aScHDOON9cg73uDTItxn8p4LpzItMzHK3PvClu/2nTD3J7Jop/cvE+MafwVHHH0QZzPZA/HHC5ir4Ak4EwFzLvnyPSHoMsa4MMLwgSLoxFweqn/ybym0e9PZn6+tAMoOJG+HyF/xX8Ju6z+1EZnXwALyZhhjYcD8rk7z+p/BW+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byN8Mrkl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byN8Mrkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738669611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvcDdg7/SVFIqVUEmdXIURYWbEP0dIzrDz3mI0Bb3bY=;
	b=byN8MrklrhZioY4o0X7MZfiSP9LJqgmzwrsW3TR6fjiU07hVunfag+GQgrawubXGpqZvSo
	9uATrD4dfYJEP2Vv+bPnnXwmlYAq8BbtowDgr+2g9NkBiTTMto5BNPtnMuM63OJbtNSieF
	iAvZfUGXcCx2Y7g7xF4KGr/aZqf9Fac=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-zT3PDZp0NeaqHjbGmzchpw-1; Tue, 04 Feb 2025 06:46:50 -0500
X-MC-Unique: zT3PDZp0NeaqHjbGmzchpw-1
X-Mimecast-MFC-AGG-ID: zT3PDZp0NeaqHjbGmzchpw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43624b08181so26770015e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669609; x=1739274409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvcDdg7/SVFIqVUEmdXIURYWbEP0dIzrDz3mI0Bb3bY=;
        b=gKabnxSQE1nEQEzrThq4mGtZvZOS4rq4e+NR+0qZzE22ArnSXyjORmgWMVLDLoVRJD
         r6vJfVAghSqI+4GqxrcnHvFMFUsNHE3WrtrZ/JFweH5jqos9jeyz4wBc45LSByfAvjRb
         XWEt3ICBh5/AqpV/tUykf4gy+Kdm6tGSIRvtqeuTkL+uULuc2ZJgq7Rs5+mQ316KyKD8
         TAJnTDF2ffGNshnrYTQCcg4ovoWcmMibhee/m9WyrzWMUiQuyGj7G+dpD2pdXyi0dUYM
         pB39FBbPpgF9gj+IB5Uh6SBFgXqWzCZU6vl6G0tZbT/atBC6pNdYPNLdRiK3HFgIRqpr
         o89g==
X-Forwarded-Encrypted: i=1; AJvYcCU2B8//hp+KURAVXK+3nTIpa7GEklB0UogEOweh9JsYdfR1AURkJsnA4ZC3VxENseTKIR7wl7a656WL5LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxoeKdX/U/Q5KddjB17GTPhopgqsTsboQzN1jHnj2v3BjPPvAp
	2Mo1HZWSDZiomMZNDr0ulfovN0H6Ci5Lsqx7P+XyFiSCxh4G/xzalBhuiXX4cVV/1gcc5GqR0UH
	y1vRd2JkfOw39zz7uEHvfXmiJoRKjwmIECtvDeyPO3XIqNa4M6CpxtEYMTQT5Rw==
X-Gm-Gg: ASbGncvtMRENCmn6f4VPorTOZj6qM6/UlXuC9p+W8kmH2sBkg2vdSOXuupjCHLkEOMa
	w2jwRVNToXSIHqd1/EINQNBJmQ6myoul2/lp+Viy9ATQZ+W34pr/bOdwiYRYjYRN3csDj7XdEXy
	8sBfKpiF+4OXzpxvy6H/tbcVP010ezu1eqgDpjQp2hupkRirLdfxny2SwJxxRZhLIzf1/80ImTY
	1OB/o523A4inokObAdmH0+zlOWAMMhdyLpgClsW3sXrLh9nihJOD8qgk2hIbGUW8vF1+UoRpO3n
	IXELfgSAG4leVw91apJBypCpS4B0YsXJoTd6JAaAEdenBUc=
X-Received: by 2002:a05:600c:348c:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43905f2bdb0mr20470695e9.0.1738669608755;
        Tue, 04 Feb 2025 03:46:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeum0PL2xaCZP/ssYUTuxdWNYIr0Cy4p2cLeswu3gbbZgIeYWyXJW1jokFJSibPL23F+FfPA==
X-Received: by 2002:a05:600c:348c:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43905f2bdb0mr20470475e9.0.1738669608398;
        Tue, 04 Feb 2025 03:46:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm15402597f8f.1.2025.02.04.03.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 03:46:47 -0800 (PST)
Message-ID: <7cee3c9e-515e-41de-a15c-04c7591e83eb@redhat.com>
Date: Tue, 4 Feb 2025 12:46:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio: Remove virtio devices on device_shutdown()
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hongyu Ning <hongyu.ning@linux.intel.com>
References: <20240808075141.3433253-1-kirill.shutemov@linux.intel.com>
 <cc7312ca-2745-48a5-a5ac-9ee1d1c4bee0@redhat.com>
 <20250203094700-mutt-send-email-mst@kernel.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250203094700-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/3/25 3:48 PM, Michael S. Tsirkin wrote:
> On Fri, Jan 31, 2025 at 10:53:15AM +0100, Eric Auger wrote:
>> Hi Kirill, Michael
>>
>> On 8/8/24 9:51 AM, Kirill A. Shutemov wrote:
>>> Hongyu reported a hang on kexec in a VM. QEMU reported invalid memory
>>> accesses during the hang.
>>>
>>> 	Invalid read at addr 0x102877002, size 2, region '(null)', reason: rejected
>>> 	Invalid write at addr 0x102877A44, size 2, region '(null)', reason: rejected
>>> 	...
>>>
>>> It was traced down to virtio-console. Kexec works fine if virtio-console
>>> is not in use.
>>>
>>> Looks like virtio-console continues to write to the MMIO even after
>>> underlying virtio-pci device is removed.
>>>
>>> The problem can be mitigated by removing all virtio devices on virtio
>>> bus shutdown.
>>>
>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
>>
>> Gentle ping on that patch that seems to have fallen though the cracks.
>>
>> I think this fix is really needed. I have another test case with a
>> rebooting guest exposed with virtio-net (backed by vhost-net) and
>> viommu. Since there is currently no shutdown for the virtio-net, on
>> reboot, the IOMMU is disabled through the native_machine_shutdown()/
>> x86_platform.iommu_shutdown() while the virtio-net is still alive.
>>
>> Normally device_shutdown() should call virtio-net shutdown before the
>> IOMMU tear down and we wouldn't see any spurious transactions after
>> iommu shutdown.
>>
>> With that fix, the above test case is fixed and I do not see spurious
>> vhost IOTLB miss spurious requests.
>>
>> For more details, see qemu thread ([PATCH] hw/virtio/vhost: Disable
>> IOTLB callbacks when IOMMU gets disabled,
>> https://lore.kernel.org/all/20250120173339.865681-1-eric.auger@redhat.com/)
>>
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Eric Auger <eric.auger@redhat.com>
>>
>> Thanks
>>
>> Eric
>>
>>> ---
>>>  drivers/virtio/virtio.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>>> index a9b93e99c23a..6c2f908eb22c 100644
>>> --- a/drivers/virtio/virtio.c
>>> +++ b/drivers/virtio/virtio.c
>>> @@ -356,6 +356,15 @@ static void virtio_dev_remove(struct device *_d)
>>>  	of_node_put(dev->dev.of_node);
>>>  }
>>>  
>>> +static void virtio_dev_shutdown(struct device *_d)
>>> +{
>>> +	struct virtio_device *dev = dev_to_virtio(_d);
>>> +	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
>>> +
>>> +	if (drv && drv->remove)
>>> +		drv->remove(dev);
> 
> 
> I am concerned that full remove is a heavyweight operation.
> Do not want to slow down reboots even more.
> How about just doing a reset, instead?

I tested with

static void virtio_dev_shutdown(struct device *_d)
{
        struct virtio_device *dev = dev_to_virtio(_d);

        virtio_reset_device(dev);
}


and it fixes my issue.

Kirill, would that fix you issue too?

Thanks

Eric
> 
>>> +}
>>> +
>>>  static const struct bus_type virtio_bus = {
>>>  	.name  = "virtio",
>>>  	.match = virtio_dev_match,
>>> @@ -363,6 +372,7 @@ static const struct bus_type virtio_bus = {
>>>  	.uevent = virtio_uevent,
>>>  	.probe = virtio_dev_probe,
>>>  	.remove = virtio_dev_remove,
>>> +	.shutdown = virtio_dev_shutdown,
>>>  };
>>>  
>>>  int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
> 

