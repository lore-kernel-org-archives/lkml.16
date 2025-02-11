Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097E1E9B25;
	Tue, 11 Feb 2025 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256795; cv=none; b=k/z37ooLaRUz5v2JgXv6f8BKM0J44A3jGxX9wpVza88yz14vx7FZMfKRn2JDmP7wZECiG+emJGqSORGhiLGYaNZzBcbFkUyGoIT6yQ2xGksy92qx4sNQdFeZdYwk9MZaDA25wmZZvzxZReYGnDFyhh+qW3rIT+TLbc/HgCS2BGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256795; c=relaxed/simple;
	bh=C4obFeVAgYCCUOZg+qluTM/kRQ1+ugEIZX9ckuzFnvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=de8Mvai5cOg/dPfg/J/Hf5ZabwNbPNuQ0u4K2FlAc1RlHa07kE/4MFjeyqXFr110zhUFGx2bUPJRoUGNoPnZbILyHrLdHH99WO4Uqg/nBSei4pqPFhREPHweGlMWwOHnaMZyz0eXyKDyetFD6c2vt6Oxp9LMcbSgCE40F+4G6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=Q2h4rqak; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="Q2h4rqak"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ACE5148718D;
	Tue, 11 Feb 2025 07:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RV3fhgTUiFE5VWNVLFbOVq1Uvf+BwjLKdZ/zyjmf0I=;
	b=Q2h4rqakGU5/WcMnFYZmntvJM+pZ32O5QvbGJjNwHAGAz4B5MW0EHIinv90QUCZeOJ3z17
	/NTCADvZN09+8K0lyXOYbnyOleS2ksX4LmZNKA9LX/1UnJ5rnmVZSNutDg2bfnU7xtyama
	zO0osD7C+03MCT8moRGLmkwCJEGB3+AgmJzNUslC5FxbOpSoY2hbLk6qs4dCKsOWzENvUc
	qbJtfM8cFcI3BFmI67mSrV9yH76uZZA4Fq2QXdCoyOmU1Ae4gJn7CjojLsBcAKXy+54dsm
	e2j0y6nwrHKTilkzkirrt0YI++2ULVUIecxCwT8LUsej8w9wugaZLtTgVGMp6A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 15/16] nvmem: microchip-otpc: Enable necessary clocks
Date: Tue, 11 Feb 2025 07:53:03 +0100
Message-Id: <20250211065304.5019-3-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065304.5019-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Without enabling the main rc clock, initializing the packet list leads
to a read timeout on the first packet, at least on sam9x60.

According to SAM9X60 datasheet (DS60001579G) section "23.4 Product
Dependencies" the clock must be enabled for reading and writing.

Tested on sam9x60-curiosity board.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - Rewrite to enable _all_ clocks defined in dts

 drivers/nvmem/microchip-otpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index d39f2d57e5f5e..2c524c163b7e2 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
@@ -241,6 +242,7 @@ static struct nvmem_config mchp_nvmem_config = {
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
+	struct clk_bulk_data *clks;
 	struct mchp_otpc *otpc;
 	u32 size;
 	int ret;
@@ -253,6 +255,11 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	if (IS_ERR(otpc->base))
 		return PTR_ERR(otpc->base);
 
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Error getting clocks!\n");
+
 	otpc->dev = &pdev->dev;
 	ret = mchp_otpc_init_packets_list(otpc, &size);
 	if (ret)
-- 
2.39.5

