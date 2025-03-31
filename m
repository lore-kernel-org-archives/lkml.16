Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402C1BFE00
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743451042; cv=none; b=NxH/0Ws+ZzlIF0+3BEyLi2kYeM07PiDaIcq+89mywYvwHiRpHNik7tsihs5XYYl2gajpn5ooaJLN1ny096hDA8MnNHoaOHo2EvKBe2Ny7FPyvMUIYeeSMYJ1BVLwEecGvv38ALqPpZyVez/y8SimK2DxfGwqZnDfa0BqNY3CTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743451042; c=relaxed/simple;
	bh=PSCK4a0kIGkMbnQ2RMFf1SKmydteudpPHcYP/QfaXYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y+9u0UFN9duT3wlgkEJT1pyCh9TJFsyDi/DvVErTLeJDCS692bC5NkoUxBENrPbrBsct2EM9MNoKD2rzmsSsTsl0ci1fTaCyKyAyB1yIIt1T3tA8bYdTDt7PvMTRSZWQT90PgwS3sERv1jeMrmYL8ba1IGo9N7iugsoXMrD3tT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=KzPGOxnq; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="KzPGOxnq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743451034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TR+EVp0RJxzPaDlgwVLkfyb7+8Z1TDtRU9YgZVmXlP4=;
	b=KzPGOxnqi02m1/QGqoIy6lUSOWqh/zNsGRSyD+7ednPnI8tXSADVVo8iYM+wuXt5VmRO1F
	+kMjlJ1eejMWaN1pDH3QChzJ9nxQedhBxKQsDFUsDP0yrgtcdw10J5WCdqsyKcvlbfbc7P
	Uwcsq0JEeg4Z0sn5X938v0Y0bJUJwI5sBlEBRnVb9CaqrjFAERdpOpQIaqnLt1POiC4FeG
	afhhz45VRVbSUr5ipuITpC/xniEh2zFMcAYKAS1HgMXpO4fLgUNub3WiRMPGBU8TLn7mNH
	fC83PVKte6RLNmQ57a1UA9Nc4t5FtpeRKqZ/2zVc2+BMtCsHhjulb3/9c/ezzQ==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Mon, 31 Mar 2025 21:57:05 +0200
Subject: [PATCH v2] mm: annotate data race in update_hiwater_rss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mm-maxrss-data-race-v2-1-cf958e6205bf@iencinas.com>
X-B4-Tracking: v=1; b=H4sIAJDz6mcC/22NywqDMBBFf0Vm3SlJfCBd9T+Ki0kc6ywSSyLBI
 v57U+myy3PgnrtD4iic4FbtEDlLkiUUMJcK3EzhyShjYTDKtKrWLXqPnraYEo60EkZyjJ3jvrN
 qZKsbKMtX5Em2s/oYCs+S1iW+z5Osv/bXq9XfXtao0UysLHW2b3pzFw5OAqWrWzwMx3F8AB0ws
 d65AAAA
X-Change-ID: 20250315-mm-maxrss-data-race-6ce86b0deb14
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com, 
 Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT

mm_struct.hiwater_rss can be accessed concurrently without proper
synchronization as reported by KCSAN.

This data race is benign as it only affects accounting information.
Annotate it with data_race() to make KCSAN happy.

Reported-by: syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67e3390c.050a0220.1ec46.0001.GAE@google.com/
Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
Changes in v2:
- Annotate the actual race with data_race() instead of marking the
  struct field as __data_racy as suggested by Lorenzo. The commit title
  and description has been updated accordingly

  I also changed (mm) to mm as the parenthesis are no longer necessary
  (this particular snippet of code comes from an old macro)

- Add missing Closes tag for the syzbot report
- Link to v1: https://lore.kernel.org/r/20250330-mm-maxrss-data-race-v1-1-2fe0ba6b8482@iencinas.com
---
 include/linux/mm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb70b732a4f2843e6b55fd73cc3e320..572b2001588b8afe68a468840cc75cd63cd4b543 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -32,6 +32,7 @@
 #include <linux/memremap.h>
 #include <linux/slab.h>
 #include <linux/cacheinfo.h>
+#include <linux/compiler.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -2665,7 +2666,7 @@ static inline void update_hiwater_rss(struct mm_struct *mm)
 {
 	unsigned long _rss = get_mm_rss(mm);
 
-	if ((mm)->hiwater_rss < _rss)
+	if (data_race(mm->hiwater_rss) < _rss)
 		(mm)->hiwater_rss = _rss;
 }
 

---
base-commit: 3571e8b091f4270d869dda7a6cc43616c6ad6897
change-id: 20250315-mm-maxrss-data-race-6ce86b0deb14

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>

