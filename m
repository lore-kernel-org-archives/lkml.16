Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E728F935
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045486; cv=none; b=r8emm4zr1TZrUuGS9zk+PxhXMCweWQUBPXpy9ovP5faamGwd/3i32RbygwfFBg6+ozM9+REVkB1Nx9XJw0ecY0iDmaD/I5uVZxjDd/ciux4HysLaHghle/vRnbYXN8RSCWnpuSVjAauGl7BESYoclrIuHS2H+EwUz0I66l/R5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045486; c=relaxed/simple;
	bh=QRXYHY3k9SKVaoLTElRZshkhV3csk41wh+DXOlD/xiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cm2z9MqvTYNkJrgq2V7enB4/SUtTFc/Q6V9LPGw+E4mV9dyxGfQj2b+cScf8CIv/6rnhbt2C72dzCZGERrd5fTLSme4x5qw4GnP8nNwTzDg+vLw+N5IT6IKUlPGeNvoQjy1yiygMn3ekKXxFsJSqBSKF2hHA5xqfqx8y6RQ7JIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSlvmc5U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSlvmc5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EE4C4CEF2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749045486;
	bh=QRXYHY3k9SKVaoLTElRZshkhV3csk41wh+DXOlD/xiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kSlvmc5UV/fAMKvoYTu89L4yT7pJpL6XY+Dtwsck1IoVfEuNBz3kZh79EKzgTZ4Jo
	 RnKD0pkEFoU+YD9EN1EdByM48mmyfeenyUT8Thq/W1ff2AGFxdOs13IvdtJbcT1OeW
	 ZM/lg2KQgXN0lHOBkjgYkMVHN6xZ01myRXVqMPzYKrSlSsPnnEsJ1ZmoJ+MD4a8bOk
	 Ch8EX8PK5RLC56eZpkkX4xu7/wNA7RF2aiysvuv9bN4cEafixJwAqNxNGaOPiUefF4
	 54XCHaDb5NyQzc7gAJykVoxjKdWHXz1SLbpp0GhSOMU3fFoxGWyn5rt9eAeL+uR6k4
	 o1N/uValiBfzQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so12979714a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWMXmBYqhDklmWyp42VaDe4Mz1Obj9f2wiQpFBbNmGo5oW4nI99xL08+DqGJnBrxWfQCSIFTWVS6NdCp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlH10y7zcwheF+DlMDcT7jTLafkiOdbmWpvSnPSnamunjVq8Qo
	rhLhttrslXWYOYl9uEZoXBhBFpIdkbYLPTLliiieEIobAlZN46Zd6WR0kvDahEBMXloN557+N34
	UkvL49o5xiHivZMmKloib+Gqo7YvaAQc=
X-Google-Smtp-Source: AGHT+IEBYJAM+K0rj2+spRhzULHWaeKMSJzGwvvpMAeB0yguZc1nfk4ig2PEKpq0Mb7MT9uKBmXBl3Ukizgy5R+1c3A=
X-Received: by 2002:a05:6402:348e:b0:601:f3f1:f10e with SMTP id
 4fb4d7f45d1cf-606e98b0c7fmr3019199a12.5.1749045484519; Wed, 04 Jun 2025
 06:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531113851.21426-1-ziyao@disroot.org> <20250531113851.21426-3-ziyao@disroot.org>
 <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com> <aD6e0JLntUC6BdH7@pie.lan>
In-Reply-To: <aD6e0JLntUC6BdH7@pie.lan>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 4 Jun 2025 21:57:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4yt2Rdu5-8QsDyXpLo5v8jHSDmBB0nBO+4-pKzfbYJHA@mail.gmail.com>
X-Gm-Features: AX0GCFvFtnwLjh5Ih6ITY7Ya5PF5l-bEs8ErSYvVmN0nCXxUeNlxcWJrZ3JdK00
Message-ID: <CAAhV-H4yt2Rdu5-8QsDyXpLo5v8jHSDmBB0nBO+4-pKzfbYJHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/loongarch: laptop: Support backlight power control
To: Yao Zi <ziyao@disroot.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 3:06=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> On Tue, Jun 03, 2025 at 12:16:57PM +0800, Huacai Chen wrote:
> > On Sat, May 31, 2025 at 7:39=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrot=
e:
> > >
> > > loongson_laptop_turn_{on,off}_backlight() are designed for controllin=
g
> > > power of the backlight, but they aren't really used in the driver
> > > previously.
> > >
> > > Unify these two functions since they only differ in arguments passed =
to
> > > ACPI method, and wire up loongson_laptop_backlight_update() to update
> > > power state of the backlight as well. Tested on TongFang L860-T2 3A50=
00
> > > laptop.
> > >
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  drivers/platform/loongarch/loongson-laptop.c | 53 +++++++-----------=
--
> > >  1 file changed, 19 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/p=
latform/loongarch/loongson-laptop.c
> > > index 828bd62e3596..f01e53b1c84d 100644
> > > --- a/drivers/platform/loongarch/loongson-laptop.c
> > > +++ b/drivers/platform/loongarch/loongson-laptop.c
> > > @@ -56,8 +56,6 @@ static struct input_dev *generic_inputdev;
> > >  static acpi_handle hotkey_handle;
> > >  static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
> > >
> > > -int loongson_laptop_turn_on_backlight(void);
> > > -int loongson_laptop_turn_off_backlight(void);
> > >  static int loongson_laptop_backlight_update(struct backlight_device =
*bd);
> > >
> > >  /* 2. ACPI Helpers and device model */
> > > @@ -354,6 +352,22 @@ static int ec_backlight_level(u8 level)
> > >         return level;
> > >  }
> > >
> > > +static int ec_backlight_set_power(bool state)
> > > +{
> > > +       int status;
> > > +       union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> > > +       struct acpi_object_list args =3D { 1, &arg0 };
> > > +
> > > +       arg0.integer.value =3D state;
> > > +       status =3D acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> > > +       if (ACPI_FAILURE(status)) {
> > > +               pr_info("Loongson lvds error: 0x%x\n", status);
> > > +               return -EIO;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int loongson_laptop_backlight_update(struct backlight_device =
*bd)
> > >  {
> > >         int lvl =3D ec_backlight_level(bd->props.brightness);
> > > @@ -363,6 +377,8 @@ static int loongson_laptop_backlight_update(struc=
t backlight_device *bd)
> > >         if (ec_set_brightness(lvl))
> > >                 return -EIO;
> > >
> > > +       ec_backlight_set_power(bd->props.power =3D=3D BACKLIGHT_POWER=
_ON ? true : false);
> > It is better to check the status before setting, because the EC
> > firmware may not be as robust as needed, a checking can reduce
> > interactions between kernel and EC.
> >
> > There is an example: dp_aux_backlight_update_status() in
> > drivers/gpu/drm/display/drm_dp_helper.c.
>
> It's reasonable and I'll take it.
>
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -394,6 +410,7 @@ static int laptop_backlight_register(void)
> > >
> > >         props.brightness =3D ec_get_brightness();
> > >         props.max_brightness =3D status;
> > > +       props.power =3D BACKLIGHT_POWER_ON;
> > >         props.type =3D BACKLIGHT_PLATFORM;
> > >
> > >         backlight_device_register("loongson_laptop",
> > > @@ -402,38 +419,6 @@ static int laptop_backlight_register(void)
> > >         return 0;
> > >  }
> > >
> > > -int loongson_laptop_turn_on_backlight(void)
> > > -{
> > > -       int status;
> > > -       union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> > > -       struct acpi_object_list args =3D { 1, &arg0 };
> > > -
> > > -       arg0.integer.value =3D 1;
> > > -       status =3D acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> > > -       if (ACPI_FAILURE(status)) {
> > > -               pr_info("Loongson lvds error: 0x%x\n", status);
> > > -               return -ENODEV;
> > > -       }
> > > -
> > > -       return 0;
> > > -}
> > > -
> > > -int loongson_laptop_turn_off_backlight(void)
> > > -{
> > > -       int status;
> > > -       union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> > > -       struct acpi_object_list args =3D { 1, &arg0 };
> > > -
> > > -       arg0.integer.value =3D 0;
> > > -       status =3D acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> > > -       if (ACPI_FAILURE(status)) {
> > > -               pr_info("Loongson lvds error: 0x%x\n", status);
> > > -               return -ENODEV;
> > > -       }
> > > -
> > > -       return 0;
> > > -}
> > I prefer to keep them, in downstream kernels there are users of them,
> > I don't want to add them back if one day those users are upstream.
>
> These two functions are mostly identical, and I think unifying them
> together should be the right way to go. If this makes sense, users
> introduced in the future should also adapt it, instead of keeping
> redundant code in the current mainline kernel.
>
> If there're new users of the API out of the loongson3_laptop module in
> the future, it's still easy to rename ec_backlight_set_power() and
> export it.
>
> For these two points, I disagree on keeping these two symbols.
OK, please add a check before communicating with EC, and then send V2
as soon as possible.

Huacai

>
> > Huacai
>
> Thanks,
> Yao Zi
>
> > > -
> > >  static int __init event_init(struct generic_sub_driver *sub_driver)
> > >  {
> > >         int ret;
> > > --
> > > 2.49.0
> > >
> > >
> >
>
