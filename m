Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8B0256D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 02:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004271; cv=none; b=Ji1tHPIKQNRiQPv6oV2OY2bF4YRZ1MBpc3E3EHUArB415EoyG89PRg5//9fPaPU1q/8ltqpSBcCqZ2bseK5twj1dsWXGQWYC4/JC4QPyM/dK/ASWs2IvNr22E7OQg0xWWeqoFu6hT+FQJxbttdnlrc6OIGRIOewMlBu1evattsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004271; c=relaxed/simple;
	bh=k8xgcrym5qDtX84bQ8gtzxF7cH5SzBupbkfxITaTvZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vl/2PVpeJL4TOQC8umj/Q6p1eBC+sq7BP3Zh4Z48rwiKM9ppIYd1FuYnJBIG0E+D4qt03/l9DV8mnROI/s02c1qgSW5BXJhCdCfqiOh07cFDLmYQ2C2kM9bdEvMuzFf5fSe7dxur2l1/c/n9CobX9u78SkniClpgQM8w/+SFtU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BLo2BSJP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BLo2BSJP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c7a52e97so5326921b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 19:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749004269; x=1749609069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzx5EhyNYQwHeWkDzz8IdLJSsRXErPCykhPMATKhuXU=;
        b=BLo2BSJP0+xYQtpurYSZh5SKKU9jzGN52ZuByGD+RBLm5OCo6MCAAHtCx2Cy0BVpj6
         z6TyiOdo+G7beCAwE0qeOQXp3fxTWvN1u+ZD+ZIBRVNo1Y/uaz8bsEqqYyIB7qLCusz1
         mWodwYn7AX1b+a0FG/nmDELXj88/YaE2jPxuiHVRdQBHOXqEEReAMUmHsrBfWKgRmTD2
         LzbnvJZOdpo1faC6cmoshNIJHROt09nY8zGRPT7Hla/oFtTcSapztlVdL/gxoACLK9py
         7BPXcVBNe7m23pQUT2UOyVqSFWk307cOM4PrqAQk/XHvasSObZ+8zrrOxERMZXU98lWb
         r3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749004269; x=1749609069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nzx5EhyNYQwHeWkDzz8IdLJSsRXErPCykhPMATKhuXU=;
        b=vj2vWEDlWmUOGy+zxAABLtd6xG50FczKmN9JyxUV/vYzunuAB+TE6KISGiqp7PWJxu
         L0u3Wq07p46KmelMdUpTQ1HavEgn3J6rAf0mltVajgGUlT9YLSTeQbA3ydTSskmSBqx6
         /73S4HOQU4ikJiOFClbxrQ6d7wCfR4u6I4vj1kS0WPSuxTk4bS1Q01KLPqhxvK01WXSo
         e1Rj0pMYornrBokD4GxWz4BvTu+gfTOo1ouQLUffXupe21un/WK/rgIsfR3s1a0IeMkB
         NDTR6QAFBQlGfRg9TcoJsDpHP+QlND3mpnjPIDKxRp2PtbbfShPJa7XiIpFNEztxbZf/
         r3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUFt+3suhGkTNdNDVtzYx4hVsrnlDtdWYXElCn1VyY/41pG//JZuVRyG26LwRR5PuqSa8i7i6zL6b7oU5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxABlKsyYgNZGHHdeAseih7PeVFdOT09VHYa/ZOB2HLYOwQnuqM
	UDVIoTpirAi3xuPQxLA65ta54d2GAiYZCq+p95BvAH4gMDF5QlLS5bb9ZgqoK4z06zc=
X-Gm-Gg: ASbGncug1nA+zC4IRR+SWtYdOPX53DOlt4pzk7zUyeVMGMMw8QWcugfSfgJJNRjf7XD
	qftaaLLd3PtFcOi1N+vgnXVupBeyayuF1J7Rc6fbUItYIwmIeOhGWvlkjvZ19qsQ/nR5XFUXtnu
	QWNPvR9TL+SV+xEQVz3quGOR6u4FTCkmzwwQCBz6wDYaydOHUWx3VgJfLn4UoEI18TSHzXY2KQp
	hwBHMZDZWVul266LZosmsOBZPVvz2MCGZWM7kea9HtYW6sBI577Qny6EPG8O7ySPgQZ4wH1OqYz
	5Dg2TLVNHnSJbWSFcdwIkudbqLz45PkI8GNXYfnIzV9LPvevWiPayQwGo34Qy9FLe8cwa9MoMlv
	6yx1Vdx6LmQ==
X-Google-Smtp-Source: AGHT+IFOKXiUkg7DlGRUfdahAUAzm5CSAm5gLh6cesXxENqVYTXs/ggCdQWKGgbEMqM7qu6iI5d4xw==
X-Received: by 2002:a05:6a20:1594:b0:1f5:7873:304f with SMTP id adf61e73a8af0-21d22bb720fmr1601124637.37.1749004268701;
        Tue, 03 Jun 2025 19:31:08 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb0a1eesm6739256a12.14.2025.06.03.19.31.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Jun 2025 19:31:08 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	Pierre.Gondois@arm.com,
	viresh.kumar@linaro.org,
	sudeep.holla@arm.com,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] ACPI: CPPC: Fix panic caused by NULL pointer dereference
Date: Wed,  4 Jun 2025 10:30:36 +0800
Message-Id: <20250604023036.99553-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With nosmp in cmdline, other CPUs are not brought up, leaving
their cpc_desc_ptr NULL. CPU0's iteration via for_each_possible_cpu()
dereferences these NULL pointers, causing panic.

Panic backtrace:

[    0.401123] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b8
...
[    0.403255] [<ffffffff809a5818>] cppc_allow_fast_switch+0x6a/0xd4
...
Kernel panic - not syncing: Attempted to kill init!

Fixes: 3cc30dd00a58 ("cpufreq: CPPC: Enable fast_switch")
Reported-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/acpi/cppc_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index a9ae2fd628630..6b649031808f8 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -476,7 +476,7 @@ bool cppc_allow_fast_switch(void)
 	struct cpc_desc *cpc_ptr;
 	int cpu;
 
-	for_each_possible_cpu(cpu) {
+	for_each_present_cpu(cpu) {
 		cpc_ptr = per_cpu(cpc_desc_ptr, cpu);
 		desired_reg = &cpc_ptr->cpc_regs[DESIRED_PERF];
 		if (!CPC_IN_SYSTEM_MEMORY(desired_reg) &&
-- 
2.39.5

