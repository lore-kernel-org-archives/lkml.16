Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6672512F1;
	Mon, 12 May 2025 22:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087218; cv=none; b=fpiGXSQ/421cVfcfOFT3v/JQoqxZPyDx1TcDVHW9fxOWN/BySm5Q1bKHmf/iMSlKIX3iYkm1OTNjoGWeYxnd7PHcG0b3WRE8+IKgG9a85v/mZf7dWault37x6WcOA0w3+MiSiC79xzLfoTzsl6z6vlQirNnT8sM7H7YThqiMe1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087218; c=relaxed/simple;
	bh=8loaMVYhJS2d2avEyYdO5ac3SbfckOfOZcW55+mMQRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baTF88d//sjua6hTLiCpu2NVw8GPvn+sM0ZLscR9dvWO6xI7ioLx1wQYoC88yKin5fPw6vCLDJXkVu9GfEMi4ZYFuebE1eDKaEEl0id74Rbbmx7Z4+DrdsXbBH4jKMMtfJmPY63o+q7M+wq3xxXqSaUhew9KazRJp3bHyKmzNHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=tNuejeyY; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="tNuejeyY"
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id D41052E0ABA6;
	Tue, 13 May 2025 01:00:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1747087212;
	bh=fs7kKhEMM32+OPrdo58LmoyECFBC/7/Yl4xWNCl6ppo=;
	h=Received:From:Subject:To;
	b=tNuejeyYRKVh3oEJ5XPauL0/4Yw+AIheyhMZ+QdK2gv6iJdmXKP+UsHy4wBpge9zF
	 6NBjTzc6lDd2zZyJpQqkKLTKVhByL2zIjfDcFvYY6S0ey9zuuKFr1a+gvVTEEAU3X2
	 fjkVv45jLx6U8UmTOyp/DvO3zmZary1imkWwRU6E=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-326bd400027so49393961fa.1;
        Mon, 12 May 2025 15:00:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV41PZetCCZCA+LEaHV4m8SbJgMjx1TCqVv0fjgSRlQKw0PsRSZHTbC80nbRFgYwIDB6hhN96k8+MVmmDQ=@vger.kernel.org,
 AJvYcCV6ehDnrCXBCHvi1ndnc8n1+tsCJUaP6/xYSrzMphTixdEOrTck4thvsPGPP7glT+Qh/2ZCJObOw+iI29XM@vger.kernel.org,
 AJvYcCWElGCaf+tDTp0AbSmhALNcD9Q6yOADikMh2znafJhGORfRJIvlgzxnR1fedH7hiZVMheLaMXbwnqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8wH1qMFsuYJZ+bIKtq5PK52Oq2b8VsvAr6dSrU0GOS5HGtE9
	JFgOl3sKsE982PReeeCAYF+0LfCjGgyO4n7bZxEBP7BcEhdKPWKbB0MKjEQAuWVa7xjablrNa7s
	A3WCDaq5x/g1BQYe1QotbbWQtQP0=
X-Google-Smtp-Source: 
 AGHT+IHvdn6Lh2bCsAQjYeRWcWYH1qz5gMwm/eLHnyN6Otlm0v/joGPtCZsWOfRy9I8hqckKYUzSiVOR+7h8rp0gV3c=
X-Received: by 2002:a2e:bd0f:0:b0:326:ca4b:1ff1 with SMTP id
 38308e7fff4ca-327e137d5f3mr4343071fa.19.1747087211104; Mon, 12 May 2025
 15:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-6-lkml@antheas.dev>
 <D9TQ3FWVTOBM.4GU600TZ7NZ9@gmail.com>
In-Reply-To: <D9TQ3FWVTOBM.4GU600TZ7NZ9@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 12 May 2025 23:59:59 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwE6J-WFCh6j79sg-ALut0_wya0m-4=Rfzf6xhKKxvf0Tw@mail.gmail.com>
X-Gm-Features: AX0GCFs4lJTaTicCjbdPFvpIXkQxWOThjULmqRKlU4kGL-WSvnsKLXchW9bPH2U
Message-ID: 
 <CAGwozwE6J-WFCh6j79sg-ALut0_wya0m-4=Rfzf6xhKKxvf0Tw@mail.gmail.com>
Subject: Re: [PATCH v1 05/10] platform/x86: msi-wmi-platform: Add platform
 profile through shift mode
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174708721245.26007.7193891384037248410@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 12 May 2025 at 01:34, Kurt Borja <kuurtb@gmail.com> wrote:
>
> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> > MSI's version of platform profile in Windows is called shift mode.
> > Introduce it here, and add a profile handler to it.
> >
> > It has 5 modes: sport, comfort, green, eco, and user.
> > Confusingly, for the Claw, MSI only uses sport, green, and eco,
> > where they correspond to performance, balanced, and low-power.
> > Therefore, comfort is mapped to balanced-performance, and user to
> > custom.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/Kconfig            |   1 +
> >  drivers/platform/x86/msi-wmi-platform.c | 117 ++++++++++++++++++++++++
> >  2 files changed, 118 insertions(+)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index bee98251b8f0b..57a48910c8fd4 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -746,6 +746,7 @@ config MSI_WMI_PLATFORM
> >       tristate "MSI WMI Platform features"
> >       depends on ACPI_WMI
> >       depends on HWMON
> > +     select ACPI_PLATFORM_PROFILE
> >       help
> >         Say Y here if you want to have support for WMI-based platform features
> >         like fan sensor access on MSI machines.
> > diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
> > index 9ac3c6f1b3f1d..c0b577c95c079 100644
> > --- a/drivers/platform/x86/msi-wmi-platform.c
> > +++ b/drivers/platform/x86/msi-wmi-platform.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/dmi.h>
> >  #include <linux/errno.h>
> >  #include <linux/fixp-arith.h>
> > +#include <linux/platform_profile.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/hwmon-sysfs.h>
> >  #include <linux/kernel.h>
> > @@ -63,6 +64,16 @@
> >  #define MSI_PLATFORM_AP_FAN_FLAGS_OFFSET     1
> >  #define MSI_PLATFORM_AP_ENABLE_FAN_TABLES    BIT(7)
> >
> > +/* Get_Data() and Set_Data() Shift Mode Register */
>
> Maybe you can write short documentation for these methods?
>
> > +#define MSI_PLATFORM_SHIFT_ADDR              0xd2
> > +#define MSI_PLATFORM_SHIFT_DISABLE   BIT(7)
> > +#define MSI_PLATFORM_SHIFT_ENABLE    (BIT(7) | BIT(6))
> > +#define MSI_PLATFORM_SHIFT_SPORT     (MSI_PLATFORM_SHIFT_ENABLE + 4)
> > +#define MSI_PLATFORM_SHIFT_COMFORT   (MSI_PLATFORM_SHIFT_ENABLE + 0)
> > +#define MSI_PLATFORM_SHIFT_GREEN     (MSI_PLATFORM_SHIFT_ENABLE + 1)
> > +#define MSI_PLATFORM_SHIFT_ECO               (MSI_PLATFORM_SHIFT_ENABLE + 2)
> > +#define MSI_PLATFORM_SHIFT_USER              (MSI_PLATFORM_SHIFT_ENABLE + 3)
>
> Instead of summing the profiles I suggest something like:
>
> enum MSI_PLATFORM_PROFILES {
>         MSI_PROFILE_COMFORT,
>         MSI_PROFILE_GREEN,
>         MSI_PROFILE_ECO,
>         MSI_PROFILE_USER,
>         MSI_PROFILE_SPORT,
> }
>
> And you can prepare your commands like
>
> command = MSI_PLATFORM_SHIT_ENABLE;
> command |= FIELD_PREP(GENMASK(1,0), MSI_PROFILE_{profile});
>
> I feel that it's cleaner this way. This is only a suggestion though.
>
> > +
> >  static bool force;
> >  module_param_unsafe(force, bool, 0);
> >  MODULE_PARM_DESC(force, "Force loading without checking for supported WMI interface versions");
> > @@ -100,12 +111,14 @@ enum msi_wmi_platform_method {
> >  };
> >
> >  struct msi_wmi_platform_quirk {
> > +     bool shift_mode;        /* Shift mode is supported */
> >  };
> >
> >  struct msi_wmi_platform_data {
> >       struct wmi_device *wdev;
> >       struct msi_wmi_platform_quirk *quirks;
> >       struct mutex wmi_lock;  /* Necessary when calling WMI methods */
> > +     struct device *ppdev;
> >  };
> >
> >  struct msi_wmi_platform_debugfs_data {
> > @@ -150,8 +163,10 @@ static const char * const msi_wmi_platform_debugfs_names[] = {
> >
> >  static struct msi_wmi_platform_quirk quirk_default = {};
> >  static struct msi_wmi_platform_quirk quirk_gen1 = {
> > +     .shift_mode = true
> >  };
> >  static struct msi_wmi_platform_quirk quirk_gen2 = {
> > +     .shift_mode = true
> >  };
> >
> >  static const struct dmi_system_id msi_quirks[] = {
> > @@ -561,6 +576,90 @@ static const struct hwmon_chip_info msi_wmi_platform_chip_info = {
> >       .info = msi_wmi_platform_info,
> >  };
> >
> > +static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
> > +{
> > +     set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> > +     set_bit(PLATFORM_PROFILE_BALANCED, choices);
> > +     set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> > +     set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>
> Please, use the non-atomic __set_bit(). `choices` is not shared between
> threads.
>
> > +     return 0;
> > +}
> > +
> > +static int msi_wmi_platform_profile_get(struct device *dev,
> > +                                     enum platform_profile_option *profile)
> > +{
> > +     struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     u8 buffer[32] = { };
>
> Move this to the top.
>
> > +
> > +     buffer[0] = MSI_PLATFORM_SHIFT_ADDR;
> > +
> > +     ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, sizeof(buffer));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (buffer[0] != 1)
> > +             return -EINVAL;
> > +
> > +     switch (buffer[1]) {
> > +     case MSI_PLATFORM_SHIFT_SPORT:
> > +             *profile = PLATFORM_PROFILE_PERFORMANCE;
> > +             return 0;
> > +     case MSI_PLATFORM_SHIFT_COMFORT:
> > +             *profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
>
> Maybe comfort can be mapped to balanced and green to cool. What do you
> think?

I forgot to comment on this one. The Claw uses ECO, GREEN, and
PERFORMANCE as its primary modes with 8, 12, 30W respectively. Comfort
is not used specifically for it. So I chose to push Green upwards to
balanced.

@Armin might know more about this one. If it turns out using comfort
for balanced fits better for laptops we can do that instead.

Antheas

>
> > +             return 0;
> > +     case MSI_PLATFORM_SHIFT_GREEN:
> > +             *profile = PLATFORM_PROFILE_BALANCED;
> > +             return 0;
> > +     case MSI_PLATFORM_SHIFT_ECO:
> > +             *profile = PLATFORM_PROFILE_LOW_POWER;
> > +             return 0;
> > +     case MSI_PLATFORM_SHIFT_USER:
> > +             *profile = PLATFORM_PROFILE_CUSTOM;
> > +             return 0;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static int msi_wmi_platform_profile_set(struct device *dev,
> > +                                     enum platform_profile_option profile)
> > +{
> > +     struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
> > +     u8 buffer[32] = { };
> > +
> > +     buffer[0] = MSI_PLATFORM_SHIFT_ADDR;
> > +
> > +     switch (profile) {
> > +     case PLATFORM_PROFILE_PERFORMANCE:
> > +             buffer[1] = MSI_PLATFORM_SHIFT_SPORT;
> > +             break;
> > +     case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> > +             buffer[1] = MSI_PLATFORM_SHIFT_COMFORT;
> > +             break;
> > +     case PLATFORM_PROFILE_BALANCED:
> > +             buffer[1] = MSI_PLATFORM_SHIFT_GREEN;
> > +             break;
> > +     case PLATFORM_PROFILE_LOW_POWER:
> > +             buffer[1] = MSI_PLATFORM_SHIFT_ECO;
> > +             break;
> > +     case PLATFORM_PROFILE_CUSTOM:
> > +             buffer[1] = MSI_PLATFORM_SHIFT_USER;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, sizeof(buffer));
> > +}
> > +
> > +static const struct platform_profile_ops msi_wmi_platform_profile_ops = {
> > +     .probe = msi_wmi_platform_profile_probe,
> > +     .profile_get = msi_wmi_platform_profile_get,
> > +     .profile_set = msi_wmi_platform_profile_set,
> > +};
> > +
> >  static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user *input,
> >                                             size_t length, loff_t *offset)
> >  {
> > @@ -742,6 +841,22 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
> >       return 0;
> >  }
> >
> > +static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *data)
> > +{
> > +     int err;
> > +
> > +     if (!data->quirks->shift_mode)
> > +             return 0;
> > +
> > +     data->ppdev = devm_platform_profile_register(
> > +             &data->wdev->dev, "msi-wmi-platform", data,
> > +             &msi_wmi_platform_profile_ops);
>
> Broken format.
>
> > +     if (err)
> > +             return err;
>
> `err` is not initialized. Is it a leftover?
>
> > +
> > +     return PTR_ERR_OR_ZERO(data->ppdev);
> > +}
> > +
> >  static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
> >  {
> >       struct msi_wmi_platform_data *data;
> > @@ -775,6 +890,8 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
> >
> >       msi_wmi_platform_debugfs_init(data);
> >
> > +     msi_wmi_platform_profile_setup(data);
>
> Check return value.
>
> --
>  ~ Kurt
>
> > +
> >       return msi_wmi_platform_hwmon_init(data);
> >  }
> >
>
