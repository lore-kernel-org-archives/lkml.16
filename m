Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D691DF98B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998596; cv=none; b=ty1W5mLZgQP/nqu8X9Z5ZaaqCngOtHyEdsl2f3jEEAAeSkWAigeEYGG0DHKNvCE3FiUKNYDJ36t9DRoZW0KEZx6oTTSZX6omR1VJGKSWjK/znB1zmjo5Veh20oOkXxyQQ9nd+uMAGMHN4vuFwLu8ILbC+kkzfTZ80ho5kk1IdZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998596; c=relaxed/simple;
	bh=Jp6r1uAPNiaUcZ7vu3hEK4j5sCCvhx8jZQNF3pIvzPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAKaiIl4YGZsbpPW68pgndhJDHjJs6dP9C1M1HKcuCltywCYwZqTsM5miYhl3EYHSnhb9+gaPUSvCjoMFljv5JXpKQQrpp+mGejzJTvaa4SMWPuYi+7lfFahA6BxuSrKOWeQ9vziigEz5a7E1V8hUZwpTcTALI8TrIJ5AJBXrIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dl8THRxl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dl8THRxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745998593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ATlge+/XHY/x4P++Awsgt+89C15GuzoKXYKTk6Biva0=;
	b=dl8THRxlJVGBepEa8XLtkWlS500rkZarPF0UxKp4+9sKGxdJAzhf/lKHtgEpmGQsGeli68
	V/tjpzdJoaL9vKIzdz893zNANKG6093DhyNtCVLMN+rO1+6e1lesRfQXk5hTqACobJaRrN
	Oa4c3doyZdwxQigD/dlRqDTAHq3IQxA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-tqFJZ_1TMRWb3SpHYnavHg-1; Wed, 30 Apr 2025 03:36:29 -0400
X-MC-Unique: tqFJZ_1TMRWb3SpHYnavHg-1
X-Mimecast-MFC-AGG-ID: tqFJZ_1TMRWb3SpHYnavHg_1745998588
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736c7df9b6cso9264881b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998588; x=1746603388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATlge+/XHY/x4P++Awsgt+89C15GuzoKXYKTk6Biva0=;
        b=mEup7xmyzdkhTYATL7gUeyLe8s0bMhJS7jVoHU16k50olB3imNJAZYLUUmaj3MM+1L
         DcT/Ot9dZdnrdCPDMzifwOZV3hnauBd2Q/DKDSXl+4rUOMTYyDyOEfEQK1c4Z51OpryQ
         cZn12w90lyhSHWkydpvSzEroTGf4NhTKjg3pbeJVxypuYHaErJAzB0K+RooAlIldkEGq
         3zWc2H06zAoSi6jR5Q0/GKGTVQAuU80YB6Vt1vQo7rh/i70Y7DN7uIzwJCjChdajCe0+
         Bp+XeBcBC/6otp4FkxhXFZ0JHRyqNVnD7m+Kv6HiS4N8FMGhLtB4SFTD38k9SqV9MRPl
         e6BQ==
X-Gm-Message-State: AOJu0YyEkXzL1yYODovBLm8PKZh8xWFpsW1O7fgZZLwVzj/BlvPyC3KF
	qdwQLryoKYTPNA0BGNezwwOZGscpMAbBOgPw1QXLTwwZDh6d/JXqtm2ShRGBid6EgyCv/TR0vCI
	kkaMlz6oKOdUQEszGYh5LY3n8JnCywD2fzGct9fgzXNwdpAcuxst9TOBlQ8Odig==
X-Gm-Gg: ASbGncu7bvCZi2dVkDYsuWxYu/nXjDcR69IEBBeSIX5l+h6/9e2f87mdqXwLvCOIMn/
	DYLrAAFcpHaz5TBRcCyPihwOl7yX2yQRmzGcQZAY7NsopeSTM+NWQmRap16fcct12BVnkWqQXJK
	MMqHczbozr8UJ5xmmWH5MqKkFRx5oq9KaRxSuzEt+Mcvj2M1d8VWq5vf8kpgan9WPgNsWewrhY5
	SqC4OIGkLgolBddVf+h/wi5BweT+wLEtOHrEgSd5MRtaLSWiOXNVjGmzM+cp5krplHh1csmDSdn
	umVutWLPe+/TBXxHRxJBI1t9
X-Received: by 2002:a05:6a00:2e29:b0:736:a973:748 with SMTP id d2e1a72fcca58-7403a82e80dmr2157062b3a.22.1745998588029;
        Wed, 30 Apr 2025 00:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgr8bHNca5fFeYuBhBxyWC8wjluqnA4KJ6k1oh1C7Ebs3Yk51OKs3lCNRatb6ZP8ZSIeUrQA==
X-Received: by 2002:a05:6a00:2e29:b0:736:a973:748 with SMTP id d2e1a72fcca58-7403a82e80dmr2157036b3a.22.1745998587672;
        Wed, 30 Apr 2025 00:36:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a800:e30d:722a:db4d:3dea:f1ae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a90ebasm961811b3a.162.2025.04.30.00.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:36:27 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] local_lock: Minor improvements of local_trylock*() documentation
Date: Wed, 30 Apr 2025 04:36:10 -0300
Message-ID: <20250430073610.163846-1-leobras@redhat.com>
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
to receive a try-enabled variable as parameter.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/linux/local_lock.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
index 16a2ee4f8310b..e052e33432cb2 100644
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
+ * local_trylock_init - Runtime initialize a try-enabled lock instance
  */
 #define local_trylock_init(lock)	__local_trylock_init(lock)
 
 /**
  * local_trylock - Try to acquire a per CPU local lock
- * @lock:	The lock variable
+ * @lock:	The try-enabled lock variable
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
+ * @lock:	The try-enabled lock variable
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

