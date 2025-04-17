Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30615A55
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882689; cv=none; b=d1uQFqan0JwQUkHQTjt7Awnps6DQ+m3JtdXCoF5CBgfTh6mZGTv+JPqDf1Tu8Q06LLSI4ZztkZNmQQJCEoAF9iyvRB6O34zd9Yiw7Th/z9Cw3z5pQL34ouOVkJ02j/9yFHIdXXDAKzlhPYUzoVpqum2+JlYDw2clSLiztdzJKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882689; c=relaxed/simple;
	bh=GkzBasvTgY38/cF3ha2NE+bowg2QDwKg2T/grta1xGU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ni51tnxVf+gzlDm1Sel/VE1UsLCV2uZ02Wk32TmZr7clHRaXMUjJap6nf6VRf7VKayL4Sv5bvsNcEZuXsHuk80N7d1ZVd6aaTLC9yVfVBBMNQGBIdl//967rihl6xk2HSHg9Al6BvbqdXmXM6aPZtsSvCpff3hlwrsWlCsIF8zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=v8Ks3Q79; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZMukqPmR; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZpgUsPTE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aNY+yqtT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="v8Ks3Q79";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZMukqPmR";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZpgUsPTE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aNY+yqtT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2BB1121165;
	Thu, 17 Apr 2025 09:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744882686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkE4MpLnxcZnM5LXT3iBXJFM4c2I3RraTKjGur4DjrQ=;
	b=v8Ks3Q79wkxHSTacTTByzPjxzSQihkEGcuiCMHLEowGkn4C+D/VgM3A+OuQ/AIxjA0kF6f
	wTgCBuOJBclPHvvNgO7X+JRwSZaVnLbRMrPDILkbYtSP1rOnmEsEg2Fit9+/xNv6g0xPGY
	RrAl7OMfMcNKl78YyBql2l7DnzJMZlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744882686;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkE4MpLnxcZnM5LXT3iBXJFM4c2I3RraTKjGur4DjrQ=;
	b=ZMukqPmRRkHFfHop2823UFs+tBpcg/JESvPeUxAusKc/g6Dhe9inMD0DD5lYTDMeCn6iJP
	8opFDaoDux5EhgCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ZpgUsPTE;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=aNY+yqtT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744882685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkE4MpLnxcZnM5LXT3iBXJFM4c2I3RraTKjGur4DjrQ=;
	b=ZpgUsPTES1R/hhuBqz8eQsLl+XCklznnSjRr73Cmb69Jjc894vjlJYQYpxZ4D7/Lw33Pyt
	y2MQ93xhXj1TSQB5POwv5D1nO+ADzBZ1Alhu+qovpEXl2PAslHQgg2lxhm4oJMbAs+OfJ1
	KN8BHCWhI9BCr2UBe2hH/ESwbYKzbKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744882685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkE4MpLnxcZnM5LXT3iBXJFM4c2I3RraTKjGur4DjrQ=;
	b=aNY+yqtTlbWteX9tMon5en8VHlG9gT3upVw3OSAZ2yceg57zF/AaYyYyRpw4ajpcMgM5jG
	QF1+HM4RyeNAPqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1032E137CF;
	Thu, 17 Apr 2025 09:38:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SYeaA/3LAGj1eAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 17 Apr 2025 09:38:05 +0000
Message-ID: <fd2359ed-f87e-4ba1-a6e5-b4114db7e2bb@suse.cz>
Date: Thu, 17 Apr 2025 11:38:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [GIT PULL] slab fix for 6.15-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Suren Baghdasaryan <surenb@google.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2BB1121165
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linux.com,linux-foundation.org,kvack.org,vger.kernel.org,linux.dev,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi Linus,

please pull the latest slab fix from:

  git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.15-rc2

Thanks,
Vlastimil

======================================

- Stable fix adding zero initialization of slab->obj_ext to prevent crashes
  with allocation profiling (Suren Baghdasaryan) 

----------------------------------------------------------------
Suren Baghdasaryan (1):
      slab: ensure slab->obj_exts is clear in a newly allocated slab page

 mm/slub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)
