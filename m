Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9255DF58;
	Sun,  2 Feb 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738490182; cv=none; b=TcCcDFphAFJFYErWKXr1DUYh7JtWP/RU4lLaKezwNxc9CbLgXQLiWbo0qnXHvqTqSEg7xKnlHJLTYHEtq3eDjLVHwB0izrVuktE9ooI28aXLUIb4kk6Wo/PjKHS1mqsVVdvITXlWco5AEA47za6JXaD1fVhoPNcDbquf56x5XK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738490182; c=relaxed/simple;
	bh=6g64UpUzwYIf7Rd36kw73lEBmTgRffCJoWWngczo0H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mA6vTkyHOhawZaXv+sMFZ0kG82ItTH8moG9kx6V0wBwmqyFO7BTyaoRavpHGGFiB2CBflaUbQ40g9NTwAOueaYt4Ukl5Sb5ECpwxTN0KIgc6Hu4dd6Yk1D/Z3FAGxnXIA5Uk9eUkIfRCIYAmlI21Z+ixfoqxM9jH8ZZ1L+YJB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6jIF1J6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6jIF1J6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385de9f789cso2584674f8f.2;
        Sun, 02 Feb 2025 01:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738490179; x=1739094979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ieNuIIPzVWLZMXOFdlK3olUaAK8OK9i96qegW/onpbc=;
        b=i6jIF1J6BkcxLwukNTat+9gsjXIkZcaCX08YaRTRNXBqA2oXxUPsck28/+OUc9IBHO
         bF3irs1woor+OydFbSY1pcMrR1fNLACwO3URSB8Ve23Y/IvRGnuXkJDQFTiddm4TETS+
         RaDlmpIxxXaIYYDbCMf469VMO4UNFCIh7Cr20Yn3jWB74eocp/tmnDXh2jlTyFhKQU0p
         G41kYfNEOAIg73MAtgWLKCH86aa6/qGjj/xZ6D021bXHWFlQzYVl73K5k+ei04D+e7jd
         WCkXl9muHux+v/5Oa5jtPcrMW06DaPOI18YUIjmQ5lcBf2R1N7il+EO2RGw9vkQFQsQA
         M4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738490179; x=1739094979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieNuIIPzVWLZMXOFdlK3olUaAK8OK9i96qegW/onpbc=;
        b=ppJX6h6dJrddGHB5wG2qyRCGd5Dn/aav8A8rh8zPxuAwHP7yV7a+H6yuhS9IlAqzG6
         2SWI5ejYsAdASZl3FUni7NN3LxVFYpwmsgisWXP5BHqgsMHzLj0lzBvhgOx9TCI3zpDo
         TFYSHSB1g91nOJRg/DDciL1M+ZwD6FXYYPT+m0qNnpVSw1avYe7yFlpp8Gf13ZgVJcYM
         tFvbZTrfNDIka4Bw6ih0IL7Ne96tnqEP5HWv0xDuwZrfhxJi1riJZDZHdLpmIRxP5zDu
         6+OKRGJtPoKQRcU+JUiNtQcXbU/651Vrt5sWTV8y9yv8xO91mfMFRR5aYsn2qJBvEv1B
         l/tA==
X-Forwarded-Encrypted: i=1; AJvYcCUjGFwRTiE3+HiXCBgsyQahRSss3LCrCAx7Hibwpn1oNQMckWC5aIADOsyLJPrbECWp9BCIyY/y1M9hkyh6@vger.kernel.org, AJvYcCVFsYLrD39sZblxU15LlxOJ6H8w+MjmbkJiUNMJrtaVVjls8IvqQZCBsy60GOw5/WoeJHNGQ9VnI22E@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIWPtYQGhTPbqi0MWkFDTgZI4pqj/FxxPpnu+WwNP4Ncz0ZBV
	Fk/NQW45+ehI77O2waI3wslsE9MNL3QUl+J7FPu/lnHHBzFxwZqNku73dw==
X-Gm-Gg: ASbGncska1/isi1KrznhBamCp368Ahbbr2CjT0jxUfn4PXdkkLJIHfuvH3h2ZEShM6D
	GXQEcAmLsBG3zyfHB3JTt5pbxm3Mt32iMOYF/EpXlSQxMAGGNKzeS4Urx4lE8EtIlDbR9iAirTO
	QlGuSLBem4lVhQXAl/xMxgnSqRP6/8aoVIbAG29D6wiV4t2x/U9l6aYv2EGYww0wFDvuAEsHEj1
	qG/b3IlsfzM71ly2GiZPGCZuiIzBXgaprp8ofwRSsRew9YWUah6Z3N/DDkOvu8cspydBnhyEGTq
	/UcjK3eRYOOqhA1xwyg+FB/kRIhvzaaLfK8iFz4pRynoViaftPu7nas=
X-Google-Smtp-Source: AGHT+IH2N1UXUlNgMRrYCmzawu/nQG2XG9SVLFZtSnjOQ26z/EDkDV1CClmIxuiGxX0hc4lqLvfR3w==
X-Received: by 2002:a05:6000:1365:b0:38a:888c:a727 with SMTP id ffacd0b85a97d-38c5195dd2amr12639405f8f.25.1738490178665;
        Sun, 02 Feb 2025 01:56:18 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e6bf8sm114132475e9.23.2025.02.02.01.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 01:56:18 -0800 (PST)
Date: Sun, 2 Feb 2025 10:56:16 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Message-ID: <Z59BQB_cBgTDm4ie@standask-GA-A55M-S2HP>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>

On Fri, Jan 31, 2025 at 07:13:49PM +0100, Artur Weber wrote:
> Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
> TXT to YAML format. This patch does not change any functionality;
> the bindings remain the same.
> 
> The bindings have been split into two parts: the MFD binding and
> a separate binding for the regulator node, to simplify the addition
> of other models later (which have different regulators).
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

[snip]

> +  regulators:
> +    type: object
> +    description: Container node for regulators.
> +    $ref: ../regulator/brcm,bcm59056.yaml

Use the full path, so /schemas/regulator/brcm,bcm59056.yaml#
The description seems unnecessary, you can drop it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: bcm59056@8 {

Node names should be generic. And drop unused label.
Should just look like this:
	pmic@8 {

> +            compatible = "brcm,bcm59056";
> +            reg = <0x08>;
> +            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;

#include <dt-bindings/interrupt-controller/irq.h> ?
V2 seems to have it, not sure why you dropped this.

> +
> +            regulators {
> +                rfldo_reg: rfldo {

Unused label, drop.

> +                    regulator-min-microvolt = <1200000>;
> +                    regulator-max-microvolt = <3300000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM59056 Power Management IC regulators
> +
> +description: |
> +  This is a part of device tree bindings for the BCM590XX family of power
> +  management ICs.

This doesn't really say anything. Also AFAIK these are only part of BCM59056,
not the entire BCM590XX family.
Maybe say here something like:
"The BCM59056 PMIC integrates X regulators, their valid names are
 lorem, ipsum, etc.
> +
> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
> +  additional information and example.
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +# The valid regulator node names for BCM59056 are:
> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
> +#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
> +#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
> +#   vbus

This should probably be a part of the description, not just a comment.
Could be argued to drop it since it's also described below in
patternProperties, but this is easier to read, so IMO would be better to keep.

Regards,
Stanislav
