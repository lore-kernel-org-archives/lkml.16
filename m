Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA64022A80E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747685; cv=none; b=I5sqib2tx/xfTeTyWVytc9a/2PfA3AV+HJ8tHEd44L5pLPpqcgxOTINMcborRbzMNywwKR4W76rQuo2lwJM4szL402iXQ9zPDWW9eCf33rFZF6Z4wLJ88fjJYv4VtBVpygBB/paEoMtWy/AbyQjjiEuJFbj5pkGARFEFv3Oi8jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747685; c=relaxed/simple;
	bh=pFCf3XiARpVif3NNdiBg5rjaSRsI/kNvNA2UffU7WNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Lv4wWPVE4SmdQo40W6AVw4467oXf5GmYjnI4zIznkQeUbl7jmz92XmW/PamIWOKEDqUFYAokntBxngV5VA10h449Ne35oZA4+uC6XVRclGPFMJJZYKYwuiLEZw0OAwGsY0ZtlpEGLzOrsDS2sv/rSncoI/92W6PrH1jN4ltgsFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U6FgY4a7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U6FgY4a7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfQRbrAPzJ//p+aZcAFopIE6B9AWo00nZkaqbYuuJ/4=;
	b=U6FgY4a7AwFocMCVXQYNlswwF9Z/TmsrqIYk7cpR+8Ee3qYphzsWyge3g3wBl3Tc9B4Heg
	yAZey3k6UAeP1IXHkRMwtDvQfvvDnw2IJ2HvAV2l/1qh/ODvh0VURUM+pc8qVAM7/AOY5m
	Ey9Hxr32KsmedfZBoo6hg6dgYZw6/cs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-EwIqPDUzPAGcwC0RIUNX0A-1; Wed,
 05 Feb 2025 04:27:58 -0500
X-MC-Unique: EwIqPDUzPAGcwC0RIUNX0A-1
X-Mimecast-MFC-AGG-ID: EwIqPDUzPAGcwC0RIUNX0A
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B08E019560BE;
	Wed,  5 Feb 2025 09:27:57 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0C94300018D;
	Wed,  5 Feb 2025 09:27:53 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 06/12] mm/swapfile.c: update the code comment above swap_count_continued()
Date: Wed,  5 Feb 2025 17:27:15 +0800
Message-ID: <20250205092721.9395-7-bhe@redhat.com>
In-Reply-To: <20250205092721.9395-1-bhe@redhat.com>
References: <20250205092721.9395-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Now, swap_count_continued() has two callers, __swap_duplicate() and
__swap_entry_free_locked(), the relevant code comment is stale.
Update it to reflect the current situation.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swapfile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index bf284ba16198..9ee2238042a5 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3789,8 +3789,8 @@ int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
  * into, carry if so, or else fail until a new continuation page is allocated;
  * when the original swap_map count is decremented from 0 with continuation,
  * borrow from the continuation and report whether it still holds more.
- * Called while __swap_duplicate() or swap_entry_free() holds swap or cluster
- * lock.
+ * Called while __swap_duplicate() or caller of __swap_entry_free_locked()
+ * holds swap or cluster lock.
  */
 static bool swap_count_continued(struct swap_info_struct *si,
 				 pgoff_t offset, unsigned char count)
-- 
2.41.0

