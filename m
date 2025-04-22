Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3218828
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745296271; cv=none; b=a1hPAY/GHASUcgTPzYguEUi85K4h4NbJj+0Eb77tHLxMlnPemG3R3YgmL4dss+xNHru47srkCGasKBhNfnMV4O3F1O6sldattjeMr6fMmf/awQcmmWxasrMlmIVwSdfBRlIG62Abvl7KdhG7UH+zO9MhXOVFcqJUvgkyR7fVAnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745296271; c=relaxed/simple;
	bh=bI3gDzhCKMAkJw2iXZ9rkFzBnMcyw7cj4GHPEtHSj2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuHzfYQUT4eXImTAHBmz4DhFBujgblrJUzsWEB1jukKW74ehIoCMRiOah75I7gNtMC4nkMkpSGhEw0CGG6Sqg+47AHosVoNoreRVVbVdi/iivyGGVapa7kqgAPQzzdqtbLGyA8AISWc5jswH3fa+qBPzgdiTFaK9mMb4Y1/hb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RRfGWmmY; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="RRfGWmmY"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso53719416d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 21:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745296267; x=1745901067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRSMksXpsf52yOD4IubO1aFNXvg4s4nX378ktXQqSPw=;
        b=RRfGWmmYkQL51c3ajNplCbuV2Gd3ETXRduN0H7YYuBC0JJGQKqyckamwphLJQjbrOL
         kdt71fG/uJV3CNZ2UcYQYevv9KMmL4D3ELLcwVgJyERTuDnby68fx7LisaAd0K/Nlv4c
         HrtiIRPC1ZHT6KrQsQVfRU2VglfK0mgBcRf7iGg8YyfG9ElR2yhHravoYjCIMCjvOj4S
         Waf79LFDnBnu2BijZKcpsIsEkqqNRz7pW5qbBi/6Dvb9sIjN7FWnnPsLUHEgovu2j0w9
         6PL6kpADCBj5JxRYggUPZeasEuc0uoSVDPh2vXZ+9o1rn/hFthyeGGNfhE4zOTOtl/t1
         BtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745296267; x=1745901067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRSMksXpsf52yOD4IubO1aFNXvg4s4nX378ktXQqSPw=;
        b=osA1y/c8iEVkQTjb7UZwNZ+QpDgsUAE2VOzbmJ4fuT5pim+BGzUgcnSlaWegkUIQGp
         1NQyQB9oaRMxWY+0k+/6m17r9WIrL6C2o31uiRQ+3hTmkJrh2dZF0P64m9w3LCyezU3k
         xuXQndAqdYX8JGC965rILe+m2Bdgpf/TYqs+3b8od1UxzK8qpE5b00Sp44ewiBJGUVuB
         G+M1YToJQ/wWuCok4Z9GwJ7Yq0HGcgcWt7fJODVvplmLBPf7P4wK+Vc0b6cxrYGBL4SZ
         n/+Xr0fv/wjsTL7a9x3Ptcetyq0ofSk0frFXixkdViytICDiugCXapjwgLVWQueygjA6
         ZOOA==
X-Forwarded-Encrypted: i=1; AJvYcCVHFomZPTQVNEI9o/0//jkXlvjxeVFjpLBvpTUte6InrE9jLpU2MskjQwbs0l4ORhTCbEw3uMNQJuecM4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBJdCJWXyMpM12XiAwhBHc2nIS95yLU3QdJbbPAosoydspvap
	5r90qPSCHwvo1qEOJTc+leVmHfS5jwKmh3Z2ygDOsqVP3OMX+jM4AULzc2ukNjo=
X-Gm-Gg: ASbGncvxmoSlbU/jKHtCIt1wU9YRo8MXc94nP8UscJDe9sz9JeSvT83bXbgRVrQxdin
	xM3I+6uTXgOPP0jhCIWwwlzpKrTdds8Dt5WHsuSb3BR/G40du7AMRCmbvbEK7UF4Ii2Xbuq5o2B
	ddPiCo/1Q4rS0/8DLZ+25Gu9BZ4dFkPzQC2ycmhHWgcBz3qJs1xyzeTVS+OtEVyRT7XV6L2Y+Nb
	5tjAg1+OYtWphQK8QUmnFmELF3qdVLEBs4cliOkPSnzNRd+/0/nzyR0G26WzeJXPCOKC4mAcP4V
	NwCdrhhb8vlR1mUsQjpC2H+cLANlBeBo8uWvc1OAxAr0AZq9or4sEcjmhsBIOeRfdhmXvAaavL3
	bV+1VcvhAWn+dvF8GC7MwmiqZ0ipv
X-Google-Smtp-Source: AGHT+IEzQ3PXHur4luJ4jcRF7GRw/fek8cyUhcS6YWFUPEnKas0lDo2Hf0ec4S5N4vxVbonxlQQHOw==
X-Received: by 2002:a05:6214:29c1:b0:6e6:6599:edf6 with SMTP id 6a1803df08f44-6f2c4655ae9mr267147396d6.34.1745296267519;
        Mon, 21 Apr 2025 21:31:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af14easm52745336d6.3.2025.04.21.21.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 21:31:07 -0700 (PDT)
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
Subject: [PATCH] cpuset: relax locking on cpuset_node_allowed
Date: Tue, 22 Apr 2025 00:30:55 -0400
Message-ID: <20250422043055.1932434-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422012616.1883287-3-gourry@gourry.net>
References: <20250422012616.1883287-3-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cgroup_get_e_css reference protects the css->effective_mems, and
calls of this interface would be subject to the same race conditions
associated with a non-atomic access to cs->effective_mems.

So while this interface cannot make strong guarantees of correctness,
it can therefore avoid taking a global or rcu_read_lock for performance.

Drop the rcu_read_lock from cpuset_node_allowed.

Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
Suggested-by: Waiman Long <longman@redhat.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 kernel/cgroup/cpuset.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index c52348bfd5db..1dc41758c62c 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4181,10 +4181,20 @@ bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
 	if (!css)
 		return true;
 
+	/*
+	 * Normally, accessing effective_mems would require the cpuset_mutex
+	 * or RCU read lock - but node_isset is atomic and the reference
+	 * taken via cgroup_get_e_css is sufficient to protect css.
+	 *
+	 * Since this interface is intended for use by migration paths, we
+	 * relax locking here to avoid taking global locks - while accepting
+	 * there may be rare scenarios where the result may be innaccurate.
+	 *
+	 * Reclaim and migration are subject to these same race conditions, and
+	 * cannot make strong isolation guarantees, so this is acceptable.
+	 */
 	cs = container_of(css, struct cpuset, css);
-	rcu_read_lock();
 	allowed = node_isset(nid, cs->effective_mems);
-	rcu_read_unlock();
 	css_put(css);
 	return allowed;
 }
-- 
2.49.0

