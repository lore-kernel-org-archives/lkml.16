Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4803A1ACEAF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879607; cv=none; b=ngQ5jJBJtxNmmQSr6ugerN+gTCNleLe4t9G4B/psbKbfxKuwrH+udeD+1mk5kqO9lS0XUe0zKTvNkCKMVnI+qr80zn2DYrlqsaRQ6F3KxrUpye1g8TaZcj1beYU6cdHg9t1+IJsCMotBNwx5TNYBDXXG2/rRzJvvGJ7htYW9Yx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879607; c=relaxed/simple;
	bh=16NSgGkpQH0l4dNk9e9Iw/yzEdxTwhCQ4AiTxwQdXY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIJglfVlAhmp2UaPA+/BB65W7aDFJLkIKiyZd/prm7j2nD6z0B5/Z6dhYi5B4OUs4vF7yyNxEWGfLBtcmFAKIVEQW31cIUTsWl074KphnYZPZxo+SdAqwH2m0Y4WoDuZfICWCxpvkZ3Ey36zjp/f8cYfgTNeDfkDfISipwHRXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=gQIsNrNS; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=gQIsNrNS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="gQIsNrNS";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="gQIsNrNS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66C28211F1;
	Mon,  2 Jun 2025 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748879602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ehwIH92WD/GQr/hAAVJqjZ9ryJ3HOAoI9i4lqiKaZ74=;
	b=gQIsNrNSs0zF52K0iumSYDCqXmeS+ZRjPhrV+FwWA9RnVFLUedI0oj31pDDdRzyCl5dv0p
	uEJFLQhzNC8CVNo5/+uxUrNH9T8zlO4VQSnq3JpI/QkUnKeUi2Kb6pVCw9PsKJjcTaIzBR
	XEYhhIUCnfJ6Gd5lgxVM1iPOITlP7PQ=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748879602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ehwIH92WD/GQr/hAAVJqjZ9ryJ3HOAoI9i4lqiKaZ74=;
	b=gQIsNrNSs0zF52K0iumSYDCqXmeS+ZRjPhrV+FwWA9RnVFLUedI0oj31pDDdRzyCl5dv0p
	uEJFLQhzNC8CVNo5/+uxUrNH9T8zlO4VQSnq3JpI/QkUnKeUi2Kb6pVCw9PsKJjcTaIzBR
	XEYhhIUCnfJ6Gd5lgxVM1iPOITlP7PQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4086213A63;
	Mon,  2 Jun 2025 15:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0v4bD/LIPWhIBQAAD6G6ig
	(envelope-from <neelx@suse.com>); Mon, 02 Jun 2025 15:53:22 +0000
From: Daniel Vacek <neelx@suse.com>
To: Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Vacek <neelx@suse.com>
Subject: [PATCH v3 0/2] btrfs: harden parsing of compress mount options
Date: Mon,  2 Jun 2025 17:53:17 +0200
Message-ID: <20250602155320.1854888-1-neelx@suse.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

This series hardens the compress mount option parsing. 

---
v3 changes: Split into two patches to ease backporting,
            no functional changes.

v2: Drop useless check for comma and split compress options
    into a separate helper function

Daniel Vacek (2):
  btrfs: factor out compress mount options parsing
  btrfs: harden parsing of compress mount options

 fs/btrfs/super.c | 112 ++++++++++++++++++++++++++++-------------------
 1 file changed, 66 insertions(+), 46 deletions(-)

-- 
2.47.2

