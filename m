Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359511C8FBA;
	Wed, 18 Jun 2025 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245344; cv=none; b=uOsonKjEQwhEeI3Y95woLSB5wNSrsZf3ltBoFUioK99nnDaHBdNBtWzqG++fQCjYxqC2s9wuQutKNU8Oh7ETmnoXyf/5MsvZYRrWsH8qHCNvB05Cq2A35AZQjSyQ5/T9kZs55AS3bfbxMPhAbXkhD57d+yJMj1F3A9y/lynHCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245344; c=relaxed/simple;
	bh=qeeSvmPvdi3KDW1807Ll+jEPEBJM6Ao3ui675B5bxBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQD2RWYBiUG915xx5MECFXJgBx4o/mXZSe68LFKI5Kd8lJhWN9Q5iOtUzT8LCn804D8SHcA3NE9WmFlfdrZ18ttqAY3OFnIMcPQSuEAIsbJn0pYjgFSj+BXrqgu1VrXevsfMqvxW5lvXysl3cRxrEvpM6t8LjViVdZPDqm+jY0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=cdEa0Hnv; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="cdEa0Hnv"
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AE2F42FC007F;
	Wed, 18 Jun 2025 13:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1750245332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LgIKjqPybZi2Z93t4HwTsIjfMz0E9g+e7VTRKPye6xs=;
	b=cdEa0HnvVvR54Sge7IQDrbG6NELzxuMWqsX11aYtJ069+/ctvGDDA+LskCGbyjwRoE1My2
	5RIggBsGN99asW7OgclenWa38ZcMpGinT9B8BkmSGMeeIGJx+1ZZ29cCtIYF7wNoJEihga
	UYzNkatcmr48Y6V1B7Y2mPtojzoN2Hw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <45a985fd-5428-4cbb-843a-523ea435a228@tuxedocomputers.com>
Date: Wed, 18 Jun 2025 13:15:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <1020d244-4d52-4afd-ae98-bfcb2b8e7145@tuxedocomputers.com>
 <de9d469b-9ea2-4fe3-8a7e-92fdc6d1c980@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <de9d469b-9ea2-4fe3-8a7e-92fdc6d1c980@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 17.06.25 um 23:50 schrieb Armin Wolf:
> Am 16.06.25 um 14:32 schrieb Werner Sembach:
>
>> Hi,
>>
>> Am 15.06.25 um 19:59 schrieb Armin Wolf:
[...]
>>> +The EC behind the ``GetSetULong`` method is used by the OEM software 
>>> supplied by the manufacturer.
>>> +Reverse-engineering of this software is difficult since it uses an 
>>> obfuscator, however some parts
>>> +are not obfuscated.
>> Iirc Christoffer said there is also another non wmi, but acpi, get/set cmd 
>> that can write only specific regions but is faster. Just wanted to leave this 
>> here for potential future optimizations if you are interested.
>
> What interface are you referring to exactly?

I think he was referring to these 2 methods in the dsdt:

     Scope (_SB)
     {
         Device (INOU)
         {
             [...]

             Method (ECRR, 1, NotSerialized)
             {
                 Local0 = (0xFE410000 + Arg0)
                 Local1 = MMRW (Local0, Zero, Zero, Zero)
                 Return (Local1)
             }

             Method (ECRW, 2, NotSerialized)
             {
                 Local0 = (0xFE410000 + Arg0)
                 MMRW (Local0, One, Zero, Arg1)
             }

             [...]
         }
     }

They can read/write the 0x04xx and 0x07xx addresses but not the 0x18xx ones 
iirc, don't know about the 0x0fxx ones.

I think 0x18xx was never intended to be written probably, but we use it to 
implement a custom fan curve option in tuxedo-drivers on older devices that 
officially don't support it.

Best regards,

Werner

