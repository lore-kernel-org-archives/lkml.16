Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D182202996
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040346; cv=none; b=JiPHgvyPPdlFTz3+Id4psxIw4hoqT4IgSZWBz1j7POvjADErrUyCOnL4SYHsnAsiO9njTa+Dt7tQslLT2guCHAmrUHgSHZrPiy1BMoD8N2HKs9b9rrwXNS7WSqRBp5NH0Z9PUMgvtiwhrO1PLBHoGWZKBOYwDEWrhIkvkJ+AKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040346; c=relaxed/simple;
	bh=YccRhJzXOVUtPTATWsrLUBAvdjjA7nJr0RfSoXtT7x0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzdmcIjt+qBCpRbi2jMJygetLX0uBoTpbZ/Hhl+TcXCJccMrGD8/cibp7lvXUPjf70n/N53+136E1Onk2fdknmJMs/YUg5o6aX7Ms5cUdyf4cb8eNgtZT5hy9U/2X3pY8BvRNwaeIiysA77M91SErs+fsXM/BuBm0cKnnV6b93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLJjhlTL; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLJjhlTL"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e6e09fb66c7so3653595276.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744040344; x=1744645144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uu42nQ2bSmAwDWGBzjWYiwCDhQBT41z5F8NL5MUeB9A=;
        b=MLJjhlTLwX+K8313I1EqLCfPgbk2UqT1zIhZ2EAKVApYr1cENBI5iuXANKgrTy54pA
         Y3Ks5qPkpm/wQSCV2GQocx0FVinQvq3iyHbl9MaobBitL2agdMIDmgaxqbrC7ILvoHXe
         VHYp4A66tisAWiyG/0KL7wwQLuEHIL7bGvGt2lXAOOhfRPrKDm98xzto+5yy2+054TTx
         xHkU+NlTT1PLUlNONydkm2u1d7lBCKYcFJ/a8AIVh25ZUD/XbqAh0QWUrWATiBrlqG9F
         /qMboEVxe0VordbHF7Zb+vGZ+XD0vb2ZOephPu2rbLRQ1TnxhI6aRxnscLN3R6NicZe9
         c9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040344; x=1744645144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uu42nQ2bSmAwDWGBzjWYiwCDhQBT41z5F8NL5MUeB9A=;
        b=IB1U1NFD3pXu2RLkNP5hz9EPZMAozUbuYNsdy+c+cfz7JHzoQUctJICW8N1fbOt9mR
         s9g12/EW0KjlLB6O4NRHcshVJEYtYt2ufPBRGI8lErkk/TiicXWlRZNCE1GRhFtNq62C
         RzdmZcmbNh08R7FSapTMBTjcC29RkL08EHfn8IERHlvkUsnCLh1mU4lH1AgYnsnU+hpH
         bicgLTK/RIzeNHFlDv2Nlywg5XkODi5HlwhyDtAWFOjKBAiBE6CqoUCHQMcRCUhWkdso
         ffvSJYGlX9xITiHcN3XO1dXMO1u0ta/P4ncHRil6j+PnWWtrliTTYn3Qywk3Oduh6hYx
         1OQw==
X-Forwarded-Encrypted: i=1; AJvYcCVr5VX4f4Vx2ZUmV9Fp4A1pXspf3gLUyui9WTpvU/pCVLUdwXZ+NYZEMeM4ohLlpKPCE8RIB4mCLfqf9so=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKv+wEPcO53xUG6CfUmdsvvmp5/X/T4QCjggl23WFI5IOjP0D
	mrnXWNkzQvQRh0Nxm412ndJD6sOHPlPFtlSb0GeILZ2PLPu3+ZcF
X-Gm-Gg: ASbGncuIyIt4djG4CMlChpDhyNPgxLauduboEk9wmHVIKAcKiRL87fJ2xZR+AsCj932
	d+fuJbq4eFRY43Bfv2z1/252VIOlB9PH6z0E4KUFN4g3AqaxOCg7KCqy59+5xPHd3qwiNMNi+6z
	wPx4LgQUQOhU4P2SU26X6oRs+x9bER0Wu28jwqpAQ3fMuDhf+LXIbXioQq0t/BCFZqNFDH2cFSz
	LlStIPcjjXx+qjHobBwrE9KTkb8zsJgxp1XR/3tZl5p+fMOv6eqDs0OxzMzxnLGvMSLMGqr7lMe
	iQqVVSjGBXEPuhi0GzNTa1dzLbuHR0Qz8xnxMGIHyam1fVwTSSwUcLvF8Ucu85hk9/a/wvdGGbL
	LfyestysnMV+dxuA=
X-Google-Smtp-Source: AGHT+IGH8gkmMulMeXKGXIZTf8+s7ZupbfV3/p6oz6Ro5ygbXr9jdCeHXgH4ndUknwBwdh9y2n+VLw==
X-Received: by 2002:a05:690c:6f85:b0:6ff:1c8c:b670 with SMTP id 00721157ae682-703e152e632mr216891757b3.14.1744040344063;
        Mon, 07 Apr 2025 08:39:04 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-703d1f778b4sm25735757b3.91.2025.04.07.08.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:39:03 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] x86/resctrl: optimize cpumask_any_housekeeping()
Date: Mon,  7 Apr 2025 11:38:55 -0400
Message-ID: <20250407153856.133093-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407153856.133093-1-yury.norov@gmail.com>
References: <20250407153856.133093-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

With the lack of cpumask_andnot_any_but(), users have to abuse
cpumask_nth() functions which are O(N*log(N)), comparing to O(N)
for cpumask_any().

This series adds missing cpumask_andnot_any_but() and makes
cpumask_any_but() understanding the RESCTRL_PICK_ANY_CPU hint.
This simplifies cpumask_any_housekeeping() significantly.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 arch/x86/kernel/cpu/resctrl/internal.h | 28 +++++++-------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 20c898f09b7e..1db02bab9743 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -71,30 +71,16 @@
 static inline unsigned int
 cpumask_any_housekeeping(const struct cpumask *mask, int exclude_cpu)
 {
-	unsigned int cpu, hk_cpu;
-
-	if (exclude_cpu == RESCTRL_PICK_ANY_CPU)
-		cpu = cpumask_any(mask);
-	else
-		cpu = cpumask_any_but(mask, exclude_cpu);
-
-	/* Only continue if tick_nohz_full_mask has been initialized. */
-	if (!tick_nohz_full_enabled())
-		return cpu;
-
-	/* If the CPU picked isn't marked nohz_full nothing more needs doing. */
-	if (cpu < nr_cpu_ids && !tick_nohz_full_cpu(cpu))
-		return cpu;
+	unsigned int cpu;
 
 	/* Try to find a CPU that isn't nohz_full to use in preference */
-	hk_cpu = cpumask_nth_andnot(0, mask, tick_nohz_full_mask);
-	if (hk_cpu == exclude_cpu)
-		hk_cpu = cpumask_nth_andnot(1, mask, tick_nohz_full_mask);
-
-	if (hk_cpu < nr_cpu_ids)
-		cpu = hk_cpu;
+	if (tick_nohz_full_enabled()) {
+		cpu = cpumask_andnot_any_but(mask, tick_nohz_full_mask, exclude_cpu);
+		if (cpu < nr_cpu_ids)
+			return cpu;
+	}
 
-	return cpu;
+	return cpumask_any_but(mask, exclude_cpu);
 }
 
 struct rdt_fs_context {
-- 
2.43.0

