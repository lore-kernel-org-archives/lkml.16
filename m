Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA62F5A;
	Fri, 11 Apr 2025 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349144; cv=none; b=DrrQg1VCUqL5tL9mfpAEPaXPO8jBcxvQG98j0pTNw3jK6uMwOn+FvdHWlJxWnLoGfc1CKv/t37e/N6GTGbhGN8I1w2RO7swIg5zigmgYBQdbvHLRv6squ3TeGGTyc0EYdldcfpXSGt6exBlqKXuXBHDdugaVTu1DWsRHha687q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349144; c=relaxed/simple;
	bh=F5IwO7xNRT04uiROP/oeCB8HkPlZOPYoytFUFMqBCLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuVlqZdPHOqfRgPhgv65TrJNuDZ3nsaMVlWD4JNbgCVsnqGHqzTDbj8gNH/dOU4K6eW9NY7p8nCgzl9f9MYQTZouTe+evL+FsqMC0Sk3QPnvOcUk5pE7qOERsvJmQxZ7wpVjc035Tm/Sz4K3C/mB3tDDIf1inZp/xgd97BVZHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jCFzg0hg; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jCFzg0hg"
Received: from [10.102.97.179] (118-163-61-247.hinet-ip.hinet.net [118.163.61.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id DF1623F189;
	Fri, 11 Apr 2025 05:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744349130;
	bh=JobDZ4cR9gQ+Ni5Hnn8liTSBPbDfaEPWRaew7CjdJGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=jCFzg0hgvmP2xTFbgXWqmr4Ouxlxg0hvI1yIDMuYT5q+7lwtUsMja8s7mMLjuyLWz
	 uFYfKfU5p4yZP9cU9lKARfKZX5of9QjRpJozq+soCd89kuX2owlJqffq7ZGHtynjuG
	 4MUhjCLv9yuK4ZeO1RjjDG0HczIsycjSRKGwJUFTCf01RdjsaA40lrS0/C8qkpBjYr
	 93mFkf11gHcnmfYIlZ7IWRyZ0/ynj6lrA18OeQtmBlfz1aQaGj+blMl2ihN8Qjxm0t
	 VC0+w1/Ss80FUqCZm4n3Z9hozjkNsuSu9qa7N+RwgbVff+fqqrOaW5hFL2Cn0kmJN3
	 QLlWXJjYYug+g==
Message-ID: <09496c1d-3e2b-46c5-9ef2-75fdd8a61bda@canonical.com>
Date: Fri, 11 Apr 2025 13:25:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: quirks: Add quirk to prefer vendor-specific
 configuration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: krzysztof.kozlowski@linaro.org, limiao@kylinos.cn,
 wangyuli@uniontech.com, jinxiaobo@uniontech.com, huanglei@kylinos.cn,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250410024626.981215-1-ivan.hu@canonical.com>
 <2025041055-debtless-delirium-d5ca@gregkh>
Content-Language: en-GB
From: ivanhu <ivan.hu@canonical.com>
In-Reply-To: <2025041055-debtless-delirium-d5ca@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/4/10 14:58, Greg KH wrote:
> On Thu, Apr 10, 2025 at 10:46:26AM +0800, Ivan Hu wrote:
>> Some USB devices with multiple configurations expose a vendor-specific
>> interface class that should be preferred by default. However, the generic
>> usb_choose_configuration() logic selects the first configuration whose
>> first interface uses a non-vendor-specific class, which can lead to
>> incomplete or limited functionality.
>>
>> Introduce a new quirk, USB_QUIRK_CHOOSE_VENDOR_SPEC_CFG, which
>> instructs the USB core to prefer a configuration that contains a
>> vendor-specific interface class when multiple configurations are present.
>>
>> Apply this quirk to the ASIX AX88179 USB Ethernet adapter
>> (0x0b95:0x1790), which requires selecting its vendor-specific
>> configuration for full functionality, instead of falling back to
>> cdc_ncm.
> 
> Shouldn't this be done in userspace instead?  And how does other
> operating systems handle this, the "first" configuration is usually the
> default for them as well, do they have some built-in quirk to handle
> this or do they rely on a vendor-provided driver?
> 
> thanks,
> 
> greg k-h
> 

Hi Greg,

Thanks for the feedback.

In this case, the device advertises three configuration descriptors. The first is vendor-specific, the second is CDC-NCM, and the third is CDC-Ether:

Device Descriptor:
   idVendor           0x0b95 ASIX Electronics Corp.
   idProduct          0x1790 AX88179 Gigabit Ethernet
   bNumConfigurations      3

Configuration 1:
   Interface 0:
     bInterfaceClass       255 Vendor Specific Class

Configuration 2:
   Interface 0:
     bInterfaceClass         2 Communications
     bInterfaceSubClass     13 (CDC-NCM)

Configuration 3:
   Interface 0:
     bInterfaceClass         2 Communications
     bInterfaceSubClass      6 (CDC-Ether)

In drivers/usb/core/generic.c, the logic currently prefers the first configuration whose first interface is non-vendor-specific,
based on the assumption that Linux is more likely to have a generic class driver than a vendor-specific one:
		/* From the remaining configs, choose the first one whose
		 * first interface is for a non-vendor-specific class.
		 * Reason: Linux is more likely to have a class driver
		 * than a vendor-specific driver. */
This results in the CDC-NCM configuration being selected by default, even though the kernel already supports the vendor-specific driver ax88179_178a,
which provides the correct and full functionality.

Of course, this could be handled in userspace, but due to security restrictions on certain systems, such as Ubuntu Core, modifying configuration selection in userspace becomes significantly more complex and less straightforward.
And although I don’t have insight into the exact design in Windows, but during testing on a standard Windows install, the device is correctly initialized with the vendor driver without any additional configuration or modification.
Given that this quirk is device-specific and not a general change in policy, the proposed quirk simply allows the kernel to prefer the correct vendor-specific configuration when it's known to be required.

Cheers,
Ivan
