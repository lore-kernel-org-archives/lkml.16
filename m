Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9011F4624;
	Wed, 25 Jun 2025 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833079; cv=none; b=W6J7n0rWfnI+fqWWxzQpy62C5GJIkyRNPqQGhs00giZIihjYcar6abt0tL0z4EyiKRjxvvhlUM8SlhcAHa3sJyFhpMetXW/rARat0ziwWCO2ehMf2WpeXlnPaBvJGcXaL4hROz5iZ0aS9PLKXc2sSzm0w2b/rsI8lCyCwLlqtGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833079; c=relaxed/simple;
	bh=0fMgE+QHYRsfF1P3dHEdwDIDYJIcDHuWpCF9nYV57fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRJNb8vvsRWGerMoPihSl2ABTn1nbdJppxcyIHPwZylu3OuHEvXGei19qSQ1GJvHlX8WV/iMHSmS+3zf729MI3KvlgE+tRTs5d13PK/x4355e3zuKDZxYRGTc2FeZlTb6ApvreEwGP0mWzYbdVYNz+IKw3Xh0RZs2w+QjIBfxQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDkJWuhs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDkJWuhs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso50193a12.1;
        Tue, 24 Jun 2025 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750833076; x=1751437876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HomsHRhWMc91NlraWgfb8CzmapO2MWzqc8OJ53Xj91M=;
        b=aDkJWuhsbF8PlSsoEEavQMKc+L8pX1MhOFSRTskRQ1aMNZa9xSQwGoJ6Q84RmKOYuw
         kXjNKQeDzQgA/xg1Bb5oodMtrxcVu4ZKboWBV8i3XRGOArsfcuzETmXACbb/WXWGzl5Z
         DBBLQyp8B8MKRhuQzRqAIUhgV9tTSjI5ZMgnR3uoAx0IelWdJmTOzg4vZAZ2KEebibKg
         83qcTDIlQZ+PEO4q1Q+Qz4tHMS8BCPO//rNH3komiqW01tI7U2eF0fweHgcK9vfuX+XE
         TQlvZ2TWw6EARVjsloOXQ6fSunq5HFXFJzLsMEF/wd47cv7uZgKuyTYQH54oIpwkCato
         R3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750833076; x=1751437876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HomsHRhWMc91NlraWgfb8CzmapO2MWzqc8OJ53Xj91M=;
        b=J7Acb1hmE3xbm1KyWt4ERBL0ylpT6bMUq/+HXNQa2qoDZDeK9YheoDKoNv4zeK0PrT
         TfhpfR9Q+LqO113TF1MNQqDBbQDwW8qlb1etYqNtuay8irSzlsfkEhaxQ90nareOMZbF
         cCDIlcvnpp4SXh2LYz/Aq4nINrLshBg1LtIERjUFbW2KA5hL8wIfHG18ZPBN2KPZ7hMd
         ISi+sfnLOLIg0kPRatCydDTmtu28/7Sj3umc3zn0h8ohP8+l0lmdlAou6Dqn5ThCwBtr
         fMiCoqVCiN6Tybvvbit+EEjgV/+ZXQzQ2Gk1aR9OgdiD5TDJLeUfprQZ3FiE7bMDFmDz
         HFZw==
X-Forwarded-Encrypted: i=1; AJvYcCUFqh9ZO3jyOCO1B6WjsPnDCDRNXzn84vSjHomibGQdXPf4+40Ck5S2HXJopAIjkXzcUrmoNnPuh/xE@vger.kernel.org, AJvYcCUsB6mFUVPYIJ1EPmUUsKYZKBoXtjTlXHJ7Kv1tuVr1dEHb+Q52HKxVJzDoTLPqg7BgRAbGJgMsKv9Bu14=@vger.kernel.org, AJvYcCWz1LIVUS34ZVcrs3R7uChtBFQE63mUugvjxlvwZWSreq0zmGlsVMfrTx3ndFAQ8ecOiOZHzUwTAwuI@vger.kernel.org, AJvYcCX7LWT5z+LG3S+mcuFl5MSxSHhaQrarZexP3FTCummiWpaRTZysJxrW6bPg1hAAbT1u9LvjR6LV/wGBWSb1@vger.kernel.org
X-Gm-Message-State: AOJu0Yznuem2EqDTA0xeUAU4eL3ab8KvFLqq1Z0krxESzg7IaTfH0aQb
	sGzhYOYWzEqs7nD1Ff2HhH3BFmmqsei80NjUAlU5xtfp7bDFZweTHZl0ClF6x5l2UIEmcJvLCth
	qwwqrlhsRwaX22402E5KpNQ0oqGWi4/g=
X-Gm-Gg: ASbGncv5yUJJ6tESb1kttOQwUSjj/dCPTizvO2nerkgIGm66IokEa0nLA7P8gBGO77/
	dK+gUPc3ERX+dN4L3F7fjQ9VvgodFyWhY9BN3609oyqhJJIRBC1RUnM4yLQEyPH4ow0s3yaBqQ5
	G3jKn/Uj0y7rklsoOOYJepfiWZ0CNB909+sZWSTYLF/pJx
X-Google-Smtp-Source: AGHT+IF7AiEa0pJbYZZoCQ1Wp9+IRvS7oTHb4LSsS4eD49aaqa7HWWLrgupXR3/9FmGLVv6KV+8mhl8dDa+aNtEF4Hw=
X-Received: by 2002:a05:6402:84a:b0:604:e602:779a with SMTP id
 4fb4d7f45d1cf-60c4ddf20demr1293519a12.28.1750833075395; Tue, 24 Jun 2025
 23:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624074156.291176-1-Henry_Wu@quantatw.tw> <9bd05709-7702-4b74-85e1-3df25b57c535@kernel.org>
In-Reply-To: <9bd05709-7702-4b74-85e1-3df25b57c535@kernel.org>
From: =?UTF-8?B?5ZCz5qKT6LGq?= <tzuhao.wtmh@gmail.com>
Date: Wed, 25 Jun 2025 14:31:02 +0800
X-Gm-Features: Ac12FXwVID-DBqxtNhi49QaeYZGu6tv9x2UUWeX_dFYK1J54y2MPszZ6ptrgD6c
Message-ID: <CAL3H=v3s6H4ZpnS=EhPrpEiu-9N-xFCkunHuwWW0xnkXbzY9Kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (pmbus) Add support for MPS multi-phase
 mp2869a/mp29612a controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Naresh Solanki <naresh.solanki@9elements.com>, 
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Fabio Estevam <festevam@gmail.com>, Henry Wu <Henry_Wu@quantatw.com>, 
	Grant Peltier <grantpeltier93@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>, 
	Kim Seer Paller <kimseer.paller@analog.com>, Leo Yang <leo.yang.sy0@gmail.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, Alex Vdovydchenko <xzeol@yahoo.com>, 
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>, Nuno Sa <nuno.sa@analog.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Noah Wang <noahwang.wang@outlook.com>, 
	Mariel Tinaco <Mariel.Tinaco@analog.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 24/06/2025 09:41, tzuhao.wtmh@gmail.com wrote:
> > +static int
> > +MP2869A_read_byte_data(struct i2c_client *client, int page, int reg)
> > +{
> > +     switch (reg) {
> > +     case PMBUS_VOUT_MODE:
> > +             /* Enforce VOUT direct format. */
> > +             return PB_VOUT_MODE_DIRECT;
> > +     default:
> > +             return -ENODATA;
> > +     }
> > +}
> > +
> > +static int
> > +MP2869A_identify_vout_format(struct i2c_client *client,
>
> Use Linux coding style, so lowercase for variables, types and functions.
> Everywhere (except when coding style tells you different, so please read
> it).
>
> > +                         struct MP2869A_data *data)
> > +{
> > +     int i, ret;
> > +
> > +     for (i =3D 0; i < data->info.pages; i++) {
> > +             ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             ret =3D i2c_smbus_read_word_data(client, MP2869A_VOUT_MOD=
E);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             switch (ret & MP2869A_VOUT_MODE_MASK) {
> > +             case MP2869A_VOUT_MODE_VID:
> > +                     data->vout_format[i] =3D vid;
> > +                     break;
> > +             default:
> > +             return -EINVAL;
> > +             }
> > +             }
>
> Messed indentation in multiple places.
>
> > +     return 0;
> > +}
> > +
> > +static struct pmbus_driver_info MP2869A_info =3D {
>
> This is const.
Since info will be modified by mp2869a_read_vout at runtime, I chose
not to make it constant
>
> > +     .pages =3D MP2869A_PAGE_NUM,
> > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > +     .format[PSC_TEMPERATURE] =3D linear,
> > +     .format[PSC_CURRENT_IN] =3D linear,
> > +     .format[PSC_CURRENT_OUT] =3D linear,
> > +     .format[PSC_POWER] =3D linear,
> > +     .m[PSC_VOLTAGE_OUT] =3D 1,
> > +     .b[PSC_VOLTAGE_OUT] =3D 0,
> > +     .R[PSC_VOLTAGE_OUT] =3D -3,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS=
_VOUT |
> > +             PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT=
 |
> > +             PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POU=
T |
> > +             PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> > +     .func[1] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAV=
E_IOUT |
> > +             PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_TEM=
P,
> > +     .read_byte_data =3D MP2869A_read_byte_data,
> > +     .read_word_data =3D MP2869A_read_word_data,
> > +};
> > +
> > +static int mp2869a_probe(struct i2c_client *client)
> > +{
> > +     struct pmbus_driver_info *info;
> > +     struct MP2869A_data *data;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(&client->dev, sizeof(struct MP2869A_data),
>
> sizeof(*)
>
> > +             GFP_KERNEL);
>
> Misaligned. Run checkpatch --srtict
>
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->chip_id =3D (enum chips)(uintptr_t)i2c_get_match_data(clien=
t);
>
> These are just wrong or redundant casts. You need only one cast -
> kernel_ulong_t
>
> > +
> > +     memcpy(data->max_phases, mp2869a_max_phases[data->chip_id],
> > +             sizeof(data->max_phases));
>
> Why you cannot just store the pointer?
As chip_id and max_phase will be constant, it should be acceptable to
handle them via pointers in this case.
>
> > +
> > +     memcpy(&data->info, &MP2869A_info, sizeof(*info));
>
> Why you cannot just store the pointer?
Considering that the info can change at runtime, using memcpy is a
safer approach
>
> > +     info =3D &data->info;
> > +
> > +
>
> One blank line, not two
>
> > +     /* Identify vout format. */
> > +     ret =3D MP2869A_identify_vout_format(client, data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* set the device to page 0 */
> > +     i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> > +
> > +     return pmbus_do_probe(client, info);
> > +}
> > +
> > +static const struct of_device_id __maybe_unused mp2869a_of_match[] =3D=
 {
> > +     { .compatible =3D "mps,mp2869a", .data =3D (void *)mp2869a },
> > +     { .compatible =3D "mps,mp29612a", .data =3D (void *)mp29612a},
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, mp2869a_of_match);
> > +
> > +static struct i2c_driver mp2869a_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "mp2869a",
> > +             .of_match_table =3D mp2869a_of_match,
> > +     },
> > +     .probe =3D mp2869a_probe,
> > +     .id_table =3D mp2869a_id,
> > +};
> > +
> > +module_i2c_driver(mp2869a_driver);
> > +
> > +
>
> One blank line, not two. This applies everywhere.
>
> > +MODULE_AUTHOR("Henry Wu <Henry_WU@quantatw.com>");
> > +MODULE_DESCRIPTION("PMBus driver for MPS MP2869A/MP29612A device");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS(PMBUS);
>
>
> Best regards,
> Krzysztof

Thank you for your advice. I still have a few questions and would
appreciate your help in resolving them.

Best regards,
Henry Wu
