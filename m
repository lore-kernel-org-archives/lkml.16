Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881F1BF58;
	Fri, 28 Mar 2025 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168294; cv=none; b=YuXQFKXoikpr6F3zGdO1rJVLhazmmx4tgwvlRAmZQAPmrdkq3E8ZczHuzurii26OjXnGFYwVtF1hlp5jO8KJtOpY55IYRzNOC2G+qSXtHVhZNxUmvAlx5briI7ZejvFD1iX7tLbary2jAvAkpUh4zhHbBSHAq1juEjOFAS/RF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168294; c=relaxed/simple;
	bh=WSObgTkF+E2dr2L1mXFz2WApNz64YdSf+ZrEObN7xJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hO/nvDSlIjON2/o1WMdMidxhqB4YJyzBI4UCrK5V5RkJ3Fhxt+pCCGXkbY6/erdxcpy06cdADZ3ek9FqfnprVdUEQ1VK/Q9uz8DzSqRTFcgcfrbZb20L1h4Ak93veIEZQ4THgB6UkpWBnl1RO8fSYmw+5PpS8oetTsB+2SeMPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i05zYq6y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i05zYq6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88E5C4CEE4;
	Fri, 28 Mar 2025 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168291;
	bh=WSObgTkF+E2dr2L1mXFz2WApNz64YdSf+ZrEObN7xJk=;
	h=From:To:Cc:Subject:Date:From;
	b=i05zYq6yqyePiUY5WxQZCMWJaQQMpsb9CXWH3Ul6Wbep2TNQol4+OdGpOMewUi1Uf
	 t9g+zvejxy01ONnAAYBo9ZAIJfjzKqThbqRMgJFa7YAeP3XruAfXPhI2kNbYQbbCtD
	 WucbNrewBZ7RqbJgMXElb5ny3u4WaGmwsj4+vZlBowJll49in/HPstD+99hEI7jGPG
	 eEwUErZZcqftlrwsbgYEeuc+oGfMvcFN7k2v8aRlKdZA+fOU02UYiDQkVekMXE5kXV
	 REmRxiklrgm07gvrZHJVW/JIONW8PafIarLZZr8/7OotFx0pm1ugR4+4qfA/z+wuse
	 huEULPIK/ToHw==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda-sdw-bpt: select CONFIG_SND_SOF_SOF_HDA_SDW_BPT
Date: Fri, 28 Mar 2025 14:24:32 +0100
Message-Id: <20250328132438.1024742-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver fails to link without this:

ERROR: modpost: "snd_hdac_ext_stream_start" [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
ERROR: modpost: "snd_hdac_ext_stream_clear" [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
ERROR: modpost: "snd_hdac_ext_stream_setup" [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
ERROR: modpost: "snd_hdac_ext_bus_link_set_stream_id" [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
ERROR: modpost: "snd_hdac_ext_stream_reset" [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
ERROR: modpost: "snd_hdac_ext_bus_link_clear_stream_id" [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!

Fixes: 5d5cb86fb46e ("ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire BPT DMA")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 41cb33fe98fb..7e92aa2f7e39 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -351,6 +351,7 @@ endif ## SND_SOC_SOF_HDA_GENERIC
 
 config SND_SOF_SOF_HDA_SDW_BPT
 	tristate
+	select SND_HDA_EXT_CORE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
-- 
2.39.5

