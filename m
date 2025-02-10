Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AA624CEC0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223369; cv=none; b=e9cX54sP1AvQ1XfZYTTAZYriLaq+YlruTriLDFKY4yGWrEbL0ali6J9qvmY9jC7i6/qnEu8wNHH/CiCzh5S4e8SeAc7QNylGAMOv0QRDQIhkuPTByKY7WzmP67zdjHA6yet9n/6tq3Q1We9PCWw14m9kJD+bVxHtqD5yBKwJbIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223369; c=relaxed/simple;
	bh=pmkjbFivpopT/t1TZQFWk2I+IyDpQtxJktgGqR1CYS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQrux9S8nVnbIbENSHmx3IDnEN1o/J5qtKvP4sc0sz6hCGMYGSMbnZ9CRIZisPSfgt01jT9GlD4mUtLXyy03aQB3dDs93IL9BRXFW5pRLtnn3IlML8b2G4npJ6utIzZFrcwQdciW1Ibvb5NmdOEzv4vS1UnmkK2Pb3FJpG3nTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ElJIDrr+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ElJIDrr+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43944c51e41so14811385e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223364; x=1739828164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNygMxZnETinUIbqht3HdG0xEf8Y/zFmGWQC8EBuXhA=;
        b=ElJIDrr+OQmC6jPe4mIqSUR5mRtwFbqWwlWYxdQY172qlMaLocL9xC3e5VOO+gRaBa
         3naV6gwfGy38sh/uaicAqANkjcJP4WPFwOUVvy9FE1sKKJtNlYjVDHyg9uwjITm1kBo9
         NPeuA/E4aS0R0U6gA1TvQ5e3tj/Mj2mDiH0MA275Qu+wl3ds+1COyLrv9BfDf9Exfo3M
         fgcP45ipCYrBFuBvkl5FkZ51sctmxLmrhVdtDkK+Pl0uCJp6TiaBzyUqdxYWjhfvjivN
         gDL2AFe0gXWxcsj9XgQNXVa1ax8b1RhCxKRvHEL/aQ55di+FO7oVzu4dwy2pcG7gDqaC
         WIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223364; x=1739828164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNygMxZnETinUIbqht3HdG0xEf8Y/zFmGWQC8EBuXhA=;
        b=Ram0ZB01or3gEXJcZWSDsFye0wNvZi2XwL1eFzhqikHNFqWqjJpqr7Loqmg7/lRkeT
         T+92qC6r3dlRIK+cbnnq6Goii8fv0J5nyS1BiEPfKr3bdCXwZ+DCJWL9FBRHbqXG67Lr
         3e6s9wAVHpe32iQYLWd1mtjgvaCSokfB05cUUmtNSrODDIh8vC4XOhsNdTGkUhEviV+O
         PliwbbpJ//bh6y5fdfefRi5EaMGNgZtxqj3PwyFNYdoCkOoSDYCQPdwZ8LufefeE6yed
         WO6zV2HwFFXrMzSrZjg52vkyxnu8xoOX8r9yZH3dPYK78VnLbCRSHjkQ90iXFc5OnsBu
         qfsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW85ZTr4Y8eAx88Lz6i6EsSrc5ll2U4NfiVOfozVT0tplws6EkuPj8eLHgDtIURZhTsKAbtojMHxzzRuEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxv4SerahyBgqZFes0bsb9M0Cfoti3zDAn1akwvIAOcUIe+XIc
	PjiDMdBrNKkGweb3a0yX8Sx377aTs/4dPyhjSl64pC2SUYa0B0ypfDBkVOguVas=
X-Gm-Gg: ASbGncv0hLJsCsta8+V7tr+h0/qW/8Tji6HjmodGQNYrQW4S2XOx2vekAuPAnKvoGDj
	Ok3dWtS0Dh3ak36jBS6z2ko1T2hd4g6BCWsqM/yQi2qaciGMCct4TUWwQQxqmUnGPtxVpDdLXNY
	bPT4jgfTvn1WrMOqN8LNEsVHGt9LEdFg5t0tOssBjgp7t+K/4AbuX3fhFFTMY5ceZs7nlED1aa0
	0wAc/VNv7paQURp6UZ/85xBUyXxYlzbCRewNxtDNNt2xNwf+B4O+IBuQ1zja9YVWW4v1uxeothf
	dlfCsCq4A4r0r+ik
X-Google-Smtp-Source: AGHT+IEAhlsJGIdKtITdkCqcTf1jglZE/SWwXLDChC0QYiT0cR7GNzwUW0cObTxbcQCBuKABIqPOaA==
X-Received: by 2002:a05:600c:1f17:b0:436:e8b4:36e7 with SMTP id 5b1f17b1804b1-43924987efbmr120307725e9.8.1739223364575;
        Mon, 10 Feb 2025 13:36:04 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:03 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 01/15] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon, 10 Feb 2025 22:35:34 +0100
Message-ID: <20250210213549.1867704-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Firmware Features extension (FWFT) was added as part of the SBI 3.0
specification. Add SBI definitions to use this extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..d373b5c08039 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_FWFT = 0x46574654,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,33 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI function IDs for FW feature extension */
+#define SBI_EXT_FWFT_SET		0x0
+#define SBI_EXT_FWFT_GET		0x1
+
+enum sbi_fwft_feature_t {
+	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
+	SBI_FWFT_LANDING_PAD			= 0x1,
+	SBI_FWFT_SHADOW_STACK			= 0x2,
+	SBI_FWFT_DOUBLE_TRAP			= 0x3,
+	SBI_FWFT_PTE_AD_HW_UPDATING		= 0x4,
+	SBI_FWFT_POINTER_MASKING_PMLEN		= 0x5,
+	SBI_FWFT_LOCAL_RESERVED_START		= 0x6,
+	SBI_FWFT_LOCAL_RESERVED_END		= 0x3fffffff,
+	SBI_FWFT_LOCAL_PLATFORM_START		= 0x40000000,
+	SBI_FWFT_LOCAL_PLATFORM_END		= 0x7fffffff,
+
+	SBI_FWFT_GLOBAL_RESERVED_START		= 0x80000000,
+	SBI_FWFT_GLOBAL_RESERVED_END		= 0xbfffffff,
+	SBI_FWFT_GLOBAL_PLATFORM_START		= 0xc0000000,
+	SBI_FWFT_GLOBAL_PLATFORM_END		= 0xffffffff,
+};
+
+#define SBI_FWFT_PLATFORM_FEATURE_BIT		(1 << 30)
+#define SBI_FWFT_GLOBAL_FEATURE_BIT		(1 << 31)
+
+#define SBI_FWFT_SET_FLAG_LOCK			(1 << 0)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
@@ -419,6 +447,11 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
+#define SBI_ERR_DENIED_LOCKED	-14
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.47.2

