Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011AC29ACE5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940633; cv=none; b=A2B4kdKC9cTBCKDPjzTg3NQzmgLMdgiCu9dpWuXZUjFljfj3z2W1xso4Np5i0TfrVld1v3DtIc095aDOBAs+wu7SxUo+LoQRwUbO16eOomdnn8jVChj0ierffDcDU9DUWGZkLGVaCv72E1IytYZji0rD1Po2YP2kB09xSEncXNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940633; c=relaxed/simple;
	bh=XtnAlGo1CMxnPO6JKVTmzRQxeB6Au4XDCuScFVWUWUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hGNbOnCaqPwJLDaZyPTLKcjXriKfSGXp5B25wra6V2QKhXk2NvtGSLUlDY40XluaRU0u43tjI5ALnHu1ahSAbFYtv3FNEUovyiCbtYWipCM/bpjX5S8gm5+2+PUzpt29wgPc0BX9RxmdiokrM0ww4boSyw/i6XpEUakgnTzykHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hBqJluA7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hBqJluA7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-232054aa4ebso46272905ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940630; x=1748545430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vACMU+uOLyj1bSQA4LVJfCqGiOCws5jCYjHnigZ5yyQ=;
        b=hBqJluA7T1hPq4nhcbGH1tMB+Flx7JrRS30F7wX7GSI4gvdRq0cELC8J2mjLeXfDPn
         sfSzcsmqfC9nW+lqU7ZM3sRRbsAZLviIN8qzhW2UpS854v+NqEIyrorzD+vGoyql13lo
         L/v4hXWiML5xuWQSDc6h4FvMygPXxG31DuFwfEN+i7MBWUkOEX7f3js4laNonnjJJCK+
         PUyG09Z0LuzQZ7Rw4GnT2chn1/FPidZCZRzgsqcKH4bvgN+cFiZhwtVZxo48lC9u2hH5
         5hVXVemJ+rVqQMubhJ08cg9uRNPWtIbHDTBC2bEqpUJUHedUTmRKkX8YQ7Z76UaS9Je6
         7/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940630; x=1748545430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vACMU+uOLyj1bSQA4LVJfCqGiOCws5jCYjHnigZ5yyQ=;
        b=HpZUT3rPsnI0a24oOVaRIF92M2tg2N8R7Mh062Hq/nwPh9GieUECzOmuGt9BkMTWO+
         Z7YNYmTgG/B8qj3t6wcZX1U+R+n69f/wdFt+3gCPMHizhoNEHX8kXMZrsUnPYGhlfxhD
         Eb0+g6n4UaKia736/Nxp0U/v161dF69z/IwF0HMD6KR41+A3Ig+Riw9rwf71/4mnuIBh
         6Z7L1q+ge68JeXgNvIIpd6yWA/zj6Tfsc1v0DKOanNzEp1RBEOQDaoVlrgvY5gHCZ6oE
         U0W8JqAT8YwRksB0JtDxe9FVjsZjA47k/dd4+h4YS9FgFJlP+XqJCUYFTMjB7jqGGyIC
         HrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXtd7Ke5LkhMYqmZyWM7q7QQtN/rqrfLBUGg4FXLvk20DzvCoonwcVSGJ2yofWhsksUX56btqIwmKLgfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyXaoYH0Q/8jR6u6JDt+gjAEoLq6pTBVCvMAKXr4bkl32pDiAr
	MT9bb0dnjKSc7ydbWS7rEp0XKxuLT0C+eRVAGMGHFbmI8hRdZ7yzFmlyZsS/TvIHbgY=
X-Gm-Gg: ASbGncsYFi3pEA82/bx9S/wh0lmnUyAlnJ2zprTR2LV+MfTMcpEwNkdtPGVIwV1cPBz
	aM26DjB827OiiIlIMM0qbN4ENJnJyUJosJgvILG/zihOqtbj/lzSuSPtOAH/bT1XBvkITTias9N
	cI5C1thOkt4ITbc65UzwbhFPlbCw7caUmyM8+Od9jg58kNUac16705TTHHWtQoWPkxO3S0Nn2Xb
	hVuPydNPUrgRpdF19qYATgdnRk0ZX2dqnsxc2lekozoD1Cwct07FCLikbMxe6xnoV7zznN4pAkc
	sm1ifkY0T47/1BzjWoM9KKWe5tcWXqmrWFfLSWnNB7sGgPeu2H8YaSpW6Ut1WitBx7ek6HYIbvI
	=
X-Google-Smtp-Source: AGHT+IE3kKHYdKAzGiVNjvDReRIr3YIXelNJnoPPmROIVHQY8jqz/Q50hb8MBVNgcI6K6CgV+C9sRg==
X-Received: by 2002:a17:902:ea0e:b0:22e:8183:1fae with SMTP id d9443c01a7336-233f25f4019mr1589425ad.41.1747940629899;
        Thu, 22 May 2025 12:03:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:39 -0700
Subject: [PATCH v3 5/9] drivers/perf: riscv: Export PMU event info function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-5-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

The event mapping function can be used in event info function to find out
the corresponding SBI PMU event encoding during the get_event_info function
as well. Refactor and export it so that it can be invoked from kvm and
internal driver.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 124 ++++++++++++++++++++++-------------------
 include/linux/perf/riscv_pmu.h |   2 +
 2 files changed, 69 insertions(+), 57 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 33d8348bf68a..f5d3db6dba18 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
 
+static int pmu_event_find_cache(u64 config);
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -411,6 +412,71 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig)
+{
+	int ret = -ENOENT;
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		if (config >= PERF_COUNT_HW_MAX)
+			return -EINVAL;
+		ret = pmu_hw_event_map[config].event_idx;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = pmu_event_find_cache(config);
+		break;
+	case PERF_TYPE_RAW:
+		/*
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v3.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
+		 * Bits 63:62 are used to distinguish between raw events
+		 * 00 - Hardware raw event
+		 * 10 - SBI firmware events
+		 * 11 - Risc-V platform specific firmware event
+		 */
+		switch (config >> 62) {
+		case 0:
+			if (sbi_v3_available) {
+			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					if (econfig)
+						*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
+			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+				if (econfig)
+					*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
+			break;
+		case 2:
+			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
+			break;
+		case 3:
+			/*
+			 * For Risc-V platform specific firmware events
+			 * Event code - 0xFFFF
+			 * Event data - raw event encoding
+			 */
+			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
+			if (econfig)
+				*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(riscv_pmu_get_event_info);
+
 /*
  * Returns the counter width of a programmable counter and number of hardware
  * counters. As we don't support heterogeneous CPUs yet, it is okay to just
@@ -576,7 +642,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int ret = -ENOENT;
 
 	/*
 	 * Ensure we are finished checking standard hardware events for
@@ -584,62 +649,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	 */
 	flush_work(&check_std_events_work);
 
-	switch (type) {
-	case PERF_TYPE_HARDWARE:
-		if (config >= PERF_COUNT_HW_MAX)
-			return -EINVAL;
-		ret = pmu_hw_event_map[event->attr.config].event_idx;
-		break;
-	case PERF_TYPE_HW_CACHE:
-		ret = pmu_event_find_cache(config);
-		break;
-	case PERF_TYPE_RAW:
-		/*
-		 * As per SBI v0.3 specification,
-		 *  -- the upper 16 bits must be unused for a hardware raw event.
-		 * As per SBI v3.0 specification,
-		 *  -- the upper 8 bits must be unused for a hardware raw event.
-		 * Bits 63:62 are used to distinguish between raw events
-		 * 00 - Hardware raw event
-		 * 10 - SBI firmware events
-		 * 11 - Risc-V platform specific firmware event
-		 */
-
-		switch (config >> 62) {
-		case 0:
-			if (sbi_v3_available) {
-			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
-				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
-					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
-					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
-				}
-			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
-				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
-				ret = RISCV_PMU_RAW_EVENT_IDX;
-			}
-			break;
-		case 2:
-			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
-			break;
-		case 3:
-			/*
-			 * For Risc-V platform specific firmware events
-			 * Event code - 0xFFFF
-			 * Event data - raw event encoding
-			 */
-			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
-			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
-			break;
-		default:
-			break;
-		}
-		break;
-	default:
-		break;
-	}
-
-	return ret;
+	return riscv_pmu_get_event_info(type, config, econfig);
 }
 
 static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 701974639ff2..4a5e3209c473 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -91,6 +91,8 @@ struct riscv_pmu *riscv_pmu_alloc(void);
 int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 #endif
 
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig);
+
 #endif /* CONFIG_RISCV_PMU */
 
 #endif /* _RISCV_PMU_H */

-- 
2.43.0

