Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62F20D519
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684825; cv=none; b=T82mqmuqNGvDdWAxMQrpeMn3gkgn7IXMEg+VgW2OScflJeNh39/5n3bYP4K2H93+JYh+oDIEEfy+UPZfTsXx1mWMObRSqcQrqlpEvyNH1XHlwZYwxE2JuIoV5o5FBGRLtOEVfyYyBFxTKw38PBahkp+45z/qc3LjDL21q5iQKIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684825; c=relaxed/simple;
	bh=tPiYfcRNaN/g+ao5eba1tssr535XVPsQIPQa3IrsRyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Z9NtzqeyAHLp8/8iAAq3qWmCn3dpsGfQQquoYeGjl0AF+tnfDZoa+KV8T8+4BkrEAbvmjNSKmgPflmZaAkISs5nkxiB2pZ4aB8wGdz/xHArPH84ezhF/UUpyith3u+sQvp5Ym9I5jEbSYf0wg28LgmmzsRAlW/fOR8zeOT6Fnm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGebudI1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGebudI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744684822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tuu/lyEGrQ5huyvs2A1U9HCIOm5LTsOq/3jwVMuJmBY=;
	b=BGebudI1XuN407VCTvJ6/XAnNiLzJNH0muoZnzl1nWXgok/dgRxsCNSHK2EJhz1kzTtRxH
	GmKmAkw5L16KSvoXYkrMwOrq2S/JT+paKbTB+BGP4ARFQbrzPUfpaYqNJ4eV7RNXlEoLV2
	4vOhZOfI1lHbsElZazQbNOjNggO4f4M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-a8lRE-JPN2Cate1uTDxBig-1; Mon,
 14 Apr 2025 22:40:16 -0400
X-MC-Unique: a8lRE-JPN2Cate1uTDxBig-1
X-Mimecast-MFC-AGG-ID: a8lRE-JPN2Cate1uTDxBig_1744684814
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC72319560B7;
	Tue, 15 Apr 2025 02:40:14 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 03A6E180AF7C;
	Tue, 15 Apr 2025 02:40:11 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 4/5] mm/vmalloc: optimize function vm_unmap_aliases()
Date: Tue, 15 Apr 2025 10:39:51 +0800
Message-ID: <20250415023952.27850-5-bhe@redhat.com>
In-Reply-To: <20250415023952.27850-1-bhe@redhat.com>
References: <20250415023952.27850-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Remove unneeded local variables and replace them with values.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/vmalloc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bf735c890878..3f38a232663b 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2930,10 +2930,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)
  */
 void vm_unmap_aliases(void)
 {
-	unsigned long start = ULONG_MAX, end = 0;
-	int flush = 0;
-
-	_vm_unmap_aliases(start, end, flush);
+	_vm_unmap_aliases(ULONG_MAX, 0, 0);
 }
 EXPORT_SYMBOL_GPL(vm_unmap_aliases);
 
-- 
2.41.0

