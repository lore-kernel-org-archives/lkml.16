Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379B2010EB;
	Tue,  4 Feb 2025 01:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738631939; cv=none; b=ENMNxT09/ZCd+LRbNiGBSXbRokF8LJxmbe+JUig057RcP2nrDYKdWUTixR7TwgUb92jB16phss0I3cAh6NwAOoxlKmLYoDPb8vetxo26o1/LWwaIhbJXofYwghH7O6AVcMXRk5fUD8SoKS2GKfTsb2OyrKoiehHwZscWErDiSJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738631939; c=relaxed/simple;
	bh=U5xUI/dJojXi8jaM2KImFDgZC+wj5t9cCLBkF+tjfyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t2O8m3BsApzbqTo1DRr5Ow0fNd7hS4vvT0kdp5svmjrlthugzL4yfDqAGysq/mHAt0/qapt21a59aEF/1PsPZyr33+XdMQcyEmPVJL26Y8Mj5830To1HlULgBPGwHHVgtk+9hUfWNOAWk/ONIYls3I8IVi1h8Yb+MlUne15HUko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vF5pGBlV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vF5pGBlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E690C4CEE0;
	Tue,  4 Feb 2025 01:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738631938;
	bh=U5xUI/dJojXi8jaM2KImFDgZC+wj5t9cCLBkF+tjfyk=;
	h=From:To:Cc:Subject:Date:From;
	b=vF5pGBlVVJFGCqOQAPRGi7h+4QQ+1eEPS47sQb/137QIR+wjWeOveoQeIAD8lmKGb
	 z5soXNhCtrd7Uh0KaWCEMKtn7piWNXqk1iqSTExvqUinXaAEjT0qacq52wkkD4nhXw
	 srtwGc8b7M7D/gyAYUKZHTkCJBQiH0uYNqXmj7sIdNW9y5O6WSQaG/yY4eCn3zgrQG
	 ZkJxuUseH6jc9gF8izZHjSiWlezcXZggGxmRmOXi+0slJkTbq/mZLtH0GhfHMi2ftm
	 cRVdI2s3bP6jsoMlFSEQY9Il4JL173HhwjCqeblSP2tCduVtmvbtzuijR5rNzJp0N8
	 Ouc0ykKPOV1Kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mike Marshall <hubcap@omnibond.com>,
	syzbot+fc519d7875f2d9186c1f@syzkaller.appspotmail.com,
	Sasha Levin <sashal@kernel.org>,
	devel@lists.orangefs.org
Subject: [PATCH AUTOSEL 5.10 1/2] orangefs: fix a oob in orangefs_debug_write
Date: Mon,  3 Feb 2025 20:18:52 -0500
Message-Id: <20250204011853.2207241-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.234
Content-Transfer-Encoding: 8bit

From: Mike Marshall <hubcap@omnibond.com>

[ Upstream commit f7c848431632598ff9bce57a659db6af60d75b39 ]

I got a syzbot report: slab-out-of-bounds Read in
orangefs_debug_write... several people suggested fixes,
I tested Al Viro's suggestion and made this patch.

Signed-off-by: Mike Marshall <hubcap@omnibond.com>
Reported-by: syzbot+fc519d7875f2d9186c1f@syzkaller.appspotmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/orangefs/orangefs-debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 1b508f5433846..fa41db0884880 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -393,9 +393,9 @@ static ssize_t orangefs_debug_write(struct file *file,
 	 * Thwart users who try to jamb a ridiculous number
 	 * of bytes into the debug file...
 	 */
-	if (count > ORANGEFS_MAX_DEBUG_STRING_LEN + 1) {
+	if (count > ORANGEFS_MAX_DEBUG_STRING_LEN) {
 		silly = count;
-		count = ORANGEFS_MAX_DEBUG_STRING_LEN + 1;
+		count = ORANGEFS_MAX_DEBUG_STRING_LEN;
 	}
 
 	buf = kzalloc(ORANGEFS_MAX_DEBUG_STRING_LEN, GFP_KERNEL);
-- 
2.39.5

