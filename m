Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FE61C861D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477596; cv=none; b=CwJASr3N4zEddIMdDLUWOeAxT6SQ2XWSoVJ7SM9wqEZt1LIsS94RWN+XjqLMcg5GcRUNUGCwVaRaDtWlSf8CDNyJltkRsDR2Y5gwYE09n0h6KKIDXsjt2GG/m6m1IIjSoY8gOxTTDL5JNcyWDPv7bjTUdi7Yd6cusqdEbwqf7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477596; c=relaxed/simple;
	bh=eXsbeYaStEdVkB/9iiuPPvCcb0GJ33j+Y7Lm4GpCn+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jc2n3BPH0EBVVUgA8e4yJsQ4RKRGmJ77KSGKWwh9fbsmjUb61meu2vCYFqSAmhedJJnN8IDK8JzNoYc8WRjyQ1V19b0DXpf0D0E2SXqf3PNAZtyMxQgJCnwC1iR3WtOXJTplR4JUz+Yzu8qi9syQo6gO/yhYra9UUfyQuLmcZc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QLd/vkHu; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QLd/vkHu"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace98258d4dso700081366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746477592; x=1747082392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=QLd/vkHuh1aYpsrxFJeG5L2oIdxl7BRm5QD8CjbIETy3pd5/CPEXvUyvLLz2EI2hy0
         2IcebbvCpV9YKZcMSngKbGuWsdgevZ9+IpqN9ZhnLCOC3WryxRp5D1vocG2keeyNibcH
         FDOFHqUqLYBVLTKEGwyCW4jNhYD8zVimhVS5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746477592; x=1747082392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=pOq3CPSilUFX565zaILVkoGzOQ+gZQUcUwB6rdnWim61zzoKLT1k5W2TEjJdrC1oC8
         NVKiIe1Ebzt0kg6chWbBLC28/B02JbIp07regXcxL9Y9rOxpWIoZ6TiTLC23qk5d0TC5
         KiU6iZPTyK+E8dgR5gfbwRxK6W0+LDfL/sTyOfjU97mNc6uxCbAcOdxzTSamp5WVNMuh
         FTmC9i+QxA/ZB/qc28UMomUha7JtVbv6tdzMSTgiRcehYWFutPBDSmMf0u2/kXNixvtm
         XwxUrKL1rUt8D9DUJmlcdWEeQHmtpqSaS3Z2akMvIif5pORlihgPayUO12ohrgoxpTuS
         TdWg==
X-Forwarded-Encrypted: i=1; AJvYcCXTpXjf4CQzVx4LN18fxFoqNnjtDAhpxPHTnGQPtfqup+8OsTHb0HRYAKQEGiVOGJvK63YZxWqSYQIntjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVtINog2bbS0Ouz6fsHY156A3kTD6gol21blChBslakGjbzQw/
	fmC0mhmUhqAZVNXg1/dymaTs+xQVkdJTgJlFeMrEK23d+aqMpO+e9IwvZGjdZArTPFWLJxZQ1e7
	Fzg==
X-Gm-Gg: ASbGncvFmsJNLKGt3eVqe8fl3zWam3u/Cn4ZZNP/Omtjg6jeM5K0yiFTRn/IFhAE9Xr
	+Js1ibe9Yah2hCqr3HQCDom4h2nIQ0D08bSLrmJXNqTrgvyrvPRLMI3TMEu6rwevsk7c4BBJUVg
	rcuE+ytBCLHS1+yd2/ePB8gjS41b6qgSZghiDg/JaGLLGbIsJdRD1JwPYU5BjBbqC3wTUZPT8+x
	Hvwd26/xxuOb5jndsNH2lG0d3mHvmhNOBpXYiOy1/fniEc5nNB72tpqrbaJfBhq9gdwn8ny4/qu
	qFBgp0YkWKEr4xPJHN/+z92kSkJ10sgJAmg4l/RcZAMtOiyaQRyuqv3XRpi67he3Zzk3fghBKW9
	S02U=
X-Google-Smtp-Source: AGHT+IHl/FZXDoHnUsjvWf5v+cz03Vn3tNCqpV7L3ukwATnQcTtZ8TUhQ7xOgWbnZFH5DaLel1wtXA==
X-Received: by 2002:a17:907:d087:b0:acb:b0d7:15d8 with SMTP id a640c23a62f3a-ad1d46dd5b2mr29989066b.51.1746477592227;
        Mon, 05 May 2025 13:39:52 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a733csm549446266b.73.2025.05.05.13.39.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 13:39:52 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so905429066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZWyvjstD6USix3t8WKQl6ql2YWsLcwFgCpmgvlTN3gPAdWt7NkHLOxisUEFNpeT9JZUuNB8ld8/xhWNI=@vger.kernel.org
X-Received: by 2002:a05:651c:b2a:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-3266b59789emr751721fa.10.1746477268328; Mon, 05 May 2025
 13:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org> <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
 <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
 <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com> <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
In-Reply-To: <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 May 2025 22:34:16 +0200
X-Gmail-Original-Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
X-Gm-Features: ATxdqUEg2rUAsN7TYo98ElSvRXDzyBQACXaWg80nr6xGofF6c5WfqBKJm9vPYRM
Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

On Tue, 22 Apr 2025 at 11:41, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Hans, Ricardo,
>
> On Tue, Apr 22, 2025 at 10:44:41AM +0200, Hans de Goede wrote:
> > Hi Ricardo,
> >
> > On 22-Apr-25 2:23 AM, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > > On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrot=
e:
> > >>
> > >> Hi Ricardo,
> > >>
> > >> Thanks for the patch.
> > >>
> > >> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> > >>> This patch modifies v4l2_fwnode_device_parse() to support ACPI devi=
ces.
> > >>>
> > >>> We initially add support only for orientation via the ACPI _PLD met=
hod.
> > >>>
> > >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>> ---
> > >>>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++=
++++++++----
> > >>>  1 file changed, 52 insertions(+), 6 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/=
v4l2-core/v4l2-fwnode.c
> > >>> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1=
c96f2a5ede3fa9d64dab3 100644
> > >>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> @@ -15,6 +15,7 @@
> > >>>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > >>>   */
> > >>>  #include <linux/acpi.h>
> > >>> +#include <acpi/acpi_bus.h>
> > >>>  #include <linux/kernel.h>
> > >>>  #include <linux/mm.h>
> > >>>  #include <linux/module.h>
> > >>> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwn=
ode_handle *fwnode,
> > >>>  }
> > >>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> > >>>
> > >>> -int v4l2_fwnode_device_parse(struct device *dev,
> > >>> -                          struct v4l2_fwnode_device_properties *pr=
ops)
> > >>> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > >>> +                                      struct v4l2_fwnode_device_pr=
operties *props)
> > >>> +{
> > >>> +     struct acpi_pld_info *pld;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld=
)) {
> > >>> +             dev_dbg(dev, "acpi _PLD call failed\n");
> > >>> +             return 0;
> > >>> +     }
> > >>
> > >> You could have software nodes in an ACPI system as well as DT-aligne=
d
> > >> properties. They're not the primary means to convey this information=
 still.
> > >>
> > >> How about returning e.g. -ENODATA here if _PLD doesn't exist for the=
 device
> > >> and then proceeding to parse properties as in DT?
> > >
> > > Do you mean that there can be devices with ACPI handles that can also
> > > have DT properties?
> >
> > Yes it is possible to embed DT properties in ACPI, but I don't
> > think that is really applicable here.
>
> This is determined by
> Documentation/firmware-guide/acpi/DSD-properties-rules.rst . So rotation
> and orientation shouldn't come from _DSD properties on ACPI systems.

Doesn't this contradict what DisCo does?


if (!fwnode_property_present(adev_fwnode, "rotation")) {
struct acpi_pld_info *pld;

if (acpi_get_physical_device_location(handle, &pld)) {
swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_ROTATION)] =3D
PROPERTY_ENTRY_U32("rotation",
   pld->rotation * 45U);
kfree(pld);
}
}

It seems to first check for the rotation property, and then check _DSD.

If I send a v2, shall I also replace DisCo even if that means
reverting its logic?


>
> >
> > But we also have secondary software-fwnodes which are used
> > extensively on x86 to set device-properties on devices by
> > platform code to deal with ACPI tables sometimes having
> > incomplete information.
> >
> > For example atm _PLD is already being parsed in:
> >
> > drivers/media/pci/intel/ipu-bridge.c and that is then used to add
> > a standard "orientation" device-property on the sensor device.
> >
> > This is actually something which I guess we can drop once your
> > patches are in, since those should then do the same in a more
> > generic manner.
>
> DisCo for Imaging support currently also digs this information from _PDL
> (see init_crs_csi2_swnodes() in drivers/acpi/mipi-disco-img.c), but this
> is only done if a _CRS CSI-2 descriptor is present. It could also be done
> for devices with the IPU Windows specific ACPI objects and it would be a
> natural location for handing quirks -- there are some
> unrelated Dell DSDT quirks already.
>
> >
> > > What shall we do if _PLD contradicts the DT property? What takes prec=
edence?
> >
> > As for priorities, at east for rotation it seems that we are going
> > to need some quirks, I already have a few Dell laptops where it seems
> > that the sensor is upside down and parsing the rotation field in
> > the IPU6 specific SSDB ACPI package does not yield a 180=C2=B0 rotation=
,
> > so we are going to need some quirks.
> >
> > I expect these quirks to live in the bridge code, while your helper
> > will be called from sensor drivers, so in order to allow quirks to
> > override things, I think that first the "orientation" device-property
> > should be checked (which the ACPI glue code we have can set before
> > the sensor driver binds) and only then should _PLD be checked.
> >
> > IOW _PLD should be seen as the fallback, because ACPI tables are
> > often a copy and paste job so it can very well contain wrong info
> > copy-pasted from some example ACPI code or from another hw model.
>
> Unfortunately that does happen. :-(
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda
