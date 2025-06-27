Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F0A3C01
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750991921; cv=none; b=pGVhh9bDxYtN2mBvXjlc/+cpycEP4dMEnRaJQ/N684asDXhgUxfSBPwjjttkpB4br0OWOXJlOHztIoyfyvJC9HBKIDloEvwDMIuNyWbyl4GUGZbJYs5qHpS1jdRh7fJiucf9XDGx0Ar63zjx5M7tqO2usFUQOUnQBeFWqI54aNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750991921; c=relaxed/simple;
	bh=oMsLvDUkqKgim7HwPwGvDv4iUc8AjPZwg/gdL6qiTaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sG2AiEa+9VIn9WrJ4DmlPHN93U+D3xcYH0ydAgXqMMZzceLUu2++A279Ne5d/yeS/Uv2nPyd9HNCvyHUO+pJPMcDuHdo0l1e3T7IvvaVCmLCzcZXnlkBwsRPride8Ss6QL3nPQyWckI/X/S82rRdRKv1sb9nsnX6/Wb5y0qzfJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUJZKxi7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUJZKxi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B03C4CEEB;
	Fri, 27 Jun 2025 02:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750991920;
	bh=oMsLvDUkqKgim7HwPwGvDv4iUc8AjPZwg/gdL6qiTaY=;
	h=From:To:Cc:Subject:Date:From;
	b=CUJZKxi7fIu66jBVxtJyVEK0n/7U/XDMJeZ2WWj2XtNqnPmMRbvSO2l3mJgEsBe1q
	 NaISllSVG1/M381wZ4x9fWeNoZKVj8KdOn8hnC7ZIZ38BCurFZqpTcIVj+37p9k44y
	 TmLgTuRnhGQoDn+QnElM67JFmoHHWgIPp/7X1rTyzeP1/fg6EXqJG4Iwz2gsSgGnd9
	 foz5aRdRJ/Gq06Fk4lDFpHGdOnyaady6jqxCRrpKe7aj1KKYls2FDBCGVYF9kmr4oN
	 Waob/Yng9EsRnWyq6+AnTxtF1OINVuLKyOprzhTOUm73J9lp+8ZB0Y/FUZGPJPTqKj
	 T73mm4TdFvpFg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 1/2] f2fs: fix to check upper boundary for gc_valid_thresh_ratio
Date: Fri, 27 Jun 2025 10:38:17 +0800
Message-ID: <20250627023818.146534-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds missing upper boundary check while setting
gc_valid_thresh_ratio via sysfs.

Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2b5c35ce7b8c..d74472d96026 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -635,6 +635,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_valid_thresh_ratio")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
-- 
2.49.0

