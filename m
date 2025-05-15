Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26303208994;
	Thu, 15 May 2025 16:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325839; cv=none; b=LLFKeTawsXPcGbHgJcgKR14FDpz/xP2s8yqaMs+mvSNgrbDIVgkaM+qlF1FQPLghVDeNKrFz1Ets/WiuHe/Ndd+UkI4Zf54xvUBOXSYxcV7Nkh5k3GXIyLvvq6bFO1zQ1ewSQnVye5H0f9Ozr+UlmXZpkPgdZgstUpUq1M7eFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325839; c=relaxed/simple;
	bh=+7X2Q8vkZvMJYGv9ciX4cmhh08fK2Atxda6qD5FINaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mICI+92QnCNlwXHWpHYmGRVj1th+AV96Li5aT4MDq3c4KjyhEPI8ysY4WwNFM529zy+XwD79p6oTU1Y9QulONrUrLrZC7ZOfbQgvDIXinAABQQc3feYIT57q/l9pGhhEl2lnWEtMu0pYGtdGu56Fgw4g4SSU6dcDRsIrWV/svlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryqXIRZ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryqXIRZ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D39FC4CEE7;
	Thu, 15 May 2025 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747325837;
	bh=+7X2Q8vkZvMJYGv9ciX4cmhh08fK2Atxda6qD5FINaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryqXIRZ8aIXBIsQZvIgxJPgFs1PncN+KvVDOmH+uoUHwdtEis7LKTx666Igqb9l2+
	 w1X27KWHDdIFCyQrq+463y+yUdygIWW57hYvVsGtpTLH9SfqD00bTQ+QoqxLVLjOAi
	 nF0KFM5qUzEBkTF1G9hTdIz9B9MyKrNrf4BqVhmtOgzJHC1hqLj69mViwj9Kg0nS+Z
	 YPdbnxJwADXSe5w0jxQygGJzwfP8crEIkwEgIh3m4JMn8a19IflzA6O6W5V2md6HFN
	 MtztHWOafakuUYJawrzRhTHqJv508PJLXBMzBuZ4PC9nD9ZMeGM3PJ4VSbcK9+G4v9
	 GA5OS5DGSlKmA==
Date: Thu, 15 May 2025 17:17:11 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Friday Yang <friday.yang@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Message-ID: <20250515-deploy-wiring-5829acc3d82e@spud>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
 <20250515-playpen-dislodge-80245fb8b7a9@spud>
 <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RlwhVrUT8qkuHwJd"
Content-Disposition: inline
In-Reply-To: <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>


--RlwhVrUT8qkuHwJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 05:11:13PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/25 17:03, Conor Dooley ha scritto:
> > On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
> > > The '#reset-cells' property is required for some of the MT8188
> > > clock controllers, but not listed as a valid property.
> >=20
> > "required for some" but not marked required on those platforms.
> > Why not?
> >=20
>=20
> Yeah now that I read that for the third time, the wording is a bit incorr=
ect.
>=20
> It's not "required", some clock controllers do have reset controllers, bu=
t it
> is facultative to actually use the latter.

I don't think I've ever seen this word before.

> I'm not sure if the ones that do have reset controllers inside should hav=
e the
> #reset-cells property as required...
>=20
> Conor, what do you think?

If "required for some" in the OP was meant as "permitted for some",
change the wording to that and it is fine.

--RlwhVrUT8qkuHwJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYThwAKCRB4tDGHoIJi
0norAQDSFIsJjHNXBCFJoJMHtI6qdNl7hLx+3jLSQS7DWgzSaQEA6lRLOyGnQfXt
JBr7hEiXgg6X68diSAm5cGHvgBzY4Ag=
=g5hp
-----END PGP SIGNATURE-----

--RlwhVrUT8qkuHwJd--
