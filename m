Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EBF22FF37;
	Mon, 12 May 2025 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083100; cv=none; b=h/Y5PMe2q/sOhV9OgtlA+NclCxwTvDIRTytMPyRfnmwJKpnOig9rXzbUSF2EF+KgJ/5lVoHJEAbusiOBYVOUkQfTr8OIBE8pynXLtvoWAmeVDpn5UhlSqDm45ZQIt3/6lNabEBRuzmtK1PjYOn5mCvFFnerjFMgZWOr5ysFaciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083100; c=relaxed/simple;
	bh=gIV6wtyGfvzyjLcc8ejLAk8XsSSNZV3Hv39WYmgsvl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfclU+AHX3mpSgmCQgqH3EKcNh28jdUkMNp6UhLrYNGZnHtE4l6R580vY8GY3cjBMfXuJJRULpmmHbcZLdXsRGvz4tD/vfFOPoBzmApHLvHZtbTf4wmS7PWGuHXrKuWSo/FF4HGZQzPKg5uqlU083UqLidFyH8Guvky2ipB/r2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QIIUpltT; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QIIUpltT"
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 453742E0A86C;
	Mon, 12 May 2025 23:51:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1747083095;
	bh=Rop8DFWTufIyQTkuqNG2mDH/PTEjEJutA8Yq2wqvzjM=;
	h=Received:From:Subject:To;
	b=QIIUpltTUTnKIq3Q3niKElx5z0dqyqcyAdsT1/lAynYB/W60p74ScpT8GWK8C2e5D
	 fdnWftPYnWHBA6XXaoJ78z2z46Zdq8LVfJdr1kYLqKe5OOFmBHi51v/5K9/lYiJsYx
	 FpYo0hZwZldEBJbVDm6LVsZb7SN1Jx2EmKqEyEFk=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso46897171fa.3;
        Mon, 12 May 2025 13:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSq5w86Y8lXG6D8wLFdRlahC1EN5W9/hSFSKjgIaPAowrT9uXs2a1lVxfQK6RYauZzE8MrtqSP2krC4JE=@vger.kernel.org,
 AJvYcCWzDW//1eyomrMDvyk2vJLQkIJWlGXM+FIzQTlB5b6zrqbFIjmp5zegeLQesku0bA3/5FxGNH4Wc/M=@vger.kernel.org,
 AJvYcCX1zi+wDDlxw4nLZZQVcjiw7i+XOeS01sIfLyz4nP9u2gN1au+B8usRbp5GN9O5uILSNn6tv5CxuoVBGQOI@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZ1fbEQtpT+v9hksH8xq5khwZ06OxjPSmKbq6BBPm7WWIyg1V
	manYvqKDPA9j5vxEoyQTCh2SuIzeawdlOKRAv34GhNyZ/Q7C74Zxt3583G0wk296nKuZY1okxt0
	HY7fCckM83o7EcpZzpp4qP3fMM94=
X-Google-Smtp-Source: 
 AGHT+IH2xj/PUqSNSOqH93nKWCIPpCgiMULSaTb56Vi4Z0jeoNopXwc1dtMuXUdfNMT5Yy0C+4TUMFIPjGUB+z9ncsw=
X-Received: by 2002:a2e:a581:0:b0:30c:523a:a84 with SMTP id
 38308e7fff4ca-326c467d2damr60774891fa.32.1747083093626; Mon, 12 May 2025
 13:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-3-lkml@antheas.dev>
 <D9UFCPLQHE5V.UH1BAK279S5M@gmail.com>
In-Reply-To: <D9UFCPLQHE5V.UH1BAK279S5M@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 12 May 2025 22:51:20 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwE6-=9L2RTwipgHjmdQWzBAX7PxBYgJO_oGcWaHtLhoSA@mail.gmail.com>
X-Gm-Features: AX0GCFvV-L_qcMybIe_-dvtlZVxJ8JQ0yMn1xyniPxdY5OzJAhqHt_BV6n98nvw
Message-ID: 
 <CAGwozwE6-=9L2RTwipgHjmdQWzBAX7PxBYgJO_oGcWaHtLhoSA@mail.gmail.com>
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
 <174708309490.10488.373649094137299532@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 12 May 2025 at 21:21, Kurt Borja <kuurtb@gmail.com> wrote:
>
> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> > This driver requires to be able to handle transactions that perform
> > multiple WMI actions at a time. Therefore, it needs to be able to
> > lock the wmi_lock mutex for multiple operations.
> >
> > Add msi_wmi_platform_query_unlocked() to allow the caller to
> > perform the WMI query without locking the wmi_lock mutex, by
> > renaming the existing function and adding a new one that only
> > locks the mutex.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>
> You only use msi_wmi_platform_query_unlocked() to protect the
> fan_curve/AP state right?
>
> If that's the case I think we don't need it. AFAIK sysfs reads/writes
> are already synchronized/locked, and as I mentioned in Patch 10, I don't
> think you need this variant in probe/remove either.
>
> I'd like to hear more opinions on this though.

Are sysfs reads/writes between different files of the same driver
synced? If not, it is better to lock.

I want a second opinion here too.

You are correct on probe/remove.

Antheas

> --
>  ~ Kurt
