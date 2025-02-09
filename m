Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A51DF967
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739116809; cv=none; b=SSbzncp5XiWHXgYfEBle4UfCx9WUn068ZASRCMeTHb+IgzhXT3ts3LVehZhC5arM2xPDsJp3s7fFs5SWoaQjMqS2xSqh3lQqWLHHXM4vS9RB3RL+EhcQZyP+cFarMkZMk4ue/j3nZkXi7hRru7hHLMczKYz0FLwGy/CRF3+K+LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739116809; c=relaxed/simple;
	bh=NNgJ24uoHbg38byL385xCjee8sVFTOFfnx8XEp96pkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JwaTXC8pls788QiAZ72FtFspU3G3zu369+3eclmqfeJ+ztuq6s50qBcWu97rdc76DtwLzmjqv628un3f/INc/5otnvi3UxUc7r3tZLCiAyjAYyIurs2UFYoyDq1FLSrKWtR+Soljio9MdvWuFcZqTmQslHN9GhMOlICxBzZif7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v28pio5z; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v28pio5z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739116804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7OinkOZF/f7EoTMzksKY7Lf0HZK7M3o3Djrf3Zs1d8=;
	b=v28pio5zi/cKH6WpK6XSQaPvdu9lh8zpZvmTwrsNOGQH7V918wuakfKDnvJ+p97YyzAvyQ
	v/z1Gb2p+nMUWGLJSCauquseZEPZnkyWKd+91TFZ2xzANZfk3RPQ6Bpqdsy7KdaCV55Dgf
	nLLPCJK5CYMGTxjGocs/D/LNUPw9rig=
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
Subject: [PATCH v5 4/5] sysctl: add kunit test code to check the min/max encoding of sysctl table entries
Date: Sun,  9 Feb 2025 23:58:12 +0800
Message-Id: <9b0ef52afdb154d43cb93a8c5ab71125270f50bf.1739115369.git.wen.yang@linux.dev>
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

Add kunit test code to check the impact of encoding the min/max values
directly in table entries on functions such as proc_rointvec,
proc_rou8vectminmax, proc_rouintvectminmax, and proc_roulongvectminmax,
including basic parsing testing and min/max overflow testing.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Joel Granados <j.granados@samsung.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Dave Young <dyoung@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/sysctl-test.c | 581 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 581 insertions(+)

diff --git a/kernel/sysctl-test.c b/kernel/sysctl-test.c
index 3ac98bb7fb82..47064ab8b7f3 100644
--- a/kernel/sysctl-test.c
+++ b/kernel/sysctl-test.c
@@ -415,6 +415,575 @@ static void sysctl_test_register_sysctl_sz_invalid_extra_value(
 	KUNIT_EXPECT_NOT_NULL(test, register_sysctl("foo", table_qux));
 }
 
+static void sysctl_test_api_dointvec_write_with_minmax(
+		struct kunit *test)
+{
+	int data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(int),
+		.mode		= 0644 | SYSCTL_FLAG_MIN | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_dointvec_minmax,
+		.min		= -1,
+		.max		= 100,
+	};
+	size_t max_len = 32, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "10";
+	char input2[] = "-5";
+	char input3[] = "200";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 10, *((int *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 10, *((int *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 10, *((int *)table.data));
+}
+
+static void sysctl_test_api_dointvec_write_with_min(
+		struct kunit *test)
+{
+	int data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(int),
+		.mode		= 0644 | SYSCTL_FLAG_MIN,
+		.proc_handler	= proc_dointvec_minmax,
+		.min		= -1,
+	};
+	size_t max_len = 32, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "10";
+	char input2[] = "-5";
+	char input3[] = "2147483647";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 10, *((int *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 10, *((int *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input3) - 1, len);
+	KUNIT_EXPECT_EQ(test, 2147483647, *((int *)table.data));
+}
+
+static void sysctl_test_api_dointvec_write_with_max(
+		struct kunit *test)
+{
+	int data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(int),
+		.mode		= 0644 | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_dointvec_minmax,
+		.max		= 100,
+	};
+	size_t max_len = 32, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "10";
+	char input2[] = "2147483647";
+	char input3[] = "-2147483648";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 10, *((int *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 10, *((int *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input3) - 1, len);
+	KUNIT_EXPECT_EQ(test, -2147483648, *((int *)table.data));
+}
+
+static void sysctl_test_api_douintvec_write_with_minmax(
+		struct kunit *test)
+{
+	unsigned int data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(int),
+		.mode		= 0644 | SYSCTL_FLAG_MIN | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_douintvec_minmax,
+		.min		= 4,
+		.max		= 200,
+	};
+	size_t max_len = 32, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "100";
+	char input2[] = "3";
+	char input3[] = "1000";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 100, *((unsigned int *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 100, *((unsigned int *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 100, *((unsigned int *)table.data));
+}
+
+static void sysctl_test_api_douintvec_write_with_min(
+		struct kunit *test)
+{
+	unsigned int data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(int),
+		.mode		= 0644 | SYSCTL_FLAG_MIN,
+		.proc_handler	= proc_douintvec_minmax,
+		.min		= 4,
+	};
+	size_t max_len = 32, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "100";
+	char input2[] = "3";
+	char input3[] = "4294967295";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 100, *((unsigned int *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 100, *((unsigned int *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input3) - 1, len);
+	KUNIT_EXPECT_EQ(test, 4294967295, *((unsigned int *)table.data));
+}
+
+static void sysctl_test_api_douintvec_write_with_max(
+		struct kunit *test)
+{
+	unsigned int data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(int),
+		.mode		= 0644 | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_douintvec_minmax,
+		.max		= 1000,
+	};
+	size_t max_len = 32, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "900";
+	char input2[] = "10000";
+	char input3[] = "0";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 900, *((unsigned int *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 900, *((unsigned int *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_douintvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input3) - 1, len);
+	KUNIT_EXPECT_EQ(test, 0, *((unsigned int *)table.data));
+}
+
+static void sysctl_test_api_dou8vec_write_with_minmax(
+		struct kunit *test)
+{
+	unsigned char data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(unsigned char),
+		.mode		= 0644 | SYSCTL_FLAG_MIN | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_dou8vec_minmax,
+		.min		= 3,
+		.max		= 100,
+	};
+	size_t max_len = 8, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "32";
+	char input2[] = "1";
+	char input3[] = "200";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 32, *((unsigned char *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 32, *((unsigned char *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 32, *((unsigned char *)table.data));
+}
+
+static void sysctl_test_api_dou8vec_write_with_min(
+		struct kunit *test)
+{
+	unsigned char data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(unsigned char),
+		.mode		= 0644 | SYSCTL_FLAG_MIN,
+		.proc_handler	= proc_dou8vec_minmax,
+		.min		= 3,
+	};
+	size_t max_len = 8, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "32";
+	char input2[] = "1";
+	char input3[] = "255";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 32, *((unsigned char *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 32, *((unsigned char *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input3) - 1, len);
+	KUNIT_EXPECT_EQ(test, 255, *((unsigned char *)table.data));
+}
+
+static void sysctl_test_api_dou8vec_write_with_max(
+		struct kunit *test)
+{
+	unsigned char data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(unsigned char),
+		.mode		= 0644 | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_dou8vec_minmax,
+		.max		= 200,
+	};
+	size_t max_len = 8, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "32";
+	char input2[] = "0";
+	char input3[] = "255";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 32, *((unsigned char *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input2) - 1, len);
+	KUNIT_EXPECT_EQ(test, 0, *((unsigned char *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_dou8vec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 0, *((unsigned char *)table.data));
+}
+
+static void sysctl_test_api_doulongvec_write_with_minmax(
+		struct kunit *test)
+{
+	unsigned long data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(unsigned long),
+		.mode		= 0644 | SYSCTL_FLAG_MIN | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_doulongvec_minmax,
+		.min		= 1000,
+		.max		= 3000,
+	};
+	size_t max_len = 64, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "1024";
+	char input2[] = "100";
+	char input3[] = "4096";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 1024, *((unsigned long *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 1024, *((unsigned long *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+				user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 1024, *((unsigned long *)table.data));
+}
+
+static void sysctl_test_api_doulongvec_write_with_min(
+		struct kunit *test)
+{
+	unsigned long data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(unsigned long),
+		.mode		= 0644 | SYSCTL_FLAG_MIN,
+		.proc_handler	= proc_doulongvec_minmax,
+		.min		= 1000,
+	};
+	size_t max_len = 64, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "1000";
+	char input2[] = "10";
+	char input3[64] = {0};
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 1000, *((unsigned long *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 1000, *((unsigned long *)table.data));
+
+	// test for input3
+	snprintf(input3, sizeof(input3), "%lu", ULONG_MAX);
+	len = strlen(input3);
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, strlen(input3), len);
+	KUNIT_EXPECT_EQ(test, ULONG_MAX, *((unsigned long *)table.data));
+}
+
+static void sysctl_test_api_doulongvec_write_with_max(
+		struct kunit *test)
+{
+	unsigned long data = 0;
+	const struct ctl_table table = {
+		.procname = "foo",
+		.data		= &data,
+		.maxlen		= sizeof(unsigned long),
+		.mode		= 0644 | SYSCTL_FLAG_MAX,
+		.proc_handler	= proc_doulongvec_minmax,
+		.max		= 3000,
+	};
+	size_t max_len = 64, len = max_len;
+	loff_t pos = 0;
+	char *buffer = kunit_kzalloc(test, max_len, GFP_USER);
+	char __user *user_buffer = (char __user *)buffer;
+	char input1[] = "1024";
+	char input2[] = "4096";
+	char input3[] = "0";
+
+	// test for input1
+	len = sizeof(input1) - 1;
+	memcpy(buffer, input1, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input1) - 1, len);
+	KUNIT_EXPECT_EQ(test, 1024, *((unsigned long *)table.data));
+
+	// test for input2
+	len = sizeof(input2) - 1;
+	pos = 0;
+	memcpy(buffer, input2, len);
+	KUNIT_EXPECT_EQ(test, -EINVAL, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, 0, pos);
+	KUNIT_EXPECT_EQ(test, 1024, *((unsigned long *)table.data));
+
+	// test for input3
+	len = sizeof(input3) - 1;
+	pos = 0;
+	memcpy(buffer, input3, len);
+	KUNIT_EXPECT_EQ(test, 0, proc_doulongvec_minmax(&table, KUNIT_PROC_WRITE,
+			user_buffer, &len, &pos));
+	KUNIT_EXPECT_EQ(test, sizeof(input3) - 1, len);
+	KUNIT_EXPECT_EQ(test, 0, *((unsigned long *)table.data));
+}
+
 static struct kunit_case sysctl_test_cases[] = {
 	KUNIT_CASE(sysctl_test_api_dointvec_null_tbl_data),
 	KUNIT_CASE(sysctl_test_api_dointvec_table_maxlen_unset),
@@ -427,6 +996,18 @@ static struct kunit_case sysctl_test_cases[] = {
 	KUNIT_CASE(sysctl_test_api_dointvec_write_single_less_int_min),
 	KUNIT_CASE(sysctl_test_api_dointvec_write_single_greater_int_max),
 	KUNIT_CASE(sysctl_test_register_sysctl_sz_invalid_extra_value),
+	KUNIT_CASE(sysctl_test_api_dointvec_write_with_minmax),
+	KUNIT_CASE(sysctl_test_api_dointvec_write_with_min),
+	KUNIT_CASE(sysctl_test_api_dointvec_write_with_max),
+	KUNIT_CASE(sysctl_test_api_douintvec_write_with_minmax),
+	KUNIT_CASE(sysctl_test_api_douintvec_write_with_min),
+	KUNIT_CASE(sysctl_test_api_douintvec_write_with_max),
+	KUNIT_CASE(sysctl_test_api_dou8vec_write_with_minmax),
+	KUNIT_CASE(sysctl_test_api_dou8vec_write_with_min),
+	KUNIT_CASE(sysctl_test_api_dou8vec_write_with_max),
+	KUNIT_CASE(sysctl_test_api_doulongvec_write_with_minmax),
+	KUNIT_CASE(sysctl_test_api_doulongvec_write_with_min),
+	KUNIT_CASE(sysctl_test_api_doulongvec_write_with_max),
 	{}
 };
 
-- 
2.25.1

