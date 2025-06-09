Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0DA257429
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474721; cv=none; b=nj91A3qEgUuMyVaQgndIkpguMfVC182lfErj7zGeUtyLKIw3d+mwvDTEHrMMPwwiQ1dg8Cn4nvQ2ttpv2uawYS0qofBnY5uDbT61JL+/fWqNYLHCBQ6f5joK5CsYXR0/c4ucO6h670FlmUjuvWrfvs5dubdaeevUfChJz3M2DT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474721; c=relaxed/simple;
	bh=HemcbqMmgRHK16eJTLxADLZuI4x27GbGQS2CfbnVQpU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sw+lo3sbUSsJVM5cuQb5RV6fwHuxH1VZgUQVzATgmvKdkJ3ankjgo3rQfAJP5i5i8TEhCDb80aKHJJhJ6UPqpiXim64DRavjZRyT7Efj3LIYOZK38wjvjDX09W3ZrPtPOjUC0XUPbEFCYqhjbC5bwpc/3ymzv69F6gfyeyy411I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bypAm1PR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bypAm1PR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1536189f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749474718; x=1750079518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YIDEZTcLMIX8NSBMninMC+pCHmUrBf8fr/oqws99Skw=;
        b=bypAm1PR8FOT4zciR0lACcksq/CnauXGx7j/7SNtaz5r+AL6xTPM7rVR9Vz1Z4cEno
         rDUvkBetVPMPKGuefIYt3zc7ukv12HkaGLpd660hiPAutAczrTutUuOVZLPyATe92cw1
         Cmu+kiDhCBpmAs7cEe4egaos3gTmmboNAPOy5uEgHR2SjVLcntYYrmZhE5gY6Erm1A5s
         CSNWZaAznW3dVSB8Npj1bdcpDc/FQ9dX418veI7twjlnWSVMbFS9Ibi1UxTYaE5NaCyq
         TeUJQolUv2UTOeqb4pWRokVSEJkgNraLKG1k77ewJe2ol653O2+QNufpMViAKRNzFUvv
         UvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474718; x=1750079518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIDEZTcLMIX8NSBMninMC+pCHmUrBf8fr/oqws99Skw=;
        b=xM0wv2IvrCID82VpWnrSBHCP4P2QTVMU9PtHXOh4MIX8CSp1fc8u4jU19pwLIGIuoA
         9lN6ApZYxnNe5pEPe7vVIISNU2fJeQSAF/JOpCAvmZ6izqdjXJuIQrc0XEXjCFQggv6v
         6AnYtGpl7lDoZDloiAvtTOu75HZNwzV6A4VzeqqcVYWTPYImUvxOrQgL+PcQvFm++VwI
         H8noA501n45mKKaDhoVcva5K7OpuOx1DyAtOv6z/8fesMSi7ss5PLov4UDEzktyJ3a0p
         Ohf2ESKaHedWm0tanlzu4y0sgWRqaBit1GIommoqn1Xev0/WythUtMVk9IJP/ZBjtptI
         FOlw==
X-Forwarded-Encrypted: i=1; AJvYcCVlubq5eQq8vQ1KpEBtx0pNVNgo10SROiTTv8xrVpeyIUNw88Ci/9nDd0jC37OWqAS7mXKTx12AsO7X5w4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuLIjXGOZt8WiyxuvAkLzBo3nNYPHcwxeZ2aYEw6M+Q1Y+WUvc
	YAOYdRm9T8OwcxiuodtRKxiTeeY22gpmhN0scGnmSHQV6/82Xn3rnhVQYfnbuNtSHas=
X-Gm-Gg: ASbGncvLeJz8JBz5lY3+ZzTzO++GqEag9ygK7MY3vlY+P8JBrwUjFK8uMFfcRu5syzE
	58SqphsK7IHX8S/p25gB6FWbsnMKjJSQ3EfKkVafgaNyTLPe592aj2Z0LTjky3azHntK0rOooe/
	x06JUM3VlHtYxgqUJ5mtRJc4Tvf7YmzSoaq6Z+qyL4+C7dkGoPU05piv1PqexJen8vRzbHK2oG1
	eVHAxjQJMPkPt4lwzv5L00mYsB8UyLNro9Ph2T6eiIe8UwMcc/TYjjD8MeYejxXsAHpuKSSlEqm
	ftfKkhXzXHZSsrY9CnhMJz2Rt+vVVS6D/Q+f90s79fzfofgnl6QjyBq4bH9/rEkKOKasmeicOo9
	kgiwizXZsJgmwJdVu45Z9LFQdW8B3XZsH41odtC9Jb6bV9vGTRdyEWwL3oWYm
X-Google-Smtp-Source: AGHT+IGcP9WDP2sOnDqdsr1hUuGAfaqNH9xtyLz55f2uKfpJWh0O5VielrBpshkl/5AnNTfQlngdEg==
X-Received: by 2002:a05:6000:2dc9:b0:3a4:da87:3a73 with SMTP id ffacd0b85a97d-3a531ce16b6mr9212551f8f.42.1749474718219;
        Mon, 09 Jun 2025 06:11:58 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323c0819sm9396058f8f.45.2025.06.09.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:11:57 -0700 (PDT)
From: Terry Tritton <terry.tritton@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Wei Gao <wegao@suse.com>
Cc: ttritton@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH] selftests/futex: Convert 32bit timespec struct to 64bit version for 32bit compatibility mode
Date: Mon,  9 Jun 2025 14:10:55 +0100
Message-Id: <20250609131055.84547-1-terry.tritton@linaro.org>
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

Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
Signed-off-by: Wei Gao <wegao@suse.com>
---

The original patch is for an identically named file and function in ltp
and we need the same fix in kselftest. The patch is near identical with
only a slight change to `syscall` instead of `tst_syscall`.

Is the way I have tagged this appropriate?


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

