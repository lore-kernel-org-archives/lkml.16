Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3437C266581;
	Wed, 23 Apr 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396955; cv=none; b=ouCT7zlejux0eR5tmhJUDfBR+DRWF3hHVrAgGZdbbq/wgBdmePTOeB1PaqriwZbG2dJGI+ld4exBeBiqJDSSRqDXXGW+MBi2mvEWZQ8xaxtTZZyVNV57eV+aTia+elK5YEpTSmKwV5Vk+ssvUPFmozV8qYimahLemqUhnMNBviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396955; c=relaxed/simple;
	bh=O/56kKLlY/pTxNgzDYpnZflKad4C8ez8hIW5zhubFlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSWGXzqPsF8mbZe8Tz3EVYnc3lKA44AFsV5ABMDzEbcWX6kOwjNw4JqAJAs+iEixaoP3HZEpe4JchYLWAmfwjz+JccTlcxs+SI1md6OywXVb6bUh/+73/WKwmN1qL83yc8Gx7hSamVvNQDZCI9NVoFj+Oq8ikcF2Li2laZxlu84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+Myr4aH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+Myr4aH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3777C4CEE2;
	Wed, 23 Apr 2025 08:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745396954;
	bh=O/56kKLlY/pTxNgzDYpnZflKad4C8ez8hIW5zhubFlw=;
	h=From:To:Cc:Subject:Date:From;
	b=a+Myr4aHs1zwy1PzvzyhbOqN0hzQ6QfR7PXcCYyyFz4e99Aa9UTEvgG8mpT2fs2D6
	 W/uPt25QUMpHrVs3T5l+q2ay6kBQBk0OdScYDc50xyMViH75ysgJVivY5WKmmi0xsH
	 YGyOQ9zCSdhszmAjcr7UrHRaroqS19EyWeyRRO/4KMeZbCfyZ44+Ri7wkQXtcaYfoR
	 f1UXh4sH8osBt/1u9/VDV33HmebaGxXNw9CH99U7qglw+xbDnYWiO3NtMbTgqGcUZm
	 hyuXX59SnP5VA13WaxWlUoie++fZhJYVkMIerX3Orgaw58BGrfE2vISxqB4PSIwbWk
	 nz8JnmZ+aB7JQ==
From: Philipp Stanner <phasta@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v2 0/4] AsoC: Phase out hybrid PCI devres
Date: Wed, 23 Apr 2025 10:28:55 +0200
Message-ID: <20250423082858.49780-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
  - sof: simplify return. (Andy)
  - intel/atom: simplify return. (Andy)
  - Send a separate series for AsoC. (Andy)
  - intel/atom: Add another patch that switches EINVAL to ENOMEM. (Andy)

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

Philipp Stanner (4):
  ASoC: sof: Use pure devres PCI
  ASoC: intel/avs: Use pure devres PCI
  AsoC: intel/atom: Use pure devres PCI
  AsoC: intel/atom: Return -ENOMEM if pcim_iomap() fails

 sound/soc/intel/atom/sst/sst_pci.c | 58 +++++++++++++-----------------
 sound/soc/intel/avs/core.c         |  7 ++--
 sound/soc/sof/sof-pci-dev.c        | 16 ++-------
 3 files changed, 29 insertions(+), 52 deletions(-)

-- 
2.48.1

