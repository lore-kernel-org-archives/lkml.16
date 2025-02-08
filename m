Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360F32475E6;
	Sat,  8 Feb 2025 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739022886; cv=none; b=kVcFkjNIbbpY/HMjeyiPlDhJdTTmTeoMVoCguOWkWFEZp4tVQzMHMZfy4lGxTp7iHiu8++nGT1znLwRQ18HKn3h4OZ548HcgaM7WmSMMELq9aLt/jsvUDV0PAKpZcKWBceqG7Qu4FBMZcEZ09uu6KB2mk8edO7MzFvlqvVJIBao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739022886; c=relaxed/simple;
	bh=xAnjxESnAwa/zEVmWN3qdyx2toKtTQ2Wxc451Q+Vl00=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SLKOozHsjgB4r2NbM+WnR+TDgSBgHK13HUr1L20rJ1BuANFbw7DKEgrWTjPSNoPFhyCNe3MGFXio40KACsWH+yEAu663nfxSyct4N78SiN+nv1XVAAXn67qGwFlkPMN/gIcs6bm/ZbeyXyIu6r1aHWLMjF142cIRZrmU7W+xvU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMmTHfYA; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMmTHfYA"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6efe4e3d698so26892387b3.0;
        Sat, 08 Feb 2025 05:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739022884; x=1739627684; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAnjxESnAwa/zEVmWN3qdyx2toKtTQ2Wxc451Q+Vl00=;
        b=GMmTHfYAbo4oFraSc6muAxK+CTTswyNj7XKabY1u2YIC5YieN0l3XWGz5zTGTdUIVl
         YKLql5YG9caTkqOa7ABZwpXYICh6NSIDhI7WCLh8AQTcPeojjFCr7/zah0AQAQO9PRng
         F8cp2Fyqljpn7jkrp02E5OtqaQ6LTK4ChQ2GH+xn3o69jd+ZYTbFDkIIQmA9sWbiSDYZ
         JNlFDWMxSdeHD/TV/2a199H7ifMYIBlx+IYgvOFAnuxDsQ+tAf30wS6dwrQ8dBxtJ0fe
         7kpk5iUIx34hbn1Jbf81xaCGt8xQYUc6/OFf8XuaZfDZ4C7wwtfqNtDTKh3DFP3J2Cyq
         FNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739022884; x=1739627684;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xAnjxESnAwa/zEVmWN3qdyx2toKtTQ2Wxc451Q+Vl00=;
        b=ZWgEdupXzkCzp4FcXRCh5XpE9osXw8Oz8N8QL5cvz4Eaefj3aJ3HBmjzbjILCeaQvF
         fpXU2Kot+kQiirYBSkQhK3sUkxBvCRnfp+JF5GVImjWggCPdgEhIH0A6u02D1FwL5SrT
         /yc3JWdjhRu23xnkNTfHlF7qFbMg15kly8BUwtyKCVHaXEP58eyDkusk0Yw6642TIg4S
         nt6JR4+yeo/vC9ygQL69uiA/AcdJDinyFY9LjBIn/dxVbxXo/pUBiCw8+I7VHYspEJG2
         dJ3SinQVCZ88H77wiM/k/vRqMHGLdRUIV1rF9vSQimemRYe/jQtYjj/3GMWeQFSo9cpT
         RmkA==
X-Forwarded-Encrypted: i=1; AJvYcCWUDwXklX88ZAWEbw83SKTmahhX0z+WnU7OTWfV3fhpnqAm/cKhdBpy1uU/4ZEW7Zom6I5u/jsRcoLiAlGd0NKJPyuWzQ==@vger.kernel.org, AJvYcCX3h++EgwOiH1sC8uMWj4NfzaXGLAuYCriWgpQrejQPp9ax60IVM7CG4s+4m/kOFzeONZ8urDEyaDIm1tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IITaQOA7wRoaS/a6/VpWXY0fb2nkuXgZ8YHxqeA505+k0Mbt
	Zu+yqx+X6STtyw19shNwHdp1tNjuLFcD2TMR5Z87/25DhkSF7h7H
X-Gm-Gg: ASbGncsV3h1SoEj2CDPm7Fbl7uqlLrO5fQMGJyYLK4wHUx5Ep+ZJSgLgxWO83ZUlxzF
	xgDPJ3kEQi3pJWeRxSIkT3fwOFF4oUoLJqBYkCwSRdh1FQ/gnoeDmjbz9ynco5uxsZJSVya3GIX
	zE253M4/Scuuul4BlT3PugzY3gALyk7sZySb8jvr0OyjW4WB6/ClMbIhRoAE4eDWnUMKqCBaEe4
	2kjUQUYRbPT3uaLLUeErplov6EKz0rrfVkyhOdlWnsT7l0C+Bv8sBMVHzPy35TsNQGyNh4UzbRe
	I7KsgPw=
X-Google-Smtp-Source: AGHT+IGOaJ5arC6FSU5V0uffp8x+SN3pKuMwXOVseN1MUDK9eekzQzuekSYZqkNLJZhCzNkh5nCjJQ==
X-Received: by 2002:a05:690c:690b:b0:6f9:7921:480e with SMTP id 00721157ae682-6f9b280e465mr52260967b3.5.1739022884003;
        Sat, 08 Feb 2025 05:54:44 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ff6a2a0sm8984917b3.89.2025.02.08.05.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 05:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Feb 2025 08:54:41 -0500
Message-Id: <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Limonciello, Mario"
 <mario.limonciello@amd.com>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi
 platform driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
 <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
In-Reply-To: <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>

On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
> Thanks Kurt,
>
> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>> Hi Mark,
>>
>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>> When reviewing and testing the recent platform profile changes I had
>>> missed that they prevent the tpacpi platform driver from registering.
>>> This error is seen in the kernel logs, and the various tpacpi entries
>>> are not created:
>>> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>
>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>> called before platform_driver_register(&tpacpi_pdriver), therefore
>> devm_platform_profile_register() is called before tpacpi_pdev probes.
>>
>> As you can verify in [1], in the probing sequence, the driver core
>> verifies the devres list is empty, which in this case is not because of
>> the devm_ call.
>>
>>>
>>> I believe this is because the platform_profile driver registers the
>>> device as part of it's initialisation in devm_platform_profile_register=
,
>>> and the thinkpad_acpi driver later fails as the resource is already use=
d.
>>>
>>> Modified thinkpad_acpi so that it has a separate platform driver for th=
e
>>> profile handling, leaving the existing tpacpi_pdev to register
>>> successfully.
>>
>> While this works, it does not address the problem directly. Also it is
>> discouraged to create "fake" platform devices [2].
>>
>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>> instead, so ibm_init_struct's .init callbacks can use devres?
>>
>
> Yep - you're right. Moving it before the init does also fix it.
>
> I can't see any issues with this approach, but I'll test it out a bit mor=
e carefully and do an updated version with this approach.

Thinking about it a bit more. With this approach you should maybe create
the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you can
pass a NULL (*probe) callback) to avoid races.

platform_create_bundle() only returns after the device has been
successfully bound to the driver.

~ Kurt

>
> Thanks for the pointer.
>
> Mark

