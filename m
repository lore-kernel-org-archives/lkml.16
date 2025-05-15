Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E828A414
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297429; cv=none; b=mseYCtsCBP7uDCLrlfu8uqqpRKbSnpKvn7um6UrLn/70Owq1wAzM2FBIIG4pXTl3KfP3fj37uw1lgrU1wcdHzfqbFEKkr9kCEyNDkOYAPdMyrKJ3OGLBIMf9n8LgG5uBongBPhPKHZm/zL0Xdpq2f979+RY+EXOvnMRCdOy47aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297429; c=relaxed/simple;
	bh=a4HmXbZsUXBGVxOtLEuaSzvGsxTBPYeLxEetHvR5itM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DUpOY/cHBktQdc+T8psXeQfxcnOzzj65d0X688BxeQcmUM3U7PniAocKrhX40IMUlBn2VPKLhjmmCScptoQXl6S9fGaFxe9FMXKvxIj+m5R21PB7ZQQfMJOTT9tK8M4WmkZBLOLEWoUI/fhXskJl3mgVPrE6Yz3O+24RycIQxH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BOEqXedG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BOEqXedG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so6832565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297425; x=1747902225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=BOEqXedGgKBrqtt6+QDX0qKChGPFjJzR+fX1Qb9EUvVY9PCc//lb/ltgncyEroOSYA
         nB/N39aWg32Y37VSFupzZmcxqHQa4zY1Eg6EIytHx4/tLuNIGmdX7WADYd/dQoCcWtq4
         jq9vDYIo69Bag2XuHEnT/mWx9N1VVWZATJA00yjmChuW+LZwb8rfoGtqdfhqI58p9UBE
         tDYTrkZmreUzchxg8HGqp2DobGihtsB+Z4F5WWkZsx2mPa6b+sYZyyrvDM1TiN1dxiR8
         gCr3PBV0m/zpkqHZTS2vmnKeFy6wYD6FN7jrq5OOYS2Ecbh6mIjg1VCXLgs91x/IfXVo
         /8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297425; x=1747902225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=rEfFh+esPcq0iOpuYKGIRumLeAnL/Y3mDZCt+eTn0UtT2pqqwFhGBw2A3uo6ar0qE3
         nE8nptFRXjYyDclqLck0l6CKMr+0/eDv0yHJoDl83N7ciilJjWljX/i9pyU8troHtdfz
         jPw2nTpS+opKdDrvhauz91Zg5q3hXE0oNQ0Te96DulSeAsleIs8392+Q1XxOTGdsZypg
         mRQIqweww4EbPUedVyxwLmA9zB/3r5NRW7tn9olf8NGFkHgFsPj0VVNm2e0ihjbWmEfL
         7DrRG9s6BfilHcmzolTDU12hSibyyWg4CsbAy4rFtZgmkPS6qb20pZ8NZH0QRLvyBNwe
         2GsA==
X-Forwarded-Encrypted: i=1; AJvYcCWhLwe58SJ8iICuMzG4h37StF156tLsGMSqxXU2qcU/NIfrV+ddhRJJoEE2y4IYjxbCZ7jNa80CHOk3Mzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HCC/DV+Vc5r5Fg247tLsgf4tvaK6QEjyIN+86zKCVSVvhND8
	hJ/L1oHfZo9N38AXxIQDZbHHMT/CunDfTtLvS0W1RnavbIAZFkD5CidqoclTB1+dreqm4T0XjGm
	j
X-Gm-Gg: ASbGnctWirz8tg8RNu5f2RzkF8VpoupOnzUYl3VEVQpMoWP6EuuSIn3DmAJKfmZsi+F
	68JnMFAGnOW9ldD3kcvhqy8IGYi8i6CCRWNgpuXIIK/lbyPaUuDkDCv208QpL+SXdGbOdn37Fs/
	x7lmhUfeWirwqJ7mnpBV4qVCpqJxjxUsl8/Y8oW6PG81OQA2lq5jyFrVm7nm3kLj3nTPngFCh90
	AarUusAuf9h8LyWKoKKuq2iKe0V/5iBR1RxeKE/Zd2DF5mOY1PSrZJfFh5/Ljwh4PlvWfMbRV1H
	/e0NOXX+v/FZl771xCW/XgWhTE/iAOMuqgRsWsIS7e+Z4yKUWYU=
X-Google-Smtp-Source: AGHT+IH7x3YD3rfJ1K3d7RT3c2JHqxBPnyHoNq9PzYlNLe+gbgjdmPJmhvvDoyxbPRh62T/5hHxcIw==
X-Received: by 2002:a05:600c:c09:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-442f2168c29mr50336365e9.23.1747297424728;
        Thu, 15 May 2025 01:23:44 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:44 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Thu, 15 May 2025 10:22:02 +0200
Message-ID: <20250515082217.433227-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
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
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..bb077d0c912f 100644
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
+#define SBI_FWFT_PLATFORM_FEATURE_BIT		BIT(30)
+#define SBI_FWFT_GLOBAL_FEATURE_BIT		BIT(31)
+
+#define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
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
2.49.0

