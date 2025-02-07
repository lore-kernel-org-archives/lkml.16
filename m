Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F663199238
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958220; cv=none; b=I4lHPEKljLWYnQ31Igb82qlKJWWPvyznGtn9ZUg7NmK7BcFJQGxQiAGgpd8E781NwWI2FXJjCG2w6sjUSaQCN+bD3vp3ylx7tVfLetbfdrV8ewLhtnsOB/sso2LISuj2GWK8PE8cya9Hq38sDbpFuwAPlyw5h7djmg15z0TMOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958220; c=relaxed/simple;
	bh=79LQgR3k/Btr24QSq/kePaUzIL0o36tX30EbGhUwh5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgVvYYZWLP2Axly4TKxbSJd+Y6CiTE5ce+xkI/xbJu5g5cZ6kaaczbMHFD3XLDkslaztWThgRp7dUkV/SjTbKw2Iy4vwQwnyV7rIFSyvpmBUc8lQYsKgrrpow4JjiCuIiRJuSGEMfNx3XPeZDu5MkRQ9mmhdBdbEmwjiowkGFS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=syBEdqOT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="syBEdqOT"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439e331cceso2862432e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738958216; x=1739563016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79LQgR3k/Btr24QSq/kePaUzIL0o36tX30EbGhUwh5w=;
        b=syBEdqOTadXkZfHYjUXyDF3/b63gua7a9RgUgXbVet1Tuj+KAyuKzrSj1TswCxG4zL
         ja16qKJ51px5SoCQIZs0NgyVWrP925ZkX1xYILlxbCzOhD7/QHaLHxuO4f7R5p+QQdgP
         P1eQrXeMR+ROJIPYFW7yuQ3sAZv/M6Td0zCRhhoP5ay0rk8DhmmbZ7cF3imPFEE79Ad2
         MA4ovYu/oxScgB8/r+XdW1V4nkTdGkEynhqmw6oMey6FAy0b4f1/dG9ba50MzFTDiXv0
         ihQEBQOSPs/jfUtwsyL6zIp3qlqORO8n5YNShZ55GMrIaW5hhd2VW305a7Bp7M5as6c7
         umYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958216; x=1739563016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79LQgR3k/Btr24QSq/kePaUzIL0o36tX30EbGhUwh5w=;
        b=cB1jjceXn/zQPuB1HA5jF83vVXp5KTp6qYxY65YKZYZbqNZbwm+KpVx9k18qNBVr2f
         4ry9bijesjxTT49WIJ1y2IzJ7Ycqoz2/BU5snK9vIt/hWbtDyI93YgvGMA9ukJ582SPA
         mfvvS5CoK080b0r11FWZGvsZHx0oNJs5m9R45gcPz3VbvJAWdSjv9tyCjvjoTYcWTkTg
         q4Odhxqc7/d0qRud2dd83DbI68MMqxIpsABBmwmx30yJcMR3MxWMKGuRF8q28kc7uKkG
         f2Od+UrKpxo/hsn4E3fRPiTlmfi+Ups6Jo/bu8YJzDvXDEc/Wl8MQeP+N/1Yml+tV8Np
         63/g==
X-Forwarded-Encrypted: i=1; AJvYcCXPMJ0cHjWVhPgDUcr6dnjUvqDc2c/SYj69SR9I3/jOLsJP3ylwSr/JPXgneRnfrqS4jJ5uPQgC7Ila5Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/gogTvEl4iuu8w/+8w81izs27oKKEKVfZbVLjH24fxQJeETq
	IHam3M+4UgrwJ2YWTqA0cnBaa1GlnX6KEZ+hQ/iMojCYERaiHU02mPGo3nIim1x9B1Ia06ZIHL7
	DtDBGeyx08YQ2XS3olV9fLyNpzUTJxO4txPyggQ==
X-Gm-Gg: ASbGnctFQE9GRglzrse7Gd2b3r7GVaskjtdXoQ9pjMGglK0o7qF7ERQosEbxQSezJV5
	pNURBS8B06zWL6Exu6gO6QV0eg8ZX2hEAzpNA18xMJDtsUU+1bTy+Nw2c/uBRDEZ2SGdu+UvB0Z
	AVFmaSm7l6Uix9fFWsw4JfpDT0i0E=
X-Google-Smtp-Source: AGHT+IGcldAttxlLtJk4Fmc6rBnfR3YDGT0u2J7Iom+k4vjkPDF1Uo8mr4HUXBeyLSkHxMEFExi1YbQDREIHsVDAdKk=
X-Received: by 2002:a2e:bea0:0:b0:302:1de7:ef3c with SMTP id
 38308e7fff4ca-307e5a84a4bmr12434941fa.31.1738958215983; Fri, 07 Feb 2025
 11:56:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
 <20250207151825.2122419-8-andriy.shevchenko@linux.intel.com> <Z6Ypww-xXAvoCCq1@smile.fi.intel.com>
In-Reply-To: <Z6Ypww-xXAvoCCq1@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 20:56:45 +0100
X-Gm-Features: AWEUYZmXWJ_lbK-g8mszuq861gNNZ5AaVN8r5wA7kPpaIp5zjgxpgUc3nebktXg
Message-ID: <CAMRc=MeTgjHYCmZcDhvZGKCaKyHhxUU=3EF6OvsLW-H-Dv+Y6Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] gpio: 74x164: Utilise temporary variable for
 struct device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 07, 2025 at 05:17:14PM +0200, Andy Shevchenko wrote:
> > We have a temporary variable to keep a pointer to struct device.
> > Utilise it where it makes sense.
>
> Urgh, this seems incomplete...
> There are more lines to convert, however they do not affect =C4=85 statis=
tics.
>
> Tell me if I need to send full v3 or just this patch.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

No worries, I may fix it when applying.

I'll still give this series a few more days on the list.

Bart
