Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E80F9D9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655782; cv=none; b=RMO1Sxgu9eOzx1uCStPAEn8Avfo/pGXyk8q3Vn5amtQCwbvU6paQiVJkDc1cUxbKUJ57HfF+yDAGKtoIq9ndljrzOQ++s5HKjOpEZmc2X8kcbrCsyISHvfIZWkORgmFIdawjOgnuV4zTmavQh40W593TvzHbMQeQV3pcQYAN7pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655782; c=relaxed/simple;
	bh=/v6QItEjY2M41/Qa9fmYKxE5bdEX6yoFE70JLIG+fSc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mMphTO7bH/ikR0nMQqyuHlYsZE+tnIvwdALDUxThAW+jarLZ6uzvVeOtIjgvRnHl9GSeU+uoCawswuH28xno1N5et3fsOUBtSfQizGvSj0Z5iUMjZ5PPPQ1oLRLARImFDmLczhiifnImJZLXP/LCKOnTdS6+mKft58bi0nNsKcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3gQnIvW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3gQnIvW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so10566085e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751655779; x=1752260579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBZoBb5JCYLVeVGhzIarMky5rZCEpXBsa3Bvtdfk3uM=;
        b=g3gQnIvWMBf1EnLBvdcHi0cRwpfqI1vAsbuiLQ8ns/4DDZTEZTqzmIZkqUauCE3oJU
         pFprCieK5523SpJ2uWUPlRCkcT7Z0S/B75Dhf1wXxrgP4x2TW0ky9jtFfWaB9z5xo4A5
         7TYxg3MlNLKJCj3pJifZgCizUvEr59MiJmFf0NBffycl6osK8MFwBCnPiBgAqrapc4ej
         uLFTWddEi+m3G+UNBj7LjWlQQwGnJ43Xeenv1CwmrfpBclbLP/v9CLurBa+o6Az9+gbG
         mBSgV9s0nEqyK+MvOMv4Kki2fnJBCuM9Vkc1hiVquc5Ws1lidkytBYN//ndXrB/XCRpX
         8vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751655779; x=1752260579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBZoBb5JCYLVeVGhzIarMky5rZCEpXBsa3Bvtdfk3uM=;
        b=ayA77n6j0MXhWPmv6V5DsWbsqbbD9byxqbCzdOlI+mXGbMXztbHi8ieqlQR2vVag3A
         0fE2g+8b0MjnbnvmU8wMS46OzBn7010g5LKAgLL3pJh21GChzFuPWUM6H/+2MhilBfyx
         vXcPDko3sIGJddNuXYS5ME8s/LGH4Jg3rmxYNbLR35+RuxJF3UaYX3NQDCYBReSWDGSn
         Nufq4W9iMRVDJEX0mj58+4dWM2TIijijNbiuoLmloaYi4vL3BMaeaJ/41SYLEwIL/vGf
         O0n2ECs7rVvDvJnQ1yFjtThahfSBucJYLJpfIYaQFmx3BXcrTdLiUQJZBig0Lp6LsM60
         ANQg==
X-Forwarded-Encrypted: i=1; AJvYcCWV4OAk0fEAxK48UIzW2PUzd3qSbRnRm98k1jizVn5O+QS+zHuQCa2NW8d0KDBmB6hEJwDdx+9wxgZ49Bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxazBYDKn1x7SLTpPl8WAIgNIXQzilRTp97Vj1qyzcapd0ecVYf
	vy0oXYjIO7RCPEuM454stE8RQoCn7h7cgWub6CglIeQ4SFB8kvML6dlzmtHXqDbq3cM=
X-Gm-Gg: ASbGnct1266cMem76bEIBlHC1lrjswvccIWDJPF9I7NGgKBY2hVJHSE/mphvFDN0w7g
	r6XfOwOjiEakY+xzih5l5i9EHmZ9YLzSqQ4rW3M7AE4in2jFnHWlMfbf8FFUCivLuIne9yOwKMy
	kmOQNCg6/BfpUsnjuYPSaFEZTyis4tlt4GTcPeuc0E2FcXd4La59Uc88ggKa46dfur+npr1DDSm
	OEJmOL5L4oBTTvu+GhwoqsgNE2slp50+iRG8tZhj7WiskryCCoNHh20UDBQ+jl1+WeelQHbD2H5
	UZqO6okGrmXWwUQMgHHjXHxv26T+5VfrEqbJVV9dYrkrzAz+r0io+S8ruSzkDZ/qwfTQprOyJTd
	EQMa6DteTH1gQMEUvD3pLHJOryMvogu5e+UMB10BQMaZM7yrf2Tohr/s+HXtQwLOL3iwRISE=
X-Google-Smtp-Source: AGHT+IHsW1Nk92FeuphcCxSTyljJ7SWSU/rzOCynLFyorepBd+U4hYT9fjCdNkZIa26bYhCJTJh2CA==
X-Received: by 2002:a05:600c:1c21:b0:453:7b2b:ed2e with SMTP id 5b1f17b1804b1-454b4eb7e77mr32347315e9.24.1751655779121;
        Fri, 04 Jul 2025 12:02:59 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bde35dsm62220505e9.30.2025.07.04.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 12:02:57 -0700 (PDT)
From: Terry Tritton <terry.tritton@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Cc: ttritton@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Terry Tritton <terry.tritton@linaro.org>,
	Wei Gao <wegao@suse.com>
Subject: [PATCH v5] selftests/futex: Convert 32bit timespec struct to 64bit version for 32bit compatibility mode
Date: Fri,  4 Jul 2025 20:02:34 +0100
Message-Id: <20250704190234.14230-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sys_futex_wait() can not accept old_timespec32 struct, so userspace should
convert it from 32bit to 64bit before syscall to support 32bit compatible
mode.

This fix is based off [1]

Link: https://lore.kernel.org/all/20231203235117.29677-1-wegao@suse.com/ [1]

Originally-by: Wei Gao <wegao@suse.com>
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
Changes in v5:
- Fixed checkpatch errors

Changes in v4:
- Change to use __kernel_timespec as suggested by tglx

Changes in v3:
- Fix signed-off-by chain but for real this time

Changes in v2:
- Fix signed-off-by chain
 tools/testing/selftests/futex/include/futex2test.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
index ea79662405bc..ff9eebcc270c 100644
--- a/tools/testing/selftests/futex/include/futex2test.h
+++ b/tools/testing/selftests/futex/include/futex2test.h
@@ -5,6 +5,7 @@
  * Copyright 2021 Collabora Ltd.
  */
 #include <stdint.h>
+#include <linux/time_types.h>
 
 #define u64_to_ptr(x) ((void *)(uintptr_t)(x))
 
@@ -65,7 +66,12 @@ struct futex32_numa {
 static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
 			      unsigned long flags, struct timespec *timo, clockid_t clockid)
 {
-	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
+		struct __kernel_timespec ts = {
+				.tv_sec = timo->tv_sec,
+				.tv_nsec = timo->tv_nsec,
+		};
+
+		return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &ts, clockid);
 }
 
 /*
-- 
2.39.5

