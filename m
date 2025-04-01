Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF4A202F7B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516011; cv=none; b=O82wE2Jsyi/HgqCWbQPnki5DDbXotzajgdkTAYMs4uOGUP0ub/w1cL09m9Dc2vzHQrzQxg7hoKqdSzkL0MOVGlKP/GKwzXo5ZZvPoakbAGgnNf+aBUgJ5yzcS3pri+6ezDX58hJ5y0wfFz3WN9fjMwZlLTQkrgeLvNP1g0S5V2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516011; c=relaxed/simple;
	bh=Q7kt0oduBHThyL0H1XxbQTSuwztQdUn6A4qjn4r6UXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlNSlCpvfZ1ygyvXG3WK8zFbATCfeTaXfVPziuTNEV/TdD4U4o+zns9UrD6NdDYNUBseAUhsr5u8BVRNM3SaLDWv9TC7RcuxiZLOS6SWpA64SPc8guIGJoAamRU4VHbIhVyWHGlUa1bNbWPH+yAI4945bMpwKmaeDgCXG/VI5lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h8wjp2qA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0bi+m0LE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h8wjp2qA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0bi+m0LE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h8wjp2qA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0bi+m0LE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h8wjp2qA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0bi+m0LE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7EAE81F38E;
	Tue,  1 Apr 2025 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bGI3oy4u7ZGwAl0qKQUl4rZhxQdP4yTb/KdaM/O1OHU=;
	b=h8wjp2qAHGoYBVkdBFHO9p6OZ3ydcN+L0osUcUlbIR2s52qn9gabAGFy9M+GQiqblMGzSg
	GmHaoykPUrUU/FwEWdvyQ8v3X+kIVvMI4/5RYyWdu/sg6/yRSOrPK/2QiAF6Vl2KjeJo1B
	Q4/ktnj8q6DOF+l1itzQ9ir+WmiC/aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bGI3oy4u7ZGwAl0qKQUl4rZhxQdP4yTb/KdaM/O1OHU=;
	b=0bi+m0LEtRRTVYaY9M67C747KXxFpTBnO9Ub30mp5SLmcLDc+FuATvOGiLJHZq9YH14+Jz
	4xOEQgy4FgvuKwAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bGI3oy4u7ZGwAl0qKQUl4rZhxQdP4yTb/KdaM/O1OHU=;
	b=h8wjp2qAHGoYBVkdBFHO9p6OZ3ydcN+L0osUcUlbIR2s52qn9gabAGFy9M+GQiqblMGzSg
	GmHaoykPUrUU/FwEWdvyQ8v3X+kIVvMI4/5RYyWdu/sg6/yRSOrPK/2QiAF6Vl2KjeJo1B
	Q4/ktnj8q6DOF+l1itzQ9ir+WmiC/aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bGI3oy4u7ZGwAl0qKQUl4rZhxQdP4yTb/KdaM/O1OHU=;
	b=0bi+m0LEtRRTVYaY9M67C747KXxFpTBnO9Ub30mp5SLmcLDc+FuATvOGiLJHZq9YH14+Jz
	4xOEQgy4FgvuKwAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18875138A5;
	Tue,  1 Apr 2025 14:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wBo6A2fx62c1XAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 14:00:07 +0000
Date: Tue, 1 Apr 2025 16:00:05 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 1/7] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z-vxZQn3VAQoiRp3@localhost.localdomain>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-2-bhe@redhat.com>
 <a1f69754-776f-47eb-980e-8a12991f4865@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f69754-776f-47eb-980e-8a12991f4865@redhat.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, Apr 01, 2025 at 10:10:03AM +0200, David Hildenbrand wrote:
> On 31.03.25 10:13, Baoquan He wrote:
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
> >   	} while (start != end);
> >   	mmap_read_unlock(mm);
> > -	if (size > (unsigned long)uaddr - start)
> > -		return size - ((unsigned long)uaddr - start);
> > +	if (size > start - (unsigned long)uaddr)
> > +		return size - (start - (unsigned long)uaddr);
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL(fault_in_safe_writeable);
> 
> Can we instead just use the uaddr and start variables like in
> fault_in_readable?
> 
> That is, turn "start" into a const and adjust uaddr instead.

Yes, I think that would be much cleaner.

Otherwise, this looks good to me. 

-- 
Oscar Salvador
SUSE Labs
