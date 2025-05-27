Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7705822541D;
	Tue, 27 May 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335780; cv=none; b=k4xyEYxuCKM8EaAv11bJycjJBSCd2JPG0ol32qeR9M+xTzzm+S1rru1LO/h7d802+D9xejt55LIWCdxErUXjVnNlxrWOYED4u8VviftdXGFuoHdd+jij8RtmAk+SfAcmylubEfX9AbXdE3NeTDo3ZfpTC3T4H3L+z7pw4HK+yfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335780; c=relaxed/simple;
	bh=O9kGHrgxOUE8ZyrzbLBPgmOCjYVcw8rjbr7BRYy7/Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ilVPms14fP8NJ+7Dv3nPNE2H+aHNMuYinP9373dDQ4Nk+Qzo5I/2dYnHW4rHEWot4+OsXBeY02IQVdL4upA5w9v0sXYLUubNSohD5XUgyE5GvR7iSyKcHl0a/t0bpwnlONjZrRsBQqyBobujSPtUP5yZzgQX9TNvxKmkrBq97r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 907736018E58D;
	Tue, 27 May 2025 16:49:30 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: dhowells@redhat.com,
	marc.dionne@auristor.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] afs: Replace simple_strtoul with kstrtoul in afs_parse_address
Date: Tue, 27 May 2025 16:49:18 +0800
Message-Id: <20250527084916.1699109-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kstrtoul() is better because simple_strtoul() ignores overflow which
may lead to unexpected results.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/afs/addr_prefs.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/afs/addr_prefs.c b/fs/afs/addr_prefs.c
index c0384201b8fe..ae4f4b371882 100644
--- a/fs/afs/addr_prefs.c
+++ b/fs/afs/addr_prefs.c
@@ -118,7 +118,10 @@ static int afs_parse_address(char *p, struct afs_addr_preference *pref)
 
 	if (*p == '/') {
 		p++;
-		tmp = simple_strtoul(p, &p, 10);
+		if (kstrtoul(p, 10, &tmp)) {
+			pr_warn("Invalid address\n");
+			return -EINVAL;
+		}
 		if (tmp > mask) {
 			pr_warn("Subnet mask too large\n");
 			return -EINVAL;
@@ -130,11 +133,6 @@ static int afs_parse_address(char *p, struct afs_addr_preference *pref)
 		mask = tmp;
 	}
 
-	if (*p) {
-		pr_warn("Invalid address\n");
-		return -EINVAL;
-	}
-
 	pref->subnet_mask = mask;
 	return 0;
 }
-- 
2.30.2

