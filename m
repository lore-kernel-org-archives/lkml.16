Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD404C83
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 05:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746337490; cv=none; b=CNs4WOPScPkqBZcmtMDzoW8i+q+1KO/dREuYToc2/elPAkHof1bbAEUE2Ux7AI9uQpwBPh5j5YliDHluN5Jgz2eXExvr/A0e9RWPDMcA/IVTfUJZpeBYfDSmOZhsHFb5myWztjTylEpBTnCm8AULJ2i5ISrCk0v5kUu3B0mil5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746337490; c=relaxed/simple;
	bh=siwSXaaJKfvaAsbTrK6JfFt2eXwVeb3rc9ynuKmFqyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/9rjLUlMEfRetfJaYYKNuIk8U1ytUJdVw8aiimiQ3gGLIK+RxxrpcoK9Em4Nz5g1IpBZXrJj/P0XgfrURqk2oAedGvfMJZ4eg5OrWdd/QDGLCEOUtg8YZtBlb264kUBbvGhLd32BzKooc+xkluPv7Y7hOU7KlrlOg5x5NCKzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fv7VsKEV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zZpF9GBS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fv7VsKEV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zZpF9GBS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fv7VsKEV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zZpF9GBS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fv7VsKEV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zZpF9GBS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 59AFA1F792;
	Sun,  4 May 2025 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746337486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myodQUR3mP8MXaDV62oqd+gulOdS8C/wV8/Sn59oMdI=;
	b=fv7VsKEVMNHLPeyk2g3DYvkCx0muDGMjtGx3El4pX42qJkU83Sl+d7zkVvCu2EtQ+CFmpT
	7w0yuWizqdyW7cnFqmmLniBC+aJM1GzNEXm+vmcU31BKhGOeU+Ms735mghKMByZzAzdIlN
	0L4DiLyVbxcWjHxhaD64f6GEUQ+mqUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746337486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myodQUR3mP8MXaDV62oqd+gulOdS8C/wV8/Sn59oMdI=;
	b=zZpF9GBSbQmBiC9rLuCDBfJnL9PvyzrKpqxZFnYlsXMYDEm/wPMZwynUxC/nX6o1TiMCW0
	WkprBqyHr+TQz7Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746337486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myodQUR3mP8MXaDV62oqd+gulOdS8C/wV8/Sn59oMdI=;
	b=fv7VsKEVMNHLPeyk2g3DYvkCx0muDGMjtGx3El4pX42qJkU83Sl+d7zkVvCu2EtQ+CFmpT
	7w0yuWizqdyW7cnFqmmLniBC+aJM1GzNEXm+vmcU31BKhGOeU+Ms735mghKMByZzAzdIlN
	0L4DiLyVbxcWjHxhaD64f6GEUQ+mqUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746337486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myodQUR3mP8MXaDV62oqd+gulOdS8C/wV8/Sn59oMdI=;
	b=zZpF9GBSbQmBiC9rLuCDBfJnL9PvyzrKpqxZFnYlsXMYDEm/wPMZwynUxC/nX6o1TiMCW0
	WkprBqyHr+TQz7Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0A8F13688;
	Sun,  4 May 2025 05:44:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YffDL83+FmhvHgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sun, 04 May 2025 05:44:45 +0000
Date: Sun, 4 May 2025 07:44:40 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>
Subject: Re: [PATCH v3 0/3] Implement numa node notifier
Message-ID: <aBb-yDDJLObXF8P5@localhost.localdomain>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250503200334.3f912eeb7ca484bca4eec7fd@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503200334.3f912eeb7ca484bca4eec7fd@linux-foundation.org>
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,suse.cz,gmail.com,huawei.com,sk.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, May 03, 2025 at 08:03:34PM -0700, Andrew Morton wrote:
> Why is this a problem?  Is there some bug?  Are these notifications so
> frequent that there are significant inefficiencies here?

hi Andrew,

There is no bug, it is just suboptimal.

That the numa node state changes were tied to the memory notifier was
something hacky and that have us bugged for a while now.
Were mean to tidy that up but just never got around it.

Actually, first time I brought that up was when I reviewed the first implementation
of memory demotion (~ca 3-4 years ago now?).

With the addition of yet another consumer (auto-weitght mempolicy) that was only
interested in get notified on numa node changes, it became more clear that we
really want to split those up.

> Further down-thread, Gregory tells us that Dan's patch "seems to fix
> the underlying problem", but nobody (including Dan) told us about any
> "problem" at all.

That is related to auto-weight mempolicy patches, not to this one.
I _think_ Gregory means that I take it in as part of the series.

-- 
Oscar Salvador
SUSE Labs
