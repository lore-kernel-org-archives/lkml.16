Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109B1A0BC9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749702046; cv=none; b=rLIixZPws7GwwOTKmrroZcZGxANeEhXUJ+5IlNsX4tFzXPja0XJJCaDYEP722VONJws4m+sCSKmsacUEta3xro7yDDh8W6/rUd9eTR5Tj+vwbdLTQxsvFL/IorV3Di8kkyLhPe3SGfGKAnQull0jUxcS91y2I8i+ljPq7WVPjwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749702046; c=relaxed/simple;
	bh=2GkpFMkXFfl3T18Cz96lOl8ixQGqT3V/0aUv6tknrZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D87pqkfOrxiGLc+qhyuF5/kQ1d+ok3NPbnuLmmy7vI6++HMxGOLzr48tavo3tuQwbwD839ig5TdPCkz3Np3ZYZ5HweRHQ0JWb93oFCWI+ToBPvZ8OT+kWmEHHbgTrxiO6eHmYKF2AF9Jz7WYe/M4Ohci7J/fZnUQD/s5y/XvDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDCGjLza; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDCGjLza"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747fc7506d4so567162b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749702044; x=1750306844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78vj2uCodgRO2NQvf2s188xHcuRs6eU7DQ0fjLo6Ke0=;
        b=gDCGjLzaNuKFxAR4PSVGFbWP7GYT1ukOKnc10mINRxBJ7EOxvy160vz8Uheec+pDWV
         Lw66Vp2U5oA7uEWJpCl3NqQbrCBctGBSFSNLG6ih+TfuyprrSNo5F26dUqHd/h44DxeR
         i4HOVnbFo57eXsJnO13VyHcZOW8NbNvbahFKXoZtFYWfY6J0vrpB4a1PqMo1P2+bNY9D
         4jiewNWPEJb5mJDts8q/Q2DUQboqv2s9UKBFso6i7IuI/BaKINCpoerilJdEP1+vbue5
         QoOIEghZammJcs/e7dojJUgVs77owdhGu6T2WXVIIdx/U17BIW/sZaRwqxLZwlDAmIoo
         7d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749702044; x=1750306844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78vj2uCodgRO2NQvf2s188xHcuRs6eU7DQ0fjLo6Ke0=;
        b=HlsXX3JrhzmC81STsk9olGBR4D08ZrMvPB0SpPCBqEE61nk/vm5ZScX9+2V/2U7x8P
         UQC4sJd4Hsi65uhBrQ5NHcCvgtU8LthaEfT5yuSCs9FSeIqlb+nvrlsTBUoHxytzxojJ
         PwJC2NSbW0aOK3F98+s2XmoVBeWwWOgYnFBveLE3OhyanCWO3qJ4xNKdJrqUiCbHO0mW
         C39VaXhwptjMprgTysSlkkRr6yLcug5vZedLM1E0WpKhK+or+tMVlMzZKypMFarNPEdI
         qmgNhlSitNryNIZXvHDmpqVT/qho6NX0ucIZp2KxfNseq5O4kw4aFidFbTeJ/GOHA5+y
         RFJA==
X-Forwarded-Encrypted: i=1; AJvYcCVgyM/+JTWrYOWTs2/c1RoHaUqxvvwtn8+k3150Pz3F1LSYPPxsLuZmUgBfWZZPmNOOuy96uleQ0O0KB2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5X4pDmQQlj/XwUdEHGjVmuVcEmmoosFeFkiMqjucbje14JEUS
	GAflo8MH1gF9xP4J1VbA/ZOy7zyne5MHJbSq/qSL46GehAlOTEey4y7K
X-Gm-Gg: ASbGnctFcm+gE12yisGjv5pbP7Qka/gsNToNGaqEBNIHqapI+xpwFNgI6PMwyzNRUOK
	H0m8BW5jce65orych19aIzd6yiPYm/pLZgkkxA8yI6uNxcxsvRPnjMGwpiQof2GbF6UZCqTjeKy
	M+eN0pD5IX5JZi6CpANikJ423FxbXZv7jtqBpTzzPmsFay4c8KRwIa1iwFvhD9zx68OF4OQqQ1Y
	5BeMa+ht8kf4+OeRAUiOa3Z7uPb0xbQfBx7rx0aD5X3AL47PNAhzu1yP8lSsB88b9qE0XBJ+WGF
	zl8bC1LLqQ7x4CvP01uBTMf5qaF31VJj85nmrUK1Q0LdC4gunmbp/5dB3xxnaKLZiy0q7aToQ9D
	y0T/tgw==
X-Google-Smtp-Source: AGHT+IG5Sz2jXAvQt6nprHOBhcaEtyzrN5CivB9HVh3hGjjLbu6U4jLkt7oMIqQ0iexJTMUHil/HLQ==
X-Received: by 2002:a05:6a00:2d86:b0:732:2923:b70f with SMTP id d2e1a72fcca58-7487e246061mr2110278b3a.11.1749702043843;
        Wed, 11 Jun 2025 21:20:43 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([103.88.46.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748809d2b79sm439361b3a.92.2025.06.11.21.20.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Jun 2025 21:20:43 -0700 (PDT)
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
Subject: [PATCH RFC 1/3] locking/rwsem: make owner helpers globally available
Date: Thu, 12 Jun 2025 12:19:24 +0800
Message-ID: <20250612042005.99602-2-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612042005.99602-1-lance.yang@linux.dev>
References: <20250612042005.99602-1-lance.yang@linux.dev>
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

Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 include/linux/rwsem.h  | 12 ++++++++++++
 kernel/locking/rwsem.c |  8 +++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

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
index 2ddb827e3bea..6cb29442d4fc 100644
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
@@ -205,7 +205,9 @@ static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
 		return false;
 	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
 }
+#endif
 
+#ifdef CONFIG_DEBUG_RWSEMS
 /*
  * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
  * is a task pointer in owner of a reader-owned rwsem, it will be the
-- 
2.49.0

