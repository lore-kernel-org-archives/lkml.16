Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596142110E
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747500449; cv=none; b=Ug/AYncsSespjJwvXniX5wvwuRCT2P6qQNRE275VzjntX1PQuq11kTLj2UaXAk3OVtR7/QtjIdd8gulAeRu6UklBbLkBmBL76KdBii5U4inDpcYVGIdcm0Al1nD4EHU5G9ZZgZ27ut5IDrSkHijP+29YpBZQep1Fxg2H0LAOD5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747500449; c=relaxed/simple;
	bh=X843EsW90SQPIktSdsGG4bH24rc8i/BN+we0DJIQWjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pz8iyhYheiFrzxDLlTuTkvQowUBycWDqxK+7V5ZgO6C+rydmqJ5r+YCvH8JRfo+1yRj7/SuodJOiobEpHonSzdq1elg8KOOhl3AvwqU7R5aw4q1PSEjgzObR8o9INLj8Hz5u2xOOkULLQqRDNe2PIog7kp3T1C0gZ0GMJR637TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwKJsu4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwKJsu4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B159C4CEE3;
	Sat, 17 May 2025 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747500448;
	bh=X843EsW90SQPIktSdsGG4bH24rc8i/BN+we0DJIQWjI=;
	h=Date:From:To:Cc:Subject:From;
	b=CwKJsu4xwy+b+NuIHWm7v3jbPajQ2e1PHmbYDe4N/j89IZL0EgIEWuJP9PciFr60+
	 3MYkbhRWuNsEb7A+Pj4GhbNcoEFOO+/1Vq6vgY9y/l8expkW206H744mOWp2JaUkCE
	 DwSb3zMfRIDlTMJS/pM0rUvpceUpzziDQBwnPISUD8+eEj4hZb88w0d2Nf13U0zG4c
	 JUyBP3hjGjTRNQd+AQteX+hkoZvBNf2M1Yu77OZOHnk2/ugoDI0IRaItqUwsNlhGZs
	 m30PDtJIpX4cNDMQs+/DF90TVkmo6jixkXeefBikW/rU9gJ1I8lLuEFhgLGyWsd+vO
	 oGW3LYbYG2DvQ==
Date: Sat, 17 May 2025 17:47:25 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Generic phy fixes for 6.15
Message-ID: <aCi9nYPCxxtrO9g5@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9MyRx1ZPY5576eo/"
Content-Disposition: inline


--9MyRx1ZPY5576eo/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello Linus,

Here is Generic phy drivers fixes request which contains of bunch of
renesas fixes and few smaller fixes in other drivers.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-=
fixes-6.15

for you to fetch changes up to b2ea5f49580c0762d17d80d8083cb89bc3acf74f:

  phy: Fix error handling in tegra_xusb_port_init (2025-05-14 12:28:43 +010=
0)

----------------------------------------------------------------
phy fixes for 6.15

 - Biggest is Rensas fixes for unbind ole detection, irq, locking etc
 - tegra fixes for error handling at init and UTMI power states and
   stray unlock fix
 - rockchip missing assignment and pll output fixes
 - startfive usb host detection fixes

----------------------------------------------------------------
Algea Cao (1):
      phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error

Claudiu Beznea (5):
      phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
      phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
      phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driv=
er data
      phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
      phy: renesas: rcar-gen3-usb2: Set timing registers only once

Dan Carpenter (2):
      phy: rockchip-samsung-dcphy: Add missing assignment
      phy: tegra: xusb: remove a stray unlock

Geert Uytterhoeven (1):
      phy: can-transceiver: Re-instate "mux-states" property presence check

Hal Feng (1):
      phy: starfive: jh7110-usb: Fix USB 2.0 host occasional detection fail=
ure

Ma Ke (1):
      phy: Fix error handling in tegra_xusb_port_init

Nitin Rawat (1):
      phy: qcom-qmp-ufs: check for mode type for phy setting

Wayne Chang (1):
      phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking

 drivers/phy/phy-can-transceiver.c                 |  22 ++--
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c           |   3 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c          | 133 ++++++++++++------=
----
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c |   2 +-
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c |   2 +
 drivers/phy/starfive/phy-jh7110-usb.c             |   7 ++
 drivers/phy/tegra/xusb-tegra186.c                 |  46 ++++----
 drivers/phy/tegra/xusb.c                          |   8 +-
 8 files changed, 132 insertions(+), 91 deletions(-)

--=20
~Vinod

--9MyRx1ZPY5576eo/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmgovZwACgkQfBQHDyUj
g0dG7A//bGs1bjFqL8XbUD3HTw+YnyhBS4GlHqYMxFF05PSpONpc1hZ16EtTr9dX
IIS/8Z6L+eX5bsYgfoK0vVMUjn2oGfkspa+MpsUkIsXwyfkbEAYn8LJpb4AJtP9R
WGOu5nYF9pN6iFQL0xvobaVu0DR0tfcCMk0I+cLwvMZxd14/b6OMsTlfkhTNd76j
sEXVdK2y5R+y/b5+1ftwvi5I1nKOB/dAXdJ6UW3CUvz1IYHEzG0UXjsNNcSe/Mf4
jBgKye84ulVBNBVVwZ02mmmWuqdtHx72ij0EVidRLf/NJYh7xgSrH7EGFZiOOIfR
a31RAh53Z/MrCpisDEKL+Wg2jfL+SoRf1gOAi/7qlqOnMIC1ycUdbZEKbUe9Q+kh
loxSRFrswfmd83BUAPPscRVOjAYU7+RebrOEk73niSCzJTwVKbgBL32R4BJnMypR
vB4QsLZRvdLd8Ae7jOH+Jv1bv3ZMwxY7FNewX34odF0mPYuAgqZMZqhxH5fWtq1I
IbQlZbD2GNhc3OAXLGa8wNORbPZ7wuzzeCasmOqHyO0yCUafAGttRJuqAgZ3d/bG
Nj/W1dINBWOXi5Kj3PDqjbe/aBlMt0rFZccWmCXgyqATOW6JoE6tq6jXq5DLg7Uh
EULbl7Zfd5jsTzn/1VD5kTBcHyuInQl9wyyDMdtgsqFx75d5aNA=
=0dOB
-----END PGP SIGNATURE-----

--9MyRx1ZPY5576eo/--
