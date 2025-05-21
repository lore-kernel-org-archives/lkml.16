Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3511C84BC;
	Wed, 21 May 2025 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841256; cv=none; b=RgcjaGq9bx+AO7RqCagMonUmZpqBVEYyyQbDTJCmEOWT7Z6FytU6n4xylH8YQbOMbCu4IR3KmhnQT2dcvx16MWTY6EUE56+U2tIAHRY1zPw/RZbbgCF70NB7jJBgIe3buzmUFHsZZTeV8M/+K/VaPCKB9+OqBc1wBda7lbH1EL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841256; c=relaxed/simple;
	bh=5mMVj7zoSNrsqSxpmi4fJbUKy4RL0210P19TixtTxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K31wdAS6kKLUxE/zV9xLup8+fdcCzgCXP5ioeyb0KuUu8ziTQa0dnHq8kGKv6DlzRSIsr9HxFI8NHVHlda3iPCAWz25juXzYPcomoDL5/S+p+RrHpg7odIKXYL07/8MsCanomfvc+7HghJe/7337JlbD7R61lFn3+tIkjKuXdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2TFrE20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2TFrE20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24733C4CEEF;
	Wed, 21 May 2025 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841255;
	bh=5mMVj7zoSNrsqSxpmi4fJbUKy4RL0210P19TixtTxq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2TFrE20fMrmKXZ80cld55DvJ8DdxhLf8F7XawqoKWV6sIPp2pJeewXhZtad0WtZG
	 ZOG7t/6paQbeTepTTu79f61Tt5Os0tJVpPPqMoApI00jtUBbMcyUBaBgCwX2oGLpFo
	 1MvLGAdheHpx2DVozNxflJzeu03mnfKCnhEaxHplWcYJ0y9WmfxtS8JpQ+S6lPxgCI
	 aZMd2HOiB3d0zEMX0x++DkxY947AoU3Z5zAvy3t1ggZMyZBGu2RxV4ZgMO4WJddnu9
	 Y56dSdSD7gLDYOIj49w5J7Oq8bob7HRlqGsyQkwHBPNeKRLvm340LPD7l+loHK3Ql9
	 wpnT2KJ0XyvdQ==
Date: Wed, 21 May 2025 16:27:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: stm32: cosmetic fixes for STM32MP25
 clock and reset bindings
Message-ID: <20250521-lapdog-important-eab513a1f0c0@spud>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VmVkhvbJ+txMTgWr"
Content-Disposition: inline
In-Reply-To: <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>


--VmVkhvbJ+txMTgWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 02:38:51PM +0200, Gabriel Fernandez wrote:
> - drop minItems from access-controllers
> - remove rcc label from example
> - fixes typos
> - remove double '::' from 'See also::'
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--VmVkhvbJ+txMTgWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3w4gAKCRB4tDGHoIJi
0pXnAQC8hATk3hUwzGttwspTMjh0lSDX8+wInM4ZNqQ+El50uwD/U1qOZLNLaKRf
GewLL+A/wyRnHVMpEQf/1LcRSOQreQo=
=mwyf
-----END PGP SIGNATURE-----

--VmVkhvbJ+txMTgWr--
