Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227E28F52B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516081; cv=none; b=S9GDnRfNS5EZEMHeS1jGsdfSEqWi3GypqJHemffWmffunD6/IeakiYoQ0I2ttDfgRe499WRWsbgyerTsxqNP3hnVOruEBNOt3vIGiNpp61NFtL1cVs3hi9GmV211tCR/csUOwbjLjWeQI3Ik7mT1rYLv8ps6CBDCyYWaPeH5g5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516081; c=relaxed/simple;
	bh=LcpSprXMV6bcNVh6rueh5KTbTp1K/fbkooupP6MTizk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hpYIssGvtX9IN7TFCFN3RyJPvxV+EIX7GcHctdmEAw+KLgjxoVTeGquaaEhbb67I+hFQ7N+2/y0FSSW/VbNaMeNKG+nI5e9jI418USuKvUG+r5tad1MMHodaX0ZXhUg31pnUoHfsPZxVwB4GS/f7R0IW2yorP+ZAWFAn0FwcC9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=owfWtu9h; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="owfWtu9h"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso1287962a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516079; x=1746120879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH77kPPOP+qp5pa2Cr8pgAGSaFmjEWdE92nKDczco64=;
        b=owfWtu9hdkAHE0zKblqsvB1dUkIPCXmYCfyvccCw1Pp/VcDq7vvWGLwjREa0bt/ims
         pkDNOz7FIEpA9eItkuJ+01IXuBh176qfud6JMq4EWtsJOMeEaeRsAdlyGgXOijeU3W+y
         4YCUIuFnSOK5USK4Q16Wi0xWCcxdPSS15+9ig9ILKCdsJzc9BTvV+UJ9ndnN3G/F9NVs
         lV7Vm4CP9VBMGx0L0Oc3/nbYVaInEg/OA1/glgdVOnkUJ6V4+R4r+aKET7rnghJhhEc4
         zA6Y8AWEQxDudw5GDTqpolylcn9YG0vU2zI40WznPQOu+RWkgHgK73+Gv4kvZ7AkgeXV
         u4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516079; x=1746120879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH77kPPOP+qp5pa2Cr8pgAGSaFmjEWdE92nKDczco64=;
        b=CpG7t7Uhgabu/NKrJI1YlQYDuBpx6OnDD8ibSdNiUok6adsF38cAwmoeF33lfUFhqP
         DEDIX4SY5xfEWaTLI+VtyGLqEjMZdXx191fjAYoH7Gdr0AIP0U/dzG75vUd6ekcjwHSN
         LFDRe78TNx6C39L2U4NGG8SWluQN49DbySGzvRzievkodQaaf5rhX7AHaiZO3VbgB/+1
         xi47qAz/h2TESk3NZJbdYUGDFi9UqdLkbdcL8WmFOPI4Ke4udDH/uXScjvVEz3y1jj8A
         +7gYpn04BBai63oojcWDgPR92glY5kbGWAQ7zr3XyFhDSHwRsi5ROBhqDS4Cu2PLGw9v
         4aTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrnxxwV9uzruGJULAMPI1UBQ07mbrh0UIykDVXjk05ANZB9jQ5YciVCqwzgIQpoMIAorU93btLDKA5W18=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQaPDRh4kdVXHqvKEXFsOuP6I/DAP0FjlLRRHN583v46xb4hA
	we6FGSbcOk+fexOQNe+8KRqyJOu7ASrlw+K3L7HSN64kxZIK+OJB9TLKiNKNhhI=
X-Gm-Gg: ASbGnct5Bsx6FzFTqwpdVqbBpVeTcdZeOHBMxcdaN3OJoWTYeDyL9yPQovW1bQDSL7O
	KzUG3Nd3ebd9h/pccNNefLdrWHCeaTQsv50gJeGvcHyg+dUAWuAsnqiPBAQdrb6F63hBB4aYWLw
	b48GO+mIN8jXTJwD3wzB2JuIVQE9qPK5ukvcrBVl3zZnOS0sWqwkFKbqj2Dlu6+o80xQK85OEY0
	EaFeBSF9h/oNK2WJO8HZs2+dId1iVUeqPPxPClJKeONUBCXW2chZIJ09rD9pEF0SuRGlMIQrVue
	IDqiODp23+xCw3ow1kuwVVLjEA7FzQE5oenrNTPj9Q==
X-Google-Smtp-Source: AGHT+IFi4Le7AzhhmTTIRr2FvD3j5KIgFxeLHXA7hAgbxEuSLsG1Fq72dIzoCsCCWJEHQANRW1hXVg==
X-Received: by 2002:a17:90b:1d4f:b0:2ee:f22a:61dd with SMTP id 98e67ed59e1d1-309f56fa88cmr642762a91.32.1745516079316;
        Thu, 24 Apr 2025 10:34:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:38 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Thu, 24 Apr 2025 19:31:54 +0200
Message-ID: <20250424173204.1948385-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
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
index 6bb734abf9a4..e1fe39cc6709 100644
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

