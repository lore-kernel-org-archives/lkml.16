Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92321F76A5;
	Tue, 29 Apr 2025 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912151; cv=none; b=Hr2hltT5JUm04Pw+Egf03onR1mSD0I3qrKm/z0e+44a0ab2v1Bc+7NA2qvzP7A4omsAiyX3Ljx0ia2WQiwpbCEqAzHF/oY183FTfHwiWYJlYbZK9HwAXF0ug25FMiN/cxktXYimcub0jg4EQx5GVdnzBmSdpLUHEXLbEVnXLhhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912151; c=relaxed/simple;
	bh=9qJd3nnSIWnEZ8xA0Z8ykHdUGo4HyIr2IG/NC9lnz/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CkhgNHymemABPYEXBRGqtVFGn1zk1wn4bAILEKMffDwF3O/3MNu3wSAqHe8eqnJ/G7ZROvKJbHBiihtd8UmpnJY8MA5dAucxFoX4dP0VraD+DNNHxipu3hWcUZ62GkB++/u3d7Pr5sdViOSLgUxrT65I9DZ0UgxTeLGtVs8QM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pK+DLff4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pK+DLff4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09B9C4CEE3;
	Tue, 29 Apr 2025 07:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745912150;
	bh=9qJd3nnSIWnEZ8xA0Z8ykHdUGo4HyIr2IG/NC9lnz/A=;
	h=From:To:Cc:Subject:Date:From;
	b=pK+DLff4/1kRJgs+qzTPdunjYIVth/wLoG0vbVYY0J0l+KWhCtzuDuu2Vuxnz8h+u
	 QCoAGrR06/xoJRne4Qi65DlmRX03EI4CSQx7iF9FXP5m/qNFWEbsHCd14gkxYHNknK
	 EkuxxzWcm2EIyGt/k5p7FuDmBr1AuyS4984dx0WIu1dwrGqMVkxWxCC9tCAvMZ1qSO
	 YPGexBZto3DGQEjwEbbQn5uCm5YENYgkMsZzBA9FGTRuY4NlS0ZnKTQWi317h7jbX1
	 h0Tx1vvx28K3xmOsB5zyjf+vdwPnLkQwmHuZKRLbWwiS6ngRRBwMFx9weCLP5KaTyH
	 01bkBYtlSAhog==
From: Arnd Bergmann <arnd@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: catpt: avoid type mismatch in dev_dbg() format
Date: Tue, 29 Apr 2025 09:35:19 +0200
Message-Id: <20250429073545.3558494-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Depending on the architecture __ffs() returns either an 'unsigned long'
or 'unsigned int' result. Compile-testing this driver on targets that
use the latter produces a warning:

sound/soc/intel/catpt/dsp.c: In function 'catpt_dsp_set_srampge':
sound/soc/intel/catpt/dsp.c:181:44: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Werror=format=]
  181 |                         dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",
      |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change the type of the local variable to match the format string and
avoid the warning on any architecture.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/intel/catpt/dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 5993819cc58a..008a20a2acbd 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -156,7 +156,7 @@ static void catpt_dsp_set_srampge(struct catpt_dev *cdev, struct resource *sram,
 {
 	unsigned long old;
 	u32 off = sram->start;
-	u32 b = __ffs(mask);
+	unsigned long b = __ffs(mask);
 
 	old = catpt_readl_pci(cdev, VDRTCTL0) & mask;
 	dev_dbg(cdev->dev, "SRAMPGE [0x%08lx] 0x%08lx -> 0x%08lx",
-- 
2.39.5

