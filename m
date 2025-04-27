Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC20D1FF1C9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745779979; cv=none; b=T55PPEwM56aj5ESAvelld+dYTnp/khhb7nrjw3fCGPE9RMCGXMFMHfRzAIGjXoBllAfYnbUh7dA1hWDK40xOXn068WOFGWVWAagtVTzmXLWGbT4Kwb3F1VUaCaivpKizjBj4RrzEzsSM4PxSgdQma/m42Q8EuNS7NZGS97se/pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745779979; c=relaxed/simple;
	bh=RLuf2Vbd4p2z+T6UWIxXnrpwnN1+HvripSZDkxHS9Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uALIiOJ36kb+sMBlkkHOWzdl0y+92rlXCUPlf6GFqrthDu49ywWru/XB0lAGUTRqGb8uVcgvybs0K3e9K9BKRREul6uOwP6ZIEZz5IsBQKV/cOs/KEYvfPa/ayh5whNSqWMGWYLRMj9CZgN5wHF6dBsjIR33hJ+1u4lA88Tlq10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx3YsRDv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx3YsRDv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so2680133a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745779977; x=1746384777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOc6qCpSk3atZC8FDuOHN/o9mk5mbvvO8ouakr9Vlok=;
        b=Fx3YsRDvhIvHrOCzKk/nIzzqnS717FWrP+WNkI/Bah/ZD5BvB63apLvnGz+pZADoA9
         WssUuQBlInSCR0U3AbO0mIV70IigSZld/B8k92oqeCPQSl28J1k0ov6xPjNHRa155zlM
         Dp7+wqojEYZMgWKN2KzmDqhY0La40bteVxo0W3EEyOwHmnT5lGuAEWnGVqOhBVciIyvw
         Q81KNqXgYOH/956UKuKUfGgfpsMmwTudZ8rKJ/bqLgxITpd5+VK6Sp3Dm0kCXwLw6gob
         uwR0E/NF9FzH2ZoZCAsVqgQRaYhCip5Tf+CszCFJ5zjOnSZdYplfppYIKFoyPiivt0kd
         5ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779977; x=1746384777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOc6qCpSk3atZC8FDuOHN/o9mk5mbvvO8ouakr9Vlok=;
        b=d9TicdZVk9H26RjXpeAsEBDLhLzgKvYKzHAOnY5padn99Pjfzk2LEoJvyTXTKSJhYi
         dpMg4c7bIPmL5LeRpDrA8JUvHm9cIjM9vEUOub1SPOzE01tYHNYeeU5jsAhL8QEeh68+
         YPehFP31P9DTEZrqkStFSGd5ol73ItDkmbXSEQ1T/TGx2uMLk7UWQ+BHsw1/g3OzWyzM
         rDcv4FAgguQqPfuy1zDoL3+no2QtoBbnao8w/VvuVK3ySD1dkklgEBnPzrZ2yGgjRjg6
         nthCUb0wgV70AOabr6Hi6oJwLNJtjRACav36B7vsaL313x9uZFscOI+jiN2xdQltaFlL
         7RGw==
X-Forwarded-Encrypted: i=1; AJvYcCUv4mmB3wlowJrg5BP+Ht1GIYo+1YrwG2auWerU2GPOQ53/ZMeeuId8ESy/a98WFRPqrflswpFusLiu1dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt1v/xO8Rj6eIpgSo+gaAW+GIko7LMEVLMvRbkodCJzOqpFM50
	dkbOKg7gOi3BriRCgE41mmTw0lAoGnCnl9HiNRYzLUqgSVXLtV7z
X-Gm-Gg: ASbGncv1IcaByyOEjt6yxESZ/1dPOBppOad4zr3AT3HHXS2GbEA2Pd699oGZD/BD4nh
	KEFaMhONPtKu6+MU5lyjyUfkhqQ02IBLhdRyrv4wQodf/rkEKhxVT/U9ygnkByeu03iNu1IyY/M
	Rxv60BvH5u99gGPvCIIHL4sxYIy1t/7MQ/mEVJwH00nSiAkPSRoyhMahNIZRrra8iPL+6IGu+3w
	v4UV0l/lf2VOO1p5x4zocUHEiI7a221rncaUh3IALpeol7nf5nEbZsSIua+M8NmYQsUPle4V25c
	FxdLqsO4CxCVzzQbFm8FiCkj93Rv53kjUQgVXz4c
X-Google-Smtp-Source: AGHT+IE32q9L+jMRpGngzfnIfH6P1hRoSfmVzmUhHgMHF1IV/u+b0nml6twddH75x1QZ5ax+n6AoVA==
X-Received: by 2002:a05:6a20:2592:b0:1f5:6d6f:28e with SMTP id adf61e73a8af0-2045b9fdbe1mr13202203637.42.1745779977054;
        Sun, 27 Apr 2025 11:52:57 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f4fbsm6492293b3a.45.2025.04.27.11.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:52:56 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] x86/resctrl: Optimize cpumask_any_housekeeping()
Date: Sun, 27 Apr 2025 14:52:31 -0400
Message-ID: <20250427185242.221974-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427185242.221974-1-yury.norov@gmail.com>
References: <20250427185242.221974-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

With the lack of cpumask_any_andnot_but(), cpumask_any_housekeeping()
has to abuse cpumask_nth() functions.

Update cpumask_any_housekeeping() to use the new cpumask_any_but()
and cpumask_any_andnot_but(). These two functions understand
RESCTRL_PICK_ANY_CPU, which simplifies cpumask_any_housekeeping()
significantly.

Tested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 arch/x86/kernel/cpu/resctrl/internal.h | 28 +++++++-------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index eaae99602b61..25b61e466715 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -47,30 +47,16 @@
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
+		cpu = cpumask_any_andnot_but(mask, tick_nohz_full_mask, exclude_cpu);
+		if (cpu < nr_cpu_ids)
+			return cpu;
+	}
 
-	return cpu;
+	return cpumask_any_but(mask, exclude_cpu);
 }
 
 struct rdt_fs_context {
-- 
2.43.0

