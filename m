Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179A44A21;
	Sun,  6 Apr 2025 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971791; cv=none; b=j+tTPe262bjJ/hP0sMoVPj9Mh0CE4cLGt7EWdA4PIlI0pC4DPn+P5NpEQIGxP3u6gtRdiG3zz9UhTvroF1hBgd2yCr0aFeiYYgHMihDkReJW58q+QUgVJqJMjDkPyco1Ode6B5569JEEohonn+Um/DQ9j+eoFJ7xI1/SaUaUYX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971791; c=relaxed/simple;
	bh=/HTgL1GKRkOei+N9qzEycOw7NOzDX255Wrn+YCYI3KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqoXhrZi2RtcUCxm+uwL6S+wYAhcSifNTxJyO+ddHSkU1hnK1tNkR7Cu71vY9R2C98ihCKXG/MKQyQlAte+Z7cSJchK+IdZ04PGOqoraZeL7/H2lX5TNk98K2qhxVoiGJOA94UMoiwmggAdEoAhfZmu9saMR6csjdx6Zq5Sdrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DGeUwaWn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DGeUwaWn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22423adf751so34531685ad.2;
        Sun, 06 Apr 2025 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971789; x=1744576589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTDKXTFTQLBPdri3otdi82MBqYNCG52DLi/ttprD1dA=;
        b=DGeUwaWnbyDRezksfP3pz0GXJgthKZA+j71A6UpuPYPjG9MfEFjCsfL9KBHwwZ2AYJ
         dd2g8g1im214cL4VVAdZ0hEZfCBs1XtxQXue1N453/njecr+MZO0Cm8YNxeIqb65EkeT
         Ld/uolsDrsNymNI9vDjjISrTE9UNEI+eeD3ftDW3Nc9kg5oN7aJHJTs2guK2KjSuHO+H
         OJv6NBMXwrXl87l710/PYt6R1cQBaODr+3k3RVHsFp7Q+DYYQZIY6X1vEEvSsrz5/+IU
         JR1Gq6mC3oJf5Ui4EiGQPKZcCkr09J3usrS04M2NRo84Nd0xkPKMhWcBXfChVxxfIXGf
         gJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971789; x=1744576589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTDKXTFTQLBPdri3otdi82MBqYNCG52DLi/ttprD1dA=;
        b=N+HcptKXqrWb9U6wkXit5rLyNHwRgLOriHV0LI2akxWkb/BezkPoyADhoNDMeL7Pgd
         5WEA5C5BonDV2335bWkO6gGCk8d81eJNBq2Jge3Md5rKSUKeDdfJsE+G+UPOh7sVfIfK
         PcBubHNi7n8+AsWAZZmg4eTmEdpcT1reVZqoedTMsclVLAocZRyDyIrMVqkIUpI7rsKa
         2a6ZeoxlPPpG4QundYgWyzp2fXAY6XUo6fUv3Wxc49ausEkRI0H5CFf7zR2x5T4mLUyJ
         CoVeVKgT7BCwtWXoIvJsBSLIu4lqUndRh/XdXJvRb+a2YNzcr8zYNDoDVsf4ilFYVAhz
         kdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf/S10zhUOuqWqnu6HA+FqmDip5kZwbghIxjIbViWUeI7gxt3EYil/1mlJf/ABvJv9FMxvrfSt3IuA@vger.kernel.org, AJvYcCXE0ELoF3T88tpWsVL470vimZkIO+Wuqd6S9AX0J+iBCbiJ8YNSSfPPTHfiOJrLVhFqunGcDQFqZ2gdpjEE@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRV2bhJkIBdFOa57CTy7O9qXbjuCOXzJATTjDMBSpEkfiijo5
	HNL1X1S7lJkDTbYXfTJY5xIYoiU2MLDxzfGD5t0izP2XlK2ESWrCTJARQDydiABXQcxjKuVLjko
	/HdWngz/QPPjdOYdVwBs7WaIwb3U=
X-Gm-Gg: ASbGnctxha/tgtyOv3r5alBwKpYqfiESbY9AZjEUXe64lKjWX5XodJN6EuSWCTpkB1O
	jS2qwC0v2fsjXQLkfQl36QmdcuBzrnC30+rmuf4CY2ygS2wxKW3kjeum8jDXlO7kfizpPpb8kY7
	hGcA++aMrhkXHOMek8tHiiS6NvrZCfKjtmxCR5+N+r
X-Google-Smtp-Source: AGHT+IHVq/OJ+5eWqAgV0C40CkVvYiB3g3UpuuHrRaTOdnWvFTptDTYS2PzO/EixgKcm/7GKrRXQgpJN+Y1ESqaqhMM=
X-Received: by 2002:a17:902:f610:b0:220:fce7:d3a6 with SMTP id
 d9443c01a7336-22a8a06b429mr135619515ad.23.1743971789179; Sun, 06 Apr 2025
 13:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net> <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
 <Z-vjWFFWvo1gesCe@probook>
In-Reply-To: <Z-vjWFFWvo1gesCe@probook>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:36:18 +0200
X-Gm-Features: ATxdqUGmtk00PreuVDRwGTRsD3__is8AGxXyJNh6rRQ0MhHTNzn1k6d2MHuZvGY
Message-ID: <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 3:00=E2=80=AFPM J. Neusch=C3=A4fer <j.ne@posteo.net>=
 wrote:
>
> On Sun, Mar 30, 2025 at 11:10:28PM +0200, Martin Blumenstingl wrote:
> > Thanks for your patch!
> >
> > On Sun, Mar 23, 2025 at 1:38=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
> > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > [...]
> > > +               eth_phy0: ethernet-phy@0 {
> > > +                       /* IC Plus IP101A (0x02430c54) */
> > > +                       reg =3D <0>;
> > Does reg =3D <1> also work on your board?
> > 0 is the broadcast address. It's unfortunately something that we still
> > have incorrect in a lot of .dts files.
>
> Unfortunately not. I tried addresses 1 to 31 without success, which
> seems strange; my guess was that the PHY should respond to one of them.
> I get this error:
>
> # ip l set eth0 up
> [    6.806847] meson6-dwmac c9410000.ethernet eth0: Register MEM_TYPE_PAG=
E_POOL RxQ-0
> [    6.810609] meson6-dwmac c9410000.ethernet eth0: __stmmac_open: Cannot=
 attach to PHY (error: -19)
Thanks for testing. Let's keep it at zero then.

> >
> > [...]
> > > +&i2c_AO {
> > > +       status =3D "okay";
> > > +       pinctrl-0 =3D <&i2c_ao_pins>;
> > > +       pinctrl-names =3D "default";
> > > +
> > > +       pmic@32 {
> > > +               compatible =3D "ricoh,rn5t618";
> > > +               reg =3D <0x32>;
> > > +               system-power-controller;
> > Here I'm a bit surprised:
> > Aren't some of the outputs used to drive VCCK (CPU power rail) and
> > VDDEE (everything else power rail, which also powers the GPU)?
>
> Unfortunately I don't have schematics and I wasn't able to trace the
> connections on the board because they're so tiny. So it's quite possible =
that
> you're right, but I can't be sure.
>
> Are there voltage sensors in the Meson8 SoC that I could use to establish=
s the
> relation between PMIC outputs and SoC supplies?
There aren't any sensors (that I'm aware of). But you can check
/sys/kernel/debug/regulator/regulator_summary and compare the values
with the ones from arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
Also the vendor u-boot and kernel logs may provide some information.

> >
> > [...]
> > > +&usb1 {
> > > +       status =3D "okay";
> > > +       dr_mode =3D "host";
> > > +       /*
> > > +        * This bus features a Realtek RTL8188 2.4GHz WiFi module, wi=
th a
> > > +        * 3.3V supply voltage that must be enabled before use.
> > > +        */
> > > +       vbus-supply =3D <&wifi_3v3>;
> > If you want to go for perfection then you can use
> > Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml as
> > reference.
> > It's also an "onboard" USB device which requires toggling a GPIO and re=
gulators.
> > The driver side is super easy to manage as it's generic (meaning: it
> > parses any GPIO and regulator as long as the USB ID is registered):
> > drivers/usb/misc/onboard_usb_dev.c
>
> I considered using onboard_usb_dev, but then came to the conclusion that
> I don't need it because I don't need reset sequencing, only power.
>
> > That way you can just describe the RTL8188 on the USB bus and assign
> > it's vd33-supply without having to (ab)use vbus-supply of the USB
> > controller.
>
> This does sound reasonable. I'll reconsider the onboard_usb_dev
> approach.
Thank you for the onboard usb device patches (for those who are curious: [0=
])!


[0] https://lore.kernel.org/lkml/20250403-rtl-onboard-v1-0-10ca9a6a4ee0@pos=
teo.net/
