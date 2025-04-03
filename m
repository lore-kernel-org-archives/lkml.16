Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B433993
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714420; cv=none; b=N4YJX6NMklIwWrUGgLiZR3gmbtIL5P8zcfruCNpdxjDAA/gzU51VCamcbAzZmLAmMuW0S+UK2Zk+O9InHjilASxxbS/LVtYBPtOpXtyC3WEJSprqJ8o4VLuH32KNSJur2xt6x6xp6p2EMgYBd/ZfhMCiM9J8sgmZdp0dyFBBw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714420; c=relaxed/simple;
	bh=tVBvnd/7YLHozsuPAQF5ZCG5JR6KXKV+F5OgNWGLOBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5LQm3Ol3Puuc+0mqUNP7j8NBoGY7sxEjPxJ6rG1UTPlgQIRbBrzBCl3SZKRE98/fJXHZ3edn7RzSC2SV46ANC57pjLEudL8b/RLGnHKFgWH4cPzQdtYJ9fdWF1TJ3weTzhC1AiHvWFWYXv/CQhgOS/8kc1N9OcYTjE7CBH4GiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=quzLL7QY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="quzLL7QY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2260c915749so10396425ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743714417; x=1744319217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYmBiZPgtPm+fTNFRpxiV4Ltg0qHt2/Bty1RuY/WW1I=;
        b=quzLL7QY2Q+qSHDKd7w2UEwZPFcVVgRcbvF13N65XsCecUBmeD7puqPPG+VsiUqvcr
         thRiGl202hdI5UcGvNXWKRewR7dHs6wJGyT3tx0yW6cLXxd2wd/Q/4jHRKTVA7JrNLiI
         kB8u2Lww5DhZ0PLzvQ8lMzKPR7aa7Dzqog4cbCcLh255ABXp1Xw42toLYRZXAgHB/XKg
         iBhw86088KOhR3mEY3vERn1oW+6n1F7403Xkx1ISEBWCQqEWMy8KZQTveHdtapBotxho
         hwVmLVabUL31VlU90hBYgiMSX/ghvl76pyDz3QaBTvehuQM6Ie5TWpzfi9TdiAR9xxgH
         2+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743714417; x=1744319217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYmBiZPgtPm+fTNFRpxiV4Ltg0qHt2/Bty1RuY/WW1I=;
        b=cNrP//oznULeaV5R+s/U7iSWdfAaTXNf2cF6CthJRQdV3Yplegh5Of8sAeBPLWdmJv
         F+A4iPCkUytTfrXkOMFc/LVBGdb1qeX1T6ZU8LEhNyqBBgkC3byMlvSOl2ilt6gKtOp3
         KtdRXR05PpbvT/bJ/hIzbCYpS3VnmGkvuONVFY7ml8mGZ70ET3nCHAQO7JkCfctFExlA
         LOulIaBbVQgLgGAVGfxZEY1+BPUnmx4XAfrS0469W1YDHZkctvDHTULL+re+prkKLTZg
         4j0NgjjGvBYkn6bPiqhevizEsx0IrE00kHCxOQk5+X3TiLQA/3xJhuocZQ+VIrsGo35H
         wBYg==
X-Forwarded-Encrypted: i=1; AJvYcCVPEmD8Vofh4VdOTyDQDORqAaoYupYyocZkHlg29ZbDXxCoDrwWxkeZi4NWncGr//+/b/6XHrNMr9eg8dA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw27vS8n5HQup1N8GSvt4g3Oq50pVFFxG3qx+4StY1Bk1gmbUZg
	KjJL+stft6bM73gGWhf1Z1SdOY8JPXIcbM8/cWxrypbQTqux2yXgfHPhQVxbKE78CXlmwSTwWKk
	Mz49+1qVVAlPDx2UGdrEGBxCT9rIX6WZmJzYflw==
X-Gm-Gg: ASbGnctb+EZWTT63Bjtil2ziQSU0r51sPT80WWAZJ8c++P9ZSlmq91T+p9GKdqW7a/k
	YFZhVD3xA79pnMkPUMSBIY9c2fHra3f7COTvMl0p8WpPBp9QEK16As78ybMFL5O1Htg5n5IpQAB
	isKu/AEM1At3TqPc5vzjvNrhmr9m4fGBDn8LrudX///IOA0AeOVF1cMqRdzx4q
X-Google-Smtp-Source: AGHT+IFDh0StEqe8xu7nUxjvKFKRBNctwbbvEWD4V5L9tyGSGREj1ztuh6Atx2N4L0KKGtE0hEVlWRMG9ORCkv8/hE8=
X-Received: by 2002:a17:902:e745:b0:224:10a2:cae1 with SMTP id
 d9443c01a7336-22a8a8ca2b4mr4826765ad.37.1743714416952; Thu, 03 Apr 2025
 14:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402193452.3571888-1-william@wkennington.com> <81462799-6ef6-4079-9ebe-5b886d6e1eab@roeck-us.net>
In-Reply-To: <81462799-6ef6-4079-9ebe-5b886d6e1eab@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Thu, 3 Apr 2025 14:06:45 -0700
X-Gm-Features: ATxdqUH5g7XsdKqLscZwrTmfuiLQldKTW-PETzxori14yipg1xiHL7LcEJQcIN8
Message-ID: <CAD_4BXiaHEndVCKYOHnA9=CcZ7jRFzFEs_+A=09duhzuf2X9+w@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus): Introduce page_change_delay
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:18=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 4/2/25 12:34, William A. Kennington III wrote:
> > We have some buggy pmbus devices that require a delay after performing =
a
> > page change operation before trying to issue more commands to the
> > device.
> >
> > This allows for a configurable delay after page changes, but not
> > affecting other read or write operations.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus.h      |  1 +
> >   drivers/hwmon/pmbus/pmbus_core.c | 59 ++++++++++++++++++++++---------=
-
> >   2 files changed, 41 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index ddb19c9726d6..742dafc44390 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -482,6 +482,7 @@ struct pmbus_driver_info {
> >        */
> >       int access_delay;               /* in microseconds */
> >       int write_delay;                /* in microseconds */
> > +     int page_change_delay;          /* in microseconds */
> >   };
> >
> >   /* Regulator ops */
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index 787683e83db6..cfb724a8718b 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -116,6 +116,7 @@ struct pmbus_data {
> >       int vout_high[PMBUS_PAGES];     /* voltage high margin */
> >       ktime_t write_time;             /* Last SMBUS write timestamp */
> >       ktime_t access_time;            /* Last SMBUS access timestamp */
> > +     ktime_t page_change_time;       /* Last SMBUS page change timesta=
mp */
> >   };
> >
> >   struct pmbus_debugfs_entry {
> > @@ -178,24 +179,44 @@ static void pmbus_wait(struct i2c_client *client)
> >
> >               if (delta < info->access_delay)
> >                       fsleep(info->access_delay - delta);
> > -     } else if (info->write_delay) {
> > +     }
> > +     if (info->write_delay) {
> >               delta =3D ktime_us_delta(ktime_get(), data->write_time);
> >
> >               if (delta < info->write_delay)
> >                       fsleep(info->write_delay - delta);
> >       }
> > +     if (info->page_change_delay) {
> > +             delta =3D ktime_us_delta(ktime_get(), data->page_change_t=
ime);
> > +
>
> page_change_time isn't actually set. I suggest to just use data->write_ti=
me.
> Also see below.

Yeah, I consolidated the times in v2 and will keep it in v3

>
> > +             if (delta < info->page_change_delay)
> > +                     fsleep(info->page_change_delay - delta);
> > +     }
> >   }
> >
> > -/* Sets the last accessed timestamp for pmbus_wait */
> > -static void pmbus_update_ts(struct i2c_client *client, bool write_op)
> > +#define PMBUS_OP_READ_BIT 1
> > +#define PMBUS_OP_WRITE_BIT 2
> > +#define PMBUS_OP_PAGE_CHANGE_BIT 4
>
> #define<space>NAME<tab>BIT(...)
>
> > +
> > +#define PMBUS_OP_READ PMBUS_OP_READ_BIT
> > +#define PMBUS_OP_WRITE PMBUS_OP_WRITE_BIT
> > +#define PMBUS_OP_PAGE_CHANGE (PMBUS_OP_PAGE_CHANGE_BIT | PMBUS_OP_WRIT=
E)
>
> That is way too complicated. Just make it
>
> #define PMBUS_OP_READ           BIT(0)
> #define PMBUS_OP_WRITE          BIT(1)
> #define PMBUS_OP_PAGE_CHANGE    BIT(2)
>
> A page change implies a write, so it is not necessary to combine the bits=
.

Yeah, I combined then here to make the function working with the
delays consider both delays. I'll make this simpler.

>
> > +
> > +/* Sets the last operation timestamp for pmbus_wait */
> > +static void pmbus_update_ts(struct i2c_client *client, int op)
> >   {
> >       struct pmbus_data *data =3D i2c_get_clientdata(client);
> >       const struct pmbus_driver_info *info =3D data->info;
> > +     ktime_t now =3D ktime_get();
> >
> >       if (info->access_delay) {
> > -             data->access_time =3D ktime_get();
> > -     } else if (info->write_delay && write_op) {
> > -             data->write_time =3D ktime_get();
> > +             data->access_time =3D now;
> > +     }
> > +     if (info->write_delay && (op & PMBUS_OP_WRITE_BIT)) {
> > +             data->write_time =3D now;
> > +     }
> > +     if (info->page_change_delay && (op & PMBUS_OP_PAGE_CHANGE_BIT)) {
> > +             data->write_time =3D now;
> >       }
>
> Seems to me that we should only need write_time and not
> page_change_time since both will always be set together.
>
> I also think this can be simplified if ktime_get() is always called anywa=
y.
>
>         ktime_t now =3D ktime_get();
>
>         data->access_time =3D now;
>         if (op & (PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE))
>                 data->write_time =3D now;
>
> It doesn't matter if the values are set unnecessarily if there is no dela=
y
> because they won't be used in that case.

Yes, I think v2 (and shortly v3) makes this better

>
> >   }
> >
> > @@ -211,13 +232,13 @@ int pmbus_set_page(struct i2c_client *client, int=
 page, int phase)
> >           data->info->pages > 1 && page !=3D data->currpage) {
> >               pmbus_wait(client);
> >               rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page=
);
> > -             pmbus_update_ts(client, true);
> > +             pmbus_update_ts(client, PMBUS_OP_PAGE_CHANGE);
> >               if (rv < 0)
> >                       return rv;
> >
> >               pmbus_wait(client);
> >               rv =3D i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> > -             pmbus_update_ts(client, false);
> > +             pmbus_update_ts(client, PMBUS_OP_READ);
> >               if (rv < 0)
> >                       return rv;
> >
> > @@ -231,7 +252,7 @@ int pmbus_set_page(struct i2c_client *client, int p=
age, int phase)
> >               pmbus_wait(client);
> >               rv =3D i2c_smbus_write_byte_data(client, PMBUS_PHASE,
> >                                              phase);
> > -             pmbus_update_ts(client, true);
> > +             pmbus_update_ts(client, PMBUS_OP_WRITE);
> >               if (rv)
> >                       return rv;
> >       }
> > @@ -251,7 +272,7 @@ int pmbus_write_byte(struct i2c_client *client, int=
 page, u8 value)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_write_byte(client, value);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_WRITE);
> >
> >       return rv;
> >   }
> > @@ -286,7 +307,7 @@ int pmbus_write_word_data(struct i2c_client *client=
, int page, u8 reg,
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_write_word_data(client, reg, word);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_WRITE);
> >
> >       return rv;
> >   }
> > @@ -408,7 +429,7 @@ int pmbus_read_word_data(struct i2c_client *client,=
 int page, int phase, u8 reg)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_read_word_data(client, reg);
> > -     pmbus_update_ts(client, false);
> > +     pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >       return rv;
> >   }
> > @@ -471,7 +492,7 @@ int pmbus_read_byte_data(struct i2c_client *client,=
 int page, u8 reg)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_read_byte_data(client, reg);
> > -     pmbus_update_ts(client, false);
> > +     pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >       return rv;
> >   }
> > @@ -487,7 +508,7 @@ int pmbus_write_byte_data(struct i2c_client *client=
, int page, u8 reg, u8 value)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_write_byte_data(client, reg, value);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_WRITE);
> >
> >       return rv;
> >   }
> > @@ -523,7 +544,7 @@ static int pmbus_read_block_data(struct i2c_client =
*client, int page, u8 reg,
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_read_block_data(client, reg, data_buf);
> > -     pmbus_update_ts(client, false);
> > +     pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >       return rv;
> >   }
> > @@ -2530,7 +2551,7 @@ static int pmbus_read_coefficients(struct i2c_cli=
ent *client,
> >       rv =3D i2c_smbus_xfer(client->adapter, client->addr, client->flag=
s,
> >                           I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
> >                           I2C_SMBUS_BLOCK_PROC_CALL, &data);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);
>
> I don't immediately follow the reason for adding PMBUS_OP_READ.

I can just remove it, I just added it for clarity as opposed to having
it just be 0.

>
> >
> >       if (rv < 0)
> >               return rv;
> > @@ -2734,7 +2755,7 @@ static int pmbus_init_common(struct i2c_client *c=
lient, struct pmbus_data *data,
> >       if (!(data->flags & PMBUS_NO_CAPABILITY)) {
> >               pmbus_wait(client);
> >               ret =3D i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY=
);
> > -             pmbus_update_ts(client, false);
> > +             pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >               if (ret >=3D 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
> >                       if (i2c_check_functionality(client->adapter, I2C_=
FUNC_SMBUS_PEC))
> > @@ -2750,13 +2771,13 @@ static int pmbus_init_common(struct i2c_client =
*client, struct pmbus_data *data,
> >       data->read_status =3D pmbus_read_status_word;
> >       pmbus_wait(client);
> >       ret =3D i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
> > -     pmbus_update_ts(client, false);
> > +     pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >       if (ret < 0 || ret =3D=3D 0xffff) {
> >               data->read_status =3D pmbus_read_status_byte;
> >               pmbus_wait(client);
> >               ret =3D i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYT=
E);
> > -             pmbus_update_ts(client, false);
> > +             pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >               if (ret < 0 || ret =3D=3D 0xff) {
> >                       dev_err(dev, "PMBus status register not found\n")=
;
>
