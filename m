Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA42853EE;
	Tue, 22 Apr 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335110; cv=none; b=Wfafzv0iOW1Qujso5BxIAefOUOyt7QRBLYszP9wmhD140+pAra1GAIsAQ28r9pfDFCzmN44MXHPVj2SsAbXtic0uziTdt74mNJzNuX9qHr5WWTZAVtr+UIDrdFCm/h71xeq2gjxl3RErVql5kW8JxEYfJs66lTxY+agCRPQHW7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335110; c=relaxed/simple;
	bh=WSMzleGFy5SmEw/j4q9eyuXjRU6ZVJnLQEIuew9yvVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RICT4Fm6slqY6SiOhOxY8wVFhB4mlfV1HjeBHgE9iwbtdQigFjQo2jmqmie099mdYre1GvQ8prEacOUESR/v99V0DizK5xHvIt6EZzKlPDxdqQIHEwV0OBa0J0+0elL7BvE508gUgwSV1O2gS6uxETvb0JtKB02Ei9XoSJXYt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWBQ/H/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWBQ/H/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B8DC4CEE9;
	Tue, 22 Apr 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335109;
	bh=WSMzleGFy5SmEw/j4q9eyuXjRU6ZVJnLQEIuew9yvVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWBQ/H/2TVFvh3OZ/Tt93sOb71VNku4po0HT1VsmH436FwKK6EliKkY3dzmRtHT0C
	 dYvjZBMqmQpXXI6SE/44S8O2bl7XNZ/xg4cdnqK/zUpG6dhOecOCaeI+ImDp2jzEst
	 aSEZs0N0wByyhsO/as/LKs7V9mi6qneEfFWXwoNkE0SMyI66/PmRcE7JghcHVQg2Ww
	 3LJ1Mm/Nrm/sGNdFQtUFf0z9Wq5RbsXW69OKU1BzTe2qjobyOAdffcxmjmsYiOLfyE
	 SdnlohYB4zqRKQTa6pfCZ+ChEbOVNA6gj01lgeDHY4bprH395RXB/sqCHaJrNyVYYd
	 v6FOY3VqvP+mg==
Date: Tue, 22 Apr 2025 16:18:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA
 extension description
Message-ID: <20250422-dictate-parade-3ad965f6c9c6@spud>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
 <20250418053239.4351-10-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PSo2xE1X0sDiDPUV"
Content-Disposition: inline
In-Reply-To: <20250418053239.4351-10-cyan.yang@sifive.com>


--PSo2xE1X0sDiDPUV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 01:32:36PM +0800, Cyan Yang wrote:
> Add "xsfvfwmaccqqq" ISA extension which is provided by SiFive for
> matrix multiply accumulate instructions support.
>=20
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PSo2xE1X0sDiDPUV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAezQAAKCRB4tDGHoIJi
0lVhAQC6EzX10joPYVO8GsoAVGpEsRXt1kEptH5AAgI6JS9alwD/VqeWssBvDGY6
G0Cp3nBek9TbCmYL+hYS2935WUSTbwA=
=QwvL
-----END PGP SIGNATURE-----

--PSo2xE1X0sDiDPUV--
