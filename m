Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034526F476;
	Wed, 23 Apr 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394883; cv=none; b=J9egekx/7I6DEpb024qg9891PT0uTfOTSVnheuSVqVUYAuurZ9tA79pa3lAgX17Ih2Qh1C6pLStHu9RCp54vFFwLrFx1oR3kvHVsvJwuoV5ZQH9ayDjKTTo8dICVy+NwStkOc4p0s3i7+OvLU1neUlraSZSr4iE9P5eiQBPAEn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394883; c=relaxed/simple;
	bh=cyoX0S0RxKOZeNzlIOigmhm5/jak5UazXis0dWDaZX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXwWYxzMVzPGpmqzWNdsSqs4Fi00nnNz4MS2ZZSZjidim88GkZNviLJtdI9oWITT/pCjJayxCuz/H1k7k9zmFfXN7GnNG8EX+jNMDfXXpWd73L1ZVzNtqx3VvNk3YYXCIQikF5k47uOmX94i87xXYHjrW+YrMuPWSUug0bDcUxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da+Ppkt/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da+Ppkt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCABC4CEE2;
	Wed, 23 Apr 2025 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394881;
	bh=cyoX0S0RxKOZeNzlIOigmhm5/jak5UazXis0dWDaZX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=da+Ppkt/9EGu1Cxjj6ADT7OaQmwPVcxmWkfPavQbs4xPpvX+rMDREw5r4f37FUO5l
	 tJSrnH6rHdP/A3hm6eBCWY9ar1ORZAy5gT3hHwMZAYhoNKMfV7fLjWs1VTyJxfGCph
	 Fl3FuXk5Sgpx8stjg3/kHTs7aL15JshOzSlnY7T41tnLSy6Ku2GPYyYc9n1KVBnQ5D
	 /wUPENFe+hePwrkKSOolS6b0ohzhw6qPRgBzxEMIlfZ/lhgPL2iSnyttLD6kucUS1W
	 LKsOgI4c29hSQW2KxLwwF58f4Q2iMqCo05qQ8xePsAPhnQSzFyQhgLg05VirjY8yF3
	 e66ySe4kuBEJA==
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
Subject: [PATCH v2 07/28] ALSA: sis7019: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:25 +0200
Message-ID: <20250423075346.45907-8-phasta@kernel.org>
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
 sound/pci/sis7019.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 53206beb2cb5..42b22f123fa7 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1273,7 +1273,7 @@ static int sis_chip_create(struct snd_card *card,
 	sis->irq = -1;
 	sis->ioport = pci_resource_start(pci, 0);
 
-	rc = pci_request_regions(pci, "SiS7019");
+	rc = pcim_request_all_regions(pci, "SiS7019");
 	if (rc) {
 		dev_err(&pci->dev, "unable request regions\n");
 		return rc;
-- 
2.48.1

