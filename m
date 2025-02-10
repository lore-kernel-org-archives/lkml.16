Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB6EEAA;
	Mon, 10 Feb 2025 02:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739153421; cv=none; b=GWqVhrIsoSHHR2gCZvvXdxcKP7WagN9ddYFovPF06e8NcVhqqT3hF2ieGgs7sgjlIjSdh9YgtTF97J6OLoFRHhjG98CY1zWyQLsZXIxfM89hFZqq+ykBqEto+JOfwss6rxVRwEepdvwfrKzWFVkt1rzQXq12j133rfckyouBAmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739153421; c=relaxed/simple;
	bh=5KKTjkwHOmt/QsnDtJ3cuFzWnzoNrMJqeDmdA2fekcQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=NecrbdKZ4giFJQMXi/k2gdSmE24O83qLV8crKPnzVk94AoL7uB+1BEPtMa2eycznLXfwCPExASwz2rJs3CZGIv0z0VKStMZBlRQKouIx6TtaBNsOC7RQF3VHuKc7D6qEOD7OyEDFb/vfxWjLJkou0QSz8qXkV0FqRgDcNpFKqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXYtjvSm; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXYtjvSm"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5b107c4346so3029850276.2;
        Sun, 09 Feb 2025 18:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739153419; x=1739758219; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bG+HK0jtIwzRddK3uxO/dWjh70T7xBLadOwbrgNxekY=;
        b=AXYtjvSmaW/RpxYbfJBJOI2RO4AoizmnIrHmN4lXNF1Ne4xxnXmHTyOeYqO+IIs+jb
         Uzy16oBILjflJ7ovhcoD2GEOAvw4KlvxOKY7Je3deYXPPI/Qjg28uXlNMmYutr+868kq
         9NbGPHiudg0RF2+CCgueNHjPdyK+08Zm6MxUBWZ0iBz9ULWXOh4gwb5bdTpg6GLx7ydH
         +puivbipzX6T1juAjBUuoaFFq0fmcHCcoiAkq3n9lcvHulkkwLPqm8SMVQdJU2CgOwR9
         PFi2mAYpzBdSKFp141AX4Gf+youkkvG0r4QZCCZC5OJDtUZZxhldWCDlk9kBlQ376oud
         VXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739153419; x=1739758219;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bG+HK0jtIwzRddK3uxO/dWjh70T7xBLadOwbrgNxekY=;
        b=ZONnK5a9mJhxf3yR3VLlAeOwOaJfKIdiZ7vkvb1MJ7pJvYSgiCORwm1NnbLhkyfikV
         mqxHmlsu3g2jIsm31+cTrcvyGwJOhvYeM6ZmY5BNBtRIXFPFRum/GO/ohQynK+AHsam6
         qFgRXpUmPkLgSB7r1ZkEY9eF0PUVRjc29i3fBZV0b7MAoBXV645VfJBVpK1/DedXXtxE
         OfSYIx/7/NEO4O4E762PjsGbCrurgVrJVuZKl4Tie6vX3rNtOzoAyHBwWR1KJsTshRMr
         +IS7Zj0CCAkon4Ds5s6P0z1xtRGmQOJF7DIcWuZCmAbWJRzroqnIgDJjuMqOO+vW/hEP
         4NCA==
X-Forwarded-Encrypted: i=1; AJvYcCWiNBJ5uWE/fOJ3XhO68eR2y66j7MnCACgn80dyQFdx2wVPYijKRrV8bLUBd4KrGMpCHR98sXbF6T/XeycG0XlMMn0Tew==@vger.kernel.org, AJvYcCXFCa8HCJudP/HWdeCBZm+sdZmPpfSq4GfBsbOlntaWEwZdhtpgMA9/nqZoG74d7XsZWFMzkcjAiI98P/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDi+4LT4puuldHpG4paciU/dWdrPyAB8YsZkDmhLEsHQa1yHlO
	UtBY78Z24Hsnzu9vUSfwJVD9eqkQbZSj1fkMxoOX487D8KKWsPje
X-Gm-Gg: ASbGncsJLZ7ttyEXQnqU+JdkE7sZwth8c5fwzQj3WHUKHBxbdAhYuMhj9hceli0LvQx
	6l9fE+Nm09gETuJDsfS/WUWsgpOk/gAfY9NBBAVY9Qwt9bz8zq4JrgB+Udf8I64gWEHdxf8AM53
	90RH2t2ryGboJLM3w72PWFsxwkm/rk63l9duEOqGhfNADBrgTMiMuRPj5NWxmm63yMD9m2557gw
	mRXgiAd3Fdv0lrknxg06YaMy+xpILjgBaq2xi1yVQg2WOyoC0MqP4UUP+Yj16E5785GFBMG/c+9
	n2F7Zcs=
X-Google-Smtp-Source: AGHT+IEX37ii7cPEO3UmF1R/Wyd5qQP304usJPcL6z8wNbug/pesfVyGPIgIz/MDxKJRmjBTRaWsfg==
X-Received: by 2002:a05:690c:62c8:b0:6f7:406e:48d with SMTP id 00721157ae682-6f9b2a19ff1mr111684637b3.35.1739153418892;
        Sun, 09 Feb 2025 18:10:18 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd550casm14530427b3.50.2025.02.09.18.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 18:10:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Feb 2025 21:10:15 -0500
Message-Id: <D7OEFLKWR8VN.247WSBSGFSD2X@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Limonciello, Mario"
 <mario.limonciello@amd.com>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi
 platform driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
 <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
 <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
 <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>
 <D7ODBVBQFOGF.BV2A80SGPAYK@gmail.com>
 <80307204-c401-4411-aa2a-3df7e11a45ce@app.fastmail.com>
In-Reply-To: <80307204-c401-4411-aa2a-3df7e11a45ce@app.fastmail.com>

On Sun Feb 9, 2025 at 8:26 PM -05, Mark Pearson wrote:
> Hi,
>
> On Sun, Feb 9, 2025, at 8:18 PM, Kurt Borja wrote:
>> Hi Mark,
>>
>> On Sun Feb 9, 2025 at 7:54 PM -05, Mark Pearson wrote:
>>> Hi Kurt,
>>>
>>> On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
>>>> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>>>>> Thanks Kurt,
>>>>>
>>>>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>>>>> Hi Mark,
>>>>>>
>>>>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>>>>> When reviewing and testing the recent platform profile changes I ha=
d
>>>>>>> missed that they prevent the tpacpi platform driver from registerin=
g.
>>>>>>> This error is seen in the kernel logs, and the various tpacpi entri=
es
>>>>>>> are not created:
>>>>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before pro=
bing
>>>>>>
>>>>>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>>>>>> called before platform_driver_register(&tpacpi_pdriver), therefore
>>>>>> devm_platform_profile_register() is called before tpacpi_pdev probes=
.
>>>>>>
>>>>>> As you can verify in [1], in the probing sequence, the driver core
>>>>>> verifies the devres list is empty, which in this case is not because=
 of
>>>>>> the devm_ call.
>>>>>>
>>>>>>>
>>>>>>> I believe this is because the platform_profile driver registers the
>>>>>>> device as part of it's initialisation in devm_platform_profile_regi=
ster,
>>>>>>> and the thinkpad_acpi driver later fails as the resource is already=
 used.
>>>>>>>
>>>>>>> Modified thinkpad_acpi so that it has a separate platform driver fo=
r the
>>>>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>>>>> successfully.
>>>>>>
>>>>>> While this works, it does not address the problem directly. Also it =
is
>>>>>> discouraged to create "fake" platform devices [2].
>>>>>>
>>>>>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>>>>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>>>>
>>>>>
>>>>> Yep - you're right. Moving it before the init does also fix it.
>>>>>
>>>>> I can't see any issues with this approach, but I'll test it out a bit=
 more carefully and do an updated version with this approach.
>>>>
>>>> Thinking about it a bit more. With this approach you should maybe crea=
te
>>>> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you can
>>>> pass a NULL (*probe) callback) to avoid races.
>>>>
>>>> platform_create_bundle() only returns after the device has been
>>>> successfully bound to the driver.
>>>>
>>> Unfortunately having a null probe callback doesn't work - you end up wi=
th an oops for a null pointer dereference.
>>
>> Are you sure? I just tested this on the for-next branch and it works
>> without issues. Also checked the code and (*probe) is only dereferenced
>> safely inside platform_bus_type's probe. Maybe another pointer is being
>> deferenced? Keep in mind that platform_create_bundle() also registers
>> the driver so maybe there is an issue there.
>>
> Possibly - I have to admit I didn't go dig too hard, as when I added it I=
 got:
>
> Feb 09 19:41:17 x1c12 kernel: BUG: kernel NULL pointer dereference, addre=
ss: 0000000000000028
> Feb 09 19:41:17 x1c12 kernel: #PF: supervisor read access in kernel mode
> Feb 09 19:41:17 x1c12 kernel: #PF: error_code(0x0000) - not-present page
>
> With bus_probe_device in the backtrace - and went 'oh well'.
>
> Are there any significant advantages to the approach that make it worthwh=
ile debugging further what is going on? Moving the platform_driver_register=
 is working nicely :)

Now that I think about it maybe there is no significant advantages, at
least in relation to

	[ 7550.642171] platform thinkpad_acpi: Resources present before probing

because list_empty(&dev->devres_head) is checked synchronously.

However, now the null deref worries me, because some sysfs groups are
created on driver binding. Do you have the full backtrace? Just to be
sure moving driver registration doesn't mess with anything.

I apologize for turning a quick fix into this :p

--
~ Kurt

>
> Thanks
> Mark

