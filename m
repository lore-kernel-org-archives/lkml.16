Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA72BB04
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743336195; cv=none; b=WXje47A+MPD+dAON4knvvOEqHA3raUxHqeVRYq6ZoLdzC52Dn7HR3WZ3bDmoAEqgrED0Na8mFfNjOJVObcgJ5E7QxIllnmfDVfNv88HdsynEQu3IeZXL/i5W2JTBzqZyzBjgQ3Id03mQdX/9qUc02S7JEsOTLUQmHAlcRtqIQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743336195; c=relaxed/simple;
	bh=o0dnxNicl73pI6O1Lno5+VxPqR6ZQfICJw8VkJNWihY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fBgJJk8x08XZJIcXualHivFCLk7vSxlunPL0v9lEwAaZa19F3RVNCIJEV5Oqs3yleBVgGptlnqmDrB+Barvbepwb91IdS4Xa0zueP7FFK0uXjFVtHohSu16eNmSeB/7kxmQhoLfgUutTz55mS5v8m1A13GudJWxc8ji33sKM2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=Z8X9AgPC; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="Z8X9AgPC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743336190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qfO5eTwwoRJBvkdNLyv0KkdLxqFech3hJfLffpWq3Pg=;
	b=Z8X9AgPCpTmz0oBNpqf8g0xuIrbfyZub85WLrv8ktCGH+Fl7pSQaJ9Dhqs9XIofMfGiXjS
	kV2HmIgrai8zk4ehTSx4EOm5StNEGCTh6nVPrSoeT04/WtYK3YG3KKfiFAyR8XuhTpuaBQ
	PBW3ivDPNPGAKMCUpG7fLkZsQ6TXTDJK/JrO3x3A/Iepx35wsm1qUZ8a0j+8v4QXq/MGNq
	42xcsXMxosX1EAgvmWS4SIwewCjDvW5NbyKyHigda2gW3wvrvCJcyf0jwHVHN32RUAbxbd
	P1rV3XIqWoPTnp8jphB0LOO4Rs8INX2ATZ7mZvBZOZ0FdSwTHtYYDVPAeiVYyw==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Sun, 30 Mar 2025 14:02:04 +0200
Subject: [PATCH] mm: mark mm_struct.hiwater_rss as data racy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-mm-maxrss-data-race-v1-1-2fe0ba6b8482@iencinas.com>
X-B4-Tracking: v=1; b=H4sIALsy6WcC/x3MTQqEMAxA4atI1gZa/xCvIi7SNs5kUZVERBDvP
 mWW3+K9B4xV2GCqHlC+xGTfCnxdQfzS9mGUVAyNa3rX+h5zxky3mmGik1ApMg6RxyG4xMF3UMp
 DeZX7f52X9/0B/SnasmUAAAA=
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

Given that this just provides accounting information and that the extra
accuracy isn't worth the potential slowdown, let's annotate is
__data_racy to make KCSAN happy.

Reported-by: syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
Similar issues have been solved in the past [1]. An actual analysis of 
the data race can be found in [2] and [3].

Lorenzo, I added the Suggested-by as your proposal seems roughly
equivalent to what I propose.

[1] https://lore.kernel.org/all/20210913105550.1569419-1-liupeng256@huawei.com/T/#u
[2] https://lore.kernel.org/all/900c5035-865d-40b7-8d55-0cbbbc059294@lucifer.local/
[3] https://lore.kernel.org/linux-mm/iwtvhos74gwrk5v5szlosnkusxqp6ubqy6ytkclkucbjwdw4zr@bwxyrwcnybbz/
---
 include/linux/mm_types.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 0234f14f2aa6bea42a8a62ccb915c94f556cd3cc..84c86951a978aad07ab4ecefbfff77e7418d8402 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -19,6 +19,7 @@
 #include <linux/workqueue.h>
 #include <linux/seqlock.h>
 #include <linux/percpu_counter.h>
+#include <linux/compiler_types.h>
 
 #include <asm/mmu.h>
 
@@ -939,7 +940,7 @@ struct mm_struct {
 #endif
 
 
-		unsigned long hiwater_rss; /* High-watermark of RSS usage */
+		unsigned long __data_racy hiwater_rss; /* High-watermark of RSS usage */
 		unsigned long hiwater_vm;  /* High-water virtual memory usage */
 
 		unsigned long total_vm;	   /* Total pages mapped */

---
base-commit: 3571e8b091f4270d869dda7a6cc43616c6ad6897
change-id: 20250315-mm-maxrss-data-race-6ce86b0deb14

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>

