Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E613208A7;
	Mon,  3 Feb 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599337; cv=none; b=S6rVABoji/GUy1O6IG7jq1rB5zYgZ+uhNwyuzoy5cuXStU4Zo4EoR8zPBNg5mUDpefUuvM8zkeeZIDP5PKUJoW/Bfz9mGWmOOA08KJHYvueQ04I0zCNw8nGJeuD+wTIqH5nng8fkl40Gk8oC2k4gPsE7BJV09ESiAOgA3BVy+DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599337; c=relaxed/simple;
	bh=jUwhSe87g02uoy84SImiW3iRnVIQ00CyAOokehw2rvw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=hgh/XyXEfGJKN56k68C3SwX4wVnqVqUxBigeu6lMSzml3ar3H4h5QBy3J4YY+xQnOkD4hE9G+RcOLCYzaAWx8YiStmr2kmczoFXQqCrOqcrSnV9Cwjn+1pjha/l8i35bv2/tQrbN9P4r6e2sm3JnoSmxNDFJVg7T2NGRzbPUbzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JItIBMR7; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JItIBMR7"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4678cce3d60so47276391cf.2;
        Mon, 03 Feb 2025 08:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738599334; x=1739204134; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tS/7qTS4m70JkAze3DpkSpMUHgCMv050Qq58puGuWY=;
        b=JItIBMR7Q5nURpcEcD/3BE1w7JT02laSUcOwI99yImfu2t5hBfoX+4oS3EbLMszHfU
         +iOFQSqO6hfuuhTHrLq9jZGmKjSzEKyOcKUscbgAIKlrNuN7udDcqiDHHtinZJtQevZE
         LCntGi0sS7QcFTKzJ+oPjjA62mDuL/s37p7Mu2LIgJRPzXLecG4ZUNrLi4LlFFvpcEtk
         VIvXg9lUWcRHdyQKgj8yrg08imDh194iQs5CRMPZiV28y0zN2llSnV+TNl/PEmuLu5fw
         22O3zHpyKkGGWPa3N+ll5p8ApSY/ywKGwCfSC6U5LKl1ljYvVyhKAeEZ2ziR+LPUgITH
         3C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599334; x=1739204134;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tS/7qTS4m70JkAze3DpkSpMUHgCMv050Qq58puGuWY=;
        b=oJyBarGnZjOfHJ8rrL8tfw7LvsG7ryqs2vxbcUU1dZykeghrV0v2M2GVmhTnHh2skA
         ous1QwqPsD1oOsXW3gxD9jFQfXHKgWvGmmfL5cAbVRGIYnGo9aySuzCI6u6c1MWrtj4L
         CIEXuFchd5UErbNq595PsCKRbk3YjrCBbHn76VzsSbQD6nIL/BZFM3I2UyQOzDmQI3Nn
         bdDsSUtR8eRuevpHKmucQB9WGsbi+heuM8B+giK2dTBrF1AbeHfPjmCrXumHiF+5SMCW
         K64nhgWf0J6lbbufCrdBqrxh5/wJTheunfJCB9MbC7Zdu5LABykzqQoJjHC8mXJ9O4nP
         JDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZMbN7jNkQRhYdDIBSrSfizxVpD1ijGFLwzUW6IZVA6CfqaXflfjoYIGjkOOWKxJ9JeD2uyexW9MosAkkHZ2AS6U2q6g==@vger.kernel.org, AJvYcCVnYatb6X/CxtbIqeoB2eBUq3CRSEeAgo0Zz+qgJeO2zy1UddZJNQQ7jW1QQFmrU7BL+1aBD2Dnt4HF1/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxI34xNwdtavrIPsxjL7aBq0cM11gTM7XKlp+M57jfTSzPECUS
	nlyIkSC8IYlpQOaKJVbwD4U+9A6MfiyndC2zw5UdT0MbfPE/O7X5
X-Gm-Gg: ASbGncsULzlbo4jLJcLso0ngsQdACqigOcIVz73XsWbTGG0siqRoQC0jdGy0iodKVmS
	t9Pll4nOG4PZCyJQfHUAcGjoAI41Ww+2aOQVdJbjLo9OEAujPW/FqDVAWJ4bA0dIS268zLCXP3Z
	8mUW5rSSsLuYhk3Eeeeu6C752T4HlEcVVdMXAXueACDZ2rIakVQaIOSDErv3Wcip1wCKkrWiXuG
	dn6xOd+/PSJLCYcJ3T00LoD3vgGp5W5fp0XmwYL/V+0j0z6a5T6oudcTyfPkOBmdP9QT5VpvHMU
	X2OEgB8=
X-Google-Smtp-Source: AGHT+IFRBhTOmGMRTDgquhOoPafkUNQIAOUKTz9yGcentgDY3hJhT0Mux0KPf2YTh1eh35gTqFTb7Q==
X-Received: by 2002:a05:620a:f0f:b0:7b6:6d5a:d51b with SMTP id af79cd13be357-7bffcdafb19mr2967329085a.52.1738599334052;
        Mon, 03 Feb 2025 08:15:34 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8669407cc41sm1708989241.8.2025.02.03.08.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 08:15:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 11:15:31 -0500
Message-Id: <D7IY0YO7DFXE.1V78T6V77EDF2@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <platform-driver-x86@vger.kernel.org>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250203062055.2915-1-kuurtb@gmail.com>
 <7d4e693e-5d12-4c55-9db8-7f7dd45e8086@gmx.de>
In-Reply-To: <7d4e693e-5d12-4c55-9db8-7f7dd45e8086@gmx.de>

On Mon Feb 3, 2025 at 10:34 AM -05, Armin Wolf wrote:
> Am 03.02.25 um 07:20 schrieb Kurt Borja:
>
>> Hi!
>>
>> I bring some last minute modifications.
>>
>> I found commit
>>
>> 	8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
>>
>> which states that it's unnecesary to call device_remove_groups() when
>> the device is removed, so I dropped it to simplify things.
>
> What? That sound quite strange to me. I CCed Greg because i am curious ho=
w this
> should work.

I'm curious too!=20

I found it while searching for something like devm_device_add_groups
which it turns out, was removed from the kernel.

>
>>
>> I also found commit
>>
>> 	957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to dev_gro=
ups")
>>
>> which states that no driver should add sysfs groups while probing the
>> device as it races with userspace, so I re-added PROBE_FORCE_SYNCHRONOUS
>> to the platform driver, so groups are added only after the device has
>> finished probing.
>
> Using PROBE_FORCE_SYNCHRONOUS is not going to solve this problem here, pl=
ease remove it.

Yes, I'm going for Ilpo's .dev_groups approach.

~ Kurt

>
> Thanks,
> Armin Wolf
>
>> I'm not 100% sure that the second commit message applies here, but it is
>> revd-by Greg K-H so I added it just in case.
>>
>> Aside from that, I added .pprof to awcc_quirks because I'm going to add
>> support for new features after this series, and it makes sense that
>> force_platform_profile only forces the pprof and not other upcoming
>> features.
>>
>> ~ Kurt
>> ---
>> [02/14]
>>    - In alienware_alienfx_setup() add a devm action to remove the create=
d
>>      platform device
>>    - Drop device_remove_groups() in WMAX .remove callback
>>    - Add PROBE_FORCE_SYNCHRONOUS to the platform driver
>>    - Drop .remove callbacks on both WMI drivers
>>
>> [03/14]
>>    - Add awcc_platform_profile_init() to create the platform_profile
>>      device on quirks->thermal =3D=3D true condition
>>
>> [07/14]
>>    - Add .pprof to awcc_quirks
>>
>> [10/14]
>>    - Drop unused member `quirks` on `alienfx_priv` (remnant of another
>>      version)
>>
>> v6: https://lore.kernel.org/platform-driver-x86/20250127040406.17112-1-k=
uurtb@gmail.com/
>>
>> Kurt Borja (14):
>>    platform/x86: alienware-wmi: Add a state container for LED control
>>      feature
>>    platform/x86: alienware-wmi: Add WMI Drivers
>>    platform/x86: alienware-wmi: Add a state container for thermal contro=
l
>>      methods
>>    platform/x86: alienware-wmi: Refactor LED control methods
>>    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp method=
s
>>    platform/x86: alienware-wmi: Refactor thermal control methods
>>    platform/x86: alienware-wmi: Split DMI table
>>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>>    platform/x86: Rename alienware-wmi.c
>>    platform/x86: Add alienware-wmi.h
>>    platform/x86: Split the alienware-wmi driver
>>    platform/x86: dell: Modify Makefile alignment
>>    platform/x86: Update alienware-wmi config entries
>>    platform/x86: alienware-wmi: Update header and module information
>>
>>   MAINTAINERS                                   |    4 +-
>>   drivers/platform/x86/dell/Kconfig             |   30 +-
>>   drivers/platform/x86/dell/Makefile            |   45 +-
>>   .../platform/x86/dell/alienware-wmi-base.c    |  496 +++++++
>>   .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
>>   .../platform/x86/dell/alienware-wmi-wmax.c    |  790 +++++++++++
>>   drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
>>   drivers/platform/x86/dell/alienware-wmi.h     |  101 ++
>>   8 files changed, 1534 insertions(+), 1276 deletions(-)
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>>
>>
>> base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5

