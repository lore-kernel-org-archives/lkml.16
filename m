Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214726FA52
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378190; cv=none; b=RdhKfl/lC/75NROBXuz4aWgZ/7ZrM+CyvWalyphRiJrZpKAV2jTATX2ny0qUE/QD1JBKOxr3Emwl8kqGcmfSz4wC+6t4EVMvi6SiNmmK+LjE6jucskOQXaXrmiLU9dJ5gXIKuBrA9BGw+iELw5GDkxxIB993AORR1GhkiMqenkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378190; c=relaxed/simple;
	bh=UWhsln1pLMKFmXk0W3gFkWNd8GKHXlBzD8To1NFTKU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQkgTK0nrHzLjC7pVGsxm0tHAAv/VKKzdLxJ2NTUJsCOQpt2iYsfLqFbxvf1b8VZWPFVN7z9QwyQlGFe3+8fqwLK7m/PYtdJi5KjehW3wsatenWQQtbxN6jUVrpsRHv6QFq8cjA500yxZ2iPn7jbDNIgLjvC43zY2HXWDFd4Enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CUDcXOmg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AOmsOwSh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CUDcXOmg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AOmsOwSh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CUDcXOmg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AOmsOwSh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CUDcXOmg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AOmsOwSh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C5D31F393;
	Tue,  1 Jul 2025 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751378186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROC8HmBFbxGZQBMqFQ9KZzycONwJ6vs9Fkm9qaOkXpI=;
	b=CUDcXOmg0sh8kmDx95BJcBp6s7zLx+u5f2gJQDpOYbC8b/n+k6VSCXftWUBvVn+695thJM
	xy6lwXis0XFZs12Vtnt6uz7ddx1qcmm4jJakywfSJlhXCK8lQgcZCPZmMV10+jBFTq+ZMq
	eOXA/AgmStqmPfhD34wXpOx0ebpE9VM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751378186;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROC8HmBFbxGZQBMqFQ9KZzycONwJ6vs9Fkm9qaOkXpI=;
	b=AOmsOwShFmnkcYXl/MpEDk4LK0FXRslwOoxwH0T9woVoeGx3IIMrr542+qzIDqBGnyoX7C
	LrsP28t0cYpQEkCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751378186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROC8HmBFbxGZQBMqFQ9KZzycONwJ6vs9Fkm9qaOkXpI=;
	b=CUDcXOmg0sh8kmDx95BJcBp6s7zLx+u5f2gJQDpOYbC8b/n+k6VSCXftWUBvVn+695thJM
	xy6lwXis0XFZs12Vtnt6uz7ddx1qcmm4jJakywfSJlhXCK8lQgcZCPZmMV10+jBFTq+ZMq
	eOXA/AgmStqmPfhD34wXpOx0ebpE9VM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751378186;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROC8HmBFbxGZQBMqFQ9KZzycONwJ6vs9Fkm9qaOkXpI=;
	b=AOmsOwShFmnkcYXl/MpEDk4LK0FXRslwOoxwH0T9woVoeGx3IIMrr542+qzIDqBGnyoX7C
	LrsP28t0cYpQEkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30CFD1364B;
	Tue,  1 Jul 2025 13:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B/c/CQrpY2hOBgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Jul 2025 13:56:26 +0000
Date: Tue, 1 Jul 2025 15:56:20 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: Use str_plural() in report_hugepages()
Message-ID: <aGPpBDaBjl3c2dWu@localhost.localdomain>
References: <20250630171826.114008-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630171826.114008-2-thorsten.blum@linux.dev>
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,linux.dev:email]
X-Spam-Level: 

On Mon, Jun 30, 2025 at 07:18:26PM +0200, Thorsten Blum wrote:
> Use the string choice helper function str_plural() to simplify the code
> and to fix the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
> 
>   opportunity for str_plural(nrinvalid)
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
