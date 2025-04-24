Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714A1FECBD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526135; cv=none; b=Vz3wf1ERzzE39dC9ddyRNHlUbJ9zce4f9Pq5CN6SaLLqj78PsPsU2jsu5UIG866K67Ab3trP78QBfUDu+wwESdLZcwgyBZX4ikKorruijHum5g0fUU6pplGy3oQlXwo14ur0EqiON7oS0GQu/gpn7jnkt/2gFPKbD2t3ULbXILA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526135; c=relaxed/simple;
	bh=QemlZRsMnReDRXGr7XlMMBNDMS1lFareGFcDixhJSmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6//WbAeZurytpEqCBLpH4Fd24hOo7KpQPNEqmV8KhaS7Offc9sBSb+8Xa3nn+3/pxPFfmHWbu9A7SJWuc+5DpoPGVCnHmuOgk5UaYQUvJAUfN0GxWPPgzMoslvZ5wyG7nsWG4uEDjZ2868+pu+79nOGAJ35jtyUcxxsYRms9g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Jg1BE/WG; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Jg1BE/WG"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f05acc13so19698776d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745526133; x=1746130933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djWz5UXPAr8AyfZCTcoqGVabcC1mywuVV3L68VCKfXA=;
        b=Jg1BE/WGha1Ba8gtn9LKM27JKHUyeY26IA2dyHy0iXFM4ETPY3/w/Auiux3LO7Lnf2
         xML5mmPecSaB4jlZzvdhgEtfhyg5DCY+IdrEbg62tUnEgc+3MM3J189JRlJ3hyNrH1V/
         WVG2kfXZ/SfN6euQoeyY8xMZS7kAgGN+yQG5gHCXPhIqg8OFuArPmGXuYvKtDYE5CJpa
         OM5rCIXVGSapgJneJrYoZqD2trAMGq4vHEguXqbZrTUUojK6Xf2+YaYAJIlC+9f7hKPl
         hnfdHlWLcy5p/tN5ydG8N7eEWeV6DyWPhWqCFOuIY3ZgHmKt+fTuM11MqvxGlMLSYxlL
         P8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526133; x=1746130933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djWz5UXPAr8AyfZCTcoqGVabcC1mywuVV3L68VCKfXA=;
        b=QT4eYXNrsYu1SAx1YCdfUJ6IBbkFIXmpGZ8GG3LSLXSOyRksjU+0rNgtw8PqhclT/5
         3iozfaUaOyhU4lWSKDpI0mcLctse5t7brBbxDbJRqL+P+K26Zql4IWLCjGpjEMn8vjsd
         OuNynySatG09dQhXwyiTqj1IgDsAkjj7bNkI4k64XMr+yLFlQQdkvYGS/Lyxa51EC8kb
         J2N6LK+4MA7IqVU3qytw6LWyFEUQoMRV6Z2J50sIsj0mF3EFYuBWweoy+35ZacKzoDSG
         XZOdnaPU4LQDjgINsKN8RnBtI7GfMimmeMyCjSTI9myp4xJ7XPQ3OvkM4YY9+Fg7hzHM
         nQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGSKgeQVWLNwwwIXg/ANpDQ18FGAeWBruG8ITRF/zjmGEJ3vuCg22gymS1KwFRekDs5DDeGwsuG9V4nXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7Jm/imXosdxasx7dCEeiP5ZmmT7CMjtEcZWrhgKpwO9TxHmm
	0SWNFCGaY8VVnuusFsmbv7yiz6/mfLGnY6oORvGUfPQrFabBjjbwiobqmFymdpQ=
X-Gm-Gg: ASbGnct+7ZGBV8CSODHkbHasPAt6Pc294mWm381AOLyGK15gNe21JiebV1Oqc0Lu706
	zRjszFKf6UFMb/opKSdTy64rVLloAqvbRygQERzcCqXRsYJ1BR7LVKeylE+4jykyhOO9Tkj0zh3
	kZ0LK30MsZrLwt14O0tni3qSangT/YZ6zP4dSKmgBFDc8D8GxqyFJuwP4S6LGCJ0mJD2oCKO6B8
	ZfmTbqmxD9L1QU4qlaNnHg3nvuFrkPfXtRXGxP1WEjHOHyIGdOMYVPB2R5T4hKi8mThDOpda2xb
	zOW5EzhPOgL3odAHHdgaZnc0ZfR4pC/FZBAts/7Vz723mAxWEqKAi5S/FM8qYUOkHlh1kXg38QA
	dDPQrBigyZGcbNJsCzBax4Ha2MRTI
X-Google-Smtp-Source: AGHT+IGTR16pKWoAXu/Nzo3/8RRbXp5lOY1wD4Nku79p9Oo5rq2IkT3OM+hRvSu40zPacObUxtfaQQ==
X-Received: by 2002:a05:6214:1d05:b0:6e8:99bb:f061 with SMTP id 6a1803df08f44-6f4c9508186mr19863646d6.18.1745526133011;
        Thu, 24 Apr 2025 13:22:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbfb1bsm129618385a.44.2025.04.24.13.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 13:22:12 -0700 (PDT)
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
Subject: [PATCH v5 1/2] cpuset: rename cpuset_node_allowed to cpuset_current_node_allowed
Date: Thu, 24 Apr 2025 16:22:06 -0400
Message-ID: <20250424202207.50028-2-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424202207.50028-1-gourry@gourry.net>
References: <20250422012616.1883287-3-gourry@gourry.net>
 <20250424202207.50028-1-gourry@gourry.net>
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
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
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

