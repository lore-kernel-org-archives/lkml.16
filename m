Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A405F255E31
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745375144; cv=none; b=KXir6hAbCBlSZfu8zhDWkw32LdDGZM3/bHgWzavBuQoyV+juZS8FDAxBHDCS1p0biqeFU9KebVL4zh4zztbal6IrWo0D7mFF4oZPA6NINMnNR+u+GqnAoawCIMzHwhdc8LV9xAGTepQQMSCXOEGuG7UsRfEpJGebFNWhva5gnx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745375144; c=relaxed/simple;
	bh=Hn1ZIKPfiixtlmBOkzoQtHjMFOjoiyeEcqzFKzghOzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7j+EI34Qijhg6qgvr1oxL6atPixYlbiEf+B9OZfKBaNSRCTR3BLbiw61Lrh01x2ooDJWJ9fVTeqUDrMXcGE4+BPlUUjF7GrHlUC/UXrvL2WeSOaH7sk79Yv705iVGhiWuwyCJcyZnwTLemKbg6YMgJ1ZpCTeRt3Q5ZBsUbqN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=s1lDcVDP; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="s1lDcVDP"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 51E4C41A21
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745375134;
	bh=VZ/wtoYsWd6DgcbKoPTdYSKvbBkgvce35f7alM5I6EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=s1lDcVDPlYEY3kBzKHKvMH+4G429p7l67PLApp/BDtNQ2vZb8+g6GkNq/hTJuBs6E
	 H/XnkPMqpabKIE1g0qJdNWB6xQfJiLkMTBCWbTmWHb0Bi0dun3J7R342tx21yBjaUo
	 8oRfev0O4/PNSD59zBbZjOdW7hr01SRU8ux2duV4G6KBvgtGkLNETkVMISCAMextTN
	 mjQz5eK9Y4tsugSmKouMGdCb+aSoLTkuE3T5NB+ooSXf2inKLsG7kvEkF/Rwe6f0l6
	 NOf0pHA+9K1IIHdT07uOB8EX/G+kmX5ZUgW/c4rjeohgz4HINAnbDHx0tfnIm0V3xW
	 5BTZCUDKvLeiw==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acbbb000796so138046266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745375133; x=1745979933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ/wtoYsWd6DgcbKoPTdYSKvbBkgvce35f7alM5I6EI=;
        b=nDoKEev+1W5nqpEgzjvm2OpyEWgMOUFEDpkXDv3yTYkdsujSXOlR+nN32vy8BfIPOA
         nkq/2NCTbW31OVk6gCKZfcvmSVcEDctGjAWvaHBD5AK0TDaPKp8MWnbphwZVc+YYr8qE
         UntdvnWGfgYLfQIi4iCeRc0owJcUQThM3x7BSi5FTsX0CVQLZ7erdOMkmiDNX8Argh5V
         A4gWiFImEr+X3IYggRfA/2TxjFfUf2zqro7ceKrgUMWU+5rNQjlftr7NxOm8HZTRWc7I
         sq6uNBbJEDFrwstTLLXPwcEq3VL9pBo28gZJg0CxBsfv7EzKz/Ewhz+xKjqCaMxdaGqh
         v3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Suakc3jQMeosX+QKPV2AN9oFbolR4Q13fx0aiGOQImLmq0D0zE3j9rC7ftolr29symIKu4C6PotTCPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCuiiMkIDttl+gbn310nNYatIM7m4oesZ6GhzsfXXDJHl9LEu
	/uyKHg4q/gKU6+3gIU6NFgaSsLAzSlRvi0Hmo9SJNZhtZAojDlabZ2UXxfJXOqBqYQ2NxA/SkOQ
	Z5sSWsyJZBVQHsF7LRsKP6LT9t6MobHPUECcd2yVC/6AzFEgX7knNW9MxjPgRL1/CadbbKJ4I0E
	hDOZViRb2HNioR9uRY2s1a5czZZTmmtoKUvT9PxeDOySPAHsjhJqJ8lhZAiRxPnRI=
X-Gm-Gg: ASbGncu42sF6HvUkyVwS0wcBVWIDDv652CUS1Y7APdW/gHIi1JYMq8qzIJG12x0QT0Z
	lrUNA3Ns41fOTdIVNqnWyQqwPqnIp/W//7lso0E3UJjdU0zdC2sfwXiWLb+3DEdusM6926A==
X-Received: by 2002:a17:906:478f:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-acb74b7743bmr1326232666b.30.1745375132855;
        Tue, 22 Apr 2025 19:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIdojfV5b0KyC7J2nTqENIJbr2BkJCKEwKwbnPOKpiorYi9Jw1+vi/xhrySjjMkyatWeUeoTfIjJi9XEZx0sw=
X-Received: by 2002:a17:906:478f:b0:ac2:9841:3085 with SMTP id
 a640c23a62f3a-acb74b7743bmr1326231166b.30.1745375132434; Tue, 22 Apr 2025
 19:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
 <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-2-8b3bcafe9dad@canonical.com>
 <acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net>
In-Reply-To: <acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net>
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Wed, 23 Apr 2025 10:25:20 +0800
X-Gm-Features: ATxdqUH5EeFZ6ymv0ydpxwd4RcHCLJqEW0GUNkUaet1rNsKFU1iusKFJFLff8tc
Message-ID: <CABscksOHUdS2jJ2PZQXymheLuX25spxYVGX5Bu0YJxEybvYw+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (spd5118) restrict writes under SPD write protection
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 6:39=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 4/15/25 23:46, Yo-Jung (Leo) Lin wrote:
> > On some platforms, SPD Write Protection for the SMBus controller may be
> > enabled. For the i801 family, this will forbid writing data to devices
> > residing on addresses from 0x50 to 0x57. This may lead to the following
> > issues:
> >
> >    1) Writes to the sensor hwmon sysfs attributes will always result in
> >       ENXIO.
> >
> >    2) System-wide resume will encounter errors during regcache sync bac=
k,
> >       resulting in the following messages during resume:
> >
> >       kernel: spd5118 1-0050: Failed to write b =3D 0: -6
> >       kernel: spd5118 1-0050: PM: dpm_run_callback(): spd5118_resume [s=
pd5118] returns -6
> >       kernel: spd5118 1-0050: PM: failed to resume async: error -6
> >
>
> Missing:
>
> 3) NVMEM access will fail
>
> > To address this, check if the sensor can be written to at probe, and by=
pass
> > write-related functions if writing to the sensor is not possible.
> >
> > Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
> > ---
> >   drivers/hwmon/spd5118.c | 31 +++++++++++++++++++++++++++++--
> >   1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> > index 3cb2eb2e0227..9dd5342c31dd 100644
> > --- a/drivers/hwmon/spd5118.c
> > +++ b/drivers/hwmon/spd5118.c
> > @@ -75,6 +75,7 @@ static const unsigned short normal_i2c[] =3D {
> >   struct spd5118_data {
> >       struct regmap *regmap;
> >       struct mutex nvmem_lock;
> > +     bool write_protected;
> >   };
> >
> >   /* hwmon */
> > @@ -284,7 +285,7 @@ static umode_t spd5118_is_visible(const void *_data=
, enum hwmon_sensor_types typ
> >       case hwmon_temp_lcrit:
> >       case hwmon_temp_crit:
> >       case hwmon_temp_enable:
> > -             return 0644;
> > +             return data->write_protected ? 0444 : 0644;
> >       case hwmon_temp_min_alarm:
> >       case hwmon_temp_max_alarm:
> >       case hwmon_temp_crit_alarm:
> > @@ -499,7 +500,7 @@ static const struct regmap_range_cfg spd5118_regmap=
_range_cfg[] =3D {
> >       },
> >   };
> >
> > -static const struct regmap_config spd5118_regmap_config =3D {
> > +static struct regmap_config spd5118_regmap_config =3D {
> >       .reg_bits =3D 8,
> >       .val_bits =3D 8,
> >       .max_register =3D 0x7ff,
> > @@ -563,6 +564,21 @@ static int spd5118_init(struct i2c_client *client)
> >       return 0;
> >   }
> >
> > +static bool spd5118_write_protected(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     int mode =3D 0;
> > +     int err =3D 0;
>
> Both initializations are unnecessary.
>
> > +
> > +     mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_=
MODE);
> > +     if (mode < 0)
> > +             dev_warn(dev, "Failed to read MR11: %d", mode);
> > +
> > +     err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_=
MODE, mode);
> > +
>
> That would try to write the error back if MR11 can not be read, which wou=
ld be
> a bad idea. If the register is not even readable, being able to write it =
is of
> secondary concern.
>
> > +     return (err < 0);
>
> I think this requires a better means to determine if the address range is=
 write
> protected. The above is just a wild guess, after all.

For now I'll probably approach this from the i801 side (as later part
of your comments suggest), and skip the device instantiation if write
protection is enabled.

>
> Isn't this already handled somehow for DDR4 nvmem (ee1004) ? That has ult=
imately
> the same problem because ee1004 devices can not be accessed if the i2c ad=
dress
> range is write protected.

From ee1004_probe_temp_sensor() I think that the temperature sensor on
ee1004 (jc42) uses address 0x18, and the ee1004 itself at 0x5*
addresses seems to be just an read-only eeprom and has no pm
operations. That's probably why it evades the issue of write
disabling.

>
> > +}
> > +
> >   static int spd5118_probe(struct i2c_client *client)
> >   {
> >       struct device *dev =3D &client->dev;
> > @@ -580,6 +596,11 @@ static int spd5118_probe(struct i2c_client *client=
)
> >       if (!data)
> >               return -ENOMEM;
> >
> > +     if (spd5118_write_protected(client)) {
> > +             data->write_protected =3D true;
> > +             spd5118_regmap_config.cache_type =3D REGCACHE_NONE;
> > +     }
> > +
>
> This is insufficient, and overwriting spd5118_regmap_config is not a good=
 idea.
> It should be a completely separate configuration which does not list any =
writeable
> registers. I also don't see the value in dropping register caching entire=
ly.
>
> However, even that is insufficient: The driver relies on the register ran=
ge
> being writeable. It is not immediately visible, but the regmap code write=
s
> MR11 to select the nvmem page. If this fails, the entire driver is unusab=
le.
> At the very least nvmem access would have to be disabled. However, if the=
 ROM
> monitor left the chip in read-only state and had set the page to a value =
!=3D 0
> (I have seen that with some motherboards), temperature monitoring would n=
ot work
> either at least for memory with spd chips from manufacturers who took the
> specification literally (such as Renesas).
>
> That does not apply if the chip is programmed in 16-bit mode (which is no=
t
> currently supported), making handling the situation even more complicated=
.
>
> I think that drivers/i2c/busses/i2c-i801.c should detect if the address s=
pace
> is write protected, and the driver should not even try to instantiate if =
that
> is the case.
>
> _If_ the driver is to be instantiated, the write protect flag should be p=
assed
> to the driver from the instantiating code, for example with a device prop=
erty.

Although I'll try not instantiate the device at all for now, in case
that there are some users that still think reading DRAM temperature is
helpful, if I were to add a device property here at runtime (e.g. in
i2c_register_spd), should I also update its devicetree binding?

>
> >       regmap =3D devm_regmap_init_i2c(client, &spd5118_regmap_config);
> >       if (IS_ERR(regmap))
> >               return dev_err_probe(dev, PTR_ERR(regmap), "regmap init f=
ailed\n");
> > @@ -638,6 +659,9 @@ static int spd5118_suspend(struct device *dev)
> >       u32 regval;
> >       int err;
> >
> > +     if (data->write_protected)
> > +             return 0;
> > +
> >       /*
> >        * Make sure the configuration register in the regmap cache is cu=
rrent
> >        * before bypassing it.
> > @@ -662,6 +686,9 @@ static int spd5118_resume(struct device *dev)
> >       struct spd5118_data *data =3D dev_get_drvdata(dev);
> >       struct regmap *regmap =3D data->regmap;
> >
> > +     if (data->write_protected)
> > +             return 0;
> > +
>
> suspend/resume support should be disabled completely in this situation
> since it is very much pointless.
>
> Worse, if the BIOS for some reason decides to select a different (non-zer=
o)
> page on resume, the driver would be completely inoperable after resume.
> That is another argument for not instantiating it in the first place
> if this is the case. The impact is just completely unpredictable.
Wouldn't this already be catched spd5118_init() function, where the
driver would attempt to overwrite the MR11, and the device won't even
probe successfully if that fails?


>
> Guenter
>
> >       regcache_cache_only(regmap, false);
> >       return regcache_sync(regmap);
> >   }
> >
>
