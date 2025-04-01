Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F28205E30
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519885; cv=none; b=C6RZdzmVTKkx9y53+8Tabltbkz92RqVp5rw2v0xaST9UNPHNhceugacUPsUJe58A7kM1f+32w161eq6kJwSFOVHATZzGLKQSaaifCu1DvpPPx/VVB21HWxzlCAFWEyyyv9sL70EdNNsVlvff8SHxskkl/VMY/2pdJ6E1cPHHovI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519885; c=relaxed/simple;
	bh=GVB7GIAIxpBB0w6eDuoeIMnelryz2yK+od497ZvHt3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7ht96lssorz8f9ppDpvCvKi+u90i60A2pN3BxjwEEK5uz5YKEkP/u/NgODJXuIcesUBiCy6zTKWAWjFF2hjb0+9ZnophaGiLIp66KsCtBXeGEjSoS7I03o3nKdi74aBVxL9gEKysa2xHt1J4387Ya6Ed+cd+KJBqjoL8qOAIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DNwglZO+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VeLsseZK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DNwglZO+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VeLsseZK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DNwglZO+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VeLsseZK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DNwglZO+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VeLsseZK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 651C02116F;
	Tue,  1 Apr 2025 15:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743519880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ad77S2Ye3mt6xDedl13LrbuI9sECQTLdCRjgBoHZqUk=;
	b=DNwglZO+aYxGO0i0tJFzvQwYaDDJMnqbUsf3Lp9YSc0tVzQ/5K89WFE9NgqPZGTGePdEvX
	s1FNcArfWJ8WLGUGZWcoF4U7RESOdPwj62Cx0CuqjeYACJWExxTahg6VQjakPKFsiQ0R0B
	nGIVTSvOfNfw5ApuBFnsAKz0WXt1MQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743519880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ad77S2Ye3mt6xDedl13LrbuI9sECQTLdCRjgBoHZqUk=;
	b=VeLsseZKMbFPiiAzIhymR7RbwpTPrZqHOuLsHM7G/lQ6KEQYk7GbwJAm3lU0hMOyVzg1F7
	im9t0a7IzW6sXjDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DNwglZO+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VeLsseZK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743519880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ad77S2Ye3mt6xDedl13LrbuI9sECQTLdCRjgBoHZqUk=;
	b=DNwglZO+aYxGO0i0tJFzvQwYaDDJMnqbUsf3Lp9YSc0tVzQ/5K89WFE9NgqPZGTGePdEvX
	s1FNcArfWJ8WLGUGZWcoF4U7RESOdPwj62Cx0CuqjeYACJWExxTahg6VQjakPKFsiQ0R0B
	nGIVTSvOfNfw5ApuBFnsAKz0WXt1MQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743519880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ad77S2Ye3mt6xDedl13LrbuI9sECQTLdCRjgBoHZqUk=;
	b=VeLsseZKMbFPiiAzIhymR7RbwpTPrZqHOuLsHM7G/lQ6KEQYk7GbwJAm3lU0hMOyVzg1F7
	im9t0a7IzW6sXjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E41F13691;
	Tue,  1 Apr 2025 15:04:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bcyzAIgA7GdXcgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 15:04:40 +0000
Date: Tue, 1 Apr 2025 17:04:38 +0200
From: Oscar Salvador <osalvador@suse.de>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, muchun.song@linux.dev
Subject: Re: [PATCH] mm/compaction: Use folio in hugetlb pathway
Message-ID: <Z-wAhtKxWBL-LTGJ@localhost.localdomain>
References: <20250401021025.637333-1-vishal.moola@gmail.com>
 <20250401021025.637333-2-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401021025.637333-2-vishal.moola@gmail.com>
X-Rspamd-Queue-Id: 651C02116F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,localhost.localdomain:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On Mon, Mar 31, 2025 at 07:10:25PM -0700, Vishal Moola (Oracle) wrote:
> Use a folio in the hugetlb pathway during the compaction migrate-able
> pageblock scan.
> 
> This removes a call to compound_head().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
