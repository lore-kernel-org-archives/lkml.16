Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103824A066
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535748; cv=none; b=rnQ4S0mMYzziv66Nbpb5XxJGgRBfy5MLcss96lgjmFt1kAG5TA4aa4Z20TmLZvicxgO6p1OKLRtMQ42w+8lwE0M5qBdnBbeMnIpF+Pl5NU9V+1GJtkvef+xcCXjFE9s5uh+T174u6bb5O6GonOCr7HpXm95N2APUOM3ieImc1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535748; c=relaxed/simple;
	bh=DrYuKNu325yh+4yQQ9G84WaqR9zBlhhfazMrBCN40K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5DLqLg1+P9DjpovZOzHEP76D5hM2JRt3Eb+ogoZ+OdFVoVcIq4XHctveaMXuJK0oHIjtOfxTmCIhSGSgHJKeK4XLR47fSMYhRuw11rOIaz1e2cCXotnIy7qu1ytLzbV0rcu0aieVnQieHO65yZMmBH/QqFvBaIs9zFLUECR39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DO2cx/EC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9fCsnIkV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DO2cx/EC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9fCsnIkV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DO2cx/EC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9fCsnIkV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DO2cx/EC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9fCsnIkV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B84522116E;
	Thu,  3 Jul 2025 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG55YO1q3oy3zBWn+wNNbAJSRwu9AnA7m0WPoR4rSPg=;
	b=DO2cx/ECbMP/J9tFwYBo5iekvV6LWLlq7GaWsKLpsE/iDPLSCWsqreC00eao0+MOD0aXkK
	OGSjQ/q9fib8tjXi8J9lHGYWT95pUa7U4q9vWG7LuDZpkxnb227dWXzhTXArXj60YNvWMw
	pSapXcAyHdv/wSv3L6sqAkYwNul0D0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG55YO1q3oy3zBWn+wNNbAJSRwu9AnA7m0WPoR4rSPg=;
	b=9fCsnIkVs4PG8E/5UTv0R9jHcay3BeWHIikp5iLtZt3+ykjAD6vtFkV+q9vJOMHsN+nAh7
	H6iV6qgKCG6Qg1DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="DO2cx/EC";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9fCsnIkV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG55YO1q3oy3zBWn+wNNbAJSRwu9AnA7m0WPoR4rSPg=;
	b=DO2cx/ECbMP/J9tFwYBo5iekvV6LWLlq7GaWsKLpsE/iDPLSCWsqreC00eao0+MOD0aXkK
	OGSjQ/q9fib8tjXi8J9lHGYWT95pUa7U4q9vWG7LuDZpkxnb227dWXzhTXArXj60YNvWMw
	pSapXcAyHdv/wSv3L6sqAkYwNul0D0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG55YO1q3oy3zBWn+wNNbAJSRwu9AnA7m0WPoR4rSPg=;
	b=9fCsnIkVs4PG8E/5UTv0R9jHcay3BeWHIikp5iLtZt3+ykjAD6vtFkV+q9vJOMHsN+nAh7
	H6iV6qgKCG6Qg1DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9BD7713721;
	Thu,  3 Jul 2025 09:42:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OEGAJYBQZmjxBQAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 03 Jul 2025 09:42:24 +0000
Message-ID: <53116592-1949-4fdf-8935-e324b8779900@suse.de>
Date: Thu, 3 Jul 2025 11:42:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] nvme: prevent ioq creation for discovery
 controllers
To: Kamaljit Singh <kamaljit.singh1@wdc.com>, kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: cassel@kernel.org, dlemoal@kernel.org
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
 <20250702005830.889217-4-kamaljit.singh1@wdc.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250702005830.889217-4-kamaljit.singh1@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B84522116E
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On 7/2/25 02:58, Kamaljit Singh wrote:
> Prevent ioq creation for discovery-controllers as the spec prohibits
> them, similarly to the administrative controllers.
> 
> Reference: NVMe Base rev 2.2, sec 3.1.3.4, fig 28.
> 
While this might be true, we already deal with discovery controllers
just fine, and never had issues with I/O queues being created.
Presumably because discovery controllers never exposed I/O queues
in the first place.

Which also means that admin controllers should work already if they
would not expose I/O queues.

We _might_ reduce the number of queues to '1' in nvme_set_queue_count(),
but then we should issue a warning here as this would be a configuration
error on the target side.

'Prohibited' cuts both ways; the host shouldn't ask for it and the
controller shouldn't advertise it...

Or that's at least my reading. Might be worthwhile clarifying this
at FMDS.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
