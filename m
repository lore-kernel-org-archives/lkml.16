Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D1B335BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881930; cv=none; b=ogos1qD/XnM7rrONFW7ENxL2Vg3NA5fiwtehcecmvdOkortVnDRfkox3VDZIHPMZ/plcbn0VzpILWCHTbMEMJ5y/uTA7QvU0kipqzv6ywpPA15MHKPEm7CjolDJQjmC7wXfyU2QpGro2gqLcUdbaTsnEIo//rCkRZiSffPEEL0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881930; c=relaxed/simple;
	bh=K7AiGD8Wrma7f04yrEFvYmfkO2/F7mTbzH9eY+bJsBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WfutbW4vkpg50s0A2oL95vvBZxoQZrolbpYjuV10H70meQfe/Df5hrBtbwmwdztUkzCOR1ANT+r8EYh3Gek6m6auMv3IcV554U2E0H0MAMS4aMeMtOkaRG5JkC6nAGHgzJHW2WKd5wpeMWqCba+IwqOCOwvAK0yyhA87yfeFdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UWbiXbiX; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UWbiXbiX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744881924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SfwgROIDadVbaR4igOtSawlNRohOkl+zEoFeXeINbfI=;
	b=UWbiXbiXvblAzIZ0n9b/4C4xtKxi50muEZGaj8aqV3broqUSyrylwL4vcvzbBhhIeZOSXa
	2ejGRKHnzq+Ja7EbJxfJzQx18cRczNmw3k+PJ9D5mikCmJjlT3CPQ8vj2Z1dX9g81HJ1Bb
	kZ52mqafbuIULvf9h2kHVs6MbpacrKg=
From: Hao Ge <hao.ge@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hao Ge <gehao@kylinos.cn>
Subject: [PATCH] mm/vmscan: Modify the assignment logic of the scan and total_scan variables
Date: Thu, 17 Apr 2025 17:24:22 +0800
Message-Id: <20250417092422.1333620-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hao Ge <gehao@kylinos.cn>

The scan and total_scan variables can be initialized to 0
when they are defined, replacing the separate assignment statements.

Signed-off-by: Hao Ge <gehao@kylinos.cn>
---
 mm/vmscan.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b620d74b0f66..bf360ac4f1cf 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1725,13 +1725,11 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
 	unsigned long nr_taken = 0;
 	unsigned long nr_zone_taken[MAX_NR_ZONES] = { 0 };
 	unsigned long nr_skipped[MAX_NR_ZONES] = { 0, };
-	unsigned long skipped = 0;
-	unsigned long scan, total_scan, nr_pages;
+	unsigned long skipped = 0, total_scan = 0, scan = 0;
+	unsigned long nr_pages;
 	unsigned long max_nr_skipped = 0;
 	LIST_HEAD(folios_skipped);
 
-	total_scan = 0;
-	scan = 0;
 	while (scan < nr_to_scan && !list_empty(src)) {
 		struct list_head *move_to = src;
 		struct folio *folio;
-- 
2.25.1

