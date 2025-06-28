Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7E23DE;
	Sat, 28 Jun 2025 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751100223; cv=none; b=YAJNoLt/HrsGhycD+y40bLwLukZna6nY3H0PTGbLRbsXM+2YyYFmBM/+82JaWCBpZ2gdDKDBulWOSQ6GdOiBJoJ86FGVzA88KQmQUts5Ld8IfzWRz3ZgcwzGd8wzVYtB1J2Q5e6+SPLsCN99fuCZ+/HoZj3Ttt05/p6Vy0aF0V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751100223; c=relaxed/simple;
	bh=2Yhg2EDAhv8zXnryNZ8+WmoQhMBpv71AIS9tGm4BeX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/R93k9YWrqcHSwJ3j1pvcxybv8IbUOXemSak1oSQUS/0qmZwmvRHRQ4KeKaLjChkawyY/nTIt6Nn3kV15gAz1WC+UuG8hv/nq958Z7xyDxNcn9ERKkacLl3ioQF0klYeb66PVplJ/TT3weFlPNVoZkBkneoYiA6fX9GOKWABsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/79V9FJ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/79V9FJ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af6a315b491so712552a12.1;
        Sat, 28 Jun 2025 01:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751100222; x=1751705022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy7TEL91BqkyjG4VnW5FClmC8uUXfEkPzrAe3TbCioI=;
        b=L/79V9FJts0XZErMa1yMD1vStzlkTF7VuZPNd1rPVwTJVLZVFOdS5H5ebTN82Bf+Zf
         IngOLasx5dE3DMbx+j2SL8IeVXCDsB/J+ujzQREe+Y+lVP4I251ZAKhhUf7wQ90Dq6oH
         CVw1PgUSUg9EiREhhKZnKp7OloDhH11qY30YjvwnfhR9223AAu6aGX1mvJzYQIu6zJol
         RGTcR+krcn0KTJkuQsDle5hkaszye/jAsl3HrBiZNCNa03CUNHRSfgxBknVAWmbYsq68
         g6aG5oc/H4dSDIlOQzF1NNh1Wig76ziko4Exs7IIxXZHaGwrDSC4NaaiRPu9iX/UcIdA
         ofog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751100222; x=1751705022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy7TEL91BqkyjG4VnW5FClmC8uUXfEkPzrAe3TbCioI=;
        b=t4CVHUKXs+tpOpBmNa2Cd+RyfEIGX0YqgbbRT/VdWjffGzqVVkqOJxmkmU+ej7uDYY
         oxiLnXVM5AR5oNB/0n8tVHR++l7ah6zxrvIqTslVfIh0n0C/8Q0leW6yT8Fwz75/vycg
         qjU1Ckx4jmjK+1rPKx/3WGrsans0FRsNBAKADghzSt9t1BoRuDf8oWa4aTlY8Dhyjdvz
         0SDxSt1gmgoe8RwxRPDemKVfTvkJKKhVqdEyrJoe18UyQMau+Ix27S/SEC4HBN4Wr/xr
         SlT6Ux5DpJq4CrXT/2rWEkuiK9zOsMeMmjiklDNQVa6rNoNXZDNr9kIEBQTjweTf9qNU
         JRbw==
X-Forwarded-Encrypted: i=1; AJvYcCULdDk5ti+Pr21sUHK2KZX+Nl4dG5hXlFRTJDLjyiQaOuS3kRRyNoMcjemjG1e+R7ccs7fOe6u6GSz4oGI=@vger.kernel.org, AJvYcCUf99Sr3QBkfrvnNGrMUNOaq8ZMAilaGdo2IoKvzWn22DAISAP0ynH1HzPT9SeRI2xi99xjimBdBTbVti6N@vger.kernel.org, AJvYcCWxvfcEOUp5Acg2UcOWzlqmWAM6Dc3j3BQGQmDFpaOKywB9Oap3d6oXffq3rW/6flX6w6RvcfY2HKDX@vger.kernel.org, AJvYcCXyOmjUQiZge299eDrrohR/P/LBR1jo9cEJfABH4/GiFdcEXBVL7D2H24EFwWQsp7vYL93y0qJwWbmd@vger.kernel.org
X-Gm-Message-State: AOJu0YxW40n99q1VbFAR29r3dp0GeKfKOS8EbJkUMaoY8gkoTjhSzms8
	iQ52duFJzlUdI+ovVdjEcqZop9Wu7q0AYKTRMaqt2pI6nsIGtRaP/XwP4sFzm1zbGwkSDNcewmK
	4kx2VN12g7c+2tv5x+UR28a3AGgN1rXk=
X-Gm-Gg: ASbGncucVS4CEZ5exTApVA/6ukRQ0o8lWadTNoL5/i7PQYBY7A0hnz035ZHlfeBkp4R
	Oo2fGfqDC8q8xD0YBPyN1KmsFFHlH5sSI/ILJjLJqULIJodlRgpTKBb3S6bdKRUAnxFdHRHyjgP
	A3GoLE06z0FmaLw2zO6qf35pSo/q60Z1UBPdX1ud2JS48mNnO2hqgRWEFz0nqvBIRjR+f0odUcZ
	aHPNDIQmZ7/TYsZ
X-Google-Smtp-Source: AGHT+IFKlwm6XGn++8Zmma+OVlEv79qu+lYvKQsC5hXOU2GGxy5e73OgJCj8yl2gSF2zX4UMeZOGTHopwxX5mwfyyAo=
X-Received: by 2002:a17:90b:224c:b0:311:f99e:7f4a with SMTP id
 98e67ed59e1d1-318c926451dmr7337383a91.26.1751100221531; Sat, 28 Jun 2025
 01:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626113351.52873-1-noltari@gmail.com> <20250626113351.52873-3-noltari@gmail.com>
 <20250627213454.GA179652-robh@kernel.org>
In-Reply-To: <20250627213454.GA179652-robh@kernel.org>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sat, 28 Jun 2025 10:43:05 +0200
X-Gm-Features: Ac12FXyB5spcQT9l77Ao7kgk6V-2QwXerVK2aE6vHymxZPfo25cAnEbofL-HkQQ
Message-ID: <CAKR-sGf01xtOF9dY9yb2i67PV5FHHe3GGKk7ingjTOOfqWA5FA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: Add Microchip EMC2101 support
To: Rob Herring <robh@kernel.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

El vie, 27 jun 2025 a las 23:34, Rob Herring (<robh@kernel.org>) escribi=C3=
=B3:
>
> On Thu, Jun 26, 2025 at 01:33:50PM +0200, =C3=81lvaro Fern=C3=A1ndez Roja=
s wrote:
> > Introduce yaml schema for Microchip emc2101 pwm fan controller with
> > temperature monitoring.
> >
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > ---
> >  .../bindings/hwmon/microchip,emc2101.yaml     | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,e=
mc2101.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2101.=
yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> > new file mode 100644
> > index 000000000000..e73f1f9d43f4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,emc2101.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip EMC2101 SMBus compliant PWM fan controller
> > +
> > +maintainers:
> > +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > +
> > +description:
> > +  Microchip EMC2101 pwm controller which supports up to 1 fan, 1 inter=
nal
> > +  temperature sensor, 1 external temperature sensor and an 8 entry loo=
k
> > +  up table to create a programmable temperature response.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microchip,emc2101
> > +      - microchip,emc2101-r
> > +
> > +  reg:
> > +    maxItems: 1
> > +
>
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
>
> What are these for? You don't have any child nodes.

EMC2101 can control a single fan, so I guess I should add the following her=
e:

  '#pwm-cells':
    const: 2
    description: |
      Number of cells in a PWM specifier.
      - cell 0: The PWM frequency
      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED

patternProperties:
  '^fan@0$':
    $ref: fan-common.yaml#
    unevaluatedProperties: false
    properties:
      reg:
        description:
          The fan number used to determine the associated PWM channel.
        maxItems: 1

    required:
      - reg

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        fan_controller: fan-controller@4c {
> > +            compatible =3D "microchip,emc2101";
> > +            reg =3D <0x4c>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;

And the following here:

            #pwm-cells =3D <2>;

            fan@0 {
                reg =3D <0x0>;
                pwms =3D <&fan_controller 5806 0>;
                #cooling-cells =3D <2>;
            };

Would that fix the issue?

> > +        };
> > +    };
> > +...
> > --
> > 2.39.5
> >

Best regards,
=C3=81lvaro.
