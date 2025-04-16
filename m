Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5E1A08A0;
	Wed, 16 Apr 2025 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809220; cv=none; b=Ha8rgisY3lzyVM04mFDVGD1zv6QGGDDo/7Yp8Rf63X5qIlZTmO/MGG+SEzzHijpN8PmwAZS2h9Nwj3jiA5josUc+lja8i3YRjL5ONfTJDKdRe+RjvRHA94mXFhs+NhAVZlu4aupvOpkmjNlv0uEeekSqFfDjTT56AavxAJwOCzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809220; c=relaxed/simple;
	bh=KVveVCvbkYTGYLIKGP4ny8RasjPXhVAI8Ae002/fnac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apGh/jAA8sLXgbR550QPtdkDYom7IFt8VRiwT2pruU/yEF7yCZTeRMmH56Qr/+U58+0oTY0nK9FchJUz7yEnbLuwtm9PD/ZOziSp6ckpTw8OdELjnoCSaAxA7E88agPFYJST1yxMYoqOHYoLjP21S9jvjFcKL9pBnR+RX31E25k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNlE2OLA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNlE2OLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3568C4CEE2;
	Wed, 16 Apr 2025 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809220;
	bh=KVveVCvbkYTGYLIKGP4ny8RasjPXhVAI8Ae002/fnac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qNlE2OLAWZYFXk6wBDc2NZhs097eJXDSzmr8UjdNcV6sFjqa8mon0RH83HvioLigD
	 ynMIE/NK3vpOBnfAzn25TAv6+SThF9mW9cBLT+Or9RBI7xo1580oOuBT3xCo1h6pBg
	 wkiSQnHirztL6r9v0+Qoeahk47FjCQDcUSUxpHbCt1Thq1aiq9to2kbH8M+QeWQocy
	 jech1H7FU5ZGriT+Q0+dWAzpPuRfiSLMlnaUlyNa0tOYLJIv9CwtsyKIuF/kHL8D8K
	 WhJ9lA3Spw/Am4q9CMS3Qh0YssduK/sVYPM2ZtwulqmSfU+/JE5RRLn85ENQuV9hC0
	 wxfFoqynqgt2w==
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
Subject: [PATCH 06/31] ALSA: rme32: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:16 +0200
Message-ID: <20250416131241.107903-7-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416131241.107903-1-phasta@kernel.org>
References: <20250416131241.107903-1-phasta@kernel.org>
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
---
 sound/pci/rme32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index a8c2ceaadef5..4bf122abea48 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1284,7 +1284,7 @@ static int snd_rme32_create(struct rme32 *rme32)
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, "RME32");
+	err = pcim_request_all_regions(pci, "RME32");
 	if (err < 0)
 		return err;
 	rme32->port = pci_resource_start(rme32->pci, 0);
-- 
2.48.1

