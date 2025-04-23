Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4C1DDAD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427955; cv=none; b=qMq/W48tnwpKZMDFbOjaPUVOWBhHE/DwVY5nTyUVikOXRxmDcXqHLevspxwctDaKrbx4C/728/fsUDA+QYTs7/I+qwRKww4x+5wNseYNiH3xFhP8+eP7cgTIuMwyjbK9ed4yUtqWE+YGupxod2IMzXkN7hpeRZwhLW3Pd5xYxdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427955; c=relaxed/simple;
	bh=+ieYwaDCw94dSTBEsxjc2oXkTMPtIySnWtLyPN0/FNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAGh6qKwfkV7WK1hFPCF+6jWo6XRHqO+wCMWR7TYx7u5G1EcHxEddPux784Iv7mPQNdl9uM1b1/K2D4fRrFxP7gUa5sB/UdSZKqsz8rqxupQLblJJpiAAaR55JOVFg76BGdtrPHHnHp1560yuw+xYLa0sE6UApkOzkMW/qwEs9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FDruBmda; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FDruBmda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745427953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJbMTWCqncnPcN2b8Q1cWkuDPNiPsy4soPd5FpvRDOk=;
	b=FDruBmdamgr2inrO7QAJJAZ+Se9RtuGBWKc5pZ+G8HeEUA3o2FKrErUTzWO0bWHs2AtorM
	XoY/reXQn0xMXqcoR1TUPrQfkccRYPxewPIcnUBubkhnK/+huBTrBib0b64J6D4wlrP7gH
	R+/BIXlK4UqlvDoe/RgpenZZIF/Cu1s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-2WjquSTBM9K8Mmdp1BWBIA-1; Wed, 23 Apr 2025 13:05:51 -0400
X-MC-Unique: 2WjquSTBM9K8Mmdp1BWBIA-1
X-Mimecast-MFC-AGG-ID: 2WjquSTBM9K8Mmdp1BWBIA_1745427950
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso7015966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427950; x=1746032750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJbMTWCqncnPcN2b8Q1cWkuDPNiPsy4soPd5FpvRDOk=;
        b=iRReYfeh2JoV2bMzrWZeArd8bsE0DpH1AR3c8mh5tOhkvMxj0GMLH2eKBfVUB1l2L4
         qYZtJS172LejPgGvQVxE8IHxhhdHB0y3duUQZQElKC+nmX9TsHAe8DfUGkgRCIW2TJxu
         UZPKFtNA/gmRbH4D7nBXVz6OVmaJweB8S+4dAmGkc5khlawXFjimSxDS2WmgbDQoECIl
         2+v2bmW9NB0c8H9sbT5w1t6hFZGIOEyoR176fhh9BSuvMVyV5cAnaGd0vHnaNKM8Nfca
         4wmLGiE6Zo3qBse0hD7EQUwBqYDvV1GneFIb/NkOrxBRWlXb0bYYyCwaVYQa5Z0Mn5Al
         dQGA==
X-Forwarded-Encrypted: i=1; AJvYcCV2U6xe7WyY77GB/VxsgKgynTNd1edscdJY2/KIhHfAUflzjDMVLRVcr82sAeOLgSyekG1PGoZbM6NfTKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu0H2zJVDMCXwpXPHTHJAolSPb+hTlcGJfsTCLMJG5Auha0BfA
	lCvBFHEIkACbYZXRx1JLTIpqS3ewWlMarU/wR8llT3n6Sq9SAD4Gej0u5T0i4Lw4Ra4o9accHNq
	gbhJ8mqIvoSM3fnLymbhPZMklCdhYMJuVyZhhXtpTOcg0T2fzwS3W066JD34gY3ZE0Mi0q65j
X-Gm-Gg: ASbGncsvF4lKWYPaM8D5+F0ea8zyagrU01zaWPTlxMirkVEn86rJEgh+DIaXfPPppX2
	7+z4+llIRfNoJmJYOYsa4YXuc8l4d427KBCEzHWcpEon6EaP1N8sKHOa7DWU6QWA7HOMp2k9k8T
	rvS2lD4jiznKAMHMlgIbKnXNHxRla1cFKazz00l9AZeDpw8G7NxRWOlvZZYHBJAvqSkgmq4/5GP
	iOCrA9/PtT3DKBXIFw9yuJD63h2sNjT1Ll0Asox5OGgw81K9fcam4erQf9Ozh74UsmtDFLgUeOm
	ocm6sjUTVMc0r6jLQ0W2HaZVhFeTuSCJ934ulsq+jW4nP/TAlEgfViJOK0aAcBa7HtABFMUSnKF
	exBWLxVQLXr6rQ0xw6SRKfnkOVK8VAQ4M9U0D+jspy6zZdZnYyr9mYDslLNzpzQ==
X-Received: by 2002:a17:907:2d06:b0:ac8:1142:a9e5 with SMTP id a640c23a62f3a-acb74dd5490mr1382502166b.47.1745427949878;
        Wed, 23 Apr 2025 10:05:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGUfyLp7pQ4wJXXGTs2A/h6iN7pW1UaixQPCQ/wM5hvKHeCIIA+Ui+fcJHeyhgvS/98gQqCQ==
X-Received: by 2002:a17:907:2d06:b0:ac8:1142:a9e5 with SMTP id a640c23a62f3a-acb74dd5490mr1382496266b.47.1745427949256;
        Wed, 23 Apr 2025 10:05:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acbb945b434sm335158666b.184.2025.04.23.10.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 10:05:48 -0700 (PDT)
Message-ID: <3ae149b5-a936-45b4-8887-eb7cde1ee4b0@redhat.com>
Date: Wed, 23 Apr 2025 19:05:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyndon Sanche <lsanche@lyndeno.ca>,
 Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
 <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
 <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
 <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>
 <D9E5H5B9X448.12FJT48775C50@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <D9E5H5B9X448.12FJT48775C50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kurt,

On 23-Apr-25 6:14 PM, Kurt Borja wrote:
> Hi all,
> 
> On Wed Apr 23, 2025 at 10:44 AM -03, Hans de Goede wrote:
>> Hi Ilpo,
>>
>> On 23-Apr-25 3:27 PM, Ilpo Järvinen wrote:
>>> On Fri, 11 Apr 2025, Kurt Borja wrote:
>>>
>>>> Use a faux device parent for registering the platform_profile instead of
>>>> a "fake" platform device.
>>>>
>>>> The faux bus is a minimalistic, single driver bus designed for this
>>>> purpose.
>>>
>>> Hi Kurt, Hans & Greg,
>>>
>>> I'm not sure about this change. So dell-pc not a platform device but
>>> a "fake".
>>
>> Arguably the dell-pc driver does not need a struct device at all,
>> since it just exports /sys/firmware/acpi/platform_profile sysfs
>> interface by using the relevant Dell SMBIOS interfaces for this.
>>
>> As such maybe we should just completely get rid of the whole
>> struct device here?
>>
>> If we do decide to keep the struct device, then since the struct device
>> seems to just be there to tie the lifetime of the platform_profile
>> handler to, I guess that calling it a faux device is fair.
> 
> I think it's important to mention that a parent device is required to
> register a platform profile, see [1].

Ah ok, that is new, I guess that was changed with the new support
for registering multiple platform-profile handlers.

> I guess we could get away with removing the device altogether from here,
> but that would require to find another suitable parent device. The
> obvious choice would be the `dell-smbios` device, however that would
> require exporting it in the first place.
> 
> For some reason, exporting devices doesn't seem right to me, so IMO a
> faux device is a good choice here.

Agreed.

> Another solution that would make more sense, lifetime wise, is to turn
> this into an aux driver and let `dell-smbios` create the matching aux
> device. I could do this, but I think it's overly complicated.

Yes that does seem overly complicated, lets just go with the faux
device.

Regards,

Hans




>>> Is it just because this driver only happens to call
>>> dell_send_request(), etc., not contains that low-level access code within? 
>>> Or is that dell-smbios "fake" too?
> 
> IMO `dell-smbios` is "fake" too? It is there only to expose either the
> WMI or the SMM backend through a single sysfs interface.
> 
> I think a more natural design for `dell-smbios` would be an aux driver
> that exposed it's interface through a class device. Maybe I'm wrong in
> this regard though.
> 
> [1] https://elixir.bootlin.com/linux/v6.15-rc3/source/drivers/acpi/platform_profile.c#L556
> 

