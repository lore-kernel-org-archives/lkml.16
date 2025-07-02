Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4330E254B1B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451737; cv=none; b=CPzgrSzp4WDse7mZelUEAmBpcLZLI1Nh0gvA/066Rr3ZdCstI3NpfkVQMaejmLAodj4hT7AOWwCnjpM2uZ0EXjLrtWuvTP3GWEYPPixKwjy3Uu6ZrHNDJSrEGd/zkrVEWL812ps8JL4LXftcLC3ok7f+aVRo9hgFyaydZdUxvzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451737; c=relaxed/simple;
	bh=mkRBaO6sFEsyEwMWNKBmYyY+/tTAEW4N56/rVgdTsGE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I+jsxnsdsv1luI+1v/ZGlSIaidhYfouIo9YRtU9khWgd/YSk3+8roCT8sqj/a1sg9TXwFivmYulBKjoeCvHT7Hxx85XXtPUYCZfPXO19ksXC+PkGdIrZQxd0+07lfvMYKf3T2xZrxvWF2YgqDQmELTLwGmpI7Kb599cCs2leLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYtr3UPI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYtr3UPI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so33474545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751451733; x=1752056533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3z7HDKWq14/Rf/7W5PSUqbSzAkGXyN4UWZk2FxpZbs=;
        b=fYtr3UPIysdb4iPSOot3HEGJ2msMf3WvGgojHrnMVa8MO6lcwZQTYrFHxNsi7Wovqf
         zRfQLAjE3R1ChKz0bdWwFrNjE3OYhZGfhUyOzfXmVW1pXJNmgiqVSwitxEvZElaPVnuo
         4i5hSkCQOOnBiPGUH8BtQ8bhGsuDuuhLtSBJVliXXLjCcIampBwuNlpDpgg240yvMA/a
         /TpuVZxey43c85KusVvqWt3yUlW482yMDaiF94VX1rkCWbKrwsLB52WWlzgzfotWpayO
         LnD6bMcS/71APzEFGrzQdH0D4L8gL2f2MBIXPGfMPF5am9vfUZmuML5NL1RZ36+yMz3r
         a2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451733; x=1752056533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3z7HDKWq14/Rf/7W5PSUqbSzAkGXyN4UWZk2FxpZbs=;
        b=DxTGaCZ6q1mKR8gab/ExloT8LoNp4IcpKB8KVKWEajMB+bnt8t7ijMfTREkwycAALL
         da97Ysf4yK82Z+gqgoI6u4/njbPg7SOtEBFeEg3O1qHIZcw7n0oPp9ThCaLuK6DFt7pF
         i0eqK4+jjhSuUJj05n8rx0KBpCL71MuABg5vCz3DPaKL9URw616HtvsZHg7d1RH4KuQe
         n42+65YUoGCyi53i9PoFQ2LzAU8tUMW0qtrgwnl602pzH45YDQel1c3GWwoP9dQPt3IK
         DM5h5xYS/9IyKdU7u7+d4kRbhA0atEYzJe60arHO8zkahIS3Pvj27F1yr8P9MSBu2Qjx
         DdEg==
X-Forwarded-Encrypted: i=1; AJvYcCW64lhw2OyZuLQ3nCvgESSEJfctW8pm1C/QroJH48KPvT5pd9Ni8jNex/5CteSPX53eJXQdWoQVr3mbQo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkn/7obAtD4yurEFvOJhTR7a1PK42KfroS1fRNk4BBvV37vqx
	Y9ooD+fW183dJ0l+SuBm7K2Qn6OquPEx01tYgenVzfOwIybdZrZjsWIPUtyGOzWaJws=
X-Gm-Gg: ASbGncvjlAsP83xYg+V6AEiy1jqdeBD1rYqrvkWN2BAqm98NxBIaRE++EyZGqLCnk4l
	oD81GBJBV6BWsN+ak7v2ev9g6wCxZ6swg4N7EJzPGPNSDddrxQdIiDsb/8xzkzFfY7jBLekBfSf
	aLMlQa9XyT1VoupeHJUlQqD2udHPbstdyvw2umjvqLonreiUbPL6I+89sG8YJV5G6oqe08jBDJT
	TpC+Kvb88Hl2RCPtFjPnhTyV+/Z3sNFUJ/JPy7oX3lkNn4xNkpmils9wX7zrrclf7uabjam5h0k
	wPQBfC7S1odf6/nV2xmNXAMZyZ7J4SNm1QVrNyNB9Dg2HlMLc/SaoKve1WxOCLLg5AhVLYW78ja
	+SLvAUid8LUWUMH8GJZSg/umlD0Haj4JmcPuj9kBtzZZsu5UMs9pghJZfRqBJPqRC60ye9+g=
X-Google-Smtp-Source: AGHT+IHtRMzhbL6QsN9H974H+fxsiNS5bFCmumvbhYvPgTdjTPW4usMEO3Wmz4ct4XCnUJJtbPwGYg==
X-Received: by 2002:a05:6000:18ad:b0:3a5:783f:528a with SMTP id ffacd0b85a97d-3b201aacd01mr1888649f8f.59.1751451733312;
        Wed, 02 Jul 2025 03:22:13 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5972bsm15840504f8f.68.2025.07.02.03.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:22:12 -0700 (PDT)
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
Subject: [PATCH v3] selftests/futex: Convert 32bit timespec struct to 64bit version for 32bit compatibility mode
Date: Wed,  2 Jul 2025 11:21:57 +0100
Message-Id: <20250702102157.5222-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Futex_waitv can not accept old_timespec32 struct, so userspace should
convert it from 32bit to 64bit before syscall in 32bit compatible mode.

This fix is based off [1]

Link: https://lore.kernel.org/all/20231203235117.29677-1-wegao@suse.com/ [1]

Originally-by: Wei Gao <wegao@suse.com>
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
Changes in v3:
- Fix signed-off-by chain but for real this time

Changes in v2:
- Fix signed-off-by chain

 .../testing/selftests/futex/include/futex2test.h  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
index ea79662405bc..6780e51eb2d6 100644
--- a/tools/testing/selftests/futex/include/futex2test.h
+++ b/tools/testing/selftests/futex/include/futex2test.h
@@ -55,6 +55,13 @@ struct futex32_numa {
 	futex_t numa;
 };
 
+#if !defined(__LP64__)
+struct timespec64 {
+	int64_t tv_sec;
+	int64_t tv_nsec;
+};
+#endif
+
 /**
  * futex_waitv - Wait at multiple futexes, wake on any
  * @waiters:    Array of waiters
@@ -65,7 +72,15 @@ struct futex32_numa {
 static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
 			      unsigned long flags, struct timespec *timo, clockid_t clockid)
 {
+#if !defined(__LP64__)
+	struct timespec64 timo64 = {0};
+
+	timo64.tv_sec = timo->tv_sec;
+	timo64.tv_nsec = timo->tv_nsec;
+	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &timo64, clockid);
+#else
 	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
+#endif
 }
 
 /*
-- 
2.39.5

