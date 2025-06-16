Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1926FA46
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062625; cv=none; b=VnJ8JZEgEyvrHixF7kZpLp19b52+D3Tc2Q4Quxeg3U5bx9DlRdLENsZwrK+bmWuZAR8Kvm+lxHAWybgrVQ7nNY4QKHLbH/pvCdLvxquKHiAbj2Pu/UtGYuY1bw3LGhc2Yp7HMBCdR4EBK3ivcYsrZOOb584UjB6Ngb7XYLe4oog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062625; c=relaxed/simple;
	bh=w4BHDqwkLIpyR6zL77M4S/jNqUQlHBIkk+AZOE397s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DL8xh/WBUuOeuTIGYu20FdQNP+ZyebbcV+5DRPYETncmynCsOiEk6qpRlQXS8ZCb2xFu9CPWgAtpuEfKfEDa6ArWCC7A56jdxqYNFbHghwp96DiWX0uzX+LNSWrH3tDYdFV1eUQGgKHMi0bcupopNU8xdwviuQn4kqwYdPjF9H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1hz2n+Jx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tWOMfBkx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1hz2n+Jx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tWOMfBkx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1hz2n+Jx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tWOMfBkx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1hz2n+Jx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tWOMfBkx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 16140211F7;
	Mon, 16 Jun 2025 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750062622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3aX0NRoJxcW3u/fu9obhKehgI7vwsQ+JsjDf2wKCRV0=;
	b=1hz2n+JxBvGkv8bj7q++Zv4/XgkyDe9nVZ1B++XURNscZRaePu/8vuTLQ2HnVyctKEkd+H
	lT42M3U69v9A5BUHUGJrpMXpNUA8aSP48s1ORonhdmSzBgf29jrkv/7qE0wyn6rUuVlCyT
	h0Zfxug4SJTYZo2M470H3K2KUNJiKq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750062622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3aX0NRoJxcW3u/fu9obhKehgI7vwsQ+JsjDf2wKCRV0=;
	b=tWOMfBkxSbBlJ1SHucZE4sNz8IRn55vhIMXIkxXLjwgRjX+KddebWcsJUHUd0Qb9J/cum1
	TbEasZXWE5ERYsBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750062622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3aX0NRoJxcW3u/fu9obhKehgI7vwsQ+JsjDf2wKCRV0=;
	b=1hz2n+JxBvGkv8bj7q++Zv4/XgkyDe9nVZ1B++XURNscZRaePu/8vuTLQ2HnVyctKEkd+H
	lT42M3U69v9A5BUHUGJrpMXpNUA8aSP48s1ORonhdmSzBgf29jrkv/7qE0wyn6rUuVlCyT
	h0Zfxug4SJTYZo2M470H3K2KUNJiKq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750062622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3aX0NRoJxcW3u/fu9obhKehgI7vwsQ+JsjDf2wKCRV0=;
	b=tWOMfBkxSbBlJ1SHucZE4sNz8IRn55vhIMXIkxXLjwgRjX+KddebWcsJUHUd0Qb9J/cum1
	TbEasZXWE5ERYsBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 817A8139E2;
	Mon, 16 Jun 2025 08:30:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K5otHR3WT2j8OQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 08:30:21 +0000
Date: Mon, 16 Jun 2025 10:30:19 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aE_WG6bnjtLBzCp8@localhost.localdomain>
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

On Tue, Jun 10, 2025 at 10:10:21AM +0200, David Hildenbrand wrote:
> On 09.06.25 11:21, Oscar Salvador wrote:
> > +The first argument of the callback function (self) is a pointer to the block
> > +of the notifier chain that points to the callback function itself.
> > +The second argument (action) is one of the event types described above.
> > +The third argument (arg) passes a pointer of struct node_notify::
> > +
> > +        struct node_notify {
> > +                int nid;
> > +        }
> > +
> > +- nid is the node we are adding or removing memory to.
> > +
> > +  If nid >= 0, callback should create/discard structures for the
> > +  node if necessary.
> 
> Likely that should be removed?

Yes, indeed.

> 
> It' probably worth mentioning that one might get notified about
> NODE_CANCEL_ADDING_FIRST_MEMORY even though never notified for
> NODE_ADDING_FIRST_MEMORY. (same for removing)
> 
> I recall this can happen if one of the NODE_ADDING_FIRST_MEMORY notifiers
> fails.
> 
> (same applies to MEM_CANCEL_*)
> 
> Consequently, we might simplify the cancel_mem_notifier_on_err etc stuff,
> simply unconditionally calling the cancel counterparts.

So, I managed to do another respin with all feedback included, but I
left this one for the end, and here I'm.

It's true, currently users can get notified about e.g: MEM_CANCE_ONLINE without
going through MEM_GOING_ONLINE if another user fails for the latter, but I'm
trying to workaround the fact why that's not a problem.

Because assume you have a user of MEM_CANCEL_ONLINE, who thinks it got called
for MEM_GOING_ONLINE, while in fact it didn't because some other user fail on
it, and it tries to free some memory it thinks it initialized during MEM_GOING_ONLINE.

Isn't this a bit shaky? I mean, yes, I guess we can put the burden on the users of
the notifiers to not assume anything, but then yes, I think we should document this
as it can lead to potential misbeliefs.


-- 
Oscar Salvador
SUSE Labs
