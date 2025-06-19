Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB191FAC34
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295093; cv=none; b=J7/ENP6ax8ERQtnS9dZYjMgg7l4W/W1k9oQFSob5bkUgrIqBRwNFd+FjcA3k20UpBEJ6UqMW1zNgytdBGwrFFlqjnx9C+l+o9UEPh0wv3JLY2j3HycTvxjoegkigMbGqvAFXOym5eJ9/E5yB6mm6ayRctb0q+OG/WWDEgSBDDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295093; c=relaxed/simple;
	bh=YUEZeH1TUt8vhd5nOMxaCkzJVaWiSM7ZZlNxkfxZqDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ms47E0PbdDte5HIJTNhUNFMDoNofjCiQR5+mfoW03+SN+QJOYTzOId5ZInWy4zh+V1RVQDYGciiGtWEfC65ZoTIkVlj0QppM/y/2gTww9PcKyKSlccbX2oLoRDaHgVxX53OKx3wdFH/h02bncwHaGqf5MBap6GWD1/EHwvt6iXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWMv+dlb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWMv+dlb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so153043a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295092; x=1750899892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G7VVQnGQtrb3sGnx5GNm2Y3zP47y1QHGJfHFp/BsUc=;
        b=GWMv+dlbqHDc90BMa0qyhxPV1l/V164WnFnh1vB4IQrSyyRC/joyjAdeSktfNd91id
         rmFXV0gurkO8MjvvkUwsbbHXtW1KVdcJreTQSiZb1DZKUbJMmaTQxFQj8u1XN3qNG+Rd
         V8ioiWvyu2DQEAaUb5Ene+5hBJ/kaZSKDxJqciPN0wLreH4+Vn+VXAQUxgj7wIIWbkxM
         23Il699pFGcri7hTKb1rLv8A0e9EuQuz4s8TrXzqt1m/WXPGGOm/d5UXCjJhi5F8RaQw
         EcIkkrIxjKXMk9XL7Fs0TBtuVzeR+hQwEvCLogcdUyF9QIIWZglegAob18Lo29y9A8Ij
         oT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295092; x=1750899892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0G7VVQnGQtrb3sGnx5GNm2Y3zP47y1QHGJfHFp/BsUc=;
        b=NVCInRDIK32zCOFbt1J54EwuJo1KRM0v0qPFhrUQ2G51QWf+var36AMY3wSvGnd3YX
         vYhdobHOyYDaLjz9/6TnEUmHA5U71T7UuXBZWcllW4N5F6boEFtsqPtXhaHQ++EW77jj
         CYL5/SgVMLH5OMg+NedS9/oAezTMDA1MOscxkB7270js4T1ev6ZAaBvkqmAkCSgWWSfQ
         5/nUIE8vVskJ9U0jeiM5+EwwNDH+4/9f+SiyyQoBLZgIddPMFXiRaFK/gxAc2bmsF3UR
         nHyYzTF+S7Au/cWOpuQnMNdp7WxvmmJ5g4l7RPpA4lvWgeztbQ2aYAd+ttKRGX1lzM6+
         r4cw==
X-Forwarded-Encrypted: i=1; AJvYcCWOXPj1hSvm7HzvofLx2j1QVhNeGckkIGWNUnFZaSbyn+wNIZQfiamYB6DE2OlzI0pWgYeK9WqFEobUinc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpAjDLK5rIuuwF/Y4WtUpbLdRVTDdRWa35u/7iboTjRGdj3Ong
	eSjMkD4nwgw7rnC2pQ60c9xje40IPXPl0qACM334GwCMaLRVKndW/++A
X-Gm-Gg: ASbGncvu3GLsDQhyHHFybLkeZVY1AU2J7aaKiKfGEKvjknFRsHsUMJgqBDxoIBYu0rB
	3doJA5auJVH1JNRxrc++gf71pxiPDEYRlinyTkuJ56oB73RgRptEHwVXpvPopwUPP8ohua64Ut6
	EuKUfQVP3jmh8beyhNYE8N8JIQj5USGkhz+rNgdSga2raRBnl7oFdF5yF7vtyn8nZpcwuUrGpK/
	7z31CaF8WdozothEdPbZGASs96T6rwW4SDlDnzW0syWRrzrbmzf+qDCFLF++pHYmgKu+HhnClWW
	Prb5wuJdgH939UJ0SDCkz7hsswnJyTXo03j4DhoPioROeT7wWOWX8GGsPe06QbLm02aEXyv+hXX
	PLAKPN7p3G0eIEP5Zz3xmEZGLLJznPblW
X-Google-Smtp-Source: AGHT+IFATU8cH8BDAswTDg8t16Qex6ZAiu2Oi4jWZUV6j/DJuzeYMglD71cpXwlvvkHyyfeb+uGavw==
X-Received: by 2002:a17:90b:268a:b0:313:283e:e881 with SMTP id 98e67ed59e1d1-313f1cc5abbmr29510777a91.11.1750295091595;
        Wed, 18 Jun 2025 18:04:51 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a25617asm840600a91.33.2025.06.18.18.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:50 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 26684ED6538; Thu, 19 Jun 2025 10:04:48 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 08/13] x86/um/vdso: nommu: vdso memory update
Date: Thu, 19 Jun 2025 10:04:12 +0900
Message-ID: <207204e01eab3318e475f80be9fbaece51dd13cb.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
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

