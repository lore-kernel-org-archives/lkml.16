Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A852EA466
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445968; cv=none; b=eENcAYxZbAM28gihXKkauTD+UExcQVKxEzWb/xMrEODBJdmfh0NqgipuyReU0xcXxRzm1tQ8AkczLzoik5++0iWCa77sVsicH8XjMguBOiet1sydXURw9bA3f9O8Ra3FjDb2IDx269NFcFUfb4SUEhNJhEC4/L3kMqIxveVhfUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445968; c=relaxed/simple;
	bh=JeLnbyY2dQTg/A+SEJyHL4uN25xDCrtKzzPo1dmUSLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW+tmRtzfQ02HubhhibzsoMQeQ35gWdezrkmdXEWJJGZ8Na/BpsUj48dR4lh4DguCFETJxEEj1pvUdVa+PFD7iLU3IuAsFVy5H8FqG3nGhxvttTZcyhJdP9cWBUK6wPqtWvDqVsdbFm8ic0dTgN+kcC62gFcDSTTolA1hls9g1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YEuNqKNY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fA3ymKZ2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YEuNqKNY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fA3ymKZ2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YEuNqKNY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fA3ymKZ2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YEuNqKNY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fA3ymKZ2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 903E721201;
	Fri, 20 Jun 2025 18:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750445964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcdBWSrdiOeiTEuukcj+PpyH0Ha29phKzpomaCvvSfE=;
	b=YEuNqKNYxyl2y85Dnkrn+ugY06r0Wg8BQjJ/yq0G3IleH6i7Hk04SHGBXa05PtfnZlWg6n
	GZxmEJR2MsbD/grScqqCtM91AnyAaPPlLAwyw/RZwuAFR4Qyxs4rONPkFj83ql5VapDSzZ
	HaFkGzTaCMU4uni//LaOoCISMA9cM+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750445964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcdBWSrdiOeiTEuukcj+PpyH0Ha29phKzpomaCvvSfE=;
	b=fA3ymKZ25Y+Mzo2psbokdUhI5YkHV9EnNg9DWL+5XQeJLvswY+U+/BF7Eh65fGRbJ/YflJ
	IgG+sChMCMib7WCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750445964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcdBWSrdiOeiTEuukcj+PpyH0Ha29phKzpomaCvvSfE=;
	b=YEuNqKNYxyl2y85Dnkrn+ugY06r0Wg8BQjJ/yq0G3IleH6i7Hk04SHGBXa05PtfnZlWg6n
	GZxmEJR2MsbD/grScqqCtM91AnyAaPPlLAwyw/RZwuAFR4Qyxs4rONPkFj83ql5VapDSzZ
	HaFkGzTaCMU4uni//LaOoCISMA9cM+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750445964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcdBWSrdiOeiTEuukcj+PpyH0Ha29phKzpomaCvvSfE=;
	b=fA3ymKZ25Y+Mzo2psbokdUhI5YkHV9EnNg9DWL+5XQeJLvswY+U+/BF7Eh65fGRbJ/YflJ
	IgG+sChMCMib7WCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D41F136BA;
	Fri, 20 Jun 2025 18:59:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S0ilE4uvVWjbGQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 20 Jun 2025 18:59:23 +0000
Date: Fri, 20 Jun 2025 19:59:17 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Jakub Matena <matenajakub@gmail.com>, Wei Yang <richard.weiyang@gmail.com>, 
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <tc466z77itm7qps5exnelcp57dabnvn2gtd2tigutaivulmowh@4n74ymr5yxtg>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
 <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
 <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,suse.cz,google.com,oracle.com,infradead.org,surriel.com,nvidia.com,linux.alibaba.com,arm.com,gmail.com,kernel.org,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.30

On Tue, Jun 17, 2025 at 11:57:11AM +0100, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 10:45:53AM +0200, David Hildenbrand wrote:
> > mremap() is already an expensive operation ... so I think we need a pretty
> > convincing case to make this configurable by the user at all for each
> > individual mremap() invocation.
> 
> My measurements suggest, unless you hit a very unfortunate case of -huge
> faulted in range all mapped PTE- that the work involved is not all that
> much more substantial in terms of order of magnitude than a normal mremap()
> operation.
> 

Could you share your measurements and/or post them on the cover letter for the
next version?

If indeed it makes no practical difference, maybe we could try to enable it by
default and see what happens...

Or: separate but maybe awful idea, but if the problem is the number of VMAs
maybe we could try harder based on the map count? i.e if 
map_count > (max_map_count / 2), try to relocate anon.

-- 
Pedro
