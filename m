Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73AA26A0D6
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735660; cv=none; b=ThJwidNmEMbIDLZuL9Xrnq88Rbk2aZOTQZf2s4tvfDE3j86sdJn9BvMQM4t0X7GyydccUfx5vRl5GpId1es0GxP008tF42mA0Vgkxpk125KqibGyMh27a0rUm1kGmsOYoI40kJ7Hvml0AHrsSw20S+NLMpNpPEzSNDjYA8ybeA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735660; c=relaxed/simple;
	bh=25JRvNl/dx87KSxbjSstyenPOj/uDk1UPkBdv46W/6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eo3ophicq8lCiuMTjJvDkg0Dfr7E8O6i6VOFzUskHGT5Zc8NWdPllAIJEP/xItXyx2M5E3xm0QoHzhWIo1UOoihpVeUtcfFT0y+NchX5KTlWoa2dRfi8T2KQZecB31+KpOpiz+DNnP+2v3U8Kte2fnI3KJ10PVbZO3yTZF4H+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NBSw0pBn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jYIDz284; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NBSw0pBn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jYIDz284; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NBSw0pBn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jYIDz284";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NBSw0pBn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jYIDz284"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D1A322825;
	Tue, 20 May 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747735657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZcuOoEOqHbdTzot/HwCcBkJCCvGt7biAEO66twbWi8=;
	b=NBSw0pBnnlwFfUxGub7TFophZJF8yHh3Uu1lESogljorRKPx4UrkLkT+mUgC4SY3iFy+D6
	Gvsb/13qrarKdU7FQGyq6XhrHYVHISlg8cl4GwdXCcLR0mQk6jnjGH5J25ukuOdU+cyK0G
	niiLmOcDV5KnWO+4x+we4XFmNcFD8yY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747735657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZcuOoEOqHbdTzot/HwCcBkJCCvGt7biAEO66twbWi8=;
	b=jYIDz284h8D2Fz/PaWrTih63BCR6jz+N+CbINtI8TFwbejxgZ1j/MeCeJ7HZ+WlGAWL7Vl
	cAshT4iXdVGLZZCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747735657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZcuOoEOqHbdTzot/HwCcBkJCCvGt7biAEO66twbWi8=;
	b=NBSw0pBnnlwFfUxGub7TFophZJF8yHh3Uu1lESogljorRKPx4UrkLkT+mUgC4SY3iFy+D6
	Gvsb/13qrarKdU7FQGyq6XhrHYVHISlg8cl4GwdXCcLR0mQk6jnjGH5J25ukuOdU+cyK0G
	niiLmOcDV5KnWO+4x+we4XFmNcFD8yY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747735657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZcuOoEOqHbdTzot/HwCcBkJCCvGt7biAEO66twbWi8=;
	b=jYIDz284h8D2Fz/PaWrTih63BCR6jz+N+CbINtI8TFwbejxgZ1j/MeCeJ7HZ+WlGAWL7Vl
	cAshT4iXdVGLZZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB0E713A3F;
	Tue, 20 May 2025 10:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EArZMGhULGgrZQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 20 May 2025 10:07:36 +0000
Date: Tue, 20 May 2025 12:07:35 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 4/4] drivers/base : Rename
 register_memory_blocks_under_node() and remove context argument
Message-ID: <aCxUZwkU4Re4XXO7@localhost.localdomain>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <bb7bbc113a2f6d3b700f7e73eafd911f77748bbb.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb7bbc113a2f6d3b700f7e73eafd911f77748bbb.1747376551.git.donettom@linux.ibm.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,kernel.org,nvidia.com,gmail.com,linuxfoundation.org,vger.kernel.org,kvack.org,huawei.com,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,localhost.localdomain:mid,nvidia.com:email]

On Fri, May 16, 2025 at 03:19:54AM -0500, Donet Tom wrote:
> The function register_memory_blocks_under_node() is now only called from
> the memory hotplug path, as register_memory_blocks_under_node_early()
> handles registration during early boot. Therefore, the context argument
> used to differentiate between early boot and hotplug is no longer needed
> and was removed.
> 
> Since the function is only called from the hotplug path, we renamed
> register_memory_blocks_under_node() to
> register_memory_blocks_under_node_hotplug()
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
