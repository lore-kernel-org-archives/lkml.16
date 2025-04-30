Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6361DE8A5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987281; cv=none; b=J6cdt2a05WNhtfwqotKCVMQTE9s67KNJ/H/D3VxuizxWOBmnJcQsY/dXt9SQrd7zL0A5O4gkEG02A18SVe/GgdCpeXBGcU1IEb7hWTHVzordh9y2nnxIMBcXpJi/PqQIoOuMIywpb+otREIVZrbs4PCZXd7qqIjhlt7+Zxw3TG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987281; c=relaxed/simple;
	bh=YUEZeH1TUt8vhd5nOMxaCkzJVaWiSM7ZZlNxkfxZqDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcAYPOvU/XW4Na8qrBG30yX7YTrsmmvUv7cI22Pb/5xfLcrpKn5XnEecrJfcOXyImPNZN2+E2KHi1GHPhX4Yy8/1mvuJcfx9qcIzIzZki2ZQUE4PrDU5tyfZCNVFiIuPLSBxwoafRh3oPYhXuQZS551BuOygw+SwAN+Y9dUmzfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk5QfAJf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk5QfAJf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af908bb32fdso539654a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987277; x=1746592077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G7VVQnGQtrb3sGnx5GNm2Y3zP47y1QHGJfHFp/BsUc=;
        b=hk5QfAJfwJDlCTf9KIVQWjWKRAPkbvLDvdT/CUoxpOOkZ5cBViAZTjDozxRvY7ahQI
         iN8ZqJh3coyStUmzBZo9yhI+OztBGKaKNf7Ymzcelk+aMtPFPRt1mQ4kEZ8TZ6OHmBsu
         +s6RuHGXalvMjCJgOZ0Tsb4fVFSwtxar67L66nDXwGBZrWux0zOtHJHzuTiy1xxkr9wV
         aTlZtkB/8vo7MKSX+4Hv4BxinU4AB5Mik6vjvUjGxKDjA5tKZWH18grInK7Ghhms15a2
         FK3sxsN/RjOuOJLJtJItHUJRaYK6DuE6N7iOV5R8Xd0RUJkghFryq8uhcOidx0kG4bxC
         MV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987277; x=1746592077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0G7VVQnGQtrb3sGnx5GNm2Y3zP47y1QHGJfHFp/BsUc=;
        b=wpeHU/fUo6wJYicYVA647T5LihDwnItWPpFDWjEkO/2MEZbBqvXa8D7wZC38dmjE4P
         cP5seThi2XUPk8z5bYrcuqefg1AgLzzIrSNRy4B4DvROOMlcLWZ/O/dYVJnWc5SZqR9c
         JabQVs+y3CAhgxt+9ho9iC33b6oIMzjM5sn1MyKU7gSKWAUmB430BDiTaXLbmkE9jHkH
         Lo23PDfKgE4hLw+HkF77nxEtPsUPlgbb587gi68M4+tXlx97oTYgJq1tOZn9PH45cP/f
         0/esBoCqBqkzWGf5mb2K/pV34W0ONZyPsoZCoFcK6DxH6j5IuS2kPC2ObgOHi0ATU5+a
         mYkw==
X-Forwarded-Encrypted: i=1; AJvYcCVhmW01GQfA6BoOpgPdy5kKHrf2Q+aiFL5NDXOlopIdRDvF9RrmV33fkHrgSlpMCy0iCLmSEeWA/qbDAEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXCnI3srlm7JhgWI9hFP3EZgHXM1sKSlCmu4rLfhljN3HgFtQ
	4Lg+M8LmAYKZb6EriVBg+/NydXpy5pR7ozrRlbVs59AKz8ApX/PjS1VdqFee
X-Gm-Gg: ASbGncsV8P7pxTYPatjLLr2lK7/7h78TXk12y/6CeOyMq8FbTYZX9meAPk+iKhaB/kP
	DelK4xpBS+uxWsjeX3jzAsJq57u6p1oJyj7izKuMdVwET1BRq3sp4YaysMM9S17mhz41HkQk/gM
	lQgg/3Cy8/wisNOpjACG9QyONkri4ug22m6SHeEKPBG+bWcRimnMGRDDHLhU6SXpdtEEqCCPyz2
	Lq1BAiudDnqaVTUtV/9p3QanGP7UaYLs6rHUJoPbRM+8w8NvubB4DmsZbXfjFH/sVxWs+DcvFcF
	i5V7uh6QALmLA0iQn3RpyU6tDErVC+5NFqfJLx5dMUkzO8v/24ZaCIurfKXCqkMPkhEd34YlMQv
	+WttDqCgNyEo=
X-Google-Smtp-Source: AGHT+IECA9Apxbc6D2JhVwEUhYdUmhJiBYci0GxbrvHA3yJvjLnYDlridKGWIXBUNgsmhrFM8ye3SQ==
X-Received: by 2002:a05:6a20:6f0a:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-20a8e173f9cmr2155932637.1.1745987277300;
        Tue, 29 Apr 2025 21:27:57 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5bde6sm609398b3a.127.2025.04.29.21.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:27:56 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 52572E94822; Wed, 30 Apr 2025 13:27:55 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 08/12] x86/um/vdso: nommu: vdso memory update
Date: Wed, 30 Apr 2025 13:27:14 +0900
Message-ID: <1670b88c2196a5fb2a6eed90c7a8714f03c040a7.1745980082.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745980082.git.thehajime@gmail.com>
References: <cover.1745980082.git.thehajime@gmail.com>
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

