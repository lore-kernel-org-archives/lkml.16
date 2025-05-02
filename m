Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474041E98EA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169556; cv=none; b=V7kSBd0pa6Ta7UhVLoCS7eWO6EXcwoV1a0fPGVqeErYtO56PRZo1kGEX/zmwzV1O4JHHTsxdtPFldiskKSU9PL4ETjA5db8DW9mezti5kwwCLGUooSGVp1PwddruPpCsNQCKmitZ1z69eTZbWI+bp/8hwcdQF14Iwe0f5uWV4uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169556; c=relaxed/simple;
	bh=/SfzYO3AR8l0hkwQq6/xJHSSryZxjgUHiX/HdJh4WCs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=o5vBdcwPzNs/grnoshzc+AZ5j1DAxj814VWRsvDYEyaT/GbhPC+Pdij1KwtS9ECOdWcTTfpDFWd7ld2TClMIhxOZTXL2nZqG3yXBzv+xsVJz3bS0uRItXrVPtacYDybSBGA5cdg41sj64XrN//GW4aSSuyGNUcAig47BoLyWSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vVoSkPk2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=fLh20rdI; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vVoSkPk2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=fLh20rdI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vVoSkPk2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="fLh20rdI";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vVoSkPk2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="fLh20rdI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3008B219FF;
	Fri,  2 May 2025 07:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746169551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cvpFSQfOQQ5E57SJ/06qkkrXb93768bPAO6S6CdbKoE=;
	b=vVoSkPk20FU7jJOTlEwfakcTaQzhBRT0b6pH+gOkIaEVoeJuUBKxE6E3WvnDGVmoK8ucww
	Xima2XFnH0EpmXeRS7zy8A+IsU8/+L9GdHvi8Oqxqj9BuwY66WmL7yPjRgYoSUaxnnOhkh
	yMPRUk4GJOjkHjqTxq0Tdu0jE90KZII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746169551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cvpFSQfOQQ5E57SJ/06qkkrXb93768bPAO6S6CdbKoE=;
	b=fLh20rdIfpXsIncXeWOUJbjTteYvIJfKH4mAkwWQb1NR/HDrDKhxfd/+TqmdU0/GQDZKUm
	oRqcSYyFCrFpzJBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746169551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cvpFSQfOQQ5E57SJ/06qkkrXb93768bPAO6S6CdbKoE=;
	b=vVoSkPk20FU7jJOTlEwfakcTaQzhBRT0b6pH+gOkIaEVoeJuUBKxE6E3WvnDGVmoK8ucww
	Xima2XFnH0EpmXeRS7zy8A+IsU8/+L9GdHvi8Oqxqj9BuwY66WmL7yPjRgYoSUaxnnOhkh
	yMPRUk4GJOjkHjqTxq0Tdu0jE90KZII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746169551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cvpFSQfOQQ5E57SJ/06qkkrXb93768bPAO6S6CdbKoE=;
	b=fLh20rdIfpXsIncXeWOUJbjTteYvIJfKH4mAkwWQb1NR/HDrDKhxfd/+TqmdU0/GQDZKUm
	oRqcSYyFCrFpzJBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F49C13687;
	Fri,  2 May 2025 07:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CCCyAc9uFGgaMgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 02 May 2025 07:05:51 +0000
Message-ID: <7201bb21-3eba-40ba-b71b-6cd89ed0d76c@suse.cz>
Date: Fri, 2 May 2025 09:05:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [GIT PULL] slab fix for 6.15-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linux.com,linux-foundation.org,kvack.org,vger.kernel.org,linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Hi Linus,

please pull the latest slab fix from:

  git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.15-rc5

Thanks,
Vlastimil

======================================

- Stable fix to avoid bugs due to leftover obj_ext after allocation
  profiling is disabled at runtime (Zhenhua Huang) 

----------------------------------------------------------------
Zhenhua Huang (1):
      mm, slab: clean up slab->obj_exts always

 mm/slub.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)
