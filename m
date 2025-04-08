Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F02641F7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102785; cv=none; b=cHSr4YCAAYVi68IRqn0XP3DMTDkftmkXmCydMGbcxeFCts79Py4HCZBCCCcwEB5lbqKKEs9MoIER++m6OjjFeVVBmlESGfVuZSWxapaI7GHKzGA97hj4dINJeCYQ4Ysw2hxujb/5c7FRrSC4IpIsrT667Oeago00gBFVTHXo5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102785; c=relaxed/simple;
	bh=lNiYZkdnErtTzxt0Uq6hCnSDgBoG7jrmCa6HXR2axIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOEqUJSFTVZI8JjYL/HRtSeoTrllMN/Wvv7LcKgeRT8YQ9PUomiIXdo56j16GsKlFOat/3RcmGJ4rwNa94vAkqThRuufFAkYH189d7kZUwYZdPA0xluK1VP8kaprq4VKlQc7ZPq7roSvR0Zrhi8J5407hwT7ColnDZ+rO1nQCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RVPmepSi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RVPmepSi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499d2134e8so6520856e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744102782; x=1744707582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=RVPmepSiUFhgs+jpHCVKcKCszAKep92VNp9w3dNfyoKlYwT7vpFa6cevGCjzIQZ6Lx
         7AUsxuIYBkDOQSoEc/1V2sk9Hajq+7sAgLhy/eTaVjH361D5rO8UzkwaGznblTbpstmz
         QgAwkc2vlLIFi6IIeeCeA9NpoM1yM5Yze+aw48tMypRWdjnkaiCMfy0PEW5FSbjZ3c8z
         sl896MBdwdAYR1fh9XCYVKmkzTXmGVJIXXZnOV6FB+3X3Vmtg8sfozfSY9c2p9pUyWhV
         xDCevtApSyWiBcBetqbpsr4cJZ9EEp7pzy2l1XnWdIND3VgxAsYryv8ZRoHlue7X/b2O
         V6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102782; x=1744707582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=SdVgPpjEwGHpQUQcn0ujIP6hwSrRW3H+ZM1A21shnRfbus8tciOeLbGKufFRGfDTUH
         LeNqyf79sgSUeB/FetmMUXqJSY2Y0wTC4w87Xvjp47K4nhgDWURjmVFP7RYjbZkgkiKP
         /e3C0a7zSYUWwcLyTANQk8yaK1WKQpLcESO9Q0Zy+zZFDhYB4EqwcreZOiKMUcMZmX+g
         v7RHqHd2Uyavy264UjPIVQAILytVZ3LZUp6t3ky0E/VZByO76L+HVZmQkTel2iHvHy3x
         CR1RRwP+ffo9lth3O/EKmLRyCgP7VBnHDXs0DwO8LC5cIoPpG3VUZw8rU/LpBrMGZvgt
         rxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo/N0gsbriSugk6eP7ZWehdxDktXkWWUMYZ2vEBXywHv0p4KoU7lwGSzvxFR5A0UaHbWNMaSme3jZ9AwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMN3Ej7rzcf0ARmIjPPHpbXIb82k6ipShu3Sh7N1PegHAa6H9Y
	hAJHudqJJojgXsVGeDmPGHnnK8ru/aP6Pz4f7OSp8Ml+SiOlgw/NJFCSxxqR4yS9Di4JTpZFwvI
	xDL7nrEZCngiyQKdHiNR4PSfNXDEgJGXLOsEHJA==
X-Gm-Gg: ASbGncvJUg+PjrWsxT58OalL+MqHyJeZm8tQ/v6zaBlurnOvhNEf+qeFbecE5iVw5B3
	F6z7MLThvn6pMg5rDs0hpqDDdNDumI0d2UjexTzjx+N7ldrb+iSL+0MORZQOzA+DqvgUZV1d94L
	VNmDDFosEjT9D8z7MaVo5n4r1A3rudhwFlX65MNremkh20t/IIheneFUEfxQ==
X-Google-Smtp-Source: AGHT+IFhU+IhVBAJzBIMUxOBAo7QfFVW11UL24yOIyLgi1oINyxWjy4Dxkzmcdvr4r4k1H5XdlGKfbxf2ZKflqozVaw=
X-Received: by 2002:a05:6512:1328:b0:545:2eca:863 with SMTP id
 2adb3069b0e04-54c29836e84mr3493147e87.42.1744102781735; Tue, 08 Apr 2025
 01:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <20250407103320-GYA13974@gentoo> <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
 <87r023ujiv.ffs@tglx>
In-Reply-To: <87r023ujiv.ffs@tglx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 10:59:30 +0200
X-Gm-Features: ATxdqUFtpGaiXd9grNQP3Ib6EubxTwZJQ656Dn7NldoLYjiAufIbT8WtF0ED4JY
Message-ID: <CAMRc=MdP09b-cm2uZeqbbCP20kNjQJ8CbXTXSTxQEihdoXjGJw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:47=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Mon, Apr 07 2025 at 13:26, Bartosz Golaszewski wrote:
> > On Mon, Apr 7, 2025 at 12:33=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> >> On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> >>   I'd assume this patch [2/2] will go via pinctrl's tree?
> >> as patch [1/2] has been accepted by Thomas into tip tree [1]..
> >>   Additonally need to pull that commit first? since it's a dependency
> >>
> >
> > No, this should go through the GPIO tree but for that I'd need an
> > immutable tag with patch 1/2.
>
> Here you go:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irqdomain-04=
-08-25
>
> Thanks,
>
>         tglx

Thanks, pulled.

Bartosz
