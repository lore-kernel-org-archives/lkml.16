Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA81420DD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447275; cv=none; b=JLGWbXDcsfUAsklpgzp21eojuw7RHWPD789w/k48v8qmCHm4Rn8WrC8VTcyXpD4OtBhEE3XOv5iHRS+TohzSFjbp0GiqqbuHXMhjPd1qecJRbbMtRtp0PiKao4WL9qC9hipdRxI4BIX2dZNCJ96GrieOtYhOH/i2UMjpA07SrOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447275; c=relaxed/simple;
	bh=uGwbwc2vDZcCmUn4tX1K0uHRS8K2PLiYjOCY2lCgyVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaacuCqGr06ldaMfIz2TeCpDW6IqeNQl68MaPNmRMT0YbkhfbbQJ/D7P/VOV30ZKPAMyHT9Tod0DEtLCoGibZRqJAZJAmTld2XlulNtSpajaSw+3Cs2w3OrbXl1jhYG1B6fk9wSBNSbFt/1cfuqhLKhyv/WJGtKBJ+3l/BqlWiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YjlWNsOV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CiXv54a/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YjlWNsOV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CiXv54a/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YjlWNsOV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CiXv54a/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YjlWNsOV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CiXv54a/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20D7421185;
	Wed,  2 Jul 2025 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751447271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P2fD/2YL7KNYrFMoa0ML6XAgkOGWhDNJ70P1HU6KJaI=;
	b=YjlWNsOV1sSS3J9CyIw57rl8hd8PVXUWqJDsNq+NJ0d34QgIlsGz7coPGka03v/EWlUsyb
	y9rOyHeJsaiW3b117Bk6ngAZoX1zVoJdjbKVA70G0p3fbyeRsSn06plEscHosUBA6x9ECh
	QzjwDOZaOtRN+dfejDHBi0kaidBVNYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751447271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P2fD/2YL7KNYrFMoa0ML6XAgkOGWhDNJ70P1HU6KJaI=;
	b=CiXv54a/Am3bR4gTcZgrBwFs2sk0eQWzOh1O+a0iG484R7wkuFq00aD9/dlYpUutwo3EG2
	O6B79FWQXQaaaXDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YjlWNsOV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="CiXv54a/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751447271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P2fD/2YL7KNYrFMoa0ML6XAgkOGWhDNJ70P1HU6KJaI=;
	b=YjlWNsOV1sSS3J9CyIw57rl8hd8PVXUWqJDsNq+NJ0d34QgIlsGz7coPGka03v/EWlUsyb
	y9rOyHeJsaiW3b117Bk6ngAZoX1zVoJdjbKVA70G0p3fbyeRsSn06plEscHosUBA6x9ECh
	QzjwDOZaOtRN+dfejDHBi0kaidBVNYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751447271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P2fD/2YL7KNYrFMoa0ML6XAgkOGWhDNJ70P1HU6KJaI=;
	b=CiXv54a/Am3bR4gTcZgrBwFs2sk0eQWzOh1O+a0iG484R7wkuFq00aD9/dlYpUutwo3EG2
	O6B79FWQXQaaaXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E121F1369C;
	Wed,  2 Jul 2025 09:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qiw6NOX2ZGiMWQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 09:07:49 +0000
Date: Wed, 2 Jul 2025 11:07:40 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into
 folio_pte_batch() and folio_pte_batch_ext()
Message-ID: <aGT23D7BBFNXyykW@localhost.localdomain>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
 <aGT1s-32GpVfVZNU@localhost.localdomain>
 <17777b93-41f0-4943-963f-0330489b01bc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17777b93-41f0-4943-963f-0330489b01bc@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 20D7421185
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,suse.cz,google.com,kernel.org,suse.com,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,surriel.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -3.01
X-Spam-Level: 

On Wed, Jul 02, 2025 at 11:05:17AM +0200, David Hildenbrand wrote:
> Not necessarily inlined into the body (there might still be a function call,
> depending on what the compiler decides), but inlined into the object file
> and optimized by propagating constants.

I see.

> > With this change, a single function, folio_pte_batch(), identical to folio_pte_batch_ext
> > but without the runtime checks for those arguments will be created (folio_pte_batch()),
> > and so the users of it won't have it inlined in their body ?
> 
> Right. We have a single folio_pte_batch() that is optimized by propagating
> all constants. Instead of having one per object file, we have a single
> shared one.

Alright, clear to me now, thanks for claryfing ;-)!

 

-- 
Oscar Salvador
SUSE Labs
