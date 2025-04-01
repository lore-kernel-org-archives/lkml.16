Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203FA2E3398
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479889; cv=none; b=QjzCAaJNastY1WX0YCXyborwNBqOlyylHvvYGSyIUI/VxIys1Yclr3vb/74V/pwH3uRWPmtWIAPQZPARxkIP8gqL/go5w+GusM/70akLRafoUWuAociOISQvqIEKS3+yskcdUTU3v/rKM/plLDVIvLOWCex2hueUkwm8nx5gzSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479889; c=relaxed/simple;
	bh=1TBiipQ5bL3J8DK3rX68uUimSVJ9/Yx0mbLiTLmPbCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKRvotqF7a3/P2j+1eG9SLdhgxFu7neHamY7Jn8rn6hnWoWoDWuOWiKSoNZHZ/7OWuqmEsrYDHOeiR/EqWiSV4lHTbC29DcvYg7IxNqLiZJCEQ1j/mo5cR6JU11UJv/SjRTEKfJf1F9+0Rz/UG80xISkUNxrAwU0wi4X8EPJN2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBqiZ59I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBqiZ59I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AD6C4CEE8;
	Tue,  1 Apr 2025 03:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743479888;
	bh=1TBiipQ5bL3J8DK3rX68uUimSVJ9/Yx0mbLiTLmPbCs=;
	h=From:To:Cc:Subject:Date:From;
	b=HBqiZ59IMke7Ae8d77JCZKlnF4hSWguWaWKFK960kMTJax6OQ8VyN45A8qIiZBaob
	 FAZbY6evlq16Z+6eDYddOhgZ97yrrtZwJXX2nJqQ0vWVE2TaLOPtqyw8e6jUeTNGS5
	 QETngR8aEy40RXFzqV0qh293cKrAiRiwwtwXoEw/VH4BggX0pifu81/nS6f66l9cLx
	 LAcbTsf4aSD8D9gORa7rCzewH8OmTIbzQjAUBD8BnHK+gR4he+ixYly92eDbe8XcGg
	 mSBTfbmP5rWCcZojoB0eCzbu4UlzVB5Dnbf8Vlaq/VqV3ueCDVj+ZvTT2CH8Tbyf7D
	 ECAu9DQr9Ueww==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Daniel Lee <chullee@google.com>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH v2] f2fs: support to disable linear lookup fallback
Date: Tue,  1 Apr 2025 11:58:00 +0800
Message-ID: <20250401035800.51504-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 91b587ba79e1 ("f2fs: Introduce linear search for
dentries"), f2fs forced to use linear lookup whenever a hash-based
lookup fails on casefolded directory, it may affect performance
for scenarios: a) create a new file w/ filename it doesn't exist
in directory, b) lookup a file which may be removed.

This patch supports to disable linear lookup fallback, so, once there
is a solution for commit 5c26d2f1d3f5 ("unicode: Don't special case
ignorable code points") to fix red heart unicode issue, then we can
set an encodeing flag to disable the fallback for performance recovery.

The way is kept in line w/ ext4, refer to commit 9e28059d5664 ("ext4:
introduce linear search for dentries").

Cc: Daniel Lee <chullee@google.com>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- check sb_no_casefold_compat_fallback in prior to other condition
 fs/f2fs/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 5a63ff0df03b..a9f21bc1915d 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 
 out:
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (IS_CASEFOLDED(dir) && !de && use_hash) {
+	if (!sb_no_casefold_compat_fallback(dir->i_sb) &&
+		IS_CASEFOLDED(dir) && !de && use_hash) {
 		use_hash = false;
 		goto start_find_entry;
 	}
-- 
2.49.0

