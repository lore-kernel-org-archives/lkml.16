Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E953C200BA9;
	Mon,  3 Feb 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581236; cv=none; b=qq1JtWiT6gnMoVqGPSs4wBHDCzk+IwGWg17rNr/XcXDZ9k2l63jAmrFM2rFFB0EMe52XMnR42E7MDdK+40le1OfZUfOh/hZKxejce8qlQfb742d0eiEwsTJDgxaRll/bjAoMzvRzWW273KpqYZqlcDNxPEL9XPMWVBgztJEZePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581236; c=relaxed/simple;
	bh=MbfcwHZh5GliKXIbvOogGlzNDxUqYzHRQ5MH/DbYS04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NA1cS5fW3+oV3tXVct2W0nF4FOC64boo975AIGoBWXvLRXp01wjBVEohn1hOXnUOMAEtHB7TRd1bsUHW0zzbs0BKe9ZAVZ30y2l7yClvW88RU8I54U/YltNMdoX1J2HXNZCOJRseSOgmWIoNpaocRF+0RXPpNsWiTDID6KFniwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=NDl1TP2X; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Mc5xi5EC; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SeAkC7gH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2dyvGCWZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NDl1TP2X";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Mc5xi5EC";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SeAkC7gH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2dyvGCWZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C58CB21163;
	Mon,  3 Feb 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738581228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2RYvZOtPHSbL30JwR7N+DIaUDvNLLe80DNsz8td3/8=;
	b=NDl1TP2XN8eggPf9qIQAasgZm4/UCKx9a0Syl5zjFCkMbzeXkhCLZl/eg81ArUnyBXHWfL
	xkHffcmm/LruCdHP+QLXTq1LzrCj9BGbCEIzvK2p7IhT6goDt7B0Jd4sxEmX+GkPL94U/n
	8yNu9y76BY0JEMlTuTOZ1PciSzDq6pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738581228;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2RYvZOtPHSbL30JwR7N+DIaUDvNLLe80DNsz8td3/8=;
	b=Mc5xi5ECaohMjpljZmKTWjx0cf1lkvEeizeBn18kY+jlFuliDm0+xIhr5jnshfLYLcEBH2
	/5X6N3ZJzmIAc5DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=SeAkC7gH;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2dyvGCWZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738581224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2RYvZOtPHSbL30JwR7N+DIaUDvNLLe80DNsz8td3/8=;
	b=SeAkC7gH0qpsDqH6o5AmPEPVgsVKBk7DzNsVghAO4dAk3JF3npah2ulpkLqIdIzX6XzY93
	UCTtxv6F5bmnwQuAFChvQQYRB6fwFGWZNjSMC1TBeVl0k9QcGFQS6Oobp9E9WuwywvnMuu
	TF763ePbGaBu90rHF40u3+np1p1DpM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738581224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2RYvZOtPHSbL30JwR7N+DIaUDvNLLe80DNsz8td3/8=;
	b=2dyvGCWZz3LKCgIwbBXhRY+C05g5LJHvIsWk90s57feDOIlZbd2Y5iyriSD7xqAx0GvY+c
	aQicyLM1jOI3rNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B276313A78;
	Mon,  3 Feb 2025 11:13:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3t04K+ikoGdNAwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 03 Feb 2025 11:13:44 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 0/2] get_maintainer: report subsystem status separately
 from maintainer role
Date: Mon, 03 Feb 2025 12:13:15 +0100
Message-Id: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMukoGcC/32NQQ7CIBBFr9LMWsxAadK48h6mMS0M7SykBihRG
 +4u9gAu/uL95L+/Q6TAFOHS7BAoc+TVV1CnBswy+pkE28qgUHUopRaTFjOl+2Nkn2ooCGPatus
 n6qVBqLtnIMevw3kbKi8c0xrex0WWv/afLUuBgozT6NBiq+w1bpHO5gNDKeULnmRsu7AAAAA=
X-Change-ID: 20250114-b4-get_maintainer-cc3358be81c0
To: Joe Perches <joe@perches.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2901; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=MbfcwHZh5GliKXIbvOogGlzNDxUqYzHRQ5MH/DbYS04=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBnoKTeSafLSNhsm7ZJ84dTAsNt6q2BTLb/FF3S/
 t/il7xwrSeJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCZ6Ck3gAKCRC74LB10kWI
 mo7dB/0e3T+HHclQB2WL6PPQ/QIWccpFOHstjK12h6dkPidF46uceqaXHBr57+8CzQ9p1mViihY
 oDjGnvVgMFG+C5TdJLMcNnn+9OxvgTDuRMS5EtoUgHXIQtFGijI8CK56P7zGV6sraUBwC/ae3XO
 sK/dPzjoyaITYQpI9DdPBt2RoAjuiBtwaZmq1kK5/UqkqbHqQ1Ck6CMhgiwleOfHPgsFKggRF2z
 VmHB2Hm8JvdCkjoAE+QlzKZYKvoY/iFc4o/Qa/k9JBTYcqjxlcfooBtnv3c/w1rAr2XSC8RfwaD
 UQ325v0EDlFgOxDaYdiQ6cTYPGgB9jYzYKyEbdJmVkqzEqCx
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Rspamd-Queue-Id: C58CB21163
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim,suse.cz:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

The subsystem status (S: field) can inform a patch submitter if the
subsystem is well maintained or e.g. maintainers are missing. In
get_maintainer, it is currently reported with --role(stats) by adjusting
the maintainer role for any status different from Maintained.  This has
two downsides:

- if a subsystem has only reviewers or mailing lists and no maintainers,
  the status is not reported. For example Orphan subsystems typically
  have no maintainers so there's nobody to report as orphan minder.

- the Supported status means that someone is paid for maintaining, but
  it is reported as "supporter" for all the maintainers, which can be
  incorrect (only some of them may be paid). People (including myself)
  have been also confused about what "supporter" means.

The second point has been brought up in 2022 and the discussion in the
end resulted in adjusting documentation only [1]. I however agree with
Ted's points that it's misleading to take the subsystem status and apply
it to all maintainers [2].

The attempt to modify get_maintainer output was retracted after Joe
objected that the status becomes not reported at all [3]. This series
addresses that concern by reporting the status (unless it's the most
common Maintained one) on separate lines that follow the reported
emails, using a new --substatus parameter. Care is taken to reduce the
noise to minimum by not reporting the most common Maintained status, by
detault require no opt-in that would need the users to discover the new
parameter, and at the same time not to break existing git --cc-cmd
usage.

The advantage of these changes is that subsystem status is now reported
also for subsystems with no maintainers, and maintainers are reported as
maintainers.

Changes since v1 [4]
- Change the approach to report subsystem status on separate lines via
  the new (effectively enabled by default) --substatus option. The
  "SUBSYSTEM [status]" output felt more and more clumsy.
- Drop R-b from Kees due to the major change of approach.

[1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/
[2] https://lore.kernel.org/all/Yzen4X1Na0MKXHs9@mit.edu/
[3] https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/
[4] https://lore.kernel.org/r/20250114-b4-get_maintainer-v1-0-ecf40f0d032d@suse.cz

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
Vlastimil Babka (2):
      get_maintainer: add --substatus for reporting subsystem status
      get_maintainer: stop reporting subsystem status as maintainer role

 scripts/get_maintainer.pl | 49 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 18 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250114-b4-get_maintainer-cc3358be81c0

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

