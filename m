Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD04C290BBB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360165; cv=none; b=BATE+WWsr1jobaQFKly/yxyJ1mKk/yYhOvfOqg0Jhx/seWqZQHeXoAvss/HYocBMzxcl7b+N1cVF/DCNPphLYds6n7gi6C2cLCU9lFozT59ZA2u+1N7v1BIBWTdjPCnRZCVE0BHxCQmlKS+BUQyoNgCd8dTs/czlpZpfSUGysTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360165; c=relaxed/simple;
	bh=PqYiNIq60sVsOxnoPxNWrX6kwiBdVsu9ypXudCyVCpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHgZRu0q+oX79NMc0lenMys1VphKHMOXSBWuSmlK+v+V0VXVLSzEB6uOkdD/9RDGaaG7GX6087kY9im1VUhAswgi69jI6ZFKcVfG0QUgc1ITJhJSbedDJIGYdjPGnQEmy6SNkiYzGfCOb/ifPCGGVPE2MFknbRLw0lbCRsu6SGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cUJsOhhT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SgMFKkEy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cUJsOhhT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SgMFKkEy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cUJsOhhT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SgMFKkEy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cUJsOhhT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SgMFKkEy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD0571F453;
	Fri, 11 Apr 2025 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744360161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JFELNZmbQXoKDlYSfQlfDzt9sNLftVYwoaimOzUeLE=;
	b=cUJsOhhTRBXqWkuYDitSdRfcY6eDnIziQlRDUjtYnLo0PQSLUIj2wWbSrstGzcc9hen1Hz
	N66W0tUOQ4bHX42wkMOzvKnKj9erxOFoGYqpRwI41/F2eEOz6oRuuZtjncRTVZeqffzFKA
	xoTceFIvqxWWPjohiJHj/WujzAdo6Hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744360161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JFELNZmbQXoKDlYSfQlfDzt9sNLftVYwoaimOzUeLE=;
	b=SgMFKkEyKGXVyepkOEcslfDdZezPvPbqqWt5pIlrcNbbgv1DMEhe6ksQKPOeibBPizQLh+
	+2A6c+A2pBDb3jCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744360161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JFELNZmbQXoKDlYSfQlfDzt9sNLftVYwoaimOzUeLE=;
	b=cUJsOhhTRBXqWkuYDitSdRfcY6eDnIziQlRDUjtYnLo0PQSLUIj2wWbSrstGzcc9hen1Hz
	N66W0tUOQ4bHX42wkMOzvKnKj9erxOFoGYqpRwI41/F2eEOz6oRuuZtjncRTVZeqffzFKA
	xoTceFIvqxWWPjohiJHj/WujzAdo6Hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744360161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JFELNZmbQXoKDlYSfQlfDzt9sNLftVYwoaimOzUeLE=;
	b=SgMFKkEyKGXVyepkOEcslfDdZezPvPbqqWt5pIlrcNbbgv1DMEhe6ksQKPOeibBPizQLh+
	+2A6c+A2pBDb3jCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25B93136A4;
	Fri, 11 Apr 2025 08:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KsxFBuHS+GeAFAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 11 Apr 2025 08:29:21 +0000
Date: Fri, 11 Apr 2025 10:29:04 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Gavin Shan <gshan@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, adityag@linux.ibm.com,
	donettom@linux.ibm.com, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	shan.gavin@gmail.com
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
Message-ID: <Z_jS0J4HmEreh-7J@localhost.localdomain>
References: <20250410125110.1232329-1-gshan@redhat.com>
 <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
 <Z_fNx7hTOR8St0SM@localhost.localdomain>
 <Z_fR6c4o1V57ZAXR@localhost.localdomain>
 <a950dd20-d7eb-429b-b638-2df68208918d@redhat.com>
 <44dff493-9d79-4343-ba81-0c262d7a5b4e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44dff493-9d79-4343-ba81-0c262d7a5b4e@redhat.com>
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,linux.ibm.com,linuxfoundation.org,kernel.org,linux-foundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, Apr 11, 2025 at 03:04:16PM +1000, Gavin Shan wrote:
> I think it's a good point. Tried a quick test on a ARM64 machine whose memory
> capacity is 1TB. Leaping 'nr' by 'sections_per_block' improves the performance a bit,
> even it's not too much. The time taken by memory_dev_init() drops from 110ms to 100ms.
> For the IBM Power9 machine (64GB memory) I have, there are not too much space to be
> improved because the time taken by memory_dev_init() is only 10ms. I will post a patch
> for review after this patch gets merged, if you agree.

I have a patch that looked pretty much the same because I wanted to try
it out after commenting it to David, to see the "gains".
On a x86 system with 100GB and memory-blocks spanning 8 sections, I saw
a gain of 12us.
Of course, that kinda of accumulates wrt. memory capacity.

 

-- 
Oscar Salvador
SUSE Labs
