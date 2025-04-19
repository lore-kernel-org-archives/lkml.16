Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D541465B4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745041112; cv=none; b=jKq5uNXwVvfWtIRmxktdUK+H2kL2rBzKv9C+bRdZTqOKohKNfzQqaB0ZLNax+NWdZdKKhIQ4mlXSPUcCm9jaCL0hYqGpwEdkOwDaMRZAANF3KPlx/goHyVY9NjRbIECsCT5s52YfbDhDvYeBrAoPcMoMbfhV3QSY28B1XZV45hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745041112; c=relaxed/simple;
	bh=c4fUz8aVIrlFPNP5xijmvt4GCQo1SdqFqgZKishAgD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBu5KiKgjczHDwTWESO//z/KLz7PrzEtUePlL8aOa9ogBgiACUJf/oST1f9SVmBKPNBg2Dnv7Ixz0Jwvr1f7izORJuErfaTBEWBL+7m8SRjNd1GcCDyqQ0STNyhXnEVfPD5daC/j/QKc9HGdUMDHLRLV6kMIKeepDz0QuvA8oGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ddIA7ag3; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ddIA7ag3"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f6970326so22246786d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745041110; x=1745645910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1bTt6yFTuQ7vQdV7xpRPwjzlibRkEqLBXyWJok/2X4=;
        b=ddIA7ag3yj8wVbeD8wa8ynrneFqWMX0xxUdR2ltR77Uh/Oy4E6lwMJ5FY1orMZmqcP
         AKPW+RWl/uSXCtFWTpGLxtaRRbRR8/2X56Mpj9RlnbzTMGUJ+VWZTm/HBg7OIYZoErj3
         9+eZCVm6XAPIjiowyNPEMw2tQuzx9Vh6tJoiSabJxwDSkSx9ehVLGEKyJF/3oYQsGQ5F
         eYbuLgPspBX4iwD5Z3V+GXvIm7baGunIYN3GvtNpO1gO4Y8WEd6N6ByZNwTMqKuj2qlj
         2Wb9a4Ke6RgNH7NoHEEM3FhVB2do20cnUK+t/JEi2tHLLQqW5Qd6JRVnz5cN0tGHk6Nb
         xgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745041110; x=1745645910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1bTt6yFTuQ7vQdV7xpRPwjzlibRkEqLBXyWJok/2X4=;
        b=gBARn4u67B8gNc+hovztNkcGUtOPo5cOKU5n/J6xBVzsUNXzMmjx2jeY+SrYFwrlQC
         /EdNazFihqqIlCHDwyO13cjvbVVa2rT/xkzOTX9hl8reeijseva1hR6u91QZIMA4so92
         P4xR6iLJwtROAd5ihc9YH4cv2QhN1UNuMQWJwquSRWG29ZIuXOUOyT/rANZi/oXHV5y/
         pqjtL6cTcosEWU0OKp+GHr14+ve2d2iABzapNW3rqIYEZ7fYjjJezyt2MIsC6wnjK7q8
         6i0oJTtpJkXqOrkJGHAEt8F8XIzzV5w8G92mWnfXme1viejy5i0FOZX/4DLMIN+8BYn2
         7OkA==
X-Forwarded-Encrypted: i=1; AJvYcCWPahv6krPaqe7em58C2ZdqoIpbaJnphwMAx03mMO28L2ssF2OiWEhP20aT2jjEuUiq1hJIjmPDSaJLJiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPD/8aVk/yoUgphM4oU/26i5JcS8VFLd/kofXuyNH/yN0+oqOg
	jKbi0F9n9yM1DooomfRsxozPyt2pCxBOG/kkxao7LERd/OtvG1aq1a3xl2SiSuM=
X-Gm-Gg: ASbGncv1AyWb2o7jO0u1yeLvjwInoPQXK5o63/wN+jAxrnJhgJWuwZO6PVO+9YxH6Np
	zI9Z5Ar7P1mNIL06ZySz/IG5wXa68dqmBSvpIUursXeO8S6nZA9lyjQIcCR/0nK0kvzgu7u8ekS
	MFrVWgRLxVi2mXwRkAN96tUZAMKZSoJflcGa6rXtBmeait+7QfSHOpR82U2vz4eUdAoE5hkAJQ8
	SrT8Se+dmYbqX0jvQUJZLXXSPe8DnN/EWSaVpyFGHwAXd/nDAmEomvnUlFd9inbIu3UzZ+YMcgS
	sqqEtvRW1wZuxhc06FwlJnSeblkNmFxwIduVZtv0JmPb84YqkdsYyoHb6trj5/MsemOksVRw9Qv
	RroxZt6GlMdBLbxDxyDHYCG/pJApv
X-Google-Smtp-Source: AGHT+IGCrA8A+FHDapqOFzvLIREWI4Jo2OiyP1UKGY1JE22mQ0QmetHADCci956kIivIzU/KXqVUhw==
X-Received: by 2002:a05:6214:240e:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6f2c45a35dfmr93433756d6.27.1745041110016;
        Fri, 18 Apr 2025 22:38:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b30c65sm18341956d6.51.2025.04.18.22.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 22:38:29 -0700 (PDT)
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
Subject: [PATCH v3 1/2] cpuset: rename cpuset_node_allowed to cpuset_current_node_allowed
Date: Sat, 19 Apr 2025 01:38:23 -0400
Message-ID: <20250419053824.1601470-2-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419053824.1601470-1-gourry@gourry.net>
References: <20250419053824.1601470-1-gourry@gourry.net>
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

