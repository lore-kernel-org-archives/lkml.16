Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C39259CBD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752480; cv=none; b=Bje1eRvosGKTruFXVTeCnBx/Zf/+dRGM1Z2/tm3xNSCvNb04BcCfhkK35PqwQ9YQTX4kurJEoXEI0eURyjaN/cbByK8aUup26mMf4mcmjBUrXxPIEKJ6HzTy+3ftcH0QZyhHhvPgKH6YLVY8cb8+w4gL96XwJuWkZEXjEHnII48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752480; c=relaxed/simple;
	bh=c6UDcIDyzZ6qW59yUgvi/yuhmhVWY7kVCwSyr8AcXRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PPkVaQmMVP5h6tpWeqOqaK9YWodeQV+3OZLPjeGfF8cLiu49zBML+shsOAZPKH0Hk6VTtri7PInIfmR4nwXl3C7dy31HNyPIPqjEjYOgZ//O1vZyEG1hU4iFUVmMZglsibiiJGo00WDn+wm3zhaOlSUGWkQb0+spg14j5RhBEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCAC6106F;
	Tue, 24 Jun 2025 01:07:39 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0FE6F3F66E;
	Tue, 24 Jun 2025 01:07:54 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com
Cc: richard.weiyang@gmail.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] maple tree: Use goto label to simplify code
Date: Tue, 24 Jun 2025 13:37:48 +0530
Message-Id: <20250624080748.4855-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the underflow goto label to set the status to ma_underflow and return
NULL, as is being done elsewhere.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 lib/maple_tree.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 00524e55a21e..25cf2bc607ca 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -4565,11 +4565,8 @@ static void *mas_prev_slot(struct ma_state *mas, unsigned long min, bool empty)
 		return entry;
 
 	if (!empty) {
-		if (mas->index <= min) {
-			mas->status = ma_underflow;
-			return NULL;
-		}
-
+		if (mas->index <= min)
+			goto underflow;
 		goto again;
 	}
 
-- 
2.30.2

