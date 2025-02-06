Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0CE1F416D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857196; cv=none; b=JBAmn5Ply3iysKIH3BHqNQ5DaItPYg3A19X10NEd/wqfHdfgQiTbxi9OEt8QeDclT6LL8nbb6Aa3O69i3UaZWez+35fkEO4zbmgiqkN8oVaw1weatB60ah9lFoGQ+SfL+8rOm8+ls+VoSZ24fgKUHsoRLcFuE/pT/YFl7dU3fro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857196; c=relaxed/simple;
	bh=G0+4gHfoHpexNr7egTrMeyzu2XAKFcF5lA1JG6mWO0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2C6sOZa7isoGp/krFY8xarHLaPcxm0blzlMH84+jRomrZMadlWAUWPwXkPQs90NG26MxSbG2ymqjVt8u58Z1zlr53iBD816/PPdch2wriUWIFjvRwNAmhHe5wAvS5eTEV4Wf2Inq17KOAY5Mn9/GyUwLg8rfqFP1OAEzs2YXhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=C5AywYWB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="C5AywYWB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2165448243fso27514535ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738857194; x=1739461994; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=44CBlstICEoDfNsqXMKX1ZM0Vyw2oohU1OJv4L8OWmM=;
        b=C5AywYWBr5U7TcV3Bess/Ddc81ivkLWNuSxtLq1vGLpWzTHRw7f8MOmCVBk1ydsM/I
         vFy1pFQcbpSeNkzvanrcjsekJgbMLinq0WaGIwag/emMlx0bvirk36pMvE51pG8VMsC2
         ej/PLWhr5KRk9AQYr/Wv0nWXftgQ3rUTPvn5mthGPP6658wBLTFXWPDFb2iPz9aTqtI+
         tttRG3oKmPqj1hiuGseu5I9JuBVEuOn4aBfwHvaU819MgOt2PdAGL2XX1Eq3GaFOygLU
         eEeH2WgOMnDx9CkRVMDGTCSkC9lTwtIAMleVzSE/9CyCpx2J6xLTILLMRvMPPkC3tTHl
         jtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857194; x=1739461994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44CBlstICEoDfNsqXMKX1ZM0Vyw2oohU1OJv4L8OWmM=;
        b=JCl7fw/EAZ2PJwT5x4/Pm/WAhUyoSIWs0phv9XgxmeA9LVl35Z4WI9C7Hec+cYeqtA
         dqpd62OOhV103EHAuuYMq5z98PrRgttnAEq3u0D6BYNSd6W6STyobhNxerue0XqDuPi3
         vmt2ZrUjmv+ojNql13vUTD4/ttlkTNQkQPD4pTZToDYDWqod/TQ1k6eESmqwlTbwZC2z
         bseuY6OUn5eumo1qiiQXhzgcjAnOw1LKtl+Hc5RJ9EnklgdWmkKvUlLkBHmHx6/Aw8NQ
         JNbkZSX5lnIfYl9yyBRuyYlpjmgl77RhG5rJWoiLytAavKBFlApym0sMP8nsrcWm+Qc9
         bROw==
X-Forwarded-Encrypted: i=1; AJvYcCUv7xGarFLBPTw+J85rF7SJTKLIRPziXnskQl87831cTibksgfM5hiHw2TxBdVf/pg/SZz5AaY9SB1lx2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCe3RS5lxdS6F1qokTuTKg3Y56Kl4NZJqyChYcRue5rw24rCoY
	vfWK7ycTrVULRBkFh7IshFhjmPpXWK6kEQM0YIiXZbWS5QaOt23NRZqr5PqArT3mxhQkiQlmdxa
	dcxWQCPyUCSObjTDiqXcu/AsTGkCU9Y6Cu0siGw==
X-Gm-Gg: ASbGncujCgDoTjSoqNeMpCRMz+fB5oI/4XG5XogiG+MJYBnEgQcNowVra15bfCZNK8U
	O5XVxNRhcFquxdepAqBdjJjOKXkoz+0wI1qT/XNWTmrNcifz/uamqUFZsV5+UBbA2WTKEhn9t
X-Google-Smtp-Source: AGHT+IEIk4sMS7wpGpYZqR8dP/iGnda26suYR568bnUwxaDwBwynzuwK8Y/KsMxTB5sMPOwEMRlV7ZjwLuGUpDQHj7o=
X-Received: by 2002:a17:902:cccc:b0:21f:164d:93fe with SMTP id
 d9443c01a7336-21f17eeb2b8mr132300495ad.53.1738857194183; Thu, 06 Feb 2025
 07:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
 <20250204-mulled-evaluate-8a690cdfbd4d@spud> <CABqG17jHKfwJEfZxto_YA4opS8=QwqTqfNdkku8kcEv2_iW+XA@mail.gmail.com>
 <20250205-purge-debating-21273d3b0f40@spud>
In-Reply-To: <20250205-purge-debating-21273d3b0f40@spud>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Thu, 6 Feb 2025 21:23:03 +0530
X-Gm-Features: AWEUYZkAKhXGMKy7DR6fQH0nL7Ht2cwBrY4vis0FiW-K6mVUZy62FPhpGq6RejE
Message-ID: <CABqG17j4tKXnMZ5=vcjBvfe6JwCLQ6NbkQmJC9ySK_bmGEv=iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, broonie@kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Thu, 6 Feb 2025 at 01:43, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Feb 05, 2025 at 03:51:25PM +0530, Naresh Solanki wrote:
> > On Wed, 5 Feb 2025 at 00:52, Conor Dooley <conor@kernel.org> wrote:
> > > On Tue, Feb 04, 2025 at 11:33:03PM +0530, Naresh Solanki wrote:
> > > > Move dt binding under hwmon/pmbus & align accordingly.
> > > >
> > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > ---
> > > >  .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++++
> > > >  .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
> > > >  2 files changed, 61 insertions(+), 45 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
> > > > new file mode 100644
> > > > index 000000000000..e1f683846a54
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
> > > > @@ -0,0 +1,61 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,ir38060.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Infineon Buck Regulators with PMBUS interfaces
> > > > +
> > > > +maintainers:
> > > > +  - Not Me.
> > >
> > > How the hell did this get merged!
> > >
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - infineon,ir38060
> > > > +      - infineon,ir38064
> > > > +      - infineon,ir38164
> > > > +      - infineon,ir38263
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  regulators:
> > > > +    type: object
> > > > +    description:
> > > > +      list of regulators provided by this controller.
> > >
> > > Can you explain why this change is justified? Your commit message is
> > > explaining what you're doing but not why it's okay to do.
>
> > This is based on other similar dt-bindings under hwmon/pmbus.
>
> Okay, but what I am looking for is an explanation of why it is okay to
> change the node from
>
> | regulator@34 {
> |   compatible = "infineon,ir38060";
> |   reg = <0x34>;
> |
> |   regulator-min-microvolt = <437500>;
> |   regulator-max-microvolt = <1387500>;
> | };
As I have understood the driver, this isn't supported.
>
> to
>
> | regulator@34 {
> |     compatible = "infineon,ir38060";
> |     reg = <0x34>;
> |
> |     regulators {
> |         vout {
> |             regulator-name = "p5v_aux";
> |             regulator-min-microvolt = <437500>;
> |             regulator-max-microvolt = <1387500>;
> |         };
> |     };
Above is the typical approach in other pmbus dt bindings.
Even pmbus driver expects this approach.
>
> ?
>
> Will the driver handle both of these identically? Is backwards
> compatibility with the old format maintained? Was the original format
> wrong and does not work? Why is a list of regulators needed when the
> device only provides one?
Driver doesn't support both.
Based on the pmbus driver original format was wrong.
pmbus driver looks for a regulator node to start with.

Reference:
https://github.com/torvalds/linux/blob/master/drivers/hwmon/pmbus/pmbus.h#L515

Regards,
Naresh
>
> Cheers,
> Conor.
>
> > > > +    properties:
> > > > +      vout:
> > > > +        $ref: /schemas/regulator/regulator.yaml#
> > > > +        type: object
> > > > +
> > > > +        unevaluatedProperties: false
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +
> > > > +unevaluatedProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    i2c {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        regulator@34 {
> > > > +            compatible = "infineon,ir38060";
> > > > +            reg = <0x34>;
> > > > +
> > > > +            regulators {
> > > > +                vout {
> > > > +                    regulator-name = "p5v_aux";
> > > > +                    regulator-min-microvolt = <437500>;
> > > > +                    regulator-max-microvolt = <1387500>;
> > > > +                };
> > > > +            };
> > > > +        };
> > > > +    };
> > > > diff --git a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> > > > deleted file mode 100644
> > > > index e6ffbc2a2298..000000000000
> > > > --- a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> > > > +++ /dev/null
> > > > @@ -1,45 +0,0 @@
> > > > -# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > -%YAML 1.2
> > > > ----
> > > > -$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
> > > > -$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > -
> > > > -title: Infineon Buck Regulators with PMBUS interfaces
> > > > -
> > > > -maintainers:
> > > > -  - Not Me.
> > > > -
> > > > -allOf:
> > > > -  - $ref: regulator.yaml#
> > > > -
> > > > -properties:
> > > > -  compatible:
> > > > -    enum:
> > > > -      - infineon,ir38060
> > > > -      - infineon,ir38064
> > > > -      - infineon,ir38164
> > > > -      - infineon,ir38263
> > > > -
> > > > -  reg:
> > > > -    maxItems: 1
> > > > -
> > > > -required:
> > > > -  - compatible
> > > > -  - reg
> > > > -
> > > > -unevaluatedProperties: false
> > > > -
> > > > -examples:
> > > > -  - |
> > > > -    i2c {
> > > > -      #address-cells = <1>;
> > > > -      #size-cells = <0>;
> > > > -
> > > > -      regulator@34 {
> > > > -        compatible = "infineon,ir38060";
> > > > -        reg = <0x34>;
> > > > -
> > > > -        regulator-min-microvolt = <437500>;
> > > > -        regulator-max-microvolt = <1387500>;
> > > > -      };
> > > > -    };
> > > >
> > > > base-commit: bfbb730c4255e1965d202f48e7aa71baa9a7c65b
> > > > --
> > > > 2.42.0
> > > >
