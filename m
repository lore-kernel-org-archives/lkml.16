Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F852E8DF8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186772; cv=none; b=YSu++yPHQp0CXdsxi6M7UJIsG3OeVBdqnoJzh4dPw4A2CEjwjpl/iyLBsEauJNBqosywTJkre5l/a1h7/DH9ctpRc7G94Hap6hflezJe7muykhlXntL/rFhEvpHse9+0g2MVzFQSP8w0XkHt+CdRYVqTjgmDFAI6MjqXAirG9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186772; c=relaxed/simple;
	bh=U3ayUYRI/XqziYJwKcGciSby3zkLzNIaZu6c4nGTAvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NVraFLoOyUj6FLLUhXLMaWjQznu/XLKxm3e81tTBY8mY6Wh5ubme0w4AEvhGGFAbduvwWcwo2artJkolnkUlo4lb/lKoVqfqskVU8OCgFOybFHn2yBECmoHm9FpT4ygjMBaN5A5giDds9C45+uoM4VBd1HIP39g+arGGQFkcd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MhAuHB9W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UvNiYrDr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MhAuHB9W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UvNiYrDr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MhAuHB9W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UvNiYrDr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MhAuHB9W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UvNiYrDr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEA8E2117D;
	Tue, 17 Jun 2025 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750186768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s2DcY+3ElvudpXdu4BW5HsI2aORUKKqcxXQr4q5ErC0=;
	b=MhAuHB9WehxUvWxKmUXAMdcIcntLXXmuryojuTqxu0ayokyBrRhy3Ek/avwl4Otxg8q+k/
	eUQh3B3FPtoxcTXD5BvmPRS5qDfcwVc6mS3MAJfqN4i9qS/nzuW6sUZ9UPjmJoI3OI+2aj
	NAH9cOME8ONSvurARORLXk7xj19DEsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750186768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s2DcY+3ElvudpXdu4BW5HsI2aORUKKqcxXQr4q5ErC0=;
	b=UvNiYrDrWrdrBLYiSKv+qzEFBEhyP+aovbGhyC1eUK7IRo42/f3O9FVWLQRvI+oeKFjvfW
	H1wjETFCnOKgMHAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MhAuHB9W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UvNiYrDr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750186768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s2DcY+3ElvudpXdu4BW5HsI2aORUKKqcxXQr4q5ErC0=;
	b=MhAuHB9WehxUvWxKmUXAMdcIcntLXXmuryojuTqxu0ayokyBrRhy3Ek/avwl4Otxg8q+k/
	eUQh3B3FPtoxcTXD5BvmPRS5qDfcwVc6mS3MAJfqN4i9qS/nzuW6sUZ9UPjmJoI3OI+2aj
	NAH9cOME8ONSvurARORLXk7xj19DEsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750186768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s2DcY+3ElvudpXdu4BW5HsI2aORUKKqcxXQr4q5ErC0=;
	b=UvNiYrDrWrdrBLYiSKv+qzEFBEhyP+aovbGhyC1eUK7IRo42/f3O9FVWLQRvI+oeKFjvfW
	H1wjETFCnOKgMHAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30A6D139E2;
	Tue, 17 Jun 2025 18:59:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RFcuCRC7UWhEOQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 17 Jun 2025 18:59:28 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Peter Xu <peterx@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] MAINTAINERS: Update maintainers for HugeTLB
Date: Tue, 17 Jun 2025 20:59:10 +0200
Message-ID: <20250617185910.471406-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AEA8E2117D
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.de:mid,suse.de:dkim,suse.de:email,kvack.org:email]
X-Spam-Score: -3.01
X-Spam-Level: 

Change my role to Maintainer as I am quite involved in HugeTLB development,
and will be more so with the upcoming HugetLB-pagewalk unification, so I
would like to help Munchun take care of the code.
Besides, having two people will help in offloading some pressure.

Also add David as a Reviewer since he has quite some knowledge in the field
and has already provided valuable feedback.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
I also asked Peter Xu to become a R, but I think he is currently too busy to
commit to that, but he was happy to be CCed instead :-).
I already talked to Munchun and he agreed.
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4243612aa7ee..7b274ce8a872 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10975,7 +10975,8 @@ F:	include/linux/platform_data/huawei-gaokun-ec.h
 
 HUGETLB SUBSYSTEM
 M:	Muchun Song <muchun.song@linux.dev>
-R:	Oscar Salvador <osalvador@suse.de>
+M:	Oscar Salvador <osalvador@suse.de>
+R:	David Hildenbrand <david@redhat.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
-- 
2.49.0

