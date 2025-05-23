Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B928228CB8
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995698; cv=none; b=c/mhnV1cG5ulKl6k8qEcvbZYtvNcBZPHYdQ2jLDr3gVBbcL+cI9dBwveR/x18kiBZsfyczgbWG2DwjI5GN0nVZF6CYHT1YAVjoGScq61fzoua6yUmPqDHOB19K3VIbkOUJ6Q9l0/GZ7m2mVLirU5SpYXSgoPWtbiazdndkK3ipo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995698; c=relaxed/simple;
	bh=c4f/odBe1fiDkTMfaR/fNuZlpsRWRZtD8/pJ3r41/Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oolJv7YwreWMrfO0OPuIBM79CJT8UNB9Q42AxyTR2JJJHaIILFyLRJlRxmlyMd0Jxc8/wwaCpLRHkCxftkFcmydWMShJlMyJTKLeAI6SGOC9slePF/cuMJSDQ4PwvAT7ZxDZTIHXVk7mLbBXfEbjqzIyLxiDcJDruAzvhOqfrAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VmV+f/gc; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VmV+f/gc"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7398d65476eso576784b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995696; x=1748600496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=VmV+f/gcr0gd6z9RdhhhLb+amoi8ErezXx+8V7P1etvRj1S24KpgaBSTn4aPElA65r
         CRy4yV/V+YrcjjT99heI6nFezomvWODF6kF0jOSZRAQbJ/YoUjkuRwOjVBtpBjQLwyiD
         QisaXaYj9MiZD0kZrqh+xbiLgu0suqamvM+VkpPJniIvcuvoTmfP0/tmOcvStDqW4QVu
         0sHkhehX5MHJ5tB0EK7gqVigdwRjJKTLYm8FaB0DE5pxU32nUhM+H3I/jbd7Q+I81cFX
         93Awhe8GafzBLg+jllYE7PkHu6KD4loc89qBEtSTr7zkms8H7iGa0zwEtJD5yIf5+v26
         8Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995696; x=1748600496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=QB86bg6yPQJH4pZ7Uk/9zJrkjO+Z9cORqKHJ5QaegGZuhjZHqB5s6DXjvlI9ix0TTI
         sqQ9tDPR6PNZFdmcOO6mxVnW0U9GI9DhiHRv/CGTP3fEL8Xg8wHvTDD7XGjV4TGTsWbE
         a5IAyfcVnGbsqboxAN4c+wwJdAnElkaoxXJLIi8k5rH7inwTeWBqrmcGwDBAXAW4zAzP
         Wm6XszukIWQ1KzBlewi2/WDl3L+g2nMdH1Rf0Wz+8C8Cbim8vO05clhbv1cRQvJTEP0g
         /sEEMYhMu4ULEHhqqQmSLTQyN3OeOh5PjTKwAyGiXCpvzW8XosCdGAxvF12nIi5s977X
         c/bg==
X-Forwarded-Encrypted: i=1; AJvYcCUoodSB9m1XSwXveshThvnRtTPLEB1JrmuJvvQMfNAMp0duW3GzYL0w4czqH+/WbvzjcU3zjhQ74FEOTLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZh1Uu1/QhuEw+eOvBf9e3oSHMLTX6rSoU116a22sG/nA2xd9
	wQ7PiPIUimDwRAbw3yJZvfxfN2oNjbdd/9TZrnjr3tmaFvqnoB7Ot46kdEvjCOtbRIc=
X-Gm-Gg: ASbGncsmUz18LR/sjjDCKKW/7GqM/WA6m9l4zn48lcjA3moELJ9oiY3244ZuKFr7v9t
	c/qYZt5rMykzxFegbLehNPE1IRXSr+37g6BfYkVCCmSnfxk0QReZBEt5+8QCUpxcJeIrE5M75yO
	psfDEk6j9aQ+EHA4qJatCEsMYkQlhTB5PMQ0tQi1Oe13EgZHAcIqFWtI13Brei78uy2vQVbKFEc
	AA0qmT4V1LNmMTXYK/Tp8zbj/cuBNTOg7AnEgoXZ/BIXB+iF2MDWCOuLVjAF0+P+eCkPwsePJaL
	que7m1tIZC9KK9iCt59CVOpD9dLT+sXXvtLVYz1BzbBPo9TM5ifT
X-Google-Smtp-Source: AGHT+IFz+/NIX8RZ4CpGdqDvwRIYbmRrE9EGaVbHiy5c0a/czfZB0pteCG9ARelWxW3OVz8OgvVZvw==
X-Received: by 2002:a05:6a00:39a2:b0:736:b400:b58f with SMTP id d2e1a72fcca58-745eccdec15mr4787201b3a.0.1747995696348;
        Fri, 23 May 2025 03:21:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Fri, 23 May 2025 12:19:22 +0200
Message-ID: <20250523101932.1594077-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
provided as a separate commit that can be left out if needed.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 818efafdc8e9..53836a9235e3 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	return 0;
 }
 
+static bool sbi_fwft_supported;
+
 struct fwft_set_req {
 	u32 feature;
 	unsigned long value;
@@ -326,7 +328,15 @@ static void cpu_sbi_fwft_set(void *arg)
  */
 int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
 {
-	return -EOPNOTSUPP;
+	struct sbiret ret;
+
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
+	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
+			feature, value, flags, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 /**
@@ -348,6 +358,9 @@ int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
 		.error = ATOMIC_INIT(0),
 	};
 
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
 	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
 		return -EINVAL;
 
@@ -679,6 +692,11 @@ void __init sbi_init(void)
 			pr_info("SBI DBCN extension detected\n");
 			sbi_debug_console_available = true;
 		}
+		if (sbi_spec_version >= sbi_mk_version(3, 0) &&
+		    sbi_probe_extension(SBI_EXT_FWFT)) {
+			pr_info("SBI FWFT extension detected\n");
+			sbi_fwft_supported = true;
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.49.0

