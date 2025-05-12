Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED7528D837
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050919; cv=none; b=Z2cRBZBq5A2VHztt7J+ECqOY3I2arEKqr7Qa2qYkGq8ScWQzmpk3myK8G0NlBJfL6LSvGXkegN59Dk0UziYV5MY+G8+oE0ugHalC/EwnzVMTrGhUir/u+6NGXEv8baazNyPz/TNbExy6sJMmvEhQodKPilGLUxI68n3i0BkUXOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050919; c=relaxed/simple;
	bh=7bZWupwPWNBhNeY+PgLjtxu9RVBfTF5znVi1CwfkTj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GpTuCOMm9GO2aTnCdOUvjWdT9k5LcotAputrcB4uGbk18hWeHab5lPk67IohVCLHLzLZT+g8K6mkKL4VgzojlwH89B4K6rsEqFW+vL5pYXHB1yGLpjRKGjtUtC5t4RdIv5C5wb/lglv5KoUYNaXSD4uW1GN+s8hHXgTcsdQAH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6RitHBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6RitHBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3D6C4CEE7;
	Mon, 12 May 2025 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050918;
	bh=7bZWupwPWNBhNeY+PgLjtxu9RVBfTF5znVi1CwfkTj4=;
	h=From:To:Cc:Subject:Date:From;
	b=T6RitHBGJ9+pa5SISRl+XiffykKgkYSpvBTr5XeMlhlglFJbT/nwPACJzlKmCbMHa
	 WJ+BEnCCTfflhxmIjKg4JLPrE42c4Gsh9dc4/SMIktJUYfj27KDAc7kxdFAMc4AjH/
	 2aIh+UQxIP/dyO8h9NGE/X3oyniB2XR8yPXln4zBGINXinxYp1lRQyP9PaeVrnJxj6
	 E3IqH0ZHdgjYRfen7ok3zwFXL2RVpmB86vD4EZZZcb7hqfWRho54GsjgBdaRt2Wq8D
	 ZzD2pMDTCzLnwAv+axs+/HOTfaoDIcguiKkYtIIzujFnXZa/whRyM81x3XVGi8L0tH
	 6Bhp+OjXbhBUQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: fix 32-bits hexademical number in fault injection doc
Date: Mon, 12 May 2025 19:55:14 +0800
Message-ID: <20250512115514.2641059-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FAULT_KMALLOC                    0x000000001

There is one redundant '0' in 32-bits hexademical number of fault type,
remove it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 52 ++++++++++++-------------
 Documentation/filesystems/f2fs.rst      | 52 ++++++++++++-------------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index feafb36fd921..e060798f9fc1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -710,33 +710,33 @@ Description:	Support configuring fault injection type, should be
 		enabled with fault_injection option, fault type value
 		is shown below, it supports single or combined type.
 
-		===========================      ===========
+		===========================      ==========
 		Type_Name                        Type_Value
-		===========================      ===========
-		FAULT_KMALLOC                    0x000000001
-		FAULT_KVMALLOC                   0x000000002
-		FAULT_PAGE_ALLOC                 0x000000004
-		FAULT_PAGE_GET                   0x000000008
-		FAULT_ALLOC_BIO                  0x000000010 (obsolete)
-		FAULT_ALLOC_NID                  0x000000020
-		FAULT_ORPHAN                     0x000000040
-		FAULT_BLOCK                      0x000000080
-		FAULT_DIR_DEPTH                  0x000000100
-		FAULT_EVICT_INODE                0x000000200
-		FAULT_TRUNCATE                   0x000000400
-		FAULT_READ_IO                    0x000000800
-		FAULT_CHECKPOINT                 0x000001000
-		FAULT_DISCARD                    0x000002000
-		FAULT_WRITE_IO                   0x000004000
-		FAULT_SLAB_ALLOC                 0x000008000
-		FAULT_DQUOT_INIT                 0x000010000
-		FAULT_LOCK_OP                    0x000020000
-		FAULT_BLKADDR_VALIDITY           0x000040000
-		FAULT_BLKADDR_CONSISTENCE        0x000080000
-		FAULT_NO_SEGMENT                 0x000100000
-		FAULT_INCONSISTENT_FOOTER        0x000200000
-		FAULT_TIMEOUT                    0x000400000 (1000ms)
-		===========================      ===========
+		===========================      ==========
+		FAULT_KMALLOC                    0x00000001
+		FAULT_KVMALLOC                   0x00000002
+		FAULT_PAGE_ALLOC                 0x00000004
+		FAULT_PAGE_GET                   0x00000008
+		FAULT_ALLOC_BIO                  0x00000010 (obsolete)
+		FAULT_ALLOC_NID                  0x00000020
+		FAULT_ORPHAN                     0x00000040
+		FAULT_BLOCK                      0x00000080
+		FAULT_DIR_DEPTH                  0x00000100
+		FAULT_EVICT_INODE                0x00000200
+		FAULT_TRUNCATE                   0x00000400
+		FAULT_READ_IO                    0x00000800
+		FAULT_CHECKPOINT                 0x00001000
+		FAULT_DISCARD                    0x00002000
+		FAULT_WRITE_IO                   0x00004000
+		FAULT_SLAB_ALLOC                 0x00008000
+		FAULT_DQUOT_INIT                 0x00010000
+		FAULT_LOCK_OP                    0x00020000
+		FAULT_BLKADDR_VALIDITY           0x00040000
+		FAULT_BLKADDR_CONSISTENCE        0x00080000
+		FAULT_NO_SEGMENT                 0x00100000
+		FAULT_INCONSISTENT_FOOTER        0x00200000
+		FAULT_TIMEOUT                    0x00400000 (1000ms)
+		===========================      ==========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
 Date:		January 2023
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 157743ab107d..724fc5e2889a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -182,33 +182,33 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 enabled with fault_injection option, fault type value
 			 is shown below, it supports single or combined type.
 
-			 ===========================      ===========
+			 ===========================      ==========
 			 Type_Name                        Type_Value
-			 ===========================      ===========
-			 FAULT_KMALLOC                    0x000000001
-			 FAULT_KVMALLOC                   0x000000002
-			 FAULT_PAGE_ALLOC                 0x000000004
-			 FAULT_PAGE_GET                   0x000000008
-			 FAULT_ALLOC_BIO                  0x000000010 (obsolete)
-			 FAULT_ALLOC_NID                  0x000000020
-			 FAULT_ORPHAN                     0x000000040
-			 FAULT_BLOCK                      0x000000080
-			 FAULT_DIR_DEPTH                  0x000000100
-			 FAULT_EVICT_INODE                0x000000200
-			 FAULT_TRUNCATE                   0x000000400
-			 FAULT_READ_IO                    0x000000800
-			 FAULT_CHECKPOINT                 0x000001000
-			 FAULT_DISCARD                    0x000002000
-			 FAULT_WRITE_IO                   0x000004000
-			 FAULT_SLAB_ALLOC                 0x000008000
-			 FAULT_DQUOT_INIT                 0x000010000
-			 FAULT_LOCK_OP                    0x000020000
-			 FAULT_BLKADDR_VALIDITY           0x000040000
-			 FAULT_BLKADDR_CONSISTENCE        0x000080000
-			 FAULT_NO_SEGMENT                 0x000100000
-			 FAULT_INCONSISTENT_FOOTER        0x000200000
-			 FAULT_TIMEOUT                    0x000400000 (1000ms)
-			 ===========================      ===========
+			 ===========================      ==========
+			 FAULT_KMALLOC                    0x00000001
+			 FAULT_KVMALLOC                   0x00000002
+			 FAULT_PAGE_ALLOC                 0x00000004
+			 FAULT_PAGE_GET                   0x00000008
+			 FAULT_ALLOC_BIO                  0x00000010 (obsolete)
+			 FAULT_ALLOC_NID                  0x00000020
+			 FAULT_ORPHAN                     0x00000040
+			 FAULT_BLOCK                      0x00000080
+			 FAULT_DIR_DEPTH                  0x00000100
+			 FAULT_EVICT_INODE                0x00000200
+			 FAULT_TRUNCATE                   0x00000400
+			 FAULT_READ_IO                    0x00000800
+			 FAULT_CHECKPOINT                 0x00001000
+			 FAULT_DISCARD                    0x00002000
+			 FAULT_WRITE_IO                   0x00004000
+			 FAULT_SLAB_ALLOC                 0x00008000
+			 FAULT_DQUOT_INIT                 0x00010000
+			 FAULT_LOCK_OP                    0x00020000
+			 FAULT_BLKADDR_VALIDITY           0x00040000
+			 FAULT_BLKADDR_CONSISTENCE        0x00080000
+			 FAULT_NO_SEGMENT                 0x00100000
+			 FAULT_INCONSISTENT_FOOTER        0x00200000
+			 FAULT_TIMEOUT                    0x00400000 (1000ms)
+			 ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
 			 writes towards main area.
-- 
2.49.0

