Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9CAD23
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934364; cv=none; b=iLYO+0ivOsf1rlWovwPA8d5VFyQCaXbnNTuQa+dA6+LI/Dd+g1ksSI4oagfTapxfZlpBSUjw7hBSJm/deNQDbEkcH2rshxx2xmSYGkRo4QJjReUOmxm2pRIi0T/t1yfoKRghwCrhsx0DjyM27k6+MC6Pe6zaxl0XJmtwlusYD+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934364; c=relaxed/simple;
	bh=Zw7JnFzVMeuo8BnGhrCv9FlB2nDeaokUhdGlmW2Jmy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttZ37cHcdut4W2uOdTsp3RChaKOYIMwpbGeRPcMTiw3E/q5lDKO/dq2MXIm8IWzeU7PyNEjkOy35sLQgplClmPcBrDujr+9LU0DBb2TJo0wH1AHuVJkpqz13s4kQz90o20JGEYeZWGeLE/ozyyPZN4kcjRhzU22cWeGBOhdtka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gqVVa1d0; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gqVVa1d0"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CCC3D22DCD;
	Tue,  3 Jun 2025 09:05:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxEtRYlshMp1; Tue,  3 Jun 2025 09:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1748934359; bh=Zw7JnFzVMeuo8BnGhrCv9FlB2nDeaokUhdGlmW2Jmy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gqVVa1d0kS8sNmrwCPstBGKaALFpmZoZReHsVYtLmEaZgjsn4ikGbj3nzh/OugPD5
	 HXEpOFUPqQ4pR2O+dJe1TC8d+1WujXUJb71txVCDPLb8Ktbi8K8OShQ+CTePJ6Mifv
	 43F+2G5BmY3obv7HtWVD0XRKp7qlaCX4s8xSNcP4Z11/25z3DRLUcLROr/7E4e5mX+
	 b4BvC1QaCY1oprNpSoSUsWpHa1R2EzBBZfflFZjdqIiPz619ckNWTIwfEDpDbPZ9xE
	 jWCD0brTE60P5Hwz48y4h0RRSNoW2N9LfMfbAHUPzUGFlKb+C6MSMt3I+hdUmuLf5d
	 tntexQwxWhiDw==
Date: Tue, 3 Jun 2025 07:05:52 +0000
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 2/2] platform/loongarch: laptop: Support backlight power
 control
Message-ID: <aD6e0JLntUC6BdH7@pie.lan>
References: <20250531113851.21426-1-ziyao@disroot.org>
 <20250531113851.21426-3-ziyao@disroot.org>
 <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com>

On Tue, Jun 03, 2025 at 12:16:57PM +0800, Huacai Chen wrote:
> On Sat, May 31, 2025 at 7:39 PM Yao Zi <ziyao@disroot.org> wrote:
> >
> > loongson_laptop_turn_{on,off}_backlight() are designed for controlling
> > power of the backlight, but they aren't really used in the driver
> > previously.
> >
> > Unify these two functions since they only differ in arguments passed to
> > ACPI method, and wire up loongson_laptop_backlight_update() to update
> > power state of the backlight as well. Tested on TongFang L860-T2 3A5000
> > laptop.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/platform/loongarch/loongson-laptop.c | 53 +++++++-------------
> >  1 file changed, 19 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
> > index 828bd62e3596..f01e53b1c84d 100644
> > --- a/drivers/platform/loongarch/loongson-laptop.c
> > +++ b/drivers/platform/loongarch/loongson-laptop.c
> > @@ -56,8 +56,6 @@ static struct input_dev *generic_inputdev;
> >  static acpi_handle hotkey_handle;
> >  static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
> >
> > -int loongson_laptop_turn_on_backlight(void);
> > -int loongson_laptop_turn_off_backlight(void);
> >  static int loongson_laptop_backlight_update(struct backlight_device *bd);
> >
> >  /* 2. ACPI Helpers and device model */
> > @@ -354,6 +352,22 @@ static int ec_backlight_level(u8 level)
> >         return level;
> >  }
> >
> > +static int ec_backlight_set_power(bool state)
> > +{
> > +       int status;
> > +       union acpi_object arg0 = { ACPI_TYPE_INTEGER };
> > +       struct acpi_object_list args = { 1, &arg0 };
> > +
> > +       arg0.integer.value = state;
> > +       status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> > +       if (ACPI_FAILURE(status)) {
> > +               pr_info("Loongson lvds error: 0x%x\n", status);
> > +               return -EIO;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int loongson_laptop_backlight_update(struct backlight_device *bd)
> >  {
> >         int lvl = ec_backlight_level(bd->props.brightness);
> > @@ -363,6 +377,8 @@ static int loongson_laptop_backlight_update(struct backlight_device *bd)
> >         if (ec_set_brightness(lvl))
> >                 return -EIO;
> >
> > +       ec_backlight_set_power(bd->props.power == BACKLIGHT_POWER_ON ? true : false);
> It is better to check the status before setting, because the EC
> firmware may not be as robust as needed, a checking can reduce
> interactions between kernel and EC.
> 
> There is an example: dp_aux_backlight_update_status() in
> drivers/gpu/drm/display/drm_dp_helper.c.

It's reasonable and I'll take it.

> > +
> >         return 0;
> >  }
> >
> > @@ -394,6 +410,7 @@ static int laptop_backlight_register(void)
> >
> >         props.brightness = ec_get_brightness();
> >         props.max_brightness = status;
> > +       props.power = BACKLIGHT_POWER_ON;
> >         props.type = BACKLIGHT_PLATFORM;
> >
> >         backlight_device_register("loongson_laptop",
> > @@ -402,38 +419,6 @@ static int laptop_backlight_register(void)
> >         return 0;
> >  }
> >
> > -int loongson_laptop_turn_on_backlight(void)
> > -{
> > -       int status;
> > -       union acpi_object arg0 = { ACPI_TYPE_INTEGER };
> > -       struct acpi_object_list args = { 1, &arg0 };
> > -
> > -       arg0.integer.value = 1;
> > -       status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> > -       if (ACPI_FAILURE(status)) {
> > -               pr_info("Loongson lvds error: 0x%x\n", status);
> > -               return -ENODEV;
> > -       }
> > -
> > -       return 0;
> > -}
> > -
> > -int loongson_laptop_turn_off_backlight(void)
> > -{
> > -       int status;
> > -       union acpi_object arg0 = { ACPI_TYPE_INTEGER };
> > -       struct acpi_object_list args = { 1, &arg0 };
> > -
> > -       arg0.integer.value = 0;
> > -       status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
> > -       if (ACPI_FAILURE(status)) {
> > -               pr_info("Loongson lvds error: 0x%x\n", status);
> > -               return -ENODEV;
> > -       }
> > -
> > -       return 0;
> > -}
> I prefer to keep them, in downstream kernels there are users of them,
> I don't want to add them back if one day those users are upstream.

These two functions are mostly identical, and I think unifying them
together should be the right way to go. If this makes sense, users
introduced in the future should also adapt it, instead of keeping
redundant code in the current mainline kernel.

If there're new users of the API out of the loongson3_laptop module in
the future, it's still easy to rename ec_backlight_set_power() and
export it.

For these two points, I disagree on keeping these two symbols.

> Huacai

Thanks,
Yao Zi

> > -
> >  static int __init event_init(struct generic_sub_driver *sub_driver)
> >  {
> >         int ret;
> > --
> > 2.49.0
> >
> >
> 
