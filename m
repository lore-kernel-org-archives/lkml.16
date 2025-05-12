Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1FDB66E;
	Mon, 12 May 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061270; cv=none; b=rEvzhWEQXj8meiiObOQ2lFq96343DN53tvScOl/1voS2X2NmIcRY/KKWEdOd0+cJJtPq2e5oLOOO3l2aUXhUbYr3cfGbnw0JPwsMNTcgi/Zw6KAa5CMtAuFj97kyYIqwEgAoHw6RRdMQdcXXGQw846SppqXbVroohv16YM2T7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061270; c=relaxed/simple;
	bh=51CBeNSbYFhz+5nXX3XkcH7Be6A0cByKUPwxeeWYY7s=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XkM8JglfBpAPyYN9Q7Xx1r4rR9VGRAB8VoFa0u+ZFHRrW7QjqxqRytZmumpiUSSduuJaExHkJCepffdtp1Atx7F3QM5/GzEmlX2NNg+SdCjrJG+23SOey5LPfsS1DTO/LWICVwMYpkIxMdDgE/QLj9bbsV/FuZj7jIyK62uGpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tu6QReio; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tu6QReio"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54CElcY22022622;
	Mon, 12 May 2025 09:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747061259;
	bh=qA4c873aAVyx8lV3+U1OKyUnt9VrihjZK+lZcde/Hjc=;
	h=Date:From:To:CC:Subject;
	b=tu6QReio2UDWSa10tmE6vULdqvHbWEpF7hvhH9dC6VTCoZPVYq0amG50npOsSunnd
	 5d+8q+Z6dasQYdZlpKl1uE/xpytU3vzSuDyLWVKJXz//x2qLXpoxdq6NpHGxtqCy22
	 DYvm8zjUpfuFRobXUyoRsGGDzf6ODDeGApU48MbU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54CElc031169308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 12 May 2025 09:47:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 09:47:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 09:47:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CElcfY040746;
	Mon, 12 May 2025 09:47:38 -0500
Date: Mon, 12 May 2025 09:47:38 -0500
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: SoC <soc@kernel.org>, <arm@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tero
 Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth
 Menon <nm@ti.com>
Subject: [GIT PULL 2/3] arm64: defconfig: Updates for TI K3 platforms for
 v6.16
Message-ID: <20250512144738.dv63fd4fyuly3s44@diocese>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfdheb7zkavebeha"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

--cfdheb7zkavebeha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
Please pull:

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-c=
onfig-for-v6.16

for you to fetch changes up to 42cfb00c919e5951ba5c4067a058c7e2cf2ccbc0:

  arm64: defconfig: Enable TPIC2810 GPIO expander (2025-05-02 08:14:39 -050=
0)

----------------------------------------------------------------
TI K3 defconfig updates for v6.16

- Enable Cadence DSI and PHY driver support for DSI support on BeagleBone-A=
I64,
  BeaglePlay, BeagleY-AI, All TI EVMs etc.
- Enable hardware spinlock and Quadrature Encoder Pulse (QEP) support for
  AM64-SK and other boards.
- Enable TMP102 driver to support Phytec phyCORE-AM68x/TDA4x and the
  phyGATE-Tauri-L-iMX8MM
- Enable TPIC2810 for AM64-SK LED GPIO control.

----------------------------------------------------------------
Dominik Haller (1):
      arm64: defconfig: Enable TMP102 as module

Jayesh Choudhary (1):
      arm64: defconfig: Add CDNS_DSI and CDNS_PHY config

Judith Mendez (1):
      arm64: defconfig: Enable hwspinlock and eQEP for K3

Nishanth Menon (1):
      arm64: defconfig: Enable TPIC2810 GPIO expander

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--cfdheb7zkavebeha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmgiCgAACgkQ3bWEnRc2
JJ3DQw//aXvm4zB+oAiQY85ggQLaVA0iEPn5l7TPc/HAqjAiuKoFqtF1JEYEmMwO
8oY6/91lR/rxUWDF5d9zy+8uCNCEZd1qVq3G4HoPtpFA//Y/n8aPb+V2OPchM+Zb
6b+BLJk3xsLLZRUq81chgroYPENAIargTTM7WOMKHVRjq8GTrRiOLABQy2DJ80Ls
BF1iMGAoN3mO7msWGycyZjqs/UoUrB4l9RFtGJlnZDocnHzaXUY8J5TxQHAQDtrJ
W1+q+1+zqqe4aN3qERV8ZbW4Vd1C8JSX6N4izMLu7vpO2lt09bfLVfnSLXKdWDuM
ky/YpVOh6zHnYaQxPcHfZjfzxf1/KWJvqFCW9rXJc37SzdlIRHQfwVNuF9gYYhhA
G20Wvm/6+Rjxa0Ve+clUgFWBaYzdu5Bv2w7yh2gzmJwqeIaQ9YCu1lNvygQjlWm0
/pLM9hjS1juhEkaMAI93wknyQ5sUQ5KnYdtb2uF816CmYWENMvfVWMQdyDfHL9SH
XUz3eoUS8f/wwM8bRel5+2xC2Qft68k7zdC5TRqbRqyIF54hX65Rc3GPauqbST8d
MIAoNBbKZkdDvCpcf871UnD0kQdd9CvoIyeVFsWu6QJCxAuFhCZ6yQWc39lfy8wZ
mOdRz2sEsQV7nzYWlJe3okJd7QmzPwBxGUJbpnTIuGwe3GUjP20=
=AVfw
-----END PGP SIGNATURE-----

--cfdheb7zkavebeha--
