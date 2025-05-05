Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C71ACEAF;
	Mon,  5 May 2025 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746427439; cv=none; b=DfbcEcMLHR127Y1oEqrGVJRdr/bDVmQFQH2pwAZfJG5rL1Rbo0AclioEWsK4vsB6vM8eGae+fc1Wz1dM2s651QslU/Du86nTr1FjO3yc0HDIDw1v5cArRhAfMuiMwE8vuiLN5opa0h4+K1IFYCBV+nFZ9R2AOSVQt3JKrN91jtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746427439; c=relaxed/simple;
	bh=fpn/xjZVS3m78+cxs2KZQavQH/bkuecu2pwpnt0qmS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIpwkVUsODb+eBDWEKq4ZhJ9So7bmZMOh7eoM2tDiq06+JuvK8FqDynQHbCrN0z3O0GVLjgOy0lIRYBTehiuRfV+19IIAsh4RSUuRwtVc4G6qshMIize83V6+EJG63z44hYwIXMKCXuSBqrqxkH/YYz0gDP9ueElNrT6U9C6GW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso1007709241.3;
        Sun, 04 May 2025 23:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746427434; x=1747032234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7xV1WFjCXy+Nve+XjPCO8aK4tjjHOEro31m5+57hRw=;
        b=ImvVi4pzuCwvHabvYDrcZUPRrt8L3s5LeGEkM58MztZiR7GVtCKp2oGV0kZBYBIwYv
         Itm1tCZAnh2WgSqh+V1YzHKoCQhv/eztB4/iQgcAmQ6sqMF+W1RqX03eQFuLHNglolb5
         eGzHGDzW5admbJTplScjRzS/21bPs4z4b+mJanc5T2x3v1RI1/QAr/qNG+cPcWGvRzqI
         ILdDe+zpj13eLIy2nZhwdqpKuzBiUheI4y8YbTPhH9cwZlWZyYQKj0J4Vg+/4SanXRQ8
         1k0wpqogwsIlH3Jed07olNeG94SXLvGs1wOyt+D63VUb9vOLqvfH6PvJXTmcB9LZdLex
         Gylg==
X-Forwarded-Encrypted: i=1; AJvYcCVCm+PDtdjzXVQgA1WEyH96qWk30jmasmt3r73czCWRhnTyJfIJ0rrzBIiARtoFNYcEE2n0ObEE0aUvYOEe@vger.kernel.org, AJvYcCWmx3xp+FSCwoCc7OmfeRPRjyStDcJag3xz2Loq1sF1V6JQ5RscTQneQOzGHVUHdixbEmI9cptihW2B@vger.kernel.org
X-Gm-Message-State: AOJu0YyMigMW8SPI1PsDNIZMYo8KCWjh6/VvUR83XjprK9sSYMdQB3gV
	thDAyMb+pnBeDQLJ5z8ow/HazR5qrGoCAeK1kJL0JLoZzlfgSHMPinbiGDDb
X-Gm-Gg: ASbGncuAK3eWQRrdcIUbsOxdYLVPSEl0lByxDVctfYldSuqnIHhYE6efh+XPRFCQcEO
	w0ECOnvjSymbo2MHd2P4RV6f55mZAoab4y1UsB+L2vvMpCVmkQwrCjJlrgXVFPueDUmxW2i0upU
	GLmhaHZpe2lPF4/TCGyyFYaBe/0u8NPgNnZx0m/AU8PMb+uzz8nLrRDWJ8eGyur3bb2JWvxlcHP
	0m1JTiZ8Fq7fSmyuZ3ggYDDTywspqSVfbJmNtFY1cR6RxwrcOmlToqYTWpRi9R535Fi/jmVSkXK
	Mz/pz8Cb89ZUhpS9cz3Vs9p0Rg66H29WRmh17wSKYmk+YHTulugXPkfGTG68uB1A37Oer/6AMGW
	/wa5J36g=
X-Google-Smtp-Source: AGHT+IECHqJTavtdZNhCCIDdJdrinS24gUxYMaSlAvtoIEvCthpj+71yzBtFbf8giaEpcwSrJ3SnOw==
X-Received: by 2002:a05:6102:2132:b0:4da:fd05:ab50 with SMTP id ada2fe7eead31-4dafd05acbemr4264295137.4.1746427434541;
        Sun, 04 May 2025 23:43:54 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae401e0a4sm1417252e0c.11.2025.05.04.23.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 23:43:53 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so767915e0c.0;
        Sun, 04 May 2025 23:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPUKksqOVQmwuXv+V0b1Ch6mrSfCU942KBwoZuSGW1tVO2EnmDYrUEa52nduk1pMW1yxwKGYC/tevbkl9p@vger.kernel.org, AJvYcCXjc8dWNhe1L3vVIZ/GCZW6J3IY2ikG22OWg1wxiBUriLUpZdr7ZK+NG5H+HdAWljA+XoDlPZiOcz1O@vger.kernel.org
X-Received: by 2002:a05:6102:5681:b0:4da:e631:a472 with SMTP id
 ada2fe7eead31-4dafb690042mr5717788137.20.1746427433572; Sun, 04 May 2025
 23:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
 <20250430160944.7740d5e9@bootlin.com> <e05c315d-a907-45f0-8f5c-1c106b05f548@beagleboard.org>
 <2025050448-snipping-flatbed-2752@gregkh> <eefa06c1-478f-4670-80c7-4bde8c808e1b@beagleboard.org>
 <2025050426-expel-overarch-3454@gregkh>
In-Reply-To: <2025050426-expel-overarch-3454@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 08:43:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6YmGnZqGt6ptXdaTSiSYFaAZqFRKL=WyBZ8W3Cv39kA@mail.gmail.com>
X-Gm-Features: ATxdqUGYRBSkNjIwljVoXFXrqnnAeDodJvOJHG1dShrJ1JyIg8sAoDNS_HyyEbY
Message-ID: <CAMuHMdU6YmGnZqGt6ptXdaTSiSYFaAZqFRKL=WyBZ8W3Cv39kA@mail.gmail.com>
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ayush Singh <ayush@beagleboard.org>, Herve Codina <herve.codina@bootlin.com>, xypron.glpk@gmx.de, 
	Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Dhruva Gole <d-gole@ti.com>, Robert Nelson <robertcnelson@beagleboard.org>, Andrew Davis <afd@ti.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 May 2025 at 15:13, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, May 04, 2025 at 06:30:24PM +0530, Ayush Singh wrote:
> > On 5/4/25 18:20, Greg Kroah-Hartman wrote:
> > > On Sun, May 04, 2025 at 06:03:26PM +0530, Ayush Singh wrote:
> > > > > It depends on the bus the device is added.
> > > > > when an overlay is applied by the kernel, OF_RECONFIG_* events are
> > > > > triggered. Some buses handle them:
> > > > >
> > > > >         $ git grep OF_RECONFIG_CHANGE
> > > > >         drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_ADD:
> > > > >         drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_REMOVE:
> > > > >         drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_ADD:
> > > > >         drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> > > > >         drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_ADD:
> > > > >         drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> > > > >         drivers/of/dynamic.c: * Return: OF_RECONFIG_CHANGE_REMOVE on device going from enabled to
> > > > >         drivers/of/dynamic.c: * disabled, OF_RECONFIG_CHANGE_ADD on device going from disabled to
> > > > >         drivers/of/dynamic.c:   return new_state ? OF_RECONFIG_CHANGE_ADD : OF_RECONFIG_CHANGE_REMOVE;
> > > > >         drivers/of/platform.c:  case OF_RECONFIG_CHANGE_ADD:
> > > > >         drivers/of/platform.c:  case OF_RECONFIG_CHANGE_REMOVE:
> > > > >         drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_ADD:
> > > > >         drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_REMOVE:
> > > > >         include/linux/of.h:     OF_RECONFIG_CHANGE_ADD,
> > > > >         include/linux/of.h:     OF_RECONFIG_CHANGE_REMOVE,
> > > >
> > > > Well, if some bus does handle the event, I guess it is a bug in the
> > > > subsystems that do not? Maybe Greg Kroah-Hartman can clarify the expected

Support for OF_RECONFIG_* events was added only to buses where users
had a need for it (spi, i2c, platform, weim) and to the GPIO subsystem
(for hogs).  More can be added...

> > > > behavior here? Maybe we are in transition phase here.
> > > Perhaps those other busses just do not have OF devices and so they never
> > > needed to add that functionality to them?
> > >
> > > If they do, then by all means add that code.  OF devices are not
> > > possible for many bus types, so there shouldn't be a need to add this to
> > > the driver core, right?
> >
> > UART devices are pretty common in both Beagle capes and MikroBUS. So I think
> > that will probably need to be added at some point.
>
> uarts are not a bus, they are a type of device that is implemented by
> many different bus drivers (pci, USB, etc.)

It depends...
https://elixir.bootlin.com/linux/v6.14.5/source/Documentation/devicetree/bindings/serial/serial.yaml#L90

It makes perfect sense to add support for OF_RECONFIG_* events to the
serial bus, so people can attach e.g. a bluetooth or GNSS device to a
serial header on their board (or even to a legacy serial port on a PC),
load a DT overlay, and enjoy a working device.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
