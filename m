Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659D028C2D3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294541; cv=none; b=ZkiPl6jii6z03CN3CBJp2I2p1OtJFw0PfuYPESEEM0bv6dNgnUHW71F/Y0ADHHTFcDn/FZ/+parE+I3bj9rGitzUsEgxYVDZdVcVcr3OBF4dvySQIj+0WPWZfpyn87Ft2a2zL0aDrHKJ7kaqhADccWU8mXdIpgrzK20UKoAFRuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294541; c=relaxed/simple;
	bh=WFPQNGAJITHf32OWZme2nTms9NHLOZOiry3XwYpeMho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dLyECsVOJ6fXUho7ugnEjVFKyBMbRIvIT5ftTjoU69arSDQ//EsH/mrhJ9cC6sjUnpDLnPonCGQybrG4v5j6ColIjWtcTbuzwmsP1Y3DH9sogOxYQvOZfW1v4UZPasAe0dwfdpI97NkniW18KcZ1f5/OqhpvL0Fm/4oGxonuKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dbwaxbQZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7QYbxML7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dbwaxbQZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7QYbxML7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dbwaxbQZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7QYbxML7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dbwaxbQZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7QYbxML7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A4D021164;
	Mon, 30 Jun 2025 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GzLMyabYZWnfai/GjIlaaIB9T8NN4dI3ADLvoB8CDB0=;
	b=dbwaxbQZWOqWpC+fVhTa7AD0Qn8LYOYRhkGykz2AOwLW/heZZEww7Gn96579sDolInGNwu
	n58h5yEvyQSoZ24+Q5pHlr+sDjFH9TUvGAa18yHHodprzqxsiNNqw4TL1rn3FPeNnGBahu
	Ircdc8kxDzt9QpFpwSGgosIs28J+fKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GzLMyabYZWnfai/GjIlaaIB9T8NN4dI3ADLvoB8CDB0=;
	b=7QYbxML7KbZkNz5tB8x4iZE2G+JMl/ioo10zic3Wn+10lOZcLitxYVbwV3c03IvbFi7oz6
	zdLUMPNtcM1p16DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dbwaxbQZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7QYbxML7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GzLMyabYZWnfai/GjIlaaIB9T8NN4dI3ADLvoB8CDB0=;
	b=dbwaxbQZWOqWpC+fVhTa7AD0Qn8LYOYRhkGykz2AOwLW/heZZEww7Gn96579sDolInGNwu
	n58h5yEvyQSoZ24+Q5pHlr+sDjFH9TUvGAa18yHHodprzqxsiNNqw4TL1rn3FPeNnGBahu
	Ircdc8kxDzt9QpFpwSGgosIs28J+fKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GzLMyabYZWnfai/GjIlaaIB9T8NN4dI3ADLvoB8CDB0=;
	b=7QYbxML7KbZkNz5tB8x4iZE2G+JMl/ioo10zic3Wn+10lOZcLitxYVbwV3c03IvbFi7oz6
	zdLUMPNtcM1p16DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3B691399F;
	Mon, 30 Jun 2025 14:42:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oHReOEeiYmjqdAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 30 Jun 2025 14:42:15 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 0/5] Misc rework on hugetlb faulting path
Date: Mon, 30 Jun 2025 16:42:07 +0200
Message-ID: <20250630144212.156938-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7A4D021164
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.01
X-Spam-Level: 


 v3 -> v4:
  - Fix the deadlock for real in patch#1 (Kudos to Galving for testing out v3)
  - Keep trylock as the original code does
  - Add reproducer in the cover letter

 v2 -> v3:
   - Addressed issue folio_lock when holding spinlock (per David)
   - Simplify new_anon_folio (per David)
   - Slightly rework patch#2 to make it simpler

 v1 -> v2:
   - Addressed feedback from David
   - Settle ideas wrt. locking in faulting path after
     discussion with David
   - Add Acks-by

 RFC -> v1:
   - Stop looking up folio in the pagecache for detecting a COW
     on a private mapping.
   - Document the locks

This patchset aims to give some love to the hugetlb faulting path, doing so
by removing obsolete comments that are no longer true, sorting out the folio
lock, and changing the mechanism we use to determine whether we are COWing a
private mapping already.

The most important patch of the series is #1, as it fixes a deadlock that
was described in [1], where two processes were holding the same lock
for the folio in the pagecache, and then deadlocked in the mutex.
Note that this can also happen for anymous folios. This has been tested using
this reproducer [2].

Looking up and locking the folio in the pagecache was done to check whether
that folio was the same folio we had mapped in our pagetables, meaning that if it
was different we knew that we already mapped that folio privately, so any
further CoW would be made on a private mapping, which lead us to the  question:
 __Was the reservation for that address consumed?__
That is all we care about, because if it was indeed consumed and we are the
owner and we cannot allocate more folios, we need to unmap the folio from the
processes pagetables and make it exclusive for us.

We figured we do not need to look up the folio at all, and it is just enough to
check whether the folio we have mapped is anonymous, which means we mapped it
privately, so the reservation was indeed consumed.

Patch#2 sorts out folio locking in the faulting path, reducing the scope of it
,only taking it when we are dealing with an anonymous folio and document it.
More details in the patch.

Patch#3-5 are cleanups.

[1] https://lore.kernel.org/lkml/20250513093448.592150-1-gavinguo@igalia.com/
[2] Here is the reproducer:

 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <sys/mman.h>
 #include <sys/wait.h>
 
 #define PROTECTION (PROT_READ | PROT_WRITE)
 #define LENGTH (2UL*1024*1024)
 
 #define ADDR (void *)(0x0UL)
 #define FLAGS (MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB)
 
 void __read(char *addr)
 {
 	int i = 0;
 
 	printf("a[%d]: %c\n", i, addr[i]);
 }
 
 void fill(char *addr)
 {
 	addr[0] = 'd';
 
 	printf("addr: %c\n", addr[0]);
 }
 
 int main(void)
 {
 	void *addr;
 	pid_t pid, wpid;
 	int status;
 
 	addr = mmap(ADDR, LENGTH, PROTECTION, FLAGS, -1, 0);
 	if (addr == MAP_FAILED) {
 		perror("mmap");
 		return -1;
 	}
 
 	printf("Parent faulting in RO\n");
 	__read(addr);
 
 	sleep (10);
 	printf("Forking\n");
 
 	pid = fork();
 	switch (pid) {
 	case -1:
 		perror("fork");
 		break;
 	case 0:
 		sleep (4);
 		printf("Child: Faulting in\n");
 		fill(addr);
 		exit(0);
 		break;
 	default:
 		printf("Parent: Faulting in\n");
 		fill(addr);
 		while((wpid = wait(&status)) > 0);
 		if (munmap(addr, LENGTH))
 			perror("munmap");
 	}
 
 
 	return 0;
 }

You will also have to add a delay in hugetlb_wp, after releasing the mutex and
before unmapping, so the window is large enough to reproduce it reliably.

 diff --git a/mm/hugetlb.c b/mm/hugetlb.c
 index fda6b748e985..5601a9cf819b 100644
 --- a/mm/hugetlb.c
 +++ b/mm/hugetlb.c
 @@ -38,6 +38,7 @@
  #include <linux/memory.h>
  #include <linux/mm_inline.h>
  #include <linux/padata.h>
 +#include <linux/delay.h>
  
  #include <asm/page.h>
  #include <asm/pgalloc.h>
 @@ -6261,6 +6262,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
  			hugetlb_vma_unlock_read(vma);
  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
  
 +			mdelay(8000);
 +
  			unmap_ref_private(mm, vma, old_folio, vmf->address);
  
  			mutex_lock(&hugetlb_fault_mutex_table[hash]);


Oscar Salvador (5):
  mm,hugetlb: change mechanism to detect a COW on private mapping
  mm,hugetlb: sort out folio locking in the faulting path
  mm,hugetlb: rename anon_rmap to new_anon_folio and make it boolean
  mm,hugetlb: drop obsolete comment about non-present pte and second
    faults
  mm,hugetlb: drop unlikelys from hugetlb_fault

 mm/hugetlb.c | 132 +++++++++++++++++++++++----------------------------
 1 file changed, 60 insertions(+), 72 deletions(-)

-- 
2.50.0

