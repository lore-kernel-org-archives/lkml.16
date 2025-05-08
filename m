Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96501E1DEE;
	Thu,  8 May 2025 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716337; cv=none; b=RG7YDz5HPxBCVZBjzvgHMbev3hlq6TURh6ypb7Gl6Jn29ivXWSqSZt8jj/AbUWw4Fw4uWu0mWW9flmgnEiGczWVbSve5zWeDnvO4j/a2iRLbliSRqkgQqjmvU59DT40GTClbzXEgs0KlhAP641NZzLc83UtUflxZwI9XgZrmFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716337; c=relaxed/simple;
	bh=fEgNDPZrZNRyp3TGc3Har21nplk6tkcYVw2UUifqo54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPhB8ykXFw5XSQz6Er/uBBUKP4Xv6w318mE5qTMnPdZmYQ2u73JtjgY17olwlasSr6co6bBpvNN3k5r9OwOerHhKifFB0RmcdHpw8ifVJyaDcRBHXJqAMScnwFP4jbLLmPDLB9t+iHB3OpfDe6XIJJiW32z0hL63uxkC8dMCQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTEP5tt7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTEP5tt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4B7C4CEE7;
	Thu,  8 May 2025 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716335;
	bh=fEgNDPZrZNRyp3TGc3Har21nplk6tkcYVw2UUifqo54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTEP5tt7dNliBCcHOOehxob60rSum9Pbopo0WW8zhGJmIR/skT0dHEUbjSMHOa5j5
	 nkrWCrmrU/vpJtrphT12athhSc/LYItlxYymDwk+M5ZxWaGk+8rFa14ff0K9y1n0YF
	 qxVAL1MK8Ve0cCk+iMok9KexF8KxRC17H7APMHEkKTCmfDVUAMkoCMfTPO07V9d+BQ
	 NOIpvydqdoc6f+Ep2kiPZ7XWFBnRzNHJRKzcQ4EBKhDCdRC+dbEBz2l7oswsHNdDUf
	 HjjBVNycYgbbL26y5K8EK2OmUg5CwcGMcrIq6gjE6fPDEDqTrwicHmACD6MVBoEatu
	 toDiCKh04/HbA==
Date: Thu, 8 May 2025 15:58:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: panel: convert truly,nt35597.txt
 to dt-schema
Message-ID: <20250508-pointing-trench-90eb0fca2136@spud>
References: <20250507-topic-misc-truly-nt35597-yaml-v1-1-bc719ad8dfff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/C3efKQmUrRpGzA/"
Content-Disposition: inline
In-Reply-To: <20250507-topic-misc-truly-nt35597-yaml-v1-1-bc719ad8dfff@linaro.org>


--/C3efKQmUrRpGzA/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 11:19:21AM +0200, Neil Armstrong wrote:
> Convert the Truly NT35597 2K display panel bindings to dt-schema.
>=20
> The vdispp-supply & vdispn-supply are not marked as required since
> in practice they are not defined in sdm845-mtp.dts which is the
> only used of these bindings.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/C3efKQmUrRpGzA/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGqgAKCRB4tDGHoIJi
0plcAP9PfwMqhB1ZBVYPcbM9C6x4f7ivdciqlQXAntONfN3cCgD9FRtCjp4Vm2hY
Bvgvm2z2A8grzWSWgajDMBmWwPo94Ag=
=gzfj
-----END PGP SIGNATURE-----

--/C3efKQmUrRpGzA/--
