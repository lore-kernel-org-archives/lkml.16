Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7E3635F8;
	Mon,  5 May 2025 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485159; cv=none; b=A5sVyzwxBtnWN4xQyETw2hTfueSclrX93vkMT2AgB4gj/A+lGO34iOtBzG54EoIovta/AidUKyO/zTKkCw5fCCLv5x6ftcGx6DrD97T6z/6pYKKJJpN2qlabejiZ3UPaTjPTFkIVoVyZhDwgbdVgOhQGUA2ai8vl9D2Qvaj3/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485159; c=relaxed/simple;
	bh=EB1GnnZT7mucs92J9m0dnFJwYjl6rxK5W6sSbkkOZoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e77p1iTsG6SUduvOkavVaA6kSRjv8BfJKB5Gp9GAHTRdI61AfP5YKq37k6GVFzEPm2bBRtDpPZdUIHoRJYsiaUzs+vSW4FloXyhN7rxV9L2XnEZu1Hh8DUsQUTU/mWeEdiSA/rqVA7BNjbUQXXwDOnhyT/+fwhLModVoOjOif2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJBYk7pg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJBYk7pg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D77C4CEE4;
	Mon,  5 May 2025 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485157;
	bh=EB1GnnZT7mucs92J9m0dnFJwYjl6rxK5W6sSbkkOZoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJBYk7pggU+bDtoXn9wDCLCyYaNiLZDAQ4FTXwc3giPfZobZuQXbG+pMSTXk1BLt8
	 7E6ae38HnxIR4NiZQSLhRq2WcHv35YrnnG+IyQsQzyl/+xgFMa1SDcWm/jLA1F8cRZ
	 ieUUuro4CfZLhwIfJa7sj6IjaDz4+d7IwZ6WrC26pVliGbRtj3WtsTr4DWiUrYSZ49
	 Pk4hnTtgus87gZ6ZDKrW/isT8kRuJCLxNBsIKC7eeFgj0+kZSqCESNM+1YD8yxmsLp
	 LnKEcupldIaxVUUNJA35E8cDChDNppW9+KDsRb/v4sPDeVqRsPTrJ012fRoaL4WhY0
	 xTLzuaVIs+PMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mike Marshall <hubcap@omnibond.com>,
	Christian Brauner <brauner@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	devel@lists.orangefs.org
Subject: [PATCH AUTOSEL 6.12 191/486] orangefs: Do not truncate file size
Date: Mon,  5 May 2025 18:34:27 -0400
Message-Id: <20250505223922.2682012-191-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

[ Upstream commit 062e8093592fb866b8e016641a8b27feb6ac509d ]

'len' is used to store the result of i_size_read(), so making 'len'
a size_t results in truncation to 4GiB on 32-bit systems.

Signed-off-by: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Link: https://lore.kernel.org/r/20250305204734.1475264-2-willy@infradead.org
Tested-by: Mike Marshall <hubcap@omnibond.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/orangefs/inode.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index aae6d2b8767df..63d7c1ca0dfd3 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -23,9 +23,9 @@ static int orangefs_writepage_locked(struct page *page,
 	struct orangefs_write_range *wr = NULL;
 	struct iov_iter iter;
 	struct bio_vec bv;
-	size_t len, wlen;
+	size_t wlen;
 	ssize_t ret;
-	loff_t off;
+	loff_t len, off;
 
 	set_page_writeback(page);
 
@@ -91,8 +91,7 @@ static int orangefs_writepages_work(struct orangefs_writepages *ow,
 	struct orangefs_write_range *wrp, wr;
 	struct iov_iter iter;
 	ssize_t ret;
-	size_t len;
-	loff_t off;
+	loff_t len, off;
 	int i;
 
 	len = i_size_read(inode);
-- 
2.39.5

