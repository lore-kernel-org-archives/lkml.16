Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672EF1E1DEE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771404; cv=none; b=rBVrqSdn9LHAPRQxDmfRun0sQcgKOkDaNjICVBhv9+omYgQMz+3BJpqaF1liDugMepVWPpqw6BdzGkAh728eRKVvFqaTuQP6yVZWlkWEylAOHiMtE4F2qDZTZ7sHewma2Z3L0MA7hPKhd8CW4qH1XMmVUyguyR+xu72Y0VuRl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771404; c=relaxed/simple;
	bh=CXyz2bd8bKT2FJ5Ru9cMoc3BMbqpCKGLNunoazCUkaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYrIejig+Z589b+bE5sUYBBOsv/YSleCHnOCgI+HWY1GMaKr2NtpR/a1mu283yXIUOos3FgUru1nzgnQeDmt0FEFxL7uZiZU/onbvI4O3Qeqa/fxEY77yre59NhleiIofj3Hd35zSGAhpa11AxTzXBiVfY+AzQuVwEmk9/jCJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c78OxrVm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1COTDiaT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c78OxrVm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1COTDiaT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c78OxrVm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1COTDiaT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c78OxrVm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1COTDiaT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7129021170;
	Fri,  4 Apr 2025 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743771401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rfjqoDJYEhzm4CPjo42uGV1n+giaq0nT5awowVQ0jCw=;
	b=c78OxrVmM97t75aXmSi7XxJ3/JpLsoMeLVYvVRKKIimKsSxRWgmAUeDgF1MFy+W8mnlX7w
	IrTZmVfZXR3psPpWqiPXd7irA9BR2CZzmwE/z9koVwBMguE2KiexQtuhYyftG7OEqc4BCA
	PBohFWsdwCpi9SJaaxS5fgMxYtBS/+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743771401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rfjqoDJYEhzm4CPjo42uGV1n+giaq0nT5awowVQ0jCw=;
	b=1COTDiaTm82sP/n/IzZppWjN6cY7t9LrJ84SeWFxsYLyAwqqYwxkprMvqMW+wm/oGZnpVo
	WYhbp140iTfgDdCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c78OxrVm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1COTDiaT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743771401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rfjqoDJYEhzm4CPjo42uGV1n+giaq0nT5awowVQ0jCw=;
	b=c78OxrVmM97t75aXmSi7XxJ3/JpLsoMeLVYvVRKKIimKsSxRWgmAUeDgF1MFy+W8mnlX7w
	IrTZmVfZXR3psPpWqiPXd7irA9BR2CZzmwE/z9koVwBMguE2KiexQtuhYyftG7OEqc4BCA
	PBohFWsdwCpi9SJaaxS5fgMxYtBS/+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743771401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rfjqoDJYEhzm4CPjo42uGV1n+giaq0nT5awowVQ0jCw=;
	b=1COTDiaTm82sP/n/IzZppWjN6cY7t9LrJ84SeWFxsYLyAwqqYwxkprMvqMW+wm/oGZnpVo
	WYhbp140iTfgDdCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8780F13691;
	Fri,  4 Apr 2025 12:56:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R0r2HQjX72cIUgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 04 Apr 2025 12:56:40 +0000
Date: Fri, 4 Apr 2025 14:56:34 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, mkoutny@suse.com,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 1/2] mm,memory_hotplug: Implement numa node notifier
Message-ID: <Z-_XAjHdG5nd-xEH@localhost.localdomain>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-2-osalvador@suse.de>
 <9d5567ee-8c48-4fbd-97fd-d13f28325621@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d5567ee-8c48-4fbd-97fd-d13f28325621@redhat.com>
X-Rspamd-Queue-Id: 7129021170
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kvack.org,vger.kernel.org,suse.cz,gmail.com,suse.com,intel.com,huawei.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, Apr 04, 2025 at 12:09:39PM +0200, David Hildenbrand wrote:
> Assuming we can remove the _normal stuff and we can do what we do in patch
> #2 here already ... meaning we unconditionally store the nid in the MEM
> notifier ...
> 
> What about extending the existing memory notifier instead?
> 
> That is, we add
> 
> MEM_NODE_BECOMING_MEM_AWARE ... and trigger it using the same notifier
> chain. We only have to make sure these new events will be properly filtered
> out (IIRC, for most we do that already).
> 
> Of course, the range will not apply to these events, but the nid would apply
> to all.

But that would defeat the purpose of having a diferent notifier for
those only interested in node changes, which is not having to bother at
all with unrelated notifications.

Yes, the handling would be simpler than it is now, but honestly I still see value
in having them both decoupled from eacher other, I think it is cleaner
and expresses in a more clear way the change of what the consumer is interested in
get notified for.

Unless there is a strong objection, I would pursue that path, getting
rid of the _normal stuff for slub along the way.
 

-- 
Oscar Salvador
SUSE Labs
