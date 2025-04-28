Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A3A94A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828483; cv=none; b=jXZkrFVpeyXj03OQTUy7R9Sk38lyP17ED88WNHWbobX8auABewA50VKYJMl+MDF4csFqlLUBimJlVfHY+DQKfuwSm07tlynXoHbjP0Khh69peYgSyHdxsMuTz66u0gFTqSKJ10THevWyC1PH9B2gv8LPz6UL7TCjPVyIbJ4wYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828483; c=relaxed/simple;
	bh=kOLotEy9ifmJEWGdDzcouKa7Zx459L0qksnA3q6JbrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuzP/ZsVoMMAn4EkoMSEZkCxh6J6lQYmHg3kz6nSxgklP4dvPlFESKxB3yrJdd9bOWtdgKoDCtuSU6B+R3vM9TryVoibd4oQ3vBcw5+geve65BYeAehc4J1ttqOh9r8fPb8qE6A4LZM6aOxO33S2MoiLp0uYkvVpf+U8r2cnoc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XYVo26ud; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d3v3SQli; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XYVo26ud; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d3v3SQli; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XYVo26ud";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d3v3SQli";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XYVo26ud";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d3v3SQli"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9276E21255;
	Mon, 28 Apr 2025 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745828473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jxPebaF3kiPUYQxRXvMQDBE+nUkuHfTh3XZdTAcceoM=;
	b=XYVo26udBArxSDxNmH1e+qCq9YxbyiMSToMVRJVyfKRsJDudCs5LsRbffQ3h3f2TT22gGg
	YGnEHkei2UNjLRnjWGMliOxe9skvsRR/+yD8Q1vtxrg5ucbTKIBU3PFEmKXNbEQRZU8BGO
	ZwEg8yPqdrisue2+liPFDROEJ0JVVNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745828473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jxPebaF3kiPUYQxRXvMQDBE+nUkuHfTh3XZdTAcceoM=;
	b=d3v3SQlinbqSrlP9NEetTR2ykulmJF4pJtrgBkoeFhDjmvM7hj3wPuqThTYs/370pnu3o3
	OzlWw5p0vIhnTvBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XYVo26ud;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d3v3SQli
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745828473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jxPebaF3kiPUYQxRXvMQDBE+nUkuHfTh3XZdTAcceoM=;
	b=XYVo26udBArxSDxNmH1e+qCq9YxbyiMSToMVRJVyfKRsJDudCs5LsRbffQ3h3f2TT22gGg
	YGnEHkei2UNjLRnjWGMliOxe9skvsRR/+yD8Q1vtxrg5ucbTKIBU3PFEmKXNbEQRZU8BGO
	ZwEg8yPqdrisue2+liPFDROEJ0JVVNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745828473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jxPebaF3kiPUYQxRXvMQDBE+nUkuHfTh3XZdTAcceoM=;
	b=d3v3SQlinbqSrlP9NEetTR2ykulmJF4pJtrgBkoeFhDjmvM7hj3wPuqThTYs/370pnu3o3
	OzlWw5p0vIhnTvBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 439551336F;
	Mon, 28 Apr 2025 08:21:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AcHsDXk6D2gafgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 28 Apr 2025 08:21:13 +0000
Date: Mon, 28 Apr 2025 10:21:11 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memory: fix mapcount / refcount sanity check for mTHP
 reuse
Message-ID: <aA86d6L6GhAjnri1@localhost.localdomain>
References: <20250425074325.61833-1-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425074325.61833-1-ryncsn@gmail.com>
X-Rspamd-Queue-Id: 9276E21255
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, Apr 25, 2025 at 03:43:25PM +0800, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The following WARNING was triggered during swap stress test with
> mTHP enabled:
... 
> The WARN_ON here is simply incorrect. The refcount here must be at least
> the mapcount, not the opposite. Each mapcount must have a corresponding
> refcount, but the refcount may increase if other components grab the
> folio, which is acceptable. Meanwhile, having a mapcount larger than
> refcount is a real problem.
> 
> So fix the WARN_ON condition.
> 
> Fixes: 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for PTE-mapped THP")
> Reported-by: Kairui Song <kasong@tencent.com>
> Closes: https://lore.kernel.org/all/CAMgjq7D+ea3eg9gRCVvRnto3Sv3_H3WVhupX4e=k8T5QAfBHbw@mail.gmail.com/
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
