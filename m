Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F23D76
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187109; cv=none; b=G66q0MMj/Iai7JXZwLNUQKbuFKMiztIUW6SZ6Epun2u19UeoU5TThQXH85rEdqxZJt0ngyYQbc/2gSAU9nzfNZOAGJHXPQ8Y2AaInwOKPnEVBhR/+qXfXb0IK9NYHCaW7Iq9VG/5XVNCBGRhcYR69s+Hv82R70v70Wa/X1TK3A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187109; c=relaxed/simple;
	bh=//oS1YcihLm6+UDH4b/efcQo+DFpCSrps1srpVso6wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UIMEVOj3S07Zjv6uDv0UcDFHLZVMpUEspt6KoZGfyx+rTmc7L5P77PbhmlIWwoiH/6iH4yPZxwCEMFhEUKke5j0Oq5zPxV5mW3/o9F0zXgelD1E+cwEXhA9Hpq/0B8u6zs7IDp79mGl0ac/68ej3h5ZaRjScLzuEoH/6Ta1kwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nnhMnUyw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yMI3/CmL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nnhMnUyw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yMI3/CmL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nnhMnUyw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yMI3/CmL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nnhMnUyw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yMI3/CmL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F20E21168;
	Wed,  9 Apr 2025 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744187105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EbZZFyww48V6ig4dM/PI70UmVckszKfIjZnLFoz8yuY=;
	b=nnhMnUywwQIukhYbFuxUz0Ah7tJeCURfqT4lxEkMSqi7ssvZIq6TWRo/G6ppZBtySbj3MH
	ue3jvS6lAZf7whxxytlH9iT9S/6BI21XP001mohQQ55wmrp3A46DgjvFDb1DDSJ9ITCRVb
	jIElIH0OPcz72oKfKNhRQOq1kPeQmfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744187105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EbZZFyww48V6ig4dM/PI70UmVckszKfIjZnLFoz8yuY=;
	b=yMI3/CmLgB5+CvfwGQy1YQ5pN2byGOMdd4AVSThgZ+ycgHupe+bqhIiGxaklYVYDPX4VNg
	9ykHEkySZ9mYlhDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nnhMnUyw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="yMI3/CmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744187105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EbZZFyww48V6ig4dM/PI70UmVckszKfIjZnLFoz8yuY=;
	b=nnhMnUywwQIukhYbFuxUz0Ah7tJeCURfqT4lxEkMSqi7ssvZIq6TWRo/G6ppZBtySbj3MH
	ue3jvS6lAZf7whxxytlH9iT9S/6BI21XP001mohQQ55wmrp3A46DgjvFDb1DDSJ9ITCRVb
	jIElIH0OPcz72oKfKNhRQOq1kPeQmfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744187105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EbZZFyww48V6ig4dM/PI70UmVckszKfIjZnLFoz8yuY=;
	b=yMI3/CmLgB5+CvfwGQy1YQ5pN2byGOMdd4AVSThgZ+ycgHupe+bqhIiGxaklYVYDPX4VNg
	9ykHEkySZ9mYlhDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3AB6137AC;
	Wed,  9 Apr 2025 08:25:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v/0WJeAu9mcBXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 09 Apr 2025 08:25:04 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michal Hocko <mhocko@suse.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] MAINTAINERS: Update HUGETLB reviewers
Date: Wed,  9 Apr 2025 10:24:52 +0200
Message-ID: <20250409082452.269180-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3F20E21168
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

I have done quite some review on hugetlb code over the years, and some
work on it as well, the latest being the hugetlb pagewalk unification which
is a work in progress, and touches hugetlb code to great lengths.

HugeTLB does not have many reviewers, so I would like to help out by
offering myself as an official Reviewer.

Signed-of-by: Oscar Salvador <osalvador@suse.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 193d7e216d79..7b32498a42cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10963,6 +10963,7 @@ F:	include/linux/platform_data/huawei-gaokun-ec.h
 
 HUGETLB SUBSYSTEM
 M:	Muchun Song <muchun.song@linux.dev>
+R:	Oscar Salvador <osalvador@suse.de>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
-- 
2.49.0

