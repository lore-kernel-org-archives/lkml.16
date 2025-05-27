Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132C27A115
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358757; cv=none; b=tSIOIxmVCIzUC4n7WF2Lbql6YzE/8EsvMsnxGT1BrP3ICP3AmG0Caia2n5t+rdDJJBhF5TL9T6fZBSN7LD6m4rOLX50CuO8tSOkRTDK+/+jX0y3tiht0GQh3BYQZdmR52SzyW9+L5UVtr9p015Sx1WMsLdzFqe5xNra2NXwFNSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358757; c=relaxed/simple;
	bh=z0+KfQ7CowDTb9WADe5NgSkGKXnUAOowgw5Krdka8pc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=N48wAR+U0bSmyWff/7rfQr6TBvIauSx25UMogW5rtK0JwCRi5SAzm2kssFuql2e+Tj9sSNp3TCyxlEYjYnNA5cEHyYt55lyTrOqpPTHQxMo9UhQEpekafDGfjS6hBgv2y4EO3xTdfb3/XVVWu20uhNyvrWPI9qJIo7JedaKadu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/mlisos; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/mlisos"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2349f096605so9157375ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358754; x=1748963554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Fmt8agHYT6RbnGM8uoRnzQd9xqFGvmEIVzXJZdCcWo=;
        b=C/mlisostCWH/yY7uKqnMqPYNM5tTaOMXRsifP7hqZhhnCf4UeR1oRAWtNQ4g20qnu
         hiIxEWoucgNQcEa3Uou/Syhl9ZcfMjo4vmfp1xrjPYzUglDpMJN93QoAa8KUWws5ip/L
         nXyRlPdOkkOYGD4JNlxY8sTmAdANJ7FDTaTUar7ydxgFD+OJTPGft8yttlCGfrMFrzEK
         J76ymJsOQMSZlZ4K+iLMYuWSWVVbN30P1lPfin3tipVkg3MgDXB0iSam1wLqDITp6JM5
         owEVphWy42X7aSVcKOhcbShVydE0G9FzovR2NiT7CJNw33LwdrUY01+k6KWY3KYLqJMY
         fzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358754; x=1748963554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fmt8agHYT6RbnGM8uoRnzQd9xqFGvmEIVzXJZdCcWo=;
        b=DLTLk9yUvUSCmdmcnFgra5qJOzcWNuNkIQR4kWmj0AG5S9eBb+scxAV4CjwHSIhbw+
         XiuseEfxpjMVJcjCiWjnFz/6cV/vZ+wxaf2RKylEkVcoK1/mp5afNfU8w4iDiotS38C9
         TpLChPA/qf/RyIMGTtgMC61RJC+R6DGV9+Zs6JMowG88JzAfb8U6gWpiMTMZ9HK+J9Jd
         BYEOjFSo7V7J7aFBZF9UzGja1pdA3YNDCCgtn4a2Y3QZYNUxaplXBydVNAlzi0Q5ZSw2
         tI5jOtI60EXrpekPHMzK+hXXyKe1MwnlS4smUZvHA+VbDlCLjZn5ZTbpbSx9KEerdFA8
         N+Lw==
X-Gm-Message-State: AOJu0YzG/ZkwGbX4DCFQ7UazMIQnvDhlFudhS6VF1nN5PsX/p2T3MwtY
	/RRZQoIl8JKwCZBkSK3VOZDQfBiOx6NGaOZV8BiKXZ/96zOVubiBB4fg3vNx4w6YOlbVrw==
X-Gm-Gg: ASbGncuDOjwnIvIqgTV48/zugNgN77bC0BVWoApDAXtfdr2wUImItO03UwWXFUwNBLh
	ubGmA+qY/js1AillgmE0QhQLSXx0zwTZenGC7Adp7e728I9nQ1R2RyQXG71civVuyeOm72VCrh0
	Pw7xBFeoQHd2IWcYOUIa9S+xz/wUw2jwOfKigzT8IsKfXat2KVn8gaVNJU+s85J/ea2yyRayvYA
	vGj+A29bHp6vfuKT3bxJPfJ88hiLlSJbXFYmbR9d0ZZEqgWblIjZ/zsiHnw09diEL8c7cQlAyhW
	9U2kAiCG2P/1fVLz5Sb7IcrbZElYCpJJuuS8WCJmnfP1uVUrxRnUOVQC9nQJkhUoYmq08DoCSDr
	WcKygyLHYHnQx
X-Google-Smtp-Source: AGHT+IG53BzQgnPuTX7yS/ekoeG+gQeIY+BAQPv39+PEudE8cMO+ljYRQJ2b/zfrx4p8d2LSYQedGg==
X-Received: by 2002:a17:903:4291:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-234b44cd695mr12284165ad.37.1748358754171;
        Tue, 27 May 2025 08:12:34 -0700 (PDT)
Received: from H3DJ4YJ04F.bytedance.net ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2345c3bc990sm38181255ad.31.2025.05.27.08.12.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 May 2025 08:12:33 -0700 (PDT)
From: Yonting Lin <linyongting@gmail.com>
To: richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	tiwei.btw@antgroup.com,
	linux-um@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linyongting@gmail.com
Subject: [PATCH] um: Fix tgkill compile error on old host OSes
Date: Tue, 27 May 2025 23:12:22 +0800
Message-Id: <20250527151222.40371-1-linyongting@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yongting Lin <linyongting@gmail.com>

tgkill is a quite old syscall since kernel 2.5.75, but unfortunately glibc
doesn't support it before 2.30. Thus some systems fail to compile the
latest UserMode Linux.

Here is the compile error I encountered when I tried to compile UML in
my system shipped with glibc-2.28.

    CALL    scripts/checksyscalls.sh
    CC      arch/um/os-Linux/sigio.o
  In file included from arch/um/os-Linux/sigio.c:17:
  arch/um/os-Linux/sigio.c: In function ‘write_sigio_thread’:
  arch/um/os-Linux/sigio.c:49:19: error: implicit declaration of function ‘tgkill’; did you mean ‘kill’? [-Werror=implicit-function-declaration]
     CATCH_EINTR(r = tgkill(pid, pid, SIGIO));
                     ^~~~~~
  ./arch/um/include/shared/os.h:21:48: note: in definition of macro ‘CATCH_EINTR’
  #define CATCH_EINTR(expr) while ((errno = 0, ((expr) < 0)) && (errno == EINTR))
                                                ^~~~
  cc1: some warnings being treated as errors

Fix it by Replacing glibc call with raw syscall.

Fixes: 33c9da5dfb18 ("um: Rewrite the sigio workaround based on epoll and tgkill")
Signed-off-by: Yongting Lin <linyongting@gmail.com>
---
 arch/um/os-Linux/sigio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/um/os-Linux/sigio.c b/arch/um/os-Linux/sigio.c
index a05a6ecee756..6de145f8fe3d 100644
--- a/arch/um/os-Linux/sigio.c
+++ b/arch/um/os-Linux/sigio.c
@@ -12,6 +12,7 @@
 #include <signal.h>
 #include <string.h>
 #include <sys/epoll.h>
+#include <asm/unistd.h>
 #include <kern_util.h>
 #include <init.h>
 #include <os.h>
@@ -46,7 +47,7 @@ static void *write_sigio_thread(void *unused)
 			       __func__, errno);
 		}
 
-		CATCH_EINTR(r = tgkill(pid, pid, SIGIO));
+		CATCH_EINTR(r = syscall(__NR_tgkill, pid, pid, SIGIO));
 		if (r < 0)
 			printk(UM_KERN_ERR "%s: tgkill failed, errno = %d\n",
 			       __func__, errno);
-- 
2.20.1

