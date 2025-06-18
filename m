Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A29156C6F;
	Wed, 18 Jun 2025 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231414; cv=none; b=cH1gxU4L5wgvb0ByTLR3J3E5bt88/ZHCoD7yigShYVCK2K7iQx940YbhzeV6UwV18Cf0fwhXXK618tEsGfoDPCsQCKCbm6V2Hl1q+j3EbcTPgmEXPUOd9fecLWUufJdHnm4WDD7XQkOK603/AdXm/89W2WEGtD4VTuGsXnqOmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231414; c=relaxed/simple;
	bh=OwO8yp44JjVttqwjiAYSFrtMYCDSz0M9l5NAf5Flp3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmaEARatiMp0N+ebE5dbSkIZ1XNxoQQc7+dnWUUQYdp3jO+tuPtC6+PYDRSgLPqrHf8H+J/lN8WGHPDpIkl0mQja7LOGFz8NHOlU5XLqQZ9PKORixmngjYnq0tWFabhiFC+nxWC5RQx9vA2Bs1yiJb1WFlBUNS8joe7QRhPzGVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGtpEKUO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGtpEKUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B01CC4CEE7;
	Wed, 18 Jun 2025 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750231414;
	bh=OwO8yp44JjVttqwjiAYSFrtMYCDSz0M9l5NAf5Flp3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vGtpEKUOVzLhjkDKvLm2GarppFbX/1ZYBAMLpyvxirCD1bGJBZ/uFiC6dUhat0zhc
	 WCId9zclyRhTkD5yRV2ZC76x6srterL1yTD6/uDc48yj50Cp5r2rkrXXsSvKvXgMnS
	 qzy9alFdrQfqXIpGqb1AYIPsv4EHn/0f2qxxbjqqfYQRguCUfHs8I2keQmBiFv6w6V
	 FQKsVv7QDINTThPaFPR/Uzd9KRfDMm5v0AISgyBLdBJISVVvyn4Uu+FHp3t3QRZSeD
	 jwna1m7STyUmLRdsMsXKvc0nvSbg7JMOnQgtFax7+6IGYDrH5pl+f8vtGZptnhUJ+g
	 N+vhLjqmj2PWg==
Message-ID: <834849c2-2793-4f3a-b686-5e5ded713379@kernel.org>
Date: Wed, 18 Jun 2025 09:23:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-2-W_Armin@gmx.de>
 <77da5151-ddbd-409f-8b48-28029a96d5d8@kernel.org>
 <8126f0b8-c12e-4917-8f3e-f7b4a620aea2@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <8126f0b8-c12e-4917-8f3e-f7b4a620aea2@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 17-Jun-25 11:10 PM, Armin Wolf wrote:
> Am 16.06.25 um 11:21 schrieb Hans de Goede:
> 
>> On 15-Jun-25 19:59, Armin Wolf wrote:
>>> Add a new driver for handling WMI events on Uniwill laptops.
>>> The driver sadly cannot use the WMI GUID for autoloading since Uniwill
>>> just copied it from the Windows driver example.
>>>
>>> The driver is reverse-engineered based on the following information:
>>> - https://github.com/pobrn/qc71_laptop
>>> - https://github.com/tuxedocomputers/tuxedo-drivers
>>> - various OEM software
>>>
>>> Reported-by: cyear <chumuzero@gmail.com>
>>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---

...

>>> +static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>>> +{
>>> +    struct uniwill_wmi_data *data = dev_get_drvdata(&wdev->dev);
>>> +    u32 value;
>>> +    int ret;
>>> +
>>> +    if (obj->type != ACPI_TYPE_INTEGER)
>>> +        return;
>>> +
>>> +    value = obj->integer.value;
>>> +
>>> +    dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
>>> +
>>> +    ret = blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
>>> +    if (ret == NOTIFY_BAD)
>>> +        return;
>>> +
>>> +    mutex_lock(&data->input_lock);
>>> +    sparse_keymap_report_event(data->input_device, value, 1, true);
>>> +    mutex_unlock(&data->input_lock);
>>> +}
>>> +
>>> +static int uniwill_wmi_probe(struct wmi_device *wdev, const void *context)
>>> +{
>>> +    struct uniwill_wmi_data *data;
>>> +    int ret;
>> Hmm, if someone manually modprobe-s this because they think it will
>> help it will still load despite the generic GUID thing.
>>
>> I think this should the same DMI allow-list as the -laptop driver?
>>
>> Or maybe just export the driver as a symbol and have -laptop do
>> the actual registering of the driver ? Then if e.g. a force module
>> option gets added to the -laptop driver that will not need to
>> be duplicated here ...
>>
>> Regards,
>>
>> Hans
> 
> I do not think that a allow-list is necessary here, because the driver
> cannot cause any hardware damage. The driver only listens to firmware
> events, it does not access the underlying hardware in any way.
> 
> If someone really does load this driver manually on an unsupported device
> then the worst things that will happen are random hotkey presses. In most
> cases nothing will happen.

That is true. Still it feels a bit wrong to have this potentially
bind to a completely different WMI device which happens to share
the GUID.

Anyways I'll it up to you if you want to do something about this.

Regards,

Hans



