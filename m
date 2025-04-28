Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6E1D6DC5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745811414; cv=none; b=aPWEJZemI5F1Jdf1uIfLgNaL4Mz2MfXrPc0lssCWC+ER0/yDvq33OFGLX99QGlRHdZcyBHnCFOZrC6AjrP+nz5WdaQyyuHmUFuNnmI9F7BDgKHHnOkon95WSrM1GdDenWW041iyxgz9OXQhL/qtiMzVyRS+a15PVa3dUed4cPSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745811414; c=relaxed/simple;
	bh=OfO+TfkpMaagCuKgUBXobHt0NDGxWYQksshltvK2YyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyuKm08zx5s4wwwUP6GGBWJp7DMIc9yadL2zTlKdQPdoJbtf9P+ecjZNfz6ynlQdmmU5VBsbM5XYTQsP4E4dhQyzw6rRVSS0XPy9MK23IS+OflQzzkNSIvb62Mi4BbT+hhyr6GH+26kFHYodYyHc7/KLLqCy3Afrzbf59qrN2Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UhML/02x; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UhML/02x"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745811411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfqCE3hqvHS+xiXy15ifFZ17rwxpSXuqOJ5f+GS0Txw=;
	b=UhML/02xIM7DqvIPdJnhpoz8FvXU+vUJ3076QF2Bjl8xAs4sHviG4NWvY3TA/Iaktg77gS
	UnzlxPWUWfB/AMcFRYJ1/Fk7r9XaTgqUF7FVAkeKd41yMUa2h8UWiWu2HaHPsT6vXSK9xT
	dxuqZuQBnCjYC5nbqtW+gYFEomHsXZY=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	David Rientjes <rientjes@google.com>,
	Josh Don <joshdon@google.com>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: [PATCH rfc 06/12] mm: introduce bpf_get_root_mem_cgroup() bpf kfunc
Date: Mon, 28 Apr 2025 03:36:11 +0000
Message-ID: <20250428033617.3797686-7-roman.gushchin@linux.dev>
In-Reply-To: <20250428033617.3797686-1-roman.gushchin@linux.dev>
References: <20250428033617.3797686-1-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Introduce a bpf kfunc to get a trusted pointer to the root memory
cgroup. It's very handy to traverse the full memcg tree, e.g.
for handling a system-wide OOM.

It's possible to obtain this pointer by traversing the memcg tree
up from any known memcg, but it's sub-optimal and makes bpf programs
more complex and less efficient.

bpf_get_root_mem_cgroup() has a KF_ACQUIRE | KF_RET_NULL semantics,
however in reality it's not necessarily to bump the corresponding
reference counter - root memory cgroup is immortal, reference counting
is skipped, see css_get(). Once set, root_mem_cgroup is always a valid
memcg pointer. It's safe to call bpf_put_mem_cgroup() for the pointer
obtained with bpf_get_root_mem_cgroup(), it's effectively a no-op.

Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 mm/bpf_memcontrol.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
index dacdf53735e5..94bc6c17d80b 100644
--- a/mm/bpf_memcontrol.c
+++ b/mm/bpf_memcontrol.c
@@ -10,6 +10,12 @@
 
 __bpf_kfunc_start_defs();
 
+__bpf_kfunc struct mem_cgroup *bpf_get_root_mem_cgroup(void)
+{
+	/* css_get() is not needed */
+	return root_mem_cgroup;
+}
+
 __bpf_kfunc struct mem_cgroup *
 bpf_get_mem_cgroup(struct cgroup_subsys_state *css)
 {
@@ -72,6 +78,7 @@ __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(bpf_memcontrol_kfuncs)
+BTF_ID_FLAGS(func, bpf_get_root_mem_cgroup, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_get_mem_cgroup, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_put_mem_cgroup, KF_RELEASE)
 
-- 
2.49.0.901.g37484f566f-goog

