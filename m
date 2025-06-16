Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D626D4D5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078546; cv=none; b=I4GaDjYB+hc9jLjXCtLfBDORgI4y1UvE9kEAl64hsP0HCj1yHf/wVARat872FxXYwOSppRiTtqdl6UtM33YuCiFCM5X/7wv/qAmAJU8G1Pr4nUt7jMT/mZGdzsZ257sUfOsV9MaeH0R4X5DA9DEtLKvZCFwS1cW6PAeMo7XnpwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078546; c=relaxed/simple;
	bh=WmKoM4XcL/w/hrbpNUMW1bYwHRsA/hhEzOy4Wz0xO6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAx7NwWGCgrPyUq2G5J9E6Yjp4xwkeoRuW8QvY5v4U3GEkW8HtHyYL1gNAyER4cb2JAmx54j2Ghz6oGSEcKZF1EXgNui2YXRL7qM40KCDSDEgynxfSrYP/xmj0uTbFCDJG0Sj1oGyT2AAXUl6y4maqqwgVbS99e9cvg7cIyVRNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ch62BoVB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kx+epzwR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ch62BoVB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kx+epzwR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ch62BoVB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kx+epzwR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ch62BoVB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kx+epzwR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B8531F394;
	Mon, 16 Jun 2025 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750078542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0kTZijOP/eg1k630Bl0eRX0hA5QB8mAiiv3COWgNQAQ=;
	b=Ch62BoVBsb6apvaLdPvXDZINkZ2FObsqokC31d8t7nGfe6wEM36Fv+vWxDurz5rHsVODRk
	subjHPMAjfR6jeQ74eqs1Y9M9HOjM4ZQZddy17QqntzlZiOKOxi+5pSNHbkpVh7m33fu8U
	5YqmPDRTJfKW47XBNfG9KLk//dPv12Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750078542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0kTZijOP/eg1k630Bl0eRX0hA5QB8mAiiv3COWgNQAQ=;
	b=kx+epzwRGFOGwAgUSlFBSwgRK4lcc67Q7TZyBnbnI03PYR6bFwXY59fPr+Lbs/2FUu+ZJY
	H+80N0i2TODurjBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750078542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0kTZijOP/eg1k630Bl0eRX0hA5QB8mAiiv3COWgNQAQ=;
	b=Ch62BoVBsb6apvaLdPvXDZINkZ2FObsqokC31d8t7nGfe6wEM36Fv+vWxDurz5rHsVODRk
	subjHPMAjfR6jeQ74eqs1Y9M9HOjM4ZQZddy17QqntzlZiOKOxi+5pSNHbkpVh7m33fu8U
	5YqmPDRTJfKW47XBNfG9KLk//dPv12Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750078542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0kTZijOP/eg1k630Bl0eRX0hA5QB8mAiiv3COWgNQAQ=;
	b=kx+epzwRGFOGwAgUSlFBSwgRK4lcc67Q7TZyBnbnI03PYR6bFwXY59fPr+Lbs/2FUu+ZJY
	H+80N0i2TODurjBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A95BC139E2;
	Mon, 16 Jun 2025 12:55:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bba6Jk0UUGiyEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 12:55:41 +0000
Date: Mon, 16 Jun 2025 14:55:40 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aFAUTPUOsi8dxAkY@localhost.localdomain>
References: <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
 <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
 <aE_a4_rGbMLJKBIs@localhost.localdomain>
 <360f2f04-4542-4595-bf36-c45ed10335af@redhat.com>
 <aFADwYs9LcyK5tVn@localhost.localdomain>
 <23431108-b5b8-4c8a-8869-8f994371e7a5@redhat.com>
 <aFAO9igZQ7yP1m7A@localhost.localdomain>
 <400b4d5a-8973-4301-a86b-41e1b412a3da@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <400b4d5a-8973-4301-a86b-41e1b412a3da@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, Jun 16, 2025 at 02:35:54PM +0200, David Hildenbrand wrote:
> Looks cleaner to me at least :)

Alright then, let's that route :-)
 

-- 
Oscar Salvador
SUSE Labs
