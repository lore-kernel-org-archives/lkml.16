Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCE923AD;
	Mon, 26 May 2025 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748230257; cv=none; b=UdGh+Jb/AjTOVJj9EzTQc+01+HoAZBkvvtkAnMMP2ysmVnr4efdDywJdilOKB5RFrI0ksu5Dv3A5+jAcCzdJzm1sZL6oV7h4raSUxluLPoFXOmiVIINFePBjQPupUUR/vJxLBwTdKR/obC3aY8F+21HFw4Qgfr+wrAtxW5NTl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748230257; c=relaxed/simple;
	bh=+695SWuUV+nf0BkQytAY5/NxwnTiJICMPPCxZJa6Se8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVtbizb2yLX0f7Bw4lB3hp8xMjlSmmQMDhPYluwCLV9TpqvDjqkaAVk102f+v49n854tv3/2BRXFbZsGz6P8Ei/dgUF+A5Im6SD/GPuizGaDPigxWLJydK2JK01gA09JnF3bJdJqJTF3anNX66evwmJIvVIJ2CaKVWBNPQPnUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUtZwsFm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUtZwsFm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5698C4CEEA;
	Mon, 26 May 2025 03:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748230257;
	bh=+695SWuUV+nf0BkQytAY5/NxwnTiJICMPPCxZJa6Se8=;
	h=Date:From:To:Cc:Subject:From;
	b=dUtZwsFm6wttKTIAAPsNp6s2CtVRB/XmiO+XlEoArTZqfoI+BeOYUe9kNqtd9+3Vw
	 dVFi3Uf7tdX+xa+flWVWA46nGFPT1cSUVcaqD3PkcRwCw2YEFfqYsSL05ehyvIPr7z
	 L5BG0AkRk2TYRucSQX3x6dr0Lkdr04FLNfjtZRfD2dwNXmANQvtpucn9HPNb2QRDbx
	 /VPJRQtMd4xVZS8m8KGxoYD88bIzybUcH7tI3o9ts8Xw8ORFEYkZz0LPXBg1GELqyJ
	 F0LQVGt4ymNiDqqMFCw3MJb9RO1kR3RgZHVRWLpsWrckA0aFUv16+6+7MVHIExdrRy
	 znecdQfyGc9yA==
Date: Mon, 26 May 2025 03:30:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, tzungbi@kernel.org
Subject: [GIT PULL] chrome-platform updates for v6.16
Message-ID: <aDPgbocE_8nImDG4@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BhZXAuU3KidFhc6K"
Content-Disposition: inline


--BhZXAuU3KidFhc6K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform updates for Linux v6.16.

Thanks,
Tzung-Bi
------

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.16

for you to fetch changes up to 3e552ccf405c0dea6339988202a564357249c437:

  platform/chrome: kunit: Avoid -Wflex-array-member-not-at-end (2025-05-07 03:04:29 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v6.16

* New

  - Support MT8192 Spherion and MT8186 Corsola devices in of_hw_prober.
  - Turn cros_ec_proto from bool into tristate.
  - Support Pin Assignment E in cros_ec_typec for USB-C to DP cables.

* Improvements

  - Avoid -Wflex-array-member-not-at-end warnings.

* Cleanups

  - Remove a redundant dependency in Kconfig for cros_kbd_led_backlight.

----------------------------------------------------------------
Benson Leung (1):
      platform/chrome: cros_ec_typec: Set Pin Assignment E in DP PORT VDO

Chen-Yu Tsai (2):
      platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
      platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle

Gustavo A. R. Silva (4):
      platform/chrome: cros_ec_proto: Avoid -Wflex-array-member-not-at-end warnings
      platform/chrome: cros_kbd_led_backlight: Avoid -Wflex-array-member-not-at-end warnings
      platform/chrome: cros_ec_debugfs: Avoid -Wflex-array-member-not-at-end warnings
      platform/chrome: kunit: Avoid -Wflex-array-member-not-at-end

Laura Nao (1):
      platform/chrome: of_hw_prober: Support Google Spherion

Slawomir Rosek (1):
      platform/chrome: cros_ec_proto: Allow to build as module

Tzung-Bi Shih (2):
      platform/chrome: cros_kbd_led_backlight: Remove CROS_EC dependency
      platform/chrome: cros_kbd_led_backlight: Fix build dependencies

 drivers/platform/chrome/Kconfig                   |  5 ++-
 drivers/platform/chrome/Makefile                  |  3 +-
 drivers/platform/chrome/chromeos_of_hw_prober.c   | 33 ++++++++++++++
 drivers/platform/chrome/cros_ec_debugfs.c         | 52 +++++++++--------------
 drivers/platform/chrome/cros_ec_proto.c           | 24 +++++------
 drivers/platform/chrome/cros_ec_proto_test_util.h |  5 ++-
 drivers/platform/chrome/cros_ec_typec.c           |  6 ++-
 drivers/platform/chrome/cros_kbd_led_backlight.c  | 24 ++++-------
 8 files changed, 85 insertions(+), 67 deletions(-)

--BhZXAuU3KidFhc6K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCaDPgbgAKCRArxTEGBto8
9AKiAQCf6Wt5a46IUfvAbthTVVEHPUHFWhH5X6bI6TYDdd7jggEAn58TDrTIyp9n
pTInq1nUz/5dSI1S+lXXfKedw/LCDQA=
=b7UU
-----END PGP SIGNATURE-----

--BhZXAuU3KidFhc6K--
