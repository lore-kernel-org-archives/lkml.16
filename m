Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1524CEFD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683019; cv=none; b=iRvOsr3rRsCKZJ+lDIkqBYI3jha/jXKL6BtGvUs47RdJfTapTSZsJhcWOffqHlDUgd4oJvbFRDJGR1/s7R6nBW89YfmKNw5UFX8aam0fPNt537JBY/36glG6x0fUx+zr2V5VxPFxd8IkFqi8KZvq+e5gwnQ8KUq/UZg+cK/oRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683019; c=relaxed/simple;
	bh=PejZ+wJiXLcgM1gyJYw5SnnLqrMBsdjcc85yYNt4NUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yi9Yk08KWGTmGGgnRPntgKRdlBs9pYWw29dDaMtcv4vTIb6OfGYWKg7aeWm9XzfnIxOxZufG8z4llZed/17RRLzNHn9BNLrheJn1lNPkz9Qk9UYt7CstamhuzuPAuGHAQUaHYd5SUd5dr9PZ5Y07uuoiZOOi+x3zA1Sb4IlEy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kn9Uy+P9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kn9Uy+P9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22409077c06so12115985ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743683017; x=1744287817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4+tDXuO3XXPOhksyq9ZiNyj53YStRZ6GI5i9UyJIc8=;
        b=kn9Uy+P9YclWcMRQUlIE3bVx8pBbk5INhEV5JjyZpRdfZzErLJDhwQ7sZn9aNuloL+
         Z5oiELZZ58alk/A9dFT7UM4FNMU6tedW5qFuvWQqltr6G4ifiZfXIkjIRhObtVKFPejE
         51fECbRCgT5M29zL2cn4c35xgbTrQ5yJlpYoH1rqXUJlUTqGm+Bv35SRFyh8xOhy4Hg1
         hvZUtpLckJiGeirSQsxgBl0P0U91RhhSbgdV4CxXH/0/EtbCkFIKvougwkjKconSQP1P
         zcR/5oaPGIIDOemTZaXy+cEQuEOx47/HX3l7J/GORhOMOrY4nhfEZeehA21Q+pZCWaJP
         CrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743683017; x=1744287817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4+tDXuO3XXPOhksyq9ZiNyj53YStRZ6GI5i9UyJIc8=;
        b=eiNZAeeS4io4Zxqp3jWyZxNGLMKfpm+UjkHeaVHalEeKF143U7rdhsebKgQRGgFRGg
         YK9+4Fg343MZQK5HDqnyRAE/mdyhu8MKJ4yDpvs7WC3I6iUOtUhijDaPGAnPVi45aSiJ
         Y85TLN83xYXyldC5bFl+TdYcWSnv6aeQcNqvelaTUkM6leoERtWC+jTJAMCDGMcWelR7
         Ks/Le3wfuXbS9Jp7LKPDuq7ux08UqFF/K78JCx9jrAMEZNEqc3wfdV/1Vz+wUCWezqyB
         SyqrKEgWfjDRmihTkKJP1xp9uEuIqtYVgjs983KsEOYh9tewZp7WsxP7CzSHh+EBf76j
         Elyw==
X-Forwarded-Encrypted: i=1; AJvYcCUqgZXVWdyIaCKp9QF7Yq8u3pG05bWetNIIq2SU/p4KpLjildQBBkIEAq75PTWaxNvHhrt7JYMiY5yRoZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX5eE+fsUGN7O1o4qN5yTmo1yOSgIrlwzcMuncHAkX8JDba+TZ
	Saud2fy1O1oTDHlSf4fghsIpl7sD+nehBxC8RbLS5zBSgJAkNG306/1/J7cR+HOtcB3MmIEvmwy
	l1zAcoqvXI+QZMIy/rPDsKmPt3/FKCbZy3uxlzw==
X-Gm-Gg: ASbGncs7X5Z+d2SomigjMVDdnRTrVmkNCYmiY0+bnP6uhSrzh8wXnCNlx/ce4Olptc2
	IadbQm4BBODDmbA4P1766OxIqqElG4VMXA0az+NED07uvkEGNWuBi0fLyvCz1o6k5ZZeL9vvajM
	6S5yquNL0V+UrXJXI2vI8MQyOap1jBNO9vyzsrq4I5/q/dldK51L07h2gjIfsNI8UmGnI=
X-Google-Smtp-Source: AGHT+IH927TJx12g5L+f4UvwmJSpyFLP646joXKbuPaPLsJP4UIRBz5HsUG/SeqJtXFogQ3sNRYq8w9SR5c4lfv0hP8=
X-Received: by 2002:a17:902:d2cd:b0:224:a96:e39 with SMTP id
 d9443c01a7336-2292f9494f0mr244571075ad.9.1743683017454; Thu, 03 Apr 2025
 05:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
 <Z-5BHzTEed607Afz@smile.fi.intel.com> <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
 <Z-5uJxij4jmhint3@smile.fi.intel.com>
In-Reply-To: <Z-5uJxij4jmhint3@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 14:23:24 +0200
X-Gm-Features: AQ5f1Jo_RXN1ENnE0cHENRgDv04RVrV-5CFXHSVdXoTQ4m-0m2SmcuwYC8Ay4hw
Message-ID: <CAMRc=MdPiz_YD451Arrm4mT-SwU_OdK1U-WozPxsvt11mHsLZQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 1:17=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > But this encourages people to get sloppy and just ignore
> > > > error pointers returned from gpiod_get()?
> > >
> > > From where did you come to this conclusion, please? We have many subs=
ystems
> > > that ignore invalid resource on the release stage, starting from plat=
form
> > > device driver core.
> >
> > The fact that many people do something does not mean it's correct.
>
> And it doesn't tell it is incorrect either. We are going to conclude that=
 there
> are pros and cons on each of the approaches, but I don't see much a point=
 in
> yours, sorry.
>

My point is:

You get a descriptor with gpiod_get_optional(). You can get three
types of a pointer back:

1. Valid descriptor: you can use it in all GPIO consumer functions.
2. NULL-pointer: you can still use it in all GPIO consumer functions.
They will act as if they succeeded. This is expected as this is how
the "optional" functionality is implemented. Had it been written in
rust, we'd do it better but we use the tools we have. It's very much a
"valid" value to pass to gpiod routines.
3. IS_ERR() value. If you try to pass it to any of the GPIO consumer
functions, they will return it back to you and print a warning. Why?
Because it's an invalid object. And there's no reason to make
gpiod_put() an exemption. You never could have used an IS_ERR()
correctly. Look at what devres does - if it got an IS_ERR(), it never
schedules a release action.

> > Many other subsystem scream loudly when that happens, so I would be ok
> > with adding a big WARN_ON(IS_ERR(desc)).
>
> I disagree. This is not that case where passing an error pointer should b=
e
> an issue.
>
> > > > Also: all other calls error out on IS_ERR(desc) so why would we mak=
e it an
> > > > exception?
> > >
> > > Because it's _release_ stage that participates in the cleaning up of
> > > the allocated resources in error paths. It's a common approach in
> > > the kernel. I would rather ask what makes GPIOLIB so special about it=
?
> >
> > Just because it's the release stage, does not mean you shouldn't care
> > about the correctness of the consumer code. Passing an IS_ERR(descr)
> > to any of the GPIO APIs can happen if the user ignores an error
> > returned by gpiod_get(). That's not alright.
>
> Have you ever seen such a code in the cases when it's okay (like in platf=
orm
> device driver users)? I do not. So, the above is based on the hypothetica=
l
> assumption that somebody will make silly things. If you _really_ care abo=
ut
> checking the error, add __must_check to the respective functions.
>

They already have but people do the following (like in the affected SPI dri=
ver):

struct driver_data *data =3D kzalloc();

Then elsewhere:

data->gpiod =3D gpiod_get();
if (IS_ERR(data->gpiod))
    return PTR_ERR(data->gpiod);

The data struct now contains the IS_ERR() value. I don't think it
makes any sense for it to carry it around and I don't want to enable
it.

Bart
