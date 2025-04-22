Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7B196
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289611; cv=none; b=uy4kyuPKFLFW2ycmTtBtibbjoVMGzg68TjDE5hEf0DbX6yGPEs1E02ERyjeOFGs2LGoRu8AOiDpepwb15T5v6xiGuAJx4myzfVfte3BV6UUSfoOc+f4VKpgnGsyo+i/8rkyXmu/6MpG7NYujNbc1+ZML0ki+T7yPzQxRLGc+7yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289611; c=relaxed/simple;
	bh=WrOO39tWB1fRg/ajxTScIf7pey1vyspWO/DuZuEe87g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axurM8XnmmIKfO8o5GCIzGWVtzvtGTgWpHB/OMDlgoikiyqnp6uknk3I+BbHGcQi7cHETA50uXY+rqU0hSmAb4q+QMf92CCVbvfIfh536mU0uoJOGG9l/GpaG/G4yHFQ8ucXTTWt41tFNlhr1Xm2OVMpx/dTnas0RtJkpI7vmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 21 Apr 2025 22:40:04 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] 85xx: Add several root nodes to probe
Message-ID: <2025042122-shiny-vicugna-28507c@boujee-and-buff>
Mail-Followup-To: linuxppc-dev@lists.ozlabs.org, 
	Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="njrs3bnfcssymytq"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT


--njrs3bnfcssymytq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] 85xx: Add several root nodes to probe
MIME-Version: 1.0

T4240 fails to hafve ifc, rapidio, and localbus probed.

This matches other QorIQ platforms and ensures devices under these nodes
get added as platform devices.

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Scott Wood <oss@buserror.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/platforms/85xx/corenet_generic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/p=
latforms/85xx/corenet_generic.c
index c44400e95f551..c81b8a47f3b0f 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -61,6 +61,9 @@ static const struct of_device_id of_device_ids[] =3D {
 	{
 		.compatible	=3D "simple-bus"
 	},
+	{
+		.compatible	=3D "fsl,ifc"
+	},
 	{
 		.compatible	=3D "mdio-mux-gpio"
 	},
@@ -91,6 +94,12 @@ static const struct of_device_id of_device_ids[] =3D {
 	{
 		.compatible	=3D "fsl,qe",
 	},
+	{
+		.name           =3D "localbus",
+	},
+	{
+		.name		=3D "rapidio",
+	},
 	/* The following two are for the Freescale hypervisor */
 	{
 		.name		=3D "hypervisor",
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--njrs3bnfcssymytq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHAYMACgkQXVpXxyQr
Is/u8RAAi2lE1gs0W6x62/w3eY4OZ8pEG9T58Z5JcBQ9YgW65BmYGsqVPZwbzplu
OV69z8HJ6ug5trtfHghiQT8Safo2kJ9KvIxHxYF6ni9/LIlnYICdhU/7ewKCdxqQ
7JYcd5Jcg5MEC5OaiMzy3PUIzcuVfCKcCsCMjTjPDQiihfv/+ZGc5TobQstuARxB
BmaeWwr2e8xXthPYu3C48ayHBg3VlYK5zHhA6H8W6R6RXY8jr20pQMtwidKok0gA
3XgXyil4Vr3Zyk2rE1QfxkcE3SXBnd4nwgyVXM02eX0v9MPg60z2sn2WriwbW3rc
D7LVfgYK19hoKdKblskE49UjyRZX47/MUpGDrNFi8KeqFwDatArFYeATgANG2tDo
hQwXWsENBh+IUf06WkBvZkrLhwuii2/FSUikYTBOGJdKQKw0QUChLaTmh19dOgW8
lhzx5/CJJHBByZ0z5eTuM0vd/BEw3m5ILdnw8Ge1rCes2S3ODRLB38E+eURUUQ32
0OXNmSyaqgcVrDZvw301/YoLPAOlLpGeHzA5Op87xeGSjE9iU9giAd2Gz37v9AW1
csIAM/EFc9nJeij6SbMNepFzNooakJ0jwdmhFZgqvi5pirU7UhahTb7x725zoUbJ
EvpdXuV4/xicEQJfkxuLwH2U87lKEIPjFa7oyUClRczWYVSJ/pE=
=8ZNj
-----END PGP SIGNATURE-----

--njrs3bnfcssymytq--
