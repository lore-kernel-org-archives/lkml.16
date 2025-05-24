Received: from smtp.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A7B8C11
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748103622; cv=none; b=WGn5pM43ZrVfbfJLrDFXuEp9TyjYq0ATLY7j2hly3kLZo1nS17/cENg+6G3q432lAtxMDxVRSkaL8TjEvAzQfjGhcEKGRd7xa7gEi3IEZwYhPfLSDNZBuVv8IU1p39paWkQUQDD2Thjo0HYoGEN00di3XDBjR3Sv/pN/osudlFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748103622; c=relaxed/simple;
	bh=65/KaLpzRs8gFo79tDMN4s4RnT6oxjpzQ5k2c/LetYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6SyQYYxFwSVrPBbNAJ89WnGnix7xIX/LjAHBG7Up/0Jal2gryUcpnv95NbUU8dB2Dq0vm4mWdM07ix1ZHpCuqe3qqPEe85hbw0WtXVa2RtP4THMPHD5yfWJQSfvVJ+IntfQLzl2Kjmrp7ff5YDo4fZakBPuvPVyJ1lcF6XK3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=p7MTcRsh; arc=none smtp.client-ip=80.12.242.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="p7MTcRsh"
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id IrSUuI1zk7nctIrScuJnhc; Sat, 24 May 2025 18:10:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748103059;
	bh=vp6GqdAP6pKVMGw4uZqtEavNsIsEsQuRgZ4ZJY92yNY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=p7MTcRshYZXU2FUZ8LbcvZzzx9ukOmAlM40uGp+htz7x8wmgzaYmxk9SJnNPUalxW
	 x9Ut1N0XSwMvEcrcNLSPDid4mbP/0y/vuh0XKozpze2o75t9SelV7P0j0bwf+bgKIE
	 DZVx8i8Zr8hS0ga7yrmRgFMrkRTvKciJeQJAgXGRUuJDrSEpT4jdb3F1oiea4R2A/n
	 iCM8lBykzNT+Q9E79S8hCbEQJvZP31itIR2MNj1D56kEb95HM/STy7dUTkkp5ODbH9
	 9BscOZAme61iYCGbutZmUUThbEHkYcRZEqZlHNAM6DjOvkIhyiCYFIwuwKAmEHitNl
	 M5HBMdEBTqa0Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 24 May 2025 18:10:59 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] regulator: tps6594-regulator: Remove a useless static qualifier
Date: Sat, 24 May 2025 18:10:39 +0200
Message-ID: <ebc53d4049ec19796ef07e1bb734de19a2814727.1748103005.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <1446fb1938f3f38115be3e53f5dda3c8bb0ba5a1.1748103005.git.christophe.jaillet@wanadoo.fr>
References: <1446fb1938f3f38115be3e53f5dda3c8bb0ba5a1.1748103005.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no point in having 'npname' a static variable. So remove the
static qualifier. This is cleaner and saves a few bytes.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  27949	  12176	     64	  40189	   9cfd	drivers/regulator/tps6594-regulator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  27947	  12112	      0	  40059	   9c7b	drivers/regulator/tps6594-regulator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/regulator/tps6594-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index 0193efb5dffa..51264c869aa0 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -563,7 +563,7 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	bool buck_configured[BUCK_NB] = { false };
 	bool buck_multi[MULTI_PHASE_NB] = { false };
 
-	static const char *npname;
+	const char *npname;
 	int error, i, irq, multi;
 	int irq_idx = 0;
 	int buck_idx = 0;
-- 
2.49.0

