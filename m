Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6861FC7CB
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744480392; cv=none; b=UE1QsGMBonNzoAImKCCivNLkOI1qjCiQynMvtEuRrhrcT5bmbDEK2RhORxHENYkgneeugr3gKRTFIUtQF5w1WbuoMvwPTnhA9EIiN/n7ExJnL1nWdCPdqOv1zPq3h3pnm6lxS9icxbWb3lvvJA+pqY9CWATqXWDs4/X6t9dyIJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744480392; c=relaxed/simple;
	bh=4/22I0xmiWJyIUEMNmDdSmsIbv7PSPfxkSn00iJPodU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIjv1tTCfTVKlU1ugeqx9sQ9VQnZJhllLstloQkgkbVu6hk6BM+GsHzDyaHXOHIGBdnleT4qrt9oy54EBKyLdmyFVWPfDfpm5sKVpqJZ5ScYlAvejKgOw6T8IyTIfplgRRfa0AEWLAK+Q+/PZ75wutexOkxiyYT9lmJWtTfJxnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTQHkOWj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTQHkOWj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac7bd86f637so798392466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744480389; x=1745085189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTIDIk2RD4/cJXZhbbMkMN1ozONXGjfoBcOhKEuE5xo=;
        b=CTQHkOWjafi7pJBRBD/AFKB0roU3Jml2y/4+DTRxoj7DmLxqAQNIkIzOmitc3wqEeC
         tnd9ss74aLUwbzAP9jgPWXqMBvTYwAKT5UgLGgVkNDxvcW16xrcSGFiEnGXzgWoG+f0X
         tnUnrGAKjkV0YXP/t6udjvAP4Qyqm8RMDbNylZT6Bdh6rg/X1UJrvqP/t19kJoKlXh2f
         1tk/Gte7Jajg9JHBImZCZcuqpCqC6myokkTDaf5X4BYXvd0H1QAvlKo4KRpRMzxbXLWb
         GJwLxeDBBS4QslwAjyNQsBZjygpL01eejZxaf+vaRe+zbcabEVIiRCW0y2dV6dRDW6sL
         xrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744480389; x=1745085189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTIDIk2RD4/cJXZhbbMkMN1ozONXGjfoBcOhKEuE5xo=;
        b=bSdPoyXIm4wDyVA9FdEIAI5E0Fbu9m2UfOXRPiOSyA+tiqHyOOexC/TTVOdQgcedTZ
         Z8gw9uETy848ZKMdMOZrtYXmIRu0YxVNXsWN9eJkcIXUlCGH9nTvfdWy2QCqPnq8Xa4O
         Fp59FMYAsyNfg/RWF/kqnRh5FIsHG3dpWooYfw4fia/24DbzOjDCORw/sasiCIwX8led
         jNrpV/96Fq0nwUUw1mvPBAOmUFv509kcwP5ZVrJI/uyC7+5Ukhx5BRA3MC2xB8hpBYyu
         6GIDyLtDHQgKG6u69wf/X/uDaTWQY1D3204Ymr8Xz+kuwcq2S/nKO2rjEEscZ0n0Tsg/
         mssg==
X-Forwarded-Encrypted: i=1; AJvYcCVLjbOvcz0zAexCrdkk9P08ePpsXG9TPiLyC87kCqHqJVxx9hiSCu+hHDsdrShjcqt0JNDLWMx3ejvlUNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6G7eb7bQLbsReSL8J6EoQlScOv0CqHM8SZtYmO0S6DsHd9NY
	pChFkxPCdFBLtjdPdCR6J+bkTC6XfyrEdtoRx4MGoZ2upCaemk2mbz2ZCIgq/jou3nX+htw4904
	+cUR4mwqidJvf0MfDcoTTjpFI+EA=
X-Gm-Gg: ASbGncvRzMQULc63b8zrhJs1tyPEHmfk5CGs9vExsJbzkvyN2czrw4jIutLYmnEfXGk
	viT+DozFUFEJrdQC8GH5LGD0nNdbB/VtYEEZGLdX/JaZx77RqWeaZtEwlQpMxnyxjfBC3jh9x/f
	JfLoL386Fvt369WHOQCcF2mfwixRA4zJZu
X-Google-Smtp-Source: AGHT+IGXxYy5GLEYPwhASMJUu7WvBGCB7hCpf2shHnOJpdkQ69BTD1P8Oi264iRYwSIR+Z+qGF/uXPzF4wK1YaliPgM=
X-Received: by 2002:a17:906:f597:b0:ac8:1bbe:1a5b with SMTP id
 a640c23a62f3a-acabbee7e6cmr876592166b.9.1744480388897; Sat, 12 Apr 2025
 10:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
 <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain> <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>
 <209e5330-a4d4-4ecc-8d56-199f4a190c3c@stanley.mountain>
In-Reply-To: <209e5330-a4d4-4ecc-8d56-199f4a190c3c@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Apr 2025 20:52:32 +0300
X-Gm-Features: ATxdqUFSwpWNfzAo0ElmV_5q1MvPxqlaMq7WQ98tAioZ7pVSAamB26tknu9iyQk
Message-ID: <CAHp75Vdqnk_qNs8Rc4M-Rh5-AXCi4uV+iw6sbHXEZiaBaFoRyA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 5:19=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Fri, Apr 11, 2025 at 03:47:40PM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 11, 2025 at 1:37=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > > On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> > > >
> > > > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> > > >
> > > > cmp is good but not good enough in general. Here it shows the 1:1
> > > > binary, but in some cases code can be the same, while binaries are
> > > > different. To make sure the code is the same use the bloat-o-meter
> > > > tool instead.
> > >
> > > I don't understand what you're saying at all.  cmp shows that the com=
piler
> > > was automaticall tanslating the "& 0xfff" into "% 04096u" so the resu=
lting
> > > object files are exactly the same.
> >
> > There is a possibility that the compiler changes the code to the
> > equivalent and cmp will break, bloat-o-meter will check at least what
> > happened to the size of the *code*. object file is not only a code. It
> > may also contain debug symbols and other stuff which may break cmp,
> > while the code can be *the same*.
>
> So far as I can see bloat-o-meter is only looking at the size.  I
> deliberately introduced a bug to see if bloat-o-meter said anything but
> it said the size was the same.

Not "size", "size of the code" is more specific. That makes the
difference to cmp which may lag even on the same code, but slightly
different debuginfo, for example.

--=20
With Best Regards,
Andy Shevchenko
