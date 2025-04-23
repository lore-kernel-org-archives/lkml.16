Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A9026FA4C;
	Wed, 23 Apr 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394887; cv=none; b=FY66NqMzXDX+fz+EX4EBp4poH9TzCqfXEwILgIF0uAh2WJFJusLioGBk4hSvxBcCJakeIJt0gVlFDZNuttjOlnUsBkSp9BMTlpBbrVq6BXIbyt2WPmKjh4+wyX+PYq97JYP27dPTIIrWZW5F3KUJRLJs5ftWhUd2UaM87t4SKz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394887; c=relaxed/simple;
	bh=dh8pO19QIEXWKzKoDuFgHcqwku73Ixk3mwAOAY6eB5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2k4a7hoF47zvqGnVMMgeDBoyFAzK4G9qg3aJIWMZC6ZvY9AqurQSxJcl0JaR+kmcctVD7tnGVZ0ZvlJJknJW0dQ3hd6kzzdEUlDtw54CFHCWBtGOlhwOe+CWHfiuKeJMrDqNACK35QgLBcpAJnCrh863dozvxnluUCmKkqOE20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvPjGJGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvPjGJGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186EBC4CEEA;
	Wed, 23 Apr 2025 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394887;
	bh=dh8pO19QIEXWKzKoDuFgHcqwku73Ixk3mwAOAY6eB5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uvPjGJGlVUhfPSreiwB9AKpjezUZHZ+r1AEw72nbsdDbIHe/VYALeuVm+x4sbquT/
	 NMw5qjFaVVW4ed4Eu4YM81E+XYmhO0kA3gVM/6tegpOl1RLd5IBz/hUpsjWh1Z9V2S
	 lUcrt1vE+3pfX2t0M7ofV+FyrWt/YGy+oiOFXCPP+Kb07p+G5HNyyQa8GKJUgAzvYz
	 A41dSQmAc65AWzRJ03OFITLbuAVfhQNBxa8wlZHC+qBsF6R29DK2DtcKlH8S6YVr/P
	 JOmZMkcUdGWhYcX0yDyR72HQknDu5WJxQvX98T0Ib3g7Kl1v2z+T1SnBHrcJuBu3lo
	 ohHcrMMS5mt0w==
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
Subject: [PATCH v2 08/28] ALSA: intel8x: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:26 +0200
Message-ID: <20250423075346.45907-9-phasta@kernel.org>
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
 sound/pci/intel8x0.c  | 2 +-
 sound/pci/intel8x0m.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index e4bb99f71c2c..51e7f1f1a48e 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2926,7 +2926,7 @@ static int snd_intel8x0_init(struct snd_card *card,
 	    pci->device == PCI_DEVICE_ID_INTEL_440MX)
 		chip->fix_nocache = 1; /* enable workaround */
 
-	err = pci_request_regions(pci, card->shortname);
+	err = pcim_request_all_regions(pci, card->shortname);
 	if (err < 0)
 		return err;
 
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 38f8de51d641..1ce775fe8a70 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1060,7 +1060,7 @@ static int snd_intel8x0m_init(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	err = pci_request_regions(pci, card->shortname);
+	err = pcim_request_all_regions(pci, card->shortname);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

