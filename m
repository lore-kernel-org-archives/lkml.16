Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ABC1369AA
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738407981; cv=none; b=UYSP+QN1Pva8hjR8MThmy8dfEgppJhhjcbooiQC0Mvq1DtrG/EEYZWqfPn8eKtLR8gUOrUlMDwSsAOGTXuVU9XuapRuECEt31p+3l9gzJoI8o3ICz1YZLbBdZyJkbqnaEGfYk0vD/kBKjQksXCqsxk6aQBpY6iCQqdNvl9hFbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738407981; c=relaxed/simple;
	bh=UUbhMb2i49CA72k20gW2bzqhBZg346cKmBQ3rqIc1w8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=bQ7bAnyrNRUg9dN6TdZsEXtChkPXXra2+XaD2qNkJvyz7/46gvOWH9PrVfllI7LNL9O1ovCWquZLDfCDY56S4Ebr9LrSlsOH2rVRdIwAbS0hOFqatMDJf/THREO7o2BUQQ90dWHZOQJui+unVSXp2OMlU6iPsKp5mpPSQE6ED78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BML8BNBF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BML8BNBF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21628b3fe7dso52565975ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738407977; x=1739012777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFPVMy8BgNHHVFCk4Umjo34OqaXwDDOaW1/XfTPcIuI=;
        b=BML8BNBFyS7xOX5FMlMViRG2T9h0mM3mCL8jfLWDk/hcBQKcLOsFo2NRTL0upwIVp9
         UxzjQIKlnCWGrHkCUT5O4n8IV7+4RBvcP4ncrooKw48hT+od6JpHBdK2llqINynOHMnp
         6/PO3knzJ0rv67awAUQrdRG1C4gJFITZchQjRx6vjiQJFOgOSgVoYPieR1taoI1SPK9F
         IimZ25bHrNnHB7E0xmEz8JSnkdKcYskyamFjqnHL0Z6CC+MHjuHfVec1OhtiL8EpjhWE
         /GiboaqWvoRZwozV6hnIyVpYyGh2IZKLw/IJsT5y42leoSSywfxhqj4sQRtkXq5H6me8
         h9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407977; x=1739012777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFPVMy8BgNHHVFCk4Umjo34OqaXwDDOaW1/XfTPcIuI=;
        b=kAc1zJoAJkb7Ii9u1MvEYIOFJzM667nDlIGAn9bY8mSVYcWoIGZ2cIKxRGr8JS322o
         ztTUCnPp2xZPK1EbfAaWhToqSJmND0HqfioPDyN0Kd19/zj/5tuJNTGWKYu0giuo9T0J
         Gg4Ra+okIYnkjVderBs0e1R8W+qmY6fMaJbR5LbvF8vbmmhZ42pQiiWHcPuWa1Eg9LqJ
         Ka4P9+yzfpCYVSxV/qXfSB2fxYRTe93w7QWAWhcfT+1JPNMreoCK7pR4jG/xK5dXL/zo
         zWASBJN7uXHPte/suIN3YlJJnYLNHaSDu+3kL3H/9gLoQtu3ErvIcSt5yJRZbL5w8XKQ
         UsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBW3F2RRuQAnbb1NDC8lyvq4w95HArwjMY8FEj9BXI+V87KlzE7bbSRh6UOGkF7qcyBdBs3rHpr8phe+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1HYXD53iSBSrVYwDEFP3pCWl73ZLtRJrfSaN8hYztsLZ02Z1
	ynrTKNz6sDVUyEYvP2AvNHwsmmzlg/mT3qmBo2NOq/CQGg0qrIKC2c3/+9lWYzI=
X-Gm-Gg: ASbGnctSFGJr5rAiRbRuGfrDa9/lUPU0dj3uBLzepwUMjrm2S2XtslVPGbwlMh2VbVa
	rqgRe8IKHkM+dbZscBemiBLhwA81CpfFMOhdg42ZKlsDL2cTAN9Q1gOVNpKVLYGLtIdlbqwVgnY
	1wAlUjPwtgW9Vmz9Jck1sNEQ6CXRi5YmQQVUpn20KLfcUI/9bulUCIwpHejqZhB6Vq8STFkPmMb
	W6MVnhvzVmhggOgq7TN11DcNrt0futrDZBN9r8KikimltPtMRb/PxT68Uev1qX6p29nYMGdsVOn
	cIPT+ld42dxXanqAD0gbG9QaYnn3JuVvwIERNVBS63BNolbV+w==
X-Google-Smtp-Source: AGHT+IFFncmjCRHjy9I4MaDVqunMMShucAcAwY2M9gZO0BE9KZ2l8j5Bo0vUbRC/ex69Cu5wj1kdVQ==
X-Received: by 2002:a17:902:ba97:b0:21a:7cbe:3a9a with SMTP id d9443c01a7336-21dd7c62bf4mr171522585ad.14.1738407977468;
        Sat, 01 Feb 2025 03:06:17 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f72d1sm43817065ad.78.2025.02.01.03.06.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Feb 2025 03:06:17 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: apatel@ventanamicro.com,
	atishp@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	alexghiti@rivosinc.com,
	jassisinghbrar@gmail.com,
	takakura@valinux.co.jp,
	valentina.fernandezalanis@microchip.com,
	ruanjinjie@huawei.com,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	haibo1.xu@intel.com,
	andybnac@gmail.com,
	ke.zhao@shingroup.cn,
	tglx@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: print hartid on bringup
Date: Sat,  1 Feb 2025 19:06:07 +0800
Message-Id: <20250201110607.34766-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware randomly releases cores, so CPU numbers don't linearly map
to hartids. When the system has an exception, we care more about hartids.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c     | 2 ++
 arch/riscv/kernel/smpboot.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index d58b5e751286..e650dec44817 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -48,6 +48,8 @@ EXPORT_SYMBOL_GPL(__cpuid_to_hartid_map);
 void __init smp_setup_processor_id(void)
 {
 	cpuid_to_hartid_map(0) = boot_cpu_hartid;
+
+	pr_info("Booting Linux on hartid %lu\n", boot_cpu_hartid);
 }
 
 static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index e36d20205bd7..beba0efb00b9 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -231,6 +231,10 @@ asmlinkage __visible void smp_callin(void)
 	riscv_ipi_enable();
 
 	numa_add_cpu(curr_cpuid);
+
+	pr_info("CPU%u: Booted secondary hartid %lu\n", curr_cpuid,
+		cpuid_to_hartid_map(curr_cpuid));
+
 	set_cpu_online(curr_cpuid, true);
 
 	/*
-- 
2.39.2

