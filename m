Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E8C10942;
	Wed, 30 Apr 2025 03:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983045; cv=none; b=Uk7acXbsYvJS5vs8vm5qJLak2FkRMPsU4EAlrv82I0XLy4x8XpnPP82WgrpJNvyreyG/pK2Liy6RhdHpUSvUfxfedSDW6KZvILQIyu1iwdux5cTmQvYtNKU6zdUZNphuVNG4mr5Cu8O/Z3TG/BNVA606fPgI3sM1jnHdp8UTjFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983045; c=relaxed/simple;
	bh=Dy6RslWAapziwYuPaZXt+A1N7hLhyka+qiw+1R5MgaQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=H46+5SItFzBRGbxm+QMmaI4er0ZkpyRy6QuF8o9+iCfs6LYfKu3VKQt1zATHLcn+fD0cI795kr70kOeu5PNXMCQRURnde2DJzn2839k+GyBbBtWs49mf7d4ViKTH7srvXc3WonE4iQ/21JRlHyq+FPZ37X8TfXS7j6UMelOgryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQfYkgoz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQfYkgoz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224100e9a5cso82401125ad.2;
        Tue, 29 Apr 2025 20:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745983043; x=1746587843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=inU9ASpYbk2lB9BhSGSK8I5cPkhs7ENWIaTctsEzdC4=;
        b=VQfYkgozjXUxH7deufpW/U7p7NH3Rh51AzWLqlT22+gM6MA6TCTH3SU7I0qwc+MTOY
         YFuGpT7CMumpkzh12moLJ3KSqM8w7be66RoHUGmHKd1WSK9Ke0MHz2ZiYGFtLCPhbwys
         ydLEsBtTGsgqLuVVrLLD7zUm+5O8qyQTOUoRjgIKILBcNxn6kZw/8x8Xui6UY4/tlwWX
         J6voFKa5WPMBSXVKwj0kAoGf8xufft4vKj5HoYzTOAWRyAgzOZkCDiLGUAd1RPb43UA5
         Uo6B3mL4rjqDkzHUvB4IcuTjjluxsymptK3I6UG40q8ySHP+ezZF2hRfJ8F9rApTQ8GH
         pf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745983043; x=1746587843;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inU9ASpYbk2lB9BhSGSK8I5cPkhs7ENWIaTctsEzdC4=;
        b=EXHUoSD6sy2DLqdcYDvB9HgVstXjciLpC4VIqfh+LeafXHCQmHmRhCBMRzmbdlf4uc
         2deFZSLb4NjN/bh5cZJnTNstoB189FEc0f7FG743yBoeQ08jdRA4ippExxW40UO4fUV9
         TqNO0rjFMox+5jInBUfxPSqp8Umx2NkG/r6UnSV9bbUA8RLs5jZA5s7wIKG535G2HL/Q
         E3c3ezmsD3szOKUEhs4ZvrFjODoMxzBKRB/5M0WtEcRu3V9msUNWuYaGybGFvAlnKPCQ
         JUdx3X4STOXlYE5YZL77xPTvkNVRo/5enX7ltzOHj1oFh6nLEm3c2ZRVZNWHH9fQFjWV
         wJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCV951c1lD7IJPlxE3WzVIa0NaNFuSn05maj3AFdsjij7yHcHnGQ+UuJuNAB9nb+Q1PRmurxSUM8HOrsU3o+@vger.kernel.org, AJvYcCVQtQ1+t5/TB4FgG8vwINwfcuWMMSWtn0+yv/kiil3z2gzUA1p7a52a7w+Rj/omCpaRBx6lCFpDtPo=@vger.kernel.org, AJvYcCVRc0Kz6YVynIFAXoG/Co8e274q5DT+uazLnl5kYumuxrnMBrRCzXTGXXTDLHakvzIZyiumIqzWnAmZ7oU4IX4E6v7h8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx09UAiZrNddYiS2N489E8RGZfDNpPyZJaNZcMN3i4PyIfJeSur
	MJ+V9DOx8wIdJN61zNLEJ0uVR1TIBnDM5QocdsnovCEFtT1DREn5
X-Gm-Gg: ASbGnctc1DoWpOyIY4nKdf73Vm941YIvVgXxUE2Mi8SdnNHIbDOwTBdpTEgXgeedWY/
	Bu9Qt/QICWbaku4MQfyYfH14FTkZ0t2zHPf9MIOQuHUct95tGRNKcBdvr9f9ytISi0ZujxXU/e9
	SNVxwyMKMuC5Y9FI9Fe5YgJ5/PVJmyQHe23auo4xKRUAPf2Id3sa6YWCjsv+33ARQEgCH+tkEBK
	IfiUCuT92mMptEV5UYSncEVJvFmfd/Wl/IUeIKf+QMvjBObJJvB2EsNpXzvuH9Zcp1OK7dvGxwm
	r+dqZPQEmC0K6d23QLkfokIZE62x3FyomomLJIT27b6EfZj017Pe2Iy2S2A=
X-Google-Smtp-Source: AGHT+IFT22G+H+nkoY3Q8irxKHk7yvrJR7IkfIVZhv1tAxhTDluctW/JekPdmM3OgkeCdvW4mepAbQ==
X-Received: by 2002:a17:903:17c7:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22df34fb4b3mr29367535ad.28.1745983042799;
        Tue, 29 Apr 2025 20:17:22 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb90:8ee3:c96c:ad2:9358:5231:4c28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51009dasm110871935ad.163.2025.04.29.20.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 20:17:22 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:17:18 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Hans de Goede <hdegoede@redhat.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 2/6] platform/x86: Add Lenovo WMI Helpers
User-Agent: Thunderbird for Android
In-Reply-To: <b9db2d5f-2169-454f-a4e8-719342ef74cc@oracle.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com> <20250428012029.970017-3-derekjohn.clark@gmail.com> <b9db2d5f-2169-454f-a4e8-719342ef74cc@oracle.com>
Message-ID: <3BF1E193-F115-47F6-8412-895A39A27289@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 28, 2025 12:36:03 PM PDT, ALOK TIWARI <alok=2Ea=2Etiwari@oracle=
=2Ecom> wrote:
>> diff --git a/drivers/platform/x86/lenovo-wmi-helpers=2Ec b/drivers/plat=
form/x86/lenovo-wmi-helpers=2Ec
>> new file mode 100644
>> index 000000000000=2E=2E2df0408e2a9c
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-helpers=2Ec
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: GPL-2=2E0-or-later
>> +/*
>> + * Lenovo Legion WMI helpers driver=2E
>> + *
>> + * The Lenovo Legion WMI interface is broken up into multiple GUID int=
erfaces
>> + * that require cross-references between GUID's for some functionality=
=2E The
>> + * "Custom Mode" interface is a legacy interface for managing and disp=
laying
>> + * CPU & GPU power and hwmon settings and readings=2E The "Other Mode"=
 interface
>> + * is a modern interface that replaces or extends the "Custom Mode" in=
terface
>> + * methods=2E The "Gamezone" interface adds advanced features such as =
fan
>> + * profiles and overclocking=2E The "Lighting" interface adds control =
of various
>> + * status lights related to different hardware components=2E Each of t=
hese
>> + * drivers uses a common procedure to get data from the WMI interface,
>> + * enumerated here=2E
>> + *
>> + * Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> + */
>
>add a space after "Copyright" before "(C)"=2E
>Copyright (C) 2025
>
>> +
>> +#include <linux/acpi=2Eh>
>> +#include <linux/cleanup=2Eh>
>> +#include <linux/errno=2Eh>
>> +#include <linux/export=2Eh>
>> +#include <linux/module=2Eh>
>> +#include <linux/wmi=2Eh>
>> +
>> +#include "lenovo-wmi-helpers=2Eh"
>> +
>> +/**
>> + * lwmi_dev_evaluate_int() - Helper function for calling WMI methods t=
hat
>> + * return an integer=2E
>> + * @wdev: Pointer to the WMI device to be called=2E
>> + * @instance: Instance of the called method=2E
>> + * @method_id: WMI Method ID for the method to be called=2E
>> + * @buf: Buffer of all arguments for the given method_id=2E
>> + * @size: Length of the buffer=2E
>> + * @retval: Pointer for the return value to be assigned=2E
>> + *
>> + * Calls wmidev_valuate_method for Lenovo WMI devices that return an A=
CPI
>> + * integer=2E Validates the return value type and assigns the value to=
 the
>> + * retval pointer=2E
>
>assuming you meant to refer to wmidev_evaluate_method, the real function
>typo wmidev_valuate_method -> wmidev_evaluate_method
>
>> + *
>> + * Return: 0 on success, or an error code=2E
>> + */
>> +int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 me=
thod_id,
>> +			  unsigned char *buf, size_t size, u32 *retval)
>> +{
>> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +	union acpi_object *ret_obj __free(kfree) =3D NULL;
>> +	struct acpi_buffer input =3D { size, buf };
>> +	acpi_status status;
>> +
>> +	status =3D wmidev_evaluate_method(wdev, instance, method_id, &input,
>> +					&output);
>> +
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	if (retval) {
>> +		ret_obj =3D output=2Epointer;
>> +		if (!ret_obj)
>> +			return -ENODATA;
>> +
>> +		if (ret_obj->type !=3D ACPI_TYPE_INTEGER)
>> +			return -ENXIO;
>> +
>> +		*retval =3D (u32)ret_obj->integer=2Evalue;
>> +	}
>> +	return 0;
>> +};
>
>Thanks,
>Alok

Ack all=2E Thanks for taking a look=2E
- Derek
