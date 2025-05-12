Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CAE22FF37;
	Mon, 12 May 2025 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083033; cv=none; b=hevM2fvFgFdF59QnGyzDusmNf5FDeHFSGQFuCDEWs5nmyMLn3MciIiDCVMssgpB4FGr7oBb5NWaszckBsD2uzxCj/rC9zidi5hPFc3A6mgp5sZ4ZDeg06FQBrRPPj/6wgVBDIC/8Y4dgilaBnAWLvv5N5or9PljxJ+q00CzfNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083033; c=relaxed/simple;
	bh=8sQYpIZzOe6Sf3fbVLRD5JxlbBw/rYj2lipL3sHPR5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e22VOMo5eV2oBKw/6xbebNEV8C6szAkSiFpuiFG14j+hC83PI9VPdKXwGgGz8tCBOqE08hJYfbhbrNwxoPj9tuRX6u7czTaCs9R/GMLwtI1bo9VKiMnwq4t3usWPyNrZnzxuDy/CXKRFWUJsiafPHU7b3MWdX/J5b29wVXGE69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=n6lAxfhY; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="n6lAxfhY"
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 4555C2E0A869;
	Mon, 12 May 2025 23:50:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1747083019;
	bh=WLmvIHMqiM4OSLsOKXbvQ1dAbbBpgoUefSbvnGD9Ano=;
	h=Received:From:Subject:To;
	b=n6lAxfhYLIYpI6fJZzbNVwJqr5Yi/ePcOLZ0bvZoklHnKyAppm7RBYJKOoFGJks00
	 aYEHA7F31OPFVGqbQCxb5EgmS9KamfcMTyBAcqJDr8rvwCkRMtpuDT79DpyGfvUcuX
	 efw6nox+3G113cDKceA05xkWOQSN+lJQ3LMfGHGY=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f174.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-326d67aacc4so25106721fa.3;
        Mon, 12 May 2025 13:50:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsV/Gc5kMP/RCh65OTwGJcrxCc9860JKffBVXqwEXpccVD/b7Dn9bdAwqCk8gZ44o+4kVAWaciAJM9qP8=@vger.kernel.org,
 AJvYcCWJ2S8t1Vs2ZBPaVjEZh/vqz6xPhwW14o+dK6cYXLhz6pSwI6dty9vIW8AxNUsr0JZ2vm030fjwUUj/dXB5@vger.kernel.org,
 AJvYcCWYF2pxTwvWU6LKTKfKr+eS1y/evwweEgRo3u2ds/1gGT9kLwjWRncCBrlAioWfqFj5jy5k/JA9pDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy9pb0GIsg3oYUBG1nfalE7xlZxJ8d/lnQBb3cccU5fPma5aqM
	d8z3OTD7L4eQlO2pJ8JYBm2EOHxQutSljqZrrUtrGIaGjk4KO4qnp0md3zT3SjFSv2ooRk/rsip
	OWPqSNDXv3oDn/qc6zo2JqGW4aXo=
X-Google-Smtp-Source: 
 AGHT+IEzs3DpOS2NPzS0Qtp/QxuV3Arfo3IKJ8IMumQHkOkkuz2PO66jmD7mg/QBFt9yjFAoLdbCz8FmWVXSzK96qRA=
X-Received: by 2002:a05:651c:a11:b0:30b:c328:3c9f with SMTP id
 38308e7fff4ca-326c461e660mr54899201fa.20.1747083017451; Mon, 12 May 2025
 13:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-11-lkml@antheas.dev>
 <D9UF8OXHEJKZ.23PW2J8J7VYSZ@gmail.com>
In-Reply-To: <D9UF8OXHEJKZ.23PW2J8J7VYSZ@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 12 May 2025 22:50:06 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG-+KvMtZ8cYTizAtXYdMRoVV8XTybLgnDMJNDwJhkpHw@mail.gmail.com>
X-Gm-Features: AX0GCFu2SezMmH8FSlr9FHfKnOS3OorPob93Bos5jGGIeQfYyFSraOcw2uYgaQE
Message-ID: 
 <CAGwozwG-+KvMtZ8cYTizAtXYdMRoVV8XTybLgnDMJNDwJhkpHw@mail.gmail.com>
Subject: Re: [PATCH v1 10/10] platform/x86: msi-wmi-platform: Restore fan
 curves on PWM disable and unload
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174708301861.7008.8623355340300651100@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 12 May 2025 at 21:16, Kurt Borja <kuurtb@gmail.com> wrote:
>
> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> > MSI software is a bit weird in that even when the manual fan curve is
> > disabled, the fan speed is still somewhat affected by the curve. So
> > we have to restore the fan curves on unload and PWM disable, as it
> > is done in Windows.
> >
> > Suggested-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/msi-wmi-platform.c | 123 +++++++++++++++++++++++-
> >  1 file changed, 122 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
> > index 7dafe17d4d6be..a917db0300c06 100644
> > --- a/drivers/platform/x86/msi-wmi-platform.c
> > +++ b/drivers/platform/x86/msi-wmi-platform.c
> > @@ -123,16 +123,25 @@ struct msi_wmi_platform_quirk {
> >       bool shift_mode;        /* Shift mode is supported */
> >       bool charge_threshold;  /* Charge threshold is supported */
> >       bool dual_fans;         /* For devices with two hwmon fans */
> > +     bool restore_curves;    /* Restore factory curves on unload */
> >       int pl_min;             /* Minimum PLx value */
> >       int pl1_max;            /* Maximum PL1 value */
> >       int pl2_max;            /* Maximum PL2 value */
> >  };
> >
> > +struct msi_wmi_platform_factory_curves {
> > +     u8 cpu_fan_table[32];
> > +     u8 gpu_fan_table[32];
> > +     u8 cpu_temp_table[32];
> > +     u8 gpu_temp_table[32];
> > +};
> > +
> >  struct msi_wmi_platform_data {
> >       struct wmi_device *wdev;
> >       struct msi_wmi_platform_quirk *quirks;
> >       struct mutex wmi_lock;  /* Necessary when calling WMI methods */
> >       struct device *ppdev;
> > +     struct msi_wmi_platform_factory_curves factory_curves;
> >       struct acpi_battery_hook battery_hook;
> >       struct device *fw_attrs_dev;
> >       struct kset *fw_attrs_kset;
> > @@ -219,6 +228,7 @@ static struct msi_wmi_platform_quirk quirk_gen1 = {
> >       .shift_mode = true,
> >       .charge_threshold = true,
> >       .dual_fans = true,
> > +     .restore_curves = true,
> >       .pl_min = 8,
> >       .pl1_max = 43,
> >       .pl2_max = 45
> > @@ -227,6 +237,7 @@ static struct msi_wmi_platform_quirk quirk_gen2 = {
> >       .shift_mode = true,
> >       .charge_threshold = true,
> >       .dual_fans = true,
> > +     .restore_curves = true,
> >       .pl_min = 8,
> >       .pl1_max = 30,
> >       .pl2_max = 37
> > @@ -507,6 +518,94 @@ static struct attribute *msi_wmi_platform_hwmon_attrs[] = {
> >  };
> >  ATTRIBUTE_GROUPS(msi_wmi_platform_hwmon);
> >
> > +static int msi_wmi_platform_curves_save(struct msi_wmi_platform_data *data)
> > +{
> > +     int ret;
> > +
> > +     data->factory_curves.cpu_fan_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE;
> > +     ret = msi_wmi_platform_query_unlocked(
> > +             data, MSI_PLATFORM_GET_FAN,
> > +             data->factory_curves.cpu_fan_table,
> > +             sizeof(data->factory_curves.cpu_fan_table));
> > +     if (ret < 0)
> > +             return ret;
> > +     data->factory_curves.cpu_fan_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE;
>
> Is it necessary to set the subfeature again here (and bellow)?

The first time, it is used to prime the function so that we can get
the correct data.

However, on return, it gets replaced with a status byte (1). So we
need to set it again for it to index correctly. That needs to happen
either here, or when we send it, and I chose here.

The rest of the comments look good.

Antheas

> Also there is a lot of code repetition here, I would suggest a helper
> function. It will be optimized/inlined by the compiler anyway.
>
> > +
> > +     data->factory_curves.gpu_fan_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE;
> > +     ret = msi_wmi_platform_query_unlocked(
> > +             data, MSI_PLATFORM_GET_FAN,
> > +             data->factory_curves.gpu_fan_table,
> > +             sizeof(data->factory_curves.gpu_fan_table));
> > +     if (ret < 0)
> > +             return ret;
> > +     data->factory_curves.gpu_fan_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE;
> > +
> > +     data->factory_curves.cpu_temp_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE;
> > +     ret = msi_wmi_platform_query_unlocked(
> > +             data, MSI_PLATFORM_GET_TEMPERATURE,
> > +             data->factory_curves.cpu_temp_table,
> > +             sizeof(data->factory_curves.cpu_temp_table));
> > +     if (ret < 0)
> > +             return ret;
> > +     data->factory_curves.cpu_temp_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE;
> > +
> > +     data->factory_curves.gpu_temp_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE;
> > +     ret = msi_wmi_platform_query_unlocked(
> > +             data, MSI_PLATFORM_GET_TEMPERATURE,
> > +             data->factory_curves.gpu_temp_table,
> > +             sizeof(data->factory_curves.gpu_temp_table));
> > +     if (ret < 0)
> > +             return ret;
> > +     data->factory_curves.gpu_temp_table[0] =
> > +             MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE;
> > +
> > +     return 0;
> > +}
> > +
> > +static int msi_wmi_platform_curves_load(struct msi_wmi_platform_data *data)
> > +{
> > +     u8 buffer[32] = { };
> > +     int ret;
> > +
> > +     memcpy(buffer, data->factory_curves.cpu_fan_table,
> > +            sizeof(data->factory_curves.cpu_fan_table));
> > +     ret = msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
> > +                                           buffer, sizeof(buffer));
> > +     if (ret < 0)
> > +             return ret;
>
> A helper for this operation would be nice too.
>
> > +
> > +     memcpy(buffer, data->factory_curves.gpu_fan_table,
> > +            sizeof(data->factory_curves.gpu_fan_table));
> > +     ret = msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
> > +                                           buffer, sizeof(buffer));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     memcpy(buffer, data->factory_curves.cpu_temp_table,
> > +            sizeof(data->factory_curves.cpu_temp_table));
> > +     ret = msi_wmi_platform_query_unlocked(
> > +             data, MSI_PLATFORM_SET_TEMPERATURE, buffer, sizeof(buffer));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     memcpy(buffer, data->factory_curves.gpu_temp_table,
> > +            sizeof(data->factory_curves.gpu_temp_table));
> > +     ret = msi_wmi_platform_query_unlocked(
> > +             data, MSI_PLATFORM_SET_TEMPERATURE, buffer, sizeof(buffer));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +
> >  static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> >                                          u32 attr, int channel)
> >  {
> > @@ -603,9 +702,19 @@ static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_types ty
> >                               return -EINVAL;
> >                       }
> >
> > -                     return msi_wmi_platform_query_unlocked(
> > +                     ret = msi_wmi_platform_query_unlocked(
> >                               data, MSI_PLATFORM_SET_AP, buffer,
> >                               sizeof(buffer));
> > +                     if (ret < 0)
> > +                             return ret;
> > +
> > +                     if (val == 2 && data->quirks->restore_curves) {
> > +                             ret = msi_wmi_platform_curves_load(data);
> > +                             if (ret < 0)
> > +                                     return ret;
> > +                     }
> > +
> > +                     return 0;
> >               default:
> >                       return -EOPNOTSUPP;
> >               }
> > @@ -1373,6 +1482,13 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
> >
> >       msi_wmi_platform_profile_setup(data);
> >
> > +     if (data->quirks->restore_curves) {
> > +             guard(mutex)(&data->wmi_lock);
>
> We don't need locking here. data->factory_curves is not shared until you
> register the hwmon device.
>
> > +             ret = msi_wmi_platform_curves_save(data);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> >       return msi_wmi_platform_hwmon_init(data);
> >  }
> >
> > @@ -1382,6 +1498,11 @@ static void msi_wmi_platform_remove(struct wmi_device *wdev)
> >
> >       if (data->quirks->charge_threshold)
> >               battery_hook_unregister(&data->battery_hook);
> > +
> > +     if (data->quirks->restore_curves) {
> > +             guard(mutex)(&data->wmi_lock);
>
> We can avoid locking here by adding a devm action that restores the
> curves. devm resources are unloaded in LIFO order.
>
> Please, also check my comments on [Patch 2]. I don't think that patch is
> needed.
>
> --
>  ~ Kurt
>
> > +             msi_wmi_platform_curves_load(data);
> > +     }
> >  }
> >
> >  static const struct wmi_device_id msi_wmi_platform_id_table[] = {
>
