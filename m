Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE9A22539F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998627; cv=none; b=NVzF3LZDczR7OoQBs7ivaZQCx4xBttnFCBoOmtdxOhzIaNHCoEOMX6KlrKAXy+Y1BWBnZgp6sFiMo688tVzjgBL8YcAQFxgevSegGM02CYZVILveSaVSSAvTGmIb3MvKBBwLYvutkcMdD/WBwboHk0aJg7Ebk19Q5UDPX7CtLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998627; c=relaxed/simple;
	bh=0VmCWLkn+PpW3InwqLr223zLcy4GX+RqloQObCjZ3BI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aj3OkjvywezQwEFgTt60sBt2UntOMhD8lR7HQgUbk1Nta4Zz6Ferhx9rOzlRvzQ4O4+PK7huxjd5NSe9eNM19L40Qvejmed6wZiCkx4oqZzsfDIzgxEM14Tz1wzSee8LCdefqa2fspxReVXrxaUMk0Dbrg2ZTXE2BahZgvYotq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sA7cSpEr; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sA7cSpEr"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-225ab228a37so19079845ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744998616; x=1745603416; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g/gTsaXuJx1lGF+ktcF8yVCekjdFoDtmHyOs+3ik9i4=;
        b=sA7cSpEr6d/lRDaTrwePeHKs/3e1PjU9ZccRpuy/juBfMaDtMhXeMmg/l/86rdHJXM
         SCC4DiRJcjoknFeD1nKeMalx3XJd4luigYHWXHusq01aD7BwDJsnH/TJZ/avZhiPKT5Q
         hOnItm1TVmZDGKkEZ45DpICf1krvwzUoro6b6ASKbWH+J3Avs1DmhSrmw10+KzQzPhwZ
         E6vd1BWLiH8tX1hcAyCdYRNvwXKtGFsR0rLSa/JvTj5MaIBv0FK4zhY06y+e0uawTotp
         iWHdTRL/uF8Rx+8QsxUIakLGofTdFeUtAMWS6Kw2F04lQtL+OWeLbQ28pzkRXBCk5ENM
         v5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998616; x=1745603416;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/gTsaXuJx1lGF+ktcF8yVCekjdFoDtmHyOs+3ik9i4=;
        b=VBBEDXPNCI85JTOt2xaLIyOukOJmVWLVZxYkwbsIMsR42wkqMC6bbTdsrCjLErfBup
         idbRNWCw0FS1E7zDDR4o2ODPXKC6WTOZdwjWA+hDE/Cyt5YpdE5DcWfdwlZacRYywW9I
         KDxv5LjwOldvtHf1FKXGGoLURcwmNVQ72yLQ2FEWEFk75ZZ7nQShiQrSvaTAV3qiAPC/
         KHf1jkk72bsQTJenw6bZ4bYdRzDnihP3yhGMsCD9o7pvtNqCjDL04/JOkotXkyU1Rqwj
         ihB4Iz4Esxr5ZJyOcw1qV1Vy7XUkK45KPgT2ITwZk5faRt6sN9wocmfEyFEZeiswuidi
         mc9w==
X-Forwarded-Encrypted: i=1; AJvYcCVpjRRZr/E/yLXBWIBKmqj7Nc6udoREq9UpFbSsWSpgh/TYaa7L/H0L79N5Bx+jdSBuRPlPYewxvdAP0Ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJDAHqa67pTBk4WECIHlT3nwsaqdhI9o1PNWgrY4Va+FSKrIM
	t39pgnqRCDuAoP6SJWpuj2Jhmtf/O7mWRE3pG281Srzi2JhL88dsH2bTBXfNgdxaWBwgEHNpmMY
	7nQ==
X-Google-Smtp-Source: AGHT+IGjcICUXwS1wYeFYZR+XrM2Xg014/1EfWbXSEfTLiETYQCBjkJqO1ncD1j5guZx5QFaNlxV4IfN5dY=
X-Received: from plld7.prod.google.com ([2002:a17:902:7287:b0:223:8244:94f6])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1744:b0:227:e980:919d
 with SMTP id d9443c01a7336-22c536207dfmr51660975ad.47.1744998616385; Fri, 18
 Apr 2025 10:50:16 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:49:57 -0700
In-Reply-To: <20250418174959.1431962-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418174959.1431962-1-surenb@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418174959.1431962-7-surenb@google.com>
Subject: [PATCH v3 6/8] mm: make vm_area_struct anon_name field RCU-safe
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

For lockless /proc/pid/maps reading we have to ensure all the fields
used when generating the output are RCU-safe. The only pointer fields
in vm_area_struct which are used to generate that file's output are
vm_file and anon_name. vm_file is RCU-safe but anon_name is not. Make
anon_name RCU-safe as well.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm_inline.h | 10 +++++++++-
 include/linux/mm_types.h  |  3 ++-
 mm/madvise.c              | 30 ++++++++++++++++++++++++++----
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index f9157a0c42a5..9ac2d92d7ede 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -410,7 +410,7 @@ static inline void dup_anon_vma_name(struct vm_area_struct *orig_vma,
 	struct anon_vma_name *anon_name = anon_vma_name(orig_vma);
 
 	if (anon_name)
-		new_vma->anon_name = anon_vma_name_reuse(anon_name);
+		rcu_assign_pointer(new_vma->anon_name, anon_vma_name_reuse(anon_name));
 }
 
 static inline void free_anon_vma_name(struct vm_area_struct *vma)
@@ -432,6 +432,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
 		!strcmp(anon_name1->name, anon_name2->name);
 }
 
+struct anon_vma_name *anon_vma_name_get_rcu(struct vm_area_struct *vma);
+
 #else /* CONFIG_ANON_VMA_NAME */
 static inline void anon_vma_name_get(struct anon_vma_name *anon_name) {}
 static inline void anon_vma_name_put(struct anon_vma_name *anon_name) {}
@@ -445,6 +447,12 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
 	return true;
 }
 
+static inline
+struct anon_vma_name *anon_vma_name_get_rcu(struct vm_area_struct *vma)
+{
+	return NULL;
+}
+
 #endif  /* CONFIG_ANON_VMA_NAME */
 
 static inline void init_tlb_flush_pending(struct mm_struct *mm)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f9..15ec288d4a21 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -700,6 +700,7 @@ struct vm_userfaultfd_ctx {};
 
 struct anon_vma_name {
 	struct kref kref;
+	struct rcu_head rcu;
 	/* The name needs to be at the end because it is dynamically sized. */
 	char name[];
 };
@@ -874,7 +875,7 @@ struct vm_area_struct {
 	 * terminated string containing the name given to the vma, or NULL if
 	 * unnamed. Serialized by mmap_lock. Use anon_vma_name to access.
 	 */
-	struct anon_vma_name *anon_name;
+	struct anon_vma_name __rcu *anon_name;
 #endif
 	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
 } __randomize_layout;
diff --git a/mm/madvise.c b/mm/madvise.c
index 8433ac9b27e0..ed03a5a2c140 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -101,14 +101,15 @@ void anon_vma_name_free(struct kref *kref)
 {
 	struct anon_vma_name *anon_name =
 			container_of(kref, struct anon_vma_name, kref);
-	kfree(anon_name);
+	kfree_rcu(anon_name, rcu);
 }
 
 struct anon_vma_name *anon_vma_name(struct vm_area_struct *vma)
 {
 	mmap_assert_locked(vma->vm_mm);
 
-	return vma->anon_name;
+	return rcu_dereference_protected(vma->anon_name,
+		rwsem_is_locked(&vma->vm_mm->mmap_lock));
 }
 
 /* mmap_lock should be write-locked */
@@ -118,7 +119,7 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 	struct anon_vma_name *orig_name = anon_vma_name(vma);
 
 	if (!anon_name) {
-		vma->anon_name = NULL;
+		rcu_assign_pointer(vma->anon_name, NULL);
 		anon_vma_name_put(orig_name);
 		return 0;
 	}
@@ -126,11 +127,32 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 	if (anon_vma_name_eq(orig_name, anon_name))
 		return 0;
 
-	vma->anon_name = anon_vma_name_reuse(anon_name);
+	rcu_assign_pointer(vma->anon_name, anon_vma_name_reuse(anon_name));
 	anon_vma_name_put(orig_name);
 
 	return 0;
 }
+
+/*
+ * Returned anon_vma_name is stable due to elevated refcount but not guaranteed
+ * to be assigned to the original VMA after the call.
+ */
+struct anon_vma_name *anon_vma_name_get_rcu(struct vm_area_struct *vma)
+{
+	struct anon_vma_name __rcu *anon_name;
+
+	WARN_ON_ONCE(!rcu_read_lock_held());
+
+	anon_name = rcu_dereference(vma->anon_name);
+	if (!anon_name)
+		return NULL;
+
+	if (unlikely(!kref_get_unless_zero(&anon_name->kref)))
+		return NULL;
+
+	return anon_name;
+}
+
 #else /* CONFIG_ANON_VMA_NAME */
 static int replace_anon_vma_name(struct vm_area_struct *vma,
 				 struct anon_vma_name *anon_name)
-- 
2.49.0.805.g082f7c87e0-goog

