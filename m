Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E804A0C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751002486; cv=none; b=Oh3MVMd0QU7Wft7sskFRnjjgL0E1IavIgbkxERv3O+59wOfI8V3oRLMfxVWcGHu1hdJVKx4am+HNWkztrTLsRElyagH9L/U55OdXftZrN4BcQRrHX8Qm4ZNp8/uEU9oVXjuM1Dv8bwcvsEDPZBf34SKQiikNeySfLdME8H/w3Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751002486; c=relaxed/simple;
	bh=gRMvd6yyd2T+iGylj2sKhhUXMBLmLgTjGCZzVuzoA9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nbwotLtqpwUnowQP1NSESjzNfukIayv9OD7mig4j6cn4Hio2e30cbgoXJTWaYW1V5ylD5KYFgKZ79mWRjUv3t73dNt9WPmHCEEyng9SnSvmEZU+nVlkLiPqlOmnV2CrhUoNstRSgOb8bGsgNb+FU+1eE346wHVw942+JlmPSxcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wz4mlBfN; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wz4mlBfN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751002482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R+XanjQCXGfmpNHqAkipJpPWqbw+txEndPBxVTTVf9Q=;
	b=Wz4mlBfNkzZHxRl4mDzlmhBoWxIgQAahFtv8GuiQNOVhV/PjkVPqgZK1LMf7gcu6skoodI
	CWD1LF/4cJB48yeVNQX6bHLaN9SMZTZsumin2neCuhoHs4tF+n6Scl+gNAZrRonOR5xgxS
	t6cvTl+94zwRxL6wzlR3zseVHoN/lq0=
From: Youling Tang <youling.tang@linux.dev>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH] xfs: add FALLOC_FL_ALLOCATE_RANGE to supported flags mask
Date: Fri, 27 Jun 2025 13:33:44 +0800
Message-Id: <20250627053344.245197-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

Add FALLOC_FL_ALLOCATE_RANGE to the set of supported fallocate flags in
XFS_FALLOC_FL_SUPPORTED. This change improves code clarity and maintains
by explicitly showing this flag in the supported flags mask.

Note that since FALLOC_FL_ALLOCATE_RANGE is defined as 0x00, this addition
has no functional modifications.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/xfs/xfs_file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 48254a72071b..d7f6b078d413 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -1335,7 +1335,8 @@ xfs_falloc_allocate_range(
 }
 
 #define	XFS_FALLOC_FL_SUPPORTED						\
-		(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |		\
+		(FALLOC_FL_KEEP_SIZE |					\
+		 FALLOC_FL_ALLOCATE_RANGE | FALLOC_FL_PUNCH_HOLE |	\
 		 FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |	\
 		 FALLOC_FL_INSERT_RANGE | FALLOC_FL_UNSHARE_RANGE)
 
-- 
2.34.1

