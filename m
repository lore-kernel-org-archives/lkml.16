Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040F139D1B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138562; cv=none; b=nBnJeJgG22Iahkw/l8SismFV76WBShbV+S5RtVWJgpeTwtYwN6QrrL5DfbG6LuPlvOuA5to8/5cu7gxiMVMJszjkpgc2fWzzZKUWinR0imggcf10LskZ1L71fTN0duc3ddt+W6OCRzgvhgS8XKQc5nQQkjFSKd7BO2NfdSBKKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138562; c=relaxed/simple;
	bh=j2I5HPjje3AKt1Ou//WG0WQw6azjepSb5BA8XkYoWkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJUxBnXmXQy/L9A66TNDo7UpvaiuZLOvYC4DFxID9m+8p2Yz4H6f+d43WVV19YeFDPRvFf2oaO6QpsOqA/2PTdXgx370VL+wGhJtEQXhVUgsI3mB/iXU75lJhZxpsuaAsd6Pe8OxAz7IQx5rDB69cF0OKHw5eQOI2P2PN5H6lzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h3/wyj6M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rFF684kv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MO+UNPAH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T6WKg3aH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h3/wyj6M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rFF684kv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MO+UNPAH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T6WKg3aH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E8DB01F79E;
	Thu,  5 Jun 2025 15:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749138559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rlofmPthcRA/D9W6v16UwPgCUUgbG7AjjHITv/JqG+0=;
	b=h3/wyj6M1hBIgIgHbF5+NTYEMFDkupAss39qnzi1XWt51SaAdZah0UOFMTFbFC+u5cwyvz
	tPsgC2CBx6uUwsObP0ay86ODFgLFLMFAN1WLUY1uihOvuXBLhcNfTzpver3iRQLO/O/Wpn
	GHcJwLBOKPLly4cytGxSoKbotqqIkLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749138559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rlofmPthcRA/D9W6v16UwPgCUUgbG7AjjHITv/JqG+0=;
	b=rFF684kv8tv4t4bB/KAAGecRNkFgwmNO/QMhsfyQvvDGOfmpQLdlAppAqQ76UTKK+MdjVr
	ldz/JcJvoYS5CNAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MO+UNPAH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T6WKg3aH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749138558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rlofmPthcRA/D9W6v16UwPgCUUgbG7AjjHITv/JqG+0=;
	b=MO+UNPAHcAWDSDoDrPSmzofRTuHhMjx2WyDxENjP3vXsMNJgoF1tmF6d9rvAMadkdDxOzR
	SC2L+MNTaS8Tqt+00YtHe3T0xt62gL4cOzPSgonNxxAXWF45XG61wl24IAyCBqMZXb9xMW
	XPh6tD2h0y2eOWJYXzAAcc2CAlQNdsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749138558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rlofmPthcRA/D9W6v16UwPgCUUgbG7AjjHITv/JqG+0=;
	b=T6WKg3aHdjFzTW2q6PB9BWzky4PJlTdALKmfJAl7XLd8JpQv7pKAzVWnd8WNQiNvD3z/6K
	zJAZAAURuCa4xxCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E7291373E;
	Thu,  5 Jun 2025 15:49:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BtWZE368QWi4ZQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 15:49:18 +0000
Date: Thu, 5 Jun 2025 17:49:16 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/10] mm,memory_hotplug: Remove
 status_change_nid_normal and update documentation
Message-ID: <aEG8fLzv7M_mo71_@localhost.localdomain>
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-3-osalvador@suse.de>
 <86386d5d-e4f2-4ef4-8483-adf198046d1b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86386d5d-e4f2-4ef4-8483-adf198046d1b@redhat.com>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E8DB01F79E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Thu, Jun 05, 2025 at 04:54:00PM +0200, David Hildenbrand wrote:
> On 05.06.25 16:22, Oscar Salvador wrote:
> > Now that the last user of status_change_nid_normal is gone, we can remove it.
> > Update documentation accordingly.
> > 
> > Signed-off-by: Oscar Salvador <osalvador@suse.de>
> > ---
> >   Documentation/core-api/memory-hotplug.rst            |  3 ---
> >   .../translations/zh_CN/core-api/memory-hotplug.rst   |  3 ---
> 
> I'm running into similar issues with CN-only doc, which I will happily let
> bitrot, because I will not learn a new language just so I can update
> documentation.
> 
> ... I raised in the past that having CN doc in the tree is absurdly stupid.
> 
> In your case, likely removing the doc works.

Yeah, git send-mail wasn't happy about this one and screamed something
about encoding.
I was this close to completely disregard CN Docs, but since it was only
removing stuff, I went "meh, ok". :-)
I'm not entirely sure how uptodated are those though, not only for
memory-hotplug but for other parts of the kernel.
 

-- 
Oscar Salvador
SUSE Labs
