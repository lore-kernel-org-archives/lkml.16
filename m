Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037020C46A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276038; cv=none; b=r2rzR3/9IVZGMpB5UoDhgRQT91RTz1FPzsIZbrlJP0E/To7c90mSrBN6TYpK36nRoashbmOO+4Gqjowb25VZ3tShLekaMhhLXXokRWnPzEsjZtdrcNgQ1T+elULJAYZPGTal+uzIIcY5lIQivlqw2ZvCVxFTPKY0dDPwkkXKloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276038; c=relaxed/simple;
	bh=Qyy8NtdK4v51s6DQsvyV7vh8W7trK4iXBzq/oAZ4nQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5Vzp1zJg3UAvjFHcQ2/LMSz8VsY9q52J5SZx+6wLi8JinXieKSyJ/naTH7K5l3Ce1IC7AP5Z3NnZeFlmYHgHWEmTWw/wwJRDJDyf69i3fKhrGErAT8W7+MiDVWgc/XwKsEWoatryss2Ze1IKRh3sMCdf61E3i+77y4jEesFwDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=rnfbOnJA; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=rnfbOnJA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rnfbOnJA";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rnfbOnJA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D22341F385;
	Thu, 10 Apr 2025 09:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744276033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RG7oQRjFPo5SBEne+qF+QsXhTklGTjoy3A92M4wO+nQ=;
	b=rnfbOnJAt0PWbB5EB4jloFMZnFTr7l30kkKUkNt0cDMO5PpMw02A0mZ4htztTfQ1jL/jIj
	YcCoJFc4SQzSD2DuRALbHQVoU6VZby1tMujaB/jNB4GUXN4+4aRIVSHLPr4fCH1MAIbklL
	QAFFLq93Z62Wv3HQbYikYytZceRLtck=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744276033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RG7oQRjFPo5SBEne+qF+QsXhTklGTjoy3A92M4wO+nQ=;
	b=rnfbOnJAt0PWbB5EB4jloFMZnFTr7l30kkKUkNt0cDMO5PpMw02A0mZ4htztTfQ1jL/jIj
	YcCoJFc4SQzSD2DuRALbHQVoU6VZby1tMujaB/jNB4GUXN4+4aRIVSHLPr4fCH1MAIbklL
	QAFFLq93Z62Wv3HQbYikYytZceRLtck=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1A8813886;
	Thu, 10 Apr 2025 09:07:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lkqyJUGK92fsEwAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 10 Apr 2025 09:07:13 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.15-rc2
Date: Thu, 10 Apr 2025 11:07:13 +0200
Message-ID: <20250410090713.30027-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc2-tag

xen: branch for v6.15-rc2

It contains the following patches:

- A simple fix adding the module description of the Xenbus frontend
  module.

- A fix correcting the xen-acpi-processor Kconfig dependency for PVH
  Dom0 support.

- A fix for the Xen balloon driver when running as Xen Dom0 in PVH mode.

- A fix for PVH Dom0 in order to avoid problems with CPU idle and
  frequency drivers conflicting with Xen.


Thanks.

Juergen

 arch/x86/xen/enlighten.c                   | 10 +++++++++
 arch/x86/xen/enlighten_pvh.c               | 19 ++++++++++++++++-
 arch/x86/xen/setup.c                       |  3 ---
 drivers/xen/Kconfig                        |  2 +-
 drivers/xen/balloon.c                      | 34 +++++++++++++++++++++---------
 drivers/xen/xenbus/xenbus_probe_frontend.c |  1 +
 6 files changed, 54 insertions(+), 15 deletions(-)

Arnd Bergmann (1):
      xenbus: add module description

Jason Andryuk (1):
      xen: Change xen-acpi-processor dom0 dependency

Roger Pau Monne (2):
      x86/xen: fix balloon target initialization for PVH dom0
      x86/xen: disable CPU idle and frequency drivers for PVH dom0
