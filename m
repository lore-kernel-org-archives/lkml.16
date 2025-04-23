Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAE02749C4;
	Wed, 23 Apr 2025 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394995; cv=none; b=h+5zAm+F6H+YJB77jn7Z/nTORhYCCeBtQb/IfEyOV35thtTguVSDeyjEny8j8g/MQNLRfrc2AvJqQCfg7BE1N4Q2qgTqtS0HGNFAM1fIulxX9VwqbaQkGfPWT3+c0SNqqKf2YldeHdUScc2DqY6bGmvUQhXOPy52Ps++L8+M48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394995; c=relaxed/simple;
	bh=bYsDk+7D95w8HBhjBbBGx6xu461/Onf3AMTiBYZIojQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i00yJW8KiYLOMNntpWRFwyR9btVx4G48MTQzASvhBmuWSbpnJfyKMVsVcteWYxGVhFvg0ic38esDEWdNb1WAcl+oCB2WPlx9LULY0GnOeSb4jzcHdpH7SYAuvYeZgyZtkcGQa1CHhZE9E1kIR8c7Q8zPp4LU3nbVOwC+W0ekQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZEqaYWK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZEqaYWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658C2C4CEEA;
	Wed, 23 Apr 2025 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394994;
	bh=bYsDk+7D95w8HBhjBbBGx6xu461/Onf3AMTiBYZIojQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZEqaYWKjo6/YJNMHGcRUGCmaDpNuQUphnhRQnJCKQ+ZtBIXuAgyGlvc32JL9hma3
	 mxjORg3IAmIH/RC9EbDcPUYiuAAGLi0PZr/+n1nM3Bt/plsGBt72kYuKm/FKwMTkCr
	 ItdvJX0eksEiPTHT/7dGEus2kWzIIV7DimWvcGsv87X+pSrzZFsy8+8ZwvQj9MJofs
	 dXSJj6jkn5g5DinwdYflnTKi8rOn3eiQCX401fAHVtetT2SyB9R+LQSgIjYQB3PW8E
	 qtemZi/TyWBR1M/2m82MU+RIgTV3FVdsdQ8zmz5mat0Cq0pFrqTBHYllPJyAu02q3E
	 k2ougp9aD/Ifw==
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
Subject: [PATCH v2 27/28] ALSA: ali5451: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:45 +0200
Message-ID: <20250423075346.45907-28-phasta@kernel.org>
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
 sound/pci/ali5451/ali5451.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 793d2f13267e..5f38a60467c1 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1989,7 +1989,7 @@ static int snd_ali_resources(struct snd_ali *codec)
 	int err;
 
 	dev_dbg(codec->card->dev, "resources allocation ...\n");
-	err = pci_request_regions(codec->pci, "ALI 5451");
+	err = pcim_request_all_regions(codec->pci, "ALI 5451");
 	if (err < 0)
 		return err;
 	codec->port = pci_resource_start(codec->pci, 0);
-- 
2.48.1

