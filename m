Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F60262A6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744946043; cv=none; b=Hsb+HpzDp5izh92l9MY1s9jotlys13kFkEzYlzIlR7K8xfxj8odtX/xUmbudjC3XO7NDjCERwKkgH3p/Xf9DFjFmphYSvHCYXikEwXCCWymp9vtp+un2VU+56yOnHmYMj+fMr726xTbGCXn0k7RoTgV6bhxiayaxdZh0LwuTjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744946043; c=relaxed/simple;
	bh=vbI6qd0A2rz2CL5d1h+1dq5v5IXyR2ADFU+te2WwVac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7uZ/w3rFfmyJtee+w3q5fhB8toeOSIc+4K5lIWOOKL7OzhgKh7aFZTweVAKGeMWkGY0YrVJX+Tq72w81kHH0j38rdku/Pe5N4tdeduU61149j+MMOnl4YrU3p+D8iYEhkPXgNNCvOh2I6itOZPjXIiuHL6qktwyNJqr8gtqsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WK7C52AA; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WK7C52AA"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f2b05f87bcso14483716d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744946039; x=1745550839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhkFoDZ8fmh5IfDDbzgIolwpkVUwA5gY+2n9rrGAnxc=;
        b=WK7C52AAL07qf3Tbsuz2XTajGiG/9000M6wThF6TvSBMXOisp/x1n77e5LixoUNHPD
         +wRWyrJpBvu3tSjQ0OmVxApEMmZ5/5KTxVLUVEKlv/Xkqmo2233Y3CJNxjHIP6RAc9C1
         QGp/t8YQQLcOPzxmMuOGAt3WdwOD2EygllbpIxX+9pfenGNGtnIY0diFzQ97KJsksLKI
         0a52t9wV6bDXwVyfWEI+nj1hifcEil7kRzpDD9srilhQvT0S7t2HzqmFLDf3YjArg2It
         yXZQxLuy7k02BIHbUWUiL0fGNP2RMl1Obw3Ma+XLnisiYtqpO2yHK9AR8ZGLSoRLbVVW
         YevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744946039; x=1745550839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhkFoDZ8fmh5IfDDbzgIolwpkVUwA5gY+2n9rrGAnxc=;
        b=cx5m+51XkTU2n6MHA9zFQgjgE4zdXV/JLXvKK8Ik1BHb7fAl272yiIFi4z5B7HpxHj
         rAwXOBlnpJdvROqJhIGKRsHWn4g2ocOT/XKyQ9hN9gjLnjBuuAGGzqr2A1Dn7e+0mpkR
         LdrNe5q5DZU4Zg6cfZ+Iet1ecASYxqcX3y8eaSYDltxdxttBCAjxnSt8Ak1p+EFmJ6br
         rT627E9UImZQDQDx2mRPASe51V071a+YyV4axhIDpf/eqn0k0iKhEWdd6hJRP/CKiHPc
         v3NDpo/vZmif9VOCzFlj2OApxezJRSucgMopQSl8YORQGVSuq4jVjNTcaXVt5BahC8pP
         5Q7A==
X-Forwarded-Encrypted: i=1; AJvYcCX6G3wOOyhemrjoGXozAtLlBppr92moEFh5vQsOAt1LjjhHIp+TsxMMyUlPOCbmwVe8W4GHGKGQ3ET5jsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznuFUpnoaYjdB4+mO4St/lWvUp8ZUAnbWsw4Gjh4c524D0A9cl
	bj3s1fQ0IpqE87vBpZI1huq8MrRj0pXEeD6+o4ECS7GTPq/MjGarQ9fPy3ShrtE=
X-Gm-Gg: ASbGncsEW2WuIZpim0toAvI1xZ06jY8ry/FTmBrQYl6OtW0Bf4GUDjOfiTifCbHVrDj
	5V2Envl4G6j2y+rWoNj3mWhzjpGiTDRid0D5W+Lq1XATXdufgYtMpFvq8iVYvBpjZYW7qgUGU/M
	ajH+Oeuad6vRkDSmlBecuer3c7MKungQ4VlwYiBgOIWb9aUq3NZmpZyMz5MULXjmU++8W2X1+Iv
	ZlZOiXEFvt4JgC+Leghc2wtHc6ZQyqTDG5Z7Wq5nnZ0nv2mPMsdjFJOZ/pXKf2Yyw0HSkLoa2tk
	su0WJwgxYtkRuZT9ThkVI2poz5S1Y9Ygw3WFsdff/ARkd8ezSlkKtC6o9yO09VcdAaA5p48cPCL
	BqH/BPQt9ZfyW6yfFL4/uaafJ9vlD
X-Google-Smtp-Source: AGHT+IH3R3wLKLtGgRBUoPnaVVAkh/DDJqvYjRZLcYFrm5BdNMgZbpBwrzxEwDzS/qXnGk1krKtVyA==
X-Received: by 2002:ad4:5ba2:0:b0:6e8:9a55:8259 with SMTP id 6a1803df08f44-6f2c4515171mr26128516d6.9.1744946039303;
        Thu, 17 Apr 2025 20:13:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1717sm6231796d6.15.2025.04.17.20.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 20:13:58 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: cgroups@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	longman@redhat.com,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org
Subject: [PATCH 1/2] cpuset: rename cpuset_node_allowed to cpuset_current_node_allowed
Date: Thu, 17 Apr 2025 23:13:51 -0400
Message-ID: <20250418031352.1277966-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
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
index 0f910c828973..d6ed3f053e62 100644
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

