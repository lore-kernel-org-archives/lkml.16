Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73233074AF;
	Wed, 25 Jun 2025 19:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881539; cv=none; b=Ulnd/c3fjNV8qL6dAWKJHaFeXXWcfpZvscJ38Ypc0ZU0iorJBvU2Qu5zcKnrOZgSkdukuz0guPewZQ7TnXvBwQDgZeTrdZEVer0Eb0ae/xwLY+FhOwDO0Or1v1N6A3ePkGDhFn4vhl6P5tFBgY9MXxVtV8oCuS7BHXP6bsO9BDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881539; c=relaxed/simple;
	bh=/QqjKA1nb6MHEABcPVKqJW38bKn+uzRsO95qFrtWnas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnF08kkDPaHBLRcCn0LcQRkjjsXKy12lAR1MQYBtxTCIgZwk+K+ECFYMd7FbVikSY8bCdbCwPIEfR06lqKWJL0u+DVa2fg/xOQXs8EwqvfSKMSnIMffWEytJp0R0TsFUx0G7mh3M7oEQLkMYJNkTO89L+E2Lba0+Xrum6ykcb/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGQgAtxX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGQgAtxX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECD4C4CEEA;
	Wed, 25 Jun 2025 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881539;
	bh=/QqjKA1nb6MHEABcPVKqJW38bKn+uzRsO95qFrtWnas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGQgAtxXVdUaq5D0XGTFjnPhGxs89C40PEYlONinnaK/PlHyPtgQw+SphbOjV6l5Y
	 LtU0X9Ds5KNGuHEmrBl5oFTrd6u+WP9tPCaNV5Q5nZ49L4sFN1aVZm6D+JZzsuG5Ui
	 /X0Y5k1fQhzEXcCN/1HUKyQD7/JtcTJjQE8YzgCQ6meTb7mFjRltPQU2TcmJxCppb8
	 3cDpmgvTzR4s3D8cv005uy5QVF8kFdcC30+2tv7w9YK/klqlVJfImpQLR8t4bdguRQ
	 qQ0+iFxS3WuUXqIIl61zM1V5SORd0Eho1ue8Bocpu1kGmBCSgKX7Xpbw3FjtQ3fvWN
	 hZsIowV/uZm4Q==
Date: Wed, 25 Jun 2025 14:58:58 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20250625195858.GA2115486-robh@kernel.org>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-culpable-roman-295df1360198@spud>

On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..e8093a558c4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV18XX/SG200X SoC top system controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > +  register access to configure related modules.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,cv1800b-top-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +patternProperties:
> > +  "dma-router@[0-9a-f]+$":
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> 
> I think you're supposed to add "unevaluatedProperties: false" to each of
> these nodes.

Not necessary if the referenced schema has 
unevaluatedProperties/additionalProperties set to false. The tools check 
for this.

Rob
