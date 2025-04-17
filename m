Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA6253924
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901915; cv=none; b=AQv4pf1S6L9v9AwBqyN1d3+jKfIjIJLRGO83CefC5+j2rT96OqkOeKHoYnOFNvUn5iEy4orRYP2wLpYQewkSG/Rq687atY0a0alruTOjx0i1sRYoHCyfOJ5VLXeLcWQ34qMCMLVHE2rmrvrlIU148PaiWsVF+TtBVYu3zNGYJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901915; c=relaxed/simple;
	bh=ixQpBNA8/xD+PbjaIvSdNugNfy8R7K/5jtuujv4uW7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iciUvJSHD753wNObSQlDiSRwzx9ITHFbLF7Rw0nV/OxQUuGDbiZ2nwSLnyBCz2fYUN44s4R/TC7tPJdQua70XZ3s82yOf8YX5v2p1Jwg8Mdf3kRzfcymZ5r7nWrlkHlDCZ9503RfYBX7xXqTRY+d+F77mKcodhEIe9IqX0SY0Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=GWh6rACR; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=GWh6rACR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GWh6rACR";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GWh6rACR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1CA021188;
	Thu, 17 Apr 2025 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744901911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=h1el0skekZwg5xloLGSlBGc/UyrasVW1Uyj84eqJx/c=;
	b=GWh6rACRa6vHTP1bcMV3743eoPLcXqc4OpUuu2V49493emDe+z6sxFsMnB8hQ0k9nGk0qm
	GnPnodgL+uorLbj55TDXgOXVCvckeALR0AObsLS0MxnD7wr42Hn6N6Yq+6Y9DVYODrYcNm
	ObKzuosXsAk2Ur9sHEdmPa45q53KSBQ=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=GWh6rACR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744901911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=h1el0skekZwg5xloLGSlBGc/UyrasVW1Uyj84eqJx/c=;
	b=GWh6rACRa6vHTP1bcMV3743eoPLcXqc4OpUuu2V49493emDe+z6sxFsMnB8hQ0k9nGk0qm
	GnPnodgL+uorLbj55TDXgOXVCvckeALR0AObsLS0MxnD7wr42Hn6N6Yq+6Y9DVYODrYcNm
	ObKzuosXsAk2Ur9sHEdmPa45q53KSBQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CA1F137CF;
	Thu, 17 Apr 2025 14:58:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ljGIBcXAWgVXQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 17 Apr 2025 14:58:31 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.15-rc3
Date: Thu, 17 Apr 2025 16:58:31 +0200
Message-ID: <20250417145831.23359-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C1CA021188
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc3-tag

xen: branch for v6.15-rc3

It contains just a single fix for the Xen multicall driver avoiding
a percpu variable referencing initdata by its initializer.


Thanks.

Juergen

 arch/x86/xen/multicalls.c | 26 ++++++++++++++------------
 arch/x86/xen/smp_pv.c     |  1 -
 arch/x86/xen/xen-ops.h    |  3 ---
 3 files changed, 14 insertions(+), 16 deletions(-)

Juergen Gross (1):
      xen: fix multicall debug feature
