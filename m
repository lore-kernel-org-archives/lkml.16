Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45319DF6A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105237; cv=none; b=S8Bo5uhCA+cfkBfeDU/94UysaCqLzX0nImN0B/lGoXoFHpAkhK8YNhicstdvSK7HrF/OiCz/xJxJI9uTk7Qrcr55tFzZtg/tkYCc2fTLUqp8/byp0LOy7ckRT3w/i4wscxEXdJEu/RUY8Ukj/eZTdlaU4p5cKi1z57mX6foBWLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105237; c=relaxed/simple;
	bh=P8XppRKg39EpgIxVoNEToTj1ICZcFEFWzzcSkKEhzQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ+igZw4Og8xBSgeXK8fvqp4m9enafMxPI2OiLgVjmFWapkBYfm+pl+fi6CAoh0coiWnvr2guNqnnkMslmOG+iqoKil0JTIw/bNAME1t7dthoFpZoP1dYkMmcB9kpI5UT7NfdyghIDKtCzuq5FvY+WWqErjlpBpxIzl0IQudrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c7kcmOvD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BsnSN175; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c7kcmOvD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BsnSN175; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c7kcmOvD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BsnSN175";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c7kcmOvD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BsnSN175"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B31F1F38D;
	Tue,  8 Apr 2025 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744105233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3p5sLGIP2X+bIKQwxkFToIWZYHS0thNE8Wr00aRmuo=;
	b=c7kcmOvD55KO7JBs+GQ6pLPC65XtRoDBvIn/4LR/a6HJX8a4rASgygAam6B4LQMIQ9YZNo
	QYhLLSV2LUZdpzYrJtZBD3uvAj3CJmizfmz+BmwsxMtg3j9YJXA3NJ0eUSUCjruZc7UkRh
	wOoXvSVWu2hrFFbuWBX13179Mt16d9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744105233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3p5sLGIP2X+bIKQwxkFToIWZYHS0thNE8Wr00aRmuo=;
	b=BsnSN1755pVmWtXzTeJSp0Pobu31O6gwkueisB8Y5+8tXZGNqWUbr6cFZRmEjT1icgWKF3
	S8bHLk9cMAOuyADA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744105233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3p5sLGIP2X+bIKQwxkFToIWZYHS0thNE8Wr00aRmuo=;
	b=c7kcmOvD55KO7JBs+GQ6pLPC65XtRoDBvIn/4LR/a6HJX8a4rASgygAam6B4LQMIQ9YZNo
	QYhLLSV2LUZdpzYrJtZBD3uvAj3CJmizfmz+BmwsxMtg3j9YJXA3NJ0eUSUCjruZc7UkRh
	wOoXvSVWu2hrFFbuWBX13179Mt16d9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744105233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3p5sLGIP2X+bIKQwxkFToIWZYHS0thNE8Wr00aRmuo=;
	b=BsnSN1755pVmWtXzTeJSp0Pobu31O6gwkueisB8Y5+8tXZGNqWUbr6cFZRmEjT1icgWKF3
	S8bHLk9cMAOuyADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A421C13A1E;
	Tue,  8 Apr 2025 09:40:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nFCLIxDv9Gd/aAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 08 Apr 2025 09:40:32 +0000
Date: Tue, 8 Apr 2025 11:40:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@redhat.com,
	mingo@kernel.org, yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z_TvDwA6xGfXMiED@localhost.localdomain>
References: <20250407030306.411977-1-bhe@redhat.com>
 <20250407030306.411977-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407030306.411977-2-bhe@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Mon, Apr 07, 2025 at 11:03:04AM +0800, Baoquan He wrote:
> Not like fault_in_readable() or fault_in_writeable(), in
> fault_in_safe_writeable() local variable 'start' is increased page
> by page to loop till the whole address range is handled. However,
> it mistakenly calcalates the size of handled range with 'uaddr - start'.
                ^^ calculates
> 
> Here fix the code bug in fault_in_safe_writeable(), and also adjusting
> the codes in fault_in_readable() and fault_in_writeable() to use local
> variable 'start' to loop so that codes in these three functions are
> consistent.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

The fix for the bug in fault_in_safe_writeable() looks good to me.
But I think that David suggested the other way around wrt. uaddr and
start variables in those three functions? I think he had in mind that
fault_in_safe_writeable() follows fault_in_safe_writeable() and
fault_in_readable() lead.

Other than that looks good to me.


-- 
Oscar Salvador
SUSE Labs
