Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBA8186E54
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610154; cv=none; b=iWBYYD4cG9oqikdJGSWnPOBmaP6MqfwiVvgOfQnAvoVMD3scpGLDoz/ugwOEh6EA1YvOnkrSt7k/M/r09D/hoV0Cra1GW3GLAtJ3LBxgWzNOQnArAwzhX8nh7b0RVdKHFwDbQ6/2TvYdy7hn7Ef6TJo4KotfBHi9UVidR673Mto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610154; c=relaxed/simple;
	bh=aGK6VuyhVTcGLnSoWqRmE8OCYseaGpTE/F6knDPLOE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wdyi0m6g8m8mz++9EiCgIwomUZmelqPh6FTRvJnuHIdf9at7NbCiZASH8c7wjgKEz7LZfeE8NGAfsnk384VwdfP+9Y1ebN7k85GNTArNowSbaRHJEzD/OQgImwUqhybqOr6DVOpJDCqzM+OSnV+R5kASlR/syhy3hnCPZ+/kcRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=snLsIEdx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=GLyguBU5; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=snLsIEdx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=GLyguBU5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="snLsIEdx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="GLyguBU5";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="snLsIEdx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="GLyguBU5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 724481F45A;
	Wed,  2 Apr 2025 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743610151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F7+GIzQ8OHuvK0ENVm30lwRC1Z8wp0ImGz1s6oiTw98=;
	b=snLsIEdxiZiVSVn1lfL9jemskrOzoO3Gmcyi96N7dUV4+fhCab6CXGg2Fs17M6/8rai0em
	vXcllv76zDrHOEn8GaqjrafZfMV6YbtTleVeeQNGJPqEaW0bSovkf2J0lNKeDKNXSrdXjv
	5c5SQj3sGPAA23IJ0J42zjcWyPJFetQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743610151;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F7+GIzQ8OHuvK0ENVm30lwRC1Z8wp0ImGz1s6oiTw98=;
	b=GLyguBU5CifJGC6vJzbaDVU6UAOBjPRgnf3ZrzncrTDK3Jz1rzxysBj39HtGfqhTFJGUR7
	xiwQgfVd0Kj6GFDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=snLsIEdx;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=GLyguBU5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743610151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F7+GIzQ8OHuvK0ENVm30lwRC1Z8wp0ImGz1s6oiTw98=;
	b=snLsIEdxiZiVSVn1lfL9jemskrOzoO3Gmcyi96N7dUV4+fhCab6CXGg2Fs17M6/8rai0em
	vXcllv76zDrHOEn8GaqjrafZfMV6YbtTleVeeQNGJPqEaW0bSovkf2J0lNKeDKNXSrdXjv
	5c5SQj3sGPAA23IJ0J42zjcWyPJFetQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743610151;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F7+GIzQ8OHuvK0ENVm30lwRC1Z8wp0ImGz1s6oiTw98=;
	b=GLyguBU5CifJGC6vJzbaDVU6UAOBjPRgnf3ZrzncrTDK3Jz1rzxysBj39HtGfqhTFJGUR7
	xiwQgfVd0Kj6GFDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9D5E13A4B;
	Wed,  2 Apr 2025 16:09:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fHiJLCZh7WejTgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 02 Apr 2025 16:09:10 +0000
Message-ID: <5d16736e-4cb0-46c7-9c3e-715bbff3613f@suse.cz>
Date: Wed, 2 Apr 2025 18:09:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm,memory_hotplug: Replace status_change_nid
 parameter in memory_notify
Content-Language: en-US
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-3-osalvador@suse.de>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250401092716.537512-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 724481F45A
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,gmail.com,suse.com,intel.com,huawei.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/1/25 11:27, Oscar Salvador wrote:
> memory notify consumers are only interested in which node the memory we
> are adding belongs to, so replace current status_change_nid{_normal} fields
> with only one that specifies the node.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>


