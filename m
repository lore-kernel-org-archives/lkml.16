Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5493777BD;
	Mon,  5 May 2025 23:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486021; cv=none; b=u8tiQQfeiaGIKZq1k/3V5VLLB6t0hdQb5E9TKKbpW4wYxlbVZYgZ4uWpse5iI0gxWUdfSsYjz3qY0omv/x+WuB6b+qwqV31CvYTxq6jjPRIc4HMNVrWLxIUa/IhYMkOPkM2aRRgGqUNRtxb6CYjEIYpQQIIdYwWtOaYVfCsgu4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486021; c=relaxed/simple;
	bh=YW0jX8zq+zWnDkmVJ38imKWPGNmPWjzxxGWf3O3yEjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dzvUG1Jn2KJfrNDKr95Hwq9SCflRGnHD58EFvEr2whgbAqMZ1MdZ9kcUTP64Wd0Hz5Hiu6Noesf8kbNmfdam+eM3+gSyVfqh7zGnF4bVsCEhjmeAgqNKcr/ZIpsGQe4moLIUgR6NmYQY9Hn34MU0cwZpchb9HlQUr5T16YEu9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaVwUfif; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaVwUfif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F6C4CEEF;
	Mon,  5 May 2025 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486020;
	bh=YW0jX8zq+zWnDkmVJ38imKWPGNmPWjzxxGWf3O3yEjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AaVwUfifeI7/hZvDgF6kxUYfrglrP2OTZQWUigKpKpiOtDmWh7maMY4SHbGblm4bx
	 IfH1/4Iv97Qu+kdlAa4cijx330AHokInsOIxFamGHz9rz9r1BkiJiMc62DdG5Hiswj
	 md5S3VViWw9FA5lNRxrHNyNgV9LL6xTGWWFQsOchQBzV67CT7K32CGExAo3lV89L0B
	 gehGFPhCMAZcIkAPzary4uuu1Vj44e9krC+OpVewXbC6xcWbYyzlcHMrT/ENTurWL2
	 dBZ3lvoLfXpjXmGxlb/nlVFGqM3BgJT+ylaOcGs+UgHvk22qveaA3n/qBPcRDHJbNr
	 QL/C+nCJYwRBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mike Marshall <hubcap@omnibond.com>,
	Christian Brauner <brauner@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	devel@lists.orangefs.org
Subject: [PATCH AUTOSEL 6.6 114/294] orangefs: Do not truncate file size
Date: Mon,  5 May 2025 18:53:34 -0400
Message-Id: <20250505225634.2688578-114-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 0859122684425..dd4dc70e4aaab 100644
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
 
@@ -92,8 +92,7 @@ static int orangefs_writepages_work(struct orangefs_writepages *ow,
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

