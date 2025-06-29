Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40E225403
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751227940; cv=none; b=IIBvLGEq5XxKyweM2DJCiKSmTkg7zYrQFo+15EbgEmavsTxfqxc2WoKUw+EFnWqaRpyC9OK193UvFSm7jXovnW+QNG8WmKMXjpkNh5k5n9igtVX1KrKqd1ZDZYPGjlq0FLpJebUUWABqedWKq6Vob3w0FRxXetVEifio9GRFrEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751227940; c=relaxed/simple;
	bh=USIIt7A2b6vicBbH5bQJqpFkvmWwoKntGkdnmfLMg6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxuaNfo7HSLf/5QuMAT+FFDdyHBUGPPvXHR1g/Ci8b5trXcWlH7I7ffA9C++dMFIS+ZH1Sb/ZYsMHAowPuAmpPGmYDZX/oEg2Krjo/YQSnMqICPshSQSh5qRx9z4ydE8sOxYFyawbJIpt4tjh1RDAurImkz+Ut6czOT6GYv0edU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GB0KM2/1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xw4btwkn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=avK499sz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aW2fV9Lh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GB0KM2/1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xw4btwkn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="avK499sz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aW2fV9Lh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3364821134;
	Sun, 29 Jun 2025 20:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751227930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RD7TdO2HeCjYIblBg/CwqWqjvW7c2eEyxbqJM11v5Wc=;
	b=GB0KM2/1W/awts4v7cAvU7dhABvVZNdel3wbNuG8BJI+C0qOzTjpqZ14kpVAn+gZUzNaod
	TKhfsN2d/TOmss9F7HuafmZi3Gq2dH3fEe53ul7+6y3Lf/y0c3UmuYlV8XUUhCI97sszPe
	DVm/dpABienzvmN9nu8dBaBUOiGwqtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751227930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RD7TdO2HeCjYIblBg/CwqWqjvW7c2eEyxbqJM11v5Wc=;
	b=Xw4btwknordpRMoFkHJQa0DCCn75Z5Ti8k97ry3qT3tk+FPhUGcroKocdvkUhcoqZjhLQw
	msWcDgt1Z3TmZADg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=avK499sz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aW2fV9Lh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751227929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RD7TdO2HeCjYIblBg/CwqWqjvW7c2eEyxbqJM11v5Wc=;
	b=avK499szWlTCq+oUuAQZmiUcDRTlBovVRKGD6g8++fJdzSOnLWC3WMO3d5xE4vqujvQi39
	o5OAd7aKYD/VPa+NhcXnSYFy8aXVnLkRz3x0c/O8f9Zv8Rld+WD8RzbutazpzYN4QAe/TV
	0AdidrVNNliX/FcNZ/PTI8GvE/lgxxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751227929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RD7TdO2HeCjYIblBg/CwqWqjvW7c2eEyxbqJM11v5Wc=;
	b=aW2fV9LhRUgA4cZ6GteUJJJxAA8SnrNFl2pMkCIEfyqDDZkQkRZkAGUSC9R6GTgjAXVcXt
	+1qRLmbzpDaV5VCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A939A13983;
	Sun, 29 Jun 2025 20:12:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 54syJhieYWgBRwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sun, 29 Jun 2025 20:12:08 +0000
Date: Sun, 29 Jun 2025 22:12:06 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Oscar Salvador <osalvador.vilardaga@gmail.com>
Cc: Gavin Guo <gavinguo@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] mm,hugetlb: Change mechanism to detect a COW on
 private mapping
Message-ID: <aGGeFrPwAxsu-f3F@localhost.localdomain>
References: <20250627102904.107202-1-osalvador@suse.de>
 <20250627102904.107202-2-osalvador@suse.de>
 <e8287af7-08bd-491c-bca8-70af107e0fea@igalia.com>
 <CAOXBz7gP9Zur3804zJhxFhSjprNc-gfi4vg7w2g07HA2S9EkcA@mail.gmail.com>
 <aGF8v50STTr3fV57@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGF8v50STTr3fV57@localhost.localdomain>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3364821134
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,localhost.localdomain:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid,suse.de:dkim]
X-Spam-Score: -3.01
X-Spam-Level: 

On Sun, Jun 29, 2025 at 07:49:51PM +0200, Oscar Salvador wrote:
> Are there any considerations to be taken before kicking in the test?
> I don't seem to be able to reproduce the issue.

Nevermind, I just wrote my own reproducer.
I see two ways of fixing this, the simpler being a trylock instead of a
lock, like the original code did.
I'll sleep on it and fix it tomorrow.
 

-- 
Oscar Salvador
SUSE Labs
