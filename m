Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85122D786
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744133929; cv=none; b=uSjRJlOEWqDO1O38Q2BOPftbX05tlWSyCddaKFIWZPAEnOwpdFQS1CPfdXL470iNZdVaYTA5cpWT2GoLcIfvh0+Bmy5nJVfwXCLFIigVlPPHc3pm5Y0FgFv0Enwhlts3CBFRlx89vCy53CVd9Lf1yDkuWlB1K0geQqL8VHtJdrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744133929; c=relaxed/simple;
	bh=AkuP0bUUMlSOQKFownX9JGiZ0AtO1qOpMcVVRDDfLNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kx414gl3ifmr5IOrepPAClZ7/rkrB/kxNlBranCenld8Tls4oGnIXdoUXICL3L4zsU2FsjaH1mvPYTuTok8Id0nkwfSHDtH0AXmRf7Z/djbyGrpLEC9mY3/jz76mtr3qlrCF/L2DlyY9qQvW7zV994cA1SIdEOVTbQjmimfgH3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ix0cOZeI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ix0cOZeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744133927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=itYmtHonV37X5He5iLoB2zIL/ZP2GM0njYcsfBzTAtA=;
	b=ix0cOZeI5aSsDF2j89gfmS6acu5oQnFOF02/bB+xxKt7Sr4IPKoJsSrMyAY2HFghr0YF+n
	9bTQ598YAPGOetFAGM+NfNZogeTfzPEJd07tsHGwE9IBCzKfkS0N8RNg90NIWMjYRvcNGK
	otdE61bjmkioeUQHPEcJucH0/iCX0/M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-CAxqeKhHNMOGODJUYiZQ0g-1; Tue,
 08 Apr 2025 13:38:43 -0400
X-MC-Unique: CAxqeKhHNMOGODJUYiZQ0g-1
X-Mimecast-MFC-AGG-ID: CAxqeKhHNMOGODJUYiZQ0g_1744133922
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F40E1800266;
	Tue,  8 Apr 2025 17:38:42 +0000 (UTC)
Received: from f39.redhat.com (unknown [10.45.224.220])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56AAD19560AD;
	Tue,  8 Apr 2025 17:38:40 +0000 (UTC)
From: Eder Zulian <ezulian@redhat.com>
To: vinicius.gomes@intel.com,
	dave.jiang@intel.com,
	vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eder Zulian <ezulian@redhat.com>
Subject: [PATCH] dmaengine: idxd: Remove unused pointer and macro
Date: Tue,  8 Apr 2025 19:38:29 +0200
Message-ID: <20250408173829.892317-1-ezulian@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The pointer 'extern struct kmem_cache *idxd_desc_pool' and the macro
'#define IDXD_ALLOCATED_BATCH_SIZE 128U' were introduced in commit
bfe1d56091c1 ("dmaengine: idxd: Init and probe for Intel data
accelerators") but they were never used.

Signed-off-by: Eder Zulian <ezulian@redhat.com>
---
 drivers/dma/idxd/idxd.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index 214b8039439f..74e6695881e6 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -19,7 +19,6 @@
 
 #define IDXD_DRIVER_VERSION	"1.00"
 
-extern struct kmem_cache *idxd_desc_pool;
 extern bool tc_override;
 
 struct idxd_wq;
@@ -171,7 +170,6 @@ struct idxd_cdev {
 
 #define DRIVER_NAME_SIZE		128
 
-#define IDXD_ALLOCATED_BATCH_SIZE	128U
 #define WQ_NAME_SIZE   1024
 #define WQ_TYPE_SIZE   10
 
-- 
2.49.0

