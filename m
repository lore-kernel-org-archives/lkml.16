Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0321614A8B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738233074; cv=none; b=SwR2EkVEbjZB6gu5rtzSf1eZ0sdTvCAcCbHFIANkkWnXQBkLW9DLGVtPeVa6/3mdTBicOztJlzSvFo0ZVCsF3vEXcM81D2cV1ykNioawTBPrlhdDnRAtqHLf3c3poDFUAUTxPIZQPVe1QmvM5vHe2U6JQ23nosuas27dKsYuAes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738233074; c=relaxed/simple;
	bh=GLqcA0yrzTvNKkoJFv9QsKzWR+3TrgS96TN9KhFpcQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJiQLR57xXx0CvH8fbnik7QqRpH0oMNuAGOCBrGxWGte44Smx2sPfxnVZQ9oJVlMRIq4bC9GEsqjAilBzPTIJA1sIg3bgcJ9+gEFiFjUVC4ZXIj+ucRrSN6Iv8+Z1OYR9u1cxqLfu1Ht/gYnsqFQ4t0OnKlhVs3RKkXAm5cSEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OvhHxamU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OvhHxamU"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so566544e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 02:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738233071; x=1738837871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki6qA4i5kESQuNmkoycSfPaPrQE6ErTpRlE8t4jd8q8=;
        b=OvhHxamUy/WyJ9758Cswr1k/2hfZRvwzsLVpcwW3TwGXj1DQ5FUboie7kTq0xigKHN
         /zgjmOUTSncbe0Flgm1ArStU+qTNV1jOP1gqJ/C1ZSHDNFYLuYnn7ZlKt/aytWNZEjuN
         xmHrSFWJhCLXo21+R3nRgZNUhK0PePc/qMTkFRl/pqlKJbqojEkUuzozPcKjvjetaTpR
         wbvEpSqSv96lDn3Gua32CSWyfEYKWowB/23bwlF+wLe94hlFOwYITpzSlk3aOapAy03o
         p22yRGXv2ZcLjy6jOOoRI6s2hZ+umdcyd6YsMBT/pzd00OvPoigoJfD95liHD86KlHDH
         yw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233071; x=1738837871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki6qA4i5kESQuNmkoycSfPaPrQE6ErTpRlE8t4jd8q8=;
        b=qlNonVkcLjyxhejABwgTqiddFbk7JQ/OC0Y0foi75JKoXEMSvvGVjkb7qrtMwLjcNU
         9Q3WrVWSvhsjlHf8lnznGkk8eeF9fYZAvhjlSfVoR1hI9rbSae82FXNU9Z8RIHSrGUWd
         4M/NbfsuTMj+0ZdtaqjMI1Z8L4GUj5xj/pwZkGCvbbMJERcIae+WEXh+NiDmFpRWSEHm
         r+js7mxpSEHfcl9R2JjdZBckdKT+/6WVtjzCbV7KPdaCommfyOEqkkGasS1L/VafOT/w
         2gRFgbBNmKYcOz2YJbsND2Ne1x210ojAQ6Lf9KLWRlre+O0q3woiwcupUvA4Mk1+Jv37
         m0tA==
X-Forwarded-Encrypted: i=1; AJvYcCU+YqzkKMZz2uzB+ERWEvGtFiO4FJuweyHv8Cyy3ROGp9cSu5/A8fN56XbdJEAJ7/AgrRAXJrArPnIPxdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5kho5ffThgkH8HULfmjCdT2TDn1qcyYELJJj/0K+cbxe85q7
	IzUCoW3fxvL6gI6kFgb7aRelmx7s22+i5NjalSD16HXGKlTFRoUvv+yXU4ZfGC1Ve5QkqiriQI8
	1RHlpGnOKH0b3kJ0UXcqkKfaXTjOjUMMh8mo+A0yOA2/v2RqjGXI=
X-Gm-Gg: ASbGncvHNeokfug4y3tj8/ayhOS0JETC983dekq/WkZP8ZAsWY2xusccuL5sRJ/ZBVR
	J8H0vLYbfPZ7Op/9p1sPC56Err3hMFh4Db59/uu/2FuHtZ1aEXc0UKP6aK+Ea5yHwwmh3TS5pYQ
	BlJJ7xSlUTPSb77EJHHhalIVdQGDYw
X-Google-Smtp-Source: AGHT+IEh8hqrObKFRcYoPrCQ8LH4Rxiy1iC+m+2acWh6UUzGQ49EjL4Hn98bgUTRzh6t+JA+wCUE7v3W4XmP7GAoOX8=
X-Received: by 2002:ac2:5684:0:b0:541:3587:9d4d with SMTP id
 2adb3069b0e04-543e4bdff79mr2319914e87.7.1738233070779; Thu, 30 Jan 2025
 02:31:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
In-Reply-To: <20250129155525.663780-1-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Jan 2025 11:30:59 +0100
X-Gm-Features: AWEUYZk2VCsJtEXY66vJf4lsD4njZouIxnamAhapnXUzu5fb-7-6SCXmExQ5ics
Message-ID: <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 4:56=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> This RFC patch series proposes adding a configfs-based interface to
> gpio-aggregator to address limitations in the existing 'new_device'
> interface.
>
> The existing 'new_device' interface has several limitations:
>
>   #1. No way to determine when GPIO aggregator creation is complete.
>   #2. No way to retrieve errors when creating a GPIO aggregator.
>   #3. No way to trace a GPIO line of an aggregator back to its
>       corresponding physical device.
>   #4. The 'new_device' echo does not indicate which virtual gpiochip.<N>
>       was created.
>   #5. No way to assign names to GPIO lines exported through an aggregator=
.
>
> Although issues #1 to #3 could technically be resolved easily without
> configfs, using configfs offers a streamlined, modern, and extensible
> approach, especially since gpio-sim and gpio-virtuser already utilize
> configfs.
>
> This RFC patch series includes two commits:
>
> * [PATCH 1/2] implements the configfs interface and resolves the above
>   issues:
>   - #1, Wait for probe completion using a platform bus notifier,
>         in the same manner as gpio-virtuser.
>   - #2, Introduce a 'live' attribute (like gpio-virtuser/gpio-sim),
>         returning -ENXIO when probe fails.
>   - #3, Structure configfs directories to clearly map virtual lines to
>         physical ones.
>   - #4, Add a read-only 'dev_name' attribute exposing the platform bus
>         device name.
>   - #5, Allow users to set custom line names via a 'name' attribute.
>
> * [PATCH 2/2] provides documentation on using the new interface.
>
>
> Koichiro Den (2):
>   gpio: aggregator: Introduce configfs interface
>   Documentation: gpio: document configfs interface for gpio-aggregator
>
>  .../admin-guide/gpio/gpio-aggregator.rst      |  86 +++
>  drivers/gpio/gpio-aggregator.c                | 673 +++++++++++++++++-
>  2 files changed, 757 insertions(+), 2 deletions(-)
>
> --
> 2.45.2
>

Hi!

I love the idea! In fact I think I floated it in a discussion with
Geert some time ago but never got around to working on it.

I just glanced at the code and it looks nice and clean. I'd love to
see some more improvements like using a common prefix for all internal
symbols but it can be addressed in a separate series.

I played a bit with the module and this is where I noticed some issues:

1. The sysfs interface must keep on working. The same command that
works with mainline, fails for me with your patch. There's no error
propagated to user-space, write() returns success and I only see:

gpio-aggregator.0: probe with driver gpio-aggregator failed with error -12

in the kernel log.

2. I couldn't verify that it's not the case already but the code does
not suggest it: IMO devices created with sysfs should appear in
configfs.

3. I don't think the user should need to specify the number of lines
to aggregate. That information should be automatically inferred from
the number of lineX attributes they created instead. Also: if I create
a line attribute without setting num_lines, the driver just crashes.
In fact it seems any discrepancy between the number of lines specified
and the naming convention of the line attribute causes a crash.

4. Writing 1 to live, when no lines to aggregate were specified, should fai=
l.

There's probably more but I haven't had a lot of time.

In short: I'm very much in favor of adding this but it will require some wo=
rk.

Thanks,
Bartosz
