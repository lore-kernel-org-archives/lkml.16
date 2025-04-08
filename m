Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ADB22D7AA;
	Tue,  8 Apr 2025 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128980; cv=none; b=I4EbRPqCJujoi6yXYgPwNIK3bmJguEi7hfUhjC6rC8cOps/vB2el6puaCq83GSkzaJknuMWVibbi+KuBVGiUWFi8rbfgpDpO/lPjpdsslGFrwGiagx/KhVw7OFpCj1EKGH6e3Vn0nU0tjSsfNW6LVHaH66+X6uC0XPbpVYJnVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128980; c=relaxed/simple;
	bh=qs8fCeXhqzm+0+n8n76ErRe0opz5wFwtZ5bEgiv2P5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC/MsusodVuzXKJbErbuIrXAe3DOIbO8xLaIUtI9oJy+8CBf9dMwmrfuShKfAMb9/bPk1SuvwpC+6VfIc2/fUzsivCCR0XLosyf5J1QiMIWOMFG6AXitcg0JAyZgkvsNcyr5U1c3AKm9hfm45ysQXE6VhzDvNeTj459W2q/JZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd0gWoht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bd0gWoht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA293C4CEE9;
	Tue,  8 Apr 2025 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744128979;
	bh=qs8fCeXhqzm+0+n8n76ErRe0opz5wFwtZ5bEgiv2P5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bd0gWohtxll0C8zmHx6/GaAox9jOMBhTWJ43rp0wm0uw7vqNieGPMWaJm6jZK9DIv
	 QltkhujTr3xKeF0bRY3zNt7XwfCN3XfxEUywdAmc56XfWxwYwHNWyaf2lBnV9pedWg
	 KesNDdBHkMvhGKD6vRT43dufa6gGcleAH1IXFIIH0aTQN3wgkkCcA0fZg8px5bewxk
	 6Gfq4DlBGNUlGH1T1g65VjMLMvxVej/tewsQc6C3TQf53wd8vfl19oUTi6xJhXHb82
	 sUFPfJ9n/wAc8mr67u0EWPQExSEjTL1NPElpbZ5hhIUYISVs9LqpDQWhwlRN1LLW2Z
	 04KqLiRCfJKvw==
Date: Tue, 8 Apr 2025 17:16:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/14] dt-bindings: regulator: Add ROHM BD96802 PMIC
Message-ID: <20250408-boogieman-underwent-968671653b3f@spud>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <df7983e7c623041f14a4fbe409a2cff846e68a05.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uuAFbGTWvfty7AaS"
Content-Disposition: inline
In-Reply-To: <df7983e7c623041f14a4fbe409a2cff846e68a05.1744090658.git.mazziesaccount@gmail.com>


--uuAFbGTWvfty7AaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 11:40:41AM +0300, Matti Vaittinen wrote:
> BD96802Qxx-C is an automotive grade configurable Power Management
> Integrated Circuit supporting Functional Safety features for application
> processors, SoCs and FPGAs. BD96802 is controlled via I2C, provides two
> interrupt lines and has two controllable buck regulators.
>=20
> The BD96802 belongs to the family of ROHM Scalable PMICs and is intended
> to be used as a companion PMIC for the BD96801.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

I think I acked this one on v1, no?
https://lore.kernel.org/all/20250326-candy-endocrine-2e7b2182e53b@spud/

--uuAFbGTWvfty7AaS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VLzwAKCRB4tDGHoIJi
0nSjAP9bY9GVbG3GEKEFQXWZDLJZRybg7KceJ8vfM6jmZCEsrAEA5c9R6oh3+mvx
x2YBgFqWpZQ+P0sS5g9JO5oq1T6GZA4=
=4I1U
-----END PGP SIGNATURE-----

--uuAFbGTWvfty7AaS--
