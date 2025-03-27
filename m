Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DDD1B4251
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073110; cv=none; b=FDiiYTSrk7N3NytNpgBlS1K9SKq4lZTiudngch2fqhqRkSQ8waPWlzYbM1S7Zg4FQZvP4w5lyNs3bEwbxUjCMdGSJI2YJJROMgPD5iM1PdKUnyBHNMGFdSExtmqnFiT+mLXKSMpz85w+40SjP/jFi6Aqb/yZQ1j+dgSBHhqPnTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073110; c=relaxed/simple;
	bh=oWFPMpfYSqNZYbsA7yhHviWGogl9nSiHPZGOKgBl0hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKicQyRRlToc0NDIyE9T+PYwkxETns5OWHJ3R6V4M+27MJDYwoqkpnPgHCtbO82Wce4y8yZCZblNO1TdFIi0IOAX5UJeOIi5mqGPg77fUpvSGOS5IxlSENhXfhYjef533RGZXsYDLEOpAlQPsBaryAAhz6a/EUokMw6qP3n+Md8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LLBR0GZw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fHH4QlsC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LLBR0GZw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fHH4QlsC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LLBR0GZw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fHH4QlsC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LLBR0GZw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fHH4QlsC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0EB632117A;
	Thu, 27 Mar 2025 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743073107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W9Pr8Ub5qgGnovkmhpFhqZcnIZM6RvFEbI3pqHcF0bA=;
	b=LLBR0GZwB8B7NMSAejk6A8Kqs2rCx4zmd6fyxPreoO9RM9k3I1IOY93a11M7XmilVZnSQA
	t+y4c/doyMgx/ykGK19OPFL3ZSXecYIsmjQVh6hIO+5PrfRgn/0kFrGY2W3gsT/XNk3DO9
	3yA8tCb9YNWoQUiQCnX3j+WFfAtHy6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743073107;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W9Pr8Ub5qgGnovkmhpFhqZcnIZM6RvFEbI3pqHcF0bA=;
	b=fHH4QlsCw3of7zmZfwftWHuJK8mrfVo6HMZE8TuL4/W3hdpvC9i40zK9Upz81Azl4Dpa4D
	9e2B9cnANLalfhDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LLBR0GZw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fHH4QlsC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743073107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W9Pr8Ub5qgGnovkmhpFhqZcnIZM6RvFEbI3pqHcF0bA=;
	b=LLBR0GZwB8B7NMSAejk6A8Kqs2rCx4zmd6fyxPreoO9RM9k3I1IOY93a11M7XmilVZnSQA
	t+y4c/doyMgx/ykGK19OPFL3ZSXecYIsmjQVh6hIO+5PrfRgn/0kFrGY2W3gsT/XNk3DO9
	3yA8tCb9YNWoQUiQCnX3j+WFfAtHy6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743073107;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W9Pr8Ub5qgGnovkmhpFhqZcnIZM6RvFEbI3pqHcF0bA=;
	b=fHH4QlsCw3of7zmZfwftWHuJK8mrfVo6HMZE8TuL4/W3hdpvC9i40zK9Upz81Azl4Dpa4D
	9e2B9cnANLalfhDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D6BA1376E;
	Thu, 27 Mar 2025 10:58:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dOTLBFIv5WfTHgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 27 Mar 2025 10:58:26 +0000
Date: Thu, 27 Mar 2025 11:58:20 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
	Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v3] mm/page_alloc: Simplify free_page_is_bad by removing
 free_page_is_bad_report
Message-ID: <Z-UvTBZqGdufLfwu@localhost.localdomain>
References: <20250326012434.918844-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326012434.918844-1-ye.liu@linux.dev>
X-Rspamd-Queue-Id: 0EB632117A
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Mar 26, 2025 at 09:24:34AM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Refactors the free_page_is_bad function by directly calling bad_page() 
> instead of using the intermediary function free_page_is_bad_report(). 
> The removal of free_page_is_bad_report() reduces unnecessary indirection,
> making the code cleaner and easier to read.
> 
> The functionality remains the same, as free_page_is_bad_report() was
> merely a wrapper for the bad_page() call. The patch also improves
> maintainability by reducing the function call depth.

I would trim this down.

> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
