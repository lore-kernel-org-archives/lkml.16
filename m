Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3957B158538
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234529; cv=none; b=LCVDb9NiWQOCUvLOcWydn6JVYoFw9wDZGnGRhwTn04I1dAyJlpbC9Mtotr2cvm8LhV0G1RZfOdNWGXz06YIKPgQ1LrxB2Q/J9hx4Fd55PwAdawhtzFgw6hmbPsBv+Zp7uIHJTvELyyjqa7ar8Fa5/HMcZ8xxYeHDbqdRm2XHQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234529; c=relaxed/simple;
	bh=al6SKl71NAiNJnVYkq84dOJI0VdWszLtxLtJW6ZOVVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPhr6h3ArNDXeuzjgW06a2SnMbU1QNxvVNAWuX4ZBswaS9SCScLwZ+8aeDnD6gYQug7FVjvnBcX4CBZmodnEFvxbSA0SyJuDGCZbscUp+SoyTLq7ow12Klv4/5B3fMiIEumjT09hePlbe9WICwpD8l0fN1oEtocoIZQRNeRCFa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PsMdRr9q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PsMdRr9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739234527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7n76Fvpmfa8LN30y0qvCHdYcw71Um4Eimev9X0oBxqU=;
	b=PsMdRr9qldS9ujoCM0psXDWCxYFAh4F3hhycCl4kYgyDbUxUSKgE3ZKRVvd309pPD/2w4n
	Ts6xFGp5NGB+tHkEd8/4+q05L3wv3kFLiHMk3X/R+bLYt1BXVqd/kmqUoWNayUaVfgBq99
	PqO1uyAb/eSKiKl6YA+/TGz6/zIU5TU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-aYBG98PjP5S9ARVq1-GRRw-1; Mon,
 10 Feb 2025 19:42:04 -0500
X-MC-Unique: aYBG98PjP5S9ARVq1-GRRw-1
X-Mimecast-MFC-AGG-ID: aYBG98PjP5S9ARVq1-GRRw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1FA6119560B0;
	Tue, 11 Feb 2025 00:42:00 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.129])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10D6D1800352;
	Tue, 11 Feb 2025 00:41:50 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com,
	david@redhat.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
	sunnanyong@huawei.com,
	usamaarif642@gmail.com,
	audra@redhat.com,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	tiwai@suse.de,
	baolin.wang@linux.alibaba.com,
	corbet@lwn.net,
	shuah@kernel.org
Subject: [RFC v2 3/5] selftests: mm: add defer to thp setting parser
Date: Mon, 10 Feb 2025 17:40:52 -0700
Message-ID: <20250211004054.222931-4-npache@redhat.com>
In-Reply-To: <20250211004054.222931-1-npache@redhat.com>
References: <20250211004054.222931-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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

