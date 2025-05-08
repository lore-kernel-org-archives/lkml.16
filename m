Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385E27979B;
	Thu,  8 May 2025 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717120; cv=none; b=iYUHvjI2HFnDZFp6bT13EF0vAMbUWoDZnEiF0YYMcNC3HkLRChbuXdn+g3UhricTwpHI3wf2tL8I7TU89A3N3rPtnqVWBhs7PMBcwmP35fhJ8J5gkXNToDpTAHtBcxhibE6OsDMkMv8gYFhQWGJWjVIS0VT4F+Pp8tISceVEJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717120; c=relaxed/simple;
	bh=fztn7MttRqSxdvYoPCRXKYHR3iB8MxW14WSVwb+i/tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3bC2eB5d3kod+hG9QFB1GHUdZLahTjPKDmA0MqCHafCo+v0Yae6YubwcC8jAADjyIGPz4pA6Lx18Rn1lSA1mHEgjd1ljPha9Dks/N2YRMY8g4SOV05uZLuAWpncPsJ74z8zsI9KdSuxqds7tursRQVKqa2YfCwfe1rw8DlUmYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHdaHg/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHdaHg/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A065C4CEE7;
	Thu,  8 May 2025 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746717119;
	bh=fztn7MttRqSxdvYoPCRXKYHR3iB8MxW14WSVwb+i/tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHdaHg/GNuL+WfvncI+0BryskX3dpDktrpQ5eh3jwU6ZYEbEmn+ALLfgGogl6wNYK
	 Hu8Ues1ftHnlfmR+JR4sRgzCTL+dFY5mfi0yKNHJdWldWh+eBJVoankTkoPimC+7y8
	 JhZvoahnMdPzWa4/ZGrduVT8hI9ZU7g7hJLPeC2RgltePCQs1xBv0Lc+gT9InZqbRH
	 SvC/3FjcRl7WiAMuiLtbl/vBQlmthFIRTwJ6QLW0rpw03o4vznCbrKeTsruDKeAWsN
	 z4afTxphyr+vd3RQLAOinh554V6yk1j7IZT5rRFspkT3duQxIyG9dGHhpsjVBbWqMW
	 HyzvWjrOY9M6g==
Date: Thu, 8 May 2025 16:11:56 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 microchip,pic32mzda-evic to DT schema
Message-ID: <20250508-blandness-curled-0bb5e3595eca@spud>
References: <20250505144754.1291072-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jBjbCEC2Z2qvjUxZ"
Content-Disposition: inline
In-Reply-To: <20250505144754.1291072-1-robh@kernel.org>


--jBjbCEC2Z2qvjUxZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2025 at 09:47:53AM -0500, Rob Herring (Arm) wrote:
> Convert the Microchip PIC32 interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jBjbCEC2Z2qvjUxZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzJuwAKCRB4tDGHoIJi
0trIAP4y5YqYxs+NB+g1vGgf1TUOtZmOl+uBGp+ME/3p0eIwQwEA4+u+bkGEJDb9
hHR5CEspISBzZfs+yCzooC7F6CdYawI=
=K2C6
-----END PGP SIGNATURE-----

--jBjbCEC2Z2qvjUxZ--
