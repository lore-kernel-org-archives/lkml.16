Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F111EB5E7;
	Sun, 20 Apr 2025 16:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167999; cv=none; b=nAgYqwA+39j2PdfaVF9gyR5cz/g7ijShr10PI4xs9b932JzJQ5abe9RVXk/DDYu8zPx0PiZzyPu4LEycQF/joswHvem097UG81R7ZybOSoxk+uPoO/kpb4YO9gUbfsaDqde6u4pIie1uqOH/jMCZrBPGnLlg/gVLBerzOo/dtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167999; c=relaxed/simple;
	bh=a/YSaxMtnkz3x+ibIzhkE9mCzEFE2bazmNNuXRGQ0Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxbNQ8inpkUFhCJYxxaNAm4Kxt6bGsicIf3HVpAS4hilvnItYvRAuOTeZLAg6KLfj/H7u+stj2ZlCyXcTPxQnVt2nvB/maX2OfUXHi1onobDv/AQ0Jr1DBTk1Koos0NJH9qGndw8mmxYHP3Ol8fVFCUDfrsq8AFfldYtq20rvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=BCyd2pp0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BCyd2pp0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22c33ac23edso32516095ad.0;
        Sun, 20 Apr 2025 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167996; x=1745772796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SPeMr2qOZn4YU1fh/fx5ZM9kAovJzAmEca1OBcRO4o=;
        b=BCyd2pp0C8/lQaKc97Zkb4J3qKkhddbCbbH6CdPQWr+4tzhbyYFB29vDcy5TuiDF5P
         RNEWAhA7yjHRhnGa77UWKKnGn78H5qM2INcZRpJIsMGPAOuuRA7zjq5YHxeIZpiS7RgL
         cHmYHnCw+ByhvuopfuUgGo389U+T3IRti/rbsLp96FvdzqeYgPrYSMGWgEpIbc9Ak+Gm
         Hus1WoMbi9o9PTwLc0q43v3d3RDEsBtR2jrdU4rk8+oaRZtkIzB4Exp7vaaxoM0v9zq1
         gvnBZ/jz9TgjToSReDwCvT63jgjhvPqo0QcU/XH/ctf2earm9M3dUVO33h4BfAAxmbfW
         Pjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167996; x=1745772796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SPeMr2qOZn4YU1fh/fx5ZM9kAovJzAmEca1OBcRO4o=;
        b=MZfbbQGVxQeSU0RcSYHSgGGHmhZQxz2nglBoFv5IX7Y78b9A+IkYsgRF7i89H0Aigp
         78lCH0kQZTDhIPrwYuTXog1Zhknyhyr12mMttQMEl5mVb5d2Yv3ucfAUNdX97RP5UMuT
         ISxco/GF6fNZcXqsf7PR6FXdsUUVkIA1x2ExRC2wHSC4uUOJxXzIuqfKkr09rdwNA01c
         kORkilbzAkZxvBnWdAt51QGGaKkoUac4yxTMbN58rrmQ+QgW5B70r9RUxyDrhaHBGtbY
         016Hr6bW8d2rZjb4lDtZEtAjpTIa7Olfl0osUrjjs/ZSZVtG75lHT29+s3lWzRVRBndN
         cFqw==
X-Forwarded-Encrypted: i=1; AJvYcCVvWMNtVAdg7DqcY6i6R63pUkW4qDFJF9YSqN0lHEcKWzdiqGFnXP0/XfwnoZh02QFdCW5HrZFUv6KM@vger.kernel.org, AJvYcCVxts+Qqo98RgsCjwGfCNL/PKVC3uYrGOh9a3sSedy7TM9e+DIsQpR9HTf0nFZzhO6HaHkxyAiVg4HEJAjY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3esTwRq1GDB2SLj1yNKvSzPeE9oq3g8sL/Ad5Vz0IQpASHTq
	f5U6SCrsyhFk6TdLxWOltc274JaHAUf9KM9YscNraMVtL/IqCkjC9q6lRTdrJBMHQFrr4HAvmwA
	U6kB5B9nFJZg12URDS+31/HRkmFA=
X-Gm-Gg: ASbGncsYUFIhgMVl8L+mtavzuEphXGEn47wOUlJzxuTgxfKpcGba53TUiMj4K/YsIPo
	FM+2rc5kBvyHJ6doYjCeqlkVDu34EMpcA6O+1joVoqyM0hXcFHxcmvigYx4Ccc+eHeQbxL3kPZh
	OxkucPojUtk9Zj2I2MeHkFPMQXW1tURnHQXxGwa0EidquWBOE=
X-Google-Smtp-Source: AGHT+IH8DzvTiy4h+KL4U19Sci4voDMK4mciBQ4BPN22Pz+pQoaq5S9v0/nWEx5fqmVPXETBHXM/RT+poBdLM+MB/+0=
X-Received: by 2002:a17:902:f684:b0:223:635d:3e2a with SMTP id
 d9443c01a7336-22c535c0760mr127312745ad.23.1745167995675; Sun, 20 Apr 2025
 09:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com> <4A37D0CD-FD4F-445A-87F8-19D65CB7FDB9@hewittfamily.org.uk>
In-Reply-To: <4A37D0CD-FD4F-445A-87F8-19D65CB7FDB9@hewittfamily.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 20 Apr 2025 18:53:04 +0200
X-Gm-Features: ATxdqUHEOYPXXRr0KRgABoAXqlDBucnLKVCiuCrN19sebvABvHD_xIDDHJKPPek
Message-ID: <CAFBinCC7HrT_fD0zYudtj10SNiajwq-OSC7ceeoNrz2neChptg@mail.gmail.com>
Subject: Re: [PATCH 0/5] dts: amlogic: switch to the new PWM controller binding
To: Christian Hewitt <christian@hewittfamily.org.uk>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 9:45=E2=80=AFAM Christian Hewitt
<christian@hewittfamily.org.uk> wrote:
>
> > On 28 Dec 2024, at 1:25=E2=80=AFam, Martin Blumenstingl <martin.blumens=
tingl@googlemail.com> wrote:
> >
> > This series switches all Amlogic SoCs to use the new PWM controller
> > binding. The main benefits of the new binding are:
> > - the pwm controller driver now picks the best possible clock to
> >  achieve the most accurate pwm output
> > - board.dts don't have to know about the pwm clock inputs anymore (as
> >  the driver picks the best one automatically)
> > - new SoCs only need a new compatible string but no pwm-meson driver
> >  changes, assuming only the clock inputs differ from older IP
> >  revisions
> >
> > This silences the following warning(s) at boot (for each pwm
> > controller instance):
> >  using obsolete compatible, please consider updating dt
> >
> > I have tested this on two devices:
> > - meson8b: odroidc1 (boots fine and cycling through all CPU
> >  frequencies and thus voltages works fine)
> > - meson-sm1: x96-air-gbit (boots and the rtw8822cs SDIO card is
> >  detected, so the 32kHz clock for the SDIO card works)
> >
> > Since I cannot test all devices I'm asking for this series to be
> > applied so the Kernel CI board farm can help verify it works on all
> > boards available there.
>
> This series breaks Broadcom BT on the GXBB/GXM/G12B boards in my
> current test rotation. I=E2=80=99m running Linux 6.14.2 with this series
> backported for testing. This is generally what=E2=80=99s seen in dmesg:
>
> VIM2:~ # dmesg | grep -i blue
> [    8.659535] Bluetooth: Core ver 2.22
> [    8.659681] NET: Registered PF_BLUETOOTH protocol family
> [    8.659690] Bluetooth: HCI device and connection manager initialized
> [    8.659712] Bluetooth: HCI socket layer initialized
> [    8.659721] Bluetooth: L2CAP socket layer initialized
> [    8.659742] Bluetooth: SCO socket layer initialized
> [    8.724898] Bluetooth: HCI UART driver ver 2.3
> [    8.724953] Bluetooth: HCI UART protocol H4 registered
> [    8.725106] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [    8.725434] Bluetooth: HCI UART protocol Broadcom registered
> [    8.725502] Bluetooth: HCI UART protocol QCA registered
> [    8.725559] Bluetooth: HCI UART protocol AML registered
> [    8.966727] Bluetooth: hci0: Frame reassembly failed (-84)
> [    8.966772] Bluetooth: hci0: Frame reassembly failed (-84)
> [   11.148157] Bluetooth: hci0: command 0xfc18 tx timeout
> [   11.148383] Bluetooth: hci0: BCM: failed to write update baudrate (-11=
0)
> [   11.148446] Bluetooth: hci0: Failed to set baudrate
> [   13.281510] Bluetooth: hci0: command 0xfc18 tx timeout
> [   13.281576] Bluetooth: hci0: BCM: Reset failed (-110)
>
> This is also visible on a VIM3 board in kernelci (Linux 6.15.-rc2):
>
> https://dashboard.kernelci.org/test/maestro%3A67fd3cda3328e043e96da230?l=
=3Dtrue
>
> [ 3.954267] Bluetooth: hci0: Frame reassembly failed (-84)
> [ 4.040555] Bluetooth: hci0: Frame reassembly failed (-84)
>
> (linux-firmware and thus kernelci is lacking Broadcom BT firmwares so
> later messages that result from trying to load fw aren=E2=80=99t seen)
>
> With the series reverted:
>
> VIM2:~ # dmesg | grep -i blue
> [    8.452570] Bluetooth: Core ver 2.22
> [    8.452695] NET: Registered PF_BLUETOOTH protocol family
> [    8.452703] Bluetooth: HCI device and connection manager initialized
> [    8.452724] Bluetooth: HCI socket layer initialized
> [    8.452735] Bluetooth: L2CAP socket layer initialized
> [    8.452752] Bluetooth: SCO socket layer initialized
> [    8.530077] Bluetooth: HCI UART driver ver 2.3
> [    8.530113] Bluetooth: HCI UART protocol H4 registered
> [    8.530387] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [    8.530902] Bluetooth: HCI UART protocol Broadcom registered
> [    8.530983] Bluetooth: HCI UART protocol QCA registered
> [    8.531037] Bluetooth: HCI UART protocol AML registered
> [    8.917685] Bluetooth: hci0: BCM: chip id 101
> [    8.918000] Bluetooth: hci0: BCM: features 0x2f
> [    8.919526] Bluetooth: hci0: BCM4354A2
> [    8.919560] Bluetooth: hci0: BCM4356A2 (001.003.015) build 0000
> [    8.941837] Bluetooth: hci0: BCM4356A2 'brcm/BCM4356A2.hcd' Patch
> [    9.831321] Bluetooth: hci0: BCM: features 0x2f
> [    9.832884] Bluetooth: hci0: BCM4356 37.4MHz AMPAK AP6356-0055
> [    9.832902] Bluetooth: hci0: BCM4356A2 (001.003.015) build 0266
> [    9.856044] Bluetooth: MGMT ver 1.23
>
> An SML544TW board (S905D) with a QCA9377 chip is not affected by the
> changes so the scope appears to be limited to Broadcom BT.
>
> I=E2=80=99ve also noticed that VIM3 and the SML5442TW have device-tree it=
ems
> like max-speed, clocks, clock-names defined, but adding these to e.g.
> a WeTek Play2 board or removing from VIM3 doesn=E2=80=99t change anything=
.
Thanks for reporting this - a fix has been submitted here: [0]


[0] https://lore.kernel.org/linux-amlogic/20250420164801.330505-1-martin.bl=
umenstingl@googlemail.com/T/#t
