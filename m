Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28D7175D50;
	Tue, 11 Feb 2025 05:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739252169; cv=none; b=RuhzUnvjnG9/pgA6eV5eXZCK6Lpzvqjg5uBWTStjph7vxuNnL10LanL3S3j1mHW8gs7UBPGHIc7PWh44lrhwh+RGfPMKkYdwU/kpFlbpZ/usI8qUqWSE7Hp4my5nDGLTins4jYZvDXqYCcmiLLsE6qaIcuL+wk1Q81jaUxIn+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739252169; c=relaxed/simple;
	bh=FN1LucoCbTc7+M/GZvEt8vYIt4uB2BvVXHfxWPX4kZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljT17t6bHn6NWsRYqI3xR1lNhkg+z2fdjkrmSyLedgoIsD9rCU99t5R1uAS1LsmUBWcSP6CU9nRZ6Q2M051UWRtLn5E6y4o8plWWIfOj2rJ1S6DqMxb/RL0O7vyTiLn05OKCbMqyQ0gVnieoyxA8Pz4Ov4mLg6PXNiCcaWFUe9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=v8o7fNGv; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=wqmG01jJ; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="v8o7fNGv";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="wqmG01jJ"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 587C0122FE5F;
	Mon, 10 Feb 2025 21:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739250974; bh=FN1LucoCbTc7+M/GZvEt8vYIt4uB2BvVXHfxWPX4kZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v8o7fNGv9Zaqha8RjVEqM2IWywdriu0mBx/IFCCmVvQ+XrXKWq0X3iCVceMimuqUf
	 TfZufiZOGt132Vr8T/nriOX8TofSCX5B5QHgZktU1FO9qw3pcoKyhPSQ/X0R9esjCF
	 80DuaBEGuBOoL7lJOnZkPuRUEZ/m2Jeyzcg11Xjr8kvasaKIw6GdS7tpEuye8i0GAS
	 KoUKFrcQfsfF1N6O4BR/ro2VruVxRmwQ2JApif6bbLFE16zpO2Y6vlAxLCRxHexBO5
	 K4PtHDf0gmxcJ4UVzr34w4LBinIKcmab03rz5WiYUHNXFturTOqgcSR61kltnOLozl
	 bCfNAFiZLJoYg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnxHnOhZCS-n; Mon, 10 Feb 2025 21:16:02 -0800 (PST)
Received: from ketchup (unknown [183.217.81.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id E462B122FE21;
	Mon, 10 Feb 2025 21:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739250962; bh=FN1LucoCbTc7+M/GZvEt8vYIt4uB2BvVXHfxWPX4kZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wqmG01jJ/0yHHWdc2qUdEnH9Nf0yqDio3fPcsdKuOJhiU9PxYqqAqbQ0EDykmbUpc
	 ccwdVTqENqhHUrANZ03HIhXtQ5a6nokJvCx1rHiNg570K4qf2FSWQwd9g4I6sLTX2q
	 X7NaJV/j2bctiyTq4HvmI+4xgzrIzOg47c5IcFn5h9K64Mvhha+78666Wx0/K3P67+
	 UVcTw9DfIz7hLtifrY2ThA4K6cnKt0Y/Pk7bZ5KTWAwTNc1ZbdbSvzmLNwasiLUvjb
	 ZnB6zsK5PwZGXNyWdvHds9ZKvxSdnabk/HiMRWvMmJuhU0oMKvfUYOn1RKRpX5Xusf
	 L0Xy2FKm6LJ5A==
Date: Tue, 11 Feb 2025 05:15:50 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <Z6rdBhQ7s2ReOgBL@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
 <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>

On Sat, Jan 04, 2025 at 11:07:58AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 09:56:35PM +0000, Haylen Chu wrote:
> > Add documentation to describe Spacemit K1 system controller registers.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > new file mode 100644
> > index 000000000000..79c4a74ff30e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Spacemit K1 SoC System Controller
> > +
> > +maintainers:
> > +  - Haylen Chu <heylenay@4d2.org>
> > +
> > +description:
> > +  The Spacemit K1 SoC system controller provides access to shared register files
> > +  for related SoC modules, such as clock controller and reset controller.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - spacemit,k1-apbc-syscon
> > +          - spacemit,k1-apbs-syscon
> > +          - spacemit,k1-apmu-syscon
> > +          - spacemit,k1-mpmu-syscon
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clock-controller:
> > +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> > +    type: object
> 
> So now we see the full picture and it leads to questions.
> 
> 1. Why spacemit,k1-apbc-syscon with spacemit,k1-ccu-apmu child is a
> correct combination?
> 
> 2. Why having this split in the first place? Please confirm that clock
> controller is really, really a separate device and its child in
> datasheet. IOW, fake child for your Linux is a no-go. Fake child while
> devices are independent is another no-go.

These syscons are introduced because the clock controllers share
registers with reset controllers. Folding them into the parents results
in devicetree nodes act as both reset and clock controllers, like what
has been done for Rockchip SoCs. Such folding isn't practical for the
MPMU region either, since watchdog and other misc bits (e.g. PLL lock
status) locates in it.

If you're more comfortable with reset and clock controllers folded
together and eliminating most of these syscons, I'm willing to make the
change.

> Actual answer for 1+2 above would be to fold the child into parent,
> assuming clock controller split is fake in terms of datasheet.
> 
> If it is real device, then allOf:if:then: narrowing the compatibles of
> child might not be worth the complexity.
> 
> 3. Why using different naming, look:
> 
> spacemit,k1-XXXX-syscon
> spacemit,k1-ccu-XXXX

I didn't consider about consistency when naming them. Talked to Yixun,
I'll unify them as spacemit,k1-syscon-* and spacemit,k1-ccu-*, keeping
synchronized with other K1 peripherals.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Haylen Chu
