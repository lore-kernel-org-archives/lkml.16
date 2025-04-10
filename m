Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057FF1E766F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273896; cv=none; b=rVQKXU2bUZOg1xSoz7eL6RhIh9YknkPUbzRCIb2EkBICTTcRBMTZDBodppoXc++L/U5FHflm064tGcADSowJTjoeYSLOIUcDHS4/Tdd6oiHrjHWKb+i3nDCGQBp9NJURfRKmRwU4b2HSGrZnZx5nTorUS/W8GMBG0uApE1+8Kbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273896; c=relaxed/simple;
	bh=GaSGS7LWSqdhu+8Q/k1fH0zraYNW3rDoupEHbZFBBV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJHNJCfkXMqjXLpJR7sjTtjI9RHDD5LZASogi1G/KQt6L8gThQHm9KEaNbFbdP66w2xExlZqtKYKr89gj9fRmYSH2mz4E/e4dCCn1T3KUCIcS5Am5eEqK0RwdZfsMYI1PuHdf6EPTurZHl20RXiRpBFXWiIpI6YS577pekz2n4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qgmvz8lV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DlqQeChf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qgmvz8lV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DlqQeChf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qgmvz8lV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DlqQeChf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qgmvz8lV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DlqQeChf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 24B8A1F385;
	Thu, 10 Apr 2025 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744273893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ISUJsnlV3J3KlgZ8H2hwfkjvH7DBQFpDT8OBzEozrD0=;
	b=Qgmvz8lVBZNj2MFL2rSa/rwhyQiYeQvfcVVyC17sLVv4Dojy0G6WD8h13xdNbX03febapS
	8zxPOwD1MgK+lmsixDieQLQjypFPpKcO4XlubBR+qNZiCGF0DNk9v0omk1HBw8LMhO+Plt
	HU23H7GZmpNhapjbIRaQ+0DyN/L9TkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744273893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ISUJsnlV3J3KlgZ8H2hwfkjvH7DBQFpDT8OBzEozrD0=;
	b=DlqQeChfWHi9M3ftMN/PH+pYa/zqbDAZYt4Vwtyr/+f6v0Y+9UD32CFaamCfvv8qX1Ot2t
	XhCNV2Utxri64uBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744273893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ISUJsnlV3J3KlgZ8H2hwfkjvH7DBQFpDT8OBzEozrD0=;
	b=Qgmvz8lVBZNj2MFL2rSa/rwhyQiYeQvfcVVyC17sLVv4Dojy0G6WD8h13xdNbX03febapS
	8zxPOwD1MgK+lmsixDieQLQjypFPpKcO4XlubBR+qNZiCGF0DNk9v0omk1HBw8LMhO+Plt
	HU23H7GZmpNhapjbIRaQ+0DyN/L9TkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744273893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ISUJsnlV3J3KlgZ8H2hwfkjvH7DBQFpDT8OBzEozrD0=;
	b=DlqQeChfWHi9M3ftMN/PH+pYa/zqbDAZYt4Vwtyr/+f6v0Y+9UD32CFaamCfvv8qX1Ot2t
	XhCNV2Utxri64uBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0DCA13886;
	Thu, 10 Apr 2025 08:31:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DwDwJ+SB92cdCgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 10 Apr 2025 08:31:32 +0000
Date: Thu, 10 Apr 2025 10:31:21 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@redhat.com,
	yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z_eB2SHsJUtniMY2@localhost.localdomain>
References: <20250410035717.473207-1-bhe@redhat.com>
 <20250410035717.473207-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410035717.473207-2-bhe@redhat.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 10, 2025 at 11:57:14AM +0800, Baoquan He wrote:
> Not like fault_in_readable() or fault_in_writeable(), in
> fault_in_safe_writeable() local variable 'start' is increased page
> by page to loop till the whole address range is handled. However,
> it mistakenly calcalates the size of handled range with 'uaddr - start'.
> 
> Fix it here.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Fixes: fe673d3f5bf1 ("mm: gup: make fault_in_safe_writeable() use fixup_user_fault()")

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  mm/gup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 92351e2fa876..84461d384ae2 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
>  	} while (start != end);
>  	mmap_read_unlock(mm);
>  
> -	if (size > (unsigned long)uaddr - start)
> -		return size - ((unsigned long)uaddr - start);
> +	if (size > start - (unsigned long)uaddr)
> +		return size - (start - (unsigned long)uaddr);
>  	return 0;
>  }
>  EXPORT_SYMBOL(fault_in_safe_writeable);
> -- 
> 2.41.0
> 

-- 
Oscar Salvador
SUSE Labs
