Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015C2701BD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365805; cv=none; b=CqiUEFlXNeHemOFvtZa4Bq06ZlXvHBJyjdk3cX3Kq6ZLuwRoTwL+Vfbu2n/71yUWnpj9BIoWhPIoJJuk/TdrLCdSD3BLOBLuB5aDIFoAmmsoCRFTc52SQT5kwBS27q6t5kqVRePqiD6/3qlQYwBi7b+I2YgcSx4WB6lYIJ2XzwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365805; c=relaxed/simple;
	bh=k3PnNCQ+EEQuSC0aMc9fez2sDXi1phwskvCEft2Aos8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaSL91DQqphVzOGPSbvkzSyE6zeHN3MNpSVWO9LxOroutKBJYcLxhtY+xvTUo7C2wgbu6q3mBPE4d6MCSqS3vlRcRHPFAIG63jAjMShQy8YHT9EB7eAYS/KUTPYRn/V6HOzTyEmUKM+ORA4OMge8nBPAGC0GvauQhOVQCLnvyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BuxJrUqa; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BuxJrUqa"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e3e0415a7so51928977b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751365803; x=1751970603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DOShaPOHOtoUsYulw5SAOmdH53iJ5TxFvCG/ArRe4g=;
        b=BuxJrUqayLlSAHYvt/yMpnZb0NvkVaDFTN7mU0AjDDjFGJ7RXL4WFJ1JrzqLDvaxxg
         +PqW44WxiU/jxUUmyjoyigXYYszt94xfyS91vfAlPsWSRKDLfv/jC2cv96K9eWIrjo1X
         F/FmFoFn7nKke99WnTExCfzFAtiLTNDR+XjrVnL5D9elsljLc/Diw7w4PJS73v29ehIB
         GLCAfvt0I5av4Q6YQb0jGgkrixOcNUgYmkvgN0hlAez/ldmlWmxe3GjrNQkYqTkKGEtH
         poeuLVAXF/GwhbYmFaYWT7YWoqS1sxlZdetQs0usUAaLrzBUNqsnv+wUn6jx7DWJM51h
         89Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365803; x=1751970603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DOShaPOHOtoUsYulw5SAOmdH53iJ5TxFvCG/ArRe4g=;
        b=Gj8U3iRjW2Og7tA/ek9tmXAgkzBD9tVqCaILHOfKflTyuT8vNOx/iz9IrOWtbByx+K
         EDFOUKmBXbl8ApS3Ejoejvl0CMndPe5Kiz92ToVq5nO7iv9Q3EbodCYFaAREFePyoX1D
         fSbYiFzSDj4vu9VxrRziRcLdNf/NDgJAEyQl6q6EgweUiBXIg5SwOJdnZ6vIykrhNEio
         ERLr1OdHBlnrQ3/nDYeAR5wRpVeIKtvL7n/JTLiDDD7jwI9NqdlS/4YUQRtd8ShPOow0
         gAMeXZxjV60DzpZ6wExm1ROK42a9E7/cUVg2Mh8eFxbP6A/LVR1ODcM2cVOeE+3/QD5L
         BwlA==
X-Forwarded-Encrypted: i=1; AJvYcCWKMZRFFrezntIJDE9ulL8t1UE2jw01NCoUr8FpBr7pvKckvSk+P16Rg9HiQgd+PHeFgkjsN1tMH4qYFrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJdTQZ+iy46Mkke7/689zUYajtQwivsmhWH/QzufxYBULpopO
	b+4HJVlpVd8VjRAXAUmbuIn+IXpz4mPK7oMZMKhDSAabPQjXooGKNvFu9Z7zg1jDfYDZRgy5X9A
	beUYjm7SSwsUmHwJ5mkLMl2HLnT4FGYPvVLZmtlCV
X-Gm-Gg: ASbGncv9btdvKtweS5jyzdRrTDbzIaDxaluxHhDwaQX6TAvlRQjF2SQgYrmJS2HP94g
	i43tVOnwjM0QDwBEiChEgYQyQKJXPlMnccvgXaCwLTaitumJm0exab5R5KUzhhux1BdVTftKUc5
	QGUEDdwgr3rAb9qbIdON3IefXO+p1DNBib7rAb86BSr/U9
X-Google-Smtp-Source: AGHT+IG4WEValYHs+5sMeK7bOmTy72+v76zFOCu9nKGXS1d1hrxklJmvDUakhUNITmKGNIbaCIhjxN5ZsVEnHZ3w8mE=
X-Received: by 2002:a05:690c:6f8d:b0:70e:345:d58a with SMTP id
 00721157ae682-7163ee3365fmr44825137b3.2.1751365802868; Tue, 01 Jul 2025
 03:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624110028.409318-1-dawidn@google.com> <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com> <aGOiu-sXFj1EUQAB@google.com>
In-Reply-To: <aGOiu-sXFj1EUQAB@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Tue, 1 Jul 2025 12:29:51 +0200
X-Gm-Features: Ac12FXwMjasUaTFSmwgZWiqMLm9YJLI_H2xAIZgPBR0dbOaY8dziNj6MwqHoydQ
Message-ID: <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>What are the shortcomings if it re-creates /dev/cros_X everytime?

In that case, to avoid memory leakage, you would need to free the
cros_ec_device structure every disconnect.
An application with an opened cros_ec file would try to access the
freed resources (use-after-free) via the char driver [1], e.g.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/platform/chrome/cros_ec_chardev.c#n345

It would also require additional work from the userspace application
e.g. reopen the cros_ec file every time there was a communication
problem. I think recovering an already created file sounds like a
better idea.

> Isn't it also a way for userland programs to be aware of the EC device cr=
ashes?

No. First of all, we don't know a reason for the disconnect / reprobe,
so it is not always a crash. Also we signal that there is a problem
with the connection by returning -ENODEV when an EC device is
disconnected.
There are dedicated commands to check reboot reason, and detect
potential crashes.

> Why other cros_ec_X drivers doesn't need the mechanism?

It is a very USB specific problem. USB host/hub detects a new device
on the bus and starts probing procedure.
It is not a case for other drivers, e.g. SPI probes only once, at the
beginning of the boot, based on ACPI entry, there is no hardware
detection that a device is alive after reboot.
Additionally, the USB related structures are new every probe, so we
need to replace those.

On Tue, Jul 1, 2025 at 10:56=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jun 30, 2025 at 01:59:39PM +0200, Dawid Nied=C5=BAwiecki wrote:
> > On Fri, Jun 27, 2025 at 9:53=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > > On Tue, Jun 24, 2025 at 11:00:28AM +0000, Dawid Niedzwiecki wrote:
> > > > +     /*
> > > > +      * Do not register the same EC device twice. The probing is p=
erformed every
> > > > +      * reboot, sysjump, crash etc. Recreating the /dev/cros_X fil=
e every time
> > > > +      * would force all application to reopen the file, which is n=
ot a case for
> > > > +      * other cros_ec_x divers. Instead, keep the cros_ec_device a=
nd cros_ec_usb
> > > > +      * structures constant and replace USB related structures for=
 the same EC
> > > > +      * that is reprobed.
> > > > +      *
> > > > +      * The driver doesn't support handling two devices with the s=
ame idProduct,
> > > > +      * but it will never be a real usecase.
> > > > +      */
> > >
> > > I don't quite understand why does it need to memorize the registered =
ECs.
> > > Supposedly, the probe function is only called few times during bootin=
g, and
> > > gets success once. Hot-plugs?
> > >
> >
> > The probe is called every time the EC device boots from the beginning
> > - sysjumps, crashes, reboots etc. It succeeds the first time.
> > Once the /dev/cros_X file is created, we need the possibility to
> > access the same EC device, with the same, previously created file.
> > The only way to do that is to reused the already created
> > cros_ec_device structure.
>
> What are the shortcomings if it re-creates /dev/cros_X everytime? Isn't i=
t
> also a way for userland programs to be aware of the EC device crashes?
>
> Why other cros_ec_X drivers doesn't need the mechanism?
