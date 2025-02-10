Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601446B8;
	Mon, 10 Feb 2025 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739156694; cv=none; b=TWMKFZaoi5soneWYcyHIJ66nvNSHK94cdh01GeJ4lKTmJpZUWWwjEmhDg8glFt6ZS4d4GVlAa/17SzijZO/xOuXVE0FustkXCGksLAmHMfRsgOlF8O5ALHID5+WNFY6Pgx11O06mKYWEeHA0KwnRAPKv7E9T8CLeX/1FVtnHH6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739156694; c=relaxed/simple;
	bh=Uuoq8cj0gcXS25jbBlEj/X8QkXvdHHp0jIE6D5MyJA8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=t23JZIvNwQcPnsvsXkzAW6f+fEdHRV5i2bcLJzWaA6yFjIJrRHc61lAvbT/wyfgCKu3etFMCxaXAfMVj5QAbjp4vxXbVFVBONaNl0BqL4qlcdFpYtQGP42PwzHdcOG+CycT7wjNzlSKZB2GNMlTO9P1kaw2wxZdSJwwyCSO9rCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmuxoP+1; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmuxoP+1"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e5b16621c28so2932219276.2;
        Sun, 09 Feb 2025 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739156691; x=1739761491; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DlCl8opq3AmclCjTEqQZ5L7rWms20yBTto3+k35qPU=;
        b=lmuxoP+10U6XrP6h49YuMMt7UrK3xs7DVQ3AQa0zLw1W+AII3MMAbpuWLW15fJJT4K
         U6kZQ69Q/AyzxsCJgZ9UEgVPp79V6Rzv4Hv1J70mf1crs3icfPUx8c9pbXpS1TvEehSK
         pE5hEDdaRIDpXvr1Ls5+cMo8Mvz8HKB94MWfgOPQeMErwgcTxWgcc3XtH7NLcUp8EbrK
         VIwKD+8t5HOQduQeU6yAjN9xrRhJBGMbeGj2K+U+/xUiZceD82nBU/AkbP6KSyFItRd7
         ofmIdtvwAHLPle5ud93TkQmiIA57VYzGLvHZd5KY5/jWDP1hVmpDQzxV7jdAXUb2SgPP
         3eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739156691; x=1739761491;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3DlCl8opq3AmclCjTEqQZ5L7rWms20yBTto3+k35qPU=;
        b=e8FxMu/QsXXVZbujzPsArkM938ftae5PH4VuEFkewbxM5fd//4WttLSKuM16oZcjxC
         eO19guGDv0b/UbwccmDJwzq5TZd3FOGY1n4XV8yvV5Nck9MWbRnxesI0nQeyIOX7f4x7
         nK/u2IuuQXo61hyKmbhlKgOiJdedrrMcYbTP9Wy/WDAjY6Cd2qjht7Hz+n2fsDorxO83
         7z1r7k+p003UB8UQg8MYm3kOp3KaPzVXA1tUF79YBuvIX1Ax/IToIdLIBXEzDSFHemhZ
         8xty9HRjudf/IIhVr3XQXrSC6wFrcoxRGlx6qr5bkaPa/Nvr0b0Dz7V0SSgib0pfop/t
         nG1A==
X-Forwarded-Encrypted: i=1; AJvYcCU8LFXDgz7QcBrWEdSNVL+wmmnEFdP0dxOXiBS6E/mPCeYhURw2zFFrInx5Z2xwe5pHikCtaqCQLSH3Nhs=@vger.kernel.org, AJvYcCViX/I4Qae454rz7+Kzw8umANeYAWQWzioDQyXoKbhW0ejYMjVgzhTJfOEj68e0bk/AnxH/9xkFG7W+GuPXvCdyeqr+sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfO/esXPcRpT6A64wVe1iqll2w9Wu1fudtspXJ9MDIIWKr0eOP
	O8DCN2o3WN1S2UTkW7Zne709EhypQsqwz6Cv8DMzh4d/P+yOntTZ
X-Gm-Gg: ASbGncuSH94oFRbw0qjnxQtLoj05wspLJnoosIIE0U7qwjDy5nfjKtdFY1/aOZunpLR
	Mm09ZTwprvo28VCsAMrWTFfPLtIPu7jjE6CylLuuw4arB1NynvVR9wEMxSamzit4d0m8c7FYDl5
	r7O9iYedku6VPDH129k7VYNYGOOttXbqTzzqfZ4sZFdkNH/bNH/JxqZFJWi91kN5Wl/zXn05Rpa
	6+w0pB8nt2OB28Uu3fjzamxIiek9X0UOWCrLuDinC2vVU+hy6yYc+5QWwsl9T62e4WMdYWYoJ81
	6c5ULac=
X-Google-Smtp-Source: AGHT+IEMJw+qAlME3NL5LNghHQ5IEdxIrL1zO9Oirl04s/GeiBxsvsV5R+DFGURvNbgR9OpdD7sxFQ==
X-Received: by 2002:a05:6902:1702:b0:e38:8263:7990 with SMTP id 3f1490d57ef6-e5b4629dbdcmr9738559276.48.1739156691209;
        Sun, 09 Feb 2025 19:04:51 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a207eecsm2302922276.24.2025.02.09.19.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 19:04:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Feb 2025 22:04:48 -0500
Message-Id: <D7OFLD408BZP.OV2OTU16TAD8@gmail.com>
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
In-Reply-To: <f9047afd-d395-4733-a953-b7efa56e66c5@app.fastmail.com>

On Sun Feb 9, 2025 at 9:35 PM -05, Mark Pearson wrote:
> On Sun, Feb 9, 2025, at 9:10 PM, Kurt Borja wrote:
>> On Sun Feb 9, 2025 at 8:26 PM -05, Mark Pearson wrote:
>>> Hi,
>>>
>>> On Sun, Feb 9, 2025, at 8:18 PM, Kurt Borja wrote:
>>>> Hi Mark,
>>>>
>>>> On Sun Feb 9, 2025 at 7:54 PM -05, Mark Pearson wrote:
>>>>> Hi Kurt,
>>>>>
>>>>> On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
>>>>>> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>>>>>>> Thanks Kurt,
>>>>>>>
>>>>>>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>>>>>>> Hi Mark,
>>>>>>>>
>>>>>>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>>>>>>> When reviewing and testing the recent platform profile changes I =
had
>>>>>>>>> missed that they prevent the tpacpi platform driver from register=
ing.
>>>>>>>>> This error is seen in the kernel logs, and the various tpacpi ent=
ries
>>>>>>>>> are not created:
>>>>>>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before p=
robing
>>>>>>>>
>>>>>>>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>>>>>>>> called before platform_driver_register(&tpacpi_pdriver), therefore
>>>>>>>> devm_platform_profile_register() is called before tpacpi_pdev prob=
es.
>>>>>>>>
>>>>>>>> As you can verify in [1], in the probing sequence, the driver core
>>>>>>>> verifies the devres list is empty, which in this case is not becau=
se of
>>>>>>>> the devm_ call.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> I believe this is because the platform_profile driver registers t=
he
>>>>>>>>> device as part of it's initialisation in devm_platform_profile_re=
gister,
>>>>>>>>> and the thinkpad_acpi driver later fails as the resource is alrea=
dy used.
>>>>>>>>>
>>>>>>>>> Modified thinkpad_acpi so that it has a separate platform driver =
for the
>>>>>>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>>>>>>> successfully.
>>>>>>>>
>>>>>>>> While this works, it does not address the problem directly. Also i=
t is
>>>>>>>> discouraged to create "fake" platform devices [2].
>>>>>>>>
>>>>>>>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>>>>>>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>>>>>>
>>>>>>>
>>>>>>> Yep - you're right. Moving it before the init does also fix it.
>>>>>>>
>>>>>>> I can't see any issues with this approach, but I'll test it out a b=
it more carefully and do an updated version with this approach.
>>>>>>
>>>>>> Thinking about it a bit more. With this approach you should maybe cr=
eate
>>>>>> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you c=
an
>>>>>> pass a NULL (*probe) callback) to avoid races.
>>>>>>
>>>>>> platform_create_bundle() only returns after the device has been
>>>>>> successfully bound to the driver.
>>>>>>
>>>>> Unfortunately having a null probe callback doesn't work - you end up =
with an oops for a null pointer dereference.
>>>>
>>>> Are you sure? I just tested this on the for-next branch and it works
>>>> without issues. Also checked the code and (*probe) is only dereference=
d
>>>> safely inside platform_bus_type's probe. Maybe another pointer is bein=
g
>>>> deferenced? Keep in mind that platform_create_bundle() also registers
>>>> the driver so maybe there is an issue there.
>>>>
>>> Possibly - I have to admit I didn't go dig too hard, as when I added it=
 I got:
>>>
>>> Feb 09 19:41:17 x1c12 kernel: BUG: kernel NULL pointer dereference, add=
ress: 0000000000000028
>>> Feb 09 19:41:17 x1c12 kernel: #PF: supervisor read access in kernel mod=
e
>>> Feb 09 19:41:17 x1c12 kernel: #PF: error_code(0x0000) - not-present pag=
e
>>>
>>> With bus_probe_device in the backtrace - and went 'oh well'.
>>>
>>> Are there any significant advantages to the approach that make it worth=
while debugging further what is going on? Moving the platform_driver_regist=
er is working nicely :)
>>
>> Now that I think about it maybe there is no significant advantages, at
>> least in relation to
>>
>> 	[ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>
>> because list_empty(&dev->devres_head) is checked synchronously.
>>
>> However, now the null deref worries me, because some sysfs groups are
>> created on driver binding. Do you have the full backtrace? Just to be
>> sure moving driver registration doesn't mess with anything.
>
> Oooops...
> I didn't have the trace (at least that I could find) but I figured it wou=
ld be easy to recreate it.
> Went to make the change again...and realised what I had got wrong.
> I needed to replace:
>         tpacpi_pdev =3D platform_device_register_simple(TPACPI_DRVR_NAME,=
 PLATFORM_DEVID_NONE,
>                                                         NULL, 0);
> with=20
>         tpacpi_pdev =3D platform_create_bundle(&tpacpi_pdriver, NULL, NUL=
L, 0, NULL, 0);
>
> (previously I had replaced the platform_driver_register...sigh)
>
> With the change done, I think, correctly - no oops and everything is work=
ing.

Good to know!

I'm going through the sysfs groups attached to the platform device and I
noticed some attributes may depend on subdrivers being initialized
first. If this is the case, ibm_init() has to be called inside the
platform driver probe for this to work. Like this:

static int tpacpi_probe(struct platform_device *pdev)
{
	/* Input init */
	...
	/* Subdrivers init */
	...
		ret =3D ibm_init(&ibms_init[i]);
	...
}

static int __init thinkpad_acpi_module_init(void)
{
	...
	tpacpi_pdev =3D platform_create_bundle(&tpacpi_pdriver, tpacpi_probe,
					     NULL, 0, NULL, 0);
	...
}

Of course this complicates things, so another approach is to just use

	platform_profile_register()

instead of the devm_ version.

Of course, the first approach has the advantage that devres is now
usable, so I'd go for that, but that's for you to decide.

--
~ Kurt

>
>>
>> I apologize for turning a quick fix into this :p
>
> No worries - I'd never come across platform_create_bundle so it's a good =
learning experience for me. Thanks for all the help.
>
> Mark

