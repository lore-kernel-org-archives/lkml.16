Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F2242D80
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535257; cv=none; b=YJrV7w4bPfQCuUDGw4zqFM2+Qp/au5xvo/K8KAewjFGdcuBRuroCc/3q7E5j5Hi+AWsH7SgjG9E58krJ0HQWXpyJj2NWlZ5gjNNO3NiDf4BH38O1NhJlIgZhO8G85bDxl3GU9ay1D+b5gjJUI13dImm4VcQHxuFnonh/jCZTMEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535257; c=relaxed/simple;
	bh=nANIl+8OdUCAyHhwV0u0GP5dkQNzdlPOUBby2T5uph0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUxZ4oNXIvA1Xka+Iby79zbLZq+BjHJUmYJ3hQjuGnkWcBQg8E438VfKniu+yUqdKv6jo+LHisHcd4lZs5QavDv4SHIL0yDy1p+z0Z9x1b7Z9GudlkfmoRSAlqv+agEjiqEscr9qI/GWDKIOGPsEMA68V0JpheL2boy8VAZRNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PxCvQMV8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rX0rMgui; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PxCvQMV8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rX0rMgui; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PxCvQMV8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rX0rMgui";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PxCvQMV8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rX0rMgui"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53E471F457;
	Thu,  3 Jul 2025 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AEzOsqJCpTsA6+tGxdT7oSoEwUMy3kIEd2qkVoXTzqE=;
	b=PxCvQMV8zndbQyE6ly524YmDf3Y8RUCs9p3YqF/9H+vWukJGv8+MZDRm+mwjgmXRB3ZofF
	EzdTEJLNO+zIoMTaghdJQH+WQj913S4rhFuBY1dqNVnedyXSgjDa/9Jbb62eK6LZmBzeYn
	3YcjzwuGxlicevjqJhhsKkSjGP5vxR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AEzOsqJCpTsA6+tGxdT7oSoEwUMy3kIEd2qkVoXTzqE=;
	b=rX0rMguinqvqFDR6ZeF31Y+VH3j5DsAHDP4uVp4f24US7KyZ1egnEXh0BlFYfSL2Da7lJ5
	ba/h2+EfXBoYEUAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PxCvQMV8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rX0rMgui
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AEzOsqJCpTsA6+tGxdT7oSoEwUMy3kIEd2qkVoXTzqE=;
	b=PxCvQMV8zndbQyE6ly524YmDf3Y8RUCs9p3YqF/9H+vWukJGv8+MZDRm+mwjgmXRB3ZofF
	EzdTEJLNO+zIoMTaghdJQH+WQj913S4rhFuBY1dqNVnedyXSgjDa/9Jbb62eK6LZmBzeYn
	3YcjzwuGxlicevjqJhhsKkSjGP5vxR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AEzOsqJCpTsA6+tGxdT7oSoEwUMy3kIEd2qkVoXTzqE=;
	b=rX0rMguinqvqFDR6ZeF31Y+VH3j5DsAHDP4uVp4f24US7KyZ1egnEXh0BlFYfSL2Da7lJ5
	ba/h2+EfXBoYEUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD47213721;
	Thu,  3 Jul 2025 09:34:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ScaFL5NOZmgvAwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 03 Jul 2025 09:34:11 +0000
Date: Thu, 3 Jul 2025 11:34:10 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Pratyush Yadav <ptyadav@amazon.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/3] cma: split resrvation of fixed area into a helper
 function
Message-ID: <aGZOkpE8DRv9uawi@localhost.localdomain>
References: <20250702173605.2198924-1-rppt@kernel.org>
 <20250702173605.2198924-3-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702173605.2198924-3-rppt@kernel.org>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 53E471F457
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On Wed, Jul 02, 2025 at 08:36:04PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move the check that verifies that reservation of fixed area does not
> cross HIGHMEM boundary and the actual memblock_resrve() call into a
> helper function.
> 
> This makes code more readable and decouples logic related to
> CONFIG_HIGHMEM from the core functionality of
> __cma_declare_contiguous_nid().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Looks good to me, nit below:

Acked-by: Oscar Salvador <osalvador@suse.de>


> @@ -433,10 +448,10 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
>  
>  	/* Reserve memory */
>  	if (fixed) {
> -		if (memblock_is_region_reserved(base, size) ||
> -		    memblock_reserve(base, size) < 0) {
> -			return -EBUSY;
> -		}
> +		int err = cma_fixed_reserve(base, size);

There's no need for 'err', you can use the already declared 'ret'.

 

-- 
Oscar Salvador
SUSE Labs
