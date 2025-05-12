Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7F29713F;
	Mon, 12 May 2025 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747073632; cv=none; b=Rp5Bw5Hx73vITAhw34eKYVlqTAGwp5fLQN3PfkDCZPWrbrfPiK4F7rn39eZMwwea3ez/U/fn+j7TbQggdU7j51wDqHzLzUf51CLiz/Uce+dzuxe7Iu/fWeriLTYy7gHLrp+Fn0f1a6FNUyeGC1z0trWTjcbi/GEZxIYMCz9EQcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747073632; c=relaxed/simple;
	bh=KlDznQJ9x7yYl0RQU++AFqF1z/7/ZXlbsoe7bnKuB0M=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pew3DWwTNiZBJKc4rIllyV9pw4hYxMl2IpZPQmRf+oml1XuwXtJPKrNHhGu5M3VgnJZhoOGZqo3fwemGHnsERv2FaypyWfm58onXa3T3Hsn4eb+RyoMbKssdgZbmoAphVsbRczcua2G6gvdNqyUI87wNVPCJSZx76X/y/y8Nor4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eh9q3YJc; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eh9q3YJc"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54CElKsf2039818;
	Mon, 12 May 2025 09:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747061240;
	bh=M1dbos3NxQKuT6QnfwRY9+hyVJpSnhTDpepVkHM/iHk=;
	h=Date:From:To:CC:Subject;
	b=eh9q3YJcKoHptui5NWsC6ktYlxkMLiUYlZFeq4cyyd7E1o0d3YKitdXZN+WI2Y0I9
	 vi1lOCaukMwRYkfcak3RdIRdzdZ0qDSekQQ/KdF1GPvxaEpcDTP6U5+uh1yckCLq7i
	 6mKv+biTUCCjzl167yI02EpQVwjR3rNQLAnmLCfU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54CElKMV1169212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 12 May 2025 09:47:20 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 09:47:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 09:47:19 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CElJAm040488;
	Mon, 12 May 2025 09:47:19 -0500
Date: Mon, 12 May 2025 09:47:19 -0500
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        SoC <soc@kernel.org>, <arm@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tero
 Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth
 Menon <nm@ti.com>
Subject: [GIT PULL 1/3] soc: ti: Driver updates for v6.16
Message-ID: <20250512144719.mpkyw2jbyzslb5hy@yearly>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnuongetbvaxpj52"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

--vnuongetbvaxpj52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This PR has a couple of minor checkpatch warnings on 75 characters,
which I have opted to ignore due to breaking URL or warning message.

Please pull:

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v6.16

for you to fetch changes up to 877afe1ee34df54ea62ca9746aafbb1cac946bf5:

  soc: ti: wkup_m3_ipc: Use dev_err_probe (2025-05-09 06:34:27 -0500)

----------------------------------------------------------------
TI SoC driver updates for v6.16

- ti_sci: Bug fix in CPU latency conversion from us to ms for TISCI protocol
- k3-socinfo: Add JTAG ID for AM62LX
- Code cleanups: wkup_m3_ipc: Use dev_err_probe, k3-ringacc: use
  device_match_of_probe and knav_qmss_queue: drop unnecessary NULL check

----------------------------------------------------------------
Alexander Stein (1):
      soc: ti: wkup_m3_ipc: Use dev_err_probe

Chen Ni (1):
      soc: ti: knav_qmss_queue: Remove unnecessary NULL check before free_p=
ercpu()

Kendall Willis (1):
      firmware: ti_sci: Convert CPU latency constraint from us to ms

Tang Dongxing (1):
      soc: ti: k3-ringacc: Use device_match_of_node()

Vignesh Raghavendra (1):
      soc: ti: k3-socinfo: Add JTAG ID for AM62LX

 drivers/firmware/ti_sci.c        | 14 +++++++++++---
 drivers/soc/ti/k3-ringacc.c      |  2 +-
 drivers/soc/ti/k3-socinfo.c      |  2 ++
 drivers/soc/ti/knav_qmss_queue.c |  3 +--
 drivers/soc/ti/wkup_m3_ipc.c     |  8 +++-----
 5 files changed, 18 insertions(+), 11 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--vnuongetbvaxpj52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmgiCe8ACgkQ3bWEnRc2
JJ3VSg//cqLAq2iGAboinXq/KGwV3tdz8mR0MH7jjlrDV9hHTT1TDFa6UnasJmsl
YNafSVifHYlBxi3vIMXOJ8sOt9nETw7AWPTP/YTyVaoyosw3XlkzNKoWyTYJKwzm
uvBOb3jCBYqwqfYwCsXq8awszoN8fPxpAWJmg8NhlwJjORZICjnyBB63m8ApLB1e
5cH/H8lhtT92fM7F1PrNI4/62woJ0srLH7sgegq24vSh0pqYdy64QFSk+ya1ZQRi
wKAGhehUHGe7o4QQZ+BJcy9I0PJCfejJB2ZRTphtT8HMWjQhP0Aw34BZacmBtIRO
cy3aJ0Wwc8DAtKW+yV5D1cNy4w+BuFKDgyK6XsPjVmIqaX21G+05zFePiB6bIEO4
sbs7HlxsS5YMbor6UMMX1YLvkms1ku91lrDpyV1z/o0iN79sbXyAxPj0piDKa13r
cLdNzIYhiOdiBCtXLxYa6y2GeZq42SNQee7XhEbLS1bhfLYLH4+cJ7MGAboJse/0
nVG7+VoFwUUMpMl18mK6dITyr9sRz6R5tqWFV5iDJx3cklhdsowlydP1MoELJuEF
jVcqgpFuqygrJam1qy8NDFC4xqr2ZwvDFXK9MnjcmePF2EWZmouSKROFjxr6rHNA
QfT4hNUM8iMn4glklKPM+dNMggAmyDB1+zbdyGJdi0rw7I2vP4s=
=npRl
-----END PGP SIGNATURE-----

--vnuongetbvaxpj52--
