Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26E62F4322
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737918; cv=none; b=O48iqA0WqwaJ6ROuv07MSVIV+L4ffVKHggKJZV37Kg2chw6DA92seszwE7jvZVKwVFn6bsp3IvRfnyh/g2os6eih57/AszeZYfMBpp8/qr4PVZhA24Pc+q7sq1q98g97ecnSaaRpMAGr/1F/e/zClpEUpSjIRGgL1+hiCvdUlGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737918; c=relaxed/simple;
	bh=YCwaBT/KPxVMxYpvM60UEqcste5hrihsbKqBXMlAEAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubP/wrftJoua8Bx4TXZQWWr53RnPWDfbgfy8TKj0BOgzaD9zTgrFI64oF/03EAyZB4uDiI36CNkdRZz6SNQ1fyl1UjXaZrywoxnWEiBnvEhpWuH1+Hn5lti43PKBSw2pQv6/Gqf2IR+K8sIlyo6N6eIzsse1ExCVOucVw/s1Wd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uPil5-0002qa-Em; Thu, 12 Jun 2025 16:18:23 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uPil4-0038bV-0Y;
	Thu, 12 Jun 2025 16:18:22 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C0FD9426516;
	Thu, 12 Jun 2025 14:18:21 +0000 (UTC)
Date: Thu, 12 Jun 2025 16:18:21 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH net-next v2 00/10] net: fec: cleanups, update quirk,
 update IRQ naming
Message-ID: <20250612-nostalgic-elk-of-vigor-fc7df7-mkl@pengutronix.de>
References: <20250612-fec-cleanups-v2-0-ae7c36df185e@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dzhx7la3oo7i3jre"
Content-Disposition: inline
In-Reply-To: <20250612-fec-cleanups-v2-0-ae7c36df185e@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org


--dzhx7la3oo7i3jre
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v2 00/10] net: fec: cleanups, update quirk,
 update IRQ naming
MIME-Version: 1.0

On 12.06.2025 16:15:53, Marc Kleine-Budde wrote:
> This series first cleans up the fec driver a bit (typos, obsolete
> comments, add missing header files, rename struct, replace magic
> number by defines).
>=20
> The next 2 patches update the order of IRQs in the driver and gives
> them names that reflect their function.

Doh! These 2 patches have been removed, I'll send an updated series
tomorrow.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--dzhx7la3oo7i3jre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmhK4aoACgkQDHRl3/mQ
kZxd4Qf+NgQA3YDIotiqNaXKN7WPLp57fc+c89S7jwiViLkjXwqg66qwgsSPFvVE
ZKEpzCzmPfvAAqdtSH6oloApRjsmd+V7D63jEQ0bVpxElp3ycEsLWfDhPqT2Jk+G
FMzhTIrCrnfWi4nmUkUhU9zdHkrOgYR02Qsm8rcUavvlZjVgSV8/ClsBCka+yiFJ
kxlnUGMHNuDwrhf0pWzXxLbgDCjEfc2FH62eiWxBB70V0yx3X7tfgV3WomIbdVvS
7OtjJNO6RWhrIgvBMT/CzMRb0EhebpHW2dYVrxS8s3aeDH7CABZEGxQSxh0I4sSs
eM0lDD/IZmdofJwKvVmNTTKKkAO//w==
=XGqy
-----END PGP SIGNATURE-----

--dzhx7la3oo7i3jre--
