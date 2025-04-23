Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C58D27056C;
	Wed, 23 Apr 2025 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394961; cv=none; b=jRt7DvBXEKvkPq3ytEYJR0gk84H58rCzdlGXQNx/HJMQvnz0stowEOyTjCH2WRxdb+rWYAmLO7jb1abljP8nWWK4CWvVp49dn8y4buXIDM7185ouyLZRRVyEEAfuBYT2+byfFxP1sQU2T7IGX5YLIYvO8Fps9mb/HIt6qiVix3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394961; c=relaxed/simple;
	bh=YbeGJwJcAGjAdYjyTvpCClUTJ2o/Qzlqprcetq20FfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRELuhEMuhp4zXF10E1T2QarogLVUA2wPHdmiOiv/pxStS0P9WANSw25s+dZtHBq0T0Vgl6uUHe3sKEmvzuwBazCv5JSRmuVQiSUfu/xF9CNwDcjhfIc+3OlvjoiI7URFhNH/kvgbtmVnsj+R28IVhzxkqmZz8QoQE9h5Thl3gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObLdY3m0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObLdY3m0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9877CC4CEE2;
	Wed, 23 Apr 2025 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394960;
	bh=YbeGJwJcAGjAdYjyTvpCClUTJ2o/Qzlqprcetq20FfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ObLdY3m0oQY3GuzW9JfU9eL8oPqLm80oJi+Ezh77oS2yn4fnpWi5n/yLMVoQng1Va
	 GVcc83hBWaBf8CZnJkYEFYFZL/oOzHA8r398xBJLrgRmSf0gjQ8GxlkLpRc1BjGF7X
	 IFu7Pj+82gnSd3RHR/1wTa0Sugj/WJJTYwpNeFE6VWbNdLX5PUxHOVae7NCSD2VuII
	 3wEzGRhnbxbSF5nTJDh1EL9sqc4uiVhGBHX8SgPVGxIx3tulXOMRiuYIJ/tow9qFjA
	 p8zZM7zPdQJwcuI8i6BSrNL8Fih5TBDKwnCP2h4BfrZ2sEpSs0rNSOAKqFuGjP/7L4
	 096K8e4hOYQNg==
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
Subject: [PATCH v2 21/28] ALSA: ice: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:39 +0200
Message-ID: <20250423075346.45907-22-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423075346.45907-1-phasta@kernel.org>
References: <20250423075346.45907-1-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_request_regions() is a hybrid function which becomes managed if
pcim_enable_device() was called before. This hybrid nature is deprecated
and should not be used anymore.

Replace pci_request_regions() with the always-managed function
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/ice1712/ice1712.c | 2 +-
 sound/pci/ice1712/ice1724.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 3b0c3e70987b..a8ac14887676 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2502,7 +2502,7 @@ static int snd_ice1712_create(struct snd_card *card,
 	pci_write_config_word(ice->pci, 0x42, 0x0006);
 	snd_ice1712_proc_init(ice);
 
-	err = pci_request_regions(pci, "ICE1712");
+	err = pcim_request_all_regions(pci, "ICE1712");
 	if (err < 0)
 		return err;
 	ice->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 1dc776acd637..be22b159e65a 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2491,7 +2491,7 @@ static int snd_vt1724_create(struct snd_card *card,
 	pci_set_master(pci);
 	snd_vt1724_proc_init(ice);
 
-	err = pci_request_regions(pci, "ICE1724");
+	err = pcim_request_all_regions(pci, "ICE1724");
 	if (err < 0)
 		return err;
 	ice->port = pci_resource_start(pci, 0);
-- 
2.48.1

