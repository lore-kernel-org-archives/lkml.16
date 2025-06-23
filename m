Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083C2874EC;
	Mon, 23 Jun 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694216; cv=none; b=u/LGxENEf65qhkfhn14IRYgRd+aVTRH6R7WOLvEbZrO0tF/dAQ7NcArVQVv85+P74pXq68CSrz+k+viFKq24Q3xdfwj1aiIE7aeH+Bk36UIUPQNEmN43ZlyCU+p/y9TcF345humQfDJLF5ridus14UGp2CdO5MxNJQ1AaX9Uk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694216; c=relaxed/simple;
	bh=1Nx8tTVaDfGB6Pm4/tKLuefdVSnxExj9qww15xiKZcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVjNWYJiX03Wk4fWlnl12pzo9uDoxrk8C9GnpZoFdhDrq8pWri8K8OijEOEQn3ZN25+/Cw6uZ2WkSu5uJBXG7jgmHStXTnyS8Oj499uQn2GbckmlSPDkVq1k7rEN96AvO1RJRTVEwq/SV6hbiyLuuPVwrXSXxGvnqT4A+ic5AEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIQrAv9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIQrAv9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF977C4CEEA;
	Mon, 23 Jun 2025 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694215;
	bh=1Nx8tTVaDfGB6Pm4/tKLuefdVSnxExj9qww15xiKZcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIQrAv9UP9HZT53CKDXfj8W/QAph8XrtHU+xsVmcOMpg1hxVwcS33vhhmSWpoBYDP
	 OhTCLzPLYNBG818iXii4xDfSdpmbJeUWQxX98Xoo1OFVCJeLTm34+N+4F2x5ZlTZyO
	 xNJwIQAkEEAsxRXDXFL8vxzjK34GoDNL/G0xbfvPDHkDt95tVszXH0cofADHgFCnzz
	 eD5HQsXZLPe7ID4Phpl/ebhehXBmpHU0EpF6KXM72tDhUil+aNM03XcXyxRS8KAp3O
	 FR/wc2/58+yvG7tsh05PrPa8/7+rJK50AcbGgUGGUd1ysop91Kc/L2Q675PM86qWeA
	 0RpRY4z84e3vQ==
Date: Mon, 23 Jun 2025 16:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: E Shattow <e@freeshell.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: memory-controllers: add StarFive
 JH7110 SoC DMC
Message-ID: <20250623-enamel-discourse-3d28517e01d4@spud>
References: <20250606130253.1105273-1-e@freeshell.de>
 <20250606130253.1105273-2-e@freeshell.de>
 <79d84bc5-1b39-433d-afc3-b6ca84f274f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Qxs9Dmd5BdP9ygB"
Content-Disposition: inline
In-Reply-To: <79d84bc5-1b39-433d-afc3-b6ca84f274f0@kernel.org>


--5Qxs9Dmd5BdP9ygB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 08:45:04AM +0200, Krzysztof Kozlowski wrote:
> On 06/06/2025 15:02, E Shattow wrote:
> > Document bindings for the JH7110 SoC DMC as implemented in downstream
> > U-Boot driver starfive_ddr.c
>=20
> Heh, I totally missed "downstream"... We do not add bindings for
> downstream. We do not care about downstream, so I should not spend my
> time on this.
>=20
> Do not send code for downstream.

I think that's either an accident or poor wording, there's a user for
this in mainline U-Boot.

--5Qxs9Dmd5BdP9ygB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFl5QwAKCRB4tDGHoIJi
0vgEAQCzbZ9M4zBMrRABOtQpgL5FcDJGq7LODPdfsxgn4fgX7QEA0rrRewyTnlzb
OHOKsfAruqdRzwaMVc7+M2Ejd9x9SQQ=
=ily5
-----END PGP SIGNATURE-----

--5Qxs9Dmd5BdP9ygB--
