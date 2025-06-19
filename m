Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308D022DFA6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334548; cv=none; b=r+p/3zbcfpRyyQMLE9K+1JIBHth33ra70zik8S7yBFGcFIezlEV/ico0IIBI4Echl1M58kAPCKLjTl4dsUHfVRPeknNQ3aGavScehdXjhdSqRK0jDAWCySsX7Ta5icX4xjzpc/DeJje85v35B1NXicnaLbmJ/POGe8H9r3XCvtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334548; c=relaxed/simple;
	bh=G1gJMowPL+/b6QIWufnMB9i0LqjeHau4t7UXgSU5b8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DlhZT76FwywvzGtw/x4wH9ac8HNQa/ArIE5HAr8jQ2/ESYLkley/NcaZnEGALl0OsfDoiCUr8tGtOjGqABOaE7IeKi4zjxb8tn9SstrstjX4i59pN5NC2nCNSZaEY5f4f7AU5gCX361xjRw9FquMhQSeATgEjD9Wd9aio65tCYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UquFkXOw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UquFkXOw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2363497cc4dso5506395ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750334546; x=1750939346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3e5yplfC8QoYckff8jXz8NRiZwXOGdRkpsb9F1raM7Y=;
        b=UquFkXOwUeBVJThRnyBS4SWxvPjJmwGwCZ+kJqV0IHAJtj2E+Z5YglcHAOb0DSzMZV
         GrfuxZkcBNGnq7T1j/V+MuDlB7MIDQ3k+DYWqbqFSG3qqpoJh8gNa/3Dl9I9Lz48oann
         lE4gO/HzT3Ofj8MV1X6Y2sNh8G5gTcUMwcpLkMjonLvaXO5/4RprdgFSD5Md8j4Kr9yc
         Pd6AfydiJQrYA4hMo/ZxHEbl5ElIp+x4UXYZwyQLIel9Dcm2U0S8g585MlXCufA/dD7t
         fH/YMOQqdPzbifNoHFeUB7EvmMv+djTKYpnILSaW5bECCxmQGLW/c2cAHAg08K3MIQF1
         GRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334546; x=1750939346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3e5yplfC8QoYckff8jXz8NRiZwXOGdRkpsb9F1raM7Y=;
        b=EnPRLlSg4GSBb987yQWykXaAGjBO2k/zIeICbAoHGQOtt0YdSdn8FcJcp2g7szSTUF
         wgBtV1ZMtVIbFng+M/6TcDx+nUGGcixSJGSsbR80faVsdWn/DIRd/P0nYYfW1PrMWiCF
         v2dMbBnk4WL28YueFIJpNwAf52sHGyNSB9SC0VB+UzsHgw5md1wrAYn6uc3L8uWRZW4+
         VMwF87ROnIBMk04pqWFS/IF1UmF+5QMIL31ax7CWDD0Puh4e/up+NexTp9Sm6R7ZxUvj
         MtQksulAiic+jpZ+lcTLg8MTKB9GQ7I+uvVJF549Va444PB+yPD+tnoY+uvvDnXnu7NP
         83yA==
X-Forwarded-Encrypted: i=1; AJvYcCXN7Y8B5f16YFiCdHZkL2X7ic8IXoCLoFMHI0Pk+5bw2vvk+mVa4I4qU6+rx5pKmR5WqPFG6bstl6/Cavg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SktitcZ4AmSKC5Iqm1iHAOKCzpaq2TkVhxPDEOGlAs7oKbe0
	49Wp/s3HCPB9Oj478IIzfXfD6WnM90L+tXwd7PsKUk/EOhgsHciXhQ7Y
X-Gm-Gg: ASbGncsiHhhsUlGt37+6fKknuDUe13fkruwm8xUVvnAiYn7sSJ1BYY7A2NmlTjAExnF
	Bf0v0yJCQvV6M0Z65ElvASMQ7bHjeAxwCwwDqPs+y8WGC7KuUjb3o9xSD1EohgzhxX96ULNJ052
	J8KAZIr4C92FOqg53BzSQ0x3eH0UHdGlb+Pa5jEQNZX6HtEpDR3pk1A3oXDFG4cLUKap8TgPs8B
	B5cP/zWg9Ub1A2q1o+LLGlzkAmoOszBcVczVi2kV5xbBxUZe3AoweoHlnVCZ29m24+NveSCSBNe
	xrj1nB/74ThST2eps6XgaVN8Xt9EKZXajxACmNqdDpR7aIQtniYc5/9j76gSgJeejNE2FQJxASz
	cD6DutA==
X-Google-Smtp-Source: AGHT+IEBzKqBDl0dBpCzqSeUhXKuvhI58zmY/9pk4wv79RDwOt4qbdrW0ZeUn0WXc/UYblYzK4OF2A==
X-Received: by 2002:a17:902:dacf:b0:235:e76c:4353 with SMTP id d9443c01a7336-2366b16e8edmr286993755ad.51.1750334546363;
        Thu, 19 Jun 2025 05:02:26 -0700 (PDT)
Received: from localhost ([202.43.239.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e640sm1994692a91.15.2025.06.19.05.02.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 05:02:26 -0700 (PDT)
From: Jiazi Li <jqqlijiazi@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Jiazi Li <jqqlijiazi@gmail.com>,
	linux-kernel@vger.kernel.org,
	"mingzhu.wang" <mingzhu.wang@transsion.com>
Subject: [PATCH] kthread: update comment for __to_kthread
Date: Thu, 19 Jun 2025 20:00:58 +0800
Message-ID: <20250619120104.4622-1-jqqlijiazi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit 343f4c49f243 ("kthread: Don't allocate kthread_struct
for init and umh") and commit 753550eb0ce1 ("fork: Explicitly set
PF_KTHREAD"), umh task no longer have struct kthread and PF_KTHREAD flag.
Io_uring worker thread does not have PF_KTHREAD flag, but worker_private
is not null, so update comment for __to_kthread.

Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
Signed-off-by: mingzhu.wang <mingzhu.wang@transsion.com>
---
 kernel/kthread.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 85fc068f0083..810cc244b81c 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -88,13 +88,9 @@ static inline struct kthread *to_kthread(struct task_struct *k)
 /*
  * Variant of to_kthread() that doesn't assume @p is a kthread.
  *
- * Per construction; when:
- *
- *   (p->flags & PF_KTHREAD) && p->worker_private
- *
- * the task is both a kthread and struct kthread is persistent. However
- * PF_KTHREAD on it's own is not, kernel_thread() can exec() (See umh.c and
- * begin_new_exec()).
+ * For io_uring worker thread, p->worker_private point to io_worker
+ * struct, but they do not have PF_KTHREAD flag.
+ * Return NULL for such tasks.
  */
 static inline struct kthread *__to_kthread(struct task_struct *p)
 {
-- 
2.49.0

