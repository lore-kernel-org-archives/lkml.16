Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2141C861D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241192; cv=none; b=mRliBulT96arqruc2gn37T34PJK1UDcKDuz9HSBugh+X3mGAmoyH82lp7VoRXLGLNwPg9LFfLWWYmVqtMUPoE/xpDGjIqDGKSHCVBwqp32mwwxuT8CgfhSuQGNYWye3zcn80VoH2pFOcgt2k77qA2NW/DuYkuuv/6D+1aV1V5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241192; c=relaxed/simple;
	bh=ayVSqc5ywn2ZtRkLM9Yp8Awc2DewpQG8vZ/hMWsB+X0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FKvFFdK/lcoAEsxe4b8dkL475iLKwDK8YyOhjLX3gmP+uT9COmc7av9E97yCTok2B2Mm+rsVCkL0HuIoDKmK77VVGDgGE8p7BzK2RyVexLJ3czXEW9v94/ofTk/FDTAWlFSwo8BlgKqhl/7CfG/4WbZAJMUttV2ZkKPS1NkEcjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=CkVCcY2l; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=CkVCcY2l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="CkVCcY2l";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="CkVCcY2l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22E3F1FD8F;
	Mon, 26 May 2025 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748241188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zGNZ+JLXDJRRpx6LE3gwjhIvbIY7oVcOX1mEu7WDYc8=;
	b=CkVCcY2l9LFAwNUuVz2jbCyutW0gPIWROrOY4Y1ZfJqlmAHoNX1ehAuTKDmSOrpfiA3k3d
	3FIrTPceGsxN2/sDiBg1CKYYGcWkr7fH4Fn97ewGsYn9qW5JMB8bDu1WPjClHRZtxbAatn
	g1pOZI4Ru9AmBjP0Uin7St2fGPOM/+w=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748241188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zGNZ+JLXDJRRpx6LE3gwjhIvbIY7oVcOX1mEu7WDYc8=;
	b=CkVCcY2l9LFAwNUuVz2jbCyutW0gPIWROrOY4Y1ZfJqlmAHoNX1ehAuTKDmSOrpfiA3k3d
	3FIrTPceGsxN2/sDiBg1CKYYGcWkr7fH4Fn97ewGsYn9qW5JMB8bDu1WPjClHRZtxbAatn
	g1pOZI4Ru9AmBjP0Uin7St2fGPOM/+w=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA65413964;
	Mon, 26 May 2025 06:33:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X3I1NyMLNGgrJAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 May 2025 06:33:07 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.16-rc1
Date: Mon, 26 May 2025 08:33:07 +0200
Message-ID: <20250526063307.10920-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.16-rc1-tag

xen: branch for v6.16-rc1

It contains the following patches:

- A fix for running as a Xen dom0 on the iMX8QXP Arm platform.

- An update of the xen.config adding XEN_UNPOPULATED_ALLOC for better
  support of PVH dom0.

- A fix of the Xen balloon driver when running without
  CONFIG_XEN_UNPOPULATED_ALLOC.

- A fix of the dm_op Xen hypercall on Arm needed to pass user space
  buffers to the hypervisor in certain configurations.


Thanks.

Juergen

 arch/arm64/xen/hypercall.S | 21 ++++++++++++++++++++-
 drivers/xen/balloon.c      | 13 ++++++++-----
 drivers/xen/swiotlb-xen.c  |  1 +
 kernel/configs/xen.config  |  3 +++
 4 files changed, 32 insertions(+), 6 deletions(-)

John Ernberg (1):
      xen: swiotlb: Wire up map_resource callback

Roger Pau Monne (2):
      xen: enable XEN_UNPOPULATED_ALLOC as part of xen.config
      xen/x86: fix initial memory balloon target

Stefano Stabellini (1):
      xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
