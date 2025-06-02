Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20418C00B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862141; cv=none; b=lbfArEMuAF02yabGEdZ4lLQTT2F9ktaeHeYWfIUuR5JBztnOg0BQh2WKc3MULBlxCy6lTn2MAxwI1QVAuCNQiiDhR8g4swqrZrszPcgrpCzytUPqWpMqDM4NS71q4mxgQKE31C7MACx8YLuaC1QBIHBATo2cHIwmHXTWKS1N/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862141; c=relaxed/simple;
	bh=aXu9DhJ3a9/IrzXDE3FwIqjbSh8hj8O4jZzg1CZs72k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OeDqY5IGBaoBpeRy7pZ6c50FcPAQ2XTLZOIt2RubuImPJP5VHbHKQQnvMWZ9Ly8RlKC516s/J4qzNFFemSNm1tVB2OIAjvc7OSMknF2sDBLsXMQQER7icrAcGyWAXbCfQBikD4hnW+TbKxLMRYN6uSYd8tPuabSGpKME0IlIOEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jHPfQ470; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=46dOllc+; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jHPfQ470; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=46dOllc+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jHPfQ470";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="46dOllc+";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jHPfQ470";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="46dOllc+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD8B8219E2;
	Mon,  2 Jun 2025 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748862137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ttgg3X+ZBzZwcPRWhLO7lmL1TYNOpMVMH+F5r8W4p48=;
	b=jHPfQ470fgZ3y7Vyvbua8FZ3Lp61P+C6rgWOzH1+gbM1VfRpwly7xudCxkMGhJqekj4EF7
	vdtHhMVu5QdEZVxSQEZnQCMkF/QH4xqb543JIVLUklD6NP+SlWFYWlYdDvIe5DJ6bKly3g
	eh864Evmz4chMa5XYdX2yuAU7sF8Mbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748862137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ttgg3X+ZBzZwcPRWhLO7lmL1TYNOpMVMH+F5r8W4p48=;
	b=46dOllc+HCV3T+/ABiF1TSpySJ3nCmNXD6LP+YqVFGZIPblcGyPaZlylEt/rG2ck7IRT1e
	lvCIf3qOJG8VqRCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748862137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ttgg3X+ZBzZwcPRWhLO7lmL1TYNOpMVMH+F5r8W4p48=;
	b=jHPfQ470fgZ3y7Vyvbua8FZ3Lp61P+C6rgWOzH1+gbM1VfRpwly7xudCxkMGhJqekj4EF7
	vdtHhMVu5QdEZVxSQEZnQCMkF/QH4xqb543JIVLUklD6NP+SlWFYWlYdDvIe5DJ6bKly3g
	eh864Evmz4chMa5XYdX2yuAU7sF8Mbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748862137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ttgg3X+ZBzZwcPRWhLO7lmL1TYNOpMVMH+F5r8W4p48=;
	b=46dOllc+HCV3T+/ABiF1TSpySJ3nCmNXD6LP+YqVFGZIPblcGyPaZlylEt/rG2ck7IRT1e
	lvCIf3qOJG8VqRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A2A913A63;
	Mon,  2 Jun 2025 11:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ipxRJbmEPWggHAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 02 Jun 2025 11:02:17 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 0/2] frozen pages for large kmalloc
Date: Mon, 02 Jun 2025 13:02:11 +0200
Message-Id: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOEPWgC/42NTQ6CQAxGr2K6tgaqE39W3sOwKNCBiciQVolCu
 LsjJ3D5vnx5bwYTDWJw2cygMgYLsU9A2w1ULfeNYKgTA2XkMkdn9Bon6XHgRgx9VOxY0+v+4K6
 LFZb1oSZHJI5KSJJBxYf3GrgVidtgz6iftTfmv/Vv9ZhjhuWe2RGfPOfHq71MdtUExbIsXwEp7
 PnKAAAA
X-Change-ID: 20250529-frozen-pages-for-large-kmalloc-bd4d2522e52b
To: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

In [1] I have suggested we start warning for get_page() done on large
kmalloc pages as the first step to convert them to frozen pages.
We exposed to -next and indeed got such a warning [2]. But it turns out
the code is using sendpage_ok() and thus would avoid the get_page() if
the page was actually frozen.

So in this version, freeze the large kmalloc pages at the same time as
adding the warnings and refusals to get_page/put_page() on large kmalloc
pages, the same as we do for slab pages - in patch 2.

While doing that I've noticed that large kmalloc doesn't observe NUMA
policies, while the rest of the allocator does. This turns out to be a
regression from v6.1, so I'm restoring that first in patch 1. There is
no Cc: stable as it's not fixing a critical bug, but we can submit it to
e.g. latest LTSS afterwards.

Given the timing I would expose this to -next after the current merge
window closes, thus towards 6.17.

[1] https://lore.kernel.org/all/20250417074102.4543-2-vbabka@suse.cz/
[2] https://lore.kernel.org/all/202505221248.595a9117-lkp@intel.com/

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
Changes in v2:
- Reword commit log of patch 1 to acknowledge it's restoring pre-6.1
  behavior, add Fixes:
- Change the order of the two patches to allow possible backport of the
  NUMA fix.
- Link to v1: https://patch.msgid.link/20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz

---
Vlastimil Babka (2):
      mm, slab: restore NUMA policy support for large kmalloc
      mm, slab: use frozen pages for large kmalloc

 include/linux/mm.h | 4 +++-
 mm/slub.c          | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250529-frozen-pages-for-large-kmalloc-bd4d2522e52b

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

