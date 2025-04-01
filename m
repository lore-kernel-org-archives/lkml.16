Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB35204685
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516337; cv=none; b=GKwbOVRKfI4dgehb01pkRnlDDKTdv8X00+EN0oI5cjuXBANzqqe7kxGdpY4wbxuQVttmptqC42okfk1/+NG0sHtcYwuQMOR/p9IYGTbA9OmtfMemrr+4D/nolk9rMZGdqxmw/QH8aMFZaGJ9xR7spggCbETIjip4G1SvgyoiJfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516337; c=relaxed/simple;
	bh=AI69wCYKAaCfFkprguc6o9rLtY07cuhSRg33rT54uMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RK61SR/tMr3bc+Ecw3/nSzji+p61bjUHgeNJKKkqTXyFx8x+VYy07khg2AJ7MZ4F/dT75Qd58V2GCO4m2nv+Wh+YlTXvKOv73Eo09V6HY3WsukMnO3Va4LRYpSBx+IYqLtxa2C/IQXfsMiE+567EWvsmNuGMCXifmFscALAxKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EGoUx7cG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qq0uth9r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c02Pc3H9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yWGg8w4z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EGoUx7cG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qq0uth9r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c02Pc3H9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yWGg8w4z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D759E1F38E;
	Tue,  1 Apr 2025 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioz2J5OyCW+D0qTDZtmZicbCtvIBX2wXYFGrZx7//9Y=;
	b=EGoUx7cGM84tfHT5TYdRrt8jlnYk0bEcB7kbInsZkIwODhhegxkGIh8Nufv8KAvH75xRVC
	TIOtOdgMT3AR9pDBIVXxr+jLaeif8cYelNzEdyUiv7p/BoOobaXcGQzkFe0uPFY++uE/Mi
	rWP+Gt1qWG02yqUXFw5i3MZ22nu7xUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioz2J5OyCW+D0qTDZtmZicbCtvIBX2wXYFGrZx7//9Y=;
	b=Qq0uth9rF79Ugn3wX2m12hoLobDkC7VOX+ip1BSNpdc7AGuBjY/mt5ZI8DkjWLgzVmCJeG
	CnhF1ABakDGCMKDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c02Pc3H9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yWGg8w4z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioz2J5OyCW+D0qTDZtmZicbCtvIBX2wXYFGrZx7//9Y=;
	b=c02Pc3H9jYKWbyPcvAyUqCfAaHt7VcQSHg5m4HUqw8adanKC6ZHkXd/TxY2f944RLuph7Z
	YY8ph5QobOQukVtCo1aKUz1W9CB6XElTsDnvgiaq4aspKS45gUbyUgfhhgA5CRjQ1ywXri
	Jkn5D+Jur//3Je5fh5Z4ScEivdC+8rU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioz2J5OyCW+D0qTDZtmZicbCtvIBX2wXYFGrZx7//9Y=;
	b=yWGg8w4zHsjfTLYgZNf8d3OwrZVrMZXajdafAVa4MJ5YS77hv9Dkrml/Qr6KGlcJZ4Q5mV
	+8FcDpXVfLbfZ5DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75266138A5;
	Tue,  1 Apr 2025 14:05:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Uz/UGavy62f6XQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 14:05:31 +0000
Date: Tue, 1 Apr 2025 16:05:25 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev, x86@kernel.org
Subject: Re: [PATCH v2 6/7] x86/mm: remove p4d_leaf definition
Message-ID: <Z-vypSM90BYqdhTM@localhost.localdomain>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-7-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331081327.256412-7-bhe@redhat.com>
X-Rspamd-Queue-Id: D759E1F38E
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,localhost.localdomain:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Mon, Mar 31, 2025 at 04:13:26PM +0800, Baoquan He wrote:
> There's no p4d huge page support yet, let's use the generic definition.
> 
> And also update the BUILD_BUG_ON() in pti_user_pagetable_walk_pmd()
> because p4d_leaf() returns boolean value.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Cc: x86@kernel.org

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
