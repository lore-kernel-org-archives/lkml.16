Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7A1F4CB8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669578; cv=none; b=ayPIusfwbPbeaf9qpDkUOC5o4tvaJzELecdc3KFYIhrpXyto9m3zKkNc/83qYukTFepr2m4NeGrYEWTGXFZ2HuBbRKbRoFJzF+OttxvDq/yTR5/IuiHZbE2bb9YZ/vMClF3P1rQSvOWRC5Mv3a5Ft07QaKIuPCAXYl/x8thRSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669578; c=relaxed/simple;
	bh=al6SKl71NAiNJnVYkq84dOJI0VdWszLtxLtJW6ZOVVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dex9D0x6+MNwPxViTnW+JcyJtUcPH/dj6aTBuVTVKC3GOmIDWCbcb/QthSsSf6XNzqnk6BFEcT9oF6lFHqTKlaiV7BXXXA8qCkUzDAzVhnsRccNuDpWcn1wXoRuvDGztKyJGT5F/zW8Jkn9UiAB7xqOJtIpdaKDMUbBfSQd99oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SfMJ7q9Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SfMJ7q9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744669575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7n76Fvpmfa8LN30y0qvCHdYcw71Um4Eimev9X0oBxqU=;
	b=SfMJ7q9Q/rLUtPUZoSRAo84etuWl+cZdhEgL9+f8FjUnV6GyumykKY+x2SR5r0Wvh9VvsX
	L+QLp7+1xtc/j8UqNBD8XO1YtyWYunsthKntzGDLRdNzbND2QdZm2W/FL7yP0yxdtIb2S0
	vOPuxhDB9qMCx7ieqn7Uhvcd2aZ1gdA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-XdkNGvy2OZa1MtxhAwhYsA-1; Mon,
 14 Apr 2025 18:26:11 -0400
X-MC-Unique: XdkNGvy2OZa1MtxhAwhYsA-1
X-Mimecast-MFC-AGG-ID: XdkNGvy2OZa1MtxhAwhYsA_1744669567
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D0AE1800262;
	Mon, 14 Apr 2025 22:26:07 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.64.91])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6EB1B180B486;
	Mon, 14 Apr 2025 22:25:58 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	shuah@kernel.org,
	david@redhat.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	willy@infradead.org,
	peterx@redhat.com,
	ioworker0@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	dev.jain@arm.com,
	mhocko@suse.com,
	rientjes@google.com,
	hannes@cmpxchg.org,
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
	raquini@redhat.com,
	aarcange@redhat.com,
	kirill.shutemov@linux.intel.com,
	yang@os.amperecomputing.com,
	thomas.hellstrom@linux.intel.com,
	vishal.moola@gmail.com,
	sunnanyong@huawei.com,
	usamaarif642@gmail.com,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	rostedt@goodmis.org
Subject: [PATCH v3 4/4] selftests: mm: add defer to thp setting parser
Date: Mon, 14 Apr 2025 16:24:56 -0600
Message-ID: <20250414222456.43212-5-npache@redhat.com>
In-Reply-To: <20250414222456.43212-1-npache@redhat.com>
References: <20250414222456.43212-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
2.48.1

