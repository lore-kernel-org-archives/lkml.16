Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4B24BBF9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892694; cv=none; b=ruOpVJ6N4EnES4p+or/jFnUgjA85Bi7xHRpf0CWdAQ+vvgW0l6RmAKEiYJiIom5BZCcQHKpInfU1qd4ki//al3ebXibykaSJ3SFbeEPmWBy4tm9SWf69ICZOvNsX6bPIKZz528f7/NKDupQsxZB9VDBB5PhV5IrBN74LVZJ9mX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892694; c=relaxed/simple;
	bh=bRiCyLVUVK7d4rz7Vi4ci6OEXpinPX3bNStrcUxvF1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jpJBnLl2eaDEWJotOEzcycH6gmIGxGius2FCBkPeDHwwFjQwMfbh08/fGrYcwXtznFQlvDgBHPgrexosNHUW69jCed2IG4CuoRvD3IPGL4hk1rQSaMWCT9nEuhhbo7NNJA8bFG4hIssCchMrOh+ZCSEwiXK2Vln4fY1I4O9ktTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qiwDCHH9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qiwDCHH9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fb0f619dso7937395ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892692; x=1745497492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzbGeZkhDryHTbPMrJ1IX4plytmQ+QFf0x8BSly6zWo=;
        b=qiwDCHH9j/+kBo7QKWgWYzQx+FT/gH4a+/q5Mp2YLT9t+UpUxEmx3S+itJFsuY80ET
         92gT9rLZ6TjvFfYborp51BSMQwzveu5TUv+wHnC4W7cpzK6jWefSAKdnbWlwobzcdWWw
         xOyifAv4Txz5EOUdFiAGhPRjisUcwIMcHTloxF7/wh58shFpGBGbSRevXIap9NTDTJMs
         LXAXLimStKZ+sqNy6FJ1x43C4Upx8UDCMbpdsT5QbpGMrKhOq1kn09wN++EN8U6iTdjj
         zIzmgy+3b5KFanLAr0e4ac5X7sf+ZnRZlTR2mO/wFhqkyYqLkuVvqgR53XzL7bw/lPWJ
         PyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892692; x=1745497492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzbGeZkhDryHTbPMrJ1IX4plytmQ+QFf0x8BSly6zWo=;
        b=GF6ScxSq4jyAcHjdg1SRm7k78VlITb5642hEYvrJ8Jqy5Vb5xtAZgPe2hbllzmvJWq
         JhciDTNLSvooqu43I1UwWDuF+yKWZtlGaD9ZrmFvTHWQJSUKkG7Wyr4hECMpr++gOjnl
         RayetS2ZE2J2vWwOvsWGfsXDJ68Nlowzr930arSBAPNjvFvyHX39sp4hpepPWvKx1QS6
         dCCBP5Sioi5OPY1z0MF1+xsTQekzWnwedtDPjVgA35MR/3HrZWPkwSQyqcloEzDa8S7F
         0y0sNCQEnOTzm70vtGpJKa7YtlQP1QMYxV80xsi5Z12QV6y6hyiRu4Hu66hpSHlbxyec
         cAJA==
X-Forwarded-Encrypted: i=1; AJvYcCV/xYB87/jYcWVRvqs2+bhiqi3mSO1wXmdhYFiNhZZO0E1i6Okn22GU46m7NUwZ5FjxJbasVRRpwq9uHtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9PQqPimqxo7ySfOcwI8jomzKbfnl28U9YnazBw2s5bU5atiT5
	c0yr7EvawWHVwwHC3RxjtS4AKBsKsMbbKpkc96anwMBcTvJj5dRiomMFkdjnpbU=
X-Gm-Gg: ASbGncsHZ96qXZhTm9ArBD6QySMcO/vo8NOfHxBAh0ueIoQywZu1ftYFUF6hQRjcOwi
	cvlTj9zMAIMC3T0oUMvhuarxFO4kYJ1USy8jwJvDot5kNhlgU/PJKoCGVsLufiBSMpmb/Q9o+Mq
	TPlO2KM09ibYnrdOIsNXHI/SEyq5m5Q+aXIb6ozKORGFJOoudsOTn9rONPcWCtyR9riE6t/pJe6
	116RBmPx77t5FUHruAzwN3wlw/YK6nT2FWkOu4tJ9Cilkoe/wUKTEPN2w66TekWOMyw7ZncK08p
	DxyqKon1EVz6U2K2wf2ogiYZi9WikButCuF5FtWkqQ==
X-Google-Smtp-Source: AGHT+IG6jlQ44pwh9wX1WCDRI6TvuxV3hUxEozeeET2dKmcHLpN+5Bivs6u3n/jRgCZSuvYV8jlCbA==
X-Received: by 2002:a17:902:f642:b0:224:26fd:82e5 with SMTP id d9443c01a7336-22c359a248emr91338345ad.48.1744892692486;
        Thu, 17 Apr 2025 05:24:52 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:51 -0700 (PDT)
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
Subject: [PATCH v5 06/13] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Thu, 17 Apr 2025 14:19:53 +0200
Message-ID: <20250417122337.547969-7-cleger@rivosinc.com>
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

schedule_on_each_cpu() was used without any good reason while documented
as very slow. This call was in the boot path, so better use
on_each_cpu() for scalar misaligned checking. Vector misaligned check
still needs to use schedule_on_each_cpu() since it requires irqs to be
enabled but that's less of a problem since this code is ran in a kthread.
Add a comment to explicit that.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 058a69c30181..fbac0cf1fd30 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -610,6 +610,10 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
+	/*
+	 * While being documented as very slow, schedule_on_each_cpu() is used since
+	 * kernel_vector_begin() expects irqs to be enabled or it will panic()
+	 */
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
@@ -630,7 +634,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -671,7 +675,7 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	schedule_on_each_cpu(check_unaligned_access_emulated);
+	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
 	for_each_online_cpu(cpu)
 		if (per_cpu(misaligned_access_speed, cpu)
-- 
2.49.0

