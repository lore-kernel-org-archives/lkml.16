Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F55139D1B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172283; cv=none; b=bv0neI542JTZXWDmlo8V4WFHVhFey/0+GjnxEBc7boKfB+9r0moap0suou+cuc8W7qgSt4EgizxjiIfTMHlFLnzN4RfjK9QFS/xwpn96PG4zu9XNNvKA2O32QJ1Ok+WZLfazVZEivYtwt2KcNMNIpGj7NKRQO55Yxn1FWk/MCd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172283; c=relaxed/simple;
	bh=Rd0OXgda9M1rTVKqs0ju+giyiR7S3cAysIoNUe/Wx2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCpJ4FXazz8NtJBc+nfGIE4YJVY9mBF9t2lTPQUaIsPCdZaDDtL/Y8MOPorc94Xqa4HvuzDoOVExga+bDCKqMBzxIRFeCz4D37MRiw28tr3eVm4wOVfqNIMhKPgNEljO/M9ST2Ad475uZJx4h+/ieLTBBCQilf1tQBZ5Khr4yiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BThyNa/H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLQnx63c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BThyNa/H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLQnx63c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BThyNa/H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLQnx63c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BThyNa/H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLQnx63c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C70C211B0;
	Tue, 17 Jun 2025 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750172279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oxbsJPKMCRy8qLfecuQJVS1ieougPY8e6ctyg9yMaWw=;
	b=BThyNa/HC6upmOASxsC7FgqNKTWRb9eIoZ48KDX0Z8x78ra6tT+6iZzyr4IKycU9jeRIkq
	j4DJNCH7wyUw/hv2HQVjmtq/npzdkSibzYBfn6rG0sgR03Lcx5wgvkKslULe2F2y3Ll11G
	aPrk1BXqPwc7T4R/+R/0IUXPaXD4rQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750172279;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oxbsJPKMCRy8qLfecuQJVS1ieougPY8e6ctyg9yMaWw=;
	b=PLQnx63c1OdDKeZ/iK9bWgWiLok29djlzYO9JqzrR9Sdb0QCL8ahrlifJ33ESMJFghN5YJ
	H/+RtXNYB+tux2CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="BThyNa/H";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PLQnx63c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750172279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oxbsJPKMCRy8qLfecuQJVS1ieougPY8e6ctyg9yMaWw=;
	b=BThyNa/HC6upmOASxsC7FgqNKTWRb9eIoZ48KDX0Z8x78ra6tT+6iZzyr4IKycU9jeRIkq
	j4DJNCH7wyUw/hv2HQVjmtq/npzdkSibzYBfn6rG0sgR03Lcx5wgvkKslULe2F2y3Ll11G
	aPrk1BXqPwc7T4R/+R/0IUXPaXD4rQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750172279;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oxbsJPKMCRy8qLfecuQJVS1ieougPY8e6ctyg9yMaWw=;
	b=PLQnx63c1OdDKeZ/iK9bWgWiLok29djlzYO9JqzrR9Sdb0QCL8ahrlifJ33ESMJFghN5YJ
	H/+RtXNYB+tux2CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2080139E2;
	Tue, 17 Jun 2025 14:57:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1pYoMHaCUWgkcwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 17 Jun 2025 14:57:58 +0000
Date: Tue, 17 Jun 2025 15:57:53 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: add additional mmap-related files to
 mmap section
Message-ID: <gbr6rp2wn3yrgqinccw6qjheyvlchaso43rxz7hyd6ei7mr3rn@v7gccuyt75mx>
References: <20250617144130.147847-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617144130.147847-1-lorenzo.stoakes@oracle.com>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6C70C211B0
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.01

On Tue, Jun 17, 2025 at 03:41:30PM +0100, Lorenzo Stoakes wrote:
> msync and nommu are directly related to memory mapping, mincore is less so
> but all are roughly speaking operating on virtual memory mappings from the
> point of view of the user so this seems the most appropriate place for
> them.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Looks good, thanks!

-- 
Pedro
