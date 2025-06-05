Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B01F4F1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749124836; cv=none; b=pCLOWPYTNQ2iNRQR3Zf+A4LCZdB9hgYouCRaqEXPNp5yqHyR/ff9iuiYL/IYQ0R4ksbb2CRwoIFcIMwQYRstw2yoPGzmY6UFhpLgIwHgOEJ4IVBqTsRuZxabJmHFfr5ag9H7Lqyai0PeX8D8Bv8L670TtLkg+OwR1OXB8iWJWIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749124836; c=relaxed/simple;
	bh=4XwaRdrfsWboTFY1aBQZSYoABCpT0jpHfTL4v1OAo6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j6qrc7SKWQsPmoiV5K4wfWssgAHDPiMiLf3RnTn9WV5eJ067sn/YhGWGGkfkV4dfJH9PdzcDDeDf1h4w2ug5dXlt28IHl2p5MkthrvnmKiyh4WOkYqT/E/nwu46/qDJnIeQd3SH1X9LoydWJxkc1vZrPSdwc2i6tkGa5GR8Z77U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=n2Ng5+Mf; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="n2Ng5+Mf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=KR
	NCC18omdfEpRQUVlWfZpcOMAD5V4isyK2fPf4AK+o=; b=n2Ng5+MfJomWlDyCJA
	mspK/xhkHAC4SrMEcM+lSVbCSItvu6RueGzPuuAzyxzg/fwGk+dfxXViNqEj7t4M
	xws6xZw6iXJ8qZD6Ae+a2VFv1nKDE/uI46ywkJrasL+RCfaFsPuGIE2UCAQCyq4H
	AnInUTj9Xpf7EoZ9W6m02Z5N4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnSdy_hkFoCz2rGQ--.7118S2;
	Thu, 05 Jun 2025 20:00:00 +0800 (CST)
From: luoqing <l1138897701@163.com>
To: obitton@habana.ai,
	peterz@infradead.org
Cc: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	luoqing@kylinos.cn
Subject: [PATCH 1/2] accel/habanalabs: ZERO_OR_NULL_PTR Macro overdetection
Date: Thu,  5 Jun 2025 19:59:58 +0800
Message-Id: <20250605115958.799831-1-l1138897701@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnSdy_hkFoCz2rGQ--.7118S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1ktr4kCFWDCr45tr47Jwb_yoW8ur4fpF
	4UGFnYya15tryDuF4jy3yku3W5GanIgFW7KFy2y3s09asxX347C3W5Ga4qqry7urWUuanx
	ZF1UC3WUCa1rZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UvQ6XUUUUU=
X-CM-SenderInfo: jorrjmiyzxliqr6rljoofrz/1tbiEARiRGhAMMu2UgACsH

From: luoqing <luoqing@kylinos.cn>

sizeof(xx) these variable values' return values cannot be 0.
For memory allocation requests of non-zero length,
there is no need to check other return values;
it is sufficient to only verify that it is not null.

Signed-off-by: luoqing <luoqing@kylinos.cn>
---
 drivers/accel/habanalabs/common/memory.c  | 4 ++--
 drivers/accel/habanalabs/common/mmu/mmu.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 601fdbe70179..0d2782529ec3 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -140,7 +140,7 @@ static int alloc_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args,
 	phys_pg_pack->contiguous = contiguous;
 
 	phys_pg_pack->pages = kvmalloc_array(num_pgs, sizeof(u64), GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(phys_pg_pack->pages)) {
+	if (!(phys_pg_pack->pages)) {
 		rc = -ENOMEM;
 		goto pages_arr_err;
 	}
@@ -887,7 +887,7 @@ static int init_phys_pg_pack_from_userptr(struct hl_ctx *ctx,
 
 	phys_pg_pack->pages = kvmalloc_array(total_npages, sizeof(u64),
 						GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(phys_pg_pack->pages)) {
+	if (!(phys_pg_pack->pages)) {
 		rc = -ENOMEM;
 		goto page_pack_arr_mem_err;
 	}
diff --git a/drivers/accel/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
index 79823facce7f..a3cf14cf5abc 100644
--- a/drivers/accel/habanalabs/common/mmu/mmu.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu.c
@@ -844,7 +844,7 @@ int hl_mmu_hr_init(struct hl_device *hdev, struct hl_mmu_hr_priv *hr_priv, u32 h
 	}
 
 	hr_priv->mmu_asid_hop0 = kvcalloc(prop->max_asid, sizeof(struct pgt_info), GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(hr_priv->mmu_asid_hop0)) {
+	if (!(hr_priv->mmu_asid_hop0)) {
 		dev_err(hdev->dev, "Failed to allocate hr-mmu hop0 table\n");
 		rc = -ENOMEM;
 		goto destroy_mmu_pgt_pool;
-- 
2.25.1

