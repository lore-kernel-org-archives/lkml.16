Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2569C277CB3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270568; cv=none; b=MJ5WusgPD+xK7Y9mRWpf0lIWZeHulUtUDL6kOcO1lgTsz4hN2cIuefsJdwA7zHKxeTOt0BUogJWWlCRyW2R+hu+5pVmDcFHDW62KnFDV2cQVUTizIrCOLxvSzkuZJg5PzYDNJGB78c2Lt8c0AezE+m0tEAYWrHorhe9GoGBJ7cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270568; c=relaxed/simple;
	bh=CNX9FgjvrXaWyWI+a2RD0sPggXx5ICFSWJLdJYnQkzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmrbZ9fkZvSgr1h3ErOYDAKpLOh0vOOrU3maJCB7IRGdZ3INxJaYmss/Qha+0YuARrevY+TNBoRaq7jp/ahmY81VkyvBrk0//fvmFjfAuemOIJfeuO7gg8dBYRrECEqRFISPNPvZ4X9jrW0Ly9x/0XXpaGKQLsbsPQOszS7kJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZG5TVRXR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6HSeBBKq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1SirJ28+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CWid6ThH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZG5TVRXR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6HSeBBKq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1SirJ28+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CWid6ThH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4406A21188;
	Wed, 18 Jun 2025 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750270564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlOdVz/a4EQlXZp3F15gJUtSHGLctHhNiSjojlEQkSw=;
	b=ZG5TVRXRYlO9AHwq0tsZE6lrWi7ON4KFYMjs2CFWeXBgiB5JuRbn89hwRzJj5glZXz62bb
	LkOA2E4ElKrzFebPAV4Q3EXquyQi0sDb9oNFHIvzk0LDFO/tRWAzcJrMFtNkSmSidXoR1O
	/+ytFqVrlDoG263L1RsyBzRrNAZs1uY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750270564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlOdVz/a4EQlXZp3F15gJUtSHGLctHhNiSjojlEQkSw=;
	b=6HSeBBKq4tXisrY4y6EpNgf9zH6o2g6WmXeVPz2L7c6O9Bx1rrfTCewkbtzVlzRSV+IQjY
	P994sg1c1hd17LDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1SirJ28+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CWid6ThH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750270563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlOdVz/a4EQlXZp3F15gJUtSHGLctHhNiSjojlEQkSw=;
	b=1SirJ28+SYOXAMpJ/3KpNwIx4cYdEVfTH4t3ooG1iDK4zxRkKj6FWQ6tL+MPtUtzX6uGRE
	Z/9fIe0bJy5Ssl1o6vXTOwy0AJ7CgvxAO9YZ0lGjeBOsTzi4mOGmSjUhXfuGruPZ1XWf5O
	5qUQf2SYz93EyrZtZ/IUNalWp12kdRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750270563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlOdVz/a4EQlXZp3F15gJUtSHGLctHhNiSjojlEQkSw=;
	b=CWid6ThHJ+CCV2iRfOHky4ZSHshJ0AkvVWqvco6WAZdy/lTc7MTqshW6ljrxFgjUxP6Wv8
	JgMgWpjNDBHYw6Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D77113A3F;
	Wed, 18 Jun 2025 18:16:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hfu7GmICU2hNRgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 18 Jun 2025 18:16:02 +0000
Date: Wed, 18 Jun 2025 19:16:00 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <ihe6ueejcemrscqzuieunap6sk2z2yb7xr7szr77nue6qpcvm3@qnwvbvqlwdn5>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <b589b96f-a771-42f1-b14a-0f90db9fb55e@redhat.com>
 <5d037cb6-91a7-47b7-a902-c3e36f2adefb@arm.com>
 <dc5fb92c-6636-4dce-bc66-181345f79abf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc5fb92c-6636-4dce-bc66-181345f79abf@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4406A21188
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,lwn.net:email,suse.com:email,goodmis.org:email,suse.de:dkim,kvack.org:email,arm.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 

On Wed, Jun 18, 2025 at 10:44:20AM +0200, David Hildenbrand wrote:
> On 18.06.25 10:37, Anshuman Khandual wrote:
> > 
> > 
> > On 18/06/25 1:48 PM, David Hildenbrand wrote:
> > > On 18.06.25 06:12, Anshuman Khandual wrote:
> > > > Add a new format for printing page table entries.
> > > > 
> > > > Cc: Petr Mladek <pmladek@suse.com>
> > > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: David Hildenbrand <david@redhat.com>
> > > > Cc: linux-doc@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: linux-mm@kvack.org
> > > > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > ---
> > > >    Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
> > > >    lib/vsprintf.c                            | 20 ++++++++++++++++++++
> > > >    mm/memory.c                               |  5 ++---
> > > >    scripts/checkpatch.pl                     |  2 +-
> > > >    4 files changed, 37 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > > > index 4b7f3646ec6ce..75a110b059ee1 100644
> > > > --- a/Documentation/core-api/printk-formats.rst
> > > > +++ b/Documentation/core-api/printk-formats.rst
> > > > @@ -689,6 +689,20 @@ Rust
> > > >    Only intended to be used from Rust code to format ``core::fmt::Arguments``.
> > > >    Do *not* use it from C.
> > > >    +Page Table Entry
> > > > +----------------
> > > > +
> > > > +::
> > > > +        %ppte
> > > > +
> > > > +Print standard page table entry pte_t.
> > > > +
> > > > +Passed by reference.
> > > 
> > > Curious, why the decision to pass by reference?
> > 
> > Just to make this via %p<> based address mechanism. But wondering
> > will it be better for the pte to be represented via value instead
> > of reference ?
> 
> We commonly pass ptes to functions through value, not reference, that's why
> I am asking.


All printf/printk extensions in the kernel follow %p<some letters> and use
pointers because %p takes pointers, so it lets us use -Wformat with no issues.

So yes, taking a pte_t * is required.

-- 
Pedro
