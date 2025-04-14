Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060BB27CB37
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627989; cv=none; b=EOHsTBjxnae4Hsj74ZhOz2z/E3derswn5EOjfVcLP4fpczAHN/Uk5YjWPaxbGXtzIJJ6rGOYz4Zp4kjjKonGdgdAarrkYQRsRbhwY9tUC0kbbGRxdHkVMtUle3jqQcXNgnHWo5803z+xRs/MDH6QuSf09cR4Jq8v/gcfzW2AuBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627989; c=relaxed/simple;
	bh=N/oOtBHpVIf8Y/Ndag63Io3nJvG/R35WBpnc8Gbkk3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EPy8obQAp/KmjAVkImA/6oWjrh3U5tYhWq1EwUNdeYCNu7mLJuKorEtnaFJmOGLrtqF5HZUBUT8gqd/ON1dzssce3cqUXzbbssbkxfEeWV3HZHNiiYXhIxSjyAYZREnC06CsqsEEf58hwAM/+03s6hfahibWYZRdBryGDE2Thb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvZ+4ZND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvZ+4ZND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E7CC4CEE5;
	Mon, 14 Apr 2025 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744627988;
	bh=N/oOtBHpVIf8Y/Ndag63Io3nJvG/R35WBpnc8Gbkk3M=;
	h=From:To:Cc:Subject:Date:From;
	b=AvZ+4ZNDXksZ2kxcbOjHn3IEZRPwm6/Ky7/sPA7LppeRx0Q5GvMU1sCIk23BFbUTP
	 yImEKznZg7emCp4ltFbOZe8PebAwS6vrAITeGPsC9rZEwy3qIog8flJXBd3jnHaYk7
	 2+Ou+mFK+xBc9Fut0dgs4n1qcZuAaFlYugh0wSaUtvR4qWrY34oZBAFv8JEJkPiEI5
	 q8n+SmIhmndD2hMaBeNgefjjzn+6C/je7EdU/OQSlA2OjGBQIx9B7P346oj3sMMVSZ
	 aC9+OksDKxc+MvqEHuCu+qjB4TZ6BQV0yE9aYLRzWJwhl+6OPTuvEvsEcqyaVBbiOr
	 9uAUKyNBriOEA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 1/2] f2fs: clean up w/ fscrypt_is_bounce_page()
Date: Mon, 14 Apr 2025 18:52:36 +0800
Message-ID: <20250414105237.728522-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just cleanup, no logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1a90aca499f6..4f70755c30cc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -53,7 +53,7 @@ bool f2fs_is_cp_guaranteed(struct page *page)
 	struct inode *inode;
 	struct f2fs_sb_info *sbi;
 
-	if (!mapping)
+	if (fscrypt_is_bounce_page(page))
 		return false;
 
 	inode = mapping->host;
-- 
2.49.0

