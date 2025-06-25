Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78F2B9A5;
	Wed, 25 Jun 2025 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750811299; cv=none; b=Cd4jSz0zvKa7CjlWulrOlmqg/AV5i4fbB7SHLwSanUMtPD6XlphHgg/f4T6vWRGKWMcrBvvEgCOIJn0aF45XjT3wgU2m7LUNJsrD2T9PJfIZSO8h350rN0Ae/GBcCwT+y5cFofXSGmvbr1osZSRpZsgHuG9zLQogDCGLa6NKm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750811299; c=relaxed/simple;
	bh=9Uj4nfGZq5m7cD0qyg2Mz1aKH9prRuM0UoVhM5TzRwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SkG3cMsHknFQf3Hp9hwG6aDcp7FSzTAHIo2rLhiaxTUIa+zWwlchIPnMVYSsw0iI+fa4G19LByz/bxBlxTDate97SrIPBblKaPAhJmCzXlACoTZ3Pgd2dqfVTu9NL9pI6Z8UEe3qFkCdU8+6vOPnTJpBgmQJsF/Aji+U/y/4+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=e37NC5Jg; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="e37NC5Jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750811285;
	bh=9Uj4nfGZq5m7cD0qyg2Mz1aKH9prRuM0UoVhM5TzRwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e37NC5JgqCB3oXE3YtFABqL935nsxqzLUVyCNYc9KDFiin+d3m3mtW9mm8+7qSt6w
	 I6FsN0fa8AfAQugRXHBrFzYLHu4DDB7stdQVluFSBW+3GizWWMfbdtrLwZKuxrt7Mf
	 hTVAkUylLeqi/9sodDfzAxtzc+HoIOPZEUmuzNeArDxxfz+mpXKS5IYg0vZKPe1Zdr
	 jBdIsH+Dsl43VhBC166MJH+YLgO3a3KDjiQRijzUN8iKCwqc9P5Z+UWfNWRl6KmZds
	 LzSSrX4rkeOWr4biV8oBIH3jKeo1ZquGvCSwDJd6jk05YjuoRd+o012YC0a7Q10SL0
	 QviUFvs/cAyYw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6D791640A1;
	Wed, 25 Jun 2025 08:28:04 +0800 (AWST)
Message-ID: <0ba565ac9444503be954161a8d79fa0476bd78a0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 25 Jun 2025 09:58:03 +0930
In-Reply-To: <20250623024456.2068370-2-jammy_huang@aspeedtech.com>
References: <20250623024456.2068370-1-jammy_huang@aspeedtech.com>
	 <20250623024456.2068370-2-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-23 at 10:44 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0.../mailbox/aspeed,ast2700-mailbox.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 57 +++++++++++++++++++
> =C2=A01 file changed, 57 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed=
,ast2700-mailbox.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbo=
x.yaml
> new file mode 100644
> index 000000000000..9c5d7028e116
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.ya=
ml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/aspeed,ast2700-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 mailbox controller
> +
> +maintainers:
> +=C2=A0 - Jammy Huang <jammy_huang@aspeedtech.com>
> +
> +description:
> +=C2=A0 ASPEED AST2700 has multiple processors that need to communicate w=
ith each
> +=C2=A0 other. The mailbox controller provides a way for these processors=
 to send
> +=C2=A0 messages to each other. It is a hardware-based inter-processor co=
mmunication
> +=C2=A0 mechanism that allows processors to send and receive messages thr=
ough
> +=C2=A0 dedicated channels.
> +=C2=A0 The mailbox's tx/rx are independent, meaning that one processor c=
an send a
> +=C2=A0 message while another processor is receiving a message simultaneo=
usly.
> +=C2=A0 There are 4 channels available for both tx and rx operations. Eac=
h channel
> +=C2=A0 has a FIFO buffer that can hold messages of a fixed size (32 byte=
s in this
> +=C2=A0 case).
> +=C2=A0 The mailbox controller also supports interrupt generation, allowi=
ng
> +=C2=A0 processors to notify each other when a message is available or wh=
en an event
> +=C2=A0 occurs.
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 const: aspeed,ast2700-mailbox
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 "#mbox-cells":
> +=C2=A0=C2=A0=C2=A0 const: 1
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - interrupts
> +=C2=A0 - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +=C2=A0=C2=A0=C2=A0 mailbox@12c1c200 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "aspeed,ast270=
0-mailbox";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x12c1c200 0x200>;

I realise this is just an example, but with respect to the datasheet,
shouldn't this be sized as 0x100?

Otherwise,

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
