Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3863570805
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625372; cv=none; b=DPtglSnkSrt6NLCtZ0+hKg9nA9FQgNVNvDO7cqPjFkfeEXKq664kn0TevoAIyoFmeHQMHUt3fwwiLJF0OVIwzgLGb5hz4vJHCW1sNbTL9F36nJCo9j/h+VOdls7TU8og57mbF7IsJpfJhRY8jcmQVYu3nyynT6zohoI4sTvtF6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625372; c=relaxed/simple;
	bh=EnclmXkL768RUK6FtMDP3RouWSylSMfpyZ2BrslR6ro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DSW5ELJkooZYCtCcyOTk0wM4OI/Ecv9r5oVA2s9DMmpK6IGiCeNWrhDF6U+deDHsC/ABfrfV+tVImeUSTD48Pd7yZEXwnDFaB1bl80nbp+lqYSmTBEfBtt4INncrpNGTh/akWiauHYn2G3VhXZHVo2o+HotXikfAs3fYznchu8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6DbDp1Z; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6DbDp1Z"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so472578f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751625368; x=1752230168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvqIU51AijbgIqnlAisdCOd3NWaWWsYi/xrBZ7oaVpc=;
        b=h6DbDp1ZZw1LiQZQ/cOJb3c05ApKB71VkZpcyGeAAPfdTkA/ZVDNIvMDB1nxGfSZY7
         h8XKEXfamrkJkM23UlSWv4K7dnERFjK7UNGyC9HGpwjQJrUM9GO9gpMYDfAnpfiKostr
         WcZtPtZaJ1srkqI/rqDjzORAmj912hglvdw2h8GtoJnFZwu1hz9yB/ZqRU/jGR/vgZcl
         TWdKTxLDbods3Fb7jheqsv3ftJAL499GMMPKAWuvD4ZKbbttbeZHslJkxhevm5jklSbf
         Scq/QFXfz5PlrRTGlUVdayKaJELrVCjPWHi6J9xsMUJDzZdauhqhAq76LjQUUd5QOcVO
         wg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625368; x=1752230168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvqIU51AijbgIqnlAisdCOd3NWaWWsYi/xrBZ7oaVpc=;
        b=g2piJZesrGPtVeeZClcF28asa5OyJbyjqzaBmsIwNe2TH/NEOURU1WsHeCJJxURDQn
         iIINLRQVFlBLHL2koNZrEBqbIX1PCE6PRJZ9rHog+R3oyMhzIelgTlUCQtNmRco0AFSN
         ZfraqBDVxxzplXM6aQfJBelmFSv9LfdkRHOXFGbJJ/i49OnNB74uBDcdn6JqJSw4snFJ
         vuPKOoBDTQCMF/9UAF8AACtk0E/3DUKhmzHZ6AfRlNZAsIZ2mW7EzhVxSIYnt2mZLf8w
         bl22VzP6nYuo5uvS5yE5FvXqUD/SUr7M8vO8oL+KMejCJHcsklirMz8vkvtXC3+wBeFT
         YMsg==
X-Forwarded-Encrypted: i=1; AJvYcCWzMguLGpcG6NP4DV6X1IwuDU0FdBL3t0Ss8hjzxmA0kXoyixYEYHwZDb1C3fln9tk+BCG02Lfi2aa8nEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6s9IPeXezD6vLq2ZW8Y62hZzx92VPNdc5eb6cY4CGYzYv4oQ8
	278+L4i1wxSbRMOn12NHHnPppL7zsc3ktezAaPSjlKyMsAdJA+bzC+8q6ZuxTK6ffeA=
X-Gm-Gg: ASbGncujJ3zyNWOQJ/ws8LYwMKSN4XqZbsrGCYiwt0MFW8Xe6l1BbKhSCofp//6Ef/R
	JKDezHOsfUL4gdG4wRTjxvd5WtEvFCEZORMleN3fGQWsDSqoPgYPuHBCjalOxujpNpelmdpOcdm
	sn0qCLcGsty6nFl5auliAnV8F03imkhEwmQvzSqnJG1re03Rb4GOMccFL6FDJ47btghwIigd/25
	4HM8ufZtfq5i34ajD4Sw7lP7keV3M/KuHa5rdw5QdNBR6krpvWoE0+XhVycYF2LHDWvBXWDiiOX
	LLWw9plRNIhj4slRagRGs0N4i3CGnZfxPzLgEjZWp+BOBX+LEoRvKA7dtefGt/o/LDXd4rljBjB
	sFBfvdxEPK1cDMP+kvxoIgbE2+OZxgoIpjY5momRRVMIirLRaf/ZxNmmobnQxGr5fvUaDg1I=
X-Google-Smtp-Source: AGHT+IHqfnStUll8QsR7mUsfnCLVHXTMrhweBdMDH1RvSFMNP1qReYTg59lxizhSyMSXkL25MsJ0UA==
X-Received: by 2002:a05:6000:4a04:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3b4964c5d3emr1434996f8f.23.1751625368383;
        Fri, 04 Jul 2025 03:36:08 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d099esm2131581f8f.21.2025.07.04.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 03:36:07 -0700 (PDT)
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
Subject: [PATCH v4] selftests/futex: Convert 32bit timespec struct to 64bit version for 32bit compatibility mode
Date: Fri,  4 Jul 2025 11:35:21 +0100
Message-Id: <20250704103521.10124-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sys_futex_wait() can not accept old_timespec32 struct, so userspace should
convert it from 32bit to 64bit before syscall to support 32bit compatible mode.

This fix is based off [1]

Link: https://lore.kernel.org/all/20231203235117.29677-1-wegao@suse.com/ [1]

Originally-by: Wei Gao <wegao@suse.com>
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
Changes in v4:
- Change to use __kernel_timespec as suggested by tglx

Changes in v3:
- Fix signed-off-by chain but for real this time

Changes in v2:
- Fix signed-off-by chain

 tools/testing/selftests/futex/include/futex2test.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
index ea79662405bc..af5b92ba04ad 100644
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
+        struct __kernel_timespec ts = { 
+                .tv_sec = timo->tv_sec, 
+                .tv_nsec = timo->tv_nsec, 
+        }; 
+ 
+        return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &ts, clockid);
 }
 
 /*
-- 
2.39.5

