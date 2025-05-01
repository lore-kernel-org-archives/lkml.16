Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D2AD24;
	Thu,  1 May 2025 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109926; cv=none; b=eFswnBL22iUlQERoAl8NLmdBO62bw7Wcz7TTIatuMMW49tA0Enrvmfji5rE9bkYBa1kETNveh+TTQ7u2Pjsi1MIceUhy0dMZzxPm+JmwoJBdaa/0t1VQmqF64hxc7z6ZqUc7lsZ54rySFp/7zElWGaW+n6Ck6DPdyU0ZNdfzHCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109926; c=relaxed/simple;
	bh=LdsVNnkJrHoLXbSbUPMDpxSQ6NufQT5IcMdgtFRep4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uwi2780Mh/IySLr1LF5Day2kyZkHLd7mIXC0MRWDkxTD6/jiEfC1qA9Fy4cJb9SKm12SyYmjfLPXA11JEIpI6tNoxyeGuDnSQHk/W2xFuktNvW7+BAdVzv14iYfpwfWTzczon9FFRzuuGOaRQnd7SfFA28LwXqsgfz+8hBNMWsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWLMTJMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWLMTJMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D622BC4CEE3;
	Thu,  1 May 2025 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746109924;
	bh=LdsVNnkJrHoLXbSbUPMDpxSQ6NufQT5IcMdgtFRep4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWLMTJMZOZ3qliqI4m2QyJHE0D+y0U3OZ+gBzsurwZ/3G4nS9NbINvQOlQXViPEGL
	 195xHGu2sz2XFr93Vv/u/0u5I8C2HCBQzlau1qDVYAOpmJJ3BI/kFm4cu+vTSMmLVA
	 +kmHG0roQT8PvEWjgbllblXYuwCKyhWtGg3NzhoBZY+KvWr4e1KIrRGahTO4YKQuGF
	 gHyAuFSMnIh0au3LcKoUatsxfiUntGIYJfPPnmvf7g2fU4cPRKbTGv3C0SXXdHvzEd
	 LvIF2U/zV8HMer+dy/qL5vkhBc08C5pG79Mrk2H7INdino9x970zi8vhaitw1npsBV
	 uluww+Bp0YuTQ==
Date: Thu, 1 May 2025 15:31:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quentin.schulz@cherry.de,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Allow port dt-property on two leadtek dsi displays
Message-ID: <20250501-groove-decode-7c02f67c8752@spud>
References: <20250430082850.244199-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vv97M0+otrzJGnBd"
Content-Disposition: inline
In-Reply-To: <20250430082850.244199-1-heiko@sntech.de>


--Vv97M0+otrzJGnBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:28:48AM +0200, Heiko Stuebner wrote:
> Working on an upcoming board dts, I noticed a dtc check warning
> about the port node and at the same time the kernel-test-robot
> noticed the same warning with a overlay I added recently.
>=20
> So allow the port node in the binding of two leadtek displays
> to fix that.


Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Vv97M0+otrzJGnBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBOF3wAKCRB4tDGHoIJi
0omYAP41/ajL1HV2bP3vX446tkfOhX4TMOtMoa2YlBB84At9wgEAvxkF9+TChQ7r
YhDexXpjgmdSgVJ8yXv6eSalclm7Kgc=
=0TIm
-----END PGP SIGNATURE-----

--Vv97M0+otrzJGnBd--
