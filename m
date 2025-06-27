Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6C12F1FE1;
	Fri, 27 Jun 2025 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750989184; cv=none; b=O83dODerIQI20oizG6Z4TedMxeOsIl1eddHx0kMRSRksfAZstkf2rPjzdf37S9MbVpmECkHY23CHrNlx5QAfKBve7dnMZECqUC+yEZqSAJAXVi1VQGHeum5hwL4BVcHOuXo1zXfc9v2Mvp3pDQTs/flk0R0d6V9G4jMfl9I5vIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750989184; c=relaxed/simple;
	bh=O5XFQLvGMv9kDFTYtz6e9bjeFb7odw6E3EhLd0Z5xQA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bpgRGb8SaeNZ6+P33OIn3WG7F+sdhNJ4kcdHsheKPovrg7jSCXFW/Efd4q9hpIC/avwA76q95B0ZpxTcOwvJyHm3xY6pQdIf4QaP6/RWW9mEOYvJCZEeI+rAumCcurCiqceAv+ULFTjGnKJkG0VhfRO7ykyOcQnpITPg+8Xr06U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=LIFew9Pn; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="LIFew9Pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750989179;
	bh=O5XFQLvGMv9kDFTYtz6e9bjeFb7odw6E3EhLd0Z5xQA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LIFew9Pnb2MSiK1ccfZ5i3NSd3zNvworwa5dRBa6r1MGEszTmWLFFBu0kNoTHOQhQ
	 SKd1t4BTH/6zAAsUNtA+JXnzgmR4C4W9lQ+sYcWpI9Q+v6K+jQKG4oBdL5Ijf9Yq4v
	 ri/R6bSB7EOg58uQDErUI4MOMeJHInSnqB+0Ps+uZbWNlkwMQ6awtu6mKzGGqLkECQ
	 T4A11Q4hOxPW2eFGJnRnF0duUWqbITF4C/H+JsdZ7huh0tUv4JwOqvlk8oWiVlOn1d
	 Py5nt7hy42IpoLmRJ8m5rD7LU7hvb/hTWGNeM5W3HJ7xOr6WOAex7IeoTgvKnitUrT
	 Ey6uNEAjklLaw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A87186449F;
	Fri, 27 Jun 2025 09:52:57 +0800 (AWST)
Message-ID: <9efb52255ee55c6300f97c067d8cec606dab0574.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 27 Jun 2025 11:22:56 +0930
In-Reply-To: <20250625155007.GA1489062-robh@kernel.org>
References: <20250625073417.2395037-1-jammy_huang@aspeedtech.com>
	 <20250625073417.2395037-2-jammy_huang@aspeedtech.com>
	 <20250625155007.GA1489062-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-25 at 10:50 -0500, Rob Herring wrote:
> On Wed, Jun 25, 2025 at 03:34:16PM +0800, Jammy Huang wrote:
> > Introduce the mailbox module for AST27XX series SoC, which is responsib=
le
> > for interchanging messages between asymmetric processors.
> >=20
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>=20

*snip*

> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: aspeed,ast2700-mailbox
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Contains the base addresses and sizes o=
f the mailbox controller. 1st one
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is for TX control register; 2nd one is =
for RX control register.
>=20
> Instead, just:
>=20
> items:
> =C2=A0 - description: TX control register
> =C2=A0 - description: RX control register

Maybe also specify reg-names with "tx" and "rx"? That way we can use
devm_platform_ioremap_resource_byname() in the linux driver
implementation, which should look tidier.

Andrew
