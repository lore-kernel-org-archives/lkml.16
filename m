Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2F19F42F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747849669; cv=none; b=Lwp8I5hKAQo0Llw0XBPdWt/aIduZvSJEO1BjMsQBbddoi7Bfq6mkhvloylw/v2Z62GML6oT1vsofW47wA2nlvEIJwbreG9TSVZjbQUyFSjySBvUOHsFt0sA6N9OzsAHcJ/yMqn3AULPf3VkejpvYfo4MX9snPUp4wzvJUrZm4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747849669; c=relaxed/simple;
	bh=TgOo6A5A/c/4vmi6glL9bU93L3dWBs4RhVGWgQMINTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6idWGNI2H6/UdHLWF6TQaGGf5MNG58aVUX6NfJ0DPU3PrK2WcVW9Sl2KVSm3eFk/cezZMzp4dzDkGKMfzd+BWs1EvOxYMvhc8g/xgRiva/cC4WXsF7NF51C0YVv1MuWRnMXcso4mZSOb3T8FvVgnXrcTtNshOgqOW+MdAvSTUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T3CRG98C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T3CRG98C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747849666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oGeZ4/qscFDpgQW4r4FF8qcWixZjDJP3cGgKS2Y7uN4=;
	b=T3CRG98C/EPHLWDDtBsyMw7fg/e7wenI0jAaoAvTvzOfQ9KzpQlOS/Uzw/ncJ68xEFDJqe
	uS04FTi7TO96zJBhtJEZ+ZoH0giYJ8ZoOwYaNP0Of9sBCEgU9VPgtQaT5oybn6pAORLtKG
	nPkj41t0Vi897oa2aJwsVx3ZgmzNJyg=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-DiQh0M0nO8-JzvW15O7_zQ-1; Wed, 21 May 2025 13:47:44 -0400
X-MC-Unique: DiQh0M0nO8-JzvW15O7_zQ-1
X-Mimecast-MFC-AGG-ID: DiQh0M0nO8-JzvW15O7_zQ_1747849663
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4e28ed5cbe1so505892137.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747849663; x=1748454463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGeZ4/qscFDpgQW4r4FF8qcWixZjDJP3cGgKS2Y7uN4=;
        b=AViRBOg9pWopR7gfDr0ePl3CrR6x9yKZAEZ2uPtgd6xjvLvKWKrGPz0hlSHtFhOKMB
         FodCtQhHQzp4EhfJ0vjd/O9NBFOty5oxeOcQUFHjw2Fb4wi1g8AlW8DQ2osF6BtoRcQb
         v/cB3LKcQGqEa1wSgsy6koBFrMbfca6BBwJfplOxGGFuUSV90IIucn1UEWaUTdLj8DGl
         DNK5wzKMRIYY33a8AoUyPpFMvODNTMVBTDdIC2AOnVYaVCMZWuHnMJF2TJlf8zVVoEvD
         U+j43kqrYNMjLLYdqVyJsPKlBTofWRevYcLqNvIGQv6obBZlwjuz2T4EuXM2DA3nGaz6
         37Nw==
X-Gm-Message-State: AOJu0YzUCdxtmPn5SMATmUx94c/CeXjvaij2IKxC6TsJdQG+UZlQ4z3z
	igvHZabYMUdfS7+eslyr6msOrB4G78CYFY2w9ZC9U4A+uVYDfNLABPJdkcxl3z0u2MTHZkXmxa6
	TmL/55vxTKCC4tbKevGt77THvQ1fHCWAApQYGTgZLt1j/g6Q9JB8WpNEknqyOCNhb1g==
X-Gm-Gg: ASbGncvZAMNWySgJ0FibX9mysvEtGNONIg95jxvp9A3vBuWf2HK6k2asXCzkadicMg/
	WuEYNj84Xop6DwiOcJ+xdrmMMj//jf/Vq8mgoh5m7000fkpZNdw6bJWrwA70Mx9zawdyxJTtG/w
	jcw29/h5tdKDLP/vdQzP1x3Em1had5e+rrxpUz0ygAy2Tcss0fu1rILN6zi46ErLuLnUmLpHuFF
	a6Keb12z2MIO58KDbujoVs32lWOEItxSNbzNZE+CFFI7YkICk3Ph8y+JK8MhSUXqQDqrcZXxSD2
	isfY8NIOdrMVnJsH6gmwfQE=
X-Received: by 2002:a05:6102:2088:b0:4e2:86e6:3785 with SMTP id ada2fe7eead31-4e286e63831mr8631160137.5.1747849663596;
        Wed, 21 May 2025 10:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcgJMgOdIuV2JgSyNykYGAESv4TB7nALlmfCg5UZX+HHAGsDtiwbsJqHw7g+R8vvMr49hdzw==
X-Received: by 2002:a05:6102:2088:b0:4e2:86e6:3785 with SMTP id ada2fe7eead31-4e286e63831mr8631149137.5.1747849663281;
        Wed, 21 May 2025 10:47:43 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:1fb:3066:58ce:cfdd:85bd])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec22768fsm9242464241.30.2025.05.21.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 10:47:42 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jakub Kicinski <kuba@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] local_lock: Minor improvements of local_trylock*() documentation
Date: Wed, 21 May 2025 14:47:26 -0300
Message-ID: <20250521174726.578303-1-leobras@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix local_trylock_init() documentation, as it was mentioning the non-try
helper instead, and use the opportunity to make clear the try_lock*() needs
to receive a local_trylock_t variable as parameter.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
v1: https://lore.kernel.org/all/20250505170244.253170-1-leobras@redhat.com/
RFC: https://lore.kernel.org/all/20250430073610.163846-1-leobras@redhat.com/


 include/linux/local_lock.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
index 16a2ee4f8310b..d8d5e6cfa1151 100644
--- a/include/linux/local_lock.h
+++ b/include/linux/local_lock.h
@@ -45,38 +45,38 @@
 /**
  * local_unlock_irqrestore - Release a per CPU local lock and restore
  *			      interrupt flags
  * @lock:	The lock variable
  * @flags:      Interrupt flags to restore
  */
 #define local_unlock_irqrestore(lock, flags)			\
 	__local_unlock_irqrestore(lock, flags)
 
 /**
- * local_lock_init - Runtime initialize a lock instance
+ * local_trylock_init - Runtime initialize a local_trylock_t instance
  */
 #define local_trylock_init(lock)	__local_trylock_init(lock)
 
 /**
  * local_trylock - Try to acquire a per CPU local lock
- * @lock:	The lock variable
+ * @lock:	The local_trylock_t variable
  *
  * The function can be used in any context such as NMI or HARDIRQ. Due to
  * locking constrains it will _always_ fail to acquire the lock in NMI or
  * HARDIRQ context on PREEMPT_RT.
  */
 #define local_trylock(lock)		__local_trylock(lock)
 
 /**
  * local_trylock_irqsave - Try to acquire a per CPU local lock, save and disable
  *			   interrupts if acquired
- * @lock:	The lock variable
+ * @lock:	The local_trylock_t variable
  * @flags:	Storage for interrupt flags
  *
  * The function can be used in any context such as NMI or HARDIRQ. Due to
  * locking constrains it will _always_ fail to acquire the lock in NMI or
  * HARDIRQ context on PREEMPT_RT.
  */
 #define local_trylock_irqsave(lock, flags)			\
 	__local_trylock_irqsave(lock, flags)
 
 DEFINE_GUARD(local_lock, local_lock_t __percpu*,
-- 
2.49.0

