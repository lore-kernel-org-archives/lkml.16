Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC2478F2F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958266; cv=none; b=XhSNI/eanf1ThUQ+KQFRLKqFsQzswMpQ+duNVvX86k+Z7IBzSQEvvpkph2Z943SRtYa49uIuOYJGeu62Cr9lDg9v4tekushd7ZZpLOUmd3H/9AxmDEeJj2THk+nQwzu63E1l1UAkHaOokJqCPnpZXpvGTegTJHUTxNyxzy0h9V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958266; c=relaxed/simple;
	bh=wraxF92E5UMplfHdosxwPoePMfHDlZiunci84xKy9ow=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qf+aaAkK9EwBxjzeoWv5BLUFNwhhVncT23p4MOxJhduzITXyFEIQ3I+buBELpugOoNYPz+DJyP5CFiQqFQ/7n/p0FXXBkg2cFLdSoBjKHaei5xQeN8o0l7a+Q3yQp98mOY+dgyojGjUXzPuLORM4Ph+mRP2QshdcusPViY5lT/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marievic.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJ+tFYuQ; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marievic.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJ+tFYuQ"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so178582785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750958263; x=1751563063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9bhxg3fOhJ4ocdPhUszxgKjahNAxF1eH+RBCnIZYJrA=;
        b=ZJ+tFYuQb4WApiasmLYmXbcWJaM0x2p9zZpZUs+uuySUD5MBhhFXrHMfbd8NWMc6XY
         n45Khb8YfqScW6Bjv9lT4i7HP7i0se3fltNqqq39npxMWURb8GAO/+iY+mqIgGs9blM/
         VHHA+c6JL/pBc8d9eubEMGiZ3e0DmvBIhXq9j/uM8EgldVjDiDFBNYOyuEjquM2gGP9L
         mg7bJDOxP5hBV6dBgOArKzxQgiU9xphpCTvmms3Off+unJRpx6X8DevQjGbmmhott6WJ
         nw/xUxCW42gn+OME/cv6aUTEYwt53+eK+9aLkNUhVJilTKKzQ/SZo++qLddzsAZ6d3wr
         VFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750958263; x=1751563063;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bhxg3fOhJ4ocdPhUszxgKjahNAxF1eH+RBCnIZYJrA=;
        b=LJc0L3q15bjwYIDkkqdDOZGR5FquLeFyATM+8kCiRlAGASzytjomWriHGvzHd5o6WS
         1icJMVwDCCoYtqhFxWH0Pu+DYNG0ku+3ZQWEf8xc/ikWwHlmLUeCdQB3uBgm1aOpszJs
         ZVwjzSiGtYTqQkMpCKkMZgst260Obmn1cMfJak/WRAu4jCo3jQf/KcIj1ADUjx1RuQYl
         nD+DiqsD2IqR2HQlAQpvpYEQcEt72+Yuez8vE+KHDfsoXd8k4WcI83NQ0MmROv+uDNYQ
         V8uH0r+F/Gnw2qtw1yNVe1ZJnw0IcxISG7NXMxo3n+nKt8mEYQr64vV6A2am2Jd4tKQd
         v0lw==
X-Forwarded-Encrypted: i=1; AJvYcCVJfAh3QRY0GksiMKAXMZSUwlgKb0pgCJRZ280L9iuaCksfiaFXgf8zqkZ5D+lgbOTlDz0A+8GiTAUjor0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkF4JNN/KQi5xLznAnKhROZwbdCjqbSjuaAGqi/GbX9QJvEJP4
	vgknYNiuB1SC98faP+mz03CsoP2E/Lr502jrZSzHsskaFhgISIBFhJng449XhXssP+YbJYMG5ud
	Huau3QExiSuIxng==
X-Google-Smtp-Source: AGHT+IGW3Lb93nR97g0YhaLSp+vwVF5TL23ka7gRWZ1ay34aGEsUXZwqal+m1lyEpUN6FXWehUOPpulZf4i3rA==
X-Received: from qkis20.prod.google.com ([2002:a05:620a:bd4:b0:7ce:c215:7cab])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2b87:b0:7d3:8ee7:ca10 with SMTP id af79cd13be357-7d443935786mr51080385a.2.1750958262975;
 Thu, 26 Jun 2025 10:17:42 -0700 (PDT)
Date: Thu, 26 Jun 2025 17:17:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626171730.1765004-1-marievic@google.com>
Subject: [PATCH] kunit: Make default kunit_test timeout configurable via both
 a module parameter and a Kconfig option
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, shuah@kernel.org, davidgow@google.com
Cc: geert@linux-m68k.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Marie Zhussupova <marievic@google.com>
Content-Type: text/plain; charset="UTF-8"

To accommodate varying hardware performance and use cases,
the default kunit test case timeout (currently 300 seconds)
is now configurable. Users can adjust the timeout by
either setting the 'timeout' module parameter or the
KUNIT_DEFAULT_TIMEOUT Kconfig option to their desired
timeout in seconds.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 lib/kunit/Kconfig | 13 +++++++++++++
 lib/kunit/test.c  | 15 ++++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index a97897edd964..c10ede4b1d22 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -93,4 +93,17 @@ config KUNIT_AUTORUN_ENABLED
 	  In most cases this should be left as Y. Only if additional opt-in
 	  behavior is needed should this be set to N.
 
+config KUNIT_DEFAULT_TIMEOUT
+	int "Default value of the timeout module parameter"
+	default 300
+	help
+	  Sets the default timeout, in seconds, for Kunit test cases. This value
+	  is further multiplied by a factor determined by the assigned speed
+	  setting: 1x for `DEFAULT`, 3x for `KUNIT_SPEED_SLOW`, and 12x for
+	  `KUNIT_SPEED_VERY_SLOW`. This allows slower tests on slower machines
+	  sufficient time to complete.
+
+	  If unsure, the default timeout of 300 seconds is suitable for most
+	  cases.
+
 endif # KUNIT
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 002121675605..f3c6b11f12b8 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -69,6 +69,13 @@ static bool enable_param;
 module_param_named(enable, enable_param, bool, 0);
 MODULE_PARM_DESC(enable, "Enable KUnit tests");
 
+/*
+ * Configure the base timeout.
+ */
+static unsigned long kunit_base_timeout = CONFIG_KUNIT_DEFAULT_TIMEOUT;
+module_param_named(timeout, kunit_base_timeout, ulong, 0644);
+MODULE_PARM_DESC(timeout, "Set the base timeout for Kunit test cases");
+
 /*
  * KUnit statistic mode:
  * 0 - disabled
@@ -393,12 +400,6 @@ static int kunit_timeout_mult(enum kunit_speed speed)
 static unsigned long kunit_test_timeout(struct kunit_suite *suite, struct kunit_case *test_case)
 {
 	int mult = 1;
-	/*
-	 * TODO: Make the default (base) timeout configurable, so that users with
-	 * particularly slow or fast machines can successfully run tests, while
-	 * still taking advantage of the relative speed.
-	 */
-	unsigned long default_timeout = 300;
 
 	/*
 	 * The default test timeout is 300 seconds and will be adjusted by mult
@@ -409,7 +410,7 @@ static unsigned long kunit_test_timeout(struct kunit_suite *suite, struct kunit_
 		mult = kunit_timeout_mult(suite->attr.speed);
 	if (test_case->attr.speed != KUNIT_SPEED_UNSET)
 		mult = kunit_timeout_mult(test_case->attr.speed);
-	return mult * default_timeout * msecs_to_jiffies(MSEC_PER_SEC);
+	return mult * kunit_base_timeout * msecs_to_jiffies(MSEC_PER_SEC);
 }
 
 
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

