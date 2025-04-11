Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0B129DB7B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 22:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744409494; cv=none; b=s8WGrnl8zguFMC5gxf1pvJ2QjMXmWIjDovjOEueF87E/i+0NtfFHpM1jzMkvYHH91K9HkJ8AsNP7lj6eBf96iJRPipG2yMYxkeY39mbpOtW7pK8yt0ZhQ3p1dQ9D6tyM8ZzSst9oK0M0qHL9aJlmZwIySYCSjeqk/zScmQ4mZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744409494; c=relaxed/simple;
	bh=nfrDkSS69ALMZvuAOcuriMpQshAiIZWjYt9NVykTxFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBmi771JxXdmAHTV2bBEBZSDNLCuuVtcaB9ZcwtuBlxTdfn2rCtDlA/Z05lZGhQ35ZKTh5ZBtIhhm8W5ikFmo3qQYtzZEKOkBYaTrJ88rt9m80s6oJ7VZWC+kRY9X0m+fMeGHDbJNEuWhHFYRjL/dCCWPx46xfGiS/nEAXpQwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lqT08Vno; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lqT08Vno"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5e39d1e0eso238298885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744409491; x=1745014291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5YNFEpOhSyGeshVOVn0cluqTsil4Fjix8dEWaIhL+s=;
        b=lqT08VnoXt7+pyAQBqERlWWAI22fbZhAu1YJvKawKsB02iLvVPV94c0xoenZJY4epY
         feCaN2t7E8UzqcWUKAa4ZKdMV9/QJEwyhqmI1A0RFSvxgWhWtSqSM0oq7NoldJVLA1wy
         tVgyPNamg3oDCooJRCSq+9lTTZTpWDAy2nL8K3HIMBc6MMnN9DwxY9shFZqcfhmsHBQH
         3CsiFGGB7CpSCkAaoMNytbbhDff6OGpLJ2x7o9wwnuxPnnGDOOghufLRSZpITLt1OPBD
         val5rPhb5W4K/hXtzGIdXRELA6quueMhiAHCcsbzyvkNkdjRJ5SMrX9hFDWU6OsE1t+i
         AMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409491; x=1745014291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5YNFEpOhSyGeshVOVn0cluqTsil4Fjix8dEWaIhL+s=;
        b=dHjDp6KYE6wKm4U3PU2HdeEzIyYj36Y6HpcIl79oawpwJRPwZfjH18Mh9rLODlmaxa
         xrx0qCmWiTej5e9rQpDSDkDLsTAGmWM30/CC4uLn32mf4L/snoYWiEiOXHVBjlTHl9Ml
         si8slTolmepmkWH1gNECrACbKV1DB0bjBakO0dA5kE4cVbdsME37OHoJ/WiAHzfnB8Cl
         bNplEdWX34v9Jbtg77aZWMaHNLZE/bke9mHuaKSl+ElCfBCsy6EyxG83U3bnBG/F+8c3
         2sQVhXOuQpAaBmHZac3rM8kWSTJJvkfIZ5bQEDzl/AiFGEqd+r/gfSePHA7IFZK/2R2B
         kasA==
X-Forwarded-Encrypted: i=1; AJvYcCVmfs6NBEe3L4gAMIVNCaVbIlDhNA0R1Gj6TgY6G7UJmjIWEkK315CBSPkkAnlqRqBYdb9taRHoUrt1/R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhShMRIIeY/Y80ZA1xs5Y8wI76ZulOrBXrX4neS41v3sGfdU+B
	IBQhgLSO+tKcHVPhSCAlsALv7vpev4eWO8BVHdD/WSzgAdxJgCFD3eUIs6aEc54=
X-Gm-Gg: ASbGncuVHOkCd0BevKyVvto3cl+9+zGIoVUDllZuCHlSYYqvVVfAgN/TTPxs2beTIX1
	HYdjaekQDjWymIyBx1i75zFFGvFKplJysmyS2taxjcEl8aeiXBmNjlqmbyfKJEQE8szua21KW01
	BrERsNkg2NHWQ7Z29EpFUhKqkN2O3BWoMarqRDfGwTL2jHNW/JQucuQ3uMkNek/SPrO928v3J/B
	LyhJ8hytf/eDfeIuI+RsbvSvVxEAgjzckG60Iwyk95VEYFREF90ZsKCQ+i4qC4/E0tz3cY4I3Zu
	045xm81Fw1kzbUGHtopx6cxJXAAMdYeQfcss8040mqXxgkm2wQwV+XE8wjTtHbCvjAGejM6UAC/
	xusLF71BMCf8gFajesFOQ+Urpm69Z
X-Google-Smtp-Source: AGHT+IG9qHcOzeGKgfSIUSMZuVF3zPqI8cqev16IPbyVhxpBuj3GWu8bqjSiMRFJ1sRmmBEkXIy2mQ==
X-Received: by 2002:a05:620a:4492:b0:7c7:a554:e2a5 with SMTP id af79cd13be357-7c7af1e700amr682491785a.44.1744409491351;
        Fri, 11 Apr 2025 15:11:31 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943afcsm321264485a.16.2025.04.11.15.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:11:31 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	donettom@linux.ibm.com
Subject: [RFC PATCH v4 2/6] memory: allow non-fault migration in numa_migrate_check path
Date: Fri, 11 Apr 2025 18:11:07 -0400
Message-ID: <20250411221111.493193-3-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411221111.493193-1-gourry@gourry.net>
References: <20250411221111.493193-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_migrate_check and mpol_misplaced presume callers are in the
fault path with accessed to a VMA.  To enable migrations from page
cache, re-using the same logic to handle migration prep is preferable.

Mildly refactor numa_migrate_check and mpol_misplaced so that they may
be called with (vmf = NULL) from non-faulting paths.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory.c    | 24 ++++++++++++++----------
 mm/mempolicy.c | 25 +++++++++++++++++--------
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 3900225d99c5..e72b0d8df647 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5665,7 +5665,20 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 		      unsigned long addr, int *flags,
 		      bool writable, int *last_cpupid)
 {
-	struct vm_area_struct *vma = vmf->vma;
+	if (vmf) {
+		struct vm_area_struct *vma = vmf->vma;
+		const vm_flags_t vmflags = vma->vm_flags;
+
+		/*
+		 * Flag if the folio is shared between multiple address spaces. This
+		 * is later used when determining whether to group tasks together
+		 */
+		if (folio_maybe_mapped_shared(folio) && (vmflags & VM_SHARED))
+			*flags |= TNF_SHARED;
+
+		/* Record the current PID acceesing VMA */
+		vma_set_access_pid_bit(vma);
+	}
 
 	/*
 	 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
@@ -5678,12 +5691,6 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 	if (!writable)
 		*flags |= TNF_NO_GROUP;
 
-	/*
-	 * Flag if the folio is shared between multiple address spaces. This
-	 * is later used when determining whether to group tasks together
-	 */
-	if (folio_maybe_mapped_shared(folio) && (vma->vm_flags & VM_SHARED))
-		*flags |= TNF_SHARED;
 	/*
 	 * For memory tiering mode, cpupid of slow memory page is used
 	 * to record page access time.  So use default value.
@@ -5693,9 +5700,6 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 	else
 		*last_cpupid = folio_last_cpupid(folio);
 
-	/* Record the current PID acceesing VMA */
-	vma_set_access_pid_bit(vma);
-
 	count_vm_numa_event(NUMA_HINT_FAULTS);
 #ifdef CONFIG_NUMA_BALANCING
 	count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 530e71fe9147..f86a4a9087f4 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2747,12 +2747,16 @@ static void sp_free(struct sp_node *n)
  * mpol_misplaced - check whether current folio node is valid in policy
  *
  * @folio: folio to be checked
- * @vmf: structure describing the fault
+ * @vmf: structure describing the fault (NULL if called outside fault path)
  * @addr: virtual address in @vma for shared policy lookup and interleave policy
+ *	  Ignored if vmf is NULL.
  *
  * Lookup current policy node id for vma,addr and "compare to" folio's
- * node id.  Policy determination "mimics" alloc_page_vma().
- * Called from fault path where we know the vma and faulting address.
+ * node id - or task's policy node id if vmf is NULL.  Policy determination
+ * "mimics" alloc_page_vma().
+ *
+ * vmf must be non-NULL if called from fault path where we know the vma and
+ * faulting address. The PTL must be held by caller if vmf is not NULL.
  *
  * Return: NUMA_NO_NODE if the page is in a node that is valid for this
  * policy, or a suitable node ID to allocate a replacement folio from.
@@ -2764,7 +2768,6 @@ int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
 	pgoff_t ilx;
 	struct zoneref *z;
 	int curnid = folio_nid(folio);
-	struct vm_area_struct *vma = vmf->vma;
 	int thiscpu = raw_smp_processor_id();
 	int thisnid = numa_node_id();
 	int polnid = NUMA_NO_NODE;
@@ -2774,18 +2777,24 @@ int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
 	 * Make sure ptl is held so that we don't preempt and we
 	 * have a stable smp processor id
 	 */
-	lockdep_assert_held(vmf->ptl);
-	pol = get_vma_policy(vma, addr, folio_order(folio), &ilx);
+	if (vmf) {
+		lockdep_assert_held(vmf->ptl);
+		pol = get_vma_policy(vmf->vma, addr, folio_order(folio), &ilx);
+	} else {
+		pol = get_task_policy(current);
+	}
 	if (!(pol->flags & MPOL_F_MOF))
 		goto out;
 
 	switch (pol->mode) {
 	case MPOL_INTERLEAVE:
-		polnid = interleave_nid(pol, ilx);
+		polnid = vmf ? interleave_nid(pol, ilx) :
+			       interleave_nodes(pol);
 		break;
 
 	case MPOL_WEIGHTED_INTERLEAVE:
-		polnid = weighted_interleave_nid(pol, ilx);
+		polnid = vmf ? weighted_interleave_nid(pol, ilx) :
+			       weighted_interleave_nodes(pol);
 		break;
 
 	case MPOL_PREFERRED:
-- 
2.49.0

