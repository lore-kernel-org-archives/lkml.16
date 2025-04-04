Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E863FF1;
	Fri,  4 Apr 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769176; cv=none; b=A4MoGk7DGh98xUAnkFLvM1U/maCgnlukmu7wfFosFH8UhSwg/MZ8ouQaflo1Y1iJ0TgN7J2FhWmYSKBkoHFggNJRd1NCWbc/b53aoPj+Q/xe7tdjvUyX4TEiHN/48tWCwklifFUa+8ECnc1KEyjjq3URlQZgYkI7OkNEDuScMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769176; c=relaxed/simple;
	bh=qv2dfIayO3aajasouaLXJ1qNCkHSABufGFzjHyybaKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t21iCX5TYFvBlCDu0TvXSCjW2bYxMa5aMDgjwwYONWYIw2Cp8RA3q+mNEoYZfZ24IEVcHLzTVHNRx8kSAAtZ+biU5B/XHyarepO/vxlDAvt6YeDrjN8Jf0hH7wHzEqSZVaZCX9ElEAAPs2Yf+zQioU2GlDIPS3kxjA3Eim05m90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odSYmlS5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odSYmlS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71264C4CEDD;
	Fri,  4 Apr 2025 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769175;
	bh=qv2dfIayO3aajasouaLXJ1qNCkHSABufGFzjHyybaKo=;
	h=From:To:Cc:Subject:Date:From;
	b=odSYmlS5sIzx7pUqXvldeSEkr8R96hSEYv/xhez0bvjMjj8ACW1i+a1+3SsDIlpYV
	 wEANMWo8+ZZtzm9kYhKAOLc/9xvFUIc8DZubUMGywzAFaJRJhp1l1zzvfeWGf/1eRl
	 osVMTffTnnJ/F5wHrsn7NV373vVipk7+sfbUGDd5DAL0lzypdIMSn1R8xJ/w/Ocxnj
	 6cxfqi/YQKgop03hc4aImm0GA+OluNSRAfCWn1ibZ9gTLxryX9b7y5iE+2fLio9+qj
	 62Lj9FvVqZ1lNh+Xlio2FXEpBmFfLf3/zCEtP5gCvF1vj4FPldXQA5GewrWo/WbAz2
	 350BDSMjqA3fA==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Philipp Stanner <phasta@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	He Lugang <helugang@uniontech.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] sound: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:01 +0200
Message-ID: <20250404121911.85277-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions() have been deprecated by the
PCI subsystem. In sound/, they can easily be replaced with
pcim_iomap_region().

This series was around some time in late summer last year as a single
patch. I lost track of it for a while, but Takashi Iwai (AFAIR)
requested that I split it by component.

So that's being done here. Feel free to squash the patches as you like.

P.

Philipp Stanner (11):
  ALSA: ad1889: Replace deprecated PCI functions
  ALSA: atiixp: Replace deprecated PCI functions
  ALSA: au88x0: Replace deprecated PCI functions
  ALSA: aw2: Replace deprecated PCI functions
  ALSA: bt87x: Replace deprecated PCI functions
  ALSA: cs4281: Replace deprecated PCI functions
  ALSA: hda_intel: Replace deprecated PCI functions
  ALSA: cs5530: Replace deprecated PCI functions
  ALSA: lola: Replace deprecated PCI functions
  ALSA: hdspm: Replace deprecated PCI functions
  ASoC: loongson: Replace deprecated PCI functions

 sound/pci/ad1889.c                    |  7 +++----
 sound/pci/atiixp.c                    |  7 +++----
 sound/pci/atiixp_modem.c              |  7 +++----
 sound/pci/au88x0/au88x0.c             |  7 +++----
 sound/pci/aw2/aw2-alsa.c              |  7 +++----
 sound/pci/bt87x.c                     |  7 +++----
 sound/pci/cs4281.c                    | 13 +++++++------
 sound/pci/cs5530.c                    |  7 +++----
 sound/pci/hda/hda_intel.c             |  7 +++----
 sound/pci/lola/lola.c                 | 16 +++++++++++-----
 sound/pci/rme9652/hdspm.c             |  7 +++----
 sound/soc/loongson/loongson_i2s_pci.c | 13 +++++++------
 12 files changed, 52 insertions(+), 53 deletions(-)

-- 
2.48.1

