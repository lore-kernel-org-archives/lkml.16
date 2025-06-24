Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26AA2ED146
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793659; cv=none; b=Uq5Z9lnypt0sES/ltsmPWBx4oanpM4ry3DGf+xc3yqSieBrufFR/hoT/tEXICgXSJHhnUhyVgD4eGp32DR8lnOYYKshlOr6usBIw3uEyyoDNtQqq91aAjr/H+Xv3wUj7KAXS/nIgySN9/xMnHfe1bcYQgOg+iGyYlYretxPTcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793659; c=relaxed/simple;
	bh=XrkCL8NpzlaF/n3BVH9B6erYWI4M51jhFfWUSpSZR4I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m5/tnWLP3aq5vamc5A7lz6NBiDdpJbFLH+CdtmflSFMSY6gUsySqlGOVg84H8oOs6HAZvp98CoZ150zTNF2dp8/oIZZsH9xfC1/+sx2H8qnkmGWHjxcm/hns1gej3dyYw8Qa6HcUwT5YmjJr3zqVjEkhh0xhTccIcBvEd+vmjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bkdiY3j0; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bkdiY3j0"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-740774348f6so424282b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750793657; x=1751398457; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BERKeqLlcPDyrSUuZIHMWPi0iaWreXsjzz5dAn8mkk=;
        b=bkdiY3j0wIAYJhRcwLEPLslfcOeGaFBVIfREiNARIzV5FYSH6FpPb+wcz8zxnXa+J3
         cGE/tATlBHEhPYlAOlkqtacmgwIxmJAkg1qhoX6OOEo/6cjEWsl3DXqIl68JnK1zpsU5
         sWUV+TlmnqXj6FvKVgvPLaeC1FLaBCpF9q3aTV/cbP03D/fCc0KhiJqxGzVJy7SAQTa2
         Vv9HLX/cEOXYDXST7Xz1K7WtnPINeVwhSRj74qg1kcMbGS4p+kM0NR1cJYDfwIgusuif
         Xg94RBzMYwwkTuNt04bEL6Av8VKA0E74ObMtmwkwxsR7JcwhZ9D4ywtJrQbGklPpAEFb
         tyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793657; x=1751398457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BERKeqLlcPDyrSUuZIHMWPi0iaWreXsjzz5dAn8mkk=;
        b=iMSGAk5dk1JAfhvPHgzfOmNpkl42lU2jGgh2Pi40k2BMrRx0CLYxe91SPlEhmsq6w3
         G7PmlF/TIPmomWnK8ln8qi2/KnWcD25P4Az0/3tNx203qlkF8+EK59PjXPa6ciKVBCRR
         lzH0/11AThjAnCPqpsL2Wo3sdSiuCrL7O4FCLKTWSdZozPFwqryHieVgbul1FaBQXeyt
         kiR5nsD2tUsmIcSNLXng6ddZj7LQwcXHT/2HJTHTBX8bZQc+hWc0B94KF8T8G2FUO+4R
         A3VAwiyg31snbcqBo2yu1fBBvZ1Wj+fg9Mpv8TKss34Apyn+uNboF8YS/6ZxHW05qVhV
         jrZA==
X-Forwarded-Encrypted: i=1; AJvYcCXaoPjqi8376l3+pzNgDJK/6gugJFgTxdJUf2SfP3ffpOjcgHhZznUqdd3LBJ2E7T823t6PE7N/ScroqEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmakYiFQ4Vdvbs6UR4+CndHd9WpipnJPHTMA6i4UaGthiSbEu7
	AlIUd3WXPGJkka8J/98Rxr/EeQX76WlgfmZZhRYM4U1pEUMtse37LtvXjZoBc20r2cc7kOIplma
	PCz86xQ==
X-Google-Smtp-Source: AGHT+IHtLljtrcUhHYC7Wt+7WKI/a5PDJ4OrDvfWNeRaq5sGEKU3TQKgRzLNMXpoHYXyrtGwyT6oPA3hh2M=
X-Received: from pfrh7.prod.google.com ([2002:aa7:9f47:0:b0:748:4f7c:c605])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6f8b:b0:220:7b2e:5b3f
 with SMTP id adf61e73a8af0-2207f27d61amr271750637.19.1750793657223; Tue, 24
 Jun 2025 12:34:17 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:33:59 -0700
In-Reply-To: <20250624193359.3865351-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624193359.3865351-1-surenb@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250624193359.3865351-8-surenb@google.com>
Subject: [PATCH v5 7/7] mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks
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
Acked-by: Andrii Nakryiko <andrii@kernel.org>
---
 fs/proc/task_mmu.c | 56 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 33171afb5364..f3659046efb7 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -492,28 +492,60 @@ static int pid_maps_open(struct inode *inode, struct file *file)
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
 }
 
-static struct vm_area_struct *query_vma_find_by_addr(struct mm_struct *mm, unsigned long addr)
+static void query_vma_teardown(struct proc_maps_private *priv)
 {
-	return find_vma(mm, addr);
+	mmap_read_unlock(priv->mm);
 }
 
-static struct vm_area_struct *query_matching_vma(struct mm_struct *mm,
+static struct vm_area_struct *query_vma_find_by_addr(struct proc_maps_private *priv,
+						     unsigned long addr)
+{
+	return find_vma(priv->mm, addr);
+}
+
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
 
@@ -589,13 +621,13 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
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
@@ -680,7 +712,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	}
 
 	/* unlock vma or mmap_lock, and put mm_struct before copying data to user */
-	query_vma_teardown(mm, vma);
+	query_vma_teardown(priv);
 	mmput(mm);
 
 	if (karg.vma_name_size && copy_to_user(u64_to_user_ptr(karg.vma_name_addr),
@@ -700,7 +732,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	return 0;
 
 out:
-	query_vma_teardown(mm, vma);
+	query_vma_teardown(priv);
 	mmput(mm);
 	kfree(name_buf);
 	return err;
-- 
2.50.0.714.g196bf9f422-goog

