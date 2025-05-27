Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51291253F3C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340009; cv=none; b=ukI4Fy3kNA7t2d8FIeb7bOJxtnIbAvWKxKRgbfLExjxHaz5Y0WUt1Ym2CCfKcfEpp/2pX+32exYsaS4G2EU1QpSiIpVKaClBSqdz1/9VFv86eTq6lfAa6MS8w3ZY6VB7HVRsAAndRVOZ62p9973AGN/Qw+8T9/C1XW+dF8FQZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340009; c=relaxed/simple;
	bh=kvyYgb53Kh/j2siwYi6Xs0cAxReXD1W79EfzBzAAlz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dOyG7LckAlpVc1T1YUTDj/4Dv7DUoXxTP1I0190ozqU5B+Jr1bk/RvZheilRLXRqDyj7mrmKbZeSWv1VFp/W65P8Nj6ySkRj8FqXhPJ8OZtpjI5rXi482iXFxT/02vrLvFGV77k4hubzFZg45GchKorWoFf7N73DVK+rm023TMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CPLYH8rE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CPLYH8rE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ea341570so22358105e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748340006; x=1748944806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJhXd+JjVeHIu6wwD9ZZEi2Ud9dEpWw6YK5yGe9aoM4=;
        b=CPLYH8rEE3BasjCQWFSM9EKzIRBWh3X+zmo0RkZxNJRnCrFCSXQs5InQQYQDMVn/mo
         73o3Ba8HsLObbk8xSbxaq2zhofgump3hUaAmg7wa6fAiUvF2HqJUWL0DYT4P/f0HqG4m
         WTVxyynxkR3POgM0cBv5oXWu9aOhnwEuXS2j2BPBfQEStbuQqVW8u1rsos5hptEBlhnO
         4V5TOqH/EFhBW5pVsJR+ylOuIABV+x5B0xII7OyeY2ZVRh/attugJRcwv7iOxK46RVWb
         UyWOqelnQAnqkTVtWCe3snoUEkHYzz1/8uxfBVeSSnnAv7Hk7o58+rr5BVvRhDOkkx5e
         9+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748340006; x=1748944806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJhXd+JjVeHIu6wwD9ZZEi2Ud9dEpWw6YK5yGe9aoM4=;
        b=CvEl19+gjH7SLIGTTzphMByixgJfVJGxY/X/AFSlT0VEg1ZMxCqsuvVdPOnQysBtgF
         5vhLu2NOBPZYn/aYsGpQx2JVe31n/cmkSWBVskwuNC+LORLf9uHXh3gFV54N2E/8qs20
         1i7n6+8z2In+kkb6x7GChDWpQxdcFtRHd01qpyu6G5UWiwMkAxpHJLidA0hIEyQz3xZs
         9lzmN8N9ZTJFkQ4wbpDmn6boL2ORL7Nuan3P2GQtorfn0LUOuVIHdUqBWgJYhNg73p4R
         6z2bf2zCBXtkZOdVUfvXjd2kVK2fExM0AdXst2XHvQ87kZb6xIdXvelqiKQVrurRzW98
         GGoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDrg2ILg9bVGJlfnWhBf90m6P70q5U4cdx5lyUNPS9U07iTxtOOstnk780ajg88MCA75ilOjQQIJXdqHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTDs1y8Z+kibd4hB4zIW/G7NAPMHTnvyd03cOTPqSEx6xrmVeG
	0WdA/RmhDP4PfOCIeK2iA02SCgXOOmCM+XvizhygeVgR9ta7nr4qBRN2OZy6SkUs/uo=
X-Gm-Gg: ASbGncuAy+CIf5ntkJ/Nrv9+vuuSqD2RGAuLsSkdej5fGln5BpCocpvw3hhx6Z+uGi0
	FSOl5IDOmHsTUe6c2bLp3l5xFMzvomlZDqSseZa/lrNEKaiw/s8MUy1o8iojunhruXZsDjUGvbE
	/KgmAaa286/bmKInn+33xt99jTZ9hmcHcTFd7WFfvEKM9am5799HYUBoO2uxVB6uLzPM6iBUqkG
	xGU4iNydIrW8uAauCxWNLXldWaWQfMO9H4eQ3G+E1z5AU6wCf0M1W9WC8G8rvOim8bhwfQdSFsz
	YQtAHx9IEgQ/eP/QZtXN09YzErVr1i+2Y1gic5+eZbcweQUk2U1sT+Pf
X-Google-Smtp-Source: AGHT+IGfCppXgpPamjMfVSNSnmDy40QGJRE8nqlxlFa1U9yBRe3jzsHtH6aIszOx0NKk7Xis+8Y/kQ==
X-Received: by 2002:a05:6000:2485:b0:3a4:e0e1:8d9b with SMTP id ffacd0b85a97d-3a4e0e18f4fmr1447154f8f.50.1748340005697;
        Tue, 27 May 2025 03:00:05 -0700 (PDT)
Received: from carbon-x1.lan ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38145eesm260382115e9.26.2025.05.27.03.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 03:00:04 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] riscv: cpufeature: add validation for zfa, zfh and zfhmin
Date: Tue, 27 May 2025 12:00:00 +0200
Message-ID: <20250527100001.33284-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These extensions depends on the F one. Add a validation callback
checking for the F extension to be present. Now that extensions are
correctly reported using the F/D presence, we can remove the
has_fpu() check in hwprobe_isa_ext0().

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c  |  6 +++---
 arch/riscv/kernel/sys_hwprobe.c | 14 ++++++--------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2054f6c4b0ae..dc258dbe4dd9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -457,10 +457,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
-	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zfa, RISCV_ISA_EXT_ZFA, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN, riscv_ext_f_depends),
-	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
-	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zfh, RISCV_ISA_EXT_ZFH, riscv_ext_f_depends),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zfhmin, RISCV_ISA_EXT_ZFHMIN, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcb, RISCV_ISA_EXT_ZCB, riscv_ext_zca_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcd, RISCV_ISA_EXT_ZCD, riscv_ext_zcd_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..a3dd31379262 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -151,14 +151,12 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZVKT);
 		}
 
-		if (has_fpu()) {
-			EXT_KEY(ZCD);
-			EXT_KEY(ZCF);
-			EXT_KEY(ZFA);
-			EXT_KEY(ZFBFMIN);
-			EXT_KEY(ZFH);
-			EXT_KEY(ZFHMIN);
-		}
+		EXT_KEY(ZCD);
+		EXT_KEY(ZCF);
+		EXT_KEY(ZFA);
+		EXT_KEY(ZFBFMIN);
+		EXT_KEY(ZFH);
+		EXT_KEY(ZFHMIN);
 
 		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
 			EXT_KEY(SUPM);
-- 
2.49.0

