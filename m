Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9B2459FC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892668; cv=none; b=Ex+TJFPdio/0B0pjBi88jixw/ne5TgdyDsnszfRCXwSRlp40kD6jh8PW6jsOcDhqAaqDOF5xoLMm8RDzijCJkFLT6j5pSUquRLwqSFIX3414fzuZ9lUTVjdTbl53T0O7KSR44SsRtuYA2Vd3xnFSaz8Up1nmw+Ntb5AJk9Lb8n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892668; c=relaxed/simple;
	bh=rwRlud77zZk3mXpiZR5trvliX9LoFQHKA4NpcmZaFMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lOzTFtxwD/+Lyb+9Tb4FhD9Rt3RVx4Z9n2he6pnWkShadoSMIh1O/rRm+PJIXJge1xsZM3YD0Dy2LJXsg32aqdhYhLYz/9gEJQ1o/STJuN57OtvU+DsBalTiTJEfVpcbrx9iYUa38cR/hMCVeiKxtEvp7kbt/uP87FWbCnbrVts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Dr96eSTY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Dr96eSTY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22928d629faso7144775ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892666; x=1745497466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNrGkE8UCKSxhi8ZHI6AhhtBeoQ1iixkNI02GQVKF+0=;
        b=Dr96eSTY1vKUBiIiutyEoOwj2O1wLk8Lsa9lxrkkUcA4XXzdec7bawfqQLhecKi5+8
         aGevVBPIhUHEk2yOjKLrz/wcvuFfVRw04oAOVDp1Y8Warde+0TlTgfRG2rJr38hP3rT8
         Ba3ia3b6c1JWH2b2+R1KGCiaGVcefE1eNpCJRsqWuGvveEO9pq+YvmjpXfYL0gVayb5X
         lgl+s/3TaWVR/sk82J/Lfp8m6UrA7wq3j2yib0wCMq383OzsKdttR+PayrpIhtgliB2H
         VD2pv4UzkecJzTjGyHwdUQPYcbLmN/q/S1YAOO1QOaWyUVkhgmcC1GA0CB7pbfV6eq9n
         d91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892666; x=1745497466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNrGkE8UCKSxhi8ZHI6AhhtBeoQ1iixkNI02GQVKF+0=;
        b=STxU5W/e9GiuZCurW9swnJ/lcljL0MWb3+lHwGDNPBrUuMu9C4kBmHCgsgVlTL/IwC
         /bTObORwVge0x7VbZK8wtuCxINugVpZTjnKxqATmWPp1I1rLfBF610q2KeX1yDg/2G+h
         Q3AO9JdbvA5/9IN3Pa9lHNE8m975sfmfQN13FnHn+yEy2BIzsHScFp0yFb8HYlwF5TRU
         8voPCxh0XygwSVVVhwRSXS39kHbxeaIBvNEYa4Qrs/E11IiWZV3GAiqLzAYmhTGdvik+
         0xdXiMJSsLTID8uOarz/6x7froDxC5QqL7AUPr++qnc+vxIbHKKmUjA+b3WRS1EWuQY1
         dIKw==
X-Forwarded-Encrypted: i=1; AJvYcCU9GBzwUORaguT8u7Ky6T4RkBZAUpZ3AX9qOHR7QIlUZ/gxLSzfjWKjnEQI5zH8DNQfXySgF9GALyRIkWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+mIgGnlImieUo7hAD9FpFsgJjoNSb/nE8hlcwsrr7npT5e9H
	ZGJBW5sIEPKl9tDRymO5oY3JcqfdLxzxrod7Twcj3Ec0EKU7RwhMV/MOPUE7wjI=
X-Gm-Gg: ASbGnctpOpp7LlNlR4pb4U1QmzK7aJoh1heU7pAGAj/Ynaswh3J73DsqCdc3g2YHOLb
	qx9OoLMs7/zXjKVkBKQqPZpSVHg23zKbM/YGbbFjWYHdej25e4JXlHyFlZjrsOGwShX9Mtfh8vU
	eIFvQiC3+EKcJcyCawAZRDt1jjuyEbDRPZ6g/XUBKnIRXUaNOhkUZfzctR//pXxlEVi+tvBF0rx
	1YSKT6eEQCeKsdWgGJPe4cJdg81JlteS9cv/w5VV6TYcG0tTDPQmMJGL8Mpbcnnw6oJwbVAdOrf
	jJ+WpqxGGKy48W/hSz0I0Qcc/TskGwnj2/webQ/DKw==
X-Google-Smtp-Source: AGHT+IET2FSN43B29b1iFIUfRnJqfxIL6IKEzFKmLMBZtkj51fE5xgUwJd+gTUEP7A/af82ElzoqFg==
X-Received: by 2002:a17:903:1cb:b0:224:721:ed9 with SMTP id d9443c01a7336-22c35981e16mr85524135ad.44.1744892666322;
        Thu, 17 Apr 2025 05:24:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:25 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Date: Thu, 17 Apr 2025 14:19:50 +0200
Message-ID: <20250417122337.547969-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This SBI extensions enables supervisor mode to control feature that are
under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
DTE, etc). Add an interface to set local features for a specific cpu
mask as well as for the online cpu mask.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 17 +++++++++++
 arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 7ec249fea880..c8eab315c80e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
 				unsigned long asid);
 long sbi_probe_extension(int ext);
 
+int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
+int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
+			       unsigned long value, unsigned long flags);
+/**
+ * sbi_fwft_local_set() - Set a feature on all online cpus
+ * @feature: The feature to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
+				     unsigned long flags)
+{
+	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, flags);
+}
+
 /* Check if current SBI specification version is 0.1 or not */
 static inline int sbi_spec_is_0_1(void)
 {
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1989b8cade1b..379981c2bb21 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -299,6 +299,63 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	return 0;
 }
 
+/**
+ * sbi_fwft_set() - Set a feature on the local hart
+ * @feature: The feature ID to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
+{
+	return -EOPNOTSUPP;
+}
+
+struct fwft_set_req {
+	u32 feature;
+	unsigned long value;
+	unsigned long flags;
+	atomic_t error;
+};
+
+static void cpu_sbi_fwft_set(void *arg)
+{
+	struct fwft_set_req *req = arg;
+	int ret;
+
+	ret = sbi_fwft_set(req->feature, req->value, req->flags);
+	if (ret)
+		atomic_set(&req->error, ret);
+}
+
+/**
+ * sbi_fwft_local_set_cpumask() - Set a feature for the specified cpumask
+ * @mask: CPU mask of cpus that need the feature to be set
+ * @feature: The feature ID to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
+			       unsigned long value, unsigned long flags)
+{
+	struct fwft_set_req req = {
+		.feature = feature,
+		.value = value,
+		.flags = flags,
+		.error = ATOMIC_INIT(0),
+	};
+
+	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
+		return -EINVAL;
+
+	on_each_cpu_mask(mask, cpu_sbi_fwft_set, &req, 1);
+
+	return atomic_read(&req.error);
+}
+
 /**
  * sbi_set_timer() - Program the timer for next timer event.
  * @stime_value: The value after which next timer event should fire.
-- 
2.49.0

