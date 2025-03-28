Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DD1A841C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169294; cv=none; b=ZNDAgyLzrW7wnkfffTZn5WAgGq2Mooatpw76sXPGZ3Zs7OIqe4ZL2ve6M9VR0tzAjUNl1qYWJRCFdC6ZYUUb6bxJwXNK7UKDDQXSp7pzXQE8JT41ey5eRnrEnMj2fyy4zL7K5gTKIhDpAL9w+HUifZKDbFYwzSznZYdn22v6n/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169294; c=relaxed/simple;
	bh=GU5KnJ7mTTzj4ExFhm8gr2zJJks1qa1OtoOLnl3k3CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaVzyuE3HgEa+ko+hkdPTqX82XQMRY8KdTVrYlWM1OLeMDfyBpxRKSCmkGmbcmzGbwDGwivhMdOgpCFJEnEr0KjLNPoJbnXZyIwqeYGRfkstROGwx32k8AcajuAvFamLy0nv2lWK3RXGG7KDb4Vw8q6WRzTtG70/WNJv3c3ect0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j2toeNh8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Bo1P7sW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iNfQb7Ky; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k5F9OSjG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j2toeNh8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Bo1P7sW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iNfQb7Ky";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k5F9OSjG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E56BB211A8;
	Fri, 28 Mar 2025 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743169291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MBso25A4j+vQm/GwU67tTVb2zT40od14o/qULil9ik=;
	b=j2toeNh8uRilKu1yZeLXm95GObbEpL4rZPERZH5iYs+dQC+Pb2i89pvrO19L3n7V6Qo70A
	S7YqT0vkgJT+kNzVpV7lmobNCXhVOjopuVB2UKxOpb+z5g09hfk2WOJWmMhC9bsQP9RnvL
	IATClCWVRG5RxavFGTfrqN2xAPw7zTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743169291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MBso25A4j+vQm/GwU67tTVb2zT40od14o/qULil9ik=;
	b=5Bo1P7sWxsWQm8oEJm6OF174PQ+vEsaNCs/mLT0e7VCF7KCYonqi13TMEsVzKvwOUY/z6q
	cjsonYOIJwl9UXBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iNfQb7Ky;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=k5F9OSjG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743169290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MBso25A4j+vQm/GwU67tTVb2zT40od14o/qULil9ik=;
	b=iNfQb7KyrDHn/ekPK68bbRCnsRGJG0N1+bsk5mKiG/bmL3yfJo4y+Cvio3U1qFl/ONMrpr
	YqQJ1QeasM7EWAIroeJBna1MmF5pmWJ8JViuwPPNRTtKLNm0UHWES6ESBMqfNLltntZRWL
	Obl5VqidJUeApq2DoZk5vEvtVCcRwJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743169290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MBso25A4j+vQm/GwU67tTVb2zT40od14o/qULil9ik=;
	b=k5F9OSjGAut1QFBPfUa4lDN2pvC4KO9iX9VmkKt8mm6ev4FCnmfFi6kAwLFKYEdT9Is276
	NOrS5PgmhNO47wAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BC8E13998;
	Fri, 28 Mar 2025 13:41:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b0mIOwmn5meyZwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 28 Mar 2025 13:41:29 +0000
Date: Fri, 28 Mar 2025 14:41:28 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Simon Wang =?utf-8?B?KOeOi+S8oOWbvSk=?= <wangchuanguo@inspur.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: migrate: restore the nmask after successfully
 allocating on the  target node
Message-ID: <Z-anCNiJwtFNLtmm@localhost.localdomain>
References: <9e14314cd04645409699ece39443765a@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e14314cd04645409699ece39443765a@inspur.com>
X-Rspamd-Queue-Id: E56BB211A8
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Wed, Mar 26, 2025 at 05:54:35AM +0000, Simon Wang (王传国) wrote:
> 
> > On Wed, Mar 26, 2025 at 11:12:18AM +0800, wangchuanguo wrote:
> > > If memory is successfully allocated on the target node and the
> > > function directly returns without value restore for nmask, non-first
> > > migration operations in migrate_pages() by again label may ignore the
> > > nmask settings, thereby allowing new memory allocations for migration
> > > on any node.
> > 
> > I have no opinion on whether this is the right thing to do or not, but if it is
> >
> 
> I don't think so. When memory allocation fails on the target node, there is already a recovery operation for the nmask value below. Therefore, the nmask value should only be restored when memory allocation is successfully completed on the target node.

But that is not what the code is doing, is it? With the changes applied I mean.
You are restoring mtc->nmask in case you managed to allocate for __GFP_THISNODE
and after you clear the flag, so we might as well do it just once at the beginning
after calling alloc_migration_target for the first time.


-- 
Oscar Salvador
SUSE Labs
