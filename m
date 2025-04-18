Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97822540F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998624; cv=none; b=ozpAPLcdhasdEZNgFZzPfNcZ6u2JtcjNOHjbZbDyZ6Cp6KIUrWw/sXh8WZ7mzz3KwvCx15Qu1mp9+WgWvaWtqBkNc1uHThyNMd19+Q0IljXOtnwzFwvcbLgGs8o2KLOPtOiegbUz2bEfxGSH6eC7wN6/FOOXc460YnQ52qMiC3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998624; c=relaxed/simple;
	bh=sKg7f329Zs3O82Sqp+e8qxPxOZ/t4mW6H6H8eA3C9lA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DHUg2oNg7LGIbF3FwKrpxD1RfW72+nSdEPR8FzexZC+/4gdOyFvey5Ozqv8j0Jw2GeuNb8SqIxwbdFagYh/JMRrad2uqnklYsuwa6fJmxNsfTILpJ43rNNFFo3KCNqJwuZabz64Kq6k7UIB8bTd7LcZqNRdit/G7fosEnxdwNUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AZqb7kPy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AZqb7kPy"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ade807fso33216835ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744998621; x=1745603421; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GDNsq3YX7eW5e3apKRRmkWWvDDDuWE0xbjvQjwBgCsE=;
        b=AZqb7kPy/oRHhVyW00nvGWJKO6OQN2L0ukhaFp7qXyDPXhS+GR+w5FMSEtkQa/zcZZ
         dw+GmEy1385+mbG1El3VlhBm2rn6nwWEwg8YHBz3fKKQPMecS+cJiz7tHTUDW0Qsqj9t
         mE4If8izxzVDtWRnhsr+DEHlGTFNgFTEwADD41JxWYc+VnaDBqUST4v0Yw1hdqY0f2gq
         ny+ySQxHj3mGDwHrK2kzMl83Vm/5IzHPJE3USmbUKHK2TjEwu1VvTdMl3yDgwrVlNqjC
         Px0Ezpd8E/c730HRLMwGA+zNHLeiZVxDYWjAAzwkMnWb5aVJ57Kr2hbR0jlJ1M/R+U2G
         qoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998621; x=1745603421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDNsq3YX7eW5e3apKRRmkWWvDDDuWE0xbjvQjwBgCsE=;
        b=myHUvnQPK3ffydZs6R4zX2VVoj0CjeboiaZ/bmcNbCu0XFVK2cLJsImxdRA6iUhbp0
         mjBPe8VLJh7Ct4OftSlz71a/P8eKjZrXds5OBMOePw+9jsC6NjeKNsEXb6CIio5quNnE
         djVFM2+J/QTLFF+k37/sAAp5d+Ns3tiCvIJb0KPzWuRGuKPhOic3fX0x7av7lPKNlkTY
         9AgRlxY9G7wghqWbmC7eNsgSIoClZhAXXzCm3kTvG3HKdZuOhrZ9ZLYGNnM70gfAkB1x
         j893ZP67t578sjEiu+tY3hOcA78nI/HT1ha8LgcGehOGr4LMDK1lyMlqYAF/v52pOYtu
         oEWw==
X-Forwarded-Encrypted: i=1; AJvYcCX6A9INieU+r4lW9xMUORKbIN0HtQ2c4Y84O7++l8zkGfIsGTZHarLw0V+wAz+UgPPuEVmMfnHac31obZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPH22/QSDTBIRt6vBDcKQpTL1jzDNMkvGjQHyhSPuWIS1j10Yq
	2UkJh5UiRbTs5TJhEMS4bvLZTGGlVcRRdQZ2UrxNerVBkltv5il99xau5wyyxQTKFJGxjj1tuwv
	5BQ==
X-Google-Smtp-Source: AGHT+IH4SzFcgriEZeEyINeEOYHsKsBduZvh1a8UF65TGxe4ng4DHNhTgv3meBOCFXGKpW1iswhVW2S93bM=
X-Received: from plrd9.prod.google.com ([2002:a17:902:aa89:b0:223:225b:3d83])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19cc:b0:224:24d5:f20a
 with SMTP id d9443c01a7336-22c53620caamr57870345ad.48.1744998620802; Fri, 18
 Apr 2025 10:50:20 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:49:59 -0700
In-Reply-To: <20250418174959.1431962-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418174959.1431962-1-surenb@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418174959.1431962-9-surenb@google.com>
Subject: [PATCH v3 8/8] mm/maps: execute PROCMAP_QUERY ioctl under RCU
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, jannh@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, 
	brauner@kernel.org, josef@toxicpanda.com, yebin10@huawei.com, 
	linux@weissschuh.net, willy@infradead.org, osalvador@suse.de, 
	andrii@kernel.org, ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Utilize speculative vma lookup to find and snapshot a vma without
taking mmap_lock during PROCMAP_QUERY ioctl execution. Concurrent
address space modifications are detected and the lookup is retried.
While we take the mmap_lock for reading during such contention, we
do that momentarily only to record new mm_wr_seq counter.
This change is designed to reduce mmap_lock contention and prevent
PROCMAP_QUERY ioctl calls (often a low priority task, such as
monitoring/data collection services) from blocking address space
updates.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/proc/task_mmu.c | 63 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f9d50a61167c..28b975ddff26 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -525,9 +525,53 @@ static int pid_maps_open(struct inode *inode, struct file *file)
 		PROCMAP_QUERY_VMA_FLAGS				\
 )
 
-static int query_vma_setup(struct mm_struct *mm)
+#ifdef CONFIG_PER_VMA_LOCK
+
+static int query_vma_setup(struct proc_maps_private *priv)
 {
-	return mmap_read_lock_killable(mm);
+	if (!mmap_lock_speculate_try_begin(priv->mm, &priv->mm_wr_seq)) {
+		int ret = mmap_read_lock_killable(priv->mm);
+
+		if (ret)
+			return ret;
+
+		/* mmap_lock_speculate_try_begin() succeeds when holding mmap_read_lock */
+		mmap_lock_speculate_try_begin(priv->mm, &priv->mm_wr_seq);
+		mmap_read_unlock(priv->mm);
+	}
+
+	memset(&priv->vma_copy, 0, sizeof(priv->vma_copy));
+	rcu_read_lock();
+
+	return 0;
+}
+
+static void query_vma_teardown(struct mm_struct *mm, struct vm_area_struct *vma)
+{
+	rcu_read_unlock();
+}
+
+static struct vm_area_struct *query_vma_find_by_addr(struct proc_maps_private *priv,
+						     unsigned long addr)
+{
+	struct vm_area_struct *vma;
+
+	vma_iter_init(&priv->iter, priv->mm, addr);
+	vma = vma_next(&priv->iter);
+	if (!vma)
+		return NULL;
+
+	vma = get_stable_vma(vma, priv, addr);
+
+	/* The only possible error is EINTR, just pretend we found nothing */
+	return IS_ERR(vma) ? NULL : vma;
+}
+
+#else /* CONFIG_PER_VMA_LOCK */
+
+static int query_vma_setup(struct proc_maps_private *priv)
+{
+	return mmap_read_lock_killable(priv->mm);
 }
 
 static void query_vma_teardown(struct mm_struct *mm, struct vm_area_struct *vma)
@@ -535,18 +579,21 @@ static void query_vma_teardown(struct mm_struct *mm, struct vm_area_struct *vma)
 	mmap_read_unlock(mm);
 }
 
-static struct vm_area_struct *query_vma_find_by_addr(struct mm_struct *mm, unsigned long addr)
+static struct vm_area_struct *query_vma_find_by_addr(struct proc_maps_private *priv,
+						     unsigned long addr)
 {
-	return find_vma(mm, addr);
+	return find_vma(priv->mm, addr);
 }
 
-static struct vm_area_struct *query_matching_vma(struct mm_struct *mm,
+#endif /* CONFIG_PER_VMA_LOCK */
+
+static struct vm_area_struct *query_matching_vma(struct proc_maps_private *priv,
 						 unsigned long addr, u32 flags)
 {
 	struct vm_area_struct *vma;
 
 next_vma:
-	vma = query_vma_find_by_addr(mm, addr);
+	vma = query_vma_find_by_addr(priv, addr);
 	if (!vma)
 		goto no_vma;
 
@@ -622,13 +669,13 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	if (!mm || !mmget_not_zero(mm))
 		return -ESRCH;
 
-	err = query_vma_setup(mm);
+	err = query_vma_setup(priv);
 	if (err) {
 		mmput(mm);
 		return err;
 	}
 
-	vma = query_matching_vma(mm, karg.query_addr, karg.query_flags);
+	vma = query_matching_vma(priv, karg.query_addr, karg.query_flags);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		vma = NULL;
-- 
2.49.0.805.g082f7c87e0-goog

