Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623536F06B;
	Mon, 10 Feb 2025 03:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739158138; cv=none; b=EylXC8P+lgUGl9ut4wKjtF8/HrTyw8jZNSBUfwokG97+iRel+JFlTBKu8RP2e27zT+Ym2lYcIN3RjxLfZKV2gfuPrQeMtp0a1E5F0PSFojvPAsA5Kf6eBT03jfmDVj/BzDaZ1KuSJK29/z9Jq4upvzZ4XUDqffJfGW4SwflnxRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739158138; c=relaxed/simple;
	bh=s8HIviLGBCxcnTXxbFiULMIXYMUSERiKD1iGALMJf7Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mh+kMktsQqqbCBXs07DSebqU2y37lcotE45d+MhnmjIkuy83RCy5UZAjCxXkzd8gSr/5wG6+JFbf+EpJqA8og8gAZTw7xoPpoSYB0FLpXpoWT5ZypgrhpbRFikSbKEdxNEWiXANl5zs5SDX3muNDnOPBH5LzWVzUTqUPuSOxFSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7DOnfOI; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7DOnfOI"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e5b1c7c31b2so3132760276.1;
        Sun, 09 Feb 2025 19:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739158134; x=1739762934; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdOdxFHLUU3SPRuR7sHE08f1zBkDt0I0lCIZf1H7/SU=;
        b=L7DOnfOIHE2e12D/NZoWvHlSWMplM9sJg8r4cBFijO8zr7tC5VfvxKDq12HHzTUvS1
         if3XipcTQ6Sty/JvC4g2vvLAI1j+P+b15wYncISgIji/qsxgV0gZ+Xc0HpGNrY4jiZcF
         X+dflO6VHDK0hwuZNRL2G+Q8escK1VIBZ4icTSTI8V/6igeKHm7CSDJdOLqnoTdm9B+z
         uwZr8nQr7LYcIfibDWJoEyQgYYjr4TFsrnVT4QV/nRgq0Nu6wE0DiU/v3BUACg1DULE2
         YwlHdHhZFe0x33VJkYDdBHEUlBSqVzhNEPT1CxKx20ozkUs9IVsLI9XqBKWtBJHNAafz
         5BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158134; x=1739762934;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KdOdxFHLUU3SPRuR7sHE08f1zBkDt0I0lCIZf1H7/SU=;
        b=KbJKnef8oAQBtS7gh7SRwsUP8Tm9JjUqML+Iij7zQVV0rZum/X8huEJIqLCZlQQ179
         x1s2MlASUnf+HHd0nDlyjCb6BaW+JDBBpi/Yl8qG3ajRYlF/HffBNhh1ehl2tfqAmYJH
         J9EYz3RUxRqalNT9QPbUenjOkP9fAM1HIOSlQ2YS4oEm9ap+pS1/5FtMNFr611daNOcN
         xPuGHIMBjRbM1VMOZ0yFPbEKkKf73hMKaBoOGJW4asF4I4o4QJyDTakAgb2bUVfQ70x0
         YXI34X/me8Eu/AWJHUuPF0bzU1ewiP3VoEaTm/BsWq1pKKEnCEMvFLbbwzPiEIV1hutA
         LaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ26P3eRIV92z2PYriEEPqPXJt2MzON9T6wYM/8MXqNuMiQ3z0N/t/fh5Yx2/baq09PBtds3qbGkd/tEc=@vger.kernel.org, AJvYcCXRzbSske1V07AGQ0ta3FJ3k60UQ4UtKsiwrVv8nfSGZTvomUMqmjrxngYT6CKHqnrkleYQtiGg/2oqZAthW7DBHvamtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOafHZvIBTfEh6U08s/D7j1irWw0GCm5VlYooul0v3kCswmR2
	5S+Oy71CIBHOe0rX8QNLNs4SLz9ToyDkKovCR6X1VzKjDO+koGan
X-Gm-Gg: ASbGncujcMylNCFwEWSLsZHPnBiVS8P7kr53YwsWCfefYjgou6eFT8xPtC/OhZ31nVE
	qVFl2l6OW2nIM34R0J4GXWXTIwrpTd2AOcQNtu0NWBoNGXsa0d/EuuxWGQfacu1LbypFMII/ZMw
	Xf5sjJRBa3rbIMQCUSTQPGdZ/8WzYF+0vpJWWT+WpUkL1UJT6JLdwMtC0zGY8wlQtxKKDwDDY0c
	AyA5o5vUIKbaK4oYofqQCp5bVgpnJBtesGeHZdmHZXeUNsd20edYVXui/6wtJ1RF/LnsM2r+bKc
	gZLeCOM=
X-Google-Smtp-Source: AGHT+IHwfmmlWN9zLouV4XC8LZmM49HAFOpBoX/jFEjZZ/Gp4qeY/w/DRtEH6RBbobVCvjSqNjSLbQ==
X-Received: by 2002:a05:6902:986:b0:e38:d040:eeed with SMTP id 3f1490d57ef6-e5b46c7f0e7mr9581082276.15.1739158134191;
        Sun, 09 Feb 2025 19:28:54 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a205e82sm2309913276.23.2025.02.09.19.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 19:28:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Feb 2025 22:28:51 -0500
Message-Id: <D7OG3RQ7HSH0.1V6FHLWMNC5BW@gmail.com>
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
 <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
 <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>
 <D7ODBVBQFOGF.BV2A80SGPAYK@gmail.com>
 <80307204-c401-4411-aa2a-3df7e11a45ce@app.fastmail.com>
 <D7OEFLKWR8VN.247WSBSGFSD2X@gmail.com>
 <f9047afd-d395-4733-a953-b7efa56e66c5@app.fastmail.com>
 <D7OFLD408BZP.OV2OTU16TAD8@gmail.com>
 <10339f70-f56c-4ea3-874e-765bc8d63340@app.fastmail.com>
In-Reply-To: <10339f70-f56c-4ea3-874e-765bc8d63340@app.fastmail.com>

On Sun Feb 9, 2025 at 10:14 PM -05, Mark Pearson wrote:
> On Sun, Feb 9, 2025, at 10:04 PM, Kurt Borja wrote:
>> On Sun Feb 9, 2025 at 9:35 PM -05, Mark Pearson wrote:
>>> On Sun, Feb 9, 2025, at 9:10 PM, Kurt Borja wrote:
>>>> On Sun Feb 9, 2025 at 8:26 PM -05, Mark Pearson wrote:
>>>>> Hi,
>>>>>
>>>>> On Sun, Feb 9, 2025, at 8:18 PM, Kurt Borja wrote:
>>>>>> Hi Mark,
>>>>>>
>>>>>> On Sun Feb 9, 2025 at 7:54 PM -05, Mark Pearson wrote:
>>>>>>> Hi Kurt,
>>>>>>>
>>>>>>> On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
>>>>>>>> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>>>>>>>>> Thanks Kurt,
>>>>>>>>>
>>>>>>>>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>>>>>>>>> Hi Mark,
>>>>>>>>>>
>>>>>>>>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>>>>>>>>> When reviewing and testing the recent platform profile changes =
I had
>>>>>>>>>>> missed that they prevent the tpacpi platform driver from regist=
ering.
>>>>>>>>>>> This error is seen in the kernel logs, and the various tpacpi e=
ntries
>>>>>>>>>>> are not created:
>>>>>>>>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before=
 probing
>>>>>>>>>>
>>>>>>>>>> This happens because in thinkpad_acpi_module_init(), ibm_init() =
is
>>>>>>>>>> called before platform_driver_register(&tpacpi_pdriver), therefo=
re
>>>>>>>>>> devm_platform_profile_register() is called before tpacpi_pdev pr=
obes.
>>>>>>>>>>
>>>>>>>>>> As you can verify in [1], in the probing sequence, the driver co=
re
>>>>>>>>>> verifies the devres list is empty, which in this case is not bec=
ause of
>>>>>>>>>> the devm_ call.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I believe this is because the platform_profile driver registers=
 the
>>>>>>>>>>> device as part of it's initialisation in devm_platform_profile_=
register,
>>>>>>>>>>> and the thinkpad_acpi driver later fails as the resource is alr=
eady used.
>>>>>>>>>>>
>>>>>>>>>>> Modified thinkpad_acpi so that it has a separate platform drive=
r for the
>>>>>>>>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>>>>>>>>> successfully.
>>>>>>>>>>
>>>>>>>>>> While this works, it does not address the problem directly. Also=
 it is
>>>>>>>>>> discouraged to create "fake" platform devices [2].
>>>>>>>>>>
>>>>>>>>>> May I suggest moving tpacpi_pdriver registration before ibm_init=
()
>>>>>>>>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Yep - you're right. Moving it before the init does also fix it.
>>>>>>>>>
>>>>>>>>> I can't see any issues with this approach, but I'll test it out a=
 bit more carefully and do an updated version with this approach.
>>>>>>>>
>>>>>>>> Thinking about it a bit more. With this approach you should maybe =
create
>>>>>>>> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you=
 can
>>>>>>>> pass a NULL (*probe) callback) to avoid races.
>>>>>>>>
>>>>>>>> platform_create_bundle() only returns after the device has been
>>>>>>>> successfully bound to the driver.
>>>>>>>>
>>>>>>> Unfortunately having a null probe callback doesn't work - you end u=
p with an oops for a null pointer dereference.
>>>>>>
>>>>>> Are you sure? I just tested this on the for-next branch and it works
>>>>>> without issues. Also checked the code and (*probe) is only dereferen=
ced
>>>>>> safely inside platform_bus_type's probe. Maybe another pointer is be=
ing
>>>>>> deferenced? Keep in mind that platform_create_bundle() also register=
s
>>>>>> the driver so maybe there is an issue there.
>>>>>>
>>>>> Possibly - I have to admit I didn't go dig too hard, as when I added =
it I got:
>>>>>
>>>>> Feb 09 19:41:17 x1c12 kernel: BUG: kernel NULL pointer dereference, a=
ddress: 0000000000000028
>>>>> Feb 09 19:41:17 x1c12 kernel: #PF: supervisor read access in kernel m=
ode
>>>>> Feb 09 19:41:17 x1c12 kernel: #PF: error_code(0x0000) - not-present p=
age
>>>>>
>>>>> With bus_probe_device in the backtrace - and went 'oh well'.
>>>>>
>>>>> Are there any significant advantages to the approach that make it wor=
thwhile debugging further what is going on? Moving the platform_driver_regi=
ster is working nicely :)
>>>>
>>>> Now that I think about it maybe there is no significant advantages, at
>>>> least in relation to
>>>>
>>>> 	[ 7550.642171] platform thinkpad_acpi: Resources present before probi=
ng
>>>>
>>>> because list_empty(&dev->devres_head) is checked synchronously.
>>>>
>>>> However, now the null deref worries me, because some sysfs groups are
>>>> created on driver binding. Do you have the full backtrace? Just to be
>>>> sure moving driver registration doesn't mess with anything.
>>>
>>> Oooops...
>>> I didn't have the trace (at least that I could find) but I figured it w=
ould be easy to recreate it.
>>> Went to make the change again...and realised what I had got wrong.
>>> I needed to replace:
>>>         tpacpi_pdev =3D platform_device_register_simple(TPACPI_DRVR_NAM=
E, PLATFORM_DEVID_NONE,
>>>                                                         NULL, 0);
>>> with=20
>>>         tpacpi_pdev =3D platform_create_bundle(&tpacpi_pdriver, NULL, N=
ULL, 0, NULL, 0);
>>>
>>> (previously I had replaced the platform_driver_register...sigh)
>>>
>>> With the change done, I think, correctly - no oops and everything is wo=
rking.
>>
>> Good to know!
>>
>> I'm going through the sysfs groups attached to the platform device and I
>> noticed some attributes may depend on subdrivers being initialized
>> first. If this is the case, ibm_init() has to be called inside the
>> platform driver probe for this to work. Like this:
>>
>> static int tpacpi_probe(struct platform_device *pdev)
>> {
>> 	/* Input init */
>> 	...
>> 	/* Subdrivers init */
>> 	...
>> 		ret =3D ibm_init(&ibms_init[i]);
>> 	...
>> }
>>
>> static int __init thinkpad_acpi_module_init(void)
>> {
>> 	...
>> 	tpacpi_pdev =3D platform_create_bundle(&tpacpi_pdriver, tpacpi_probe,
>> 					     NULL, 0, NULL, 0);
>> 	...
>> }
>>
>> Of course this complicates things, so another approach is to just use
>>
>> 	platform_profile_register()
>>
>> instead of the devm_ version.
>>
>> Of course, the first approach has the advantage that devres is now
>> usable, so I'd go for that, but that's for you to decide.
>>
> Hmmmm.
> I'd like to get a fix in so anybody updating to 6.13 don't get hit (the F=
edora users will be getting it soon and Arch users are likely seeing it alr=
eady).

Thankfully Arch does not distribute rc versions.

>
> I think I'll do a fix tomorrow using the non devm_ version as that's safe=
st; and then take a bit more time with implementing a probe with the approp=
riate pieces.

I agree!

>
> Thanks again

Thanks for fixing it. This one is on me, I naively assumed the device
was alread bound.

--
~ Kurt

> Mark

