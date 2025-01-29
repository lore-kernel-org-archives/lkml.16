Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45421DE8A9
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175986; cv=none; b=AI5G9h07gXk+vhDpMRSiBgmD3TXRflgfdrAXOnL+v63ItS++JNx23iYY/JCz+py5xFb8BwNZjTpLoUhlc5qJ7LoTOZG+H34D1DnKQ7pNeexfStWo+PVbnc0oa5v+Z8UyJnqdcITMsGS97I41UVTW8k+iY0T62vr0jpQCbsdFlDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175986; c=relaxed/simple;
	bh=lDWB9AVdKkx2b5avsLMFN5t1mmBnynC8IqaE23qgc/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jz7Q3bg+9+Jbh+/36DrFouBgNc6um92/w3Sd5zqJ3XU65IdjO/s73dV9EkL4NnuaiTGxoMrEWs6jTE4NgZdC2IMhfTrsBYGgKwAVchhihCrIXwJcdVwNb3aMVoZ1cxzZPnD9/6+K+vEGOXjYK/FfF8zC7+0ZQnsIFw5rdEXdjl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bb975Vgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bb975Vgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926E3C4CED1;
	Wed, 29 Jan 2025 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738175986;
	bh=lDWB9AVdKkx2b5avsLMFN5t1mmBnynC8IqaE23qgc/Y=;
	h=Date:From:To:Cc:Subject:From;
	b=Bb975VgqGS5y5o30knG6Huf6Z6sE4rQVrLXjN68Vt7Sfokesu2wE4iUWCa2E6KfJl
	 fHe6JfFJkqZcyoMgdgBMYA9+xD48GSst5Qf0AysVoKaUwt2j9C/exYh2bK6SGV5/rz
	 tA7JW/A3aChPIwwmEo1gPhymiulMyxU8mTocgpejeJAwyawIR57F9dTgDxpIhM4yJc
	 AB7CoZ9+nOdiMJV5VVMjNEWTPTGR265sGeY5b9ZHjSb6vP1PAtMXiYLHHGhsfzNVb0
	 ZAYh0+7hNofPIZY4M8gMwwKGpJktKTl/EFmE++k7VrfRqYodJ3VHB/oHiJKtIZJ4Bb
	 Ce4YZXNwjsBbw==
Date: Thu, 30 Jan 2025 00:09:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: SoundWire subsystem updates for v6.14
Message-ID: <Z5p17orwbsXaqeNj@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2DDqrXK9TIgF6vUr"
Content-Disposition: inline


--2DDqrXK9TIgF6vUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again,

Please pull the last one in the set to receive updates for soundwire
subsystem. This includes the big multi-lane support

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-6.14-rc1

for you to fetch changes up to 74148bb59e2064b87eb1715d9eb109adccb75316:

  soundwire: amd: clear wake enable register for power off mode (2024-12-23=
 12:01:13 +0530)

----------------------------------------------------------------
soundwire updates for 6.14

 - SoundWire multi lane support to use multiple lanes if supported
 - Stream handling of DEPREPARED state
 - amd wake register programming for power off mode

----------------------------------------------------------------
Bard Liao (12):
      soundwire: add lane field in sdw_port_runtime
      soundwire: mipi_disco: read lane mapping properties from ACPI
      soundwire: add lane_used_bandwidth in struct sdw_bus
      Soundwire: add sdw_slave_get_scale_index helper
      Soundwire: stream: program BUSCLOCK_SCALE
      Soundwire: generic_bandwidth_allocation: set frame shape on fly
      soundwire: generic_bandwidth_allocation: correct clk_freq check in sd=
w_select_row_col
      soundwire: generic_bandwidth_allocation: check required freq accurate=
ly
      soundwire: generic_bandwidth_allocation: select data lane
      soundwire: generic_bandwidth_allocation: add lane in sdw_group_params
      SoundWire: pass stream to compute_params()
      soundwire: generic_bandwidth_allocation: count the bandwidth of activ=
e streams only

Charles Keepax (1):
      soundwire: bus: Move irq mapping cleanup into devres

Pierre-Louis Bossart (2):
      soundwire: stream: set DEPREPARED state earlier
      soundwire: generic_bandwidth_allocation: skip DEPREPARED streams

Vijendar Mukunda (1):
      soundwire: amd: clear wake enable register for power off mode

 drivers/soundwire/amd_manager.c                  |   5 +-
 drivers/soundwire/bus.c                          |  65 +++--
 drivers/soundwire/bus.h                          |   3 +
 drivers/soundwire/bus_type.c                     |   3 -
 drivers/soundwire/generic_bandwidth_allocation.c | 316 +++++++++++++++++++=
----
 drivers/soundwire/irq.c                          |  12 +-
 drivers/soundwire/irq.h                          |   5 -
 drivers/soundwire/mipi_disco.c                   |  40 ++-
 drivers/soundwire/qcom.c                         |   2 +-
 drivers/soundwire/stream.c                       |  71 ++++-
 include/linux/soundwire/sdw.h                    | 154 +++++------
 11 files changed, 513 insertions(+), 163 deletions(-)

--=20
~Vinod

--2DDqrXK9TIgF6vUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmeade4ACgkQfBQHDyUj
g0fU2Q/9F+Ionh5knrQYBJQ/xUQLe8/UvNrahdjU5bQ9GYmF1PGIIBiOvIapP1C6
L9Zcx4XxdL/uDaVOc1IMNs7HwIQ/OZ7aMziyoFE/FMzflkkNozCVdzIOrzjKy9fV
UctJkzxwRt7/F14nSiMA9twKIYiNaP9qX7eAOv/snlTXCETLxlhS5rUU4RdIAc6s
MXBnI0ugTYDNdIDKfUlOXMO69fPpK5JBb2iBIDX3j2QJf1CdX99XHwVAUP5wcpzk
hLr0o7+0ZaPShYSrA4iSJ6jUDeDVI4I+qpfIKIiAf52UZq8wFROolaSUtlVkgea/
B+rOqTyRgt3S7Ha4RD3SOC+L+TfM5aBJGsAyo8Zkv4oDkybTHdM1CAF9nODPAUPo
hnEZn/QRH9x0KilRf5TjWZdARNVieFRaoDimQCfn+/0cvwHW28v4r5PE7xwTYxCb
zIN280iEidXEoDn9ZGY/K55CbIbjhDwn8IqTj2mUuSOYTDaOCEN19zxdhx2ZcJVS
VSNrD0IEkpIQtlVTNC7Evn9ryGI4sM0eSrPoYYjCzE+wyVSa6QPMOyFmNAs3cIlF
JKOB4z7/R62LDze/5QO9682SYE5zd7yPKyJ8MbNb3aTqaTPEnQBTztW2Rqz8GjtJ
gfLB1qg3dvU2tb7yQFlhOWsjXSSQktiE4UVM5SJvwlByG9D9Qho=
=xOSE
-----END PGP SIGNATURE-----

--2DDqrXK9TIgF6vUr--
