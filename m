Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E88D19F41C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745255804; cv=none; b=RraO673YiuD+ot1LyJlwFxeYIIIcrYKPlCHEGvDOzq8MXz55oZ6kVriAj5fqu5sq6ZyZhj9sq44+Nxq7j/o/HDyGzussNmmTrIkUvQADRMSNtAOjwj1OaOuC/wQjNITbA3LXT2t3aiAE4Ol2XvzVDRf2YNUOW8MB/o+cZMzYq/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745255804; c=relaxed/simple;
	bh=snlAzbl9cvQfLvpS33+wBGM9L/8iWNZMhpY4UQwnYQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cHbytxpFtaoy3HzuoFd8ndEzPI2sH0Jy+ECdv+GIGYBrGE3nKnWZ13zSETNeC16j/KqGLQ8dLJ6f6/deMimyMrW7yXQm/UXfr71hGwDpteL8egL5Ps+H7J2xYYf9LU43aepaA+Z1rnCkb3tuwrrOvU32jJkVAFl5R7E+j4c47+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GFK4C4dO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FgxNaedK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mgVAcMlP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A9iTiMQo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GFK4C4dO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FgxNaedK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mgVAcMlP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A9iTiMQo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED8D921232;
	Mon, 21 Apr 2025 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745255800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y23NAR76LYdmaA7SwNGEZzg9KK15eLbfbFxx8zGRNmo=;
	b=GFK4C4dO0aL+raQatk+zsfEujqBoza3pxSL0Af3zc/7ts3tF3TV/afguA1MTZqGhntdkEo
	gX+fPEuxiQUznULW1jsV1tOST8C0NgVkxMvg3DiFDR5gw9JPNPx6Ciy28VwGH6HCxJcbXD
	arlEfp+DKyM2iOozSGhctaylXiE7qng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745255800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y23NAR76LYdmaA7SwNGEZzg9KK15eLbfbFxx8zGRNmo=;
	b=FgxNaedKf6NbmlJnYpDMRkylzmwi/6JbTVbwoI/ZBXo7Kh0LAMUtj1yX6t3Qu9zlJ536Ss
	JeYOOXSIyWxuwjCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745255799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y23NAR76LYdmaA7SwNGEZzg9KK15eLbfbFxx8zGRNmo=;
	b=mgVAcMlP36P3lI++IEo4b52pbydOswHZXp9ORuywOACYKeFaJhYKOHeYqnLyomrd/Dk7yy
	oqRCwQmZ2AsaowG/R6sS7eRw5aLM8t1gKWyFR71rysZCCT+PaK0clRNs4tedv9U4XrTQv3
	mY+8Dv2J3Nhh3f1kaMsXH9/EtUSdV+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745255799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y23NAR76LYdmaA7SwNGEZzg9KK15eLbfbFxx8zGRNmo=;
	b=A9iTiMQom1Ug0IJXRuK30sCrMk++OKKAEyHcsP+ciez9WRFJno5v2A75d11d98GA2sZjBx
	VqGVlm3tHknHN7CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E4F9139D0;
	Mon, 21 Apr 2025 17:16:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ev3EH3d9BmiQaQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 21 Apr 2025 17:16:39 +0000
From: Pedro Falcato <pfalcato@suse.de>
Date: Mon, 21 Apr 2025 18:16:28 +0100
Subject: [PATCH] mm: workingset: Simplify lockdep check in update_node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-workingset-simplify-v1-1-de5c40051e0e@suse.de>
X-B4-Tracking: v=1; b=H4sIAGt9BmgC/x3MywqAIBBA0V+JWSeoFT1+JVpEjTVUFk70QPz3p
 OVZ3OuB0REyNIkHhxcx7TZCpQkMc28nFDRGg5a6kLlW4t7dQnZiPAXTdqxkXoFoskqqui+rAWJ
 5ODT0/Ne2C+EDAnJG+2UAAAA=
X-Change-ID: 20250421-workingset-simplify-eef38019a78c
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Pedro Falcato <pfalcato@suse.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745255799; l=1320;
 i=pfalcato@suse.de; s=20250421; h=from:subject:message-id;
 bh=snlAzbl9cvQfLvpS33+wBGM9L/8iWNZMhpY4UQwnYQ0=;
 b=UFCMiUg0z5tHElB/Ysb1zx+nz9K8T4URWlRbkxu4cqfbVclGZQhEUIVc1JcVxWowadG8Y6YM+
 Z5eBOn2AY1/Dc0Xa6HQivAXD221A21savKH5LZnN5AQDPYFlN6PHU7E
X-Developer-Key: i=pfalcato@suse.de; a=ed25519;
 pk=0R7Lzd6olZ38hoDAKHJC9ZdDsvtBo/kjCOfHfihr/FM=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

container_of(node->array, ..., i_pages) just to access i_pages again
is an incredibly roundabout way of accessing node->array itself.
Simplify it.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/workingset.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/workingset.c b/mm/workingset.c
index 4841ae8af41113797378846f08336cd7c5757bd5..6e7f4cb1b9a7807e9288955f180a5b6cffab1a40 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -612,7 +612,6 @@ struct list_lru shadow_nodes;
 
 void workingset_update_node(struct xa_node *node)
 {
-	struct address_space *mapping;
 	struct page *page = virt_to_page(node);
 
 	/*
@@ -623,8 +622,7 @@ void workingset_update_node(struct xa_node *node)
 	 * already where they should be. The list_empty() test is safe
 	 * as node->private_list is protected by the i_pages lock.
 	 */
-	mapping = container_of(node->array, struct address_space, i_pages);
-	lockdep_assert_held(&mapping->i_pages.xa_lock);
+	lockdep_assert_held(&node->array->xa_lock);
 
 	if (node->count && node->count == node->nr_values) {
 		if (list_empty(&node->private_list)) {

---
base-commit: 856ddd6c69a1a1935f32de8411550d997bcbe6f5
change-id: 20250421-workingset-simplify-eef38019a78c

Best regards,
-- 
Pedro Falcato <pfalcato@suse.de>

