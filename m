Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCAE132122;
	Wed, 16 Apr 2025 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809180; cv=none; b=nIo+vqbhKQ+d1ptbK9TM9uZefaSzW3invdRtoV81pA5xMzaO/7ojK4lxZqZ+io2CkhQZyx5esKHeIlAHqn+iIeTeLvqA+i7n1q1bVuNypSZ7Nx2W6QPNPBoZKzbB5xU2uDmCrNdTb7c19cmKZupOm3wTpBfYUimf0l7N6+pIkqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809180; c=relaxed/simple;
	bh=vOplle/cw7iOUMDr1vcbvvGKgf8BpF0EY+2t0w1fAr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nz3lCTCDgkkh17Akgj5Argps888hn9bt+y/gwkYgsiP/ePi0mTyh8EGGf9ZMbpQDzXDeLklD4ggJbXgGTDC7A5EQJDEPESI4/CRqRHXb7H/HaCooS3ukDUekB32VqMAiUiqE8JOkOU1jDpHU/gj+6GGw6cab/YGM4OtCywhGzGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRlV4GSQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRlV4GSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A09FC4CEE2;
	Wed, 16 Apr 2025 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809179;
	bh=vOplle/cw7iOUMDr1vcbvvGKgf8BpF0EY+2t0w1fAr4=;
	h=From:To:Cc:Subject:Date:From;
	b=HRlV4GSQy8ID5V9b9IEN0fJi/09uokDzpDcw92tNgFCpFAHRLIh2+gNb7KxJ0ryff
	 myR6gMXsiWJVb9eZRsFZHXpVmULfM5e8Cu+OeuhhOjOc21+fGaAV/1hETbuVH8CeC6
	 upKcvIGnQ6NsDhuk778sO9H8w6908Zdz8ESTbT1OlBSPQAZ1MdWHTBkK7TDB7Eb0hi
	 9DJprVKGEtC7bwyo34VKieLQcsrbjvUyv3Huk/v8gs8JNVomwgSS/Ech7Jv0aIoUXl
	 9eBp2gyHuds6uxxt9wCltEww3PCjXHrz8QEUK/FRKt/imqz6pHGo4DiwDosGhPH8PD
	 Urhl/ys2ppLqg==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	liujing <liujing@cmss.chinamobile.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 00/31] sound: Phase out hybrid PCI devres API
Date: Wed, 16 Apr 2025 15:12:10 +0200
Message-ID: <20250416131241.107903-1-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

a year ago we spent quite some work trying to get PCI into better shape.
Some pci_ functions can be sometimes managed with devres, which is
obviously bad. We want to provide an obvious API, where pci_ functions
are never, and pcim_ functions are always managed.

Thus, everyone enabling his device with pcim_enable_device() must be
ported to pcim_ functions. Porting all users will later enable us to
significantly simplify parts of the PCI subsystem. See here [1] for
details.

This patch series does that for sound.

Feel free to squash the commits as you see fit.

P.

[1] https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/pci/devres.c#L18

Philipp Stanner (31):
  ASoC: sof: Use pure devres PCI
  ASoC: intel/avs: Use pure devres PCI
  AsoC: intel/atom: Use pure devres PCI
  ALSA: sonicvibes: Use pure devres PCI
  ALSA: rme96: Use pure devres PCI
  ALSA: rme32: Use pure devres PCI
  ALSA: ens1370: Use pure devres PCI
  ALSA: cmipci: Use pure devres PCI
  ALSA: via82: Use pure devres PCI
  ALSA: sis7019: Use pure devres PCI
  ALSA: intel8x: Use pure devres PCI
  ALSA: fm801: Use pure devres PCI
  ALSA: es19x8: Use pure devres PCI
  ALSA: azt3328: Use pure devres PCI
  ALSA: als: Use pure devres PCI
  ALSA: oxygen: Use pure devres PCI
  ALSA: lx6464es: Use pure devres PCI
  ALSA: vx222: Use pure devres PCI
  ALSA: trident: Use pure devres PCI
  ALSA: rme9652: Use pure devres PCI
  ALSA: ymfpci: Use pure devres PCI
  ALSA: riptide: Use pure devres PCI
  ALSA: nm256: Use pure devres PCI
  ALSA: ice: Use pure devres PCI
  ALSA: emu10k1: Use pure devres PCI
  ALSA: echoaudio: Use pure devres PCI
  ALSA: cs5535: Use pure devres PCI
  ALSA: cs46xx: Use pure devres PCI
  ALSA: ca0106: Use pure devres PCI
  ALSA: ali5451: Use pure devres PCI
  ALSA: maestro3: Use pure devres PCI

 sound/pci/ali5451/ali5451.c         |  2 +-
 sound/pci/als300.c                  |  2 +-
 sound/pci/als4000.c                 |  2 +-
 sound/pci/azt3328.c                 |  2 +-
 sound/pci/ca0106/ca0106_main.c      |  2 +-
 sound/pci/cmipci.c                  |  2 +-
 sound/pci/cs46xx/cs46xx_lib.c       |  2 +-
 sound/pci/cs5535audio/cs5535audio.c |  2 +-
 sound/pci/echoaudio/echoaudio.c     |  2 +-
 sound/pci/emu10k1/emu10k1_main.c    |  2 +-
 sound/pci/emu10k1/emu10k1x.c        |  2 +-
 sound/pci/ens1370.c                 |  2 +-
 sound/pci/es1938.c                  |  2 +-
 sound/pci/es1968.c                  |  2 +-
 sound/pci/fm801.c                   |  2 +-
 sound/pci/ice1712/ice1712.c         |  2 +-
 sound/pci/ice1712/ice1724.c         |  2 +-
 sound/pci/intel8x0.c                |  2 +-
 sound/pci/intel8x0m.c               |  2 +-
 sound/pci/lx6464es/lx6464es.c       |  2 +-
 sound/pci/maestro3.c                |  2 +-
 sound/pci/nm256/nm256.c             |  2 +-
 sound/pci/oxygen/oxygen_lib.c       |  2 +-
 sound/pci/riptide/riptide.c         |  2 +-
 sound/pci/rme32.c                   |  2 +-
 sound/pci/rme96.c                   |  2 +-
 sound/pci/rme9652/hdsp.c            |  2 +-
 sound/pci/rme9652/rme9652.c         |  2 +-
 sound/pci/sis7019.c                 |  2 +-
 sound/pci/sonicvibes.c              |  2 +-
 sound/pci/trident/trident_main.c    |  2 +-
 sound/pci/via82xx.c                 |  2 +-
 sound/pci/via82xx_modem.c           |  2 +-
 sound/pci/vx222/vx222.c             |  2 +-
 sound/pci/ymfpci/ymfpci_main.c      |  2 +-
 sound/soc/intel/atom/sst/sst_pci.c  | 56 ++++++++++++-----------------
 sound/soc/intel/avs/core.c          |  7 ++--
 sound/soc/sof/sof-pci-dev.c         | 12 ++-----
 38 files changed, 62 insertions(+), 83 deletions(-)

-- 
2.48.1

