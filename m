Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D141EE7BE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626719; cv=none; b=XYoR6eXYxzXtn7pPWTJPCZyZBWv+x09B3V8qC9MyXoV3JbMjkpVqcKgsBdxy8NzU9I3IvsUAqJwCOEHQkSErCFNg/ilzATzwka2grS/bTi3zTO5qWt4M/smEZdTepEEjSwwCyiQpSs8QPmDq0YVt9/tUPLAkZ2IS10fbvYOlpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626719; c=relaxed/simple;
	bh=VaI8aq74Nqv9p3y8XOaXLzBZA8RFVxreOkxuxfwYtvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYqQPZtx3HmqjjyqCfo6OFWqIZPUi+vJd3gjHguoLjdTNF+hS3UAtDkQEZwHsDFm1XmckYHBeDGwrb92kq3nY6d5SiKbBC95lPQbdeP/lkJVdazbweUbr+w6mM5tbUND0OixDt4lghoEbkfObZtO1XemYIwAhr77KEU0S1s3HDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz6dgR6h; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz6dgR6h"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45024721cbdso54026525e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749626716; x=1750231516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qasR/xzNnuPv0kwC7p65mEC+lrSXEVjjhj00Fg7h1aY=;
        b=Pz6dgR6hvueal/ENuChl+7vhDJfk6piDj0E2xJa+3hFdq9f+2OLvX2d2QWxjbH7C/Z
         TbLSW2hwzwlVg1EXGS8Ar/9bxVDGwTjx9DJtpwHXbkj1AcbXmzUmIBhfmU3bKUG1GtND
         AgKcrA3TiKzhq7R8tqYQWxlCB81j1QxYUX2QVZ26Mex9+A1iC16xm7QOIBrHIYQy7rdI
         tEp6/KE6CnE8u+2edL/hhIYZu048XlK+5iRZbUS7b9VDkdNEfxlmNkCyMhH4fhhyKeNj
         77PRaa7s31caFMPHhyHac60mBS2VDJpsWhKmlw0dJiC5sANhdXq7UuCrBjt4p7v0DNMW
         3FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626716; x=1750231516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qasR/xzNnuPv0kwC7p65mEC+lrSXEVjjhj00Fg7h1aY=;
        b=du1wL7+G+YiBETTQVMEHEdXC3IMfqBOaaWH0gJSRgOjCI0piJ2bTCxuifPKFloqBKU
         XXBQkQXwJbfJ4v84QS2RwHE+dREuR8yl6cadfPMuDppK0ii6ex/bVScQSX3SV4a9acHP
         NXj9x7byqY7L2LIQqyG7xklQNZiZoQhfypZNrYv5BrcuOO1ZkE9O3qPP9v36znzZdHGr
         2gd3Ik4tlct4g7aBkYexcM32CPCl0E9IjIk4o2YacFwDcJ0aNBEJsByOJgFAQcMCWM25
         gk62DISk1nLbrdVIkbcFkliSW9QDnloQtTKepDCW06wAhl/GKfsW3dWGPYJ5sDt1WpSo
         SxcQ==
X-Gm-Message-State: AOJu0YwF6B0YkN03fq4H9SY/+yzZAoX+hNzISi3jC9BG9Boq8Hic/NDW
	tFut9KI0s1Yzou0mIdqpjn+NeARL2z+1Sq3jPPhpRqQ7Ga/sn0+Lj2/6
X-Gm-Gg: ASbGncsJ8lQAmSWKtmmMUmvAwbSlMp9i8m9m+oSZQualV5c+itAAwB6i34ox2HpZOu6
	+Tyyg1yenrlEdj/lBt/vjVkQ/W1ObjjuePN3dPNQGAHhERbtdkOzYPwhVcTxZPUvpbXzzjIzjyt
	obA/xbs4BlZjpGyZI1d3m9dIoL02pc1O7KuZyHActe/V5N6KcGJPXcjN35pkLJs5XeOH1gga+FY
	AtTzsgvLmKhX9zmnolrf9niQnsN/N2Bo99UlJUdRHUMAM6PUbsnR5x2XfgbHm/xPUIfmCgqflLf
	nbyZkRz7CNjzzdCCZTzkMCf736aWb58Sw35MT+MMnI+qu90d8W0BO+e3SKXsrykGKxRU2WhALE8
	t
X-Google-Smtp-Source: AGHT+IFZN/EuwNGQth067co4VWMXoN7DK9HIHt3DhlxWcJcdI/9Da2innRCV0Wd/anEzZLWhYlNTOw==
X-Received: by 2002:a05:600c:3583:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-4532487bd82mr16309545e9.11.1749626715448;
        Wed, 11 Jun 2025 00:25:15 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ae18esm14747962f8f.33.2025.06.11.00.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:25:15 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] kernel/entry: Remove unneeded header "common.h"
Date: Wed, 11 Jun 2025 07:23:48 +0000
Message-ID: <20250611072400.4376-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syscall_user_dispatch() is part syscall user dispatch and it has a
header already, so this patch moves that function to
include/linux/syscall_user_dispatch.h which fits well. In that case we don't need 
common.h anymore. All functions related to syscall
user dispatch are on that header i mentioned, so this one shouldn't be
special. We need to access the function from that header.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 include/linux/syscall_user_dispatch.h | 2 ++
 kernel/entry/common.c                 | 3 +--
 kernel/entry/common.h                 | 7 -------
 kernel/entry/syscall_user_dispatch.c  | 2 --
 4 files changed, 3 insertions(+), 11 deletions(-)
 delete mode 100644 kernel/entry/common.h

diff --git a/include/linux/syscall_user_dispatch.h b/include/linux/syscall_user_dispatch.h
index 3858a6ffdd5c..6fffca47b136 100644
--- a/include/linux/syscall_user_dispatch.h
+++ b/include/linux/syscall_user_dispatch.h
@@ -48,4 +48,6 @@ static inline int syscall_user_dispatch_set_config(struct task_struct *task,
 
 #endif /* CONFIG_GENERIC_ENTRY */
 
+bool syscall_user_dispatch(struct pt_regs *regs);
+
 #endif /* _SYSCALL_USER_DISPATCH_H */
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index a8dd1f27417c..e774dc9e7eaf 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -9,8 +9,7 @@
 #include <linux/livepatch.h>
 #include <linux/audit.h>
 #include <linux/tick.h>
-
-#include "common.h"
+#include <linux/syscall_user_dispatch.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
diff --git a/kernel/entry/common.h b/kernel/entry/common.h
deleted file mode 100644
index f6e6d02f07fe..000000000000
--- a/kernel/entry/common.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _COMMON_H
-#define _COMMON_H
-
-bool syscall_user_dispatch(struct pt_regs *regs);
-
-#endif
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index 5340c5aa89e7..b88a4b546d70 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -15,8 +15,6 @@
 
 #include <asm/syscall.h>
 
-#include "common.h"
-
 static void trigger_sigsys(struct pt_regs *regs)
 {
 	struct kernel_siginfo info;
-- 
2.49.0

