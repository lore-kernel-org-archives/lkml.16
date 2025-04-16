Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5C4246333;
	Wed, 16 Apr 2025 06:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785656; cv=none; b=MdzMyVGczLSt8g9GaJcw93/nx3zwr/STl4Dp1JGQlawBCxiTTbb6T4nM32me0Kgxy5xjKaTnFD6XcI7Lt0hRmGPBVDc+d1nH2JIvoDz/q25Yx7VheMk4sK2UeNEcBRMBHtwylzAXJnyPbsaQu/uCNYappmTWuq0xIl+oTacCanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785656; c=relaxed/simple;
	bh=1h9y6FTZxarygP0TkXH/vv/4wCGRTme+kpfAOEkeAqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CH44pFtuhL/AbD2qxP9ao+8xnXyrjZUH5x8pQj4J0IUKDBX3ZfkjOUi4MFgcpBt7L8sxhxr7uymEA2D0T7VhLW10y7AV39LENS4cloGWVZ2+ke4eYE0OkgoNxrZmjpa6ySvTcjL75o+BsHKiZ4ivA857SKy8zzoaaezvAo8NDaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geyRaYrC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geyRaYrC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5127126f8f.2;
        Tue, 15 Apr 2025 23:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744785653; x=1745390453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEmFT6yWrmKehIQNMRlgRGvQtqeeYxSOMZxf9NCxgf8=;
        b=geyRaYrC+sXKut9Qm6lHy/h5vKDyswkznp2Y2EvQTXy+o++S1BDp3hQi5EVzU5PScO
         MCribfA5l5Jt/gln6xHiSX8VRhK2/p008u5eEm3ynenZ0+Q7/aD1gDIzRo3x+JZHRRZi
         g43nFyzpitYd2Y2EGoRt7WkJDVCCjMMFafg9BwrOydUWvLy5oMjwT++k+11zQ51qqNcx
         pC2yMrxcVxnzpfq02sBG5XQWcGTei3/rymfPfKwYJI8wm+qWAeZxYtvAXiBcxpD8ipFq
         YdkInsWZ5LfyUv4l+1OTMlUNmqXMhR2yRJ7mgL0u6fjdvONqHEdHb2pp5eMMk9psz1EB
         UD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744785653; x=1745390453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEmFT6yWrmKehIQNMRlgRGvQtqeeYxSOMZxf9NCxgf8=;
        b=t2atQwcKPNRBAdqkr6EcBj0Fllg1b658uXzwxb1XY8QYllmlI5o7zhxtMmn57TRI9A
         vj0KWlXcDF9Whi3zLUPASSE70ii9UNzrWl6d9ZuH8mgh+mxEmsdvNDWsSPVEnwa8sbuH
         5YAlko6yHUle66W/ngQrS9o5kGYVN9H1FKntMCeJl08uuT212WQMm0mFVw/4pUxqwLw4
         unH5DOHGcyLg9k+wYQiwNsu0N0XTajbksVcV1nyxGOBnEaAWWTJVA67n8ZOSItvh31lJ
         wP8flYHPL4xdwGCsWHghWVi73qlWsoFAKQarbloaCRYH5LdPlO2FLgsvlo7a8vhZ9gRU
         UZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHHagxSSbcbg6cq0+nuImY4YbDZ/1yACcuSDM+6/k55ueGitw3d8HNYUis31Ez3E47FkMHoOOtCPzs8X4m@vger.kernel.org, AJvYcCUY1AnAw/PtUi4ebs1UC8CMfAVLtlVTRFeMR+bJlkXKS/Q/UYD/TmitsCCw7A82xNGAjAYQeca63Ugy@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXEkB2e4Ykd/AU+TrW7dMPMI0zbvbKSC0ftSq39wjzVX3aCyV
	AOO98toQtlrLHJUNe3up4EhAqPB3sBeKE5t52OzhGfI+3/A86ISfMN5yFbjDkX1kW+XPHFSzpkQ
	9N3jFAszh8Z62iNoFuZhrverRJEgwvK+2
X-Gm-Gg: ASbGncvU7rKXFaURJuRh+WT+8NBXkUTaXT+paNye8+7iPdqtY1ey8a2fiIJP6dZ850e
	7c+91U0BaW7iNj/sKP7oD+R4SMIa/86yKlPPsIeikcuQRg9Gv9Uim82gXbDUqT6+Jmm5gULk36C
	ic1JVvEsigL0CwqT1+MNP+R20=
X-Google-Smtp-Source: AGHT+IG0GGjuLd2A2XpZtlHWtwnocPmbMlMmUK/NP5KwDhbBkAedNMcbby0dBOXrWK5djTbre5W/xlcioRBEZZNuSR4=
X-Received: by 2002:a05:6000:400d:b0:39c:13f5:dba0 with SMTP id
 ffacd0b85a97d-39ee5b16172mr618349f8f.13.1744785652710; Tue, 15 Apr 2025
 23:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413112401.12543-1-clamor95@gmail.com> <20250413112401.12543-2-clamor95@gmail.com>
 <20250415215521.GA885658-robh@kernel.org>
In-Reply-To: <20250415215521.GA885658-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 16 Apr 2025 09:40:41 +0300
X-Gm-Features: ATxdqUFN7UzyJuMMMzD1rwSyh7qBfatQVvF-TSiE9ixKB6cKNshecrhpPqTjrCQ
Message-ID: <CAPVz0n0qTUqt+JEy0R4-=jJLgVRcNwwe0k2jTd=hcLxSoAFG_g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: display: panel: Document Renesas
 R61307 based DSI panel
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 16 =D0=BA=D0=B2=D1=96=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Apr 13, 2025 at 02:23:58PM +0300, Svyatoslav Ryhel wrote:
> > R61307 is liquid crystal driver for high-definition amorphous silicon
> > (a-Si) panels and is ideal for tablets and smartphones.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/panel/renesas,r61307.yaml         | 93 +++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/ren=
esas,r61307.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r6=
1307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.=
yaml
> > new file mode 100644
> > index 000000000000..a98d2d2e02d2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.ya=
ml
> > @@ -0,0 +1,93 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R61307 based DSI Display Panel
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  The Renesas R61307 is a generic DSI Panel IC used to control LCD pan=
els.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +        # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
> > +      - hit,tx13d100vm0eaa
> > +      - koe,tx13d100vm0eaa
>
> Usuually when the display IC is known, there's a fallback compatible for
> it. Then 'renesas' vendor prefix on the properties makes more sense.
>

Acknowledged, thank you.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vcc-supply:
> > +    description: Regulator for main power supply.
> > +
> > +  iovcc-supply:
> > +    description: Regulator for 1.8V IO power supply.
> > +
> > +  backlight: true
> > +
> > +  renesas,gamma:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      0 - disabled
> > +      1-3 - gamma setting A presets
> > +    enum: [0, 1, 2, 3]
> > +
> > +  renesas,inversion:
> > +    type: boolean
> > +    description: switch between line and column inversion. The line
> > +      inversion is set by default.
>
> The property name is odd since there's always some sort of
> inversion. Perhaps renesas,column-inversion?
>

Acknowledged, thank you.

> > +
> > +  renesas,contrast:
> > +    type: boolean
> > +    description: digital contrast adjustment
>
> I would have expected contrast to be more than boolean. Is this
> something any a-Si panel would support or somehow Renesas specific?
>

ATM there is only one known set of commands regards digital contrast
adjustment and it application is optional, hence bool. However, panel
which my device uses refuses to work properly without this
configuration applied. Since there is no specific programming guide
regards this IC I cannot say for sure if this is panel specific or a
Renesas IC feature. When/if there will be any additional data
available this property can by adjusted or dropped.

> > +
> > +  reset-gpios: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - port
> > +  - backlight
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@1 {
> > +            compatible =3D "koe,tx13d100vm0eaa";
> > +            reg =3D <1>;
> > +
> > +            reset-gpios =3D <&gpio 176 GPIO_ACTIVE_LOW>;
> > +
> > +            renesas,gamma =3D <3>;
> > +            renesas,inversion;
> > +            renesas,contrast;
> > +
> > +            vcc-supply =3D <&vcc_3v0_lcd>;
> > +            iovcc-supply =3D <&iovcc_1v8_lcd>;
> > +
> > +            backlight =3D <&backlight>;
> > +
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint =3D <&dsi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.43.0
> >
