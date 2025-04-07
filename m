Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A97C218AAA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744060931; cv=none; b=HKRw1t1kZKHvNdw4BYB4YGrOoQTkoTNU9CLV2ser7Z1pS1htODtNCi1qPjfDnNlJc9KvKbZ4LwycD+FEtTXLT6JNIC9+eLw7kn9dstCgHReOCgU5e+zLVmJIVdz066NFDe8Elons7RsiF8ArPZWYN8SFoH17HXCeQoQE12jeoAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744060931; c=relaxed/simple;
	bh=g5CFip42mFQqpEmbBM/+lzFmhN2ygnDKANEGd2AJ6C0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qkSVALsmSq+M8M14zbFKDQ51iG2d4S5U+Fq6vFOO6ll1UU/1+0jEk+yx+UNR1jwxeF33kaqT1KsI+w/0v828jedhdw6EvTYKqZEZyI+iJyvKEaAeQhaLWkPw0LI9MhqM/wEeUQTRoXrRebGB+w3o6rJ+atGO7l+qNCYVm3Y9K0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EX30Wao5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EX30Wao5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744060928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TnEDpx0qUE5Tyu5NVIbxJ4n/nTjH1L4vePOyeympb+0=;
	b=EX30Wao5DuTbF3StUXNX9tT500Azei2kKZwRiKindNP1xxNIqzkMvRp/XNljF7NDpmbLA3
	UNDjmF+oTk8nxucqBhgp/3ZbLcGgpcUi2OQOj8m1kLUqddO+8ib3JaF4vkQjPPCYDFUfdO
	JrcE0OayzqEtweq52UzRz4bpK2wiCWc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-orbbIonaP7CpCAz-xQn1HA-1; Mon,
 07 Apr 2025 17:22:04 -0400
X-MC-Unique: orbbIonaP7CpCAz-xQn1HA-1
X-Mimecast-MFC-AGG-ID: orbbIonaP7CpCAz-xQn1HA_1744060923
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 699061800257;
	Mon,  7 Apr 2025 21:22:03 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.90.98])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C5DB180B487;
	Mon,  7 Apr 2025 21:22:01 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 0/3] cgroup/cpuset: Miscellaneous cleanup patches
Date: Mon,  7 Apr 2025 17:21:02 -0400
Message-ID: <20250407212127.1534285-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This series contains a number of cpuset cleanup patches.

Waiman Long (3):
  cgroup/cpuset: Always use cpu_active_mask
  cgroup/cpuset: Fix obsolete comment in cpuset_css_offline()
  cgroup/cpuset: Add warnings to catch inconsistency in exclusive CPUs

 kernel/cgroup/cpuset.c | 84 ++++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 23 deletions(-)

-- 
2.48.1

