Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0B41F12FA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257458; cv=none; b=E3L+xhOVn/20eXhIlHvgVCN7CsqTyCxYE1eT1DuRAOjo7dLdx7ATqezj7b+ALjXCKdPP3Jn8qQ/riFLwp7RzsXoRX5+C4mLJjaR8F+DWgOWSgU3vwVUlingf2cJrpe1FW2kts++8hJXCPg8rTVsF3zwKFkjkPn/1FL4MMuaVa34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257458; c=relaxed/simple;
	bh=xhN4itx0LE9yqkE1o0cdQbCMJsNrbt92KK3WKMDRZsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=C3DXX26tpRsxVMDxoaB7DeZzkOGELlMBcsYzVY8gN+JQaqKqtlUNr0fnCwWnYSYoRqjH1mBk7lJomWo+SfqgN2aqDyQDFYJGpW/zHZ+nQ1AbHagcY7m0wwwQSqA2KpdNOqRhJ6F6BTRl40Stm8JoOrLjjtiYKABsjtngIwV8tGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZkxp2W8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZkxp2W8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744257455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lMkbdXy2zeXmVG+XN8Oyl1Hd6P5dnLAMb7gAr8RumIQ=;
	b=fZkxp2W8hVXLfZwyy0Sd35J/NQO7YN1qC/qCdciqHLSg4c3IoyGAGdL3uKQcEds6srRT5j
	PNoH/79XV0/Ejm9LwciNldFB5+BSjGABHKqzjjB63wOKRf2s/oPX+aaEZl74Acq99Tr0wq
	UxBzOjVHT1GbxjHd58Wd+a36eJvlfDE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-9bda-oNtP0ed2q9iAoQTIA-1; Wed,
 09 Apr 2025 23:57:32 -0400
X-MC-Unique: 9bda-oNtP0ed2q9iAoQTIA-1
X-Mimecast-MFC-AGG-ID: 9bda-oNtP0ed2q9iAoQTIA_1744257451
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF77519560B0;
	Thu, 10 Apr 2025 03:57:30 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A03EF19560AD;
	Thu, 10 Apr 2025 03:57:26 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	osalvador@suse.de,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v4 1/4] mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
Date: Thu, 10 Apr 2025 11:57:14 +0800
Message-ID: <20250410035717.473207-2-bhe@redhat.com>
In-Reply-To: <20250410035717.473207-1-bhe@redhat.com>
References: <20250410035717.473207-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Not like fault_in_readable() or fault_in_writeable(), in
fault_in_safe_writeable() local variable 'start' is increased page
by page to loop till the whole address range is handled. However,
it mistakenly calcalates the size of handled range with 'uaddr - start'.

Fix it here.

Signed-off-by: Baoquan He <bhe@redhat.com>
Fixes: fe673d3f5bf1 ("mm: gup: make fault_in_safe_writeable() use fixup_user_fault()")
---
 mm/gup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 92351e2fa876..84461d384ae2 100644
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

