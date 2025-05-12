Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACEF22338;
	Mon, 12 May 2025 21:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086693; cv=none; b=oOnW5ag9B85fFnlUnxkQXaI2HqnFwoCcxg9CLGyLSQ87Q0q/F7T1OjYByHWOwqiuFd43X7D8N9L38AwJWyzX2BWwoFwRdL2ZuAyDbjO5086LxdvOYUqIPofg4Gw8YKv1gtlisgb10MsFlOdpu0AEe5KnyBKVOqhakixrPMBa8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086693; c=relaxed/simple;
	bh=svIWBcR+HIz9Wd265ymPer2Qxe0ncQjuPiDydAuwvTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJZ5a3pfHUilDm4+hFBNzrxwyJt4WeYUcKdoLSITwyQmFKicJD0CFUIXnr0uf9YbGBJc7ycZ8rvF0jtTJJ04R6ysKUCcBZySPoMYUNb/uxsa0bj1u6Z05quL+m1ExlYFYVSs1iVp/cNsB7Wybh0C4wXKEmQAVe8H4DIa3J2YIVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=PI7gcLUT; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="PI7gcLUT"
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 671BA2E0AB4C;
	Tue, 13 May 2025 00:51:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1747086687;
	bh=jNEnd8FEgAAFOHyjKK3tme/xiyv6VfFEtYBlxWBBRi4=;
	h=Received:From:Subject:To;
	b=PI7gcLUT7NetQUeNF0036VGAOG/fq9lTZCWOQDZDtJ4MRZ3u+e/dhaKrRHeCOeSWO
	 U+FUnnz3IVBGL0VTg2U53qda0OndSxJlQ3n7nWQoo5R+KcE4uJuykHgvO9jjLjBXp2
	 isHSJKyOP0EAMWsIFBK7CLVeJeF9TyX0aFCtvVBw=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-326b5dce9ffso34017741fa.0;
        Mon, 12 May 2025 14:51:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW9W8zsp5i5f5y3J6cBmNb5K8VdAw4eEkYqCoofgRItw5/OPmvhE2uRAckx7rIUMHIuLiVNj/TbYHxi44CJ@vger.kernel.org,
 AJvYcCWMuAd0GTTAr35cPG4jXYH2EiNktAsNpE9Dbf/XO/gtu0+8JiyW0XeyxLm2wQ6T9V6C/O2+a2Bsbpo=@vger.kernel.org,
 AJvYcCXTm0UURx2UKcRqJ99pek2VTTGBW8it1MLQvFKYX9WtYrOs2oPtT7V+7IlLN/ZpFDYZZJ0v6rymwtrWEYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4EIN2HqZLsiGrk6m7NOma4XOC2ZiiEnHbXC+/pJt/+gRobq5
	bJmZ9JZQWSOjSU4ZDIWn8Fp5bP0J8Ju34Ns55rNMXaPS+n0MaPZ4Yx7GAU1hLrXlOtrqENEy+M8
	af/mz+si5BdHUjj7EPnc1+KPkue0=
X-Google-Smtp-Source: 
 AGHT+IE/FOZL6ebbDM4CsjuMN0tfIHIATjJJo8orN3Ct2vFJS92C3T+aadOENxtIL4qVEd8whtCZcjEwukBIvOs/tFA=
X-Received: by 2002:a05:651c:30c6:b0:30b:f52d:148f with SMTP id
 38308e7fff4ca-326c46175dbmr53423231fa.18.1747086685713; Mon, 12 May 2025
 14:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-3-lkml@antheas.dev>
 <D9UFCPLQHE5V.UH1BAK279S5M@gmail.com>
 <CAGwozwE6-=9L2RTwipgHjmdQWzBAX7PxBYgJO_oGcWaHtLhoSA@mail.gmail.com>
 <D9UHYC9360RO.8BN28N2MJ2G8@gmail.com>
In-Reply-To: <D9UHYC9360RO.8BN28N2MJ2G8@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 12 May 2025 23:51:14 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHrh2ODuUPAHxmkoATJ82Fguqgyb8H1z+er-AnVvBXGZQ@mail.gmail.com>
X-Gm-Features: AX0GCFtEljRCPHW07LjywUO4uHE-zrLXGa4idqF18qxt4llnWgZHSX-vjFj8HrI
Message-ID: 
 <CAGwozwHrh2ODuUPAHxmkoATJ82Fguqgyb8H1z+er-AnVvBXGZQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] platform/x86: msi-wmi-platform: Add unlocked
 msi_wmi_platform_query
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174708668684.29538.8716039997454679172@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 12 May 2025 at 23:24, Kurt Borja <kuurtb@gmail.com> wrote:
>
> On Mon May 12, 2025 at 5:51 PM -03, Antheas Kapenekakis wrote:
> > On Mon, 12 May 2025 at 21:21, Kurt Borja <kuurtb@gmail.com> wrote:
> >>
> >> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> >> > This driver requires to be able to handle transactions that perform
> >> > multiple WMI actions at a time. Therefore, it needs to be able to
> >> > lock the wmi_lock mutex for multiple operations.
> >> >
> >> > Add msi_wmi_platform_query_unlocked() to allow the caller to
> >> > perform the WMI query without locking the wmi_lock mutex, by
> >> > renaming the existing function and adding a new one that only
> >> > locks the mutex.
> >> >
> >> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>
> >> You only use msi_wmi_platform_query_unlocked() to protect the
> >> fan_curve/AP state right?
> >>
> >> If that's the case I think we don't need it. AFAIK sysfs reads/writes
> >> are already synchronized/locked, and as I mentioned in Patch 10, I don't
> >> think you need this variant in probe/remove either.
> >>
> >> I'd like to hear more opinions on this though.
> >
> > Are sysfs reads/writes between different files of the same driver
> > synced? If not, it is better to lock.
>
> You are right, you definitely need locking there.
>
> However, what do you think about introducing a new lock specifically for
> this state?
>
> IMO locks should never be multi-function and I don't see why all WMI
> calls have to contest the same lock that we use for fan stuff. This
> would eliminate the need for this extra function.

The _unlocked variant was meant to be used for operations that read,
mutate, then write the same value. Therefore, we should ensure that it
is not possible to call WMI functions in-between that could
potentially cause that value to be overwritten.

Theoretically, at least. Although after I simplified shift mode and
the battery threshold, I ended up doing only writes for them.

Off the top of my head I think that both shift mode and Set_AP (used
for enabling the custom fan curve) touch the same register (Set_AP
touches 3 registers and one of them is shift mode[1]). So it is safer
to use a single lock and avoid edge cases like this one.

> Also keep in mind that by introducing this patch you are also extending
> the time the lock is held per WMI call, which is also unnecessary.

I would say marginally, sure, although the operations we extend the
lock outside of are trivial. A case could be made that locking
multiple times hurts performance more, as if we introduced a fan curve
lock, each fan operation would have to lock at least three times
instead of one (e.g., disabling a custom fan curve would take 6
locks).

Antheas

[1] https://github.com/hhd-dev/hwinfo/blob/master/devices/msi_claw8/acpi/decoded/dsdt.dsl

> --
>  ~ Kurt
>
> >
> > I want a second opinion here too.
> >
> > You are correct on probe/remove.
> >
> > Antheas
> >
> >> --
> >>  ~ Kurt
>
