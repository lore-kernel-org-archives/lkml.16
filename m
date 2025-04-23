Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5A270570;
	Wed, 23 Apr 2025 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394915; cv=none; b=fZnfNq6fHTTIImJ1zR+J5z8Uh0iMD44MToE1rLqe6TK7sx0pddXnG75IaAhIqjkolCLeLwH079eSIUzXlndgC8u7kYSskqXVnmnVn0adNmJzQfee4Qg9nQRUPUNwMLmUiaS318pVrY29DXh3MZGAj+AjOliE7d/xL1yvFAUW/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394915; c=relaxed/simple;
	bh=8yKUlLXHUWppgyCklU9qzK3udYjt0wg2dXiGw914pMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ma0wPXZ+gGNRV8buc4gwGjIc3Lnxu6xDsOLw9wqTM3OetKqFs5RCfPaWNyl8an012Vi6R51AQ/lly1z9mqYYPn9P7DavubIJ3L02UJUwL3vsE1vI8oNu1UFtN7OGRaj8Zyve2Y2OoWm5XB9t/K3t1myWgQfEa2ArQC00ZhWjHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drx3pnH6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drx3pnH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDC0C4CEE2;
	Wed, 23 Apr 2025 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394915;
	bh=8yKUlLXHUWppgyCklU9qzK3udYjt0wg2dXiGw914pMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=drx3pnH6sIWyK3T7zitSvvXyHaczorg+VwR3OupJ15N4X4sEMnm1vsNhoxV2VRNhe
	 hwabNkjYzFl3CndygTmihg5TKn1zz5FoweWpt3cjOXJc/zUdrS66qc7p3fEIfmTAlL
	 nn/vXzIAfUvdtux8tWKGo86IJsxcqtF5qPDIdjNpJzQ4pW2Scfb15pTqwfmtv0mbcP
	 4X71IZPA+cboHyVmivfaXEZGvCl1qCqP0r4yLW/R2tihZj+kG4NatJu8/N1WRbgTcp
	 eH5sWMJwDKLdv8hzs6P6aRsoukUjirrQAcjgHNixlF5zFqGzSz+p8gYcJFon5PXM9J
	 9yshdWYMVPyPw==
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
Subject: [PATCH v2 13/28] ALSA: oxygen: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:31 +0200
Message-ID: <20250423075346.45907-14-phasta@kernel.org>
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
 sound/pci/oxygen/oxygen_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index 9340d3c9ffd6..39b8ccf37cdd 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -609,7 +609,7 @@ static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, DRIVER);
+	err = pcim_request_all_regions(pci, DRIVER);
 	if (err < 0) {
 		dev_err(card->dev, "cannot reserve PCI resources\n");
 		return err;
-- 
2.48.1

