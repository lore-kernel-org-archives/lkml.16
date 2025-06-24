Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E472DAFCB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791134; cv=none; b=ILzYqc9fYdf5G4Tvpe6LV080BvLb1ly8fOo4WWjcvEh39wtk3RekmrCCP2zEX2Mu80iGXerLgM8FHnagrdFnvYGV4vltzA9OzPOlKPyVyM5pLXIg6N8fgJ6jAMOtS/nReaLzijwMgYSkVlu8Vtq5fKNkxEpnUbRBYku3acwd2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791134; c=relaxed/simple;
	bh=aEHzorgiLtvL+11b4j7jEK5C82kRl5YOEdrk/Bem+l8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hhZvkwJ7v8S2pB9WUF3wbB3f6EuTMqsk7PVbyXt0WKKYuhjd4vczZLdDZ4FBARBLvl0KXix2P58RLffDS+v5OFOp6AzbUymlEqyMvtF384k0YIpf+Lj8DXaqwwlT/EcqksA+VuL8YENexXwusdUHcW5iQFNIy1ab5K5c3m2negs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mpJjS3su; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mpJjS3su"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750791123; x=1751050323;
	bh=EQbdNO9U4U1CFdHtv+6MGnQvTdN12qRbzSOnfh56dC4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mpJjS3su/I69BuM6ZoJxOZXzWCtt0dCb80asy546fth1qWX+2D41nH/HZ3GWLl0AM
	 Ob1C9q1ZdmYIGNsrG3DkyLVnLZyGIjX+csYk7aSvlnIxXgyQHQvP5ulPzWTVfUD83B
	 ugh1rUj7CgDj0owxl6pU7Y/egEKJtXoF4R5MwOBLxWjxF958xyDtj+SdKnaWMQfXTX
	 kgEtjMJB1pEnRQOE/iuvJz7dMDcFHELAbAyHtBmkZb5Gil9gEE7lR9YFbbgKNS/ZN3
	 xvbimINx5o+MjiPs6mDSdSaYozNMVaHgTJennXUyqHSH9LkdqfNnUXwsYd3fQf7DFe
	 3HnhwQ8SRQw7g==
Date: Tue, 24 Jun 2025 18:51:59 +0000
To: gregkh@linuxfoundation.org
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: place constant to right of logical test
Message-ID: <aFrzy5UdqURaTrlP@ubuntu-desk>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 283a8bf58ed22cf255b9533b352957660eeb84be
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: Comparisons should place the constant on the right side of the
test

Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/=
rtl8723bs/os_dep/os_intfs.c
index 3cbfc305ede3..909697accb66 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -922,7 +922,7 @@ static int pm_netdev_open(struct net_device *pnetdev, u=
8 bnormal)
 =09=09=09mutex_unlock(&(adapter_to_dvobj(padapter)->hw_init_mutex));
 =09=09}
 =09} else {
-=09=09status =3D  (_SUCCESS =3D=3D ips_netdrv_open(padapter)) ? (0) : (-1)=
;
+=09=09status =3D  (ips_netdrv_open(padapter) =3D=3D _SUCCESS) ? (0) : (-1)=
;
 =09}
=20
 =09return status;
--=20
2.43.0


