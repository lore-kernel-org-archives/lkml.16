Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E2179A7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739150736; cv=none; b=hB+MTIud/GRI4E5VHeYDpKKz0QGXdNfJ6ZUXg8ys/BUB30XQVRO9jtH3+yINoHF8jg6HV9JFCOQhRcDzoICc0XegCOOCBVx7gN0V0o0W4J3X/1HLG3gCQJAtffIPa/x8W00IHjQtTL/smYHr1zLQbHkNHlosnN8+MwkMSKeGktY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739150736; c=relaxed/simple;
	bh=f+G3q/pNJISJmiFuRi6woTAEa58aizVIcDsfbU95MLQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WD3c54Cy6ocHgHNySqC1z/QcUSjkq3aXGoidcP74B6/ruC51hHls1YzfWp7MEmvx3JZPQ7i7zDDT1BPKUUUeWVGZFjfAVrypeur55csNs2mj5iCmZ+fCVUwgySdC3QqnPmzTbU0YsvZVUoHjV4vQmfyKsLiPMcjEoWj56ugXbCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 51A1OZdr053630;
	Mon, 10 Feb 2025 09:24:35 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Yrmwc2c04z2P6YcF;
	Mon, 10 Feb 2025 09:20:32 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 10 Feb 2025 09:24:32 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>,
        <Hao_hao.Wang@unisoc.com>
Subject: [PATCH] f2fs: fix to return SHRINK_EMPTY if no objects to free
Date: Mon, 10 Feb 2025 09:24:09 +0800
Message-ID: <1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 51A1OZdr053630

Quoted from include/linux/shrinker.h
"count_objects should return the number of freeable items in the cache. If
 there are no objects to free, it should return SHRINK_EMPTY, while 0 is
 returned in cases of the number of freeable items cannot be determined
 or shrinker should skip this cache for this time (e.g., their number
 is below shrinkable limit)."

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 45efff6..9c8d3ae 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -73,7 +73,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 		mutex_unlock(&sbi->umount_mutex);
 	}
 	spin_unlock(&f2fs_list_lock);
-	return count;
+	return count ?: SHRINK_EMPTY;
 }
 
 unsigned long f2fs_shrink_scan(struct shrinker *shrink,
-- 
1.9.1

