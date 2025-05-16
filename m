Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BE7323D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409059; cv=none; b=n2KsrkzuH3Wy57UEDTg42X9A/SmP0KWlz5tSxYqM2rgA8/I5P1bPBC1o04cNQfhkbx6Qp81U6MlvEGAz3g1R9XHqHFFi5SYQW0lxsvBFD7iZc2WxsPWa5OENznT3m98NvSWHo8VNpiDb0Na+ZclKxRuCQ8mKcPZ6cKtkepZkQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409059; c=relaxed/simple;
	bh=FB6kVvhTv6uVDZaLO09UQB/X+Twn6n90Vjpy1GeRUkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r33xovuhF4uh6EDhG8MQpuDlIqrRu5FngPYlS75UJmiIzQaw1Ab33KutafvoGbmZDba6Rzu4c7Q6F2CGzbVS7nmSQMtM/apjpTbSF3xIEGTa7FtNe3PACQxqXJ2KKPy85RicYkwgEI6gPiDyZfOqVyq2jyHbv5Ttuaemh5YnJ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bRrEQlO+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bRrEQlO+"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74248a3359fso2451153b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409057; x=1748013857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKbGApiEtkT8/WDx/Modbo6eDPhoN4O6DcMv04ORqek=;
        b=bRrEQlO+dnEYER0T5uazDOLxlQizfDY0lIYJfWFAHvh67bQd1zptOkI114bYq9a2/M
         idLm+aQQnSs4jBmKQ3HQJo0XMyDxQOfejxxO7gaAok0A484jai9asyMYkykgyZXbAQI9
         pbJ4Tu8J+CVZkW4a/85ULoHst1K2VMn7/qpgXdkqYNrhnbf/4cyUbF50xlYyK9cdEsQ2
         9uW4R2HGY5nJZhcYtY7cTCvz47i0wPRHm3bvZMV2xSogfn7wAHNR2tHs6q0e5H8Rlbr1
         DlVoY/jS+mf7abAwr/UkDJe/FdHGpx9Iq35r9EcNP3swJiRLN0pfkAfygWcpogh1KNSJ
         ++EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409057; x=1748013857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKbGApiEtkT8/WDx/Modbo6eDPhoN4O6DcMv04ORqek=;
        b=iXAFqCKoqFTSEeotqKPFb/3DIk0ZgMlGle0XXnBsUqtz86oUqbcZnpnkQGC1wTEaFy
         c9l7uMjV/bTZbQXsPjKJ3ZRg6M+tGTO3uqiwoIY+xOtfi6BkXKU6N5Ra5Wf6Hi6RVs/F
         vlQJkgViVupzWIZw59tVM4Syza7tFgTalxtngrKrMRsatJ22UeXmkVUYGhmGcO+SHH5A
         s7456LjjJKGrRDHAqLjvHx3tk+iMFCoKMi9S0bpebwskU2i05VJ1xypWEu0fcBYAImya
         OXVhXHNVt6pDi35oxhwOuebi02fZJQwrl+atRpJUsnVDCxIm/vFMrJM/lp6YIjed/x6U
         LCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5TTaKzMhyLaRV7NkoBsZThV8bY6OH4EKBa10zQZSeNj0eyhJ33A+IUZHp6a/+nEIgzkuNCANW9oSlZD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGL1/xLHglTAoaHQdVBVjIKZJONPuE2erC7varOrdq/AFUYQI9
	5hxFLfrJYPhqwOmHV8QRCJ+tCN2OXdzHQSTECUh1z+g1R9YiPtaD0dayOQ5T7e1WgfY=
X-Gm-Gg: ASbGncvfGjQuEVBXepHUOOk6XquKHKI3CzgF9eT52cHHfZbFCoa7+vXSnxVzmV0yVwz
	HNBTgnhcVUSR4otfMmeFZza9J2Y04uEEzp3l8w/NJKH40s1k62rhwpNjgsNkwbK11tVPpc9g3BI
	MQuLYsRiKUN3fo57ZPK1/XBp4fdtxo76/m5Bp5EGrJQu0yTJezdXdPi+JRdxcoSkQ+/RKpBMJSG
	liJsq958wVI6wQT9me0CBYfM+89SQXciVtpPWDnNgJ+TYLWPwFrsXQnQCgwX99D/D/RPtBv6w85
	wN2Hi+8wPvGTd9CoT0+7ldTZR2m2N5oNlVoioKf70bsH3Pzsygf7mh/+vWkt4RY=
X-Google-Smtp-Source: AGHT+IEPys89YDQJYKU3/9Q96sLuGwipd4FD9peTZgU8hGsM8WzNmpqONcesktg1K7D9UT/m6i5B0Q==
X-Received: by 2002:a05:6a20:12ca:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-21621875ab8mr5817835637.4.1747409056778;
        Fri, 16 May 2025 08:24:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm1666997b3a.30.2025.05.16.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:24:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v4 1/4] riscv: add SBI SSE extension definitions
Date: Fri, 16 May 2025 17:23:39 +0200
Message-ID: <20250516152355.560448-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516152355.560448-1-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add needed definitions for SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..4d7f81c620ef 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,66 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+enum sbi_ext_sse_fid {
+	SBI_SSE_EVENT_ATTR_READ = 0,
+	SBI_SSE_EVENT_ATTR_WRITE,
+	SBI_SSE_EVENT_REGISTER,
+	SBI_SSE_EVENT_UNREGISTER,
+	SBI_SSE_EVENT_ENABLE,
+	SBI_SSE_EVENT_DISABLE,
+	SBI_SSE_EVENT_COMPLETE,
+	SBI_SSE_EVENT_SIGNAL,
+	SBI_SSE_EVENT_HART_UNMASK,
+	SBI_SSE_EVENT_HART_MASK,
+};
+
+enum sbi_sse_state {
+	SBI_SSE_STATE_UNUSED     = 0,
+	SBI_SSE_STATE_REGISTERED = 1,
+	SBI_SSE_STATE_ENABLED    = 2,
+	SBI_SSE_STATE_RUNNING    = 3,
+};
+
+/* SBI SSE Event Attributes. */
+enum sbi_sse_attr_id {
+	SBI_SSE_ATTR_STATUS		= 0x00000000,
+	SBI_SSE_ATTR_PRIO		= 0x00000001,
+	SBI_SSE_ATTR_CONFIG		= 0x00000002,
+	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
+	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
+	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
+	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
+	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
+	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
+	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
+
+	SBI_SSE_ATTR_MAX		= 0x0000000A
+};
+
+#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
+#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
+#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
+#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
+
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	(1 << 0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	(1 << 0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	(1 << 1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	(1 << 2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	(1 << 3)
+
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		(1 << 14)
+#define SBI_SSE_EVENT_GLOBAL		(1 << 15)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
@@ -419,6 +480,8 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -505,6 +568,8 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_ERR_DENIED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_BAD_RANGE:
+	case SBI_ERR_INVALID_STATE:
 		return -EINVAL;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
-- 
2.49.0

