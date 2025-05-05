Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E3026A0FC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464595; cv=none; b=GbVHvblSXNsy9zv99CSE4OVtd9NS3jZUc1xJ/pwc8BewPVmW4+eSTYIWHCFZFpQLSiQmZDrJgD8GtUEYumMxv6fXsL+v1/NARVxY2k6owriuRmUb1DvbXe/J/bJKv4pPFGxmLdlwEKDbjE8awi7+/5UOE5IIzP//PPVLnak5Gdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464595; c=relaxed/simple;
	bh=/Qvmv8w9ZIfKNOh5CAiInqaoy1vMOODiIViYJFFLuZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rcps90WoMHdkJesCjzZCfhrJ8ZbS1FdcuyB+lqJpky8QfoyQ/k64yoi4TN1x0rWY4yr6P0FU03ndRzd3GKpCkNp7ozYPh9m5Z0cvh+GUR/kP4Pnr/EVitpJMJmsdqMPdzYSjB3gwdQSBIUGtfrRnugH5r8ETRtxgYOA/QMFBaCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GH43+Fy6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GH43+Fy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746464592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9bIHoqbBA5SLNauZMvH1fqOzSiDFcEQEEJ1Jgigji4=;
	b=GH43+Fy6e/BXAEknzyp7Hb85XTFyMgY59fuXBpLLYrx2ucwnX65epslQTtS8ddIGyt9lHd
	9xCeFyhf2QmN+l8Cat5aBVGHYyvuFrrbMYQdMpPCqTwxd1G8VobKYpD1GsajRK/wZxZoFx
	zcc9rCPIyziMkTTWYbG914V6HGJ8bsI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-OshEhb6COy-DfENXyYMoWw-1; Mon, 05 May 2025 13:03:09 -0400
X-MC-Unique: OshEhb6COy-DfENXyYMoWw-1
X-Mimecast-MFC-AGG-ID: OshEhb6COy-DfENXyYMoWw_1746464588
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736fff82264so3435450b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746464588; x=1747069388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9bIHoqbBA5SLNauZMvH1fqOzSiDFcEQEEJ1Jgigji4=;
        b=AkbHSodom7BoOsip6gZC5rXZvcBajTn+fTBjZ4OSPmMNnhItYmuECkS6yYWlc0ymuq
         2Dzi0aTOpjVWl7/7hS0xhux2wsJ/oVBOig9ugaOajUWKKzzk99Uhzo1oE1nVJjY4Hona
         N2fPq9owRKp6fAhGgblOJ+/WdbDGN9OacYLVQRDrblS/1CnaCkb4ubm82mk/GEYImwNS
         vU/gkdsBbQib6VcnhSnsP2nDno+R8qASRr72Ku4DEVIVD9Wifu07fCehQw5Q47nqKHi1
         8MLXuJS6r+TxEyM+urNKCiLTNbXI+keeHAnn2Gf1gmFQiirwTGduIkAgjizJ+NMBQ8NM
         YJTw==
X-Gm-Message-State: AOJu0Yz6PAn6Ux0hZzfd6vDRPxgJ+KikgDUHQ4CHa/Z9J70Q1mhEOyKh
	hxsY/qRcCbIhG5/deVTf061Hnj31+61gcLueRRF05j4LnUketGMUJ2cn8pm1GDxoaKt2ZC13rbB
	TXaQh5nDFfn0pU3riUi5+J3mglu1Qh5UR56lKaca7IiSkrpDnAD57GZprg3Ms3w==
X-Gm-Gg: ASbGncuSiEzcPvG+dC6IChQeMWeLzRjBLyS4MaW4bkGw2/F6fxvvfC+hSm4WTqCasyh
	pVNWDEQKVCg8leSBzLWcPyL5vUs/xSKZcQFP+C/cppb/laXbK07jnsImyX85Q6G/a6EIWchyOiO
	q/oHp72VBY874OR8iNOO5ol/Ykh3TcyfDgKp8FDs4b/KpfcLTgjSEnWtIH11FrO15x0OSP2xPq2
	rIH3jCGwEjrl6R2mEQwICaUsahzCPvInsp1a5tc7H6YZbzT+zFD8siabwRscuiOvhKBATCEiaro
	EIx09oCbgjkBNT1pKh9hmim7
X-Received: by 2002:a05:6a00:a20:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-74090e44996mr379535b3a.5.1746464588197;
        Mon, 05 May 2025 10:03:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvK3Ppi0BRws/Y5vzuFvx+uQJghZwFuILY/Vgby6wA386en8K1y8EzEX9SHUhWpLGMzv/CMA==
X-Received: by 2002:a05:6a00:a20:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-74090e44996mr379499b3a.5.1746464587846;
        Mon, 05 May 2025 10:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a800:6188:b6d7:24aa:ba3f:6cc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df2a6csm7072213b3a.81.2025.05.05.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:03:07 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] local_lock: Minor improvements of local_trylock*() documentation
Date: Mon,  5 May 2025 14:02:44 -0300
Message-ID: <20250505170244.253170-1-leobras@redhat.com>
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

Changes since RFC:
- Replace try-enabled lock with local_trylock{,_t}

 include/linux/local_lock.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
index 16a2ee4f8310b..58adaaf98dd74 100644
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
+ * local_trylock_init - Runtime initialize a local_trylock instance
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

