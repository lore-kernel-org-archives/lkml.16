Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B8F21C188
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279342; cv=none; b=QsQtZ0euQ0DrYMEdkrjY22TW4xrMDOJHXzL8GkhCXgnfXmKxeeXZ82N5IxJh42p93NtlIrp33hhwLrrA9KBrlVOXDg7tXt/vkkOEc2Vtry7GBnYaIMLAI4eleRFo+kRYICt3wTuvS/8SUZXTtx/b5/ZoRVffMZZ+E8dU5MFoNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279342; c=relaxed/simple;
	bh=eERbzNwhG7UaUTzdqzXK+JXcWmE1zzz2PEjd3+pzzuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQnlQblKzrefCH+5+rNAtgAE3i1/14ppOXKW4NkrtMZJjj2QXiYA3Vc0glPy0y13yUZ37U1oGrkVv5CHGaDQK2JZ8ay5uDWQOarPks8YRN18A7DIKShc9MEnlzMBTfLxDVkfvazdqhebgl79tmrDRIcDZIOrx8v6Z5afpSqojW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cMKLYmKZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cMKLYmKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750279337;
	bh=eERbzNwhG7UaUTzdqzXK+JXcWmE1zzz2PEjd3+pzzuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cMKLYmKZuwP1xr+qXlY4jevb2i2FYzbVCQlWtX4j/ZzHztKvz/vLaaR4GSCABjSkl
	 PvxwTZmp0ByM5jVj2r7jnv/qBokU5HXmHIBuI91RIPP8Tb3ZYrlohsXKw4nzUxMhV4
	 89P7jasxVGS+iy/2ZkyzKPpa6VfNN580VVpM99cB+/sbaEW3oSKJTLLIubdZoFZONU
	 Bb43mpK60qxLASFvmHxeMBCnfoMF+0jZ3+j75aYX/m15Hove3jKkNA0bMtzTydKx8f
	 LmNaS+O4Vlr+hwkAdj/NkwM3XorjSuoWj28lCFunVBXGEb6lLSxkeJZqcahKbMJqKg
	 F+5LYr74UiZcQ==
Received: from localhost.localdomain (unknown [89.186.158.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gerddie)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2A9817E0C18;
	Wed, 18 Jun 2025 22:42:16 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 2/6] drm/etnaviv: move some functions to a header to be able to use them externally
Date: Wed, 18 Jun 2025 22:43:30 +0200
Message-ID: <20250618204400.21808-3-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 71 +-------------------
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 85 ++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 70 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.h

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..9e007d977efe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -9,6 +9,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_buffer.h"
 
 #include "common.xml.h"
 #include "state.xml.h"
@@ -17,76 +18,6 @@
 #include "state_3d.xml.h"
 #include "cmdstream.xml.h"
 
-/*
- * Command Buffer helper:
- */
-
-
-static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
-{
-	u32 *vaddr = (u32 *)buffer->vaddr;
-
-	BUG_ON(buffer->user_size >= buffer->size);
-
-	vaddr[buffer->user_size / 4] = data;
-	buffer->user_size += 4;
-}
-
-static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
-	u32 reg, u32 value)
-{
-	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
-
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	/* write a register via cmd stream */
-	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
-		    VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
-		    VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
-	OUT(buffer, value);
-}
-
-static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_END_HEADER_OP_END);
-}
-
-static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
-			    unsigned int waitcycles)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
-}
-
-static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
-	u16 prefetch, u32 address)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_LINK_HEADER_OP_LINK |
-		    VIV_FE_LINK_HEADER_PREFETCH(prefetch));
-	OUT(buffer, address);
-}
-
-static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer,
-	u32 from, u32 to)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
-	OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
-}
-
-static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
-{
-	CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
-		       VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
-		       VIVS_GL_SEMAPHORE_TOKEN_TO(to));
-}
-
 static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
 	struct etnaviv_cmdbuf *buffer, u8 pipe)
 {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
new file mode 100644
index 000000000000..caf820d91ef5
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
@@ -0,0 +1,85 @@
+
+
+#ifndef etnaviv_buffer_h
+#define etnaviv_buffer_h
+
+#include "etnaviv_cmdbuf.h"
+#include "etnaviv_gpu.h"
+#include "etnaviv_gem.h"
+#include "etnaviv_mmu.h"
+
+#include "common.xml.h"
+#include "linux/printk.h"
+#include "state.xml.h"
+#include "state_blt.xml.h"
+#include "state_hi.xml.h"
+#include "state_3d.xml.h"
+#include "cmdstream.xml.h"
+
+static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
+{
+	u32 *vaddr = (u32 *)buffer->vaddr;
+
+	BUG_ON(buffer->user_size >= buffer->size);
+
+	vaddr[buffer->user_size / 4] = data;
+	buffer->user_size += 4;
+}
+
+static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
+	u32 reg, u32 value)
+{
+
+	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
+
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	/* write a register via cmd stream */
+	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
+		    VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
+		    VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
+	OUT(buffer, value);
+}
+
+static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_END_HEADER_OP_END);
+}
+
+static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
+			    unsigned int waitcycles)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
+}
+
+static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
+	u16 prefetch, u32 address)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_LINK_HEADER_OP_LINK |
+		    VIV_FE_LINK_HEADER_PREFETCH(prefetch));
+	OUT(buffer, address);
+}
+
+static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer,
+	u32 from, u32 to)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
+	OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
+}
+
+static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
+{
+	CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
+		       VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
+		       VIVS_GL_SEMAPHORE_TOKEN_TO(to));
+}
+
+#endif
-- 
2.49.0

