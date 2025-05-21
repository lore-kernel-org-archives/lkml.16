Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4011EDA11
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839902; cv=none; b=NpA8WemjtdN9UwFNlSf/oChx66w/iBPAXIszpCMlDbpVSRTghf0RRy3F8nttrLpDsd4fb+ERQs5qglnFrPzT/BBhflZxNYi9HFNO1eWw+qk9guWpaj9h4eMD/YSxKh1MJc7yCcegh1L7WGmz4JiOptkZcYCCnp8i51Z1uCJnhNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839902; c=relaxed/simple;
	bh=ywESkurKr0yXlByOEVgWxFEfUZ2zhLZgUAYNni6pUTA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jLCyjyDI0chbGpma6BJJrs0CY5c5dNtei8SJ2To8rqZhIiTLOovQ4oWRTmPcCUi/cvXDsup5amL4P92cU0ve/08ChRACNwRnDiqcikYxkwmUQzucHIVZPvnGvlG/opICH763EFj2gbQLRz3B4oHMXlXh4qXzL8vsGE84Nhu5a1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rEtCAQyJ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rEtCAQyJ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so43252835e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747839899; x=1748444699; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrgSgdosYNgER99wbA+p3mQJNyiihN5ynwjskXOpwxQ=;
        b=rEtCAQyJP5cWGl1KNxQD5f1vlPrY6Jt+eWQviNc7NR7ARuIHvw5RcaqINNSlRc1Dre
         bJaFfPfY3bKawE8mZkRukhtTwuH0LC9ptU2N8p5WlXSOCtVTWCrqV3xrlACXtPBgdzsX
         e0+uhHysZIqRtpklMCXBzkhO1/C/HiIbPhdarsgo50ReAdqaJ4SN1zGQkrPEIj4u7nZE
         AN7KBm6AWROGiQp4pLsFJ3Q/BxG2MWAXwfeF1Bi3gpKpjUfVeTVQQof6IaKFfdHkcO6H
         KgOc4/URcTDnjoEvqpgFGY5zQrM/HF0gDPG0H6QKjHr85VjGBm05NEj/BgFu4J5jDnfj
         Ki5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839899; x=1748444699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrgSgdosYNgER99wbA+p3mQJNyiihN5ynwjskXOpwxQ=;
        b=gdIC3HBk53SuQzR7HBFFyIhpI0rvSYI3er443MUfZvkYyuKDFG9RwyityXB6suN+t4
         PSHIqvyb7ZIt9hAy+xcXTJWTwmKJigyq2iDPEJjEmpyws3zdfgMA5WwC64FjSZrrzLHN
         o1cCgjC8ZMZxq4ePlQuIFqzAYYQI5Jj3gRFSoRJByj52Zzt/wZR3qqEE+xAbvdxbog0E
         2IenrHyB4gQTm5HH752ZjHY1fo6Yo5eX+NgGjfQxxWF8loN2sIQbzm0mr4vkE6Ff43Xc
         puWYQr4q7zyubbOtlnrBw/qlYWEe2xabaebGCUcMeG7RrovX59bRGm2ZYVFAysQ2jhV9
         1KoA==
X-Forwarded-Encrypted: i=1; AJvYcCWst1Zk9i+eP7vg7XpYvaSOLiY119GmuviPUvsUI3cMA7jdvt1mRPfXA/IQazP+ZlWAqz2qvKbx32CRwfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhRyn6wuFKdCAxyMoyz+z62vClNMu8AJAm0NmLa/kmkjl/bTvh
	IN32pfLfBHyIJKhHTGwxy5OFe/QoALoLwJw7jHLvC1j403+y/gZLSyl2fabolmo2a2IqS/UOqQx
	uVNiJoouf+g==
X-Google-Smtp-Source: AGHT+IFCk6Cdl+XpwT5/8fDVsK/FiGkeFImvLe+eJVfYABO4MP2OYT1Q5b8KkphKSAyYoP+T+WtvwdUSE5oD
X-Received: from wmbem23.prod.google.com ([2002:a05:600c:8217:b0:442:e19a:2ac9])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4449:b0:441:ac58:ead5
 with SMTP id 5b1f17b1804b1-442fd67591fmr229849425e9.31.1747839898773; Wed, 21
 May 2025 08:04:58 -0700 (PDT)
Date: Wed, 21 May 2025 17:04:30 +0200
In-Reply-To: <cover.1747839857.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747839857.git.dvyukov@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <8df4b50b176b073550bab5b3f3faff752c5f8e17.1747839857.git.dvyukov@google.com>
Subject: [PATCH v3 3/3] selftests: Add tests for PR_SYS_DISPATCH_INCLUSIVE_ON
From: Dmitry Vyukov <dvyukov@google.com>
To: krisman@collabora.com, tglx@linutronix.de, luto@kernel.org, 
	peterz@infradead.org, keescook@chromium.org, gregory.price@memverge.com
Cc: Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add tests for PR_SYS_DISPATCH_INCLUSIVE_ON correct/incorrect args,
and a test that ensures that the specified range is respected
by both PR_SYS_DISPATCH_EXCLUSIVE_ON and PR_SYS_DISPATCH_INCLUSIVE_ON.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Gregory Price <gregory.price@memverge.com>
Cc: Marco Elver <elver@google.com>
Cc: linux-kernel@vger.kernel.org

---
Changes in v3:
 - rework tests for the new PR_SYS_DISPATCH_INCLUSIVE_ON

Changes in v2:
 - add tests for 0-sized range
 - change range setup in the test to be fatal
---
 .../syscall_user_dispatch/sud_test.c          | 94 +++++++++++++++----
 1 file changed, 74 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_test.c b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
index 48cf01aeec3e7..2eb2c06303f2a 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_test.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
@@ -10,6 +10,8 @@
 #include <sys/sysinfo.h>
 #include <sys/syscall.h>
 #include <signal.h>
+#include <stdbool.h>
+#include <stdlib.h>
 
 #include <asm/unistd.h>
 #include "../kselftest_harness.h"
@@ -17,11 +19,15 @@
 #ifndef PR_SET_SYSCALL_USER_DISPATCH
 # define PR_SET_SYSCALL_USER_DISPATCH	59
 # define PR_SYS_DISPATCH_OFF	0
-# define PR_SYS_DISPATCH_ON	1
 # define SYSCALL_DISPATCH_FILTER_ALLOW	0
 # define SYSCALL_DISPATCH_FILTER_BLOCK	1
 #endif
 
+#ifndef PR_SYS_DISPATCH_EXCLUSIVE_ON
+# define PR_SYS_DISPATCH_EXCLUSIVE_ON	1
+# define PR_SYS_DISPATCH_INCLUSIVE_ON	2
+#endif
+
 #ifndef SYS_USER_DISPATCH
 # define SYS_USER_DISPATCH	2
 #endif
@@ -65,7 +71,7 @@ TEST_SIGNAL(dispatch_trigger_sigsys, SIGSYS)
 	ret = sysinfo(&info);
 	ASSERT_EQ(0, ret);
 
-	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_ON, 0, 0, &sel);
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, 0, &sel);
 	ASSERT_EQ(0, ret) {
 		TH_LOG("Kernel does not support CONFIG_SYSCALL_USER_DISPATCH");
 	}
@@ -118,8 +124,8 @@ TEST(bad_prctl_param)
 	/* Valid parameter */
 	prctl_valid(_metadata, op, 0x0, 0x0, 0x0);
 
-	/* PR_SYS_DISPATCH_ON */
-	op = PR_SYS_DISPATCH_ON;
+	/* PR_SYS_DISPATCH_EXCLUSIVE_ON */
+	op = PR_SYS_DISPATCH_EXCLUSIVE_ON;
 
 	/* Dispatcher region is bad (offset > 0 && len == 0) */
 	prctl_invalid(_metadata, op, 0x1, 0x0, &sel, EINVAL);
@@ -131,12 +137,24 @@ TEST(bad_prctl_param)
 	/*
 	 * Dispatcher range overflows unsigned long
 	 */
-	prctl_invalid(_metadata, PR_SYS_DISPATCH_ON, 1, -1L, &sel, EINVAL);
+	prctl_invalid(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, 1, -1L, &sel, EINVAL);
 
 	/*
 	 * Allowed range overflows usigned long
 	 */
-	prctl_invalid(_metadata, PR_SYS_DISPATCH_ON, -1L, 0x1, &sel, EINVAL);
+	prctl_invalid(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, -1L, 0x1, &sel, EINVAL);
+
+	/* 0 len should fail for PR_SYS_DISPATCH_INCLUSIVE_ON */
+	prctl_invalid(_metadata, PR_SYS_DISPATCH_INCLUSIVE_ON, 1, 0, 0, EINVAL);
+
+	/* Range wrap-around should fail */
+	prctl_invalid(_metadata, PR_SYS_DISPATCH_INCLUSIVE_ON, -1L, 2, 0, EINVAL);
+
+	/* Normal range shouldn't fail */
+	prctl_valid(_metadata, PR_SYS_DISPATCH_INCLUSIVE_ON, 2, 3, 0);
+
+	/* Invalid selector */
+	prctl_invalid(_metadata, PR_SYS_DISPATCH_INCLUSIVE_ON, 2, 3, (void *) -1, EFAULT);
 }
 
 /*
@@ -147,11 +165,13 @@ char glob_sel;
 int nr_syscalls_emulated;
 int si_code;
 int si_errno;
+unsigned long syscall_addr;
 
 static void handle_sigsys(int sig, siginfo_t *info, void *ucontext)
 {
 	si_code = info->si_code;
 	si_errno = info->si_errno;
+	syscall_addr = (unsigned long)info->si_call_addr;
 
 	if (info->si_syscall == MAGIC_SYSCALL_1)
 		nr_syscalls_emulated++;
@@ -174,31 +194,34 @@ static void handle_sigsys(int sig, siginfo_t *info, void *ucontext)
 #endif
 }
 
-TEST(dispatch_and_return)
+int setup_sigsys_handler(void)
 {
-	long ret;
 	struct sigaction act;
 	sigset_t mask;
 
-	glob_sel = 0;
-	nr_syscalls_emulated = 0;
-	si_code = 0;
-	si_errno = 0;
-
 	memset(&act, 0, sizeof(act));
 	sigemptyset(&mask);
-
 	act.sa_sigaction = handle_sigsys;
 	act.sa_flags = SA_SIGINFO;
 	act.sa_mask = mask;
+	return sigaction(SIGSYS, &act, NULL);
+}
 
-	ret = sigaction(SIGSYS, &act, NULL);
-	ASSERT_EQ(0, ret);
+TEST(dispatch_and_return)
+{
+	long ret;
+
+	glob_sel = 0;
+	nr_syscalls_emulated = 0;
+	si_code = 0;
+	si_errno = 0;
+
+	ASSERT_EQ(0, setup_sigsys_handler());
 
 	/* Make sure selector is good prior to prctl. */
 	SYSCALL_DISPATCH_OFF(glob_sel);
 
-	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_ON, 0, 0, &glob_sel);
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, 0, &glob_sel);
 	ASSERT_EQ(0, ret) {
 		TH_LOG("Kernel does not support CONFIG_SYSCALL_USER_DISPATCH");
 	}
@@ -254,7 +277,7 @@ TEST_SIGNAL(bad_selector, SIGSYS)
 	/* Make sure selector is good prior to prctl. */
 	SYSCALL_DISPATCH_OFF(glob_sel);
 
-	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_ON, 0, 0, &glob_sel);
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, 0, &glob_sel);
 	ASSERT_EQ(0, ret) {
 		TH_LOG("Kernel does not support CONFIG_SYSCALL_USER_DISPATCH");
 	}
@@ -278,7 +301,7 @@ TEST(disable_dispatch)
 	struct sysinfo info;
 	char sel = 0;
 
-	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_ON, 0, 0, &sel);
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, 0, &sel);
 	ASSERT_EQ(0, ret) {
 		TH_LOG("Kernel does not support CONFIG_SYSCALL_USER_DISPATCH");
 	}
@@ -310,7 +333,7 @@ TEST(direct_dispatch_range)
 	 * Instead of calculating libc addresses; allow the entire
 	 * memory map and lock the selector.
 	 */
-	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_ON, 0, -1L, &sel);
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, -1L, &sel);
 	ASSERT_EQ(0, ret) {
 		TH_LOG("Kernel does not support CONFIG_SYSCALL_USER_DISPATCH");
 	}
@@ -323,4 +346,35 @@ TEST(direct_dispatch_range)
 	}
 }
 
+static void test_range(struct __test_metadata *_metadata,
+		       unsigned long op, unsigned long off,
+		       unsigned long size, bool dispatch)
+{
+	nr_syscalls_emulated = 0;
+	SYSCALL_DISPATCH_OFF(glob_sel);
+	EXPECT_EQ(0, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, off, size, &glob_sel));
+	SYSCALL_DISPATCH_ON(glob_sel);
+	if (dispatch) {
+		EXPECT_EQ(syscall(MAGIC_SYSCALL_1), MAGIC_SYSCALL_1);
+		EXPECT_EQ(nr_syscalls_emulated, 1);
+	} else {
+		EXPECT_EQ(syscall(MAGIC_SYSCALL_1), -1);
+		EXPECT_EQ(nr_syscalls_emulated, 0);
+	}
+}
+
+TEST(dispatch_range)
+{
+	ASSERT_EQ(0, setup_sigsys_handler());
+	test_range(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, 0, true);
+	test_range(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, syscall_addr, 1, false);
+	test_range(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, syscall_addr-100, 200, false);
+	test_range(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, syscall_addr+1, 100, true);
+	test_range(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, syscall_addr-100, 100, true);
+	test_range(_metadata, PR_SYS_DISPATCH_INCLUSIVE_ON, syscall_addr, 1, true);
+	test_range(_metadata, PR_SYS_DISPATCH_INCLUSIVE_ON, syscall_addr-1, 1, false);
+	test_range(_metadata, PR_SYS_DISPATCH_INCLUSIVE_ON, syscall_addr+1, 1, false);
+	SYSCALL_DISPATCH_OFF(glob_sel);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0.1143.g0be31eac6b-goog

