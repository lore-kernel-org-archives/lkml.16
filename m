Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738CB2F5E;
	Sat,  1 Feb 2025 05:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738387636; cv=none; b=mHFA4ar9JmHy4WVKNVHGriWx4Oa3SdsmBvRVctA+S04jYNazYNgsLsfEbUKHp9iTeY93QiUzW6PF99AryeMzNWZ9b5y/jArrAMWMqGMPt92lTQ9pLk5HrEfSiWzgqu8XUqUKr/NsBdP1hDDAw2e3bVAGCgf321XQxydTLMxTkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738387636; c=relaxed/simple;
	bh=DgmuRhc7kbOR6yTf3oMbAEk3V8/dAh+V4NZULu3LncU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=joQ5u8499iPxJ793PVg76zOQWYo3CJdnrw/UCYofxlMQJolw7glo5eKRIwTg3TecjmPXC3uQJ5pGA+wi1DWaKZYqQ9gOo0PmqZVS82LOiM+xO48yDEADwmLlc4obrj7hQdgz8yberIkURm7c3KD2/TYyT66Pl6WpgvWfVqq9AaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkUDyv4u; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkUDyv4u"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e5aef3523f9so51336276.3;
        Fri, 31 Jan 2025 21:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738387633; x=1738992433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emzT1Kp7AzEwfFxKgwUWQ/uqx4Iw5IKg65hav48u4j4=;
        b=ZkUDyv4uzxxJjd3rNYSBrCbx6vzgEmxVlWF10t0xmMuxFajcFluXymEKLnWHzisCC6
         r/p/J4Bzbmd1tCTnLx9HyMV6/lYyHBNUA8wa1pxGpFbkb1+4rMBOb63iwW3gOjbR4MJ+
         Dx55iraDLbmcJhdMkc6ks4G1YxdYAHMGA0d6VVUZLIeCyqWkCVH/w8jd2nLC5jjnvwAe
         s526hGL8rltE3iUv7tEAUJ0SDYyV7zKJF0gIu6t43u5IPtKZfXCY08J1pXh3AqhP0T5h
         YgzFLT9o7I5r8arA7i+Zy9fTPqjmvfgD9aJuEh4VkdYfLI5g6Em9cgKeafVaFuqSmOgv
         U7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738387633; x=1738992433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emzT1Kp7AzEwfFxKgwUWQ/uqx4Iw5IKg65hav48u4j4=;
        b=vySB8fEqKf0PNslCuncWF9M8GRNzcFsFxO53LMPFy3wf3yQMR4HPbmSbJkjr768xe2
         N2LFhT84LO/cnZTqN880ukX5C/jsaXFK+QubVIvp/rkTxnDyf5KxTOEVO+PkKbZZkggq
         08LZoEuaKYcx1Qn/h8BTE/ycMw25r+LCWUASwCJUdGa3oKXmx2D/iBkGhUacHezgN631
         sm5DhoaFCAnid0YwOm8HvnY97vPiF3B7zyXoodKGTLl5Ob9HLUPcFONmwnDwJg4APlR3
         vbpYmsCQGRNwTOHlk0kF7CXowtcMvZ+S0rmyD8goidfSsWKOIgHx3YNANWGXiGHoUNdc
         7qSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtkzJM4bNCPzZo2+xN2vbmCaKjzbKGsk3XwhR18ra4z0fEBI2nyaGbQJ3psjSpUz+uQNujYDusINBT@vger.kernel.org
X-Gm-Message-State: AOJu0YzZx+N0+ORtUQjlTfq1iMo5YtsjFcdjYtg9EX3BiuqvHquXce2U
	c55YiSPTtwAVScXs7R5blyjjt5QJ2c0eE2OBZ/PkWDGehBwAwXy+UGhBtI4jbYQT38gRz5Gq6FL
	4HHUh/N5XW2RFL1Ao24worY28UhQ=
X-Gm-Gg: ASbGncuoE7p/x5YMHYunV1j0MUEKSot1qn8Fy+yVUiCGPm5JlFdS/wvVJAsST3J1Usf
	cmQ9cYFt53gWTCpL2ca5JIPJ6wbugJWHbNQ9/yv6Cngu+UGckQT415/LybUkH22GWFAUTguwTcx
	JQqMkCeV+gzyWY6tzshSE0ZoPiNJAB
X-Google-Smtp-Source: AGHT+IHsLPn+ZYUGj1al8pEm+g4HaWDEXW779heuQ0gvXB1oMVyKWHxqfJUAVVx0BNYF61JMajYUGle1gWdPn6wD4gE=
X-Received: by 2002:a05:6902:18c9:b0:e57:5f47:220e with SMTP id
 3f1490d57ef6-e58a4acefcemr10789790276.11.1738387633189; Fri, 31 Jan 2025
 21:27:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131064354.4163579-1-kikuchan98@gmail.com>
 <20250131064354.4163579-2-kikuchan98@gmail.com> <20250131-whispering-ermine-of-wealth-d3d88c@krzk-bin>
In-Reply-To: <20250131-whispering-ermine-of-wealth-d3d88c@krzk-bin>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Sat, 1 Feb 2025 14:27:02 +0900
X-Gm-Features: AWEUYZmlC20fbFyF1NFI_utnTK3XdirCuJ97-yb3PuYVg8ICYPoatoThGkURPoo
Message-ID: <CAG40kxH8URoL655=2N3+PAjCGV8Dun7hNyDv=0Wpd1MSQYttGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add generic MIPI-DSI/DPI panels
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

Thank you for your feedback.

On Fri, Jan 31, 2025 at 4:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jan 31, 2025 at 03:43:53PM +0900, Hironori KIKUCHI wrote:
> > This is a binding for generic MIPI-DSI/DPI panels that require
> > initialization with a simple command sequence before use.
> >
> > Although the `panel-simple` binding exists for generic panels, it is no=
t
> > suitable for panels that require initialization via their communication
> > bus, as such panels cannot be considered "simple".
> >
> > While many dedicated bindings exist for such panels, the generic panels
> > are not complex enough to warrant a dedicated binding because they only
> > require a "simple" initialization before use.
>
> All hardware warrants a dedicated binding. I don't get from where did
> you take such rule that you can skip actual hardware specific aspects.
>
> >
> > This binding addresses that gap.
> >
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >  .../bindings/display/panel/panel-mipi.yaml    | 244 ++++++++++++++++++
> >  1 file changed, 244 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/pan=
el-mipi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> > new file mode 100644
> > index 00000000000..681614333d8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> > @@ -0,0 +1,244 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-mipi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic MIPI-DSI/DPI Panels Requiring Initialization
> > +
> > +maintainers:
> > +  - Hironori KIKUCHI <kikuchan98@gmail.com>
> > +
> > +description:
> > +  This is a binding for generic MIPI-DSI/DPI panels that require
> > +  initialization with a simple command sequence before use.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - panel-mipi-dsi
> > +          - panel-mipi-dpi-spi
>
> Missing device specific compatibles.
>
> > +      - items:
> > +          - {}
> > +          - enum:
> > +              - panel-mipi-dsi
> > +              - panel-mipi-dpi-spi
> > +
> > +  reg:
> > +    description: DSI / SPI channel used by that screen
> > +    maxItems: 1
> > +
> > +  power-supply: true
> > +
> > +  io-supply:
> > +    description: I/O system regulator.
> > +      No need to set if this is the same as polwer-supply.
> > +
> > +  dc-gpios:
> > +    maxItems: 1
> > +    description: Controller data/command selection (D/CX) in 4-line SP=
I mode.
> > +      If not set, the controller is in 3-line SPI mode.
> > +      Disallowed for DSI.
> > +
> > +  width-mm: true
> > +  height-mm: true
> > +  panel-timing: true
> > +  display-timings: true
> > +
> > +  reset-delay:
> > +    description: Delay (in ms) after the reset command
>
> So use proper unit suffixes. Everywhere.
>
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  init-delay:
> > +    description: Delay (in ms) for sending the initial command sequenc=
e
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  sleep-delay:
> > +    description: Delay (in ms) after the sleep command
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  backlight-delay:
> > +    description: Delay (in ms) for enabling the backlight
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  port: true
> > +  reset-gpios: true
> > +  rotation: true
> > +
> > +  backlight: true
> > +
> > +  init-sequence:
> > +    description: Encoded initial command sequence.
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +
> > +  firmware-name:
> > +    maxItems: 1
> > +
> > +  dsi-mode-video:
> > +    description: Enable MIPI_DSI_MODE_VIDEO.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-burst:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_BURST.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-sync-pulse:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_SYNC_PULSE.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-auto-vert:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_AUTO_VERT.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-hse:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_HSE.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-no-hfp:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HFP.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-no-hbp:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HBP.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-no-hsa:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HSA.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-vsync-flush:
> > +    description: Enable MIPI_DSI_MODE_VSYNC_FLUSH.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-no-eot-packet:
> > +    description: Enable MIPI_DSI_MODE_NO_EOT_PACKET.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-clock-non-continuous:
> > +    description: Enable MIPI_DSI_CLOCK_NON_CONTINUOUS.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-lpm:
> > +    description: Enable MIPI_DSI_MODE_LPM.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-hs-pkt-end-aligned:
>
> All this must be deduced from the compatible which makes this binding
> redundant.  This binding is a no-go for me for obvious reasons: is not
> specific and you try to bypass the exact rule of bindings to be specific
> about hardware.

Ok, I'll delete these redundant properties, and deduce from the compatible.

>
> > +    description: Enable MIPI_DSI_HS_PKT_END_ALIGNED.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - panel-mipi-dpi-spi
> > +    then:
> > +      # SPI mode
> > +      $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +      properties:
> > +        dsi-mode-video: false
> > +        dsi-mode-video-burst: false
> > +        dsi-mode-video-sync-pulse: false
> > +        dsi-mode-video-auto-vert: false
> > +        dsi-mode-video-hse: false
> > +        dsi-mode-video-no-hfp: false
> > +        dsi-mode-video-no-hbp: false
> > +        dsi-mode-video-no-hsa: false
> > +        dsi-mode-vsync-flush: false
> > +        dsi-mode-no-eot-packet: false
> > +        dsi-clock-non-continuous: false
> > +        dsi-mode-lpm: false
> > +        dsi-hs-pkt-end-aligned: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - panel-mipi-dsi
> > +    then:
> > +      # DSI mode
> > +      properties:
> > +        dc-gpios: false
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@0 {
> > +            compatible =3D "vendor,some-panel", "panel-mipi-dsi";
>
> Undocumented compatible.
>
> Best regards,
> Krzysztof
>

Regards,
kikuchan.
