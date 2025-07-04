Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3562DE710
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642748; cv=none; b=PGMxKCRt+tbKOv9RWs+yoLfw/2nHXcWi/ueLbfPVpOcXIqCfd8IsFO4qkvwYcpM34jcegCExt/8iaTWr2C3V91tnDswJCSpfCSJhbD54ukijkQ4KTAjyoPII7ofKUGs69v8Qg+/Q6SL3Tm+Fbwwn3IUNmqDwxkF5stwRR31HA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642748; c=relaxed/simple;
	bh=c/wwj7NoTIZ6brrC+Uki7csFkVScCU8q323cPmYgFk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qds5nv9q80NGhBxZ+Swznadu/5mISoL26Dcm9H2P7u96+4G9PAJwOxdmilnRo53rRp0ZE9c1ppOzV0/Vg9tHKzSs2QOX6e0aOkPSnqUYmQ1L4aZLUd+SdKTrB5Odnvo1wFCd8idv6GR1ZA9VA1WSU/j0/+d8W92c0ZENgudxESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQs0VSMi; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQs0VSMi"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b16a0e38so1317080e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642745; x=1752247545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHUeFclyhwsVTJxzUfzvQTESeuKzcTwA3vHG8FET718=;
        b=XQs0VSMiJ07UlmnprxyuG/r1jiTdgr0fL1324bO72bihUTtvB120cRNX5q8qutTdPr
         FdTtPiLsiC88cKlwYGOAbK9IavxyhyH7nt5zBKvAcgF77NOzDXENIg04UMK79KUumj8f
         jHSDasgF13fAecZHpjusyW4/5knkdVxXoJzh3dN2xgpaVIs2BY7AMS8EYnQz0DtZVaYL
         QI3wAqHp5y3vZYZOBk9g4O+5DvUQqvoC3hpZR5adgU3+EqRgwFUBl3ilZIZ+apibeuKp
         1cjkf2jTfp7dhM9y02+gVc6u5MbDQOqza10fczEn3MZN2KLbQobV3f+qWas6/BIWFVWX
         rYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642745; x=1752247545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHUeFclyhwsVTJxzUfzvQTESeuKzcTwA3vHG8FET718=;
        b=JjENYAZjTcS4eziS4OZkt29YfZ8WqlmTEo/OpIzTwRlB6nF9pg/L5j+CWx2GdahSzl
         vXhKgHz0gGv/Rm6qpZhQHrr5eLr7VdWMume+qpI5YRyHDE73z+M3CA/A1ZgvCekCcBP2
         Lb+5o2nHazrfYKrcx7qb6BmHOLl5y3lq0QT4XX4htNEwNjTlFz6vq+4Nol5UaR6/InB8
         tUM5wyJGbP23zsY5fF6do9jld5fVD/J1CVukCi6lHQFyLiK4trD1E+lN2JGFKKxzpgRC
         eHO1mbRKqoCB9IRJwpUEvlHBHmOuDksA6Qls6wZPmdySOgMKtH4ZlkC4ZxfDUIbyPZHz
         3U2g==
X-Forwarded-Encrypted: i=1; AJvYcCV8gCRzErZSC2Ij/3GY598nvoNxJk+AmyATqshc2xtDm13NRtk/j+wiQ7J75S2a7Z6XZJfikYhfYZgFPCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD7uLAWuO/dhJSwwKAByaR+dmfbGDdJ7c/lm36SwIQKrJjvhNb
	CMgD5IjTi55hgYRQo/kheUnIHGDxqPdO6YFqZ1ofDCmX2hEHc1vh72IS
X-Gm-Gg: ASbGnctIvyi+J1BUD3soQ87Rw7A2ohVgkyNE1adh4Tu+aGZcmXKGpQVycFbIIhEeMGt
	zvc4xKFM5h2LrQ/KnKtLHyLTKvzUclmeuu7TbMtwpPs9wL4v/sSvMYQh7PkuEfaqgBtyrDx574+
	FBzJvS/HdtgeXGnb1QodwKcV/F2HKj0PHlG++9jPWZG4Nlq2HCnzheNhqS46h3buOwG8MHoZnVk
	XhJJ02cg80Ob5jyw39v12IakYI2aMgf67dO3yN0NOxE4TPTRhHz1yLuSxYcceB3DCU5HipU6bJ+
	BIouOmp55KTiwsfatxKF9+ZR43yZHwkH8A0Vc3FEqH05EgWRsCR+8H9zbg==
X-Google-Smtp-Source: AGHT+IF9kNVMLIoDCz9z6Zd+gvYPf6NxUQYP6tWGaRRecVqu4l25Lqb05sgsp0OcAW+jSRltea3qnQ==
X-Received: by 2002:a05:6512:12c8:b0:553:35f5:7aac with SMTP id 2adb3069b0e04-556dd1e4a26mr931874e87.48.1751642744366;
        Fri, 04 Jul 2025 08:25:44 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:43 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 5/7] mm/vmalloc: Defer freeing partly initialized vm_struct
Date: Fri,  4 Jul 2025 17:25:35 +0200
Message-Id: <20250704152537.55724-6-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704152537.55724-1-urezki@gmail.com>
References: <20250704152537.55724-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vmalloc_area_node() may call free_vmap_area() or vfree() on
error paths, both of which can sleep. This becomes problematic
if the function is invoked from an atomic context, such as when
GFP_ATOMIC or GFP_NOWAIT is passed via gfp_mask.

To fix this, unify error paths and defer the cleanup of partly
initialized vm_struct objects to a workqueue. This ensures that
freeing happens in a process context and avoids invalid sleeps
in atomic regions.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5bac15b09b03..2eaff0575a9e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3677,6 +3677,36 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
 	return nr_allocated;
 }
 
+static LLIST_HEAD(pending_vm_area_cleanup);
+
+static void cleanup_vm_area_work(struct work_struct *work)
+{
+	struct llist_node *node, *next;
+	struct vm_struct *vm;
+
+	llist_for_each_safe(node, next, llist_del_all(&pending_vm_area_cleanup)) {
+		vm = (void *) node - offsetof(struct vm_struct, next);
+
+		if (!vm->nr_pages)
+			free_vm_area(vm);
+		else
+			vfree(vm->addr);
+	}
+}
+
+static DECLARE_WORK(cleanup_vm_area, cleanup_vm_area_work);
+
+/*
+ * Helper for __vmalloc_area_node() to defer cleanup
+ * of partially initialized vm_struct in error paths.
+ */
+static void
+defer_vm_area_cleanup(struct vm_struct *area)
+{
+	if (llist_add((struct llist_node *) &area->next, &pending_vm_area_cleanup))
+		schedule_work(&cleanup_vm_area);
+}
+
 static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 				 pgprot_t prot, unsigned int page_shift,
 				 int node)
@@ -3708,8 +3738,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 		warn_alloc(gfp_mask, NULL,
 			"vmalloc error: size %lu, failed to allocated page array size %lu",
 			nr_small_pages * PAGE_SIZE, array_size);
-		free_vm_area(area);
-		return NULL;
+		goto fail;
 	}
 
 	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
@@ -3786,7 +3815,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	return area->addr;
 
 fail:
-	vfree(area->addr);
+	defer_vm_area_cleanup(area);
 	return NULL;
 }
 
-- 
2.39.5

