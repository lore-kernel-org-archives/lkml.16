Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F21A0B0E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379837; cv=none; b=C7AoZ+Re12Rw5iaLtVM0ebDjyGvQT67kphXIPuCchQYQmbfkFCFynL0d5DTQWYic25Ys2U84+LwOkui/TpNa5TRZ3lzZegFsedrMOOJTScFulK/xHYIadSH0e0dW91RMj2YddbkXB41/rg1RRmgxeycTug7giOVfpJnkaO+LH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379837; c=relaxed/simple;
	bh=+VE4TCzGJURgbHPgDIzyyLaVIBkWuI3nGjmFanUKRSY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gZACpMIcoma/yOS5tvIvyL9l1reDAhkgTtpx1zJbuvmsCUwOr8FwpuAbL2kr2etryVOYvrYJFJdufFH87Wt7BQalJv0eqd4vn8mYQeWWHbZMN9/1MY5c94e9MtrKTZ77e5LOHOolk+6H3Qn/fFz0lGy6WEdcF86zYKQIGMa0nBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ViIFP6P7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ViIFP6P7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cfb79177so34300205e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379834; x=1751984634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=toLt0hf1fAXobiMf5wHPfZnxScTMui7YVm7oyxfvX3I=;
        b=ViIFP6P7m88NBC0xuj1n6ahbaZBfcPHu9Zz5VL9GAmMcAxB3YIed8OqYu285/xG8hR
         9iYYBQr6KRsTVkjHe6gTMb2wwoHTdSbVlc9HWycsfXYc62lhqYWUTxCOqkHm/sL6OnZu
         jNNekPQ1Nwr3ZIqqxdV+Mkd7mlskBtW5KxfPmvscbJxeWwQ3UcWmtgoVb1Upj6yX09wO
         a5nh7+B7sIfqsNWNTyFXMu5a5tarKY2SkXYGcbtTD5Ox3D4eELWzDKAHqYXBGnKoZY74
         vC7OlgShbhskIbCun1Kz7/wDyJ/JI8k621IESa0Tb7qR3x/jqrU7XvLFrM6eDIdZ6gIP
         +Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379834; x=1751984634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toLt0hf1fAXobiMf5wHPfZnxScTMui7YVm7oyxfvX3I=;
        b=BhpVan07DZyqhBLxEs9IAFojN0WE43decBMm172TZ596X1/ngYWm17rFh9g5Dw5SDW
         08fyUjZeQwRwQujh6Y3gXtPL9IZGYyHcZQrWIu87kN2fW9TpAj0vAD+wmbt1iz7xpFvN
         daVP//VHfKyQ9/ae0BGvSPieJlKwPBU7ggOKwcGDN8Qv2T9nCc5N78Y+YirU0NyFBz+P
         M5Gjupcxgj0KyPCHwRQwj42k+62mvCjCLLQ0Lo3gwwpRSS2+ODhqPi3qyG3DqDyj80C4
         PK1mzlsQXbeGclcKs2K4oMb23/aPSAPE5onhGjflSDVK2bqhEKSAxa9VFnxK4K1AMBYr
         l+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVB929vk6FZBl28gMZjNI9PRdcLG4dsLC66qYoALf/L+woNwy2aCypbFtewo4qGY8hnwMr7Leis7PsyCzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPl8CeqOeNRVj86o144i6vsqQESwkKJxVHGIPg4npWbR0/XI9
	I+7i4f8fSJc0gQUvqDz95aeJOqw2JWx1F0Q51vc6iT/xUibGdy9RsP0Qlj7doTHu4vwjsE6/rtL
	HWudA24c=
X-Gm-Gg: ASbGncvEkuaUvO9i72418QdkIvPJ91zQShtTo6Kf354Xjl5/e/29VEIIC6lJZZZXx9n
	Zk3ePVKgoG507E64wTxKnyQ61wQeyVy1/vXcbNC2aBOTAYsBKtUQX0bwFF8mgHXAP0oXWsHYFfo
	zZrSYKevIdRSqueSIBwTQXi8QCBBS3SPL7gGjw+RL/UlK/4+KHh24Sc9PdEHjHMTWlfsMk0cfMD
	TWwHbRdEmuWzpjUde2WABtkLVH7NLrlwEqlhmuKmomtXyy4PjjfJBBinEw556aWJEeGhnKC6pku
	i1k3S82Yjzm/vRrILTULyaSMdKc3Wa6eh90qzikz4gtDiW9Pe6eA9aMENYnCc3Oo+/5YpD3Vibv
	HBr//1aWfoXhvfmEMkmUKN7tg1Y/wtyo292xPC1yFCGuQW7FaStQ0pWuGyI+VC1Bc0B+ZDFvqbG
	iHarGZZQ==
X-Google-Smtp-Source: AGHT+IGTLLbODxjuif7KWW06klmOqjZTL5I9Y50BzMnkjWGM8tznX7/PwBgougIazzrFxhs0+pT6Dw==
X-Received: by 2002:a05:600c:8505:b0:441:b3f0:e5f6 with SMTP id 5b1f17b1804b1-4538ee62345mr143258795e9.25.1751379833739;
        Tue, 01 Jul 2025 07:23:53 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe0efsm165504815e9.24.2025.07.01.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:23:53 -0700 (PDT)
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
Subject: [PATCH v2] selftests/futex: Convert 32bit timespec struct to 64bit version for 32bit compatibility mode
Date: Tue,  1 Jul 2025 15:23:13 +0100
Message-Id: <20250701142313.9880-1-terry.tritton@linaro.org>
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

Signed-off-by: Wei Gao <wegao@suse.com>
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
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

