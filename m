Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB61173
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748924231; cv=none; b=A6G9ldkj2Db6EhDALwAIaqETZV6Khg5AAy5dqNNDYgTXeWHd9RM3k3uuKj7hEc+z71jB0Y/eSP2UYjtsyptlYL63Y9oACgnvwthZ089rgR7t1UbkEiV5YXvGqhtd3t1c9IKdicGuvmMJxTbpg3Cou7GMIeCziBhW57h3Xj4g+e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748924231; c=relaxed/simple;
	bh=XRDY9zSxHcc62kDSn/UH0a3mwSSK/2qlasZ8dIAXwAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiSUegSg0lS9GaUc4PgNM3W0h6jb1/Ghr7avQSxYdrEem8WzAapvupUlEX9Lg2JVZg0VnLgHxeR83gVBgp3RRymDpDAsd1s6ARlwDhc5NNL1o7OvmTjCypsywHGxWp/E44KjgtmB2aprexTaLa8fI9DA/DAjzgFROt6biUJ0RQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFnOdzps; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFnOdzps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FC1C4AF09
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 04:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748924231;
	bh=XRDY9zSxHcc62kDSn/UH0a3mwSSK/2qlasZ8dIAXwAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iFnOdzps49b6TBdsZZjI5Xiwk39Lu9OgU3gKPjD/lEfx+CRIn72wrVoBn2ETRIkuU
	 rh5NSYQ3I3zIUGA+u/i4UJA7lLR6KO4FTvAg9q0cZoYSVXyylwUNTqFsYyX1Pk47VA
	 3IgWftW3RlsDMezLwCOhGvVjdZM+FGuZ0N9BKMhV4c8GSj+A0cHC2PPm2+hO2iwOzh
	 uEed9ABZFXKtRDSzqGsmXCQjz+U3G2800qm+6dFWgpDdI6UxTtBPUqYmDS++rDG2vA
	 H+eEktm3PuFJM9OAvWp6MA0xYEctEzQaXmfA41AZplkTS8fnDkbG4IdjWiSQaEPOum
	 rXd7yPHEy6+YA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d35dso2050782a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 21:17:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPrEHojjLRo7kRKZ/KipdVGoTcmNIOlXlvN8g5omFU9zOFlkJfOUpFl2qPqOowKlElPupLLZo/xDXveIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrrjYtHzINg/M5UEOVjP7gf0uu2BSO+YJiPHmkX5i2KdLiojfI
	hKnlc2BVqIjwPSXff9vA0ulLr9M/yxfOsgBT1kpSISUY9L5yQ9jXsB2/4OjHVrJzBm366428m6d
	jHJip/i18xkFiFTN6LMpGxFjsmMhEi/U=
X-Google-Smtp-Source: AGHT+IFlKJRUmZShCh2I0yGRQF78KfGY/dJ7szUVgLqypmx/e6zsubpaucOknF0IAGoLCJOVwpaGW5wfAGsmBvA+l2s=
X-Received: by 2002:a05:6402:1e8c:b0:602:a0:1f2c with SMTP id
 4fb4d7f45d1cf-606b08b3893mr909738a12.9.1748924229929; Mon, 02 Jun 2025
 21:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531113851.21426-1-ziyao@disroot.org> <20250531113851.21426-3-ziyao@disroot.org>
In-Reply-To: <20250531113851.21426-3-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 3 Jun 2025 12:16:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com>
X-Gm-Features: AX0GCFudVd0uVnRc2xdUPzyvIpGHwhh874hD1PVMo_7kVubHSRXVUsrL1bry0mc
Message-ID: <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/loongarch: laptop: Support backlight power control
To: Yao Zi <ziyao@disroot.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 7:39=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> loongson_laptop_turn_{on,off}_backlight() are designed for controlling
> power of the backlight, but they aren't really used in the driver
> previously.
>
> Unify these two functions since they only differ in arguments passed to
> ACPI method, and wire up loongson_laptop_backlight_update() to update
> power state of the backlight as well. Tested on TongFang L860-T2 3A5000
> laptop.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/platform/loongarch/loongson-laptop.c | 53 +++++++-------------
>  1 file changed, 19 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platf=
orm/loongarch/loongson-laptop.c
> index 828bd62e3596..f01e53b1c84d 100644
> --- a/drivers/platform/loongarch/loongson-laptop.c
> +++ b/drivers/platform/loongarch/loongson-laptop.c
> @@ -56,8 +56,6 @@ static struct input_dev *generic_inputdev;
>  static acpi_handle hotkey_handle;
>  static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
>
> -int loongson_laptop_turn_on_backlight(void);
> -int loongson_laptop_turn_off_backlight(void);
>  static int loongson_laptop_backlight_update(struct backlight_device *bd)=
;
>
>  /* 2. ACPI Helpers and device model */
> @@ -354,6 +352,22 @@ static int ec_backlight_level(u8 level)
>         return level;
>  }
>
> +static int ec_backlight_set_power(bool state)
> +{
> +       int status;
> +       union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> +       struct acpi_object_list args =3D { 1, &arg0 };
> +
> +       arg0.integer.value =3D state;
> +       status =3D acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> +       if (ACPI_FAILURE(status)) {
> +               pr_info("Loongson lvds error: 0x%x\n", status);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  static int loongson_laptop_backlight_update(struct backlight_device *bd)
>  {
>         int lvl =3D ec_backlight_level(bd->props.brightness);
> @@ -363,6 +377,8 @@ static int loongson_laptop_backlight_update(struct ba=
cklight_device *bd)
>         if (ec_set_brightness(lvl))
>                 return -EIO;
>
> +       ec_backlight_set_power(bd->props.power =3D=3D BACKLIGHT_POWER_ON =
? true : false);
It is better to check the status before setting, because the EC
firmware may not be as robust as needed, a checking can reduce
interactions between kernel and EC.

There is an example: dp_aux_backlight_update_status() in
drivers/gpu/drm/display/drm_dp_helper.c.

> +
>         return 0;
>  }
>
> @@ -394,6 +410,7 @@ static int laptop_backlight_register(void)
>
>         props.brightness =3D ec_get_brightness();
>         props.max_brightness =3D status;
> +       props.power =3D BACKLIGHT_POWER_ON;
>         props.type =3D BACKLIGHT_PLATFORM;
>
>         backlight_device_register("loongson_laptop",
> @@ -402,38 +419,6 @@ static int laptop_backlight_register(void)
>         return 0;
>  }
>
> -int loongson_laptop_turn_on_backlight(void)
> -{
> -       int status;
> -       union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> -       struct acpi_object_list args =3D { 1, &arg0 };
> -
> -       arg0.integer.value =3D 1;
> -       status =3D acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> -       if (ACPI_FAILURE(status)) {
> -               pr_info("Loongson lvds error: 0x%x\n", status);
> -               return -ENODEV;
> -       }
> -
> -       return 0;
> -}
> -
> -int loongson_laptop_turn_off_backlight(void)
> -{
> -       int status;
> -       union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> -       struct acpi_object_list args =3D { 1, &arg0 };
> -
> -       arg0.integer.value =3D 0;
> -       status =3D acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> -       if (ACPI_FAILURE(status)) {
> -               pr_info("Loongson lvds error: 0x%x\n", status);
> -               return -ENODEV;
> -       }
> -
> -       return 0;
> -}
I prefer to keep them, in downstream kernels there are users of them,
I don't want to add them back if one day those users are upstream.

Huacai

> -
>  static int __init event_init(struct generic_sub_driver *sub_driver)
>  {
>         int ret;
> --
> 2.49.0
>
>
