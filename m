Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F82857C9;
	Tue, 22 Apr 2025 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335097; cv=none; b=cxHsUXU8k3IVUkrdXOJLuTUx8knUGNDK1v2sLGCDwHEsp58N5rpYeTXNWZ4BcpjsCpibe58TPJ1gBDefuKBraeEF3vNcLaClMb5WjypEplzVpDIF7XmeFRV2IKOdCyj/PpJCVFd9tpCVmWc35PUTyY0aMIFtPb/p/g4VqNm6IKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335097; c=relaxed/simple;
	bh=lIJ8OMpe6o0RJlsNwJEObuhE/ZfUC8shg/qLjSO5CPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0huHlg4DQtdNadqHbGlPzGGcMlmGxKVtf9iiRr6qEae6fPmVMfWshS2/voswk2wZwFfCEfu/bQ3AihkmwAi8hZPtIEYkWq/eZs4G9CGqfHcgC1C1HfV04ZCM6crXWTJopKVDMzPOxg4/tzhMMcfKiAUUqkHLyvfE5kv0d7yiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTiEbaEu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTiEbaEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4E6C4CEE9;
	Tue, 22 Apr 2025 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335095;
	bh=lIJ8OMpe6o0RJlsNwJEObuhE/ZfUC8shg/qLjSO5CPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTiEbaEuBqPt/jRTIPIz8oqgKZ2DFQVhIa2kj1DfXI18yTgPmr4+BBO4dX7j4lHdq
	 EOsKwV/nySfe1TT9uB4sRncYi1Wesp/u6aLpn9TcD/BvrvUZvt2c0UlarrrJjVOd1E
	 n35r+DC6KTXbcarwNmJRisf86i3ESRPMWL3kbmIg8jGRq41DSDNALyumhfALywlHPN
	 iJF6TcHMjo34MAXhqNc+IQ/TKP9A4jRqTs+zE2y37sjD7pkLhoXRpEU4OM709TlEBi
	 LwzZR6DeEIlx8XctPG+fGTrWMGJCV3CAg7B2wiZqn2iiInVK7lgXRPSGK2dqrfJ9sA
	 vWmfgMiK/QYAA==
Date: Tue, 22 Apr 2025 16:18:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA
 extension description
Message-ID: <20250422-troubling-hurried-59aa22f18ec7@spud>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
 <20250418053239.4351-6-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1351njui3Y9pEl1D"
Content-Disposition: inline
In-Reply-To: <20250418053239.4351-6-cyan.yang@sifive.com>


--1351njui3Y9pEl1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 01:32:32PM +0800, Cyan Yang wrote:
> Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
> FP32-to-int8 ranged clip instructions support.
>=20
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1351njui3Y9pEl1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAezMgAKCRB4tDGHoIJi
0kv5AQCiaBozksjVGzTlFnAMyJDetHCUR0v40jrk1MMpqnSDzwD/Z0w0GOhTsT+s
tZ9aQktx0FdiWM1RWq+DV25AzoPWUgo=
=/16H
-----END PGP SIGNATURE-----

--1351njui3Y9pEl1D--
