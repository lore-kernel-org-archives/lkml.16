Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A47E142E73;
	Thu, 12 Jun 2025 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712162; cv=none; b=IiHq44m/Wed2qAw6OaASar88OkvHPzxeua3qCV61/MnHI8Ku62gs5EWNeIYun84vZ6pyijfpnH3MISsoRBke+yLhC8fZcT4bonBeQuSVprnkgeDV7ttQnmr54UK1C3CEgkPNkVKsR1V3aD9J9oCAqhqpn/W1Nxyyo7NAjHkVPE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712162; c=relaxed/simple;
	bh=luE0SzdQUHqB2dRlRfXU4UX21FqI9tQ4K6OmW4aikh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuQSmqGxwp3YebHXqBf3k/ynM4UNW9LBaLyqNdw2hRDLkIsYfbMCTtA7/jXQ9EEEiFWFJqIwQhNQWJGN6IWdSONxQericZQ6JXezlhMlgZcImCBvJ2/rQrh5x6TMU/xzxffXkBviiYprNUS7VWDRnuK8mjJG/JFoFbD0x4/Jqfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/J/5gga; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/J/5gga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97455C4CEEA;
	Thu, 12 Jun 2025 07:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749712162;
	bh=luE0SzdQUHqB2dRlRfXU4UX21FqI9tQ4K6OmW4aikh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/J/5ggaPb3rUTEWlLXI9E9YzuinzYrIXIpAzNWlY9l8Ngm7yOAcjKFp/Q70yZzuY
	 YaZnZqStAfMkX3j9J0zFeBXh5kIVSrw2k4aX3ybaS/csV6tOUXhFSiaRBKzJC3yCsP
	 H+Wgo9Z6V+F5DPizqIKqHbOFJVFVxWK31BUsI4LmGfY+zo2aXJgpvHp86lAeWDgFZH
	 i38aGITlb6n1MIqH49bHCBqlhVMlrqLsk4CdZLpi0HISS/IJymx34m+ycGG05l5faQ
	 HHP3XHDJzR98ryL1N1NZNvfWNtRBCJNANIoCQyKufWbIYRO2hbHy4xpGrTyimVMCTX
	 FTImXwmsLT59A==
Date: Thu, 12 Jun 2025 09:09:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: boerge.struempfel@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: imx8mp: Add Ultratronik
 Ultra-MACH SBC
Message-ID: <20250612-snobbish-outrageous-nyala-dca804@kuoka>
References: <20250611113039.304742-1-goran.radni@gmail.com>
 <20250611113039.304742-3-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250611113039.304742-3-goran.radni@gmail.com>

On Wed, Jun 11, 2025 at 01:30:37PM GMT, Goran Ra=C4=91enovi=C4=87 wrote:
> Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.
>=20
> This board is manufactured by Ultratronik GmbH and uses the compatible
> string "ux,imx8mp-ultra-mach-sbc".
>=20
> Signed-off-by: Goran Ra=C4=91enovi=C4=87 <goran.radni@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index d3b5e6923e41..132a6f39b59a 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1232,6 +1232,12 @@ properties:
>            - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX=
8MP TQMa8MPQL SOM
>            - const: fsl,imx8mp
> =20
> +      - description: Ultratronik SBC i.MX8MP based boards
> +        items:
> +          - enum:

Nothing improved... got actually worse, because you never tested it.

  ^
  |
Look here. This is '+' means you added it. My previous comment was that
it should be part of previous enum. If you add enum, then it is not part
of previous, right?

Best regards,
Krzysztof

