Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B91D5CFE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408827; cv=none; b=Q5T4OGVwH5v3Zyp++KcSqmz2RDN/wSFgZFt5vVZJjd2cICEbDmgh0r3w9JAeA/WYo40NHXLsZP2BU9fcCRLl1msLObyjHdriumF6UMs9SyIWB1TJklfj5Sg0FlQ6I0Y4GqpBJiIRU3xMQWqVhB6LrEwr96yXwzXV+COEcBoNJ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408827; c=relaxed/simple;
	bh=+4UX5hB7LOlseY8IDtLpOfVYFgMUwmkqQHjZeqNpum4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=AGEimkxhY7mluxPROGiwJEArYElRYRBXKpBbzydM1ddshSsfhu3L+NChwhyxMS8DOYSHBhLnSf0oTYp2VVxy7Yd+kdBG3dzw3aHvGyBsh2rB6YvB3/RV4Bk+l6IXLMljcehPxSU62PeIBy1BikF8XPw7bWPm41i1+bQTFSjR/VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRhd73CI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRhd73CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpQkE/o6UqynMHBaEyGhtuzDswvJwtgU/N8i6Bf76yI=;
	b=NRhd73CIQN8UkT2dFrd0s1LgIJdbQUIDN3OAy28DKPdMpTqdry9AvkYzEaK1FaqwHUvM0K
	+aSNoc1PXM7QqGE2um7t9w1Py1ex2/i1iMgfh83BzPI2l2Ljcvi87JEetFl5VqEEky+fBU
	R/vh55GiCBJX3hlKrZqX5c71efMjPD8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-fGwKGbB3NxqKefEQ3WVoQw-1; Mon,
 31 Mar 2025 04:13:39 -0400
X-MC-Unique: fGwKGbB3NxqKefEQ3WVoQw-1
X-Mimecast-MFC-AGG-ID: fGwKGbB3NxqKefEQ3WVoQw_1743408818
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C260180882E;
	Mon, 31 Mar 2025 08:13:38 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2BCB11955BF1;
	Mon, 31 Mar 2025 08:13:34 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 1/7] mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
Date: Mon, 31 Mar 2025 16:13:21 +0800
Message-ID: <20250331081327.256412-2-bhe@redhat.com>
In-Reply-To: <20250331081327.256412-1-bhe@redhat.com>
References: <20250331081327.256412-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Not like fault_in_readable() or fault_in_writeable(), in
fault_in_safe_writeable() local variable 'start' is increased page
by page to loop till the whole address range is handled. However,
it mistakenly calcalates the size of handled range with 'uaddr - start'.

Fix it here.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
v1->v2:
- Fix a patch log typo caused by copy-and-paste error. Thanks
  to Yanjun.

 mm/gup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 855ab860f88b..73777b1de679 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
 	} while (start != end);
 	mmap_read_unlock(mm);
 
-	if (size > (unsigned long)uaddr - start)
-		return size - ((unsigned long)uaddr - start);
+	if (size > start - (unsigned long)uaddr)
+		return size - (start - (unsigned long)uaddr);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_safe_writeable);
-- 
2.41.0

