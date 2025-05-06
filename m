Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F0928B507
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502481; cv=none; b=fqE7g9uMcZvcDHnCQdKzr6JBqTo4BphYfAIQ3QahrtUo7btu2WWKnO6R2JWPbkdRw2KagsrSRP4AQBgBk1iFXBIcuuOdP7ktLjNb6xxWQLuY295sUItfji127HuxVqjJU4CiqPfRXym5EhKiQUwTzM8drVm5HdGVfphQQ1pigS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502481; c=relaxed/simple;
	bh=g8MUKgYxO0XCdh4y8sIRCaK/IyskVqhdg6cAW+zE6B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fime7U6fyX/JeIJU4t1OLa2+bojFlqOfcF83N1ORbwaLsPS9BUMmjUCG8LFJtM4hMJl8T+JI/k4xM1Q+oozuUFsl/bIRpGkJ1Gaq7aiG4nKrIW0fAI7069ak8RWEdXQKBZOMuG8zxHPiSi1iE3IitfMaP5FcSPGLiiixpiiIv0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=le2496A+; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="le2496A+"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F3CC03F1BD
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746502476;
	bh=dYfwdCCJVSXjAwFPOfnP+8phDvedaXssHCMaKp2AVLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=le2496A+fRzy2QF8GD64GhaR9aYk7bZR2e8usGCeK/g3F/ewlaDDUsdaKEe8L4i2c
	 jattQLDQYv4vW5ATCfa0Rozt3NJUBRkTzlDN7odirQHtvCA9koo0l8RXRTIeuxWmH6
	 7Z+kx+0paUVYlHbM+CSVSpjiz1O+M+zNDNXKg/ijzzUT/Wub0KnSwaHz/qDYEXkso5
	 8WhHR/G64b3msoXu0EF6UZ5XUTGcmoj2wV16YC20XJpkowa4gd4fPXrMXsQ5BVCOsI
	 /AoHu7A0t2KgFSmAEv0j3HcUuo8mZ+K2f27YlZRGx7KPp5b4PEvdVN2l39bv2Xz17D
	 Nu0irLEBOlc/A==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso368099966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 20:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746502475; x=1747107275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYfwdCCJVSXjAwFPOfnP+8phDvedaXssHCMaKp2AVLs=;
        b=V7AWpUs+dY2cZ5wdCFBqDcMGbn6yvq9m1EBRS3d0yGAGaGZZ4BGKbQ5AcoXBDKEW3I
         pNHOLx+x+c019wWtUlaIoHQa/qsTU7jgda/LMQwFdZnHPCzaMgorgrrIoBS0uW34FaBh
         hw7TPDPb0tbNr904ddWvAh3uPt9Nup60JXbjJB3Em9Z30Hvzi/7T+5gIzjcTtEiB8w79
         8vNB53AioL8vlRgOAj0XvOq7r/YB30WUlDbxOQ6Nk+mIn2YxldzL/j6ndtKvI58EVN5G
         ct+A1JmRYNJQaoxF2pDOiDeTpu32ntAytSkX3wytVjdz1WfJdg+ahnjh232lFKGUXOnc
         KVMg==
X-Forwarded-Encrypted: i=1; AJvYcCWBIjGuzuRh4IKwVfgPyUB4NVqmWVNulcOgpiMEkoBToWfuD5+fd+THrZVu69j7Ni3rquUVHugBWYgLHX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwezSutelXDhaipn9tIo5ZbLY+tIX+qGehV4+m5HLEB3QYkBLM
	ToUhboDRG3IW6MHkospq2cAbvC7MshxJZY6h5o6X6qbgSNS4Pk1+ic3NGV/vAhQ5Pp0iFyflbMQ
	cntU8aA9QkPmqOrQuGFgQgEGN4gCiCYrNwMUJVKwt3cFDaMED5s7+viLoMj0vYG/EfoGMwvPjR6
	RbxEjh8omLOGt/Eiu8lRnhWzk8oDaRT8HOspdsBwojzhBNXhj3q1uSEIqjRsUN4Xgmiw==
X-Gm-Gg: ASbGncsuFPypRibI4sqjP8Z0PbK0IvSN0WowvOf8fPF5Gljns/r6CQq+OZ/2r5rWm4u
	oWaV4F7I55QrKLX8ZPHbMXMYyGtaGWuMTRJyKDM1DVZ59MFN0Rt2eJcrIC1yB8xbETUgVJwSgoz
	KcpUUQhWusLN27
X-Received: by 2002:a17:906:478f:b0:ac3:8d34:1d73 with SMTP id a640c23a62f3a-ad1d3466659mr144058666b.8.1746502474791;
        Mon, 05 May 2025 20:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQvdM2anjmOfvdYXV4pVK/Lvh4+0O0s8lc0mGFrYvhPaoQnrfKNFO6ELytEXPy5ZXHpzf3CRNSYX3/91Zn0A8=
X-Received: by 2002:a17:906:478f:b0:ac3:8d34:1d73 with SMTP id
 a640c23a62f3a-ad1d3466659mr144057866b.8.1746502474453; Mon, 05 May 2025
 20:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312063532.551938-1-acelan.kao@canonical.com> <s3ns5747-ps0n-1no0-1qqq-prq39onr7o79@xreary.bet>
In-Reply-To: <s3ns5747-ps0n-1no0-1qqq-prq39onr7o79@xreary.bet>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Tue, 6 May 2025 11:34:22 +0800
X-Gm-Features: ATxdqUHoU1ZT80D8dlZIH98pbSWRq0Ubltew2yRlnoeaFhFCQQ1HsI43J43XnC8
Message-ID: <CAFv23Q=-jCJN-NrNKHan_KCHQEWS=1AtfhfxuA7bgvJdOw4raA@mail.gmail.com>
Subject: Re: [PATCH] HID: quirks: Add quirk for Chicony Electronics HP 5MP Camera
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiri Kosina <jikos@kernel.org> =E6=96=BC 2025=E5=B9=B44=E6=9C=8824=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 12 Mar 2025, Chia-Lin Kao (AceLan) wrote:
>
> > The Chicony Electronics HP 5MP Camera (USB ID 04F2:B82C) reports a HID
> > sensor interface that is not actually implemented. Attempting to access
> > this non-functional sensor via iio_info causes system hangs as runtime =
PM
> > tries to wake up an unresponsive sensor.
> >
> > Add this device to the HID ignore list since the sensor interface is
> > non-functional by design and should not be exposed to userspace.
> >
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/hid/hid-ids.h    | 1 +
> >  drivers/hid/hid-quirks.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 7e400624908e..5fdea9116a3e 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -297,6 +297,7 @@
> >  #define USB_DEVICE_ID_ASUS_AK1D              0x1125
> >  #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A  0x1408
> >  #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12  0x1421
> > +#define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA  0xb82c
> >
> >  #define USB_VENDOR_ID_CHUNGHWAT              0x2247
> >  #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH   0x0001
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 5d7a418ccdbe..452fac15550b 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -370,6 +370,7 @@ static const struct hid_device_id hid_have_special_=
driver[] =3D {
> >       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIR=
ELESS2) },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) =
},
> >       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACE=
R_SWITCH12) },
> > +     { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_=
5MB_CAMERA) },
>
> Given the changelog, did you mean to add this device to hid_ignore_list[]
> instead of hid_have_special_driver[]?
Yes, you are right.
I'll submit v2 for the 2 patches.
Thanks.
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
