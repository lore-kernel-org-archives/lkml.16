Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB857297A53
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865005; cv=none; b=NmhbWdbtCvk7L6wM72pFzGHZN2sg12XR5hBLO2CzE1S5LilEXK74iUJuWSd11P803JoyZyhkyTeZ9LbCnMrneM5ADtuUc6yM2EDumbRSaOHjFSHTAhPR7moXafxw3u3i1wTzZt5YSPqOo+nhBEZgqsOuI08q6NMK7UyDIynkw7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865005; c=relaxed/simple;
	bh=al6SKl71NAiNJnVYkq84dOJI0VdWszLtxLtJW6ZOVVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBsVNIuG64d5bi/aXfgRFtNbxrVxdfP+mo4FRoKWlYS0zhf3IkJCMaxaIWPpAWjFfdsNs6kfcKDaWuzGEq4zPwZm81M8o0xK4lPF2uuxDbp42ekPfGOitjwEMBlrw8+j9t3yoZBSMUTJEljShHayUXwtcRifPrfMr3OyZao6Rr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T8mfQ1Yc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T8mfQ1Yc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745865002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7n76Fvpmfa8LN30y0qvCHdYcw71Um4Eimev9X0oBxqU=;
	b=T8mfQ1YcRpR5k8avo06kEonkn2IGYlNBxhXN5BK1jC8PpcnGKZbRDxqq6XR468iD1DME90
	T411Zp4uzmvcK3rVrgy2MbyEmu+6BBfZSUDgtDgfHt+Wovinpl5TQrLqT7KfvPUtpdqjx4
	bVo3vT4ApvjdCs/gUOKyAkUFoKPbA6g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-8mNvuNGgM0GU6SKQRbhLfA-1; Mon,
 28 Apr 2025 14:29:59 -0400
X-MC-Unique: 8mNvuNGgM0GU6SKQRbhLfA-1
X-Mimecast-MFC-AGG-ID: 8mNvuNGgM0GU6SKQRbhLfA_1745864994
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C03BF1800877;
	Mon, 28 Apr 2025 18:29:53 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.65.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ADB3330001A2;
	Mon, 28 Apr 2025 18:29:45 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	david@redhat.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	willy@infradead.org,
	peterx@redhat.com,
	shuah@kernel.org,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	tiwai@suse.de,
	will@kernel.org,
	dave.hansen@linux.intel.com,
	jack@suse.cz,
	cl@gentwo.org,
	jglisse@google.com,
	surenb@google.com,
	zokeefe@google.com,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	hannes@cmpxchg.org,
	rientjes@google.com,
	mhocko@suse.com,
	rdunlap@infradead.org
Subject: [PATCH v5 4/4] selftests: mm: add defer to thp setting parser
Date: Mon, 28 Apr 2025 12:29:04 -0600
Message-ID: <20250428182904.93989-5-npache@redhat.com>
In-Reply-To: <20250428182904.93989-1-npache@redhat.com>
References: <20250428182904.93989-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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

