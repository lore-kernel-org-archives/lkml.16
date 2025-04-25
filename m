Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55B2356A2;
	Fri, 25 Apr 2025 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569073; cv=none; b=PvbrIjNrOcKTXFOMATH+3R0TAnFHU7IDUKhoGQzoI/TBkMzd+Ys4gQCLKs9VgRE3cIWyeIRLjX22S7D2j3MpB5MtkgmX5jlsQOc4ygthdVCgT412Zn+KVku3fTTGBez0h8FDqdo2Be4F8zR2Skrsi8NsuDzkfUe1AmuBgeww1oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569073; c=relaxed/simple;
	bh=WpwWKRJr1JlzgpUrnmqNWxSCeyZ0M65DMFmMraoBV4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e65Nf64Ow7RISNLCITnnH529rkp7Q6zabQBomBI8xq6ybJqvS5GrBF7xyWqrgVBX6vf1FwnyQW46WfosxtS0wtETx+Ycl0AIQGRq8B+gPGZTl/4g7qEzIFOs5+/OFCyc9UkxojvaEVSH5JuAmME/TKgxPJPY11NZWn7l7XvpYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/WmELJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/WmELJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85563C4CEEE;
	Fri, 25 Apr 2025 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745569073;
	bh=WpwWKRJr1JlzgpUrnmqNWxSCeyZ0M65DMFmMraoBV4g=;
	h=From:To:Cc:Subject:Date:From;
	b=D/WmELJB9FL0rqxBlCWZhH9Rlr1FIoGe55MXWcpcE2fj53lLZFB8FQzygT/6MR1xj
	 csoIHRbQJVFyjaO2sVjp1NoLTLQvu1SO+MGSWSQVrB7rEo5VZQwza10bOcgTn10NPB
	 7/CqomeIv0A1ac7Bhwsj4h7/xWscLvhDvdB5eN/93e7PHnl7yTwlzDy+bieE21Fe5Y
	 rv70Lu+cddGjtq7TmYqaLQdzO5qGcCPtHulXdhtpqEZW7tFDF2ANCohqqot786dP6g
	 YRA2exi4TKf5fKMxKRDzvw8KhTYM0ep+apaO+KyuNXGn+WftuY8T2hSi+fouBgDtFh
	 PJZ4gLS3pt4AQ==
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
	Damien Le Moal <dlemoal@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v3 0/4] AsoC: Phase out hybrid PCI devres
Date: Fri, 25 Apr 2025 10:17:39 +0200
Message-ID: <20250425081742.61623-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
  - Remove two forgotten calls to pci_release_regions(). (Amadeusz)
  - Adjust commit titles to common format. (Amadeusz, Cezary)
  - Apply RB by Czeray (not everywhere, two patches changed, see point
    1 above)

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
  ASoC: intel: avs: Use pure devres PCI
  AsoC: intel: atom: Use pure devres PCI
  AsoC: intel: atom: Return -ENOMEM if pcim_iomap() fails

 sound/soc/intel/atom/sst/sst_pci.c | 59 ++++++++++++------------------
 sound/soc/intel/avs/core.c         |  8 +---
 sound/soc/sof/sof-pci-dev.c        | 16 ++------
 3 files changed, 29 insertions(+), 54 deletions(-)

-- 
2.48.1

