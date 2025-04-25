Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09223BD04
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574662; cv=none; b=YRA3qmxTLAlhfY8fMvudcWIepAzEPD2wbneq6WKjjWeh1ULNCfsK/Gr3TJhJdnV641yCcBptAi/DRjqk2MP67G7CHMRjM9QsPSk9Wdg3z/lhtSq6M6EDyH8TzjFLAxGodHyqs8fdTlbRpqDWrJTJoogMDP7b2r5qH3gHb97o0VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574662; c=relaxed/simple;
	bh=goSww0P5SFEYhcqCWdBoe88SPIL4JuxXLc5uGO6rmaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTbyb+CmZ1/FCzXeVo0pGSWhZDSuQJ6p8NpIF8I58JioL92gNYjSqul56S8edkQOAzvWcimKQq0a4GYxAsscblGw1Fwvk+Uodj5F+9E+CdR68EZPWWwczGaO4HSfScb4T6HRliyq1V3Qnl6bWCk/um5vQNXvYIlXTuf+a1DdDvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAy93lce; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAy93lce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D3BC4CEED;
	Fri, 25 Apr 2025 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745574661;
	bh=goSww0P5SFEYhcqCWdBoe88SPIL4JuxXLc5uGO6rmaw=;
	h=From:To:Cc:Subject:Date:From;
	b=KAy93lcei+DzfvhvdLUJJhaZdqf7ej28LnCI1gBYT4eX/K69uKyfDaNQ80PQyaTBN
	 XufgvYNTk3Dkg3PQFdlA+5G7aQc66o9lkhO4lkcdRPXygzxrdURe5Ov+XrpQ99ErM9
	 7rNuL7wf8rEXfTbG9Aje/BEz00OVflJIYZaRnMFHIYa9hv0cKOyZwuwREI517EKj7/
	 yimkEutthYVEDBDeuS0ZwjyeWrXUz/3xCWCA2xyzHomI8LH27zZTMvquJ7OJn5fVLj
	 U9NQo6SYXCWJvWphmSEmo/3r36K+2w86B6UOYkYOa7oRYfoWq6BU9iShkaWi2ElwFx
	 ewRlGQKRxnlbg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: support FAULT_TIMEOUT
Date: Fri, 25 Apr 2025 17:50:55 +0800
Message-ID: <20250425095055.1129285-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support to inject a timeout fault into function, currently it only
support to inject timeout to commit_atomic_write flow to reproduce
inconsistent bug, like the bug fixed by commit f098aeba04c9 ("f2fs:
fix to avoid atomicity corruption of atomic file").

By default, the new type fault will inject 1000ms timeout, and the
timeout process can be interrupted by SIGKILL.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
 Documentation/filesystems/f2fs.rst      |  1 +
 fs/f2fs/f2fs.h                          | 17 +++++++++++++++++
 fs/f2fs/segment.c                       |  3 +++
 fs/f2fs/super.c                         |  1 +
 5 files changed, 23 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c805a48dd3dc..0dd0936e31b0 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -735,6 +735,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_BLKADDR_CONSISTENCE        0x000080000
 		FAULT_NO_SEGMENT                 0x000100000
 		FAULT_INCONSISTENT_FOOTER        0x000200000
+		FAULT_TIMEOUT                    0x000400000 (1000ms)
 		===========================      ===========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 95c64b5b5638..6dcafcf3bf54 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -207,6 +207,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_BLKADDR_CONSISTENCE        0x000080000
 			 FAULT_NO_SEGMENT                 0x000100000
 			 FAULT_INCONSISTENT_FOOTER        0x000200000
+			 FAULT_TIMEOUT                    0x000400000 (1000ms)
 			 ===========================      ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index be752d833a06..3e0d1f9b62ba 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -63,6 +63,7 @@ enum {
 	FAULT_BLKADDR_CONSISTENCE,
 	FAULT_NO_SEGMENT,
 	FAULT_INCONSISTENT_FOOTER,
+	FAULT_TIMEOUT,
 	FAULT_MAX,
 };
 
@@ -613,6 +614,9 @@ enum {
 /* congestion wait timeout value, default: 20ms */
 #define	DEFAULT_IO_TIMEOUT	(msecs_to_jiffies(20))
 
+/* timeout value injected, default: 1000ms */
+#define DEFAULT_FAULT_TIMEOUT	(msecs_to_jiffies(1000))
+
 /* maximum retry quota flush count */
 #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
 
@@ -4830,6 +4834,19 @@ static inline void f2fs_io_schedule_timeout(long timeout)
 	io_schedule_timeout(timeout);
 }
 
+static inline void f2fs_io_schedule_timeout_killable(long timeout)
+{
+	while (timeout) {
+		if (fatal_signal_pending(current))
+			return;
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+		if (timeout <= DEFAULT_IO_TIMEOUT)
+			return;
+		timeout -= DEFAULT_IO_TIMEOUT;
+	}
+}
+
 static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
 				struct folio *folio, enum page_type type)
 {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 037d06d58fda..b1ce8a41becd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -371,6 +371,9 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	}
 
 out:
+	if (time_to_inject(sbi, FAULT_TIMEOUT))
+		f2fs_io_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT);
+
 	if (ret) {
 		sbi->revoked_atomic_block += fi->atomic_write_cnt;
 	} else {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index de88084f9861..1c33d90c4c92 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -65,6 +65,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_BLKADDR_CONSISTENCE]	= "inconsistent blkaddr",
 	[FAULT_NO_SEGMENT]		= "no free segment",
 	[FAULT_INCONSISTENT_FOOTER]	= "inconsistent footer",
+	[FAULT_TIMEOUT]			= "timeout",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.49.0

