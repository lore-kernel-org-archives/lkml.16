Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8532E7191;
	Tue, 17 Jun 2025 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168635; cv=none; b=KSFxHuOu/Cl1PhR3M33FYEfsCi1odO8lBpCGzMMKQmtQYN+n0XQuA6sFG39zTCPqZuOnU0tztwpEbq6SPzZa/uyg9iKK8r8o5FIImj65DHWnyDgs1Vk6Vh7qHSmXD5zvAFVV3ZSNVOB00sSgUc4S4EGM56R67eMCFydAIxUmPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168635; c=relaxed/simple;
	bh=QIyts9Em1IWwq8uzNyeOdKW2vP4v3zlNFm6eHU9aFfg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeOPF0Od3FvzDSBMzg+Jg1wy3Qq9gXxciFbirmzGxnqP24/DDfJpKMv7g2Io2y1VoGTXUfoKP1067VXlYImci0VdI232qrqzoo6TojV5fMG1ZxSqznyI24ObWdLgudB6JSVV9zl+OJK4o3ravY7eSOmwUakFchsDY8DMlo3cJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORibqM2O; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORibqM2O"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso51775265e9.2;
        Tue, 17 Jun 2025 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750168631; x=1750773431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MLVT+cYxO1TN85rByTE2a8qXeCzOerjL8RN/K2Xqi5o=;
        b=ORibqM2OeCp1lfrB/lJpSSInaXVXVV1+L8bfY+4J1rEm3H2W2i1f5Xp7zyn+dXi/Li
         1QvWe4/N3i9x44Y7OT7gEIIsm6jOZMmPTpBKSHszAwO0ZP2+eHVNFg2qiSCh1mb800U3
         9cbSWMKH4cWWLd8zCHg30G0uggar7qcJhQio+RR5t8sTN5s0Gj6wULwGCosOMVIw3WZu
         XtNvBAuBb+Xzo7zRONLD4sxEyNOx8rDnNYFZHMD6qJNhruqycRFzOBEFZwcfoaFWW8EX
         lSw2Jp75SI6b6FGF3uRBZRHuE0kAYWVAUsx8RRMzeBFgtkG7CsHIPY0gWKSOqskueliW
         0D5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168631; x=1750773431;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLVT+cYxO1TN85rByTE2a8qXeCzOerjL8RN/K2Xqi5o=;
        b=sQsy62MQGV+2CTduoPLJeKVmdke+hZo3Dv8P3yyE2beuSH+NWu2zFRGXAWnaskkJQt
         I0KALjKGOkv6bK/JqLMMzC1mxMLUfPQUr+OxYzPe2CGZJI+u82NwydVUu5hn/qbsya+A
         dnbaVKWrWlgt9NqeztZoGrzlS3kI39U8jRwTKKol6cwhIhsW/ZMxBo/V1lT9xScAL4c/
         nazs0uqYwbTdrvlWVO4Hp4/IkfzVRlZaUcoNEEP3GdSo6VBo32UuDyZ/sWlKa6BhYKaw
         y35qfVzclHhMWoZ1FnxZcbxUECpSMwPGHSCgA/svS1DgC+ziit0dDFGNfw+XDL1AcXQ/
         17ow==
X-Forwarded-Encrypted: i=1; AJvYcCU+L7Sl3HoSRgtlE2ojpCdPD2d0OSIIObOuuUeIJHoazBYl31xSVh4Dgc6/xVGnnJWkkEgYrLrZm/KXITFI@vger.kernel.org, AJvYcCWD7EGXQy8NdEW1vmiOlyICPrJIw2JzLTRN9FArKU8ryQD2UvBIqmnCsQE4hRJP4Iva6uJakcfZrMGj@vger.kernel.org
X-Gm-Message-State: AOJu0YzIiBkGuGwd1Va/zqCV7WRW5JtNIoykO1O1GfpJUYJrKKTcZsrE
	2gJzmkgLl38aP6TPU1a2VkmauSTjkHHjor5eDePg5jcYZsUdRPRZPD8L
X-Gm-Gg: ASbGncty7XSVhydFiSzRT2lyTdDpghbxX/MBcWC1CTum1kA02zAiGhGkba43MXUZofy
	mOWzBlLpPCQrvwicbB3QgLCLZgnRiaGkC0H+wflGixXXREztPGdqu8HQspgKeW99IHzATFlA49H
	eMLXo5LnK8jYnoNDMQBXz4Pq3wXmdqhLTf0f4O7LhA5iBjd/RdbvoR8IyKJOGws7rZkczdL6ja0
	P+XquyqYUVmARso8xd8Dd9bBCWwknGx8DCvXHBN57P71UlvMTGW56c5wqtWgQKcRVIxSOy5xWdY
	nOimedP2ZrVvG2U7cGqyl/D/a+8XETOOcvvYNt6fVw2NwOZlZEl9bocyPA8JaUb5srXyF/Ya6Fs
	/JinkgcZwWkbFSbfn0g==
X-Google-Smtp-Source: AGHT+IFupVL+5wJXaUwaE5jmuyF6KpQ+tb0Z1hbP1TUoIU6loKaMX3a5/2xSpFf4oTiPjYqFm2EuOw==
X-Received: by 2002:a05:600c:1e1d:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4533ca7518dmr144413055e9.13.1750168631359;
        Tue, 17 Jun 2025 06:57:11 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e09c21esm175766615e9.17.2025.06.17.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:57:10 -0700 (PDT)
Message-ID: <68517436.050a0220.b9e1c.ed09@mx.google.com>
X-Google-Original-Message-ID: <aFF0NWK5v5oTQKLj@Ansuel-XPS.>
Date: Tue, 17 Jun 2025 15:57:09 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: airoha: Document support for
 AN7583 PCIe PHY
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
 <20250606192208.26465-4-ansuelsmth@gmail.com>
 <20250609-shifty-dingbat-31aa70d7d7b1@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-shifty-dingbat-31aa70d7d7b1@spud>

On Mon, Jun 09, 2025 at 05:51:10PM +0100, Conor Dooley wrote:
> On Fri, Jun 06, 2025 at 09:22:04PM +0200, Christian Marangi wrote:
> > Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> > work. Add the rwquired register to configure the PCIe PHY and provide an
> > example for it.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> > new file mode 100644
> > index 000000000000..93252092c2e3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7583 PCI-Express PHY
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description:
> > +  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7583-pcie-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: PCIE G3 analog base address
> > +      - description: PCIE G3 PMA base address
> > +      - description: PCIE QPhy analog base address
> > +      - description: PCIE QPhy PMA base address
> > +      - description: PCIE QPhy diagnostic base address
> > +      - description: PCIE detection time base address
> > +      - description: PCIE Rx AEQ base address
> > +
> > +  reg-names:
> > +    items:
> > +      - const: g3-ana
> > +      - const: g3-pma
> > +      - const: qp-ana
> > +      - const: qp-pma
> > +      - const: qp-dig
> > +      - const: xr-dtime
> > +      - const: rx-aeq
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        phy@11e80000 {
> > +            compatible = "airoha,an7583-pcie-phy";
> > +            #phy-cells = <0>;
> > +            reg = <0x0 0x1fc7f000 0x0 0xfff>,
> > +                  <0x0 0x1fc7e000 0x0 0xfff>,
> > +                  <0x0 0x1fa5f000 0x0 0xff>,
> > +                  <0x0 0x1fa5e000 0x0 0x8ff>,
> > +                  <0x0 0x1fa5a000 0x0 0x3ff>,
> > +                  <0x0 0x1fc30044 0x0 0x4>,
> > +                  <0x0 0x1fc35030 0x0 0x4>;
> 
> Can you explain please why you have so many reg regions, some of which
> are directly beside one another? Why is one (or more) larger region(s)
> not viable here? Are some of these coming from a syscon that is not
> modelled or are there other devices sharing in between?
>

It's to keep consistency with the documentation and how stuff is
modelled in the SDK driver. The single region defined reflect real
register space. In the middle they are invalid register that might cause
system stall if read/written.

Also this is to keep consistency with the en7581 pcie phy driver.

Is it really that bad ? :(

> > +            reg-names = "g3-ana", "g3-pma",
> > +                        "qp-ana", "qp-pma", "qp-dig",
> > +                        "xr-dtime", "rx-aeq";
> > +        };
> > +    };
> > -- 
> > 2.48.1
> > 



-- 
	Ansuel
