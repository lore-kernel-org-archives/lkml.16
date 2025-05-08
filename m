Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF17494
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 00:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746662905; cv=none; b=NydqPaSfDh8D6IidEIKufiknKgjLAR70A3c2I+PRv77pdOh0z6dkhB1+IqZ0KbG9XaocXiq0veEZgOKzbo9pF22eyXCWfY+ZfLErQ9/vwgag/NohKXfM3cHOOzrlSqFWTSL0MQKnDFZEjCITIOzWPDsy4CmlSkT6oiVV4kxwlyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746662905; c=relaxed/simple;
	bh=utxXYxvQ5swiWcCpu/bpX8xPPoD44zsBkzBtvr5n9xY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GPdzNEjEiE8x54iBr0KgXhOGeB59fMGTV3iB2B024VIjVJoxmCep1iBPGTKjpFGasx7Hgq1HCVfr2eLn75MekCOZvtCVmIUVT+j8v0h6+1HuteJIWoV9viKvMYUAaU/TNAAFio1oO5f/LdjAVKk9CNIemqYMOQX8XwseoIQNb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F4lHdvtv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4lHdvtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746662902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3geJ1eoe7Xmqv9/rYLss07fcoghDwsU4cpc+XIPcNxc=;
	b=F4lHdvtvIKYn4DspR8JxZM9WaW18OiI8nHcwnQDZmqrgIuP6q2FjcExtxqawyWH0u7zaL1
	R3V+C8SV6N5QKtTVaZX4TUN6jwn4pxR5a9qXAdi9OAeWDrMal1ZQnEuYBqCGesvs9aXfYt
	F2JzkNQar9cZXDLz7djWFpK9IRcHyV4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-V-OD92X0My69ApB0RwYkqw-1; Wed,
 07 May 2025 20:08:18 -0400
X-MC-Unique: V-OD92X0My69ApB0RwYkqw-1
X-Mimecast-MFC-AGG-ID: V-OD92X0My69ApB0RwYkqw_1746662897
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 458481956080;
	Thu,  8 May 2025 00:08:17 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.14])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 959971955F24;
	Thu,  8 May 2025 00:08:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	david@redhat.com,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Subject: [PATCH] drivers/base/memory: Skip handled sections in memory_dev_init()
Date: Thu,  8 May 2025 10:08:01 +1000
Message-ID: <20250508000801.178672-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

It's unnecessary to iterate those sections and check their presence
states if their block has been handled. In this specific case, the
cursor of for_each_present_section_nr() can leap to the starting
section of next block to bypass those covered sections, resulting
in small performance gain. For example, the time consumed by the
function drops by 12us on a X86 system with 100GB memory as Oscar
tested.

Suggested-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 drivers/base/memory.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 19469e7f88c2..f612e43afe39 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -942,7 +942,7 @@ static const struct attribute_group *memory_root_attr_groups[] = {
 void __init memory_dev_init(void)
 {
 	int ret;
-	unsigned long block_sz, block_id, nr;
+	unsigned long block_sz, nr;
 
 	/* Validate the configured memory block size */
 	block_sz = memory_block_size_bytes();
@@ -956,22 +956,22 @@ void __init memory_dev_init(void)
 
 	/*
 	 * Create entries for memory sections that were found during boot
-	 * and have been initialized. Use @block_id to track the last
-	 * handled block and initialize it to an invalid value (ULONG_MAX)
-	 * to bypass the block ID matching check for the first present
-	 * block so that it can be covered.
+	 * and have been initialized.
 	 */
-	block_id = ULONG_MAX;
 	for_each_present_section_nr(0, nr) {
-		if (block_id != ULONG_MAX && memory_block_id(nr) == block_id)
-			continue;
-
-		block_id = memory_block_id(nr);
-		ret = add_memory_block(block_id, MEM_ONLINE, NULL, NULL);
+		ret = add_memory_block(memory_block_id(nr), MEM_ONLINE,
+				       NULL, NULL);
 		if (ret) {
 			panic("%s() failed to add memory block: %d\n",
 			      __func__, ret);
 		}
+
+		/*
+		 * Forward to the last section in this block so that we will
+		 * process the first section of the next block in the next
+		 * iteration.
+		 */
+		nr = ALIGN(nr + 1, sections_per_block) - 1;
 	}
 }
 
-- 
2.49.0

