Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD01DF973
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739116786; cv=none; b=dWw49sd+9M7APImD3+i4k8pkmKb1HptCqLUJ3oXh+wu6oAUESj0ctF4hnR6VRze1OQhUIrRm0tUYneFp3yt4Eo8xDc9cI270j1R57X3H+cltZCQwreE3Xpsgg/BM59p/4GtdfoAazOBLdo6MhIXnL2gbNvDzo8p/S9wQW3XP06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739116786; c=relaxed/simple;
	bh=6ISABX7eGdy00MmYucttXr7k1CYTaTF9zUkpcSwA+K0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I4zGb39AXOAAs6rymGTvCjWpsgfIxwTmC2HnrJdl2Mhqe+5Qzv7/qkgeyOybBdqyA/6HHp2COfx/ivDNjgUyOiemO0KAft78RAhmV45oCMbRuQ8CNC2ICXs88XIwFFPjK5z7PC3bwXknOA/v11dq+gJrIbBaCvIa5FbYn8gS5hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L4j9nbBm; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L4j9nbBm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739116782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCCPVs2TAQnjOqMj3iVhhjeMXlDSmY++BFhW3cMxNE4=;
	b=L4j9nbBmukGNl/2xMLcQeWLBkBxLJZg6N5i8rC5PunMNx03AGygY0XZuhjNOelp1jwgfRL
	Q2bs8YIkDftYdTRCKTV5mNE+xC3XgzVPUTf2UIAh/dhz9YZihk5EHe0j5LNAPBfkAZTcZs
	HIj+of8KUwl5SSyyr0dMvNSR74MmXOc=
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
Subject: [PATCH v5 2/5] sysctl: add helper functions to extract table->extra1/extra2
Date: Sun,  9 Feb 2025 23:58:10 +0800
Message-Id: <c52b7508407246cf51d7c44f1806c49e9dfbd439.1739115369.git.wen.yang@linux.dev>
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

Add some sysctl helper functions to avoid direct access to
table->extra1/extra2.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Joel Granados <j.granados@samsung.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Dave Young <dyoung@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 fs/proc/proc_sysctl.c  | 21 +++++++++-----------
 include/linux/sysctl.h | 44 ++++++++++++++++++++++++++++++++++++++++++
 kernel/sysctl.c        | 21 ++++++++++----------
 3 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 27a283d85a6e..6649d1db5f8f 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -1115,18 +1115,15 @@ static int sysctl_check_table_array(const char *path, const struct ctl_table *ta
 		if (table->maxlen != sizeof(u8))
 			err |= sysctl_err(path, table, "array not allowed");
 
-		if (table->extra1) {
-			extra = *(unsigned int *) table->extra1;
-			if (extra > 255U)
-				err |= sysctl_err(path, table,
-						"range value too large for proc_dou8vec_minmax");
-		}
-		if (table->extra2) {
-			extra = *(unsigned int *) table->extra2;
-			if (extra > 255U)
-				err |= sysctl_err(path, table,
-						"range value too large for proc_dou8vec_minmax");
-		}
+		extra = sysctl_range_min_u8(table);
+		if (extra > 255U)
+			err |= sysctl_err(path, table,
+					"range value too large for proc_dou8vec_minmax\n");
+
+		extra = sysctl_range_max_u8(table);
+		if (extra > 255U)
+			err |= sysctl_err(path, table,
+					"range value too large for proc_dou8vec_minmax\n");
 	}
 
 	if (table->proc_handler == proc_dobool) {
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 40a6ac6c9713..eee8480dc069 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -210,6 +210,50 @@ struct ctl_table_root {
 #define register_sysctl(path, table)	\
 	register_sysctl_sz(path, table, ARRAY_SIZE(table))
 
+#define __SYSCTL_RANGE_MIN(_a, _b, _c) (((_a)->extra1) ? *(_b((_a)->extra1)) : (_c))
+
+#define __SYSCTL_RANGE_MAX(_a, _b, _c) (((_a)->extra2) ? *(_b((_a)->extra2)) : (_c))
+
+static inline unsigned int sysctl_range_min_u8(const struct ctl_table *table)
+{
+	return (unsigned int)__SYSCTL_RANGE_MIN(table, (unsigned int *), 0);
+}
+
+static inline unsigned int sysctl_range_max_u8(const struct ctl_table *table)
+{
+	return (unsigned int)__SYSCTL_RANGE_MAX(table, (unsigned int *), U8_MAX);
+}
+
+static inline int sysctl_range_min_int(const struct ctl_table *table)
+{
+	return (int)__SYSCTL_RANGE_MIN(table, (int *), INT_MIN);
+}
+
+static inline int sysctl_range_max_int(const struct ctl_table *table)
+{
+	return (int)__SYSCTL_RANGE_MAX(table, (int *), INT_MAX);
+}
+
+static inline unsigned int sysctl_range_min_uint(const struct ctl_table *table)
+{
+	return (unsigned int)__SYSCTL_RANGE_MIN(table, (unsigned int *), 0);
+}
+
+static inline unsigned int sysctl_range_max_uint(const struct ctl_table *table)
+{
+	return (unsigned int)__SYSCTL_RANGE_MAX(table, (unsigned int *), UINT_MAX);
+}
+
+static inline unsigned long sysctl_range_min_ulong(const struct ctl_table *table)
+{
+	return (unsigned long)__SYSCTL_RANGE_MIN(table, (unsigned long *), 0);
+}
+
+static inline unsigned long sysctl_range_max_ulong(const struct ctl_table *table)
+{
+	return (unsigned long)__SYSCTL_RANGE_MAX(table, (unsigned long *), ULONG_MAX);
+}
+
 #ifdef CONFIG_SYSCTL
 
 void proc_sys_poll_notify(struct ctl_table_poll *poll);
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 4507795e3568..b745445cbfbf 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -845,8 +845,8 @@ int proc_dointvec_minmax(const struct ctl_table *table, int write,
 {
 	struct do_proc_minmax_conv_param param;
 
-	param.min = (table->extra1) ? *(int *) table->extra1 : INT_MIN;
-	param.max = (table->extra2) ? *(int *) table->extra2 : INT_MAX;
+	param.min = sysctl_range_min_int(table);
+	param.max = sysctl_range_max_int(table);
 	return do_proc_dointvec(table, write, buffer, lenp, ppos,
 				do_proc_dointvec_minmax_conv, &param);
 }
@@ -875,9 +875,8 @@ int proc_douintvec_minmax(const struct ctl_table *table, int write,
 {
 	struct do_proc_minmax_conv_param param;
 
-	param.min = (table->extra1) ? *(unsigned int *) table->extra1 : 0;
-	param.max = (table->extra2) ? *(unsigned int *) table->extra2 : UINT_MAX;
-
+	param.min = sysctl_range_min_uint(table);
+	param.max = sysctl_range_max_uint(table);
 	return do_proc_douintvec(table, write, buffer, lenp, ppos,
 				 do_proc_douintvec_minmax_conv, &param);
 }
@@ -912,8 +911,8 @@ int proc_dou8vec_minmax(const struct ctl_table *table, int write,
 	if (table->maxlen != sizeof(u8))
 		return -EINVAL;
 
-	param.min = (table->extra1) ? *(unsigned int *) table->extra1 : 0;
-	param.max = (table->extra2) ? *(unsigned int *) table->extra2 : 255U;
+	param.min = sysctl_range_min_u8(table);
+	param.max = sysctl_range_max_u8(table);
 	tmp = *table;
 
 	tmp.maxlen = sizeof(val);
@@ -965,8 +964,8 @@ static int __do_proc_doulongvec_minmax(void *data,
 	}
 
 	i = data;
-	min = (table->extra1) ? *(unsigned long *) table->extra1 : 0;
-	max = (table->extra2) ? *(unsigned long *) table->extra2 : ULONG_MAX;
+	min = sysctl_range_min_ulong(table);
+	max = sysctl_range_max_ulong(table);
 
 	vleft = table->maxlen / sizeof(unsigned long);
 	left = *lenp;
@@ -1203,8 +1202,8 @@ int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, int write,
 {
 	struct do_proc_minmax_conv_param param;
 
-	param.min = (table->extra1) ? *(int *) table->extra1 : INT_MIN;
-	param.max = (table->extra2) ? *(int *) table->extra2 : INT_MAX;
+	param.min = sysctl_range_min_int(table);
+	param.max = sysctl_range_max_int(table);
 	return do_proc_dointvec(table, write, buffer, lenp, ppos,
 			do_proc_dointvec_ms_jiffies_minmax_conv, &param);
 }
-- 
2.25.1

