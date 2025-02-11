Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277F1E6DCF;
	Tue, 11 Feb 2025 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256755; cv=none; b=sWddPsT+TIpmCm37hLytp6NlKucOrAJLUGPVhWBhRWyA4CpnwF18ojwkVsoxxSWMd8NzNQBfnn1QaIE8WVpRobhEqUFBKE1fjL2DKZqEMb1EPK2eRv+a9tDe82RI1P6n4w9Dj45nCp/UFtIfMM4T3QVLqt1AD1KGiwSiGfmuzy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256755; c=relaxed/simple;
	bh=A+AkBIPD4cMDrgF315D/sUXmWXFAMXQ9kIytyxl859Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c4EzPxRddJ6kB4OjOwQ/4Q6JerQwrFF4AXQQ55RksJU3YCyJgU7bG6p/N9L+Bqylqvl1xkSgeyn8I3tgeBJvZjKtnRQbnIlcKLVinPHTwP+ndtl/640SGdn2Tb7E+99JDbrhlDdfVbEvUuPqx7MqcScHSzDKkN0jqrT4GdmkUQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=GhUSxRtB; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="GhUSxRtB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02FE2148718D;
	Tue, 11 Feb 2025 07:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I7ZPupAqKk5CZVK/CQ4Ue0k5HUeF4M2ZpeGOEPD1OnQ=;
	b=GhUSxRtBnj0vU0y6JUZzwoLMI/zhGfkVr4ENF3tc+svAb6TGUl3fu3ehDPDmgcjDCAkQvN
	/koKqFqKPvzJzjkUTljbK8oIpE6gShLEpSvhprxe83Tnat3ZWKdRAIorZx2Du8iOf0r0I/
	shuUx2d2fAgckDw3RM+EGM6CI+Z2ArGeLW0H7JfqnliNHTKmbD+eqvb5hNQLbv955qfg/K
	tljAXGXM+14DIQcROM2sfJpJlgSUVfHZDbTIDYCDFnrjgEu7RbQaLUzSqgN7yv+PQ3vlgH
	FEdNw/Yu3OpcuIanseMyBFWFV7fXmxOQDojK7+Jgy8aptGiZAXvGwmFACvAdAA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 11/16] nvmem: microchip-otpc: Add SAM9X60 support
Date: Tue, 11 Feb 2025 07:52:22 +0100
Message-Id: <20250211065223.4831-2-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065223.4831-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065223.4831-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Register layout is almost identical to SAMA7G5 OTPC.  SAMA7G5 has some
additional bits in common registers, and some additional registers all
related to custom packages in secure world.  None of these are currently
used by the driver.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - Reword commit message (additional information about SoC differences)

 drivers/nvmem/microchip-otpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index bf7e5167152cb..d39f2d57e5f5e 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -269,6 +269,7 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 
 static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
 	{ .compatible = "microchip,sama7g5-otpc", },
+	{ .compatible = "microchip,sam9x60-otpc", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mchp_otpc_ids);
-- 
2.39.5

