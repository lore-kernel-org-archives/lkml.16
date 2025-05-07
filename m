Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE57290080
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652421; cv=none; b=QWkwrezlmuS3b/17SLzdOpS3LVMDcPwSSNbeOCPeHFJBn45Dr9tnK9GtvL8Ud2pwX+lwcTJuAi3klVgRZvu1s5pyAANgfS/ZSVUo6VWNywrIA/T99Cr9YKsLu1Ylwg0XbFfcajCtQljQIL8IkPp8ajbEgq3j5blUe5iMhyFydVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652421; c=relaxed/simple;
	bh=rDi+M50iRkEBn8NyIC4MJndVXEuY8kocc7kmsv6+/pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S59ZVsZ6z0bcHYzcFOJA4jaCvCftqnJxtEJQK3Q9vySkMr+90Yr7MZpTw6vtVTc+Ihbxvom6lgG2NFI0KOtKK+1WdcmAobU7lf6lQljkuiQP4zfeF9sUeFJsnA+Gv1VBhhZwRFBhAYEuE/qR5VSwSL5HaITkZoZDLkIpgO69CrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ULp4C9gS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ULp4C9gS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746652418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyFruEMGsFO4LymNbk8Aadri71IZZ9QOzkfxFDvyktk=;
	b=ULp4C9gSV8QTXGgtceR6n6EI8ulDRdGOn0Z17H7X4V0deHS7gTw2sGKZBLAhjDpFkX1Mud
	EYPY1/MCiT53PAs7p1Z1dix3oJR+/n+KKwHz/UkXI6iXH1nE/qjeLvYjjNwP3zGOphDRus
	sAZR4Yzp81vv7AnUC7AdCvqJVB3VC7M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-yX7h75K1OvOP5_bgJ_Nnag-1; Wed, 07 May 2025 17:13:37 -0400
X-MC-Unique: yX7h75K1OvOP5_bgJ_Nnag-1
X-Mimecast-MFC-AGG-ID: yX7h75K1OvOP5_bgJ_Nnag_1746652415
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac297c7a0c2so16418766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746652415; x=1747257215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyFruEMGsFO4LymNbk8Aadri71IZZ9QOzkfxFDvyktk=;
        b=ptUwHX0aIU8Ql4xiWTAdsDhOnxTtsE+HICnFPCIFmChv06pOwNz3K45P1YsBN8gjoJ
         NmoveJidzmmVIMgrs/xdk3wmC6AN0TS4PL0Uttw8e4UacHkyfzrVKUrpmM97HHJF396J
         cW7qxnMjE2gIMjCHbim8RDMtJMax9H6hwyEZMD8IEQeOP6AWXnBKzsFCXksoywvnZSKs
         +90gb5UJoqVRpeXTLcDpmLmmG4LSP3Xezqq/Ecjwf3SMmL1tujsCxeR8TKG0gDrDnOX7
         MVJaTwaDh40awehh7ZirpodlFhuiirM9GOFYu+bA4kAq0iiuJRWpLrLQBhUrtG1QtrvO
         MBbg==
X-Forwarded-Encrypted: i=1; AJvYcCUX+xu4cibeETM9UwRDves1I/pRsY740FfvCAiSG1xgwIMveOV5HVnyD+kC1KvIVBSDdUfOXDRFuuJztQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDTRMFLRnqhJMX1NP4EyjdpPvuhdy7ZOEAjA8sbScKJ6IRji/e
	r83LYcc0QbVbq8jM/PJBjrDmz7ruDrKwaeOIE1ho83tyXfAnSBSLU75A6okKH0H0dqIu9nCoTeq
	l8Iu2dCs1JmhVyfLp35lparD4MOIqvsol0Ld6ESixUDh1tanDhdcBB8M+RvOPXA==
X-Gm-Gg: ASbGncuc71nYIoKoB03YFcfK7++w4fJFvhm36reRlzZ9pq3ycpcGTbAREKyHWaN5KwQ
	mFLv+E3Aaa1HL/pF+5z7Nl736FREcF1iRfH1xP5pT3TvkLzsJM2BBacuL/81FTDkb6Wr1tADzW1
	0iwx4SCU4vcpv1rLZTG6lye2gjEz4tS1MJiAw+t9lE07ZBtkkmBjFEh1HksuH9hhrB9QVbnASBF
	E5dwbUXcNHIE7jlphizBwFkukjdAzLq2YmoKKehFlLJy9yla7nkgoE6SmkV5wqeU9lQIAR/1yGx
	OLPDZUk3P8G2DbcKYitTfpVRpfs+i1uE16qPZWl59pwNj0lF/OHTa6CR8h0yU9s+2qVGnuAFZE1
	/+jZiw7/O3iSRDC00oWWjb7pLzu4hjOT0V2NcMtjYWa4bDtzuAoL+WAyRAsvEJQ==
X-Received: by 2002:a17:907:7d88:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-ad1e8b9c92bmr474554666b.9.1746652415457;
        Wed, 07 May 2025 14:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9Pd3cb9fBsixR0vs0CblTQxcvY90hk5Dm8Nag6f3wwTUMQqcKULDist3ihZOkXkbCvFhKHg==
X-Received: by 2002:a17:907:7d88:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-ad1e8b9c92bmr474552966b.9.1746652415077;
        Wed, 07 May 2025 14:13:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2df5sm961549766b.38.2025.05.07.14.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 14:13:34 -0700 (PDT)
Message-ID: <0d801367-da24-4596-83d9-08ccd89ca670@redhat.com>
Date: Wed, 7 May 2025 23:13:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 6-May-25 5:37 PM, Sakari Ailus wrote:
> Hi Pratap,
> 
> On Mon, May 05, 2025 at 01:11:26PM -0400, Pratap Nirujogi wrote:
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---

<snip>

>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
> 
> How will this scale? Can you use other sensors with this ISP? Although if
> you get little from firmware, there's not much you can do. That being said,
> switching to DisCo for Imaging could be an easier step in this case.

Note I've already talked to AMD about the way the camera setup
is currently being described in ACPI tables is suboptimal and
how they really should use proper ACPI description using e.g.
a _CRS with an I2cSerialBus resource for the sensor.

Although I must admit I did not bring up the ACPI DisCo for imaging
spec as something to also look at for future generations.

Note that there currently is hw shipping using the somewhat
broken ACPI sensor description this glue driver binds to,
so we're stuck with dealing with these ACPI tables as they
are already out there in the wild.

But yes for future hw generations it would be good to have
a better description of the hw in ACPI.

Regards,

Hans

