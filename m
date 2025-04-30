Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840972D0AA2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046811; cv=none; b=SK6lMQHwEOwHnOd4N2EqJi67RvDSvzq/f05/Cr6a4BrQPHmlhmi+A6GhqChgRLoxYeHoW86B2nfg2tw6VRibdLiV26igReD3740ZyppTG/fxUmz4U4vioMvQzM41h/LBnbKYWqojh0ElFzT3UPlmOxVjtyJVJ5R9nnnEio9ZvRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046811; c=relaxed/simple;
	bh=xbayRUeDWjFnfHRNtE0mkOGITr3qyYQrs8XBjJE179E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUitWg2WN53bjSaaoYB4vIRyYO+hrw5ypOsLmI8ssz4OdpkriHmDT4AIyhdT6k28lKJ6DnUDB7V5jsxGpQyQAZgr8fit7VJIYLE3Ha1mVvlwIMDy9HeOmOAQY0COCM9Pm1zs9HO9YJE7FnDe/hf/eIhJXaJFIc/wmj8QrUEhIpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QrDi6DdX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QrDi6DdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746046808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85HS0oNtK3lcYayxAem2fVW6gu+Q3E9O800xuhezz9M=;
	b=QrDi6DdXMiD4lMvyVdodowqR0QshLcuam652QsIbvIbUZeshMAGptQkGXXW88u6vsTAdS9
	Ztna4WjKT2p3spEKQOYgIT68wF8V6l4EWZMA2g1+vk6KQOBGOSdKcJV529fFIKhpDvrGk1
	VowdoU6yUuU/ylO1BeG8Y5zMeh4a3Jk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-lBdygPvyMqqNq255Awq5VA-1; Wed,
 30 Apr 2025 17:00:02 -0400
X-MC-Unique: lBdygPvyMqqNq255Awq5VA-1
X-Mimecast-MFC-AGG-ID: lBdygPvyMqqNq255Awq5VA_1746046801
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46BED1800368;
	Wed, 30 Apr 2025 21:00:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.88.112])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45BF71800365;
	Wed, 30 Apr 2025 21:00:00 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: catalin.marinas@arm.com
Cc: lcapitulino@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@redhat.com
Subject: [PATCH 1/3] mm: kmemleak: drop kmemleak_warning variable
Date: Wed, 30 Apr 2025 16:59:45 -0400
Message-ID: <97e23faa7b67099027a1094c9438da5f72e037af.1746046744.git.luizcap@redhat.com>
In-Reply-To: <cover.1746046744.git.luizcap@redhat.com>
References: <cover.1746046744.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The kmemleak_warning variable is not used since commit c5665868183f ("mm:
kmemleak: use the memory pool for early allocations"), drop it.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 mm/kmemleak.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index c12cef3eeb32..e6df94c7b032 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -215,8 +215,6 @@ static int kmemleak_enabled = 1;
 static int kmemleak_free_enabled = 1;
 /* set in the late_initcall if there were no errors */
 static int kmemleak_late_initialized;
-/* set if a kmemleak warning was issued */
-static int kmemleak_warning;
 /* set if a fatal kmemleak error has occurred */
 static int kmemleak_error;
 
@@ -254,7 +252,6 @@ static void kmemleak_disable(void);
 #define kmemleak_warn(x...)	do {		\
 	pr_warn(x);				\
 	dump_stack();				\
-	kmemleak_warning = 1;			\
 } while (0)
 
 /*
-- 
2.49.0

