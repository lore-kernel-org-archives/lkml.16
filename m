Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5226FD87
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749078750; cv=none; b=J+Bd5hDo6BW7U1Xj7xCgLtZxAOAu3nDiprzSdWm5qcz4wuUPs3iqyBDObGiL2Ptd9QQJi/MA+kGDp1o/dDOGDrEaXBvC2Z9rYD2EyPU8yVd4AtAbZ88lWiJ2I7C9I19jdSZ232EqU706kKZykT2lHljFFAg/BOgiv8kLYUqA2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749078750; c=relaxed/simple;
	bh=1JKj07CL69YetOd3eAJtrIP/4dLtscsRaKvQHy9XVnU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WK9F9JVw1/TA9uFw0nqIF1wH5j/s/zhxB24omznqdhspiag+os/oGpo/uojsUl7ZfR2BAcRad93j5elsy23nuYvTniA7RCBI2tH+euuLYYUFy3wBpm/nfNkLJpHaib5zv7VwbV1dx5dv9c9tdOeogBDMD0eSF90704OvbeVJHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TJVzIoT7; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TJVzIoT7"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22aa75e6653so2373365ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749078749; x=1749683549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5S3jZ35KMoBO4RnXYNxi81hGE/ddSIH7so+ydU69UE8=;
        b=TJVzIoT7pt0B4DP3NqlGSwg+ostgG6dZHP9ZCFbM08kEnoc/yLCT8ucyA5vOT69UqA
         fjFl/ATtuT79r9sxhVk124XfOrFtgCj3vsaazrKFARHV8xy8gkpJzOu/ejj/3SFxLNkH
         2uqw2nIArev12mAI/KwDY8/Xz8hFN6J8fY2/n2MXa0+yiI7IyaOPLp3kHYbrYXikpc/+
         ogPP1HBxI43rS9SvkfueoI2VBftoRrrK4yMnvAZZChy0ML05Eh9ddz1VS1jCnuiYHCLK
         /6lw/qhFjCsrsCV79QL4q5b5xy4npLqBg3KcSGwrobupJJxbYXcCQ718vilBFuc0PGX1
         CXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749078749; x=1749683549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5S3jZ35KMoBO4RnXYNxi81hGE/ddSIH7so+ydU69UE8=;
        b=MaIPPVhYn9rpKjMhvT5MQJFr0iWvCFCG2Et3wRRlIBhNBPzAcvq184ENnR3a+c6ftA
         KoE0OFqLgmqIy3mWO48NRkL7EAHMU/90Fy0PidKcZ8KVm3yJ3staoC++InOLI7zQl4ai
         YaSAFZQSjQzdY/M0u/+g2droisY8odkBpL4aGhFcLtbh+D9CRxVqQxwh6VKB9N5Fdu8H
         dDsl2Gc/pBxaRz6jwIHJUFwcF6FXhyO+JxP+CVguH0es8LmnIzK6nWl6l2VDcVEzh1Xk
         naw5+LRll1grrB2ICBi6/r8f2obpqmPhpNeBsSh0c13E4zNHn1szfDHpi7QMwyu6qnPQ
         Qwfw==
X-Forwarded-Encrypted: i=1; AJvYcCWyIaXQtWTBfcizxkA/R1y0S4gkxMwWirsuPlgwF87e3hojXwkI82RC4y5kkPnd6KWrICdqY8J3M3cBack=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5LKIIoZzP1z1NBdQTHDiuhgRPWdWWIHRdAEKcb+WNuZnIvByC
	zUMrEB3FXZheW7HsU83QXCWBbowCEDe8u5gebRRXWN19TRUy3hkfm4VnnY9Bp9xCZi4XceyQUsu
	X2xF+kA==
X-Google-Smtp-Source: AGHT+IGoGwd/Y8vsxaXkZq3lcq5gV0uAcPoWJqxGcCejiu9rQZwPdtbf9qfiVIzoSAsbfmD8Xw6SbN6aqVM=
X-Received: from plnz4.prod.google.com ([2002:a17:902:8344:b0:231:e2fb:ebf])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ccd0:b0:234:e655:a62e
 with SMTP id d9443c01a7336-235e101356bmr63542455ad.9.1749078748733; Wed, 04
 Jun 2025 16:12:28 -0700 (PDT)
Date: Wed,  4 Jun 2025 16:11:51 -0700
In-Reply-To: <20250604231151.799834-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604231151.799834-1-surenb@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250604231151.799834-8-surenb@google.com>
Subject: [PATCH v4 7/7] mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, jannh@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, 
	brauner@kernel.org, josef@toxicpanda.com, yebin10@huawei.com, 
	linux@weissschuh.net, willy@infradead.org, osalvador@suse.de, 
	andrii@kernel.org, ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	tjmercier@google.com, kaleshsingh@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Utilize per-vma locks to stabilize vma after lookup without taking
mmap_lock during PROCMAP_QUERY ioctl execution. While we might take
mmap_lock for reading during contention, we do that momentarily only
to lock the vma.
This change is designed to reduce mmap_lock contention and prevent
PROCMAP_QUERY ioctl calls from blocking address space updates.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/proc/task_mmu.c | 56 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 36d883c4f394..93ba35a84975 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -550,28 +550,60 @@ static int pid_maps_open(struct inode *inode, struct file *file)
 		PROCMAP_QUERY_VMA_FLAGS				\
 )
 
-static int query_vma_setup(struct mm_struct *mm)
+#ifdef CONFIG_PER_VMA_LOCK
+
+static int query_vma_setup(struct proc_maps_private *priv)
 {
-	return mmap_read_lock_killable(mm);
+	rcu_read_lock();
+	priv->locked_vma = NULL;
+	priv->mmap_locked = false;
+
+	return 0;
 }
 
-static void query_vma_teardown(struct mm_struct *mm, struct vm_area_struct *vma)
+static void query_vma_teardown(struct proc_maps_private *priv)
 {
-	mmap_read_unlock(mm);
+	unlock_vma(priv);
+	rcu_read_unlock();
+}
+
+static struct vm_area_struct *query_vma_find_by_addr(struct proc_maps_private *priv,
+						     unsigned long addr)
+{
+	vma_iter_init(&priv->iter, priv->mm, addr);
+	return get_next_vma(priv, addr);
+}
+
+#else /* CONFIG_PER_VMA_LOCK */
+
+static int query_vma_setup(struct proc_maps_private *priv)
+{
+	return mmap_read_lock_killable(priv->mm);
+}
+
+static void query_vma_teardown(struct proc_maps_private *priv)
+{
+	mmap_read_unlock(priv->mm);
 }
 
-static struct vm_area_struct *query_vma_find_by_addr(struct mm_struct *mm, unsigned long addr)
+static struct vm_area_struct *query_vma_find_by_addr(struct proc_maps_private *priv,
+						     unsigned long addr)
 {
-	return find_vma(mm, addr);
+	return find_vma(priv->mm, addr);
 }
 
-static struct vm_area_struct *query_matching_vma(struct mm_struct *mm,
+#endif  /* CONFIG_PER_VMA_LOCK */
+
+static struct vm_area_struct *query_matching_vma(struct proc_maps_private *priv,
 						 unsigned long addr, u32 flags)
 {
 	struct vm_area_struct *vma;
 
 next_vma:
-	vma = query_vma_find_by_addr(mm, addr);
+	vma = query_vma_find_by_addr(priv, addr);
+	if (IS_ERR(vma))
+		return vma;
+
 	if (!vma)
 		goto no_vma;
 
@@ -647,13 +679,13 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
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
@@ -738,7 +770,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	}
 
 	/* unlock vma or mmap_lock, and put mm_struct before copying data to user */
-	query_vma_teardown(mm, vma);
+	query_vma_teardown(priv);
 	mmput(mm);
 
 	if (karg.vma_name_size && copy_to_user(u64_to_user_ptr(karg.vma_name_addr),
@@ -758,7 +790,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	return 0;
 
 out:
-	query_vma_teardown(mm, vma);
+	query_vma_teardown(priv);
 	mmput(mm);
 	kfree(name_buf);
 	return err;
-- 
2.49.0.1266.g31b7d2e469-goog

