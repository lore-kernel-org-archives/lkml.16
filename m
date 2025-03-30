Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702DA137932
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743371627; cv=none; b=OKc+fTRCIH5Cr8uHogg2qcylU/Ux18sPNkObtaAX7+TtuppzbK5P8GmXc7Z74oimPXSP7BRktPfEm4ux4Xsmibo3wVB4gs/yadrQs7kvn70ZwmnOYcJnoRpnn9qkT9jpdKpQyQ9j7BOJGRHaE4F2zjRj8AXQSM5wSxa3EYHGb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743371627; c=relaxed/simple;
	bh=SZdMgUXbNzWIrkGHQT1Y5GbxGU727DTli16VagtZmMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TlXotNMMkMRsJ/4P0Q5jHAHIN0pbRnO3emblNf8xItNocDo4Z63viw4xezCzl4KOBOvvjefaapUiJm8OHidEUL2Oqf3GdKekQKRJMZ1x5uCVRt2pmD21/lBaFyL0FlpPNJnM5f9zwkmzUSrQEav3PBydYnSjCEfFAC2xRYsJ3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tzch3Y7Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tzch3Y7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743371624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QWxjGxcyTTj0xgoyyQ7hbINmphGtnz7f5bPVPSEtkro=;
	b=Tzch3Y7QzU+JCwpi9mIXy79d3P3HASU7c+aSUxy9q+NYZHEawYN6f2sAZYludM1Vv3/6gd
	23gVzKU72vpS9lNT4kRnQ/OeSisly/EiH/UdpvgpuZtIUwyUFHX4nxd//Lpavzfhhuywm2
	bfcS1dmuuHj+u/sP7oIKHZXZDB9mY/s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-zXGxUkmlMmqFTaLBpVs1Lg-1; Sun,
 30 Mar 2025 17:53:42 -0400
X-MC-Unique: zXGxUkmlMmqFTaLBpVs1Lg-1
X-Mimecast-MFC-AGG-ID: zXGxUkmlMmqFTaLBpVs1Lg_1743371621
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC2811945103;
	Sun, 30 Mar 2025 21:53:40 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.34])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B5BC41801747;
	Sun, 30 Mar 2025 21:53:38 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 00/10] cgroup/cpuset: Miscellaneous partition bug fixes and enhancements
Date: Sun, 30 Mar 2025 17:52:38 -0400
Message-ID: <20250330215248.3620801-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This patch series fixes a number of bugs in the cpuset partition code as
well as improvement in remote partition handling. The test_cpuset_prs.sh
is also enhanced to allow more vigorous remote partition testing.

Waiman Long (10):
  cgroup/cpuset: Fix race between newly created partition and dying one
  cgroup/cpuset: Fix incorrect isolated_cpus update in
    update_parent_effective_cpumask()
  cgroup/cpuset: Fix error handling in remote_partition_disable()
  cgroup/cpuset: Remove remote_partition_check() & make
    update_cpumasks_hier() handle remote partition
  cgroup/cpuset: Don't allow creation of local partition over a remote
    one
  cgroup/cpuset: Code cleanup and comment update
  cgroup/cpuset: Remove unneeded goto in sched_partition_write() and
    rename it
  selftest/cgroup: Update test_cpuset_prs.sh to use | as effective CPUs
    and state separator
  selftest/cgroup: Clean up and restructure test_cpuset_prs.sh
  selftest/cgroup: Add a remote partition transition test to
    test_cpuset_prs.sh

 include/linux/cgroup-defs.h                   |   1 +
 include/linux/cgroup.h                        |   2 +-
 kernel/cgroup/cgroup.c                        |   6 +
 kernel/cgroup/cpuset-internal.h               |   1 +
 kernel/cgroup/cpuset.c                        | 401 +++++++-----
 .../selftests/cgroup/test_cpuset_prs.sh       | 617 ++++++++++++------
 6 files changed, 649 insertions(+), 379 deletions(-)

-- 
2.48.1

