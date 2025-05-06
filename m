Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312942798E2
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529822; cv=none; b=MClxAOutqJzRSXvUy4t3O9dp5pg5C5Pl3bsv6ZKotR0LwW8xdNy2OuyWZ+Cev9UaCa5yMQadzBdkDLXYC18ADjNcZXDSy6MRE4J6VML4bUsrb3dJOu9wuKRS6yxNPk/cu2N+GcBX1DA6CHRgf6Wdv7YosxyE+XbMm1qsk6wH/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529822; c=relaxed/simple;
	bh=bawPeiGueVygdF+UjIqXDx51tMwINWJ+XBKxVBfAwnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtNnF+JkragdnFEaeYYQIzzE/euRgO6Vg2KLWGXXAY+MmXI8ikiDLFWUX9Rzqoz8DQnmjTwoRjbtdMa5BX2EZapPtvQWCPlpcKUc8qQh0H6FCdOWGuqLrNL1EB9cK+iduTlCehSX2EfUdARKmiM3XiFS7JriBBJJ807Zmey++yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=afpr1Knf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w9XAgfqv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=afpr1Knf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w9XAgfqv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="afpr1Knf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w9XAgfqv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="afpr1Knf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w9XAgfqv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 580C52127D;
	Tue,  6 May 2025 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746529819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fYurfhc48VADEGWgwQ5Z9C+7rkAg/ZDRblsOEw7eTrA=;
	b=afpr1KnfsO8qSwWlO73XEaU7AbHDj6d4cvlkOScMxEy6WHKRDResKvLxK7VHVWVo/C1uBD
	gQdmLVq/j1GzxigNnu/i5uNgy6gyfCHFU4hyI3KbiTQ51WwTznne5EK6yMqLmbniNaQBmR
	H+7yBTc1IupEqPrCLlBEufkcfxvqjEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746529819;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fYurfhc48VADEGWgwQ5Z9C+7rkAg/ZDRblsOEw7eTrA=;
	b=w9XAgfqvjuTJWuwYgiqog2zYg1XeBKRkwF9txObq/W33vh3xNf4busfvIVLkmGyqpX1bLJ
	gHhO/R0TzM1Nc7BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746529819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fYurfhc48VADEGWgwQ5Z9C+7rkAg/ZDRblsOEw7eTrA=;
	b=afpr1KnfsO8qSwWlO73XEaU7AbHDj6d4cvlkOScMxEy6WHKRDResKvLxK7VHVWVo/C1uBD
	gQdmLVq/j1GzxigNnu/i5uNgy6gyfCHFU4hyI3KbiTQ51WwTznne5EK6yMqLmbniNaQBmR
	H+7yBTc1IupEqPrCLlBEufkcfxvqjEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746529819;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fYurfhc48VADEGWgwQ5Z9C+7rkAg/ZDRblsOEw7eTrA=;
	b=w9XAgfqvjuTJWuwYgiqog2zYg1XeBKRkwF9txObq/W33vh3xNf4busfvIVLkmGyqpX1bLJ
	gHhO/R0TzM1Nc7BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF7BB137CF;
	Tue,  6 May 2025 11:10:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rlbdNxruGWjvEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 06 May 2025 11:10:18 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] mm,mm_init: Mark set_high_memory as _init
Date: Tue,  6 May 2025 13:10:12 +0200
Message-ID: <20250506111012.108743-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

set_high_memory() touches arch_zone_lowest_possible_pfn which is
marked as _initdata, which creates a section mismatch.
Since the only user of the function is free_area_init() which is also marked
as _init, mark set_high_memory() as _init as well.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 80a5370ac6ab..5efec0399e18 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1785,7 +1785,7 @@ static bool arch_has_descending_max_zone_pfns(void)
 	return IS_ENABLED(CONFIG_ARC) && !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
 }
 
-static void set_high_memory(void)
+static void __init set_high_memory(void)
 {
 	phys_addr_t highmem = memblock_end_of_DRAM();
 
-- 
2.49.0

