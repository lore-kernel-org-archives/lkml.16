Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042103D6D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749003700; cv=none; b=RB3PHaLynHkfR2OhvflOw+09jr6hbB/2kjWGFW/ptJWfBJ7S8bHfPf+dosC/pAVt37qz7/M44QJjDRH7x+Z6DgsJrZyiJojOrjt5tm4NMdCqhsEElqtFdH0FjHCIWG1diweKbXoDUmWTyD0OotfJsn4VKmaazoryyH7JBH7u0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749003700; c=relaxed/simple;
	bh=yKVlVacIyO6fHAnbj1g74NuHD5yCotwXXCd0gK0byYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fYtsBG5qwgSzQw6gQo2WXb/JkLhfR1ut02CfSKj/wqemTOAO9FEfX/mFU3DQ+r1b9tMvflUn5/dI/avDeLI0BHbEKY/zdoyz3cUiZFekbH0+/0nB2yaf15t4E6956QI8Eco5QVGOxnUa5YC7cDsZC6odgLSfoKPCNIsWWRugstA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cmscDv+Z; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cmscDv+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=FF
	qNQjcFki8obBxN9fY+OrSpvsGVKXgp2HXnGZswtco=; b=cmscDv+Z5gV1sDEhuO
	huMpR0YRko3w1NVI2SDAlUsSYgScWfh2zXpneJkxn9RUiK+defpGHQxqXUGmXdLs
	sYx0uiSCmfm3kt1L05TBJjRniXjXz4kmC0QdCSlG1+VtLjzf3y+aWML2j2YDMGbk
	1u0E5nb/DZkIN9Fe/WxQYZ+cI=
Received: from liubaolin-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAXjquMrT9oYdpRGA--.494S2;
	Wed, 04 Jun 2025 10:21:03 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: liubaolin@kylinos.cn,
	liubaolin12138@163.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] jffs2: fix comment typo and adjust formatting
Date: Wed,  4 Jun 2025 10:20:56 +0800
Message-Id: <20250604022056.111032-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXjquMrT9oYdpRGA--.494S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7XrWfJF47tF4kJFWkZwb_yoWDtrcE93
	yUA3ykAFs8tF4UJ3srA3yYvr9Ygw4j9r1Yqr4fJF98ZayDAws8Wr4kJrnay3WUuF4qqrWk
	Xr95Cr9ayr4IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtJPE7UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/1tbiUgliymg-qOnzPgAAso

From: Baolin Liu <liubaolin@kylinos.cn>

This commit makes two documentation improvements:
1. Fixes spelling of "coresponding" to "corresponding"
2. Adjusts comment formatting to meet kernel style guidelines by:
   - Breaking long lines to fit 80-column limit
   - Aligning asterisks in multi-line comments
   - Improving readability while preserving original meaning

No functional changes.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/jffs2/build.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index 6ae9d6fefb86..1e651d3dcef3 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -185,8 +185,10 @@ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
 			 * one. */
 			if (fd->type == DT_DIR) {
 				if (!fd->ic) {
-					/* We'll have complained about it and marked the coresponding
-					   raw node obsolete already. Just skip it. */
+					/* We'll have complained about it
+					 * and marked the corresponding raw node obsolete already.
+					 * Just skip it.
+					 */
 					continue;
 				}
 
-- 
2.39.2

