Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5873190692
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749100730; cv=none; b=SSO0D/Y2XIeHIAfiVAJKfFddG7KG7Vb2pI2cPSza7VLsDYjWa5H6hRE7seoXu/T/pQqtfjX2BwLlgp+OU0Z9zqspYylPKyv/rPgDmF4dF2TOUEWt/BomTiANNJIa7oIqU0oMXR226LvcTdEz28kYLn+La10L3wLptlwmU552RMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749100730; c=relaxed/simple;
	bh=o3zxqi9FWZgYJW+hUkbDNUhlZIYPVYW8O5vjroK0W/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR1kcdvTNyVSvr8jQgPsSBP67GPj/zSoktMuYDOk1Brhtr55JlERnwriJrNZ9fc+UoVcIOgO9QBAgaa1BmX5KV1/zD37VOSbbmd9E8hyrRp/N7oETK2nIbsR8rAbAB5ZSDzYZ3KxLlMSmQtD9LclROlu9rFoRRBwFnqpT7dB5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFUSSWg0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OQLhnjrn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFUSSWg0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OQLhnjrn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFUSSWg0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OQLhnjrn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFUSSWg0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OQLhnjrn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7660720F07;
	Thu,  5 Jun 2025 05:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749100725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6YRlTArp4mKb+ynUhlVeCQIiNcQ2GjLBI82fuvz7Dg=;
	b=dFUSSWg0RDbwBWjqUo9TH6r8OztgXCb17cqSLW8r4VbUN+ZfjQIpebtVUVXYedkhgbmtX9
	4jWTfAbCK+4CSu7aiZdfYgULU7Op/ZW/OV/5Uz9agVgsQyfBUC0RRh40Tcig8VqbdqDwm7
	Yd3tS58Sq/cRU+EMFF/8vnQOOejORFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749100725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6YRlTArp4mKb+ynUhlVeCQIiNcQ2GjLBI82fuvz7Dg=;
	b=OQLhnjrnknf+r7qx5geJLQmlPSmBVTStq5ukqgvTYm6eQIcZlEVRA1mmDxAjWOyrbfXV32
	FOBDdvVbKWEHyNBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dFUSSWg0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OQLhnjrn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749100725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6YRlTArp4mKb+ynUhlVeCQIiNcQ2GjLBI82fuvz7Dg=;
	b=dFUSSWg0RDbwBWjqUo9TH6r8OztgXCb17cqSLW8r4VbUN+ZfjQIpebtVUVXYedkhgbmtX9
	4jWTfAbCK+4CSu7aiZdfYgULU7Op/ZW/OV/5Uz9agVgsQyfBUC0RRh40Tcig8VqbdqDwm7
	Yd3tS58Sq/cRU+EMFF/8vnQOOejORFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749100725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6YRlTArp4mKb+ynUhlVeCQIiNcQ2GjLBI82fuvz7Dg=;
	b=OQLhnjrnknf+r7qx5geJLQmlPSmBVTStq5ukqgvTYm6eQIcZlEVRA1mmDxAjWOyrbfXV32
	FOBDdvVbKWEHyNBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3B6713A1D;
	Thu,  5 Jun 2025 05:18:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EsXDMLQoQWjyBAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 05:18:44 +0000
Date: Thu, 5 Jun 2025 07:18:43 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aEEos-bG7cq0C8gI@localhost.localdomain>
References: <20250603110850.192912-1-osalvador@suse.de>
 <20250603110850.192912-3-osalvador@suse.de>
 <ddcdd8b9-566c-4f6c-b1f7-861e93a80fbb@redhat.com>
 <aEA-K3hTvhtdUxuA@localhost.localdomain>
 <9a845c21-5cfb-4535-97bd-0b02f5852457@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a845c21-5cfb-4535-97bd-0b02f5852457@redhat.com>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7660720F07
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Wed, Jun 04, 2025 at 02:47:28PM +0200, David Hildenbrand wrote:
> Just to clarify, these were the 3 notifiers each that belong together. I was
> not sure about NODE_CANCEL_ADDING_FIRST_MEMORY vs.
> NODE_NOT_ADDED_FIRST_MEMORY.

I started working on the new respin and the moment came to make a
decision about this.
I think I'd go with NODE_CANCEL_ADDING_FIRST_MEMORY, for two reasons.
One is that memory notifier also uses that therminology, so I'd use that
one for the node notifier to keep it consistent.
Someone could argue whether we are perpetuating a bad decision naming
though :-).

The other reason is that to me, it sounds more natural as the way I see
it, we are canceling an ongoing operation (memory-hotplug).
Now, I can also see the point in the NODE_NOT_ADDED because the memory
could "not be added in the end", but at the end of the way only one can be picked :-D.


-- 
Oscar Salvador
SUSE Labs
