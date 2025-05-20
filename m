Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF01288A2;
	Tue, 20 May 2025 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756149; cv=none; b=AMS6UBcjU8CoZgVJ+PxWmcRaqZIe1+aD0n35O/IGhhFkF1UX0YucZ0JyaqcImd6Re04E2npbvjmGoXowcOIGS4+ZT7EtzCU6dp/9X0NGH/ADwpPXPwGbSM1hYjU0DyAG8GkDU8LJzxLE1utyQ7QmwMWPJekSfLbVMScFmfm9XeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756149; c=relaxed/simple;
	bh=Djfvw13Di5h1WEYv/wdJ4pyB60lqEVC0i629xf9VdTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fn1cW8c8fjpgKJP7rHoxImaw2bHIZMivl4BhrXGfiDQyn2iAB6KkIsc2vAI4qh/BBTglfScupq1HiCO1q3t4avviO3ryjJGIhV7dDb2iD5VdShItEsccu6XwF77MbfPlj37s7QoQNc3VZatOzSapRF0Xftt+tPf9rjWh9kifwtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjlBdkD6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjlBdkD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB804C4CEE9;
	Tue, 20 May 2025 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756148;
	bh=Djfvw13Di5h1WEYv/wdJ4pyB60lqEVC0i629xf9VdTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjlBdkD6DBgzziBb46ZSsbNQnyq+H8E+Sr1eUHe2d/q/LWPcLMpOw6/fJUyyD7Xl4
	 9vB2TQ4z5sYBRlGSk/8mjJRKDbvlc2kAvwTnUEdQ4RI9soswlCyncb3A5yp6OK92Wk
	 GLlJ3ddjlXuyoHaU+gYw9SCAucalRGVx4NxytA9ct/AXD327+3tkrpE6N4Gbz5sxNV
	 qHJCpEK5UfnikHoQxb60UrU3l7Qkfoq8BQf8arwPIK2cQc+iPjZPlqPM2ESVVLeclw
	 b9ZB9w5IDSwXVlnYyl8EllqQtTJymIwT3wc5EwNOVrELsQ1WLIFxx03F0wAOKP/qDz
	 lW2ZlN5nHmKdg==
Date: Tue, 20 May 2025 16:49:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yuntao Dai <d1581209858@live.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: add Sophgo CV18XX series SoC
Message-ID: <20250520-reentry-trustable-6c6aa3785919@spud>
References: <20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech>
 <20250520-cv18xx-mbox-v4-1-fd4f1c676d6e@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/TkBY91k/ckTKX/e"
Content-Disposition: inline
In-Reply-To: <20250520-cv18xx-mbox-v4-1-fd4f1c676d6e@pigmoral.tech>


--/TkBY91k/ckTKX/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 03:44:23PM +0800, Junhui Liu wrote:
> From: Yuntao Dai <d1581209858@live.com>
>=20
> Introduce the mailbox module for CV18XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
>=20
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/TkBY91k/ckTKX/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCykbwAKCRB4tDGHoIJi
0uYTAP9r70nR7dQGdhMBh4sE5wnyubPu4ABhYRGEwp7MXm1HlAEArp88wtemDtBe
1dpH25fBrGpJJbNWpgLLjdVgIbxnngs=
=IUSn
-----END PGP SIGNATURE-----

--/TkBY91k/ckTKX/e--
