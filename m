Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465EF1AC44D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832409; cv=none; b=USCsC7tscZ/aLt2Jns0xVhcK0BgzKvOVxhSA3cZQqX506nWwbG6r723olfK5T0oVvYLuTpVH3rX7ldMOwLUoUYA54Xc5ZStCKkIx5D3f/yrVcMdW7wYtgCAHhTVfvihHUO9fQuIhxExOdXh5T1y6Y9E+THnqUWV29WpWkJsYmpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832409; c=relaxed/simple;
	bh=LjlOrTtDTIY8tiW1liZrr+DUZVRehS4/ozGmwLU8IRU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BQt6/zDivHm+TRY6haTa09jXLrvD/H5xav+d4Sd2bOEmh6jm1xOi50pNDZKfoKgsCl9uswo9L0zhY87LoKd3F1SmDH0iBpmYSMdTxjFAvTFa4huSxcYzhjnqATu+zXnM8SKpzYoE1XQXluyePftVOyylVkny2kYLNppMKPo8xCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VVf7lAYB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VVf7lAYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738832406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+TJwvEW32zKDdEF39SKA5IofKy7f9WUxpmzy6CnaBzQ=;
	b=VVf7lAYBKdQd8ncyUdz4GIHWZpVjuUIfczP0td5dT87eEkrj1uSdVtz7/jzlRYwIkDGPCK
	vcay4NMeUPXFqwXzHV6NkMb5J4ZvnKVIETC2JewJsH3tdQT3FCcORl3jvsoPN0UgRhOfPH
	P9Lzf2389IVvTxOK+jebiFKe6y457Vs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-PoVqFr70MZ-pQmcvgkEUXA-1; Thu, 06 Feb 2025 04:00:03 -0500
X-MC-Unique: PoVqFr70MZ-pQmcvgkEUXA-1
X-Mimecast-MFC-AGG-ID: PoVqFr70MZ-pQmcvgkEUXA
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e43113ba01so16076086d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832403; x=1739437203;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TJwvEW32zKDdEF39SKA5IofKy7f9WUxpmzy6CnaBzQ=;
        b=K7ZpTNl9DT/6TkqeHyShzqx38O56xz/ml4PaWFLDBC9C1eECFufu/AK+x66vL/LlD4
         CKZLZnuxLEjSQnx/Cai0EZKh3++Jsj2nNu6O/wApd4UlIf+uRniY2C39YOzAnMLmLGds
         ApyHVBY7Z8sBy/UwIMnjGRSk0WhwuYShYCRfDQ6pXN8UucAIrxtUmUynZui6Gj+9QzaG
         4S9PCpbZhaO8PbiN27N6NSVktfQloakav/9L0FtDSGPy1Lzl45LvI4/wDfWBzKHaollm
         f/tPwmKk/3bbXIEuNMAtkGu8ohN8PQ1HvCl6MteNox8HCy+DhM3jIx7xKqi3ouwjXuvN
         O3eA==
X-Forwarded-Encrypted: i=1; AJvYcCVzXeL2c/R1HHcagOT4wSRE87La4ofz0W6UwmOoTtVaYY4Ri746nsiWfOQ+F4uNFWfTGrzwhGMs/3D9gKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIZTql6QbmzgQMh7Ly0e5nb9Yp72l+BxJOEo2u8UXwhQQWf/zs
	zA1c0q59WHMcTQUND2XaFCNtTDChuiV66bVcyn2QIm7AL4ZBFJu7ZS0BB51y9SOlSr4YpUSH7pr
	Wx6T+oEA2poOmlM3MlvHHxlHDiUuFJFATtHN2eJK88BmBn8j4CYg7hA2QSb8JYg==
X-Gm-Gg: ASbGncs599FrM1qI87nYNDLPFX8Ey+rATYXLXL8yRkl0pqcsSBzbaKtNZukxhqd+WBz
	wNOdZaAYsb9D0t3IgmtBNJp3WAA+5pf/I1rMU7/vrwFU/hUzT6SAi4DgqR2Gqx0lvr/0BfFeNdh
	RRLenwGJTEBovuLHMRaXkWfF+UPKKETBbLm5b/+ONxjPm+kHUGjHkmYSZA4MVYdlsp1U6n6oXb1
	bb4pBTloNhKDPQbRF1C7peDyYQZj6l0eyfRYalvVEibBo8XOU+OeMM+PgVZim+M5IABukSCZvcZ
	dSiyW4tCoKWoOuOm46ZnGHl8drzDFyMlM3wYsOtdWChiCOk=
X-Received: by 2002:a05:6214:21e3:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6e42fbd51edmr96439836d6.27.1738832402950;
        Thu, 06 Feb 2025 01:00:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYQC4XdDItMbyh07bmHPxuEE32UvpW7deNCXyhsyd4BSYylNNtA0pzhaD8ir5M3ZLkefmmJA==
X-Received: by 2002:a05:6214:21e3:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6e42fbd51edmr96439516d6.27.1738832402619;
        Thu, 06 Feb 2025 01:00:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43f221fb0sm1171876d6.56.2025.02.06.00.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:00:01 -0800 (PST)
Message-ID: <6bce0f4c-636f-456b-ab21-4a25d3dc8803@redhat.com>
Date: Thu, 6 Feb 2025 09:59:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio: Remove virtio devices on device_shutdown()
Content-Language: en-US
From: Eric Auger <eauger@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hongyu Ning <hongyu.ning@linux.intel.com>
References: <20240808075141.3433253-1-kirill.shutemov@linux.intel.com>
 <cc7312ca-2745-48a5-a5ac-9ee1d1c4bee0@redhat.com>
 <20250203094700-mutt-send-email-mst@kernel.org>
 <7cee3c9e-515e-41de-a15c-04c7591e83eb@redhat.com>
In-Reply-To: <7cee3c9e-515e-41de-a15c-04c7591e83eb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/4/25 12:46 PM, Eric Auger wrote:
> Hi,
> 
> On 2/3/25 3:48 PM, Michael S. Tsirkin wrote:
>> On Fri, Jan 31, 2025 at 10:53:15AM +0100, Eric Auger wrote:
>>> Hi Kirill, Michael
>>>
>>> On 8/8/24 9:51 AM, Kirill A. Shutemov wrote:
>>>> Hongyu reported a hang on kexec in a VM. QEMU reported invalid memory
>>>> accesses during the hang.
>>>>
>>>> 	Invalid read at addr 0x102877002, size 2, region '(null)', reason: rejected
>>>> 	Invalid write at addr 0x102877A44, size 2, region '(null)', reason: rejected
>>>> 	...
>>>>
>>>> It was traced down to virtio-console. Kexec works fine if virtio-console
>>>> is not in use.
>>>>
>>>> Looks like virtio-console continues to write to the MMIO even after
>>>> underlying virtio-pci device is removed.
>>>>
>>>> The problem can be mitigated by removing all virtio devices on virtio
>>>> bus shutdown.
>>>>
>>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>>> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
>>>
>>> Gentle ping on that patch that seems to have fallen though the cracks.
>>>
>>> I think this fix is really needed. I have another test case with a
>>> rebooting guest exposed with virtio-net (backed by vhost-net) and
>>> viommu. Since there is currently no shutdown for the virtio-net, on
>>> reboot, the IOMMU is disabled through the native_machine_shutdown()/
>>> x86_platform.iommu_shutdown() while the virtio-net is still alive.
>>>
>>> Normally device_shutdown() should call virtio-net shutdown before the
>>> IOMMU tear down and we wouldn't see any spurious transactions after
>>> iommu shutdown.
>>>
>>> With that fix, the above test case is fixed and I do not see spurious
>>> vhost IOTLB miss spurious requests.
>>>
>>> For more details, see qemu thread ([PATCH] hw/virtio/vhost: Disable
>>> IOTLB callbacks when IOMMU gets disabled,
>>> https://lore.kernel.org/all/20250120173339.865681-1-eric.auger@redhat.com/)
>>>
>>>
>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>> Tested-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> Thanks
>>>
>>> Eric
>>>
>>>> ---
>>>>  drivers/virtio/virtio.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>>>> index a9b93e99c23a..6c2f908eb22c 100644
>>>> --- a/drivers/virtio/virtio.c
>>>> +++ b/drivers/virtio/virtio.c
>>>> @@ -356,6 +356,15 @@ static void virtio_dev_remove(struct device *_d)
>>>>  	of_node_put(dev->dev.of_node);
>>>>  }
>>>>  
>>>> +static void virtio_dev_shutdown(struct device *_d)
>>>> +{
>>>> +	struct virtio_device *dev = dev_to_virtio(_d);
>>>> +	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
>>>> +
>>>> +	if (drv && drv->remove)
>>>> +		drv->remove(dev);
>>
>>
>> I am concerned that full remove is a heavyweight operation.
>> Do not want to slow down reboots even more.
>> How about just doing a reset, instead?
> 
> I tested with
> 
> static void virtio_dev_shutdown(struct device *_d)
> {
>         struct virtio_device *dev = dev_to_virtio(_d);
> 
>         virtio_reset_device(dev);
> }
> 
> 
> and it fixes my issue.
> 
> Kirill, would that fix you issue too?
gentle ping.

this also fixes another issue with qemu vSMMU + virtio-scsi-pci. With
the above addition I get rid of spurious warning in qemu on guest reboot.

qemu-system-aarch64: virtio: zero sized buffers are not allowed
qemu-system-aarch64: vhost vring error in virtqueue 0: Invalid argument (22)

Would you mind if I respin?

Thanks

Eric




> 
> Thanks
> 
> Eric
>>
>>>> +}
>>>> +
>>>>  static const struct bus_type virtio_bus = {
>>>>  	.name  = "virtio",
>>>>  	.match = virtio_dev_match,
>>>> @@ -363,6 +372,7 @@ static const struct bus_type virtio_bus = {
>>>>  	.uevent = virtio_uevent,
>>>>  	.probe = virtio_dev_probe,
>>>>  	.remove = virtio_dev_remove,
>>>> +	.shutdown = virtio_dev_shutdown,
>>>>  };
>>>>  
>>>>  int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
>>
> 

