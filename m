Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AF52EB1D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981458; cv=none; b=MjhMqfpAMFuO9sJkocKl1TeOngh/ErMr/r94GL6xgJh4QvHmj/QpckZ9CiHxrthqBAaQjUWOaH5RKkr87TdostQYfkPyKF4tVWBo/jXD3bLBR+xB+gLkczqk8SQ+eO0ikmfN2aEA6wsRF0XbjDcPid86fTeem+TaXeyYqRjPkLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981458; c=relaxed/simple;
	bh=aN65jyOOlulDGqRV+3dR3KUf2ZNoBiszJnl/rlNQoFw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oMbU2itMDmUFLi2E74cXzB2cM4xQOabMbqey7GAs2DyAliy184KqIms1BtiVeCgnoLFtJxYQYDZXDwOEuxSSIIabeaz4ScYp7UDDpXMLnuWXgo7BtQnM7Eksq8j7ceJYieRt/X9qaJMF6LPGjXA3U+8pKLTVc3wnSPVfDBE1gbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7w3knaj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7w3knaj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442f9043f56so37428885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748981453; x=1749586253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwB24AhjYH1g0oTgqkjrBjkMlDyt0oxM7Ekx/Bvp0/o=;
        b=T7w3knajGs5z7vGsyR6V1C6/0akvwOb80+bruVFmQrP5h8x2PnEM98JjeCxavwNwuR
         hqNQqgqaADL+/wjRl8mEG6S89lyqSIzFkBYEbRp99TdxLlk8RJ6u6iEFH6LjWfAbDxVP
         +K50/hs5Y2djIVEk3dSBeobyhfRmYzcjvMWVfaIcgp3ONIthP9AYlmclxwiGmH/h42cE
         kerUkaoHTRxtw9b9dtMj5nSI2CGyrqbrKP4icRpgPwdZZJ2ANsm8nNY1OB/bX4VnbtWY
         JSZnFyOt/hoP7zjbpHwb96iuBbjnAvkrLvP3chQeFynvAh/ON0ofkoNC8tga3UtY/1Z6
         nlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748981453; x=1749586253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwB24AhjYH1g0oTgqkjrBjkMlDyt0oxM7Ekx/Bvp0/o=;
        b=UpSOdvr3oew0/oHj80OBVpkOMGb/U6hdqpPMa37XY4iYn3iFuvFZBigU+8GKfrDYuS
         5PKrUZa4draqwgIMd8/9EmTkZsOMfVQjpV1jlq60rJLPTofU6IrMlOMyD4mrWh+AL9lq
         U2iwg4VPq/YkggRk9GCkN/wj/jDTaeyBE2aYs1FoSf58+cluqhM9mCZBolulWRxbh2fv
         eyM72TZ7iKcpV1q1cZJD7L9GiFq1KGd+Koiab1+L/QEmwsBVsGEWG42z4maobRiL3qUi
         S1f+VT3TLgAL+oMIZVgukZ6q466tuz1HAyKnmrux1Ul3k1DXza+TJ3I1bKh/IjhxaMJR
         iVSw==
X-Forwarded-Encrypted: i=1; AJvYcCWE7g7efu0dG/19MJgVm2w6KkoW7cVXdd6O3E0Abfhz16RpkmoEzdg7QNapAtDnGbJYbNuxoUZezMEPJnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiqO9JYVoc1jUZzR2RzgxQUgBb5wgPm25ywkmI6cAVJHx8Qqp
	3H3eTgL4Ph9+23vGPsP5b6cwVlP5GGKa3QMkAM1Gz33K5lZNrAnEacTYip9ZY7wQi3o=
X-Gm-Gg: ASbGncswZjPs1el9RTMc8vEBL1Q26eyscnD1DE+ErUDWx6WFO6KcXJGsomUdnX38j/i
	GY/7JnH/3PpuEveBE8BZDr71RAw0TPSrWQ0zpKaMfjZXNNipPyWFjQbPHu3bDTjOr5Eua6onMCT
	GpbidJQBGjGMpbBbBxpmm0q9fqZJyxlO4++4y/dUO71G6D3T4OVXphQ5pej4IgamSpqll2m2znm
	cb/zs+Z6Upb0kapSYBJAqswjCkLH21kDcj8UXbqnETA+RocN5m8typf+0glSK587aa4l85No9O4
	pvjfN5qFcXwF2F+KctPMKkAMzmybmu4Goak7YDT27WGGcwiX8kFjAC+xGiKDxx2oejOs39bQVq9
	Xl7M8W67ZUMhFcKYVNw8jFFngKoEIIMdsZwYywtUbcib96b8Ef0Aynfg+lGzudfe+gjlYYBY=
X-Google-Smtp-Source: AGHT+IGA2ew16lW9hkbjwj2+dxBXTO8ITHoc4YIhf4OdJI3DPA33Hmk3EHAKN/4i7DrRFAalKoK0EQ==
X-Received: by 2002:a05:600c:3542:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-451f0b3938cmr493875e9.30.1748981453165;
        Tue, 03 Jun 2025 13:10:53 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d80065e0sm180719895e9.29.2025.06.03.13.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 13:10:52 -0700 (PDT)
From: Terry Tritton <terry.tritton@linaro.org>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: ttritton@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH] selftests/timers: Fix integer overlow errors on 32 bit systems
Date: Tue,  3 Jun 2025 21:10:36 +0100
Message-Id: <20250603201036.44504-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of NSEC_PER_SEC (1000000000L) as defined in include/vdso/time64.h
causes several integer overflow warnings and test errors on 32 bit 
architectures.

Use a long long instead of long to prevent integer overflow when 
converting seconds to nanoseconds.

Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
 tools/testing/selftests/timers/adjtick.c             | 5 ++++-
 tools/testing/selftests/timers/alarmtimer-suspend.c  | 4 +++-
 tools/testing/selftests/timers/inconsistency-check.c | 4 +++-
 tools/testing/selftests/timers/leap-a-day.c          | 4 +++-
 tools/testing/selftests/timers/mqueue-lat.c          | 3 ++-
 tools/testing/selftests/timers/nanosleep.c           | 4 +++-
 tools/testing/selftests/timers/nsleep-lat.c          | 4 +++-
 tools/testing/selftests/timers/posix_timers.c        | 5 ++++-
 tools/testing/selftests/timers/raw_skew.c            | 4 +++-
 tools/testing/selftests/timers/set-2038.c            | 4 +++-
 tools/testing/selftests/timers/set-timer-lat.c       | 4 +++-
 tools/testing/selftests/timers/valid-adjtimex.c      | 5 ++++-
 12 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/timers/adjtick.c b/tools/testing/selftests/timers/adjtick.c
index 777d9494b683..b5929c33b632 100644
--- a/tools/testing/selftests/timers/adjtick.c
+++ b/tools/testing/selftests/timers/adjtick.c
@@ -22,10 +22,13 @@
 #include <sys/time.h>
 #include <sys/timex.h>
 #include <time.h>
-#include <include/vdso/time64.h>
 
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+#define USEC_PER_SEC   1000000LL
+
 #define MILLION			1000000
 
 long systick;
diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/testing/selftests/timers/alarmtimer-suspend.c
index a9ef76ea6051..b5799df271ae 100644
--- a/tools/testing/selftests/timers/alarmtimer-suspend.c
+++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
@@ -28,10 +28,12 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <pthread.h>
-#include <include/vdso/time64.h>
 #include <errno.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 #define UNREASONABLE_LAT (NSEC_PER_SEC * 5) /* hopefully we resume in 5 secs */
 
 #define SUSPEND_SECS 15
diff --git a/tools/testing/selftests/timers/inconsistency-check.c b/tools/testing/selftests/timers/inconsistency-check.c
index 9d1573769d55..2b2d7293b313 100644
--- a/tools/testing/selftests/timers/inconsistency-check.c
+++ b/tools/testing/selftests/timers/inconsistency-check.c
@@ -28,9 +28,11 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
diff --git a/tools/testing/selftests/timers/leap-a-day.c b/tools/testing/selftests/timers/leap-a-day.c
index 04004a7c0934..008c38ce4b2f 100644
--- a/tools/testing/selftests/timers/leap-a-day.c
+++ b/tools/testing/selftests/timers/leap-a-day.c
@@ -48,9 +48,11 @@
 #include <string.h>
 #include <signal.h>
 #include <unistd.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 #define CLOCK_TAI 11
 
 time_t next_leap;
diff --git a/tools/testing/selftests/timers/mqueue-lat.c b/tools/testing/selftests/timers/mqueue-lat.c
index 63de2334a291..1a6d26f86137 100644
--- a/tools/testing/selftests/timers/mqueue-lat.c
+++ b/tools/testing/selftests/timers/mqueue-lat.c
@@ -29,9 +29,10 @@
 #include <signal.h>
 #include <errno.h>
 #include <mqueue.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
 
 #define TARGET_TIMEOUT		100000000	/* 100ms in nanoseconds */
 #define UNRESONABLE_LATENCY	40000000	/* 40ms in nanosecs */
diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 252c6308c569..55ea67478fdd 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -27,9 +27,11 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index de23dc0c9f97..347d622987c8 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -24,9 +24,11 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 #define UNRESONABLE_LATENCY 40000000 /* 40ms in nanosecs */
 
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index f0eceb0faf34..555bf161f420 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -16,11 +16,14 @@
 #include <string.h>
 #include <unistd.h>
 #include <time.h>
-#include <include/vdso/time64.h>
 #include <pthread.h>
 
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+#define USEC_PER_SEC   1000000LL
+
 #define DELAY 2
 
 static void __fatal_error(const char *test, const char *name, const char *what)
diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index 957f7cd29cb1..ff7675d98560 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -25,9 +25,11 @@
 #include <sys/time.h>
 #include <sys/timex.h>
 #include <time.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 #define shift_right(x, s) ({		\
 	__typeof__(x) __x = (x);	\
 	__typeof__(s) __s = (s);	\
diff --git a/tools/testing/selftests/timers/set-2038.c b/tools/testing/selftests/timers/set-2038.c
index ed244315e11c..8130d551a11c 100644
--- a/tools/testing/selftests/timers/set-2038.c
+++ b/tools/testing/selftests/timers/set-2038.c
@@ -27,9 +27,11 @@
 #include <unistd.h>
 #include <time.h>
 #include <sys/time.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 #define KTIME_MAX	((long long)~((unsigned long long)1 << 63))
 #define KTIME_SEC_MAX	(KTIME_MAX / NSEC_PER_SEC)
 
diff --git a/tools/testing/selftests/timers/set-timer-lat.c b/tools/testing/selftests/timers/set-timer-lat.c
index 9d8437c13929..79a6a6cba186 100644
--- a/tools/testing/selftests/timers/set-timer-lat.c
+++ b/tools/testing/selftests/timers/set-timer-lat.c
@@ -28,9 +28,11 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <pthread.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/selftests/timers/valid-adjtimex.c
index 6b7801055ad1..e4f31e678630 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -29,9 +29,12 @@
 #include <string.h>
 #include <signal.h>
 #include <unistd.h>
-#include <include/vdso/time64.h>
 #include "../kselftest.h"
 
+/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architectures*/
+#define NSEC_PER_SEC   1000000000LL
+#define USEC_PER_SEC   1000000LL
+
 #define ADJ_SETOFFSET 0x0100
 
 #include <sys/syscall.h>
-- 
2.39.5

