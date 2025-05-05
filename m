Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883871A8418;
	Mon,  5 May 2025 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478606; cv=none; b=jUW4WuIdvgdD4rkehikjDVRwgBj6uwO0NTCaS5rRZ5ewPYQOsMyTsRA8K+ukLJongIL/9RgYyJBHRhxCSXgavBTFMhCi9fCsLalvbZyJPmpAPJqdXR0VB5ugledNOEtaBGVwtXdFAHXAMrpPzggrWt4Aa25JSydajsA36ygJKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478606; c=relaxed/simple;
	bh=+zSEcQXcJSa0UVLRCve/MVPW781/atvqhwN219jf8j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvfOuxPOxv5DFOlQ0HG5tQTRp/UTkb40vErL+kd+NqnzjXjUWPM+d0VO47snyrHZVj6uT2ltAQ1I9ZJDxeXw1K70IPRbw/1tG/1+yzU+gChH9vvc6eI1tDAYDbANdeR9E6a15Zi2b18OiALk2ixU43ZEcpQmEZs5ntRcZ0dXvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTlvn8Yf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTlvn8Yf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDBBC4AF09;
	Mon,  5 May 2025 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746478606;
	bh=+zSEcQXcJSa0UVLRCve/MVPW781/atvqhwN219jf8j4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GTlvn8YfPvSKCrQhLeMR60udbVb7VAivkh32QAzn72XFsGXir9p0ZFC35gTE0ELT+
	 sNh0esvjITXpsa3q/ZNOSdwd51X7ceWQ8Jdj0AiZ7errYoj9DCv2ZcmvLB//aKDfnc
	 zaSDAGnZuZq+hyQj5EVY/AoH7GL3YRU/qe6kjgSAW9+gxxWoI/P0uXF4siO2M/e8TQ
	 2m4lmJrAXUt9OMG5toAEeXjMk0yZKSiXOvmrqbIVdj85m24166N9H1olVsgtxR3RTb
	 Q7mTomzu8xogbraiwsHjoXfgrlsjIDsX0vx7FDKKyDjNtcXtjyk+QvaVG3rgHPNeb6
	 MM4vzIVqMjDng==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb615228a4so1140944566b.0;
        Mon, 05 May 2025 13:56:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVstBBFNm5a4oQ7a5+jNUGy2iM/Pw5bVQJpYA+NkYI6bNEiPZQksEduZ+fhNl6SEdoW7rVuKOJMIvXp@vger.kernel.org, AJvYcCX9lEk5I46wUOqfmr24/XITFKEu/V5iE0p+V5pnSPLUNQ0a9T2zdtFqMyFQBtmFTz6r23adlOKXz/VNbPxB@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1YBiuJbAq8SanPJStuO+msNVPqtjOx/RB+ULBjUhESmSsLkM
	xWore/gijrthggPzmK2NyY/pgskUDPc/3gYZrT4CuGeKLAGjFe748iA1pxnS272kbwZ6+P+wt/u
	EPMp7e2t/Y9mUuPmhYGIP++4i/Q==
X-Google-Smtp-Source: AGHT+IGkJVWyh0QSuT5meDQSjUXPMHR2CgBR7bcqa5G7fqFp4zogRHH6ii5TTGWVWqUyH/EwtI9puy7YAAqslZ74eDc=
X-Received: by 2002:a17:907:7251:b0:ac7:e4b5:4827 with SMTP id
 a640c23a62f3a-ad1d2fa229emr75140366b.28.1746478604546; Mon, 05 May 2025
 13:56:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
 <20250430160944.7740d5e9@bootlin.com> <e05c315d-a907-45f0-8f5c-1c106b05f548@beagleboard.org>
 <2025050448-snipping-flatbed-2752@gregkh> <eefa06c1-478f-4670-80c7-4bde8c808e1b@beagleboard.org>
 <2025050426-expel-overarch-3454@gregkh> <CAMuHMdU6YmGnZqGt6ptXdaTSiSYFaAZqFRKL=WyBZ8W3Cv39kA@mail.gmail.com>
In-Reply-To: <CAMuHMdU6YmGnZqGt6ptXdaTSiSYFaAZqFRKL=WyBZ8W3Cv39kA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 15:56:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLr1Ag5==EE-rB=L7=OZQMjGGyDkgpxoz9_=tvXy2HOsA@mail.gmail.com>
X-Gm-Features: ATxdqUEzwkZLzGgqG3YoBCDaB7fyZVe_0W2NIGUQBC4xaFWWiXwkAu9GuXGlbQ0
Message-ID: <CAL_JsqLr1Ag5==EE-rB=L7=OZQMjGGyDkgpxoz9_=tvXy2HOsA@mail.gmail.com>
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ayush Singh <ayush@beagleboard.org>, 
	Herve Codina <herve.codina@bootlin.com>, xypron.glpk@gmx.de, 
	Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Dhruva Gole <d-gole@ti.com>, Robert Nelson <robertcnelson@beagleboard.org>, Andrew Davis <afd@ti.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 1:44=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Sun, 4 May 2025 at 15:13, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Sun, May 04, 2025 at 06:30:24PM +0530, Ayush Singh wrote:
> > > On 5/4/25 18:20, Greg Kroah-Hartman wrote:
> > > > On Sun, May 04, 2025 at 06:03:26PM +0530, Ayush Singh wrote:
> > > > > > It depends on the bus the device is added.
> > > > > > when an overlay is applied by the kernel, OF_RECONFIG_* events =
are
> > > > > > triggered. Some buses handle them:
> > > > > >
> > > > > >         $ git grep OF_RECONFIG_CHANGE
> > > > > >         drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_ADD:
> > > > > >         drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_REMOVE:
> > > > > >         drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE=
_ADD:
> > > > > >         drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE=
_REMOVE:
> > > > > >         drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE=
_ADD:
> > > > > >         drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE=
_REMOVE:
> > > > > >         drivers/of/dynamic.c: * Return: OF_RECONFIG_CHANGE_REMO=
VE on device going from enabled to
> > > > > >         drivers/of/dynamic.c: * disabled, OF_RECONFIG_CHANGE_AD=
D on device going from disabled to
> > > > > >         drivers/of/dynamic.c:   return new_state ? OF_RECONFIG_=
CHANGE_ADD : OF_RECONFIG_CHANGE_REMOVE;
> > > > > >         drivers/of/platform.c:  case OF_RECONFIG_CHANGE_ADD:
> > > > > >         drivers/of/platform.c:  case OF_RECONFIG_CHANGE_REMOVE:
> > > > > >         drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_ADD:
> > > > > >         drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_REMOVE:
> > > > > >         include/linux/of.h:     OF_RECONFIG_CHANGE_ADD,
> > > > > >         include/linux/of.h:     OF_RECONFIG_CHANGE_REMOVE,
> > > > >
> > > > > Well, if some bus does handle the event, I guess it is a bug in t=
he
> > > > > subsystems that do not? Maybe Greg Kroah-Hartman can clarify the =
expected
>
> Support for OF_RECONFIG_* events was added only to buses where users
> had a need for it (spi, i2c, platform, weim) and to the GPIO subsystem
> (for hogs).  More can be added...
>
> > > > > behavior here? Maybe we are in transition phase here.
> > > > Perhaps those other busses just do not have OF devices and so they =
never
> > > > needed to add that functionality to them?
> > > >
> > > > If they do, then by all means add that code.  OF devices are not
> > > > possible for many bus types, so there shouldn't be a need to add th=
is to
> > > > the driver core, right?
> > >
> > > UART devices are pretty common in both Beagle capes and MikroBUS. So =
I think
> > > that will probably need to be added at some point.
> >
> > uarts are not a bus, they are a type of device that is implemented by
> > many different bus drivers (pci, USB, etc.)
>
> It depends...
> https://elixir.bootlin.com/linux/v6.14.5/source/Documentation/devicetree/=
bindings/serial/serial.yaml#L90
>
> It makes perfect sense to add support for OF_RECONFIG_* events to the
> serial bus, so people can attach e.g. a bluetooth or GNSS device to a
> serial header on their board (or even to a legacy serial port on a PC),
> load a DT overlay, and enjoy a working device.

serdev has bigger issues than lack of OF_RECONFIG_* support. Whether a
UART is bound to tty or serdev is purely based on whether there's a
child node or not under the UART node. Until someone figures out how
to make unbinding from tty layer work or allow both at the same time,
then it's not going to matter.

Notifier events are usually a solution waiting for something better. I
think we should actually remove the property notifiers. While we can
support nodes coming and going, we absolutely have no support for
properties coming and going. I don't think we want to start
refcounting properties either.

Rob
