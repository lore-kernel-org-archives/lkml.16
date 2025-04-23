Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD1274FFE;
	Wed, 23 Apr 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394977; cv=none; b=BC/QnmdPIrj9jvZJO0iyRrb2VzMsBb0/NAYBe4j7xtiyf6lsJ2S3F0bLgSUU3m1Wl7aqsoFLj4MAkdieDa1TyHocpifBKIH411CD5dLdC5Cz/+l+3zj9Vg37lammWYmHXoPKP4rIGCJmjVUawPK2PZldl5vAZcrL1HIW1Vf282A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394977; c=relaxed/simple;
	bh=hVM9VlTYcI4bKCfu0tZacwR+Hp9K7x5sbnt77Pure7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsiYyHzMN5hzlb5tkbWMl7CT+eTrFFbucTSiceso9fMCuw4bgMOZiyyDrJ1iQBlGwZThief3v3rAxtd/pOLbSSL9fTxoKci/GB0fNDKfM7XehMR4J5MNOWUWo6eDXc5befiQCQPIkkKuMkMw0B1wBiEzDsE69kB6KXbLWgtZZzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oc4STb2G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oc4STb2G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341D8C4CEE2;
	Wed, 23 Apr 2025 07:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394977;
	bh=hVM9VlTYcI4bKCfu0tZacwR+Hp9K7x5sbnt77Pure7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oc4STb2GM/yCnKQpbkZ/YdxMzurULQTXbSAUEUcFvGkmN3L6cFWmO+rzTcK10F4lK
	 3kQSFoC77Z+rK8sWaTck7heeJUX/p9yvQ8hDGcusi8kEqRjBVfOkHOuK0M+T9VilV9
	 M39d0I0Imeci2iwGO+edWj6IiSMTuEv3liYTKLrqByRziOb+ahCde9111HpSHDTWcO
	 ENGSRSVMFU8LwvzpSV4UXhciFz26lAGSPOtkO1D9YJLKjN4z47T0W3lPrLhJ3mq80k
	 wpV1Hr6BM+zEpKBgiWSLKUTcEv/GzlYzE0NejqObErU7oUNRWzzD/ZlFL6Fc5nMl3m
	 YZf+++xEMhiAA==
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
Subject: [PATCH v2 24/28] ALSA: cs5535: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:42 +0200
Message-ID: <20250423075346.45907-25-phasta@kernel.org>
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
 sound/pci/cs5535audio/cs5535audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 440b8f9b40c9..0f319013a2a2 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -262,7 +262,7 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	cs5535au->pci = pci;
 	cs5535au->irq = -1;
 
-	err = pci_request_regions(pci, "CS5535 Audio");
+	err = pcim_request_all_regions(pci, "CS5535 Audio");
 	if (err < 0)
 		return err;
 
-- 
2.48.1

