Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87822586DD;
	Mon, 10 Feb 2025 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206261; cv=none; b=LriWE5objBs5lYQyzTT+vNlEfIiApNp9h9uulrWoZ6/xAJqOdvbY7ZRJgZ7s78hPIrAhBEtWFGBfebfA1rVgItROPKkR5PZYpKH/cy4zQ9QjIm0fhoGlwEyUxL6lRwinFDGlyoC6hxTfhbSHQcZ6Jt+P3iu+BapHj1MWbD9a2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206261; c=relaxed/simple;
	bh=oNYp33jxngaML7ct2N4mOAELHAXsHNrKBnIHuGSuNlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sf6EGzdIhPEJeNFzYEQxIiN5zyMDX6Sr2UhoHy5CeyOTxQgjKsaW/h4EWTW2L7sqQUfFq/vjHdiSduoOvdxdqE585SH7Ip3maRxDeS9ZL14bFMDR5N6mHhFxjzOR8UU5RWAdff1dUauBN/qPCIzMpmvmQ9WvxyQkT0HsAtLBrMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=WeufU5F0; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="WeufU5F0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2CC71480320;
	Mon, 10 Feb 2025 17:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739206257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dx2AyCMYhFFbWrbn642fofkzdPw2vsH5Sq2hYcPNPjo=;
	b=WeufU5F04oIdoa+jIjBiljm+kcpuXaacU7TtFk2amz8xodrGnWESGchS1CTSG5Gu678GPz
	p+x8WZu1frRJNtPrCDfoULtLl5W4uz5e7yr+1l8rqHdTdD2WU+alJv7UgS8j5nkS6YniLc
	y/AKnxJiAz24d7dBsfxsoDjNdoAFxcaoGroNUlOwkPy2lRxMuG2tcK1hqUEg1SfuNuAfNF
	/H3cruIVrUfKYa6pvFsc8kU6udnA9/5rer4TZOVgq3lqNFAonQCYWw7hKgWqqSRkGVndHJ
	k5RzWCgc8M8rFEl29o9yvFppLhkYLwUqQKx+XP8pv7zYEsfnYvJMZG9kix+U0A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 09/16] nvmem: microchip-otpc: Avoid reading a write-only register
Date: Mon, 10 Feb 2025 17:50:47 +0100
Message-Id: <20250210165050.496486-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The OTPC Control Register (OTPC_CR) has just write-only members.
Reading from that register leads to a warning in OTPC Write Protection
Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
type READ_WO (A write-only register has been read (warning).)

Just create the register write content from scratch is sufficient here.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
---

Notes:
    v2:
    - Add Fixes tag
    - Remove temporary variable usage
    - Reword misleading subject (s/writing/reading/)

 drivers/nvmem/microchip-otpc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index df979e8549fdb..e2851c63cc0b4 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -82,9 +82,7 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
 	writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR);
 
 	/* Set read. */
-	tmp = readl_relaxed(otpc->base + MCHP_OTPC_CR);
-	tmp |= MCHP_OTPC_CR_READ;
-	writel_relaxed(tmp, otpc->base + MCHP_OTPC_CR);
+	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
 
 	/* Wait for packet to be transferred into temporary buffers. */
 	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
-- 
2.39.5

