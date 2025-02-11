Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271B190674;
	Tue, 11 Feb 2025 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256756; cv=none; b=lVmagSoi1IS/JODuG7fsbny0zcn46/Y/TiIDbxs++VLiM21ThEI1B4d5YQvP3pZ17wGhUqeifL/M0XiYB0NrzK0Ed51/dyy0ohq86TK5G5lWaN0610vsAamiLiMM37stQcP2JWs7I/ZIcKSdpCFf25+JNu9u2GlBE4Nr95s0YE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256756; c=relaxed/simple;
	bh=6mIJYzmVBucysBvmuxFwplO26bkr8ex6WKmLy55KY0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DezTlMekGDfnS42BbesaWkKz26BLGj5rMnSNqTz2cbNfh+kNCKM1HYrELqQ95oUUXgVWv3gI3/Y8YJBX/noqQ5MKtA7Ch42UUmtwA+u+GiiJNg95WfgF+EbI0Ad0rg4O6Ak0da+F+lcrbJDWy1nnBajMtos2CINk7GC9vZ6UuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=roZpjScj; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="roZpjScj"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81BB61480388;
	Tue, 11 Feb 2025 07:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiFIIYGgGBWuarCiW5+YZwUI5o3pOP+hr5uNDNTqvG4=;
	b=roZpjScjYGJ8VLAI8XAAMZXHJfN9L7/Q4kz4gM2SF3Z7rgmg/ifXKDsGxmjqAahtSX1VMs
	PzHPeXcowl1BwsE6qUyriU6sA9YnOWcYRhHvOu6T5GT2awj8nFIBD/JX9v0YaLUtiFsIwo
	iTdMZdGqJIpv5AeKwIZ/aPmdbfFf7d1qo6GsFp74tMo/TmU6m2L3gR0dAQe3A4diNar9l3
	sHySDBBRFsHcikVR6BzEZ7s44lCM8r2L8YEOs6OCEElM7ypZl30woHag+jj6w6UzGJHYKj
	12pvmlG2LIHeXHmaTdybGcHcyrBvjFd03UW5CH+ZQAsiRrTVZhdsCiUKobLecg==
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
Subject: [PATCH v2 10/16] nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
Date: Tue, 11 Feb 2025 07:52:21 +0100
Message-Id: <20250211065223.4831-1-ada@thorsis.com>
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

Makes no sense to have a timeout shorter than the sleep time, it would
run into timeout right after the first sleep already.
While at it, use a more specific macro instead of the generic one, which
does exactly the same, but needs less parameters.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
---

Notes:
    v2:
    - Add Fixes tag

 drivers/nvmem/microchip-otpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index e2851c63cc0b4..bf7e5167152cb 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -85,8 +85,8 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
 	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
 
 	/* Wait for packet to be transferred into temporary buffers. */
-	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
-				 10000, 2000, false, otpc->base + MCHP_OTPC_SR);
+	return readl_relaxed_poll_timeout(otpc->base + MCHP_OTPC_SR, tmp,
+					  !(tmp & MCHP_OTPC_SR_READ), 2000, 10000);
 }
 
 /*
-- 
2.39.5

