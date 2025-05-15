Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84B226183
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747280437; cv=none; b=iWyDCN696o1AupCNppaTB1hpqciVTpgQ/pL8Tpn1OjWeABHtmz+I5yv6/oH2oVDfHudgxlFIOulfcJLmFO65WWJYOR+z/gie0MBGMIaxEmt0VwwpEE9hk8pmdg1SGjcaX8mbhQu4mIIzXWpA6MMj0HFqm4YuMcd32OJ6detIaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747280437; c=relaxed/simple;
	bh=ojvYh32c7Hy4vJTBL+DkaUPpFW/+kSsAeaxM9iD4T7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP3Qfqoqzxai0Cx+1z5ZJrofXuqbe+BHzDmqxfSzSoP7bhWDhpURJ5jVRvUpP2dfT/uihPuYHuFEyEnGBCEfz7PmlZ7d1y2xaxwsaapv+Or5DreLn4UDwnEerPBlTogLW9BcoS0GzXCBJebwT1m9okEflvP6D2rMjmZGKjbB9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TyoRoDAm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TyoRoDAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747280434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OpOeDWkKDKT63sqe7Ct3ueIe83ZxEVQ2GdgfA8/ZAk=;
	b=TyoRoDAmo+F7gnQIzhrwloYEm/sSsv8Mk2FvF/fyJmmWFX2C8/kb9/jZz+EI8twADScS15
	WPhvbWhNoSydDxJsLY3rZcG70KwkwhOhy97uXyirhHEm7Ykc7xVi3ZFz3ukgBBwyMfUoAE
	Z5OecDrOUJBn2czZb3KS1r8wwT9Mxys=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-PfgWC-tvPuGK-zi7d_D3Vw-1; Wed,
 14 May 2025 23:40:32 -0400
X-MC-Unique: PfgWC-tvPuGK-zi7d_D3Vw-1
X-Mimecast-MFC-AGG-ID: PfgWC-tvPuGK-zi7d_D3Vw_1747280427
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13C401956046;
	Thu, 15 May 2025 03:40:27 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.116])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6EC2A1955F24;
	Thu, 15 May 2025 03:40:11 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com,
	hannes@cmpxchg.org,
	lorenzo.stoakes@oracle.com,
	rdunlap@infradead.org,
	mhocko@suse.com,
	Liam.Howlett@oracle.com,
	zokeefe@google.com,
	surenb@google.com,
	jglisse@google.com,
	cl@gentwo.org,
	jack@suse.cz,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	tiwai@suse.de,
	catalin.marinas@arm.com,
	anshuman.khandual@arm.com,
	dev.jain@arm.com,
	raquini@redhat.com,
	aarcange@redhat.com,
	kirill.shutemov@linux.intel.com,
	yang@os.amperecomputing.com,
	thomas.hellstrom@linux.intel.com,
	vishal.moola@gmail.com,
	sunnanyong@huawei.com,
	usamaarif642@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	shuah@kernel.org,
	peterx@redhat.com,
	willy@infradead.org,
	ryan.roberts@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	david@redhat.com,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	npache@redhat.com
Subject: [PATCH v6 4/4] selftests: mm: add defer to thp setting parser
Date: Wed, 14 May 2025 21:38:57 -0600
Message-ID: <20250515033857.132535-5-npache@redhat.com>
In-Reply-To: <20250515033857.132535-1-npache@redhat.com>
References: <20250515033857.132535-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

add the defer setting to the selftests library for reading thp settings.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 tools/testing/selftests/mm/thp_settings.c | 1 +
 tools/testing/selftests/mm/thp_settings.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/selftests/mm/thp_settings.c b/tools/testing/selftests/mm/thp_settings.c
index ad872af1c81a..b2f9f62b302a 100644
--- a/tools/testing/selftests/mm/thp_settings.c
+++ b/tools/testing/selftests/mm/thp_settings.c
@@ -20,6 +20,7 @@ static const char * const thp_enabled_strings[] = {
 	"always",
 	"inherit",
 	"madvise",
+	"defer",
 	NULL
 };
 
diff --git a/tools/testing/selftests/mm/thp_settings.h b/tools/testing/selftests/mm/thp_settings.h
index fc131d23d593..0d52e6d4f754 100644
--- a/tools/testing/selftests/mm/thp_settings.h
+++ b/tools/testing/selftests/mm/thp_settings.h
@@ -11,6 +11,7 @@ enum thp_enabled {
 	THP_ALWAYS,
 	THP_INHERIT,
 	THP_MADVISE,
+	THP_DEFER,
 };
 
 enum thp_defrag {
-- 
2.49.0

