Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE3125DF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745285182; cv=none; b=EwBpzadem5KYJUjv9rs2aXVF+d7aVYFuXrqvgzZMliSTGhHlTzhFvAkmhPnb+roRnk0mRBSfBOye1uuQujNz27b+SXGsUdKGcivqzQDisxdiQvtpJMn2PQ6g7M6pc/1zBPPg8YaKVeFAuf0l5OD2icnbY35W2maP3cDG2afvHK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745285182; c=relaxed/simple;
	bh=ZXS1Ugxdib21vsYVjEPkJZvWOpqCDSOCHmByvy/LywQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTo5L1BuTn7h3aZpQ3xt5Yk1Kp43KbT331CQbAmCTNmD5GjijE+jlhr0EDH+KdyqNurIvAzuUpus+PaqEweE4mqydUucYRtBdA9h890sbz0//icO8nOJJSbOHxW8r3Q4GTE7cBTqFNYQKDxUlbcAg9OKJIIc+9PiR03d24zB/E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jE58Wm2c; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jE58Wm2c"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f2b05f87bcso45788676d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745285180; x=1745889980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1mPVA4cXPg0N1mX+v1sOAvzy+p3OvMqYnhewp9Uhag=;
        b=jE58Wm2ciC9VU6K0JoSWEbV4Esf7PvCZ+G9e9AdyepwpGXq+0mT/SMTD8n4lO2XAWN
         jVWvjDTLkPxX84hTNHAGNMdenDoPlCxxCHsbZao15Lpqdn8sV5KD0u55LOD4UF2ht+mK
         Lkt5Z8e/FSpj+DRXYGqGM+6xUe+mR6tv8otKuNLrIHd7smQce5Hvg66D1PURFghgWiNi
         YFvaPltZn+bkl6FCFzJekYdH7Es4ghrMmO0Zozhkx6k4RrI41vtYGUWQTuKETI5y4c5G
         K/FGbRPwYTejaTpKoKchEhSpv1zKcP2tI60o7XyymrbEDoqmHDCwcJPxG73CCUwiHrPe
         2Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745285180; x=1745889980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1mPVA4cXPg0N1mX+v1sOAvzy+p3OvMqYnhewp9Uhag=;
        b=J9jGtjWYEa1mFpRUMf+U94g+R7IbsN70D9n53yXAGfd1E+aU2qttf/uGZkNuZpcW7B
         1qixnhsTBdgqsm6r8JhIXJbf+8c5SRR9MsNkWTMO2v1+u42BLBsNAXnfY0x7UMGBRE+d
         XETaha3LaMQ6Jq2wRIwqjL6b69Zu9Vpp2oh5Lh/yJPcrdJMiBkzgbc5u303f+9OuizNr
         6sgszp7bNdJeIZC0Z0rhgabNQEM4DCkvmND/ArwMcsigHl6jAQbsPBqV8vOFH1tNzq9H
         DLQGBxv28bCSkbjYei0Xvx2VMo0kG+8v7m88G3dyX1b2grzuwEjIXdGxTOqPy6VstjnT
         FMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx142kXBluoZLU56OhQmFck/kvw41X8ndtyT20IZnDn62+dbo9LFOzPpmxk4ZcKg14B4Q0XSeqToCOxW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPj1NhCYvRNdgv+BliqE78iimwIkWSI2kLZaR1a6eymKjEeyLy
	KMWHuh4Vxu2TlxEq2UcwLxP15FVcPTn5X2y466BMGsa8HZU0bavlEACrxJNQyAU=
X-Gm-Gg: ASbGnct/yxLzTtdqYus8/bAgcF/t+4A9iMKwkKWkJ4gahbETsOwo+ML+BXEg/NuRyYg
	vU3lVSDUXjEKFsomU5SXr0LYy2v//ZVbmM+wxGrZbbcLsLnR37KLWlMTZGFBOivPS6KJ8E0DXSx
	atkeG53FFuYRkcXBrvRvxq2pv3kDaEMHChQZyyadF3W7W1/aXSLMajs71k/d3igru12SaM6bq00
	lrn0VghA8fCu4X3RpLc1jB9CtwMFSKGodU52bxCJdycyuuQKnyWX2MgiW3K2j0zmKY8xQLixtYX
	n6c0gwwpyu7xsk6gcFXlpJVkUFHJ6XkBkui75qZTbkrjjxpcAeGVOufMiRvJZ9chybsh6W35Gt9
	rq8Rf+YAQ6Q2V4Rct6QzeRYViGZ0f
X-Google-Smtp-Source: AGHT+IGPO18DH4WOgXP7cL3OCDqBNIt/HyTq16JBra9RvS5NgW2B0W0WDaXjFUz6XK3UscEHnrDmXg==
X-Received: by 2002:a05:6214:5081:b0:6f2:b7d9:689b with SMTP id 6a1803df08f44-6f2c4687f17mr226624926d6.35.1745285179659;
        Mon, 21 Apr 2025 18:26:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c00d78sm50985746d6.79.2025.04.21.18.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 18:26:19 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	longman@redhat.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	akpm@linux-foundation.org
Subject: [PATCH v4 1/2] cpuset: rename cpuset_node_allowed to cpuset_current_node_allowed
Date: Mon, 21 Apr 2025 21:26:14 -0400
Message-ID: <20250422012616.1883287-2-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422012616.1883287-1-gourry@gourry.net>
References: <20250422012616.1883287-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename cpuset_node_allowed to reflect that the function checks the
current task's cpuset.mems.  This allows us to make a new
cpuset_node_allowed function that checks a target cgroup's cpuset.mems.

Acked-by: Waiman Long <longman@redhat.com>
Acked-by: Tejun Heo <tj@kernel.org>
Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/cpuset.h | 4 ++--
 kernel/cgroup/cpuset.c | 4 ++--
 mm/page_alloc.c        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
index 835e7b793f6a..893a4c340d48 100644
--- a/include/linux/cpuset.h
+++ b/include/linux/cpuset.h
@@ -82,11 +82,11 @@ extern nodemask_t cpuset_mems_allowed(struct task_struct *p);
 void cpuset_init_current_mems_allowed(void);
 int cpuset_nodemask_valid_mems_allowed(nodemask_t *nodemask);
 
-extern bool cpuset_node_allowed(int node, gfp_t gfp_mask);
+extern bool cpuset_current_node_allowed(int node, gfp_t gfp_mask);
 
 static inline bool __cpuset_zone_allowed(struct zone *z, gfp_t gfp_mask)
 {
-	return cpuset_node_allowed(zone_to_nid(z), gfp_mask);
+	return cpuset_current_node_allowed(zone_to_nid(z), gfp_mask);
 }
 
 static inline bool cpuset_zone_allowed(struct zone *z, gfp_t gfp_mask)
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 0f910c828973..f8e6a9b642cb 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4090,7 +4090,7 @@ static struct cpuset *nearest_hardwall_ancestor(struct cpuset *cs)
 }
 
 /*
- * cpuset_node_allowed - Can we allocate on a memory node?
+ * cpuset_current_node_allowed - Can current task allocate on a memory node?
  * @node: is this an allowed node?
  * @gfp_mask: memory allocation flags
  *
@@ -4129,7 +4129,7 @@ static struct cpuset *nearest_hardwall_ancestor(struct cpuset *cs)
  *	GFP_KERNEL   - any node in enclosing hardwalled cpuset ok
  *	GFP_USER     - only nodes in current tasks mems allowed ok.
  */
-bool cpuset_node_allowed(int node, gfp_t gfp_mask)
+bool cpuset_current_node_allowed(int node, gfp_t gfp_mask)
 {
 	struct cpuset *cs;		/* current cpuset ancestors */
 	bool allowed;			/* is allocation in zone z allowed? */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5079b1b04d49..233ce25f8f3d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3461,7 +3461,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 retry:
 	/*
 	 * Scan zonelist, looking for a zone with enough free.
-	 * See also cpuset_node_allowed() comment in kernel/cgroup/cpuset.c.
+	 * See also cpuset_current_node_allowed() comment in kernel/cgroup/cpuset.c.
 	 */
 	no_fallback = alloc_flags & ALLOC_NOFRAGMENT;
 	z = ac->preferred_zoneref;
@@ -4148,7 +4148,7 @@ gfp_to_alloc_flags(gfp_t gfp_mask, unsigned int order)
 		/*
 		 * Ignore cpuset mems for non-blocking __GFP_HIGH (probably
 		 * GFP_ATOMIC) rather than fail, see the comment for
-		 * cpuset_node_allowed().
+		 * cpuset_current_node_allowed().
 		 */
 		if (alloc_flags & ALLOC_MIN_RESERVE)
 			alloc_flags &= ~ALLOC_CPUSET;
-- 
2.49.0

