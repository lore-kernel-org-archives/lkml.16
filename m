Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DF854758
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743907238; cv=none; b=fxPlqxqLTytrNguVKVRbeSeMMghuBIk+Ete/ja7gAe+QBgmx+4u7EbQhBNkeBz8nZjhuIYmY1X5h235WwAX1qAyFm9OHloyvSTuk+OU1xPPHz6ryKpy7rZvZ6WrpNAKMNiI68wC2Sanjx2t6+/VdfPbZge+9+B3/8xowtmvsoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743907238; c=relaxed/simple;
	bh=LIiphxm2snpwj6pqMlmbdwc2xr+9l04Hum2MucikSlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grtUDR04xDLSsgBRtw55yKMqK4ouiRodY7c2vvvAoth5ZTZpbZQ1jfcKp6lIn7HUfmu56U9cQBOZVNQB+gUnPJ199D6Bs0LSle6niUmt0PU2E0uwg6k0g3W+NheQSzS0zB9zZ8gH87XZNI6O+N4tU16+VuwSNrYCpyjQtje5CYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/Wn9biM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/Wn9biM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743907235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bk43KL+s2l5fV3lGaddeDBguiZ6SUsPQ8knSF6ClKoc=;
	b=d/Wn9biM4RWT9f7n+3M1JcGuyJH5MpGpp6lnfdcyEl/qcg03OdyuxoNDwD7zoSrz0czrxa
	7KigRnLbQnU3+iFO3LbrRpRJufN8NzjprhcLaa8DnYL0fPTWk91F6UTVxs7fJaegAuVFq5
	2pJWGJPR/nC8uc3LlgAYBcn8Iyxmsyo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-qdtT_OYuNF-o8UWDoInYEQ-1; Sat,
 05 Apr 2025 22:40:32 -0400
X-MC-Unique: qdtT_OYuNF-o8UWDoInYEQ-1
X-Mimecast-MFC-AGG-ID: qdtT_OYuNF-o8UWDoInYEQ_1743907225
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E17219560BC;
	Sun,  6 Apr 2025 02:40:24 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.19])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B85F180176A;
	Sun,  6 Apr 2025 02:40:20 +0000 (UTC)
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
Subject: [PATCH v3 0/2] memcg: Fix test_memcg_min/low test failures
Date: Sat,  5 Apr 2025 22:40:08 -0400
Message-ID: <20250406024010.1177927-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

v3:
 - Take up Johannes' suggestion of just skip the !usage case and
   fix test_memcontrol selftest to fix the rests of the min/low
   failures.

The test_memcontrol selftest consistently fails its test_memcg_low
sub-test and sporadically fails its test_memcg_min sub-test. This
patchset fixes the test_memcg_min and test_memcg_low failures by
skipping the !usage case in shrink_node_memcgs() and adjust the
test_memcontrol selftest to fix other causes of the test failures.

Note that I decide not to use the suggested mem_cgroup_usage() call
as it is a real function call defined in mm/memcontrol.c which is not
available if CONFIG_MEMCG isn't defined.

Waiman Long (2):
  mm/vmscan: Skip memcg with !usage in shrink_node_memcgs()
  selftests: memcg: Increase error tolerance of child memory.current
    check in test_memcg_protection()

 mm/vmscan.c                                      |  4 ++++
 tools/testing/selftests/cgroup/test_memcontrol.c | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.48.1

