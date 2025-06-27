Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C621C9EA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009395; cv=none; b=GwYcn0IzdJik6TJrwgibwai7EBVvIRx2GxkmVhCGM6ydd56kizssNAmxCy0UkPbPdsp2W455Vh8Oj9Kgc9ZGD14BeOYUsJ9WcOD86SypLaP3oopcKf8egpi1gC5T+lTyeEC1ffPdLLgznW1+d3oqZLRAOQAurTK/5/Cqqf6n/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009395; c=relaxed/simple;
	bh=D07LL7FI3Rq7CLxTrZdx2gLhFRY9YWPapNFxE1JUjXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2JVwVRCEDA9puWg/RlC2wGOTwoUirwoqzGybdPwcfSQTML7eeLFh0BZGl7FmzlVhBrR9sV2XAfWaLcxxA440GAoLSIN2NVDCIO0ChEblXJhXrY7T06qXH50tLXUS4WnPFP8+cOwuwuhHhmMlhbTuwQfvq0FPQoQXswVXeAoXZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVCfB55M; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVCfB55M"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54690d369so1646890f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009390; x=1751614190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGwVQ5Flc+D7Cd++9w3V1W8ZV4LDw0kGbLT/w49WWjo=;
        b=gVCfB55MzISyGR/QERvnTLkuWLTfoKv/dTwQBAyC+ZhZu8QJ47MI3G493UxS9zIKLp
         A13dn1ywTzzR7QOAC44hdzXT2/SZqMSHR0ZvGfZrIrUELJ7MlsUHPC5oYYZh0TEYq4GD
         a7awFM1NqAZbVaOjxBMS0bq/UbRVpY5uuCmh9aQ2cGbffHkQ+/fFEQkJJGt+XUeC1EXW
         GgENs2JXXZBHjsfP60ilrKmgOFF3H2mnNj80W5RferHNO/fM9jTW1ES0wgfP52r6IKVZ
         U4R+Ogtsjnq7bWZq5MjJVwYUtO4r8eH+Q7oqSe0+O7cOdkY6BsFrT5dq8A75JMc1FC31
         fDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009390; x=1751614190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGwVQ5Flc+D7Cd++9w3V1W8ZV4LDw0kGbLT/w49WWjo=;
        b=bIGafk7BwyRZd8pfPSmGGhYvzCIa1u89yEy8XB6yRjUeJ7bjHU74IfUMapJypAttn+
         lug7UULZL6sCea7ul04I96U4BFjHOhg+E/f3cbAb5kegwL7YqOkD0eWrEwrX71bd2xaQ
         2iEFD+iYS6lIEDJadAvizMF4k8XpFPiV6VrC7rh9sIf9G/wes1KWN8M+iZF5ZB/Z7niA
         L0OwMglvmh5bZ3fr4ge2iV7P6JFWOKiPrDsVBTZLGrMacaj8t7v/U7vHjAzZmCtvRBF5
         mQr2c0/ZBMWdGrLMrEoipiZ0qTiN3MVdSNPXowvv0AndPOWn8WdPOwCgd55FhWMDxPDe
         Kg0w==
X-Forwarded-Encrypted: i=1; AJvYcCXgP1J8LLI5oRurssM62wAwGfGPrMz51qlJN2JwIDzXxBjU8sHg6r5wFZEEIsQUL4/0rUJQHkmMZvlnZ0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKWzjnIf3ViFPCg2GSFIVBwcbok0QfMCaWqSO8FoD2MA8Z/0H
	6tibBpJNKBf65xum89lJiy8iQuX9A+OYOARj4+Nd9DWwZOCIchyjpAp6
X-Gm-Gg: ASbGncu+1vg3YMNKez9CeXllDaHo1NsHtNh6rUZofND482jAiIrJlT5bVtPu8AISp/e
	IIixexwi3pvh6TdoXf3lJA6vgvk09R9//AzWFHgz96nWslya/4tuNDyr5vy2jmLivpnOn0Z4M7X
	MpCPHRTJZewXci1PBDIin6G/GHsNDVHMIurCFKAEQwd0GQ/6uW4T73WtHEkuS0pOJ2M3HVb6gPt
	T/VMxa6nx1/TClK15TBE4ZGSidWdnqZMHP1TlGXoVNQivQmSIubcyYruLFajbMU1w79XmdFd6PD
	crzb7ZB9Ro3ZuwogIPCwr38th75VUVF+U1Ov8L8ZwpzIKkGD
X-Google-Smtp-Source: AGHT+IHI3IoRcF9+IQUF8gWE3fQXWuiQLLXT2Oez5CFa8WdZTlx+Nhe9/6i4seFp0sL2p2UFPLhcLw==
X-Received: by 2002:adf:9c93:0:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a8fdeff3a2mr1719522f8f.31.1751009390109;
        Fri, 27 Jun 2025 00:29:50 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e72b6sm1955665f8f.15.2025.06.27.00.29.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Jun 2025 00:29:49 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: zi.li@linux.dev,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/3] locking/rwsem: make owner helpers globally available
Date: Fri, 27 Jun 2025 15:29:22 +0800
Message-ID: <20250627072924.36567-2-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627072924.36567-1-lance.yang@linux.dev>
References: <20250627072924.36567-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

In preparation for extending blocker tracking to support rwsems, make the
rwsem_owner() and is_rwsem_reader_owned() helpers globally available for
determining if the blocker is a writer or one of the readers.

Additionally, a stale owner pointer in a reader-owned rwsem can lead to
false positives in blocker tracking when CONFIG_DETECT_HUNG_TASK_BLOCKER
is enabled. To mitigate this, clear the owner field on the reader unlock
path, similar to what CONFIG_DEBUG_RWSEMS does. A NULL owner is better
than a stale one for diagnostics.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 include/linux/rwsem.h  | 12 ++++++++++++
 kernel/locking/rwsem.c | 14 +++++++-------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index c8b543d428b0..544853bed5b9 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -132,6 +132,18 @@ static inline int rwsem_is_contended(struct rw_semaphore *sem)
 	return !list_empty(&sem->wait_list);
 }
 
+#if defined(CONFIG_DEBUG_RWSEMS) || defined(CONFIG_DETECT_HUNG_TASK_BLOCKER)
+/*
+ * Return just the real task structure pointer of the owner
+ */
+extern struct task_struct *rwsem_owner(struct rw_semaphore *sem);
+
+/*
+ * Return true if the rwsem is owned by a reader.
+ */
+extern bool is_rwsem_reader_owned(struct rw_semaphore *sem);
+#endif
+
 #else /* !CONFIG_PREEMPT_RT */
 
 #include <linux/rwbase_rt.h>
diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index 2ddb827e3bea..a310eb9896de 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -181,11 +181,11 @@ static inline void rwsem_set_reader_owned(struct rw_semaphore *sem)
 	__rwsem_set_reader_owned(sem, current);
 }
 
-#ifdef CONFIG_DEBUG_RWSEMS
+#if defined(CONFIG_DEBUG_RWSEMS) || defined(CONFIG_DETECT_HUNG_TASK_BLOCKER)
 /*
  * Return just the real task structure pointer of the owner
  */
-static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
+struct task_struct *rwsem_owner(struct rw_semaphore *sem)
 {
 	return (struct task_struct *)
 		(atomic_long_read(&sem->owner) & ~RWSEM_OWNER_FLAGS_MASK);
@@ -194,7 +194,7 @@ static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
 /*
  * Return true if the rwsem is owned by a reader.
  */
-static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
+bool is_rwsem_reader_owned(struct rw_semaphore *sem)
 {
 	/*
 	 * Check the count to see if it is write-locked.
@@ -207,10 +207,10 @@ static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
 }
 
 /*
- * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
- * is a task pointer in owner of a reader-owned rwsem, it will be the
- * real owner or one of the real owners. The only exception is when the
- * unlock is done by up_read_non_owner().
+ * With CONFIG_DEBUG_RWSEMS or CONFIG_DETECT_HUNG_TASK_BLOCKER configured,
+ * it will make sure that the owner field of a reader-owned rwsem either
+ * points to a real reader-owner(s) or gets cleared. The only exception is
+ * when the unlock is done by up_read_non_owner().
  */
 static inline void rwsem_clear_reader_owned(struct rw_semaphore *sem)
 {
-- 
2.49.0

