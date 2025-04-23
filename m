Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367426FA41;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394841; cv=none; b=Pni41TDVjuEWJ2JhvCSVgo1FVnFBZ4AYhDzxqMZoQPv88M0CluJYpwS0T5LrEZ2Rm/TnrLYkBkp19RmLSwyMsv6fpx71wWyEoLcii1zag4APfAH5fp+huLrMUYZ+poJn1V42dFvsnAdS1E2+cJJdGlielB8SMHHwUiFfiC6nG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394841; c=relaxed/simple;
	bh=v7rNe7nvrKZC9xeVLWg4sajLhvuKnW8g13iiuAlRy0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Laut9+tWuU1eL5jb+uZITKtn+ltnkGC/3qlW5ELd34Ye83uTxT2UE8MyaIeDyH9YwXkfMgzCRPZHN/Mg0l+V/j9irtrpJ/zws+WVStHYcSYs0q2ddrWOhwaknglh88ZwH48p8tu2gN/0dm40R8PJJJlJ6dcBl2huJCtKfRJOivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcoAG/Ea; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcoAG/Ea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5F5C4CEE2;
	Wed, 23 Apr 2025 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394841;
	bh=v7rNe7nvrKZC9xeVLWg4sajLhvuKnW8g13iiuAlRy0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=gcoAG/EakeRu4xIJsNGLcFvYpG6bri74lrJc4kE4urHhx5i2BgE+zpSj3EKJgoqfb
	 9RLg+F7f+GbWG4KAR9CpIxTLZwc8b6Budo/7/Fh/7Sfq4FGzhZIEiQcAk+ujDno1H1
	 rF2XXFwmOiwhFp7BdsjgLWWxi2DTit3a/+BUsJ+fAi5hjYUmDwh4KfaZDsDv3b/68N
	 KMGdZSwS6bfMGHZHPpwa88qnl5e/Mo2etRphJmwUKRESJ+YBFALh3xDbzEIf1qT7jT
	 n5UoFoZdrp6zwKyFRSsV5axpO/XVS/sQQ8WC9Qy5aL+F+OBs+aqlod9iNiUL/2u+uM
	 AMKW87Knd3GrQ==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	liujing <liujing@cmss.chinamobile.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/28] ALSA: Phase out hybrid PCI devres API
Date: Wed, 23 Apr 2025 09:53:18 +0200
Message-ID: <20250423075346.45907-1-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Add RB from Andy
  - Remove ASoC patches, branch out this series for Alsa. (Andy)

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

Philipp Stanner (28):
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

 sound/pci/ali5451/ali5451.c         | 2 +-
 sound/pci/als300.c                  | 2 +-
 sound/pci/als4000.c                 | 2 +-
 sound/pci/azt3328.c                 | 2 +-
 sound/pci/ca0106/ca0106_main.c      | 2 +-
 sound/pci/cmipci.c                  | 2 +-
 sound/pci/cs46xx/cs46xx_lib.c       | 2 +-
 sound/pci/cs5535audio/cs5535audio.c | 2 +-
 sound/pci/echoaudio/echoaudio.c     | 2 +-
 sound/pci/emu10k1/emu10k1_main.c    | 2 +-
 sound/pci/emu10k1/emu10k1x.c        | 2 +-
 sound/pci/ens1370.c                 | 2 +-
 sound/pci/es1938.c                  | 2 +-
 sound/pci/es1968.c                  | 2 +-
 sound/pci/fm801.c                   | 2 +-
 sound/pci/ice1712/ice1712.c         | 2 +-
 sound/pci/ice1712/ice1724.c         | 2 +-
 sound/pci/intel8x0.c                | 2 +-
 sound/pci/intel8x0m.c               | 2 +-
 sound/pci/lx6464es/lx6464es.c       | 2 +-
 sound/pci/maestro3.c                | 2 +-
 sound/pci/nm256/nm256.c             | 2 +-
 sound/pci/oxygen/oxygen_lib.c       | 2 +-
 sound/pci/riptide/riptide.c         | 2 +-
 sound/pci/rme32.c                   | 2 +-
 sound/pci/rme96.c                   | 2 +-
 sound/pci/rme9652/hdsp.c            | 2 +-
 sound/pci/rme9652/rme9652.c         | 2 +-
 sound/pci/sis7019.c                 | 2 +-
 sound/pci/sonicvibes.c              | 2 +-
 sound/pci/trident/trident_main.c    | 2 +-
 sound/pci/via82xx.c                 | 2 +-
 sound/pci/via82xx_modem.c           | 2 +-
 sound/pci/vx222/vx222.c             | 2 +-
 sound/pci/ymfpci/ymfpci_main.c      | 2 +-
 35 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.48.1

