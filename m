Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498EE1DF960
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739116798; cv=none; b=OL7ZJ6aplofJkFQdGB86xzj7OwyC9H7P6yDSLAm+Ab2mG77+lLU5cNJ4P6koj9zxKVWKqQJHrpQBEw7h3VD45zJgOqA/quks6DZM7/QxuhaLTGj6kGY2wuK3PIDojXhefdwKbQzpiuNLj3cfnOXp+xeNYBBIf5KqtvU0ZF1bx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739116798; c=relaxed/simple;
	bh=/3jPuGA7RdR76pPj01WKfZd8NrowcftvpO2zikJz8HM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W2YmVH9Vv9Bs8HQiv8Q62mUOrjbA85PnknNVb4IYWfHtTVQ3cbIc3YlOe4MTctSahOhV3bUL6nIH25iCWEJWMX9Iw6z+px79Q1liyAFPfPFLhEfRDIe6O8lTqGZyH4pG/tcrxwE3vnlR7CqugLvRWZS/UU0UOW7q4XP0jtWSnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bi9vmoYR; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bi9vmoYR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739116794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wha4ZKGWvo2tXOl25CgTv+1PAxRxNqQziVf5W8hTA=;
	b=bi9vmoYRqXyf9gJdY9GGFT5y9OS6IN2UBMxPzw5Nf4PXNWyIdRVdEew+5d7OrBLOs1MOhD
	lYwKDj+7zX3D0CJ6Yg3ijk3+2R6nk/hscMvhd2UINHLmKxrZ8hkTRGWGMuHgBxF4gnaAU2
	cVupejRdhMqyUW8P4l36gu1Kx1VNL3I=
From: Wen Yang <wen.yang@linux.dev>
To: Joel Granados <j.granados@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>,
	Dave Young <dyoung@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v5 3/5] sysctl: support encoding values directly in the table entry
Date: Sun,  9 Feb 2025 23:58:11 +0800
Message-Id: <8acb6aee7aedb1c816012ebe48d1605e4ec5a3ab.1739115369.git.wen.yang@linux.dev>
In-Reply-To: <cover.1739115369.git.wen.yang@linux.dev>
References: <cover.1739115369.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Eric points out: "by turning .extra1 and .extra2 into longs instead of
keeping them as pointers and needing constants to be pointed at somewhere
.. The only people I can see who find a significant benefit by
consolidating all of the constants into one place are people who know how
to stomp kernel memory."

This patch supports encoding values directly in table entries through the
following work:
- extra1/extra2 and min/max are placed in one union to ensure compatibility
  with previous code without increasing memory space, and then we could
  gradually remove these unnecessary extra1/extra2.
- two bits were used to represent the information of the above union:
  SYSCTL_FLAG_MIN: 0 - using extra1, 1 - using min.
  SYSCTL_FLAG_MAX: 0 - using extra2, 2 - using max.
- since the proc file's mode field only uses 9 bits(777), we could use the
  additional two bits(S_ISUID and S_ISGID) to temporarily represent
  SYSCTL_FLAG_MIN and SYSCTL_FLAG_MAX.
- added some helper macros.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Joel Granados <j.granados@samsung.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Dave Young <dyoung@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 fs/proc/proc_sysctl.c  | 14 ++++++++++++--
 include/linux/sysctl.h | 24 ++++++++++++++++++++----
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 6649d1db5f8f..08b9cfb11165 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -848,9 +848,18 @@ static int proc_sys_getattr(struct mnt_idmap *idmap,
 		return PTR_ERR(head);
 
 	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
-	if (table)
+	if (table) {
 		stat->mode = (stat->mode & S_IFMT) | table->mode;
 
+		/*
+		 * S_ISUID and S_ISGID are to temporarily represent
+		 * the internal SYSCTL_FLAG_MIN and SYSCTL_FLAG_MAX,
+		 * and are not visible to users
+		 */
+		stat->mode &= ~SYSCTL_FLAG_MIN;
+		stat->mode &= ~SYSCTL_FLAG_MAX;
+	}
+
 	sysctl_head_finish(head);
 	return 0;
 }
@@ -1163,7 +1172,8 @@ static int sysctl_check_table(const char *path, struct ctl_table_header *header)
 		if (!entry->proc_handler)
 			err |= sysctl_err(path, entry, "No proc_handler");
 
-		if ((entry->mode & (S_IRUGO|S_IWUGO)) != entry->mode)
+		if ((entry->mode & (S_IRUGO|S_IWUGO|SYSCTL_FLAG_MIN|SYSCTL_FLAG_MAX))
+		    != entry->mode)
 			err |= sysctl_err(path, entry, "bogus .mode 0%o",
 				entry->mode);
 	}
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index eee8480dc069..f07a3f0fb3b1 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -28,6 +28,7 @@
 #include <linux/rbtree.h>
 #include <linux/uidgid.h>
 #include <uapi/linux/sysctl.h>
+#include <uapi/linux/stat.h>
 
 /* For the /proc/sys support */
 struct completion;
@@ -129,6 +130,9 @@ static inline void *proc_sys_poll_event(struct ctl_table_poll *poll)
 #define DEFINE_CTL_TABLE_POLL(name)					\
 	struct ctl_table_poll name = __CTL_TABLE_POLL_INITIALIZER(name)
 
+#define  SYSCTL_FLAG_MIN	S_ISUID
+#define  SYSCTL_FLAG_MAX	S_ISGID
+
 /* A sysctl table is an array of struct ctl_table: */
 struct ctl_table {
 	const char *procname;		/* Text ID for /proc/sys */
@@ -137,8 +141,16 @@ struct ctl_table {
 	umode_t mode;
 	proc_handler *proc_handler;	/* Callback for text formatting */
 	struct ctl_table_poll *poll;
-	void *extra1;
-	void *extra2;
+	union {
+		struct {
+			void *extra1;
+			void *extra2;
+		};
+		struct {
+			unsigned long min;
+			unsigned long max;
+		};
+	};
 } __randomize_layout;
 
 struct ctl_node {
@@ -210,9 +222,13 @@ struct ctl_table_root {
 #define register_sysctl(path, table)	\
 	register_sysctl_sz(path, table, ARRAY_SIZE(table))
 
-#define __SYSCTL_RANGE_MIN(_a, _b, _c) (((_a)->extra1) ? *(_b((_a)->extra1)) : (_c))
+#define __SYSCTL_RANGE_EXTRA1(_a, _b, _c) (((_a)->extra1) ? *(_b((_a)->extra1)) : (_c))
+#define __SYSCTL_RANGE_MIN(_a, _b, _c)    ((((_a)->mode) & SYSCTL_FLAG_MIN) ? \
+					   ((_a)->min) : __SYSCTL_RANGE_EXTRA1(_a, _b, _c))
 
-#define __SYSCTL_RANGE_MAX(_a, _b, _c) (((_a)->extra2) ? *(_b((_a)->extra2)) : (_c))
+#define __SYSCTL_RANGE_EXTRA2(_a, _b, _c) (((_a)->extra2) ? *(_b((_a)->extra2)) : (_c))
+#define __SYSCTL_RANGE_MAX(_a, _b, _c)    ((((_a)->mode) & SYSCTL_FLAG_MAX) ? \
+					   ((_a)->max) : __SYSCTL_RANGE_EXTRA2(_a, _b, _c))
 
 static inline unsigned int sysctl_range_min_u8(const struct ctl_table *table)
 {
-- 
2.25.1

