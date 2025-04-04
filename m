Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1311917D0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798690; cv=none; b=nde1wOkRHKUGCPEHBm64UoTqwXBYDYtmIIKA39KlQNhyVz5bYzSm9WYj8GbMc8P8FxkhQkxUlvz+Awk1ThUQDFQSAkBQMlBo6fOdyvFXok85rNcaoYLwZV2D8t7KzJtjKh3Vf97MPg8rm6c61/J/M9LBnesl5nGbnmCizz4xgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798690; c=relaxed/simple;
	bh=K+GdwcY2qpId+FVrrOCPmblpwWNGwzjXOxhMwE/cWk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XS3+9DW654ipMxupg+9j1lEzIsunWPkcBy/cjexm3K3y6X0mLnQeYEDK64PcIRbK7a3DOf4Y3mJTPsHAQoy0bQjFA7n3e9rXow0jMdObC734eUih+4fpk/r+jyneqHURiOQYImpBeLZ06uBFGcw9F0hVwsZW14h7jaQJc1nr4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BpegDKBt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BpegDKBt"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2575250e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743798687; x=1744403487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=BpegDKBtUvmMIDHI2V9LL1TsQ1ZgZBVYVrml0LwKEOeWFgCkvfneHAFe72JRNkpl5f
         jrOWwx2rCD3uP6675+OWJf5n2nKaafD6LBXVCRYNAjuz9Q7goakdJg7NSVGBg/nzcJZC
         0O3ogYgO+nXUwKzHGw8bIfxUEj5/BlEv337hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798687; x=1744403487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=KQBwCWA3Q6GPNkea/vf/+9uThgbC82p/GHaAK2VF9dAU/zKP2rF40Rb6RH3PoQXw9T
         yLXXw7P3ZqqEYkZStkmW3u5T+42KMj33SfxmMwb2gZ2ztjSxaeA3u2zREbsJnVws2dJm
         r0vKnms6c4GUDnig9m1/zBijTMmt+rfx3b0+Fh1W7DO6g1kEbiyuXiVAj87VousJHbIn
         zh8J8jBpmZdMt6ZJc3F/WXPvXTgBK/N09hNx7seY6dxZygtzMroXkrPygN0vuCMseR8X
         VPvpPhV4TlbVcSS+3tOgETp98yXLE3xt2P+u7ie0KP09jZ0ZKQhJbaAKiJljhPGCffFz
         1l4A==
X-Forwarded-Encrypted: i=1; AJvYcCXfuJj4wm+iTKJN/IyWOpApDQ4Nq56DB9muLv2BoOzJXGF3/y0OuokPCW70vydZYGXmfDiTjKWwrXtHs3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuYQDJgus3vt+3/GhEAH6nhup9rSYVWjpP92h0eXIFJfXxJlm
	fjUDgrm3OV7R1MVcPAgNb9gp/jSr/uFmCFoMq7gToa8IYZo4eE58kbl2zbOl3k4s75Ec4FXrvAQ
	=
X-Gm-Gg: ASbGncuk/Czzl4QkmvHXaDuK2ZkFZEAOUIgHst3FW6TXfzDncCi4pZ5N+1FIwOF32j+
	h2TN3qaIpAsoBMClWg9TvZd8PFwNsROtyrNs55QmgInaYLeQCBVW+tMNZvGxnV3HWVk/ufIQE/Z
	mwqJ/AZBSxshPni+YnUqgZPidHt2dwtHoNabE/JDjTLTtVsVdpxnTZ+rh3GaFiIAfplYHDGOmB2
	q5zzXx37mCUJW0ofBU/zOdh8MGe9Msitso7cibwTllN0GMSwT1MlzY/uRnFps5T8eRm53fTLZbZ
	3Z+K34JrgXFHF62prDSmHrXNuvtKktClgNoVyoomH9yzXHgfag4DNb6VQJWGI/bAzAZ8cFOae/r
	AU+7rYR0wq+o=
X-Google-Smtp-Source: AGHT+IGKdzUBwmAMpPernjMmjFYQzYHudtv3HcvPvBWPBUItQz/xVoYx012iySCy47qsRVRhqaEV3Q==
X-Received: by 2002:a05:6512:1149:b0:549:4ac4:a453 with SMTP id 2adb3069b0e04-54c232e2534mr1220043e87.21.1743798686698;
        Fri, 04 Apr 2025 13:31:26 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d5ebsm519143e87.176.2025.04.04.13.31.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:31:26 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bd21f887aso19567171fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:31:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWW2aSsWc/Hdb6Zfn5B9Z6OlxOK/XqfMGnjRiXB0Z1cOhrtZJa5GmbVcwn/jE+Cd4mvOrEpx2N2M/GR5jA=@vger.kernel.org
X-Received: by 2002:a05:651c:1581:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-30f0c064658mr16422321fa.33.1743798685456; Fri, 04 Apr 2025
 13:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org> <20250404193655.GA158858-robh@kernel.org>
In-Reply-To: <20250404193655.GA158858-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Apr 2025 22:31:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
X-Gm-Features: ATxdqUGWjyuS5jbxrI5_afZO8VPXlqKA2MK8tNbiaf5xCWtDa_Llt0RuBZ7yskM
Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: usb: usb-device: Add orientation
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob

On Fri, 4 Apr 2025 at 21:36, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Apr 03, 2025 at 07:16:16PM +0000, Ricardo Ribalda wrote:
> > For some devices, such as cameras, the OS needs to know where they are
> > mounted.
>
> Do you have a usecase that's not a camera?

I personally do not have other use cases, but I suspect that it could
be useful for more people.

The original proposal was more generic and "inspired" in _PLD:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

You suggested using the camera's orientation.


>
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar property for video-interface-devices called
> > orientation:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new property orientation for usb-devices that matches the already
> > existing orientation property of video-interface-devices.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6e71a11910c565b6f805470782e4f..bbcda28ec7d5695307efa797f57180044afda77f 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
>
> This is a binding for *all* USB devices. This property should only be
> added for devices where it makes sense.

Can you provide some examples of how I can do this?


>
> > @@ -42,6 +42,10 @@ properties:
> >        port to which this device is attached. The range is 1-255.
> >      maxItems: 1
> >
> > +  orientation:
> > +    description: If present, specifies the orientation of the usb device.
> > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
>
> Reference the schema from the top level and drop
> '/properties/orientation'.
>
> What about 'rotation'? Seems like you'd want that too.

At this moment I do not have a usecase for that. But sure, once I need
it I will add it the same way.

In the last thread I proposed Sakari to use:

+      image-sensor:
+        description: Video interface properties associated to USB cameras,
+          typically UVC compliant.
+        allOf:
+          - $ref: /schemas/media/video-interface-devices.yaml#
+

But he preferred to add orientation instead. Either ways work for me.


>
> > +
> >    "#address-cells":
> >      description: should be 1 for hub nodes with device nodes,
> >        should be 2 for device nodes with interface nodes.
> > @@ -101,6 +105,7 @@ examples:
> >          device@2 {
> >              compatible = "usb123,4567";
> >              reg = <2>;
> > +            orientation = <0>;
> >          };
> >
> >          device@3 {
> >
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >



-- 
Ricardo Ribalda
