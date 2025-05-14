Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E8427EC9C;
	Wed, 14 May 2025 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238128; cv=none; b=GOy5dyaQoOwsslanU1uLVUFvTVEqp4B52zBxllKoFOLM5vbXW/Yt+4HWZqmSrl/amKSkn2GhAvSL9JN05pA8AxvHuyY7p164VqfLsnTIfKmG4J6BXMcIvrXKrOUvavEnWiPAPi83X0CZzn0Mw+xJIfPA+z+5Q+d5C7pnGzD/4dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238128; c=relaxed/simple;
	bh=+h4Sfsax8izb0iegJaiPTNkMvhFd8oYAzDM8I20tMvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyqQrwLsrtjcUxsmflP8yDWgyxAIwNZcpkENRErozgyWEmrfZ+0Bai18eCNcgJ7QJNMdVrzhpErwe8t/JKXgaqhAJuH8HMPGCUzUE6N8i53mBSQVpiFVaIfBD5obIvyDFwjHCia1sln+w//gROOSN5MKe6uPMnXqmOJfrl46n5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDaABTOu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDaABTOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D39FC4CEE3;
	Wed, 14 May 2025 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238127;
	bh=+h4Sfsax8izb0iegJaiPTNkMvhFd8oYAzDM8I20tMvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDaABTOue6pdFohNIhff+Lr0CXP9ak4MbrYCB8OZpcTA8kix+7QX2TvoDCxrTuPWV
	 rAjghtbBS0mEo4Omi+5XoimHzfNdVTqzVfwUw87GJzgB6eHjFUK5/AiPvCiYTdVCMW
	 OUJkg04/yhlqobxSn8q1mwiNqkxQuw/i1J2Vg7tZEdI/VpmmO7NznfaZ5MZMbU+UVm
	 8wtmXf/nVPrQiOc1OKVl4I2uAk7tyWBPzdSDwVdG0BecDbM4+eQRUR+LkfTGTP7luo
	 luYK6GUvEHI2LXRHj5Ixw/kv6T0JDui+vf2zFbxxLPHn33FPYRf4Jz71Lh9siwazfa
	 lvSo62fW0512w==
Date: Wed, 14 May 2025 16:55:22 +0100
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: mti,gcru
Message-ID: <20250514-shaping-strive-3041294b6c70@spud>
References: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
 <20250514-riscv-time-mmio-v4-1-cb0cf2922d66@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KqQqrX7qoMOwsoOT"
Content-Disposition: inline
In-Reply-To: <20250514-riscv-time-mmio-v4-1-cb0cf2922d66@htecgroup.com>


--KqQqrX7qoMOwsoOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:51:50AM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
> platforms. The GCR.U memory region contains shadow copies of the RISC-V
> mtime register and the hrtime Global Configuration Register.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--KqQqrX7qoMOwsoOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS86gAKCRB4tDGHoIJi
0o6LAPwMzLfr21Cf+1WiqzTQZ7MXalJFDE0qM293QqB29ADuXAEA6D5GoBA8LnuD
U7YEsN4IXgIgJmmTEb4ZUxoEku2Kbw8=
=EUjp
-----END PGP SIGNATURE-----

--KqQqrX7qoMOwsoOT--
