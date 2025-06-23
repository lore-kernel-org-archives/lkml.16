Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67B2376E0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671126; cv=none; b=ZFqoYP51M2fZ9JHOkUzV+0JeHzwQgi5jh5gYIlYF8ZJCoLmcq8Mb5LFPUo3pdISPZrjUyJ0ss3txgvYSbkbqlCM3TWXY5Aw9pNBDqxtlAjBlcgthU/L4O+5b4sR+Q5Z3dgaKkrR4tKrzgOVZmEH+yrsPQVk1epDxysiibDCD+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671126; c=relaxed/simple;
	bh=e/g0Sw988PkQY/FzMC4b4/0FPylfUMJyAuwwfoFlbSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJv9qBlH5HL1vtUBGCVQH/OkgOe89eDIwWYwYIB+8GdtheDjIygORMnpEtoBI3bm7PYTrkhxokd1xfkmc788I4TbXaj/xYli0ubeKm5B29Ot90d8hx2bEhDXureqll+1pTcGzIf+t2LTGsDSbneP62VL8ad2PqyKiPKYQ8mmMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G84qEQZf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G84qEQZf"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2350fc2591dso32825235ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750671124; x=1751275924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B+nyQWkVcjVEgS4bxefq4bC2m0gmMPDc+2UfUzc21zA=;
        b=G84qEQZfcSVQB6hay7i9zEien1kz0aznvTW+A9KtiNs2OxgEQMiCJxLEIoIpuZmzn9
         tJUr7gE5tqMDEUZCqIJG5SKbTY/3MJMqyhrVyLGYruJvhGkoFmIG1Aw0MWTKLXEi7xoG
         eJgRpTUjv4Hl1J3UPl7H11isAgP5NLDNUEo1SKFH61varJ0AWJDFn9etlWqxKqeJPFX7
         IbqqfgXSW4F3iIejxRWvsA6Nc9WVVjHvbOP2fHSzdpxE+7331V4gatEYxy4BzUrogYrB
         tURBrkH3NYAxUP2AilmXvi+90Lkwu6747BywvwaZGEQ8fn4WoTfQt7cnD3Mi/o9tbI+2
         j8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671124; x=1751275924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+nyQWkVcjVEgS4bxefq4bC2m0gmMPDc+2UfUzc21zA=;
        b=rIU+J7k2CaHJfUBhg2L0n7/skce2KAs4qnmqlDPtXgmRNvtjQRxz/TCBBNpZnf4KSt
         ucAAuAylExLy9AkdrdOXTrm/SViyNHADKGBehRE+x7kbNavy3Bi/xU0XSyaEOWxlhN/X
         2EQDBnIGVH3YjLXWVMAzCrIX5XGvppx5S+L8N4KMKYdT2eb2JcW5PAI+AySezBWL4cN0
         OS4TLcGa9+AX2siuzXUurM8b100Bk4s2Vx9GbePB/jLCF8iwna4Ls+pD46ZV7lf7uup8
         Vm4iJiVk4r2vny7pGVflrxJbbMdfq0yxnhyHTSt/0Vwf1b+84ikrd4TP7ZKfv2vdKT8l
         uMTw==
X-Gm-Message-State: AOJu0YwcEns7Dt6JFxPjSLYPZolz3vpm18KICofKsqOmL9oa1o3SNAGz
	X9QaNPU/ElhyuzEGxnKCdpYjXMhHplAGEJM4jUbBtHguab0hwuT/enZF
X-Gm-Gg: ASbGncv0dTW1hXfCogumZkXy1XQ0nPN1KrzziO2ziOF/UI31i+VaPmVX63r8XzyJuId
	oNCgnFzSrxVLSbw7dF4w7FQ7U5M93KyF+nptGomdGxQoX0A4Mz929kxZ02bSpdVQuy5IZkMuPco
	11Xml3Ke/enoamG8fR7yBBfQQqPDm99A+TjJsA7YwiwSvYl/Vw3HPSsZ+H0nPix/KZWE8EZiCu5
	zGI5niKBTEKDhDWs+wrLXP3MfClnF/NekzskphofWqnwtOKdBtEcgGW5qTm7UqcVbsqFvIl8H+S
	J+vK29pH5Im1HKeFY3AfhZ9mCgQMTRUmsbCmuxvBcgOzIfah5uUm/tnXSrTVGOVXj85h/kuKey4
	tTB7M5Ibb5ztJR0bMgsJ4
X-Google-Smtp-Source: AGHT+IH/bqmQDqcW/+Z7MmvgNwzAepK1hHloqm3RJJAUvU+vHjwX5usRhqfmpL3kIUkImEu9SE5H6g==
X-Received: by 2002:a17:902:e54e:b0:215:6c5f:d142 with SMTP id d9443c01a7336-237db0d5a62mr153654585ad.20.1750671123939;
        Mon, 23 Jun 2025 02:32:03 -0700 (PDT)
Received: from localhost.localdomain ([180.101.244.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d869fbfcsm81271235ad.194.2025.06.23.02.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:32:02 -0700 (PDT)
From: Tianxiang Peng <luminosity1999@gmail.com>
X-Google-Original-From: Tianxiang Peng <txpeng@tencent.com>
To: puwen@hygon.cn,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Tianxiang Peng <txpeng@tencent.com>,
	Hui Li <caelli@tencent.com>
Subject: [PATCH RESEND] x86/cpu/hygon: fix missing resctrl_cpu_detect() in bsp_init helper
Date: Mon, 23 Jun 2025 17:31:53 +0800
Message-ID: <20250623093153.3016937-1-txpeng@tencent.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since upstream commit 923f3a2b48bdccb6a1d1f0dd48de03de7ad936d9
("x86/resctrl: Query LLC monitoring properties once during boot"),
resctrl_cpu_detect() has been moved from common cpu initialization
code to vendor-specific bsp init helper, while hygon didn't put
that call in their code.

This triggers div-zero fault during early booting stage on our
machines with X86_FEATURE_CQM* supported, where
get_rdt_mon_resources() tries to calculate mon_l3_config with
uninitialized boot_cpu_data.x86_cache_occ_scale.

Fix the missing resctrl_cpu_detect() in hygon bsp init helper.

Signed-off-by: Tianxiang Peng <txpeng@tencent.com>
Reviewed-by: Hui Li <caelli@tencent.com>
---
 arch/x86/kernel/cpu/hygon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 9f914bf80180..5f73bad0b9fd 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -16,6 +16,7 @@
 #include <asm/page.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <asm/resctrl.h>
 
 #ifdef CONFIG_X86_64
 # include <asm/set_memory.h>
@@ -271,6 +272,8 @@ static void bsp_init_hygon(struct cpuinfo_x86 *c)
 			x86_amd_ls_cfg_ssbd_mask = 1ULL << 10;
 		}
 	}
+
+	resctrl_cpu_detect(c);
 }
 
 static void early_init_hygon(struct cpuinfo_x86 *c)
-- 
2.43.5

