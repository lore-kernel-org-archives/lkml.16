Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153241C8611
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257199; cv=none; b=Bz0HVmmHdbKLn6hRBLdO9/XaWXX0F+USj8/xFo056EM7hQfJb2+/bjoQFcarGZro9B8TnrhcV5jrut2VpfxPIsK7vznGZtDeQYE/Fi7BoU7wC1NTLXtpRB22P30WLn3vFkzdePqgjd0wTlyd/fVu5eFxooiK4iKhgV1wMLYWp4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257199; c=relaxed/simple;
	bh=p++XsV65zd8Ml/Td96dJzQsEUULUlD/KcxLSQDGYqxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgtEsjq8NxDM9jb4kVE47hK0eDesCXTFcv+Jr+LCrWKWmWF7ekyH+KKYMyG6PwxYBx0GqukHL7kwhXPwM3xnd+3gn4aQFqiS9pCx7I0ZpHwJulAv6SIt+NFhbeX5UEvHBXE/syrKE/cqgD/GztEj1famj1/oL/n1v/dueIIhu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bDulU4eR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6G2lmqLi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bDulU4eR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6G2lmqLi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bDulU4eR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6G2lmqLi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bDulU4eR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6G2lmqLi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 11BB921202;
	Mon, 21 Apr 2025 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745257196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXmDV2NTlrhzoeaQPnEZB931iPAN+blDYH7pEAZJ4qM=;
	b=bDulU4eRMZWRZ9FcBsmv/7u47mSjQiDFv1phx8iEHruCl1mdCet1hdpg2xQFDGVUuxOFWp
	UOsgK0YGOcNtbxlg+DvwmM+GFb0TSBLE/KPcla4GW8CumoGtPWQGu5lbM9M6bFDwPLjkSl
	vzbFtppuXpODQ4bNzISQ4h4Tk1QZoaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745257196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXmDV2NTlrhzoeaQPnEZB931iPAN+blDYH7pEAZJ4qM=;
	b=6G2lmqLiOh8+3mNdzuzsKL7IN7V5BmFZgVSNKipyjFrgOb4vC+O5o48LzKBDv98GZ7CnF4
	6A8+lEqaSTcMBuBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bDulU4eR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6G2lmqLi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745257196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXmDV2NTlrhzoeaQPnEZB931iPAN+blDYH7pEAZJ4qM=;
	b=bDulU4eRMZWRZ9FcBsmv/7u47mSjQiDFv1phx8iEHruCl1mdCet1hdpg2xQFDGVUuxOFWp
	UOsgK0YGOcNtbxlg+DvwmM+GFb0TSBLE/KPcla4GW8CumoGtPWQGu5lbM9M6bFDwPLjkSl
	vzbFtppuXpODQ4bNzISQ4h4Tk1QZoaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745257196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXmDV2NTlrhzoeaQPnEZB931iPAN+blDYH7pEAZJ4qM=;
	b=6G2lmqLiOh8+3mNdzuzsKL7IN7V5BmFZgVSNKipyjFrgOb4vC+O5o48LzKBDv98GZ7CnF4
	6A8+lEqaSTcMBuBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 981A9139D0;
	Mon, 21 Apr 2025 17:39:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q4FkH+uCBmgwbwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 21 Apr 2025 17:39:55 +0000
Date: Mon, 21 Apr 2025 18:39:53 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] mm: workingset: Simplify lockdep check in update_node
Message-ID: <bmzzod73cuumphqg6nyhegogc6wciyw7oewydljexni7tgdcni@32hathqdj7qo>
References: <20250421-workingset-simplify-v1-1-de5c40051e0e@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-workingset-simplify-v1-1-de5c40051e0e@suse.de>
X-Rspamd-Queue-Id: 11BB921202
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO

On Mon, Apr 21, 2025 at 06:16:28PM +0100, Pedro Falcato wrote:
> container_of(node->array, ..., i_pages) just to access i_pages again
> is an incredibly roundabout way of accessing node->array itself.
> Simplify it.
> 
> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> ---
>  mm/workingset.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/workingset.c b/mm/workingset.c
> index 4841ae8af41113797378846f08336cd7c5757bd5..6e7f4cb1b9a7807e9288955f180a5b6cffab1a40 100644
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@ -612,7 +612,6 @@ struct list_lru shadow_nodes;
>  
>  void workingset_update_node(struct xa_node *node)
>  {
> -	struct address_space *mapping;
>  	struct page *page = virt_to_page(node);
>  
>  	/*
> @@ -623,8 +622,7 @@ void workingset_update_node(struct xa_node *node)
>  	 * already where they should be. The list_empty() test is safe
>  	 * as node->private_list is protected by the i_pages lock.
>  	 */
> -	mapping = container_of(node->array, struct address_space, i_pages);
> -	lockdep_assert_held(&mapping->i_pages.xa_lock);
> +	lockdep_assert_held(&node->array->xa_lock);
>  
>  	if (node->count && node->count == node->nr_values) {
>  		if (list_empty(&node->private_list)) {
> 

Actually, not sure if this is wanted given the original code is a little more
explicit on what the lock is. +CC the original author

If people think this is worse, just drop the patch, I don't really care - was just
checking out the function for other purposes and found this bit a little confusing.

-- 
Pedro
