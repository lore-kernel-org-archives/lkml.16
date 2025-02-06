Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7E62253F0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844808; cv=none; b=QTAaw+jhOtOwzWXHFv7vAbGygyeFRQ8jCNcHV9h/wBJ50JixaTB+gPGJR3LRRmQXr1O/0/LKEW5h9CrF2ZmmbVsRztzT+NWd5ieJz//r9vh6xmunxkvdSvQQD5AYBW5YnOeu6NDUHjgkx8e7ef7e7NWOHent5lNzquIUtCgHqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844808; c=relaxed/simple;
	bh=m1nil9l9StnDO9vegDBbLfnBPV+aD7OvqjUSNnPY/g0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dIEY8gZeMVOniL4EKWntQ9vga+eRTfKrvk47A+jGxut/4gAOcONE3LONUXtVadvy5b748znu37gSX+AONFD/w5GajsV1LP7N0rIv1OGkOpixrF556pNgW4eGoTJe+wdw8mik9D+mysgHQACBLosCOVB070ja+IXYwEKQWHvu1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dce3763140so1908157a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 04:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844805; x=1739449605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENmojTuiNJJ6xJld5L2Wko62wurcHkgzo9KyUFUcH5Q=;
        b=E/GaV6ElOzxYKVAAwAh/PRpf6hAQvdtYCm4ZVlwhZIWkW1/BAMeZJysWJ4fFwfnl2l
         i2i5xhRr0PduV7bOvd0+c8A2DIwPLqGljk9K4H8cBJu7pW35jOuEomVlD0cGYrlc73eL
         5IGF3qr31j0l1xiJDBcCFNjqKiQnILA0nxKN7svgTI3d7fPfF/UnS4RqXrD0I2a9gV5R
         0xm5vVabux4YR3QWkWK5VdEPVrsyy0FkCgU/oA6kYphEQlciny3/j64utDknOq5zgOiP
         NPOk8BCB6IlrFasKMExbs81iOmqOM8/MSW5GInRAi1u9XruZGeD09hI8WcyphX+2uJ9T
         YxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSBncYEk8qAO6p1Pqe3wB1jOSEEyUozG2xP5jqNnYEMUqa2NcoW/UMk0ftwZR/H0bY6jERWcP5D9lfi+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzej/RYMvMoCg9GFzmGOVAjsj1OAWTQuqcLieROTwOwEHXr68
	PFukliQ/+VT2LeXyYHoiTXMC+yoWp2QrVQDZEiYFKdqTLxTRw1q2
X-Gm-Gg: ASbGnct4QcucUGpHOweHK4UZVGAY9mUgFR+bPZ5H4zoNCJN9fjBEtyl5+nmocJTg6L3
	HlYolmcVP3+ArIjoPEfKTJ4USxUUxID8DbcWQeNTzRKBD/AuU1ntOItJs6tXM7kmoeTyME3gU+N
	Z3p7SirFQN6rSw09Fjs7yDNxwMHty4uAxf3+5M8c2XQncDtxDDJX3TFEp7i7gKaCWIcJZEjiWFk
	X02szhtor/Z903jyRLQxSDPbtjy2sE75sJvzyTbv9acM2xT5KRqSTDz4f1z4hVG+cCDOkcMntr2
	HAXloJpOyf2HBblM469Aj/FeMw68ohrwPGIMGUJCcm0HtCY=
X-Google-Smtp-Source: AGHT+IH07CTI6uN+Ur6kpagu6CSzX6td+ByTSBwRYy3w/j/PvURMx/eBzeSKS3e+fVQSt/HBfbc9wg==
X-Received: by 2002:a17:907:7da0:b0:ab6:ddbc:1488 with SMTP id a640c23a62f3a-ab75e245019mr651564266b.23.1738844804942;
        Thu, 06 Feb 2025 04:26:44 -0800 (PST)
Received: from localhost.localdomain (109-81-84-135.rct.o2.cz. [109.81.84.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f491dcsm91417066b.22.2025.02.06.04.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:26:44 -0800 (PST)
From: Michal Hocko <mhocko@kernel.org>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Filipe Manana <fdmanana@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH] mm, percpu: do not consider sleepable allocations atomic
Date: Thu,  6 Feb 2025 13:26:33 +0100
Message-ID: <20250206122633.167896-1-mhocko@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Hocko <mhocko@suse.com>

28307d938fb2 ("percpu: make pcpu_alloc() aware of current gfp context")
has fixed a reclaim recursion for scoped GFP_NOFS context. It has done
that by avoiding taking pcpu_alloc_mutex. This is a correct solution as
the worker context with full GFP_KERNEL allocation/reclaim power and which
is using the same lock cannot block the NOFS pcpu_alloc caller.

On the other hand this is a very conservative approach that could lead
to failures because pcpu_alloc lockless implementation is quite limited.

We have a bug report about premature failures when scsi array of 193
devices is scanned. Sometimes (not consistently) the scanning aborts
because the iscsid daemon fails to create the queue for a random scsi
device during the scan. iscsid itslef is running with PR_SET_IO_FLUSHER
set so all allocations from this process context are GFP_NOIO. This in
turn makes any pcpu_alloc lockless (without pcpu_alloc_mutex) which
leads to pre-mature failures.

It has turned out that iscsid has worked around this by dropping
PR_SET_IO_FLUSHER (https://github.com/open-iscsi/open-iscsi/pull/382)
when scanning host. But we can do better in this case on the kernel side
and use pcpu_alloc_mutex for NOIO resp.  NOFS constrained allocation
scopes too.  We just need the WQ worker to never trigger IO/FS reclaim.
Achieve that by enforcing scoped GFP_NOIO for the whole execution of
pcpu_balance_workfn (this will imply NOFS constrain as well). This will
remove the dependency chain and preserve the full allocation power of
the pcpu_alloc call.

While at it make is_atomic really test for blockable allocations.

Fixes: 28307d938fb2 ("percpu: make pcpu_alloc() aware of current gfp context
Signed-off-by: Michal Hocko <mhocko@suse.com>
---
 mm/percpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index d8dd31a2e407..192c2a8e901d 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1758,7 +1758,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 	gfp = current_gfp_context(gfp);
 	/* whitelisted flags that can be passed to the backing allocators */
 	pcpu_gfp = gfp & (GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
-	is_atomic = (gfp & GFP_KERNEL) != GFP_KERNEL;
+	is_atomic = !gfpflags_allow_blocking(gfp);
 	do_warn = !(gfp & __GFP_NOWARN);
 
 	/*
@@ -2204,7 +2204,12 @@ static void pcpu_balance_workfn(struct work_struct *work)
 	 * to grow other chunks.  This then gives pcpu_reclaim_populated() time
 	 * to move fully free chunks to the active list to be freed if
 	 * appropriate.
+	 *
+	 * Enforce GFP_NOIO allocations because we have pcpu_alloc users
+	 * constrained to GFP_NOIO/NOFS contexts and they could form lock
+	 * dependency through pcpu_alloc_mutex
 	 */
+	unsigned int flags = memalloc_noio_save();
 	mutex_lock(&pcpu_alloc_mutex);
 	spin_lock_irq(&pcpu_lock);
 
@@ -2215,6 +2220,7 @@ static void pcpu_balance_workfn(struct work_struct *work)
 
 	spin_unlock_irq(&pcpu_lock);
 	mutex_unlock(&pcpu_alloc_mutex);
+	memalloc_noio_restore(flags);
 }
 
 /**
-- 
2.48.1

