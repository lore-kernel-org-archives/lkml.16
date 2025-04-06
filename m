Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C3E17C77
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743907237; cv=none; b=ufL4pKKuAvODto4ykcc473d3Jnq9b6tLgrWUTHMIJYe4gIyKV/Y2e4iU9vOaHraicTVe5tNgA69TjytxZb95Nz7ksNORG8gorokDbjZxc9z/gksOWIzIpFqJWJ43KRusR+pzLIHR57ZTeXXgOa47nxe11YZGGmk2Jq0b1f4i9RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743907237; c=relaxed/simple;
	bh=vpzdut+HYv8zVhTu0FchDFYKUL8Hg8coS54tnu7QPTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1puqqzqf/tCALYk2cb/6hQAfsFKiykgcDGIkUX0xP/C0W+ouXUvQjsLIqW1l0Cgw0HsEwsD+KPBHMNnELH6i+pdlrRRoNMqK5/HRwyUq1k9Wkgl88IKmFP2F887TAGp7F3W/8qpEG5W2HpqyqEOy7mHlkSm4dnlgYGH6hDX+P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TlTVZHaw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TlTVZHaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743907233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5YDLmhSbrpf/aebgnSWHj5blPXWvVGMTpTVQlCY6Io=;
	b=TlTVZHawFrJQ1SlESHLmMqMZ3KwFSUH2jmvea+wQM17iWl5ZLqImh8lYWrM7Lt2N6exVUw
	2GAcVC6WdDPh5Q7ke18uyemaQ7plVlkBAANJONRR/n6zKLqIYJNjlU6HTwLcWlC1h31XXF
	kpjzYZ1f9YMm9PSvD1aCtJMQpKz6bxE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-L5K0I2a_NX67Xvs9u3r51g-1; Sat,
 05 Apr 2025 22:40:30 -0400
X-MC-Unique: L5K0I2a_NX67Xvs9u3r51g-1
X-Mimecast-MFC-AGG-ID: L5K0I2a_NX67Xvs9u3r51g_1743907228
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94A3C18004A9;
	Sun,  6 Apr 2025 02:40:27 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.19])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DDA331801766;
	Sun,  6 Apr 2025 02:40:24 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 1/2] mm/vmscan: Skip memcg with !usage in shrink_node_memcgs()
Date: Sat,  5 Apr 2025 22:40:09 -0400
Message-ID: <20250406024010.1177927-2-longman@redhat.com>
In-Reply-To: <20250406024010.1177927-1-longman@redhat.com>
References: <20250406024010.1177927-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The test_memcontrol selftest consistently fails its test_memcg_low
sub-test due to the fact that two of its test child cgroups which
have a memmory.low of 0 or an effective memory.low of 0 still have low
events generated for them since mem_cgroup_below_low() use the ">="
operator when comparing to elow.

The two failed use cases are as follows:

1) memory.low is set to 0, but low events can still be triggered and
   so the cgroup may have a non-zero low event count. I doubt users are
   looking for that as they didn't set memory.low at all.

2) memory.low is set to a non-zero value but the cgroup has no task in
   it so that it has an effective low value of 0. Again it may have a
   non-zero low event count if memory reclaim happens. This is probably
   not a result expected by the users and it is really doubtful that
   users will check an empty cgroup with no task in it and expecting
   some non-zero event counts.

In the first case, even though memory.low isn't set, it may still have
some low protection if memory.low is set in the parent. So low event may
still be recorded. The test_memcontrol.c test has to be modified to
account for that.

For the second case, it really doesn't make sense to have non-zero low
event if the cgroup has 0 usage. So we need to skip this corner case
in shrink_node_memcgs().

With this patch applied, the test_memcg_low sub-test finishes
successfully without failure in most cases. Though both test_memcg_low
and test_memcg_min sub-tests may still fail occasionally if the
memory.current values fall outside of the expected ranges.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 mm/vmscan.c                                      | 4 ++++
 tools/testing/selftests/cgroup/test_memcontrol.c | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b620d74b0f66..2a2957b9dc99 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5963,6 +5963,10 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
 
 		mem_cgroup_calculate_protection(target_memcg, memcg);
 
+		/* Skip memcg with no usage */
+		if (!page_counter_read(&memcg->memory))
+			continue;
+
 		if (mem_cgroup_below_min(target_memcg, memcg)) {
 			/*
 			 * Hard protection.
diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 16f5d74ae762..bab826b6b7b0 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -525,8 +525,13 @@ static int test_memcg_protection(const char *root, bool min)
 		goto cleanup;
 	}
 
+	/*
+	 * Child 2 has memory.low=0, but some low protection is still being
+	 * distributed down from its parent with memory.low=50M. So the low
+	 * event count will be non-zero.
+	 */
 	for (i = 0; i < ARRAY_SIZE(children); i++) {
-		int no_low_events_index = 1;
+		int no_low_events_index = 2;
 		long low, oom;
 
 		oom = cg_read_key_long(children[i], "memory.events", "oom ");
-- 
2.48.1

