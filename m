Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1952F237162
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859232; cv=none; b=a4eFN/fS7OGQKIPShF2eWZvXU/T+gXk3P4Y76rAJHVPbsL1QUZNF+xBVrnweUUMTrvsWqh6KhgQdbw6rs+dW/B2KAlvyevqznPaIFuwnRR/l9JKoosc82/Xebw9QDZ2JOQVfIgbia5vqTaB07Ry0S1ZLy42OThyYaYeEeszIS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859232; c=relaxed/simple;
	bh=ftau5nnBcsyM3dzdxcNmsLfZUtbbOzIpxUgWT0DqxlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0+2hFc5j0gWPIG6yTDoPfqYpOQQOY5iPb+fHPpLEWATEOHD9Mn6aW27cd5vK12M/1xHmw+DZ+ItFPUdVAqpUAbJRt8fDyMPvo2kKz15UX/aYzQjIKEZ7SFXO99vQZQuHAAA/VQUjfipgPrXeUyfWz5a7vGpf8w2xliVWI7yZ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+rPFByM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+rPFByM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738859230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ORfSJ3EHGoP5AEVbNbK5PWa+JtoK9YX59lWJj18YO+c=;
	b=O+rPFByMN1P3Oel96Pt6Gxf78uMdOnkj6puXofgXQBT31XTwplA4ywUMgyomL+GlfbeyI+
	8FnVieaHiw3pNBbbFjyJL8UPVRS//7R4q4gjfRTeA2BtugOO1MJFPJ77P/6I0Dw3Bxv940
	EjS0JJUl3ffqoE+G9bv6K941uEf8JVU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-tFX4R3MRNmC7XoNrs6FVHg-1; Thu, 06 Feb 2025 11:27:09 -0500
X-MC-Unique: tFX4R3MRNmC7XoNrs6FVHg-1
X-Mimecast-MFC-AGG-ID: tFX4R3MRNmC7XoNrs6FVHg
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46799aa9755so32224361cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738859228; x=1739464028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORfSJ3EHGoP5AEVbNbK5PWa+JtoK9YX59lWJj18YO+c=;
        b=k6kGEdTuq2lLDTEa0k0wOKQLNDZJ5TVR2M84e1xw9YFoY5aohd38U00B+PcPbEeJpq
         z5ArnrXtGclA+H92aZmBwol9ysswlbwb95fM5B5v2O9+HIwjeLBoyTO05hf+RlrO+pNC
         3d/8iA4Gp2lTYG59BVsrz3NRZaNRUaV/n45wmvM3Jj6Xw+dSZgj+lhivwgUfdO+f0/3n
         CfKH081oCHAISgtB9aw4ean2+oR8bVBONtN6V5jgjLjZ0Wc11iVnTi8qFiCrpN/Jb6zt
         3D8ERoh5JpE2kr9hmMGw+wIdqM1nm6UDzQnsiTZgSDxgf6waSYuuuaqwV7KpAOJW1zCf
         vZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVYowCl0Ft6IoHBRhNtO0wwVFgEBIH2FSzXh+KiBNVb16qoM8/70F6oRSaX/6m8E7JA3JlZCSAd2Ws5j/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1izl4bjAhd4M6qva2XGSJvmQyzpC7iMWCk+VjlIi8NKXgzva
	hnlCyaDKZAmwidyTwRE34zTrCsV0FxToqai1zdoR3zfWwaDPvXZgm5vYMR1oqKVowLaOz3Ojr+h
	Yilfckn6KxuEbf9It9Dh9/z/Utpzw81H8VOJNx1QJLbcaSb/Mp+DFRdtnI8gwPQ==
X-Gm-Gg: ASbGncsMcBt98ZWUNG8JyGOZh9rTlhK06ENONGDSi15aMmGWZnj2prd3CKo2AlSy+/c
	Qr1Pja7K087yuoeMIAq0QEIp8ZrX4pLIWAVP3Pwe6hbahRAMgPxmUroXbniUSjRq7V11JIIhFk7
	a3cTTe/FhX294I8olJcaUw7+ODAVBJFPJuKuzALhaRM2ToDhwSr+eW35/HQjR1YRJiYQFliTqZS
	9q6EFOFXO76+bd2jzl3mlOdq9dlSSDbcGuTavwh+bMwUar7GD5GHR31tBRQUVoMUoLpxxcH5EmB
	TfxlN+P6yG2hfHImrOXaj71iL1EsI8GFijwMTC4CRbNuGsQ=
X-Received: by 2002:a05:622a:1a90:b0:467:492b:617f with SMTP id d75a77b69052e-4702822e385mr86446221cf.40.1738859228504;
        Thu, 06 Feb 2025 08:27:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvcgibIGM8aGZG9wg0yw8o0j+eeVyK5m/Jf0cgWT4wBzwtzyrqOC36QaaH6GdJ23Q2Y15NDw==
X-Received: by 2002:a05:622a:1a90:b0:467:492b:617f with SMTP id d75a77b69052e-4702822e385mr86445801cf.40.1738859228043;
        Thu, 06 Feb 2025 08:27:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bc6ba7sm6648641cf.61.2025.02.06.08.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 08:27:07 -0800 (PST)
Message-ID: <91f6b468-e851-4817-bb51-869a8ee8654f@redhat.com>
Date: Thu, 6 Feb 2025 17:27:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio: Remove virtio devices on device_shutdown()
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hongyu Ning <hongyu.ning@linux.intel.com>
References: <20240808075141.3433253-1-kirill.shutemov@linux.intel.com>
 <cc7312ca-2745-48a5-a5ac-9ee1d1c4bee0@redhat.com>
 <20250203094700-mutt-send-email-mst@kernel.org>
 <7cee3c9e-515e-41de-a15c-04c7591e83eb@redhat.com>
 <6bce0f4c-636f-456b-ab21-4a25d3dc8803@redhat.com>
 <pnpkqz6keacwz4myydc6aak6gkdmomqn2lo376przlhb3mscsq@tdsfxwb2ujpk>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <pnpkqz6keacwz4myydc6aak6gkdmomqn2lo376przlhb3mscsq@tdsfxwb2ujpk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/6/25 11:04 AM, Kirill A. Shutemov wrote:
> On Thu, Feb 06, 2025 at 09:59:58AM +0100, Eric Auger wrote:
>> Hi,
>>
>> On 2/4/25 12:46 PM, Eric Auger wrote:
>>> Hi,
>>>
>>> On 2/3/25 3:48 PM, Michael S. Tsirkin wrote:
>>>> On Fri, Jan 31, 2025 at 10:53:15AM +0100, Eric Auger wrote:
>>>>> Hi Kirill, Michael
>>>>>
>>>>> On 8/8/24 9:51 AM, Kirill A. Shutemov wrote:
>>>>>> Hongyu reported a hang on kexec in a VM. QEMU reported invalid memory
>>>>>> accesses during the hang.
>>>>>>
>>>>>> 	Invalid read at addr 0x102877002, size 2, region '(null)', reason: rejected
>>>>>> 	Invalid write at addr 0x102877A44, size 2, region '(null)', reason: rejected
>>>>>> 	...
>>>>>>
>>>>>> It was traced down to virtio-console. Kexec works fine if virtio-console
>>>>>> is not in use.
>>>>>>
>>>>>> Looks like virtio-console continues to write to the MMIO even after
>>>>>> underlying virtio-pci device is removed.
>>>>>>
>>>>>> The problem can be mitigated by removing all virtio devices on virtio
>>>>>> bus shutdown.
>>>>>>
>>>>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>>>>> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
>>>>>
>>>>> Gentle ping on that patch that seems to have fallen though the cracks.
>>>>>
>>>>> I think this fix is really needed. I have another test case with a
>>>>> rebooting guest exposed with virtio-net (backed by vhost-net) and
>>>>> viommu. Since there is currently no shutdown for the virtio-net, on
>>>>> reboot, the IOMMU is disabled through the native_machine_shutdown()/
>>>>> x86_platform.iommu_shutdown() while the virtio-net is still alive.
>>>>>
>>>>> Normally device_shutdown() should call virtio-net shutdown before the
>>>>> IOMMU tear down and we wouldn't see any spurious transactions after
>>>>> iommu shutdown.
>>>>>
>>>>> With that fix, the above test case is fixed and I do not see spurious
>>>>> vhost IOTLB miss spurious requests.
>>>>>
>>>>> For more details, see qemu thread ([PATCH] hw/virtio/vhost: Disable
>>>>> IOTLB callbacks when IOMMU gets disabled,
>>>>> https://lore.kernel.org/all/20250120173339.865681-1-eric.auger@redhat.com/)
>>>>>
>>>>>
>>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>>> Tested-by: Eric Auger <eric.auger@redhat.com>
>>>>>
>>>>> Thanks
>>>>>
>>>>> Eric
>>>>>
>>>>>> ---
>>>>>>  drivers/virtio/virtio.c | 10 ++++++++++
>>>>>>  1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>>>>>> index a9b93e99c23a..6c2f908eb22c 100644
>>>>>> --- a/drivers/virtio/virtio.c
>>>>>> +++ b/drivers/virtio/virtio.c
>>>>>> @@ -356,6 +356,15 @@ static void virtio_dev_remove(struct device *_d)
>>>>>>  	of_node_put(dev->dev.of_node);
>>>>>>  }
>>>>>>  
>>>>>> +static void virtio_dev_shutdown(struct device *_d)
>>>>>> +{
>>>>>> +	struct virtio_device *dev = dev_to_virtio(_d);
>>>>>> +	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
>>>>>> +
>>>>>> +	if (drv && drv->remove)
>>>>>> +		drv->remove(dev);
>>>>
>>>>
>>>> I am concerned that full remove is a heavyweight operation.
>>>> Do not want to slow down reboots even more.
>>>> How about just doing a reset, instead?
>>>
>>> I tested with
>>>
>>> static void virtio_dev_shutdown(struct device *_d)
>>> {
>>>         struct virtio_device *dev = dev_to_virtio(_d);
>>>
>>>         virtio_reset_device(dev);
>>> }
>>>
>>>
>>> and it fixes my issue.
>>>
>>> Kirill, would that fix you issue too?
>> gentle ping.
> 
> I am on vacation this week. Will try to get around to it next week.
OK. Enjoy your vacation!

Eric
> 

