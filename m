Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E602222CA
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628018; cv=none; b=CPk7BCF+LTVpveCbayWhwvQ5OOELdlFlVZx9WTdZUDrWhOxW7BZr/e74uCL8j/GclOS43XZeToam1dfLrzyKYd+kSK7Q+5lYULTGuqNfIz7qF1fhHlG7CN91mLVaeDQ7DlTftPKu4fwV5dR5Tobeh+NQHb/xLXxlrWKLZB38/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628018; c=relaxed/simple;
	bh=YUEZeH1TUt8vhd5nOMxaCkzJVaWiSM7ZZlNxkfxZqDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hq4hJh6YBfpSYSUAW/Q7MB92UFmX/oFGFljoiKtFk++S8vNtNhUdPYnla1/0AhACu0iapXUkjlf8v4KZI28mYa9qlX58dKjgGATgYbqUN1FmX/E+CaobFT5aLFzuOs2wiiIg9V9yewqk4xDmuJYf1P1GQngJFxHwOwFBxBKZ4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSiNF3p2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSiNF3p2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748feca4a61so1820805b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628016; x=1751232816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G7VVQnGQtrb3sGnx5GNm2Y3zP47y1QHGJfHFp/BsUc=;
        b=hSiNF3p2fzghwqtCVgMG98e69P2gbeBJCsWESQhtkXNm21ewsb5ty1UTw6Q7/80xbg
         n+KLV3VFqeWEgj/6Raef72bKmO4tfBWGy7XCLFxXU2rB6UWMxKyVneXi9grk9udPTPx0
         hZYL/p7+hc3RuXy5HkBMDEwddSlvYD2wG4oO1mi+7MIP9TaoYMiV0STfDYUhGclHnXQr
         EoeIZ5urg99SyM+zCQb4hXulOnDMZDq8NLFUXS8v33zozlkDiwCMcwyuX2O0Qe/Uesrb
         WieQWPIBwTA+pNW6GDocsqB5hkj4allGuEVGGvGbRvOZBbu4HSJwW9Q7FvnVRQAzwx5c
         lCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628016; x=1751232816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0G7VVQnGQtrb3sGnx5GNm2Y3zP47y1QHGJfHFp/BsUc=;
        b=U8RrFpMbNMAxzvAWJeJUzLStIu4s7GwL8swITFzp6HB90evCW9eUmxtjGt9Rc71cxe
         H/EdllLpGJnstQGNEWQCmvkZBflv4LxBP1xoL1xiou3fCI+PUClLswO84pwv4/SuTGXz
         y58n0pbuVMJRjCBpLxekDJ1SyARY/QcO1FGP1GaCWq09t7F8LY6ZwU4peJWf1TzsRbiQ
         T2gSqlr/MM8UiMBMVcNcYnbZfda1cqm0q7UGjCNc4uncs1ohVST8k8QG9h5EYxQRvixv
         66930Qtx+gnfQaVr8nDwBctd1xLh3Jtnp0NMB9m4mvf6LIkFx+RJ4H5M4vMuq1U35qUM
         1cyA==
X-Forwarded-Encrypted: i=1; AJvYcCVGjmMe3157xE3VqQFbKNvfGxA9Q4M4U0wiRFpa+a4c3RFiBg2y55M++CNkoF/KE7aliCUKutKZJfRqurQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DyyyGaEHlQNDyXjJ+1FGxlDQkOKSGzROwnCtHoxDLw2mshUo
	psdpmP+1V7911YGThxIXyyvt4A6CHJlBzxL+KSupHEUi0SOV4RshS7HQOcg2BA==
X-Gm-Gg: ASbGnctRV5tQW5xM4b/3epTPTEor3samling/XnJNmM83KPNOISCNotJnLYAKw3kzdb
	98ExfbKRRfgDYCF7K8+YeTMpYiLYcTtV44+yQ/IdO8MyCpdwsOwVBmjVfMJzO5HWfrwWtlOm+Se
	L1dLMwrN+4uwRKdSD4uTOF71KzrCSWW7tXQrL3jynCeUHngCEThZkLiP/IKya684DdAJBjO2h2j
	ju0JrFRUuq0TL8018VSUqvHsWcZjzk5GV6EspL5HKKideRZ7R1sytZzb5wmHO4qj7NSyGzoY4hK
	qAUkj45cMSz718qYMoukeYCQNTp6+njSkHekhGRMPXylOAym0Bm7SRpN3WorwBEBULXsC7hVBiS
	tKtp8tKrooos5gkUec37OWR0aKnmpAZpn
X-Google-Smtp-Source: AGHT+IHrrJwTveE1DrjrmwA8iNFWeSED2zb/Yvu8dxfkj2CbC/FxRJjNGr3E1Hy0RND7HchK71ZUmA==
X-Received: by 2002:a05:6a20:431d:b0:215:e818:9fe3 with SMTP id adf61e73a8af0-22026eb0730mr15937527637.27.1750628016251;
        Sun, 22 Jun 2025 14:33:36 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1241f20sm6274763a12.45.2025.06.22.14.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:35 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id DEBEDEF1EB4; Mon, 23 Jun 2025 06:33:32 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 08/13] x86/um/vdso: nommu: vdso memory update
Date: Mon, 23 Jun 2025 06:33:06 +0900
Message-ID: <0b7d3061a6053731b9499d6a1e373314ef9f12d0.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On !MMU mode, the address of vdso is accessible from userspace.  This
commit implements the entry point by pointing a block of page address.

This commit also add memory permission configuration of vdso page to be
executable.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 arch/x86/um/vdso/vma.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/um/vdso/vma.c b/arch/x86/um/vdso/vma.c
index dc8dfb2abd80..1c8c39f87681 100644
--- a/arch/x86/um/vdso/vma.c
+++ b/arch/x86/um/vdso/vma.c
@@ -9,6 +9,7 @@
 #include <asm/page.h>
 #include <asm/elf.h>
 #include <linux/init.h>
+#include <os.h>
 
 static unsigned int __read_mostly vdso_enabled = 1;
 unsigned long um_vdso_addr;
@@ -21,14 +22,24 @@ static int __init init_vdso(void)
 {
 	BUG_ON(vdso_end - vdso_start > PAGE_SIZE);
 
-	um_vdso_addr = task_size - PAGE_SIZE;
-
 	um_vdso = alloc_page(GFP_KERNEL);
 	if (!um_vdso)
 		goto oom;
 
 	copy_page(page_address(um_vdso), vdso_start);
 
+#ifdef CONFIG_MMU
+	um_vdso_addr = task_size - PAGE_SIZE;
+#else
+	/* this is fine with NOMMU as everything is accessible */
+	um_vdso_addr = (unsigned long)page_address(um_vdso);
+	os_protect_memory((void *)um_vdso_addr, vdso_end - vdso_start, 1, 0, 1);
+#endif
+
+	pr_info("vdso_start=%lx um_vdso_addr=%lx pg_um_vdso=%lx",
+	       (unsigned long)vdso_start, um_vdso_addr,
+	       (unsigned long)page_address(um_vdso));
+
 	return 0;
 
 oom:
@@ -39,6 +50,7 @@ static int __init init_vdso(void)
 }
 subsys_initcall(init_vdso);
 
+#ifdef CONFIG_MMU
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct vm_area_struct *vma;
@@ -63,3 +75,4 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	return IS_ERR(vma) ? PTR_ERR(vma) : 0;
 }
+#endif
-- 
2.43.0

