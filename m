Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069523716D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859456; cv=none; b=G2hWJ9POE69ejBYD0+ZWAMeLBL60uEw9CEYf1WojBT7iqAMDqf5C0uijRiD1+CZWnFIiz2e07RQ+GYaZHwehB1Fn2/IVukguVn83OgmBQyeTokmuMU7H9lNllh8wLyAIrKkja5eRK7ie/teRKijP0iRPgu5vndXgoKFseYjVR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859456; c=relaxed/simple;
	bh=MRSHQ0GIdBvKudls8AoPlZYq3x0vPmpj45cMrPo8ma8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pqLQuMa1GsnMypIjZBelzK/Erz/zuLG+vBEDn9sYyT6qKPEl5R6NdSV8sFu+EGAC/YR5+hT4fr34TJEKDoCwz+nY+wZu3nKSjuhgFB+LHYrB8OMlWUQuNw00Hi+P0bJa3sPbcAUduH+HIjCFia+MniNfPNgguowolHUziUqHz8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=W9GwiIOG; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=W9GwiIOG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="W9GwiIOG";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="W9GwiIOG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BD32D21172;
	Thu,  6 Feb 2025 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738859452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+xQfjhodhvkmJIe8Jd1TAjvvbdgFbNKCdHf/IiiXgA8=;
	b=W9GwiIOG2EXUCmEFSdb4ixuPabeIQ8zKLuf2Ar08QCHtu0q8xgOPY1Z2f1USd94/3cTfd6
	fdfxnPEjsq9zKpjrolDihuG3nYhOWfVZ/+R0MyGDnMAO5k1JmrRKxNXLz3VxxvD1dlusAJ
	zTDsZo4Jmo6lMPBIGCrgVYoDJ7o34BI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=W9GwiIOG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738859452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+xQfjhodhvkmJIe8Jd1TAjvvbdgFbNKCdHf/IiiXgA8=;
	b=W9GwiIOG2EXUCmEFSdb4ixuPabeIQ8zKLuf2Ar08QCHtu0q8xgOPY1Z2f1USd94/3cTfd6
	fdfxnPEjsq9zKpjrolDihuG3nYhOWfVZ/+R0MyGDnMAO5k1JmrRKxNXLz3VxxvD1dlusAJ
	zTDsZo4Jmo6lMPBIGCrgVYoDJ7o34BI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8257213697;
	Thu,  6 Feb 2025 16:30:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m7kvHrzjpGdYTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 06 Feb 2025 16:30:52 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.14-rc2
Date: Thu,  6 Feb 2025 17:30:52 +0100
Message-ID: <20250206163052.5240-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD32D21172
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc2-tag

xen: branch for v6.14-rc2

It contains 3 fixes of a single function, which was introduced in the
6.13 cycle.

Thanks.

Juergen

 arch/x86/xen/xen-head.S | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

Juergen Gross (3):
      x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
      x86/xen: add FRAME_END to xen_hypercall_hvm()
      x86/xen: remove unneeded dummy push from xen_hypercall_hvm()
