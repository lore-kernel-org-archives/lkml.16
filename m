Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E9276024;
	Wed, 23 Apr 2025 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745395000; cv=none; b=m3OnDtTkM7cSszIWVDfwEMiAfzNTs3N32qg3x5DLhCvCQBnbaqvWKzJJCGlpYRLM+rN6W1ZcMJwYJg+XRh5irw+hNA4RjFOZeXY8PziM6X6AoexH0Yi+6xJouq/6d2gYn5Dwutgis19N5Oqc9YbbkKhnbJNRI0NAot+sUwYgqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745395000; c=relaxed/simple;
	bh=jns8DCaUvcDMxTBgEWlKIvW7BD9aUIHXZcrNon36aTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EapGHdfuYQTZFpducTLh59vlgit78AW9uj0pwsTHQ5mbr5fIMQQUHdXjPr5Hf8yEHXdCut7Rq94UHx2GqV4b8MbRaR4opeADQF2zW8q49xAGYpnhjV3YNeapVcBLRJl483yoYFuuJ1mVr/KIAKBUe2YbOmsH9zHw8nRQ1qtB1Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohpjFjc7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohpjFjc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14691C4CEE2;
	Wed, 23 Apr 2025 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745395000;
	bh=jns8DCaUvcDMxTBgEWlKIvW7BD9aUIHXZcrNon36aTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ohpjFjc7+ByLUDL4COQwP1gz+24CAqqv8dcF413+b4zBWgkp2sPhqCVwypPbaWqmw
	 /hKK9kbBGY+zPngJ0iAmlU09dVAYHSuBeH38q753cj/a6M6w8R0dksW70f8w3cC00a
	 sjpI9qIHLejaFgR4cFPeCEmJmrxnG9YLx/yeTrF0tldcTIxNNthe3lfHZu9QLihu33
	 Yjy0qnTVgOYydHx2RsiltY7yQkZaCChvxiagty5AvWV1v1AaSBRXl20jJsQ1YBC2Vo
	 WTYFkRVbgj3WWaAi7o02Nx/vQUCdgsdROwIeTUKQbVjOo8qeBtcCTj1e5OEwcgNqsW
	 Wyx7TBk/PFEPw==
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
Subject: [PATCH v2 28/28] ALSA: maestro3: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:46 +0200
Message-ID: <20250423075346.45907-29-phasta@kernel.org>
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
 sound/pci/maestro3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index f4d211970d7e..e61e15774706 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2552,7 +2552,7 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

