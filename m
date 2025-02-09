Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46751DF960
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739116767; cv=none; b=qk83m/OZ2JFCT5wkv4xoOK7GDad+9P5cqmgGy4EQyOHENuGYJMbhn0qvbyxc/lP6OaLK9Hx4lc9sTE5DeRFPevDJAP6cOkLUD29zCZfMqPcS0C06n6mKsIYpDodmWIGgHfMFEMmOmYF7MFKbVTN+X09Ib44OAQBn2HcodZ1Svyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739116767; c=relaxed/simple;
	bh=931aNdIXPIUpbHsHw8ZK5kFYcUiLD3aCLpR779Guzas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aIygbpaDdEl08/Mk223IjqUEO+9bgXgMFhUNcuSe4BJXbGd28GNRh+6rb4ExTh528f+Uqanno9V9oBRYouVHkNeztsw2HbGU5or62JbXZZg4NE1Nsaunx2XbLitLs/z/qAchwC62YgEYST3/DhDvDe7euyzlzN08INKpnY1AS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=szwBMJA0; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="szwBMJA0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739116763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IflWQqWsaChhlNvqL4gKDpLadjB6EU1tUKNrqGCslwY=;
	b=szwBMJA03NbnnT/D9UB6YWHs9ueRuo18EU0HTY3/jbDBDWd5XtrNgHeA/6hQmfbdfE5ubJ
	7LkNGn+CbCt5QoJq0J24VAQStT8u0dtuKhGkH+s9obx0417IRD1nvwxWqyNupGV/osQMFf
	sYRkqaKiPPuZaaqfOwXRDFACITqPQiQ=
From: Wen Yang <wen.yang@linux.dev>
To: Joel Granados <j.granados@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>,
	Dave Young <dyoung@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>,
	Joel Granados <joel.granados@kernel.org>
Subject: [PATCH v5 1/5] sysctl: simplify the min/max boundary check
Date: Sun,  9 Feb 2025 23:58:09 +0800
Message-Id: <f93acd7c633fff67594d0a88aa50846e9f776c28.1739115369.git.wen.yang@linux.dev>
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

Eric pointed out:
- That is just replace extra1 and extra2 with min and max members.  The
- members don't have any reason to be pointers.  Without being pointers
- the min/max functions can just use long values to cap either ints or
- longs, and there is no room for error.  The integer promotion rules
- will ensure that even negative values can be stored in unsigned long
- min and max values successfully.  Plus it is all bog standard C
- so there is nothing special to learn.

In order to archive it, we first introduce a new struct
do_proc_minmax_conv_param to replace both
do_proc_dointvec_minmax_conv_param and do_proc_douintvec_minmax_conv_param,
both int *{min, max} and unsigned int *{min, max} are changed to
unsigned long {min, max}, both do_proc_dointvec_conv() and
do_proc_douintvec_conv() deleted.

Selftest were also made:

[23:16:38] ================ sysctl_test (11 subtests) =================
[23:16:38] [PASSED] sysctl_test_api_dointvec_null_tbl_data
[23:16:38] [PASSED] sysctl_test_api_dointvec_table_maxlen_unset
[23:16:38] [PASSED] sysctl_test_api_dointvec_table_len_is_zero
[23:16:38] [PASSED] sysctl_test_api_dointvec_table_read_but_position_set
[23:16:38] [PASSED] sysctl_test_dointvec_read_happy_single_positive
[23:16:38] [PASSED] sysctl_test_dointvec_read_happy_single_negative
[23:16:38] [PASSED] sysctl_test_dointvec_write_happy_single_positive
[23:16:38] [PASSED] sysctl_test_dointvec_write_happy_single_negative
[23:16:38] [PASSED] sysctl_test_api_dointvec_write_single_less_int_min
[23:16:38] [PASSED] sysctl_test_api_dointvec_write_single_greater_int_max
[23:16:38] [PASSED] sysctl_test_register_sysctl_sz_invalid_extra_value
[23:16:38] =================== [PASSED] sysctl_test ===================
[23:16:38] ============================================================
[23:16:38] Testing complete. Ran 11 tests: passed: 11

Signed-off-by: Wen Yang <wen.yang@linux.dev>
Cc: Joel Granados <joel.granados@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Dave Young <dyoung@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/sysctl.c | 199 ++++++++++++++++++------------------------------
 1 file changed, 73 insertions(+), 126 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 21190098c21d..4507795e3568 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -409,22 +409,44 @@ static void proc_put_char(void **buf, size_t *size, char c)
 	}
 }
 
-static int do_proc_dointvec_conv(bool *negp, unsigned long *lvalp,
-				 int *valp,
-				 int write, void *data)
+/**
+ * struct do_proc_minmax_conv_param - proc_dointvec_minmax() range checking structure
+ * @min: the minimum allowable value
+ * @max: the maximum allowable value
+ *
+ * The do_proc_minmax_conv_param structure provides the
+ * minimum and maximum values for doing range checking for those sysctl
+ * parameters that use the proc_dointvec_minmax(), proc_dou8vec_minmax() and so on.
+ */
+struct do_proc_minmax_conv_param {
+	unsigned long min;
+	unsigned long max;
+};
+
+static inline int do_proc_dointvec_minmax_conv(bool *negp, unsigned long *lvalp,
+		int *valp,
+		int write, void *data)
 {
+	struct do_proc_minmax_conv_param *param = data;
+	long min, max;
+	long val;
+
 	if (write) {
 		if (*negp) {
-			if (*lvalp > (unsigned long) INT_MAX + 1)
-				return -EINVAL;
-			WRITE_ONCE(*valp, -*lvalp);
+			max = param ? param->max : 0;
+			min = param ? param->min : INT_MIN;
+			val = -*lvalp;
 		} else {
-			if (*lvalp > (unsigned long) INT_MAX)
-				return -EINVAL;
-			WRITE_ONCE(*valp, *lvalp);
+			max = param ? param->max : INT_MAX;
+			min = param ? param->min : 0;
+			val = *lvalp;
 		}
+
+		if (val > max || val < min)
+			return -EINVAL;
+		WRITE_ONCE(*valp, (int)val);
 	} else {
-		int val = READ_ONCE(*valp);
+		val = (int)READ_ONCE(*valp);
 		if (val < 0) {
 			*negp = true;
 			*lvalp = -(unsigned long)val;
@@ -433,21 +455,30 @@ static int do_proc_dointvec_conv(bool *negp, unsigned long *lvalp,
 			*lvalp = (unsigned long)val;
 		}
 	}
+
 	return 0;
 }
 
-static int do_proc_douintvec_conv(unsigned long *lvalp,
-				  unsigned int *valp,
-				  int write, void *data)
+static inline int do_proc_douintvec_minmax_conv(unsigned long *lvalp,
+					 unsigned int *valp,
+					 int write, void *data)
 {
+	struct do_proc_minmax_conv_param *param = data;
+	unsigned long min, max;
+
 	if (write) {
-		if (*lvalp > UINT_MAX)
+		max = param ? param->max : UINT_MAX;
+		min = param ? param->min : 0;
+
+		if (*lvalp > max || *lvalp < min)
 			return -EINVAL;
-		WRITE_ONCE(*valp, *lvalp);
+
+		WRITE_ONCE(*valp, (unsigned int)*lvalp);
 	} else {
 		unsigned int val = READ_ONCE(*valp);
 		*lvalp = (unsigned long)val;
 	}
+
 	return 0;
 }
 
@@ -474,7 +505,7 @@ static int __do_proc_dointvec(void *tbl_data, const struct ctl_table *table,
 	left = *lenp;
 
 	if (!conv)
-		conv = do_proc_dointvec_conv;
+		conv = do_proc_dointvec_minmax_conv;
 
 	if (write) {
 		if (proc_first_pos_non_zero_ignore(ppos, table))
@@ -652,7 +683,7 @@ static int __do_proc_douintvec(void *tbl_data, const struct ctl_table *table,
 	}
 
 	if (!conv)
-		conv = do_proc_douintvec_conv;
+		conv = do_proc_douintvec_minmax_conv;
 
 	if (write)
 		return do_proc_douintvec_w(i, table, buffer, lenp, ppos,
@@ -747,7 +778,7 @@ int proc_douintvec(const struct ctl_table *table, int write, void *buffer,
 		size_t *lenp, loff_t *ppos)
 {
 	return do_proc_douintvec(table, write, buffer, lenp, ppos,
-				 do_proc_douintvec_conv, NULL);
+				 do_proc_douintvec_minmax_conv, NULL);
 }
 
 /*
@@ -793,46 +824,6 @@ static int proc_taint(const struct ctl_table *table, int write,
 	return err;
 }
 
-/**
- * struct do_proc_dointvec_minmax_conv_param - proc_dointvec_minmax() range checking structure
- * @min: pointer to minimum allowable value
- * @max: pointer to maximum allowable value
- *
- * The do_proc_dointvec_minmax_conv_param structure provides the
- * minimum and maximum values for doing range checking for those sysctl
- * parameters that use the proc_dointvec_minmax() handler.
- */
-struct do_proc_dointvec_minmax_conv_param {
-	int *min;
-	int *max;
-};
-
-static int do_proc_dointvec_minmax_conv(bool *negp, unsigned long *lvalp,
-					int *valp,
-					int write, void *data)
-{
-	int tmp, ret;
-	struct do_proc_dointvec_minmax_conv_param *param = data;
-	/*
-	 * If writing, first do so via a temporary local int so we can
-	 * bounds-check it before touching *valp.
-	 */
-	int *ip = write ? &tmp : valp;
-
-	ret = do_proc_dointvec_conv(negp, lvalp, ip, write, data);
-	if (ret)
-		return ret;
-
-	if (write) {
-		if ((param->min && *param->min > tmp) ||
-		    (param->max && *param->max < tmp))
-			return -EINVAL;
-		WRITE_ONCE(*valp, tmp);
-	}
-
-	return 0;
-}
-
 /**
  * proc_dointvec_minmax - read a vector of integers with min/max values
  * @table: the sysctl table
@@ -852,53 +843,14 @@ static int do_proc_dointvec_minmax_conv(bool *negp, unsigned long *lvalp,
 int proc_dointvec_minmax(const struct ctl_table *table, int write,
 		  void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct do_proc_dointvec_minmax_conv_param param = {
-		.min = (int *) table->extra1,
-		.max = (int *) table->extra2,
-	};
+	struct do_proc_minmax_conv_param param;
+
+	param.min = (table->extra1) ? *(int *) table->extra1 : INT_MIN;
+	param.max = (table->extra2) ? *(int *) table->extra2 : INT_MAX;
 	return do_proc_dointvec(table, write, buffer, lenp, ppos,
 				do_proc_dointvec_minmax_conv, &param);
 }
 
-/**
- * struct do_proc_douintvec_minmax_conv_param - proc_douintvec_minmax() range checking structure
- * @min: pointer to minimum allowable value
- * @max: pointer to maximum allowable value
- *
- * The do_proc_douintvec_minmax_conv_param structure provides the
- * minimum and maximum values for doing range checking for those sysctl
- * parameters that use the proc_douintvec_minmax() handler.
- */
-struct do_proc_douintvec_minmax_conv_param {
-	unsigned int *min;
-	unsigned int *max;
-};
-
-static int do_proc_douintvec_minmax_conv(unsigned long *lvalp,
-					 unsigned int *valp,
-					 int write, void *data)
-{
-	int ret;
-	unsigned int tmp;
-	struct do_proc_douintvec_minmax_conv_param *param = data;
-	/* write via temporary local uint for bounds-checking */
-	unsigned int *up = write ? &tmp : valp;
-
-	ret = do_proc_douintvec_conv(lvalp, up, write, data);
-	if (ret)
-		return ret;
-
-	if (write) {
-		if ((param->min && *param->min > tmp) ||
-		    (param->max && *param->max < tmp))
-			return -ERANGE;
-
-		WRITE_ONCE(*valp, tmp);
-	}
-
-	return 0;
-}
-
 /**
  * proc_douintvec_minmax - read a vector of unsigned ints with min/max values
  * @table: the sysctl table
@@ -921,10 +873,11 @@ static int do_proc_douintvec_minmax_conv(unsigned long *lvalp,
 int proc_douintvec_minmax(const struct ctl_table *table, int write,
 			  void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct do_proc_douintvec_minmax_conv_param param = {
-		.min = (unsigned int *) table->extra1,
-		.max = (unsigned int *) table->extra2,
-	};
+	struct do_proc_minmax_conv_param param;
+
+	param.min = (table->extra1) ? *(unsigned int *) table->extra1 : 0;
+	param.max = (table->extra2) ? *(unsigned int *) table->extra2 : UINT_MAX;
+
 	return do_proc_douintvec(table, write, buffer, lenp, ppos,
 				 do_proc_douintvec_minmax_conv, &param);
 }
@@ -950,23 +903,17 @@ int proc_dou8vec_minmax(const struct ctl_table *table, int write,
 			void *buffer, size_t *lenp, loff_t *ppos)
 {
 	struct ctl_table tmp;
-	unsigned int min = 0, max = 255U, val;
+	unsigned int val;
 	u8 *data = table->data;
-	struct do_proc_douintvec_minmax_conv_param param = {
-		.min = &min,
-		.max = &max,
-	};
+	struct do_proc_minmax_conv_param param;
 	int res;
 
 	/* Do not support arrays yet. */
 	if (table->maxlen != sizeof(u8))
 		return -EINVAL;
 
-	if (table->extra1)
-		min = *(unsigned int *) table->extra1;
-	if (table->extra2)
-		max = *(unsigned int *) table->extra2;
-
+	param.min = (table->extra1) ? *(unsigned int *) table->extra1 : 0;
+	param.max = (table->extra2) ? *(unsigned int *) table->extra2 : 255U;
 	tmp = *table;
 
 	tmp.maxlen = sizeof(val);
@@ -1007,7 +954,7 @@ static int __do_proc_doulongvec_minmax(void *data,
 		void *buffer, size_t *lenp, loff_t *ppos,
 		unsigned long convmul, unsigned long convdiv)
 {
-	unsigned long *i, *min, *max;
+	unsigned long *i, min, max;
 	int vleft, first = 1, err = 0;
 	size_t left;
 	char *p;
@@ -1018,8 +965,9 @@ static int __do_proc_doulongvec_minmax(void *data,
 	}
 
 	i = data;
-	min = table->extra1;
-	max = table->extra2;
+	min = (table->extra1) ? *(unsigned long *) table->extra1 : 0;
+	max = (table->extra2) ? *(unsigned long *) table->extra2 : ULONG_MAX;
+
 	vleft = table->maxlen / sizeof(unsigned long);
 	left = *lenp;
 
@@ -1051,7 +999,7 @@ static int __do_proc_doulongvec_minmax(void *data,
 			}
 
 			val = convmul * val / convdiv;
-			if ((min && val < *min) || (max && val > *max)) {
+			if ((val < min) || (val > max)) {
 				err = -EINVAL;
 				break;
 			}
@@ -1209,7 +1157,7 @@ static int do_proc_dointvec_ms_jiffies_minmax_conv(bool *negp, unsigned long *lv
 						int *valp, int write, void *data)
 {
 	int tmp, ret;
-	struct do_proc_dointvec_minmax_conv_param *param = data;
+	struct do_proc_minmax_conv_param *param = data;
 	/*
 	 * If writing, first do so via a temporary local int so we can
 	 * bounds-check it before touching *valp.
@@ -1221,8 +1169,7 @@ static int do_proc_dointvec_ms_jiffies_minmax_conv(bool *negp, unsigned long *lv
 		return ret;
 
 	if (write) {
-		if ((param->min && *param->min > tmp) ||
-				(param->max && *param->max < tmp))
+		if ((param->min > tmp) || (param->max < tmp))
 			return -EINVAL;
 		*valp = tmp;
 	}
@@ -1254,10 +1201,10 @@ int proc_dointvec_jiffies(const struct ctl_table *table, int write,
 int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, int write,
 			  void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct do_proc_dointvec_minmax_conv_param param = {
-		.min = (int *) table->extra1,
-		.max = (int *) table->extra2,
-	};
+	struct do_proc_minmax_conv_param param;
+
+	param.min = (table->extra1) ? *(int *) table->extra1 : INT_MIN;
+	param.max = (table->extra2) ? *(int *) table->extra2 : INT_MAX;
 	return do_proc_dointvec(table, write, buffer, lenp, ppos,
 			do_proc_dointvec_ms_jiffies_minmax_conv, &param);
 }
-- 
2.25.1

