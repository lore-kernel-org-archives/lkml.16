Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785CE25EFBD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413782; cv=none; b=FczQBwZKyztd2JHnQ4RFspNpwpfwoIKdpIu2DU8e4Ox3LQkC426g2AseFJxa8lKGv0HJM40VPnQcvERCAwjOZiegoYoz2tsmsca6k8lhj8nrotJbQyxPplH+FYyhahv7WcQCaCz9+chCBGcXCyv8Ve6EslpSD9mVMlGniNElkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413782; c=relaxed/simple;
	bh=n6jcWGmhWCJZZlTLzZwwm6ZZLht7nq06BcTktwIUmuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Wtfa71ZVMu8PaSEcnRb2I+FN88JvlF6cV2bNi5JVC3ZiRcXUgZUdLolwzCW80jNNt8Ankyd7evHqNPUQURymO1MmMxB+IqEZkBbAxl+yCP1tay9XvBbI99yWaWWSG1FxlN+jJa9tY0YnV7x0Jp2Ml6PXxm9qWmFJXQFwuOj/xUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KA2vB0009927;
	Fri, 20 Jun 2025 12:02:57 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 4/4] tools/nolibc: add missing memchr() to string.h
Date: Fri, 20 Jun 2025 12:02:51 +0200
Message-Id: <20250620100251.9877-5-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250620100251.9877-1-w@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Surprisingly we forgot to add this common one. It was added with a
per-arch guard allowing to later implement it in arch-specific asm
code like was done for a few other ones.

The test verifies that we don't search past the indicated length.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/string.h                | 15 +++++++++++++++
 tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index 163a17e7dd38b..4000926f44ac4 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -93,6 +93,21 @@ void *memset(void *dst, int b, size_t len)
 }
 #endif /* #ifndef NOLIBC_ARCH_HAS_MEMSET */
 
+#ifndef NOLIBC_ARCH_HAS_MEMCHR
+static __attribute__((unused))
+void *memchr(const void *s, int c, size_t len)
+{
+	char *p = (char *)s;
+
+	while (len--) {
+		if (*p == (char)c)
+			return p;
+		p++;
+	}
+	return NULL;
+}
+#endif /* #ifndef NOLIBC_ARCH_HAS_MEMCHR */
+
 static __attribute__((unused))
 char *strchr(const char *s, int c)
 {
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index dbe13000fb1ac..d832566265296 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1524,6 +1524,8 @@ int run_stdlib(int min, int max)
 		CASE_TEST(abs);                     EXPECT_EQ(1, abs(-10), 10); break;
 		CASE_TEST(abs_noop);                EXPECT_EQ(1, abs(10), 10); break;
 		CASE_TEST(difftime);                EXPECT_ZR(1, test_difftime()); break;
+		CASE_TEST(memchr_foobar6_o);        EXPECT_STREQ(1, memchr("foobar", 'o', 6), "oobar"); break;
+		CASE_TEST(memchr_foobar3_b);        EXPECT_STRZR(1, memchr("foobar", 'b', 3)); break;
 
 		case __LINE__:
 			return ret; /* must be last */
-- 
2.17.5

