Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6A6246788;
	Mon, 12 May 2025 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076773; cv=none; b=t+qOTNTbLDbcEirQKlT5wjQkUW5NM4Yk6oszM73gQO/9q81h0ruqPyipopJckN5973DgjPup0uw9fTSndEQJwt1bc+dhHr/kxSTO3SKpNOAa4Gtu8t9q2eSaYnY9MF/91DYBvniXplS07eSIonBKe9rky0PVG9+1WXp/xu1M7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076773; c=relaxed/simple;
	bh=6kUXqRfl/QRDHqu7tMXUAiQxfdy3036V26oKCsXgiD4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=BPhR00M+h2twr9vajqTzKFJV7YqJS7M5dLgRnZESN57sFECSmBrFCd/54UydC05g6LubX3GS+eaWCioLxXw3A7kOE3ZXoMta3QJ6i0aJ2aucayFnw1lI8rGsUPE+xF860GhQQ6Q5Z+8YVwVF9KvINpMRU1yO58uKAvSnZ8a8Jk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzbvSqAT; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzbvSqAT"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4517221e0c.1;
        Mon, 12 May 2025 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747076770; x=1747681570; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4h/HoEMxsgGlwFELk4YaCnFR/81exfwZAWd/Rc8C414=;
        b=bzbvSqATKylbOxiUN6nz11XVoVnYI0uNTI5krVdjvAs7no+Wwlx/7m6U84KT6DjuA1
         rfDrTkXbcYJmG+0H8gAhAn8ryc9eqTIjlHUwRxAAPMj2I3X90UpUXEliX04q9lUt4Y0S
         ooFnJdOhTTfI3LF9zvdG6nqSSHTVVj/PO5sOtREATmmomXqOyI7BlnhMfmXywsdqviss
         YgSCpiBbyhcILIvuIGm6h9/+3fAPyHrMwW46rY5vbueQLqcYF/D8HygFeqJFdBGmAtXv
         we8elpRb3oV2NeERbGUnOtFFyTU3gNY+PJuIzgWKBLtqQf/81AvRqwNAU6tT+w6noR9e
         02fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747076770; x=1747681570;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h/HoEMxsgGlwFELk4YaCnFR/81exfwZAWd/Rc8C414=;
        b=A2M2ARNfV6b3q7mvEkoobVKNKkDhus1NATu1ZJuDfLiE6g45GAZ/Fkwa6VzDfjhqmS
         +0ORB0ZJECkW+LT/gi8mvTmganj9aNvaSYdmKRYCCRjU+EKDMDhJE6emKXWvGDLva4c4
         25aVyahziNteqfzAJ8bNpEhbkghdGcCCboDJyw/N7pngqKM2rBxPKSlsPRBoNV8/Fnol
         d3cUx1vdRCY9vUBPN0zypASHmkevfdhyEhKHcAqCo1fguz6ZaY0UPFiDCqfc4hp+i/W1
         UUni5IzBie9Q6dBkAjnrKbrmRHzacxqvVyI/GgHPEam7It0ZI5+RLWZS6HL8S+QWEQ4l
         B2hg==
X-Forwarded-Encrypted: i=1; AJvYcCUgyBTsakusVuvGAexk/cvM1Cb6OeW4xTE7D3y1faeTy7EmPNjkQGQlkVH8+fOXCXjooInuUk+jm2FuWMoR@vger.kernel.org, AJvYcCVhsO+9Fb1CPOFuzOEx6AS4FGksXpAKGP/9wRRRlWTYV0cyUXfkaE0MfNLMi2ikJMkzeYOgo9mC9X7RxW0=@vger.kernel.org, AJvYcCWGBfPZfzg8r5eVzCWc42+U2ntHu3K5EuoH8/TMLeLH+pm1mUUg3yewLvoVZ9qJlwPB2uu9Yz73gX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzgkKOds7mK2nYjbeR9OxNtzp0oUIIHbPMPbz+Bt/nV8eUU6w
	weczk5KZ5F7682ad4ITzqAVBGEyczv35W/NdSTDMbHC4RxVilNYQ
X-Gm-Gg: ASbGncu3IEo2aOUFv1ywomVwR/i3LzQOISU7H2hSf4eo5InHAI6nqwe8rNC+hcFxdBE
	EpcjaRPAWJevnva1ct6SxNPUWBCB5U6iphL8eZwBhpgjiO2vqfnx2v31MLDtQKMdTvk81T7p78J
	Ob+1adFbWlXN0Cs60rZfRFujg3Vlnfus/kqkeYF2Wog4Z+D3ydNZFBRH+vqvCldougakQxF3m4S
	p6Lef7ZFtDwSRko/swPoQKEqDWRytHogayNakx499cyVF2qyPVd1v/EU/MmRwJiTR4TgQDpdl8u
	0f9GTQCxczsXYobCyMTujIS1+Qhi+wKaPr/kQSQiWllxuX+UyJjYNtA=
X-Google-Smtp-Source: AGHT+IHhM1WuOrFfud3xHWGersrJfw6ltQOIuLsHMahLNTS+wCuSOkQbBayYZvHrZGar3gstSEYr/Q==
X-Received: by 2002:a05:6122:318e:b0:527:67d9:100d with SMTP id 71dfb90a1353d-52c88a73545mr624984e0c.4.1747076770234;
        Mon, 12 May 2025 12:06:10 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c537264dfsm6194990e0c.13.2025.05.12.12.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 12:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=eee164ff418b0b8924af0432fe0737a6f07a095a24ff0c61f41e7842966b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 12 May 2025 16:05:35 -0300
Message-Id: <D9UF0KCST7K7.23TWU22S6L09H@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Jonathan Corbet" <corbet@lwn.net>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Jean
 Delvare" <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <D9TQ0LYKISGB.3QAOHFXVL9PEO@gmail.com>
 <CAGwozwFJnR2aMhj6LJKU8aF+MDzF9FR21fXPPd7_=44M+KUJGg@mail.gmail.com>
In-Reply-To: <CAGwozwFJnR2aMhj6LJKU8aF+MDzF9FR21fXPPd7_=44M+KUJGg@mail.gmail.com>

--eee164ff418b0b8924af0432fe0737a6f07a095a24ff0c61f41e7842966b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 12, 2025 at 7:16 AM -03, Antheas Kapenekakis wrote:
> On Mon, 12 May 2025 at 01:30, Kurt Borja <kuurtb@gmail.com> wrote:
>>
>> Hi Antheas,
>>
>> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
>> > This draft patch series brings into parity the msi-wmi-platform driver=
 with
>> > the MSI Center M Windows application for the MSI Claw (all models).
>> > Unfortunately, MSI Center M and this interface do not have a discovery=
 API,
>> > necessitating the introduction of a quirk system.
>> >
>> > While this patch series is fully functional and tested, there are stil=
l
>> > some issues that need to be addressed:
>> >   - Armin notes we need to disable fan curve support by default and qu=
irk
>> >     it as well, as it is not supported on all models. However, the way
>> >     PWM enable ops work, this makes it a bit difficult, so I would lik=
e
>> >     some suggestions on how to rework this.
>>
>> If I understood the question correctly, then you should control the
>> visibility of all "curve" related attributes with the quirk.
>
> Yep, this is what I was wondering. I will investigate this. It would
> be good to get some comments on the quirk naming as well.

You can check [1] for an example of the hwmon visibility. It's a similar
problem because some models have 2 fans and others have 4. In the
alienware-wmi driver we also have custom hwmon attributes, see [2] for
how to handle visibility with those.

I would personally just name it fan_curve or has_fan_curve.

>
>> The custom hwmon attribute_group has an is_visible callback, and so do
>> the hwmon_ops.
>>
>> >   - It turns out that to fully disable the fan curve, we have to resto=
re
>> >     the default fan values. This is also what is done on the OEM softw=
are.
>> >     For this, the last patch in the series is used, which is a bit dir=
ty.
>>
>> I have a couple questions about this.
>>
>> * What are the default fan curves? Can these be statically defined?
>> * Are user-defined fan curves persistent between reboots?
>>
>> I have some doubts about the approach you took on the last patch, but I
>> want to understand how the platform works first.
>
> So do I. Essentially here is how the Windows software works: when it
> first opens, it saves the current curve in Windows registry. Then,
> when the user sets a fan curve, it applies it in the same way we do
> here and sets a bit in AP. When the custom curve is removed, it unsets
> that bit and restores the original curve in WMI.
>
> The logical reasoning would be that that bit controls the fan curve.
> This is how it is named in the software. However, when setting that
> bit on its own, it seems to only partially affect the fan curve. E.g.,
> when the fan curve is 100% in all points, unsetting that bit makes it
> go down to 50% when no load occurs. When using the default fan curve,
> it goes to 0%. Therefore, it seems like that bit makes the fan curve
> semi-autonomous?
>
> The fan curve seems to be hardware specific and resets after reboots.
> So a straightforward way to get it is to grab it on a fresh boot.

Oh - this is interesting. Then I think it is the right approach. I'll
add a couple more comments.

>
> Antheas
>
>> >
>> > Sleep was tested with all values being preserved during S0iX (platform
>> > profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, =
at
>> > least for the Claw devices.
>> >
>> > For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since =
if
>> > his new high level interface is merged beforehand, we can use that ins=
tead.
>>
>> Hopefully!
>>
>> --
>>  ~ Kurt
>>
>> >
>> > Antheas Kapenekakis (8):
>> >   platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>> >   platform/x86: msi-wmi-platform: Add quirk system
>> >   platform/x86: msi-wmi-platform: Add platform profile through shift
>> >     mode
>> >   platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>> >     attributes
>> >   platform/x86: msi-wmi-platform: Add charge_threshold support
>> >   platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>> >   platform/x86: msi-wmi-platform: Update header text
>> >   platform/x86: msi-wmi-platform: Restore fan curves on PWM disable an=
d
>> >     unload
>> >
>> > Armin Wolf (2):
>> >   platform/x86: msi-wmi-platform: Use input buffer for returning resul=
t
>> >   platform/x86: msi-wmi-platform: Add support for fan control
>> >
>> >  .../wmi/devices/msi-wmi-platform.rst          |   26 +
>> >  drivers/platform/x86/Kconfig                  |    3 +
>> >  drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++=
-
>> >  3 files changed, 1156 insertions(+), 54 deletions(-)
>> >
>> >
>> > base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
>>

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-=
x86.git/tree/drivers/platform/x86/dell/alienware-wmi-wmax.c?h=3Dfor-next#n7=
42
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-=
x86.git/tree/drivers/platform/x86/dell/alienware-wmi-wmax.c?h=3Dfor-next#n9=
42

--eee164ff418b0b8924af0432fe0737a6f07a095a24ff0c61f41e7842966b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCJGggAKCRAWYEM49J/U
Zh6EAQD+BliCO7QDYlUXFOISo+JdFEngBzHqoPexiF+Q+2MbhAD+P4bi/TbuhQNG
M9RvPyR4ew+RrrgxHSJDwMYxqwWhGg4=
=Hb/2
-----END PGP SIGNATURE-----

--eee164ff418b0b8924af0432fe0737a6f07a095a24ff0c61f41e7842966b--
