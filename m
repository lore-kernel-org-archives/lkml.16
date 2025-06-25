Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D788633A;
	Wed, 25 Jun 2025 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856963; cv=none; b=g/HlW1md8hHuGySspUsrb8PNT/sMm3YQ2IbqthlWn2L/J4YOlxm72DTrbJbzl1ieTpZ3+qC+UqBlH1cu5Nn4MbzYrU6zIjMn2v0o+q5gQZ8HK40tHkdo+0TJ9rWvdbkkdpVRMME48wPUPvCV2Ti8oVUUi86mH4dnsqtl0hYFtjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856963; c=relaxed/simple;
	bh=2g7uwDf6HD1kbEuaMLO8rRQmivuI3UpZswArmUEZoNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIVciHkadxFIDc1tWSknXLllhqQm1MLgYUFe/4eDxq8P+IDneBaDVlsC/WhXN0/xpw8N3q6ALq29wlQ5B3PIPKzv60h8byfp0mnWngyrjrYmDBq3wQWLoiWw2eHy4luD6RnfYpn3QTHigPY5qdPfTC00DC/Q1arNz1FqE10ioX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WSoj1XAD; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WSoj1XAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750856946; x=1751461746; i=w_armin@gmx.de;
	bh=lCkqTifbOr0Ytc1hKJj3Ojf1gN+IKCB2EkFgVdFd9Sc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WSoj1XADtRBf9EQsU2tvi9UjoAc9rWRVStekwf1z0OEYJpwI0zCE4N8xG1SZ3wGx
	 F7QFR3h8GCMVLq0XiNHllHJ47+nwLFsYM8kXBGCJ6S1PomYzU3SjWyk4597+1LnFL
	 shebXp7nfFxGBlHJKg+xizlgBf3le20+v32QnssI9HLY0EilpyqN2XwYicbW5jVks
	 udWqJl8mjFgWyYrYS3E3jLxSuH04b71cmDegfvq8wsLU55Co4+iNe/B3hrge0sR4H
	 JRNsg0m/KsVfcrPIZteBkR4LopUKoFe/Asu3trYmByMawVdd6qx5hYYYfniZQSyFL
	 wMRswFvfykwuwXA7Yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwfai-1ueeUd3wKo-00vI5G; Wed, 25
 Jun 2025 15:09:06 +0200
Message-ID: <b32b6f01-cac7-4cd4-b73b-eb4bbce63039@gmx.de>
Date: Wed, 25 Jun 2025 15:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: wmi: Fix WMI event enablement
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: dimich.dmb@gmail.com, Hans de Goede <hdegoede@redhat.com>,
 kuurtb@gmail.com, corbet@lwn.net, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20250619221440.6737-1-W_Armin@gmx.de>
 <e23ffd29-13db-bb11-ee06-0f1203269902@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e23ffd29-13db-bb11-ee06-0f1203269902@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F8OEpww+kf8N9ur7LrtXO9WWpbcT9Na+WUP7Bh0//K9oRsk/bhl
 xzGJePmkV0VQyFy+jrZc10gTbmCHilLP0NjzSSvJnw2nokTR/QZ5Y8xSGK6ahXzl34d6Y99
 eVTC7xoADX/J6oSrtvOlb/HJ1FOiTuRL3TKIso0hB9IZfNLen32FKBf2uGDRMgMWfF/cyCa
 GGg2IQzruqEREnkz1qLMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0mtoWdvjHrw=;rX7/Egp92dxkGnUkKCKB2PXxXI2
 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
 MA4LebLoU1YPfQDMjf8XsM8=

Am 25.06.25 um 14:28 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 20 Jun 2025, Armin Wolf wrote:
>
>> It turns out that the Windows WMI-ACPI driver always enables/disables
>> WMI events regardless of whether they are marked as expensive or not.
>> This finding is further reinforced when reading the documentation of
>> the WMI_FUNCTION_CONTROL_CALLBACK callback used by Windows drivers
>> for enabling/disabling WMI devices:
>>
>> 	The DpWmiFunctionControl routine enables or disables
>> 	notification of events, and enables or disables data
>> 	collection for data blocks that the driver registered
>> 	as expensive to collect.
>>
>> Follow this behavior to fix the WMI event used for reporting hotkey
>> events on the Dell Latitude 5400 and likely many more devices.
>>
>> Reported-by: Dmytro Bagrii <dimich.dmb@gmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220246
>> Tested-by: Dmytro Bagrii <dimich.dmb@gmail.com>
>> Fixes: 656f0961d126 ("platform/x86: wmi: Rework WCxx/WExx ACPI method h=
andling")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/wmi.c | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
>> index 21b7e54bd7ab..4e86a422f05f 100644
>> --- a/drivers/platform/x86/wmi.c
>> +++ b/drivers/platform/x86/wmi.c
>> @@ -180,16 +180,22 @@ static int wmi_device_enable(struct wmi_device *w=
dev, bool enable)
>>   	acpi_handle handle;
>>   	acpi_status status;
>>  =20
>> -	if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
>> -		return 0;
>> -
>>   	if (wblock->dev.dev.type =3D=3D &wmi_type_method)
>>   		return 0;
>>  =20
>> -	if (wblock->dev.dev.type =3D=3D &wmi_type_event)
>> +	if (wblock->dev.dev.type =3D=3D &wmi_type_event) {
>> +		/*
>> +		 * Windows always enables/disables WMI events, even when they are
>> +		 * not marked as being expensive. We follow this behavior for
> Hi Armin,
>
> Is the wording in the comment reversed? (I suspect you didn't mean to
> include "not" into that statement?)

Actually i did.

The WMI-ACPI spec seemed to suggest that WMI events should be enabled/disa=
bled
only if they are being marked as expensive, however it turned out that WMI=
 events
should also be enabled/disabled even if _not_ marked as being expensive.

Besides that another user tested this patch on his machine, so:

Tested-by: Grzegorz Suwaj <grzegorzssuwaj@gmail.com>

Thanks,
Armin Wolf

>> +		 * compatibility reasons.
>> +		 */
>>   		snprintf(method, sizeof(method), "WE%02X", wblock->gblock.notify_id=
);
>> -	else
>> +	} else {
>> +		if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
>> +			return 0;
>> +
>>   		get_acpi_method_name(wblock, 'C', method);
>> +	}
>>  =20
>>   	/*
>>   	 * Not all WMI devices marked as expensive actually implement the
>>
