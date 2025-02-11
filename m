Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA1B250BE8
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285057; cv=none; b=vGTWQozIHfY8/ZOWgD0nVzST1mp11jiTZ57b2HcvX/DjdH9EbQcNRuSMPLzsyGOoeY80pMAX9u/Gj3pgzbU1Xz0PZhu4TPWEpzTu3z4akSZiXZZ57R4ooiWStwVuJfHfPYx3ELMoS2DcaLWo4874jS0VHVNdA1keJPBLZ1LayDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285057; c=relaxed/simple;
	bh=vjfDnYaWCZpLDC56FJHXYZRMFRPgV3w+WCdNlEZ3lvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpIm5U6mspVx+RGSthIwa4g9LbUWU6XNimsYcnpkNTafckYwFFzqaO4rfdz07cjjWARsUCf9IPhnor1bS/GgYZhxxRXTiajyKUuMEWZSi8FBJ/nzpUz+z+qPVFgDK8+rIPeYytk51X9/wL/b3xlcTZd6g3zX4h1yWmeQZ265/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CGs2qt6H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xNoomN6g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CGs2qt6H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xNoomN6g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CGs2qt6H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xNoomN6g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CGs2qt6H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xNoomN6g"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D51837BB9;
	Tue, 11 Feb 2025 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739264821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8EHwpFMgnQTMFDGbQ7ioc0kI0aQeegDwSdSybRlzhvk=;
	b=CGs2qt6HbYEaxiFdCLfq7v+gdMKNAnBRzjzM2FGasNSFSoxBC4OiuG22I04W3ps1rrDPaL
	WrvYIeTz1rB2/sdThex5OV9Afyh7xf51ROHfJWvxPqi9faxAxRZpyy4waZWVXFFrKAXDp0
	YnP0I5ILY6ZzZbp/PQSDJeuhhT/fUi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739264821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8EHwpFMgnQTMFDGbQ7ioc0kI0aQeegDwSdSybRlzhvk=;
	b=xNoomN6gjpilQeBMGVFZEEnDsJ9U5D5d030LD2dh5DtVwMgRoF8dtPH44y16Op0E5mIi0A
	Tlj/2b3wZdujOVDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CGs2qt6H;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xNoomN6g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739264821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8EHwpFMgnQTMFDGbQ7ioc0kI0aQeegDwSdSybRlzhvk=;
	b=CGs2qt6HbYEaxiFdCLfq7v+gdMKNAnBRzjzM2FGasNSFSoxBC4OiuG22I04W3ps1rrDPaL
	WrvYIeTz1rB2/sdThex5OV9Afyh7xf51ROHfJWvxPqi9faxAxRZpyy4waZWVXFFrKAXDp0
	YnP0I5ILY6ZzZbp/PQSDJeuhhT/fUi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739264821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8EHwpFMgnQTMFDGbQ7ioc0kI0aQeegDwSdSybRlzhvk=;
	b=xNoomN6gjpilQeBMGVFZEEnDsJ9U5D5d030LD2dh5DtVwMgRoF8dtPH44y16Op0E5mIi0A
	Tlj/2b3wZdujOVDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DA5E13782;
	Tue, 11 Feb 2025 09:07:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vTezGzQTq2cqXgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 11 Feb 2025 09:07:00 +0000
Date: Tue, 11 Feb 2025 10:06:54 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: linux-kernel@vger.kernel.org, yaozhenguo1@gmail.com,
	muchun.song@linux.dev, linux-mm@kvack.org,
	akpm@linux-foundation.org, david@redhat.com, rppt@kernel.org,
	fvdl@google.com
Subject: Re: [PATCH] mm: hugetlb: avoid fallback for specific node allocation
 of 1G pages
Message-ID: <Z6sTLjKlX39s0Mo_@localhost.localdomain>
References: <20250211034856.629371-1-luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211034856.629371-1-luizcap@redhat.com>
X-Rspamd-Queue-Id: 0D51837BB9
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.dev,kvack.org,linux-foundation.org,redhat.com,kernel.org,google.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Feb 10, 2025 at 10:48:56PM -0500, Luiz Capitulino wrote:
> When using the HugeTLB kernel command-line to allocate 1G pages from
> a specific node, such as:
> 
>    default_hugepagesz=1G hugepages=1:1
> 
> If node 1 happens to not have enough memory for the requested number of
> 1G pages, the allocation falls back to other nodes. A quick way to
> reproduce this is by creating a KVM guest with a memory-less node and
> trying to allocate 1 1G page from it. Instead of failing, the allocation
> will fallback to other nodes.
> 
> This defeats the purpose of node specific allocation. Also, specific
> node allocation for 2M pages don't have this behavior: the allocation
> will just fail for the pages it can't satisfy.
> 
> This issue happens because HugeTLB calls memblock_alloc_try_nid_raw()
> for 1G boot-time allocation as this function falls back to other nodes
> if the allocation can't be satisfied. Use memblock_alloc_exact_nid_raw()
> instead, which ensures that the allocation will only be satisfied from
> the specified node.
> 
> Fixes: b5389086ad7b ("hugetlbfs: extend the definition of hugepages parameter to support node allocation")
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Acked-by: Oscar Salvador <osalvador@suse.de>

This was discussed yesterday in [1], ccing Frank for awareness.

[1] https://patchwork.kernel.org/project/linux-mm/patch/20250206185109.1210657-6-fvdl@google.com/


-- 
Oscar Salvador
SUSE Labs
