Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A01E25E8
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175780; cv=none; b=n/utMvwcm70XYforqApcqYuS76dj6qdknSk3NPks5+xI+6oDLVt8IQae7c+vvfQKXj9/tb4Fq9Y6gta33kxAjwVtGLwgld42QufNlTpZKeeU8TyvQIoufQUp7dOyTdSViappzwxUwQ1Yt36RUQ0Ac8UDiriegcVDXdAOoKeGRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175780; c=relaxed/simple;
	bh=R9E094H5IJZR8fd7fZEj5fU1dizLEqyQSX+ZMSaK6C0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=omJxrG1lxSS37zd/hXDJgFDqiLC31Jq/YA3rtfAylBwKyq6bAwHbjNJ47p4PQ7+7dGKSovQ81M2oHmrLptnAoJLum20qwvYjTIXBSOMzyOZwC9QWyzkXfwzY+wt9YL/P4JBoJ7YItednqX/84t3b6n9uH+SfQFKN0JY6OIVNUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UtbVQtLT; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UtbVQtLT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UtbVQtLT";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UtbVQtLT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B64371F365;
	Wed, 29 Jan 2025 18:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738175775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jnHLzl4ahT1f8TokqXt7gY58Me4tFxLyl6IKuli4OVE=;
	b=UtbVQtLTrevtYtFwCc6VmFUv5eg9YUi6HBqL490psORPdvQTtZjCfSVrP6alxs/oa0t2Ln
	ZM3x6FlNnCDwYkuiRtAw3IAFjeiucyIEvLJxxedixvzx+HDgmPt57ht3tgAgI21RckCo6+
	YUUuLhgkp6DxApdQ9AsrSy7318Dxa1s=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=UtbVQtLT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738175775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jnHLzl4ahT1f8TokqXt7gY58Me4tFxLyl6IKuli4OVE=;
	b=UtbVQtLTrevtYtFwCc6VmFUv5eg9YUi6HBqL490psORPdvQTtZjCfSVrP6alxs/oa0t2Ln
	ZM3x6FlNnCDwYkuiRtAw3IAFjeiucyIEvLJxxedixvzx+HDgmPt57ht3tgAgI21RckCo6+
	YUUuLhgkp6DxApdQ9AsrSy7318Dxa1s=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B4BA132FD;
	Wed, 29 Jan 2025 18:36:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R+gCGB91mmfSHQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 29 Jan 2025 18:36:15 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.14-rc1
Date: Wed, 29 Jan 2025 19:36:12 +0100
Message-ID: <20250129183614.2601-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B64371F365
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc1-tag

xen: branch for v6.14-rc1

It contains 3 minor fixes.


Thanks.

Juergen

 arch/x86/xen/mmu_pv.c       |  4 ++++
 drivers/xen/pcpu.c          |  2 +-
 drivers/xen/pvcalls-front.c | 14 ++++++++++++--
 drivers/xen/pvcalls-front.h |  2 +-
 4 files changed, 18 insertions(+), 4 deletions(-)

Maksym Planeta (1):
      Grab mm lock before grabbing pt lock

Sergio Miguéns Iglesias (1):
      xen: pcpu: remove unnecessary __ref annotation

Stefano Stabellini (1):
      xen: update pvcalls_front_accept prototype
