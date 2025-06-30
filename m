Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57715258CCB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315123; cv=none; b=CF2EiccuPnAOUb1bb8pl3r4rMI8Bi1+mCRNSYbUg977gxwPHOBt8uzldZVvm6T589iSjfMd7t8DdwxKCNEq9PO+lNX8GnZOg8GVhq7ltX1JKaJ0OFc4jpqCjUx1+Vb3GJx2HYf1oUKjGqqMS/CDzbpJpxgicL4nWT1nBLzUxo18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315123; c=relaxed/simple;
	bh=J6V/lWrwi9SsMBmzCiPDoKNqm/YDWe50nHVIVs90nIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNSREKfSUiLOenYBNqQWU7Wpjpq0YRh8jeLoZoJm1f84TznmFPlTP+zbtKLI12kv9dUjud6sK9yAydCZsI8QSC8mnGDMGr/PGiGvqJoFrM1ccIIS73NEEYfubjfJpc8i+YmhfYA2wnfUO0rQexcpTZEcLDCQz+wWIRVtUgzwVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mu0z/X8A; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mu0z/X8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751315119;
	bh=J6V/lWrwi9SsMBmzCiPDoKNqm/YDWe50nHVIVs90nIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mu0z/X8AmTIjayN0bAnRAS9nfn6UZcOmdLAAuEvu/e+/dufrgoAy5I8q6J0V2MtG5
	 OzwF4csF0orH0w9+hqpg+xorakwuR6ASnPEtiLcY1n57gLdpit/oF4XBNPTolLGppq
	 wH5nRm5NgNlIzS82lYoFGFlAgdk1FKP/dcyK1HOZP4wsg5L+YwLRoLpYp710oB1zrA
	 m6GygwO/IOcjkfGjBDqALWYHNH4BCNOrurDNnRGmWaf5l+N8i1Mix8N7lytiOttnlT
	 Vu68Q1Q0zwX1jiYXVb+7loLS8s+33V6RS77GU7wnqd6v/6eheDvnCjSSrELiv7rrss
	 10fM1BfMAzhvQ==
Received: from localhost.localdomain (unknown [92.206.120.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gerddie)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DC417E0F38;
	Mon, 30 Jun 2025 22:25:19 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v3 3/5] drm/etnaviv: Add a new function to emit a series of states to cmd stream
Date: Mon, 30 Jun 2025 22:26:29 +0200
Message-ID: <20250630202703.13844-4-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630202703.13844-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250630202703.13844-1-gert.wollny@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: fix formatting and remove superfluous masking (Lucas)

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
index caf820d91ef5..842a7ca55c44 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
@@ -41,6 +41,19 @@ static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
 	OUT(buffer, value);
 }
 
+static inline void CMD_LOAD_STATES_START(struct etnaviv_cmdbuf *buffer,
+					u32 reg, u32 nvalues)
+{
+	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
+
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	/* write a register via cmd stream */
+	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
+	            VIV_FE_LOAD_STATE_HEADER_OFFSET(index) |
+	            VIV_FE_LOAD_STATE_HEADER_COUNT(nvalues));
+}
+
 static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
 {
 	buffer->user_size = ALIGN(buffer->user_size, 8);
-- 
2.49.0

