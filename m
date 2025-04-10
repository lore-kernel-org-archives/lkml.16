Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03422853EB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289490; cv=none; b=BpCqc5qX+wPA867r3ur+nCP0RohP9VQFWj3owr/Gi3RZ31rTiUli7iAtZRJfU37MN6blLGYn//zQANezX+IFeD8ok2i7PN8r/nhGKiJrFcCLfKJkAVcOvp+Tf0NrJpedMgim77eW9nNHXfO+jQrQlf5EEsW4tpJsSvQ6az5dNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289490; c=relaxed/simple;
	bh=Ro3UQRyumbRJhMlzFECnVWbtdS5SKkbzF4k7uQwBGRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eoGUl9DxvTw5GAUWdWrYu1U33Eic9Wb8Q4OkOLmQ5BndC8mDmMdfgLUy+bXL4SHWlKsph6gje3scCrNeNqM4up0fzTtcG8/Pq2JpyGWa8IFvSTTdAIZ1YQzFHj0fYvTgcCBCSYZFsh1yK1B2MpMgkl19emqdVG9Kzju5+YIzPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnIXYc1p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnIXYc1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744289487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R5iP8nxX4Rfv3tMEqkt3245YuQxQ44If4h8fHoKoMuY=;
	b=SnIXYc1pHCZl3I+xQqpB5fsrWW+UdHHjEOE1NvbXIB/YrK9tjPcCmcACLPDdzb/I0wrPid
	ULKv6fzTspUJaln7k5AeNxHAzXXxYLSGZ+MwRUj8yXzZ36js4kjeSgVuR9GBXINQGRSk+Q
	SkHrZ87iHgmDFJ2PAbP5VQn4DArOdEk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-KkP6AqlAMDW6G9B-gS96rA-1; Thu,
 10 Apr 2025 08:51:24 -0400
X-MC-Unique: KkP6AqlAMDW6G9B-gS96rA-1
X-Mimecast-MFC-AGG-ID: KkP6AqlAMDW6G9B-gS96rA_1744289482
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8AB3E180034D;
	Thu, 10 Apr 2025 12:51:22 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.115])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51F6119560AD;
	Thu, 10 Apr 2025 12:51:16 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	adityag@linux.ibm.com,
	donettom@linux.ibm.com,
	david@redhat.com,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	gshan@redhat.com,
	shan.gavin@gmail.com
Subject: [PATCH] drivers/base/memory: Avoid overhead from for_each_present_section_nr()
Date: Thu, 10 Apr 2025 22:51:10 +1000
Message-ID: <20250410125110.1232329-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

for_each_present_section_nr() was introduced to add_boot_memory_block()
by commit 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()").
It causes unnecessary overhead when the present sections are really
sparse. next_present_section_nr() called by the macro to find the next
present section, which is far away from the spanning sections in the
specified block. Too much time consumed by next_present_section_nr()
in this case, which can lead to softlockup as observed by Aditya Gupta
on IBM Power10 machine.

  watchdog: BUG: soft lockup - CPU#248 stuck for 22s! [swapper/248:1]
  Modules linked in:
  CPU: 248 UID: 0 PID: 1 Comm: swapper/248 Not tainted 6.15.0-rc1-next-20250408 #1 VOLUNTARY
  Hardware name: 9105-22A POWER10 (raw) 0x800200 opal:v7.1-107-gfda75d121942 PowerNV
  NIP:  c00000000209218c LR: c000000002092204 CTR: 0000000000000000
  REGS: c00040000418fa30 TRAP: 0900   Not tainted  (6.15.0-rc1-next-20250408)
  MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000428  XER: 00000000
  CFAR: 0000000000000000 IRQMASK: 0
  GPR00: c000000002092204 c00040000418fcd0 c000000001b08100 0000000000000040
  GPR04: 0000000000013e00 c000c03ffebabb00 0000000000c03fff c000400fff587f80
  GPR08: 0000000000000000 00000000001196f7 0000000000000000 0000000028000428
  GPR12: 0000000000000000 c000000002e80000 c00000000001007c 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR28: c000000002df7f70 0000000000013dc0 c0000000011dd898 0000000008000000
  NIP [c00000000209218c] memory_dev_init+0x114/0x1e0
  LR [c000000002092204] memory_dev_init+0x18c/0x1e0
  Call Trace:
  [c00040000418fcd0] [c000000002092204] memory_dev_init+0x18c/0x1e0 (unreliable)
  [c00040000418fd50] [c000000002091348] driver_init+0x78/0xa4
  [c00040000418fd70] [c0000000020063ac] kernel_init_freeable+0x22c/0x370
  [c00040000418fde0] [c0000000000100a8] kernel_init+0x34/0x25c
  [c00040000418fe50] [c00000000000cd94] ret_from_kernel_user_thread+0x14/0x1c

Avoid the overhead by folding for_each_present_section_nr() to the outer
loop. add_boot_memory_block() is dropped after that.

Fixes: 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()")
Closes: https://lore.kernel.org/linux-mm/20250409180344.477916-1-adityag@linux.ibm.com
Reported-by: Aditya Gupta <adityag@linux.ibm.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 drivers/base/memory.c | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 8f3a41d9bfaa..19469e7f88c2 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -816,21 +816,6 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
 	return 0;
 }
 
-static int __init add_boot_memory_block(unsigned long base_section_nr)
-{
-	unsigned long nr;
-
-	for_each_present_section_nr(base_section_nr, nr) {
-		if (nr >= (base_section_nr + sections_per_block))
-			break;
-
-		return add_memory_block(memory_block_id(base_section_nr),
-					MEM_ONLINE, NULL, NULL);
-	}
-
-	return 0;
-}
-
 static int add_hotplug_memory_block(unsigned long block_id,
 				    struct vmem_altmap *altmap,
 				    struct memory_group *group)
@@ -957,7 +942,7 @@ static const struct attribute_group *memory_root_attr_groups[] = {
 void __init memory_dev_init(void)
 {
 	int ret;
-	unsigned long block_sz, nr;
+	unsigned long block_sz, block_id, nr;
 
 	/* Validate the configured memory block size */
 	block_sz = memory_block_size_bytes();
@@ -970,15 +955,23 @@ void __init memory_dev_init(void)
 		panic("%s() failed to register subsystem: %d\n", __func__, ret);
 
 	/*
-	 * Create entries for memory sections that were found
-	 * during boot and have been initialized
+	 * Create entries for memory sections that were found during boot
+	 * and have been initialized. Use @block_id to track the last
+	 * handled block and initialize it to an invalid value (ULONG_MAX)
+	 * to bypass the block ID matching check for the first present
+	 * block so that it can be covered.
 	 */
-	for (nr = 0; nr <= __highest_present_section_nr;
-	     nr += sections_per_block) {
-		ret = add_boot_memory_block(nr);
-		if (ret)
-			panic("%s() failed to add memory block: %d\n", __func__,
-			      ret);
+	block_id = ULONG_MAX;
+	for_each_present_section_nr(0, nr) {
+		if (block_id != ULONG_MAX && memory_block_id(nr) == block_id)
+			continue;
+
+		block_id = memory_block_id(nr);
+		ret = add_memory_block(block_id, MEM_ONLINE, NULL, NULL);
+		if (ret) {
+			panic("%s() failed to add memory block: %d\n",
+			      __func__, ret);
+		}
 	}
 }
 
-- 
2.48.1

