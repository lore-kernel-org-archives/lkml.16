Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8E1191F75
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744444128; cv=none; b=D0DGIl74rKbVl85dwOEjRMJAbhJ0ZRI7PF6tMJ49WvFyKHN6yKZ1ERqEI1HVPJdyykmbXKSyvPlDj0+zZH7XBXtNr8TLEEtdpN2uCtJipBAVQNZSrR8INfOkKxQ4We0+9kHUH5DltaHJXoxN1yiScIHMhYzWl9m9C6GQxHKFxVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744444128; c=relaxed/simple;
	bh=2TDNINhhP+tqL6gRsN/zaGla/IazuRP/HIv0iKIdYdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwfiqos4Ma9tlGA/IP1JKJHq34x62S6d/HqUsZTtgCW/rEgyVlADv9T3QixShHebkhIOb/dVtfoIQv5A6vwfhLX7wpl1rKzkUlxBIjWzt7QMlQ0Wtnvw4jDpCgc2KV83kkxzVZ7aVwsUXBpF20rrjom2r0OwaXLWoQ5hSxEqcIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=pqtZyHa7; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="pqtZyHa7"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3VbRuJv5sCZIm3VbVuYMRQ; Sat, 12 Apr 2025 09:48:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744444124;
	bh=TyBefwaCj12qoZCRmqa2pA2xtccxwzTRF92uBTc5N+k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pqtZyHa7FFYe+AplfhLYIUWw2niLc6gTv5te8yyIDzQQ0IX40p50ASDzMTt9/fR0z
	 edZhstppiuZaJQQbpDWCbLY04wjCez/+chWlAXqzXU77eNnIMgGW7PE1/GmJ7sOwc8
	 3EL7NWBfltZazWV1ywEwcLYLM07R2krNBFECuu5hiNEgBS8Ci+eCuDfXzjYjUwcQc1
	 j6P1PGgza4RudwrYmMNYigF0b/2amK8MeUPcy+8B+zhCMcOrIevhTrs1h1S+8RH2sL
	 sZBWJrOYHZ0FBJUNtqMHksrRPrrrObNXWOiqz+RZvhPPDsl78l5tyYm//VXq7GMrLy
	 UvoTSVzFx/T0g==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 09:48:44 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] staging: gpib: pc2: fixes multiline comments style
Date: Sat, 12 Apr 2025 00:48:34 -0700
Message-ID: <77eb5fc5050298503009fa212600f00514eeb713.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 96d3c09f2273..d93502a833bf 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -267,8 +267,9 @@ static int pc2_generic_attach(struct gpib_board *board, const gpib_board_config_
 	nec_priv->type = chipset;
 
 #ifndef PC2_DMA
-	/* board->dev hasn't been initialized, so forget about DMA until this driver
-	 *  is adapted to use isa_register_driver.
+	/*
+	 * board->dev hasn't been initialized, so forget about DMA until this driver
+	 * is adapted to use isa_register_driver.
 	 */
 	if (config->ibdma)
 	// driver needs to be adapted to use isa_register_driver to get a struct device*
-- 
2.49.0

