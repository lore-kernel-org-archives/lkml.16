Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122D51474CC
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509012; cv=none; b=P0MwrwixxeGxO/6oQhf7cQJ2z870TX09rIJm4z2YDbFM0w8IDcQWK9sk2lb0Bf8VWZ2u2Zs4kUEdUbLt+W8xJrSqhQayLFyeZb5WWl3fwpX7bmhR/q79//b2BFB/wKQm1MlXHSTHsMCVoETt5x02lLzbAYnRcMQN5bUVddkucZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509012; c=relaxed/simple;
	bh=RTaMUO/SDi0gXOv8r2MXWYFXh9uZE+gxGdeQbV5B08w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A9btrT2chW31LRzCsWIdZAX9jC5QZ2UBWP4RyxDurJtN3fS3Ql65i8hfQpGMS6leMJ1r+oaqmtPA1BTnEKpCTuN+oM0XYKhOE8y/38XWwEWbJeiT8QZJGiPbEpCsBeV49DL0lrgi/s23s6gdvZCpOy/6t846xQ4EMJpI5GG8zUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=I4iXP4LR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=loZSpXCO; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=I4iXP4LR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=loZSpXCO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="I4iXP4LR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="loZSpXCO";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="I4iXP4LR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="loZSpXCO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 092211F821;
	Thu, 29 May 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748509009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kMpLXvOhoEvu3hwjtonRdkF3xiLD/Fr+iqxw9nREdWU=;
	b=I4iXP4LRVFfNRHaYr1XsYVaIB0zb+RWnl16kWBsxRyiQJytz00GsJVpUNC8Q0zSMoXx3YU
	JKyE1vjjoIeHLvoEyvKdVxiJZF8AwQtd5OEaACtuOTShVMfkv1uZY1OEV2+EGH/9isgmIa
	PiHX8LzO3h4AVHRMx0H0USmMm/U90tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748509009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kMpLXvOhoEvu3hwjtonRdkF3xiLD/Fr+iqxw9nREdWU=;
	b=loZSpXCOchkAxib5cAG8c8sEzMrZOiKaAHLSM1GB3KTVljPmI6KKqL4JCEEocTHVC/vcPY
	WfmbN+1tosi+NwAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=I4iXP4LR;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=loZSpXCO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748509009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kMpLXvOhoEvu3hwjtonRdkF3xiLD/Fr+iqxw9nREdWU=;
	b=I4iXP4LRVFfNRHaYr1XsYVaIB0zb+RWnl16kWBsxRyiQJytz00GsJVpUNC8Q0zSMoXx3YU
	JKyE1vjjoIeHLvoEyvKdVxiJZF8AwQtd5OEaACtuOTShVMfkv1uZY1OEV2+EGH/9isgmIa
	PiHX8LzO3h4AVHRMx0H0USmMm/U90tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748509009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kMpLXvOhoEvu3hwjtonRdkF3xiLD/Fr+iqxw9nREdWU=;
	b=loZSpXCOchkAxib5cAG8c8sEzMrZOiKaAHLSM1GB3KTVljPmI6KKqL4JCEEocTHVC/vcPY
	WfmbN+1tosi+NwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA5AF136E0;
	Thu, 29 May 2025 08:56:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5U2gOFAhOGj5aQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 29 May 2025 08:56:48 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 0/2] frozen pages for large kmalloc
Date: Thu, 29 May 2025 10:56:25 +0200
Message-Id: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADkhOGgC/x2NQQqDMBAAvyJ7diFdzKF+RXqIZpMuxkQ2IKL49
 4YeB4aZGyqrcIWxu0H5kColN3j1HSxflyOj+MZAhqyx9Mag5eKMu4tcMRTF5LRZ6+ZSKgvOfvB
 kidjSDC2yKwc5/4Pp8zw/Bn3zqnAAAAA=
X-Change-ID: 20250529-frozen-pages-for-large-kmalloc-bd4d2522e52b
To: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=RTaMUO/SDi0gXOv8r2MXWYFXh9uZE+gxGdeQbV5B08w=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBoOCFGiNyHIFU4wCipv8pbSPLwGtKDxqHKlvXRA
 DDFJiggiPSJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCaDghRgAKCRC74LB10kWI
 mmK9B/9sBj3N6s6Wou8EB2Mq52U/qMmmlGMqU+db8jjnpKC56wnCd9uuLawkHfFI8fPcG947f3r
 btL+KTeX98xtf1GfHDPzetrCLjFtoWTuxga/C04lZvKc5IVUU3FnnM+V52PBjfLPAuNP1yTytqi
 o4Abu11V1ddy3NHxAAy3PgoA7Gw0QNSCGhoES+JippvdK0yARsP2fJVXQhpzJyd5Em4uXJN/K+I
 yxnxZLduU2vcow2dXakN7vXQerEd9eeefYok8r1h51Pg9UezbeRS9uAe8gfPkcBMq7w8oEzfCxj
 9tN08mCqlwQPakzjvw2vpIhxRxMBvQgcg7Flyn+sgtZSxXIQ
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 092211F821
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

In [1] I have suggested we start warning for get_page() done on large
kmalloc pages as the first step to convert them to frozen pages.
We exposed to -next and indeed got such a warning [2]. But it turns out
the code is using sendpage_ok() and thus would avoid the get_page() if
the page was actually frozen.

So in this version, freeze the large kmalloc pages at the same time as
adding the warnings and refusals to get_page/put_page() on large kmalloc
pages, the same as we do for slab pages - in patch 1.

While doing that I've noticed that large kmalloc doesn't observe numa
policies, while the rest of the allocator does. So I've done that in
patch 2 as I assume Christopher would welcome this change.

Given the timing I would expose this to -next after the current merge
window closes, thus towards 6.17.

[1] https://lore.kernel.org/all/20250417074102.4543-2-vbabka@suse.cz/
[2] https://lore.kernel.org/all/202505221248.595a9117-lkp@intel.com/

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
Vlastimil Babka (2):
      mm, slab: use frozen pages for large kmalloc
      mm, slab: support NUMA policy for large kmalloc

 include/linux/mm.h | 4 +++-
 mm/slub.c          | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250529-frozen-pages-for-large-kmalloc-bd4d2522e52b

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

