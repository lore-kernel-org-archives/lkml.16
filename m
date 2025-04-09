Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE8925DD13
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218931; cv=none; b=dljginRT39hbZwRMY0+zNPGCKMxjlamV3sfpTgWyKrjRBciXog9Dh17LrO7m7roSNV2FBtQa3+jsHFgNUBtr4m47qVHqJWZy58omXX1QSRTanB2Jb2pdEKNQY91bxfzkS+0gR0s7HQM8BqYC+/MxroGpyGmw+o0OJ7W24i+aJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218931; c=relaxed/simple;
	bh=QRxjj5F+slBXQJGNNkxhcfZmbfBRioGdxML+0WkTzBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNmZwxlQCUGd775NgKwr+nWfV8dX+UqTDLRVJrnkyNurJosUMe/2iWGeexb1Ya21WAoRklKhnqH90hs1TgHE05SOwZC9sYlqxLWhEKZqNi/mgpTVU9XLZO/EF0fhIses7lx0e/EItMK4VUumzJjrmXJzYIlt5nzcpJ4ddK8QHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=foJIsHaN; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="foJIsHaN"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af590aea813so1080934a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744218929; x=1744823729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGPJJbzAC5lBZyjwN2/E/DuVXerJO+U7adFkynbBdr4=;
        b=foJIsHaNEbuWuMPPKbNbwD/IaQ1tW1rTR2kXm1/10EBWHb+32YDn/PjJZQ9GEfac/Z
         4kLAS31SRhmXKuAo/J09A3O1flBA554FdCyC4yXLaTbHSRkT1kmMGh+vcyyJ+UggBc5K
         N6WgrkGn1ivTuBq4Wrb7paa3uQI9qhnh0wlCwjvrZmy5oOnBMq2bfaAsm4cK2Yti6pJ2
         wxnqVI7rxQACzJON+uGtOFKa79ThPajKGvQKPoavJCn9sdhqEqLynuCRp5NLf9uLiuBq
         vyOOsYV8PPGwMAlFGnrHkT56Uhc8rN2NPTUcKGSplrYV6yFvhYlK9bdVs3tmI6bE6chn
         0ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218929; x=1744823729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGPJJbzAC5lBZyjwN2/E/DuVXerJO+U7adFkynbBdr4=;
        b=CVCFUxp87nHXZq8PQBwBW3eln0E53ZQe4MahFAFWPD7JiwD24TLfQU+ky7d2QIA1z/
         81W8qcbVPrPuhz185cXDVySp+A3+lNG99WZnOXQ29XoqW9QDW3SbYuJurYFb/bLzCDGe
         heMZrFXxSuBYtchYjsLcN4zbhMUWIAmhNtXReSbzDqwXX1R4f3fVjrOSTZyQxJK9HsZH
         s2E7hnaPX+KPuSPdbkypNp7N8sAcXgkl1sdZLybi7uVhmH8hzsUN0Fvv/PAQwkkqEqWO
         M/3sIxr7X86WVMXzifhGBeEhj1FvJcijqEHEoF0lwcQEdULQkxM2tTdGNLKBmjhGrfG7
         DyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWACGB9v6m7YHBN7ttiv08z/mrnAbPLTSQGO328cuVzwLslMcbOv8CPgd6XBOQst9Cqj/j76GY+NgK43rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwxFQ4q74vypxcIsxtqeBp4IAIu+433IhtWVyrNmVFp6mg2cE
	S95r6jOPRYwuyBkV24grNVfQG1cBKQahjMME//g9A7k94umfcAo5pRwntVt3MH8=
X-Gm-Gg: ASbGncuOf6ggIq4xhvCn36aDaoUMDhy2NaK7eh6Y2ssIpZG5Td6kju2Xh+N4MBdtXav
	G5xwNt+qPRXIm/oYucrbM4Ncf2Q+jQFhglhbpsoLwg8NustmxnJ/XuD9Rz/MdadQyiiXB11dk2Y
	U5fEZ5x3SeqRqcLATMidnXXm7VtyFsrlm+Wynib6w5i3ZbJNs20gBT5y6h3QzCUaSJnhXxFi5AR
	V5skOKiFyZY3iMtl/haAmD3XAq9hMMM+ZHsrhHn7Ez8UXJfTAIMp2IhgnLqkAQDSrX9jf9HfPBb
	SRPUQYBmucnxWC0THUNnk708EcOQzDTXRWy60+fudDdXWXLPHHRNV5UkZfw+N1gpfQk1ATIPfA=
	=
X-Google-Smtp-Source: AGHT+IEqsyTfYHLCje1zAIyAh5//QPvZL/dx0cm03t3noxDSF5dYrGFWkuIW3HvIS7cUU3Gq7Cnmgw==
X-Received: by 2002:a17:90b:5488:b0:2ff:556f:bf9 with SMTP id 98e67ed59e1d1-306ec2077femr400073a91.4.1744218929505;
        Wed, 09 Apr 2025 10:15:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm1721650a91.47.2025.04.09.10.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:15:29 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: module: Allocate PLT entries for R_RISCV_PLT32
Date: Wed,  9 Apr 2025 10:14:50 -0700
Message-ID: <20250409171526.862481-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apply_r_riscv_plt32_rela() may need to emit a PLT entry for the
referenced symbol, so there must be space allocated in the PLT.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/kernel/module-sections.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index e264e59e596e..91d0b355ceef 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -73,16 +73,17 @@ static bool duplicate_rela(const Elf_Rela *rela, int idx)
 static void count_max_entries(Elf_Rela *relas, int num,
 			      unsigned int *plts, unsigned int *gots)
 {
-	unsigned int type, i;
-
-	for (i = 0; i < num; i++) {
-		type = ELF_RISCV_R_TYPE(relas[i].r_info);
-		if (type == R_RISCV_CALL_PLT) {
+	for (int i = 0; i < num; i++) {
+		switch (ELF_R_TYPE(relas[i].r_info)) {
+		case R_RISCV_CALL_PLT:
+		case R_RISCV_PLT32:
 			if (!duplicate_rela(relas, i))
 				(*plts)++;
-		} else if (type == R_RISCV_GOT_HI20) {
+			break;
+		case R_RISCV_GOT_HI20:
 			if (!duplicate_rela(relas, i))
 				(*gots)++;
+			break;
 		}
 	}
 }
-- 
2.47.0

