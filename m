Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9561D86ED
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906342; cv=none; b=C8oJNl/l+J2iZaVdhouWqdhl+7QVsj6zoxuazQOYGs3vsnInNDLdTacginSht/JUZpPovVl1rpmn2Hrz8jGJgEp8c8jr08bKVs1FpSavzONqlTiBm0A9BbJ9mdbGEXv8IJCb+fmuFiJHLRW1NrMsjLFvhECKPKqBbYYvPPYxybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906342; c=relaxed/simple;
	bh=DKQ8bU6Ekf424I3mrOInFztpFTcZgUHm0h1NeQbWmug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V2qzc22UP4GLzT9JU6kXtIhZCrtif+O2lIgkwk160OdNlG4TpVvf83lP8YhlKnzJ7GorQKzka9svzcnCxGAZ5Sbkfu6+6w70+j2LDEr9L27yK498V4RBUAI4s3RpQjzzyNsISeCJlEMrdzcXZv7Ldg5tPcl+iH6F+Fw89v7sKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIgv2CHW; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIgv2CHW"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54addb5a139so1119805e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906339; x=1745511139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pP2JHfGtEbeQt6MxQz+Ftq1QIgZyi2KIG08JxM2kREc=;
        b=fIgv2CHWM2m8uqO6F4RHgqwEcvp0br1aF8iUC1f7ga0GedsKADIY9bFoNh3VaR6lIh
         oj3C42F3Sp5QeuXPd7pZ8HkMRgiuzO1FzHRCjf93NNu02rb7KIgvmfDKkb2sTlfohnbW
         02G87uHQXSq9QdBDG8H2pHH6n5OOew9k5QA9wwBEF0+fcCKLgh/W/2A7uX9Xtuopoqe+
         VO+Fsnvyo0bVsUviC7mrGcw3YosElJfbr0Jn4R/ubumho+VyRpopPHXGpowRyAaXsUrA
         owa2QgWDAgqKg2kk8ltBhkgIjaKM3oafTul4jfXkbOG+5Gaena00rtlB/TnhhP3662fM
         AEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906339; x=1745511139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP2JHfGtEbeQt6MxQz+Ftq1QIgZyi2KIG08JxM2kREc=;
        b=UBAwwhEvvFCPPY+5RR9+acnlZ8O4sl3aJITian06iErVOu4PA+ut2juRe0vpMe5Lpc
         ts+aPEcaMCAjRdwuPX7NGjHiluxBNSEaPp9TbLH+G7GIccbbPo5FHatD5J6dylR5E4Du
         Z9N2kBlcuXr4WgBDM1i24uGQvlvrBlf3jW3lSxYToB+ZLfcEJvfb5Pe/lhVH9XQsbcdC
         ZGfY0/bIizyv5XjwNA5U2CaajXkb6gCIttu+j3qBznbQse5ki/DKKtk8CmU9FZ+i5X0q
         QM1rxtQrq+taJnw2hdnt/7czEwWMZJ3TuXGmWffpmNZqKAtTH5I7Mgl7n8uZ+E3pv6hO
         Uh9w==
X-Forwarded-Encrypted: i=1; AJvYcCWQWuRNymOK7jrwBsZMthk8vsC3zWZ3AEKFYaihtrBUW1Vb4yM7xRg0PpQM9X0gunD4kNYwcLKiaaQa6V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YygqURzKW4w7LZhx4kXQGxvB7cOUUNV6Eiof0bLbmR29yRVE3gF
	XljN6sQJhTYSjq0tSmYIJve/RuSdUNJdvP2KKmV2AvypwjTlKCtI
X-Gm-Gg: ASbGncvaxAOx59hz1iu/1xcIFTOUycfJ3tRA7ltfs9r/55AYTw7dHkPOuZHsqmAGQ6H
	t9MiiBIwWIvNu3XkbRQEzpR3l9VE8HY4aTRAmXZADdrgUYT/lSj94xIVXydE0KtvNiFFx67onFo
	qDakqNeiJLDXtswGzDU3ThovI+4pvZsIkwqq+8wZHGSxq3jcHWV4y5etrw7MlCR8MR99Tnf7jba
	hgL8AF0YLhX8/Bd8kiOYDCtSVpXuq++fDVm8ZMNxYW2frX1IHCoEdU2bHCiqOwr9UiWQn9UBiQ6
	IZO2cccAEy/WyKtbjZpoOAW1bluuJcxYpBqb
X-Google-Smtp-Source: AGHT+IGr8svtmU66VHJua0H8YKMP4oFA1Xc/Puv08hiW/VcgcSZzl/c2MLzMDv6Lv8uNkgabsQTkMg==
X-Received: by 2002:a05:6512:12d3:b0:54a:c514:76f0 with SMTP id 2adb3069b0e04-54d64a9c225mr2505066e87.14.1744906339056;
        Thu, 17 Apr 2025 09:12:19 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6df60cf6sm2882e87.66.2025.04.17.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:12:18 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU for setup
Date: Thu, 17 Apr 2025 18:12:13 +0200
Message-Id: <20250417161216.88318-1-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test has the initialization step during which threads are
created. To prevent the workers from starting prematurely a write
lock was previously used by the main setup thread, while each
worker would block on a read lock.

Replace this RWSEM based synchronization with a simpler SRCU
based approach. Which does two basic steps:

- Main thread wraps the setup phase in an SRCU read-side
  critical section. Pair of srcu_read_lock()/srcu_read_unlock().
- Each worker calls synchronize_srcu() on entry, ensuring
  it waits for the initialization phase to be completed.

This patch eliminates the need for down_read()/up_read() and
down_write()/up_write() pairs thus simplifying the logic and
improving clarity.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 lib/test_vmalloc.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index f585949ff696e..4ab23e5e772d0 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -13,9 +13,9 @@
 #include <linux/moduleparam.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
-#include <linux/rwsem.h>
 #include <linux/mm.h>
 #include <linux/rcupdate.h>
+#include <linux/srcutree.h>
 #include <linux/slab.h>
 
 #define __param(type, name, init, msg)		\
@@ -58,10 +58,9 @@ __param(int, run_test_mask, INT_MAX,
 );
 
 /*
- * Read write semaphore for synchronization of setup
- * phase that is done in main thread and workers.
+ * This is for synchronization of setup phase.
  */
-static DECLARE_RWSEM(prepare_for_test_rwsem);
+DEFINE_STATIC_SRCU(prepare_for_test_srcu);
 
 /*
  * Completion tracking for worker threads.
@@ -458,7 +457,7 @@ static int test_func(void *private)
 	/*
 	 * Block until initialization is done.
 	 */
-	down_read(&prepare_for_test_rwsem);
+	synchronize_srcu(&prepare_for_test_srcu);
 
 	t->start = get_cycles();
 	for (i = 0; i < ARRAY_SIZE(test_case_array); i++) {
@@ -487,8 +486,6 @@ static int test_func(void *private)
 		t->data[index].time = delta;
 	}
 	t->stop = get_cycles();
-
-	up_read(&prepare_for_test_rwsem);
 	test_report_one_done();
 
 	/*
@@ -526,7 +523,7 @@ init_test_configuration(void)
 
 static void do_concurrent_test(void)
 {
-	int i, ret;
+	int i, ret, idx;
 
 	/*
 	 * Set some basic configurations plus sanity check.
@@ -538,7 +535,7 @@ static void do_concurrent_test(void)
 	/*
 	 * Put on hold all workers.
 	 */
-	down_write(&prepare_for_test_rwsem);
+	idx = srcu_read_lock(&prepare_for_test_srcu);
 
 	for (i = 0; i < nr_threads; i++) {
 		struct test_driver *t = &tdriver[i];
@@ -555,7 +552,7 @@ static void do_concurrent_test(void)
 	/*
 	 * Now let the workers do their job.
 	 */
-	up_write(&prepare_for_test_rwsem);
+	srcu_read_unlock(&prepare_for_test_srcu, idx);
 
 	/*
 	 * Sleep quiet until all workers are done with 1 second
-- 
2.39.5

