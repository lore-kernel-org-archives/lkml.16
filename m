Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7451EA90
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747500554; cv=none; b=SH+DXHopBMzfmxaKkcDEmlzxAb4gdGlH6bLMGdsto1p91kP71hLZjSnA5rx0xDeicsGi4ZrtCQiAfkQ+dWIOal7ykXvdgCwTGLyZWg35H6zA4xPxQ48z7n5WJ8nLemHjUHBwzrTnGK8kJWsUo5YSxgvu25fJdxaEr6Q9y2Dospc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747500554; c=relaxed/simple;
	bh=ObCO1wuvl/p0oqIvyXUQUhX+WLA8c9baP0tYpJ7fE50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVZCBfZ/omqr3i646klrgcCQo/6NhcnQ5fi7SiXt3vNWZR1FWX1WHVOqzYIUa2hEsEA/oHrasjNva4FTnYlpZ3+SaWGsFVo+O1QNVH51ApVy01dHEoB+6Cq+MMVaE8IDi3pOJxpN7PNWHaJe5xHqYkKUE9qVDbOvXbvWGtcjhUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5eZ8abm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5eZ8abm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8C1C4CEE3;
	Sat, 17 May 2025 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747500554;
	bh=ObCO1wuvl/p0oqIvyXUQUhX+WLA8c9baP0tYpJ7fE50=;
	h=Date:From:To:Cc:Subject:From;
	b=G5eZ8abmoGdd3b/KPnBXThmIsHjort9ZbcODDeeHTR7/OFWKL5VVTcgSK9p04CHU9
	 i/baoAbiQHXbh5kaylfUyZhq70SnQHe5XKWTWsuLTcC4/2IvoOL+cwrTzU12CS1g+/
	 BxFNaHQieUgAyQx5dOm3QSh2swcjVINQnKNaGXMzoRX/Q2xS8njq1LV3WCJlZ+tZvp
	 bwjrS9ZnQ+o148CJdIlddxTYCwG7KN2iCOWLDMW59fbvn7BX65X5HGxSlw7pSaOHCm
	 5HxBSEvaEVmnWXnO4EO4mmP3Cl2MavkP8eYnnCXDO74Gfqd5ZzOi7tTIUxBjSCg7kX
	 xs+RcxASilw7w==
Date: Sat, 17 May 2025 17:49:10 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: dmaengine fixes for 6.15
Message-ID: <aCi+BteelekIQK07@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SKw8+HHxUjrEuEhv"
Content-Disposition: inline


--SKw8+HHxUjrEuEhv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello Linus,

Last pull request before I catch the plane from Lisbon. This has a bunch
of idxd driver fixes, dmatest revert and bunch of smaller driver fixes.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine-fix-6.15

for you to fetch changes up to 811d6a923b40fc130f91abf49151f57cf9ac2a6f:

  dmaengine: mediatek: drop unused variable (2025-05-15 11:42:13 +0100)

----------------------------------------------------------------
dmaengine fixes for v6.15

Driver fixes for:
 - bunch of idxd potential mem leak fixes
 - dmatest revert for waiting for interrupt fix as that causes issue
 - couple of ti k3 udma fixes for locking and cap_mask
 - mediatek deadlock fix and unused variable cleanup fix

----------------------------------------------------------------
Basavaraj Natikar (1):
      dmaengine: ptdma: Move variable condition check to the first place an=
d remove redundancy

Dave Jiang (1):
      dmaengine: idxd: Fix ->poll() return value

Nathan Lynch (1):
      dmaengine: Revert "dmaengine: dmatest: Fix dmatest waiting less when =
interrupted"

Purva Yeshi (1):
      dmaengine: idxd: cdev: Fix uninitialized use of sva in idxd_cdev_open

Qiu-ji Chen (1):
      dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_st=
atus()

Ronald Wahl (1):
      dmaengine: ti: k3-udma: Add missing locking

Shuai Xue (9):
      dmaengine: idxd: fix memory leak in error handling path of idxd_setup=
_wqs
      dmaengine: idxd: fix memory leak in error handling path of idxd_setup=
_engines
      dmaengine: idxd: fix memory leak in error handling path of idxd_setup=
_groups
      dmaengine: idxd: Add missing cleanup for early error out in idxd_setu=
p_internals
      dmaengine: idxd: Add missing cleanups in cleanup internals
      dmaengine: idxd: fix memory leak in error handling path of idxd_alloc
      dmaengine: idxd: fix memory leak in error handling path of idxd_pci_p=
robe
      dmaengine: idxd: Add missing idxd cleanup to fix memory leak in remov=
e call
      dmaengine: idxd: Refactor remove call with idxd_cleanup() helper

Stefan Wahren (1):
      dmaengine: fsl-edma: Fix return code for unhandled interrupts

Vinicius Costa Gomes (1):
      dmaengine: idxd: Fix allowing write() from different address spaces

Vinod Koul (1):
      dmaengine: mediatek: drop unused variable

Yemike Abhilash Chandra (1):
      dmaengine: ti: k3-udma: Use cap_mask directly from dma_device structu=
re instead of a local copy

 drivers/dma/amd/ptdma/ptdma-dmaengine.c |  19 ++--
 drivers/dma/dmatest.c                   |   6 +-
 drivers/dma/fsl-edma-main.c             |   2 +-
 drivers/dma/idxd/cdev.c                 |  13 ++-
 drivers/dma/idxd/init.c                 | 159 +++++++++++++++++++++++-----=
----
 drivers/dma/mediatek/mtk-cqdma.c        |   6 +-
 drivers/dma/ti/k3-udma.c                |  10 +-
 7 files changed, 148 insertions(+), 67 deletions(-)


--=20
~Vinod

--SKw8+HHxUjrEuEhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmgovgYACgkQfBQHDyUj
g0effxAAgNYPwmEqgN5WUqvvjjLjLuRw8UQTrIxDi/HX2FlJROrjpv0yEuXG+Uim
gjiIIzCvHh0+OxnapdjUv343E4FPX/tFvLeN29cZkgP51x0UtLXW2zc2tAatwo+f
Tnfsn1s7LF9YofItZ/bbZy9+OkZxWkdrQ7Znhp3pLx+TwE0JAGCRAKUu0D453TvB
J+4JRz3LZcT6O9yZoC8CSNQIfLsj/dMPwsh6oM/BaIb/SuBlU69t9RDFMBcXjeLo
NQUtacEddGs5rqYFOH8RJvcb638nLsof3EOP80zoR74uDDdFjVd8PrauOqH25URl
9Eqc/6Uzga8sx3yn5Vyg1g6gyqji04QHvAAxjbruQl2lR3vdXGz3f6DWJM7ljgjK
PIwBICLVBU5Tej8zQ+sKCR5NHkIDJMsAasYGMxV+oAnEZ0Rh3nfU+qExRsaQG1Ef
apJ7VmkzHdkNyCHy+2kSsHuxtMFoXH4LPHrNtHvzs4VSGolXRnt2phon4bCPg7rM
rzCLvK5ASoi7xOzQTxMHxP4h6EcqxqhWkC6rDHH+7CyCSNjuPg7nldVymHKMGGOm
YSE9Vl69l2M3pWYzsgCxwhwroccPIOmsrB949YdjuCtasQKmmyGavE4vxPlj+TRN
mDaM8RCH8bvNLbrIhr0anBtF/uKDj8ftOM9UQZ2zmHiio0K8aj4=
=czZ7
-----END PGP SIGNATURE-----

--SKw8+HHxUjrEuEhv--
