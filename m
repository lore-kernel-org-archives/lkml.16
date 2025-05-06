Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C10527877A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530001; cv=none; b=tBLn0OwzIUsxz8RWgIhpBTWFuIIkHYV5mbiSrvuXDeM/1ukZ0vc18Hgih074Y8OpeZY/EzNAXpRCAEq4sKOIAINpLb4GUPGNoKgdcOV9mdvOj6P5n3cWvbATu3JIcMxDO1eP5BT+xxll5ou6pO6JE7dKEo2dWUKOWJHAlUdBTZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530001; c=relaxed/simple;
	bh=dQDbQ4aWHtVtXQihztdnepN+Gqyu0Lf6TyGHhNtbKuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG167WCOlM722lAGhl4wWfEo9WIfT8cWS7/vm0rD3Jd7Z73uHugoZuxEgCiiVG9FpCj7QsZ8dvdjfYEPRLIlaKPuJDgDHAgPWoIqWCY7oDV+YT0E/Dw3UYh+dDzzAU+SzIfxd1v1n+09NUFK55o+NgioJSQ1xdFflJe1AKXeNIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qqQXPFUX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ME6YFNUE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qqQXPFUX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ME6YFNUE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qqQXPFUX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ME6YFNUE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qqQXPFUX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ME6YFNUE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F9082117D;
	Tue,  6 May 2025 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746529998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA3GkO9ePyvoKNTpWTfqovGBR1rMnUKl6jDdtWHcXoA=;
	b=qqQXPFUXcAZ8gFv+0I70dJmE01IQBTBFbtGS2WDBIOpKMpOBEco+s0BWAL3DBpHI7u7bbY
	Madp8VOqv9pahbKfUDk/ceAOAJP/DZ0imVO0T8VRsXIWDl2UfgYa/P0KoLDFWmkiRkkTNX
	B/5tI55VCw/YY2FYw8x5T1ogvhWd9NQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746529998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA3GkO9ePyvoKNTpWTfqovGBR1rMnUKl6jDdtWHcXoA=;
	b=ME6YFNUEL9aD8h8Gr6GIQ5/IITR8dO57D+r9aVbgaD2PEKuXitlEWYnr4GUhKsAKXTjYhC
	HDT2SnBccyLC3oCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qqQXPFUX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ME6YFNUE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746529998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA3GkO9ePyvoKNTpWTfqovGBR1rMnUKl6jDdtWHcXoA=;
	b=qqQXPFUXcAZ8gFv+0I70dJmE01IQBTBFbtGS2WDBIOpKMpOBEco+s0BWAL3DBpHI7u7bbY
	Madp8VOqv9pahbKfUDk/ceAOAJP/DZ0imVO0T8VRsXIWDl2UfgYa/P0KoLDFWmkiRkkTNX
	B/5tI55VCw/YY2FYw8x5T1ogvhWd9NQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746529998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA3GkO9ePyvoKNTpWTfqovGBR1rMnUKl6jDdtWHcXoA=;
	b=ME6YFNUEL9aD8h8Gr6GIQ5/IITR8dO57D+r9aVbgaD2PEKuXitlEWYnr4GUhKsAKXTjYhC
	HDT2SnBccyLC3oCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCB5B137CF;
	Tue,  6 May 2025 11:13:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id no9QM83uGWigEQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 06 May 2025 11:13:17 +0000
Date: Tue, 6 May 2025 13:13:16 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm,mm_init: Mark set_high_memory as _init
Message-ID: <aBnuzKw-zYDPwLE3@localhost.localdomain>
References: <20250506111012.108743-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506111012.108743-1-osalvador@suse.de>
X-Rspamd-Queue-Id: 2F9082117D
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, May 06, 2025 at 01:10:12PM +0200, Oscar Salvador wrote:
> set_high_memory() touches arch_zone_lowest_possible_pfn which is
> marked as _initdata, which creates a section mismatch.
> Since the only user of the function is free_area_init() which is also marked
> as _init, mark set_high_memory() as _init as well.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Of course, the second after I pressed intro I realized I missed:

 Reported-by: kernel test robot <lkp@intel.com>
 Closes: https://lore.kernel.org/oe-kbuild-all/202505060901.Qcs06UoB-lkp@intel.com/

@Andrew: Any chance you could squeeze those? Or should I send v2?

Thanks


-- 
Oscar Salvador
SUSE Labs
