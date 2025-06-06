Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4628468B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196304; cv=none; b=Waq06ME2y6Z5306eXSi8/r4Mn7vB0UbF6yAsd3QQWNqRk4RG+p1LzlmTAI8jL44u47fMAqLD08CihbDRPwa+dmK7YBQGfY7Hr1cSodqrXzWyV0FDBp/WlEaJTHDE1Zni8FkiReiUsreJQNmofVmHMBfWk/tb74eLBBr+SPLSv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196304; c=relaxed/simple;
	bh=aKWaCYwDz1+bVvsuOEtWRHAykIFV2+vyZzfLCF7Fzw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3dvAWJtVXXEcdAoNjoYsZi/kHRxSEudvMeictkZ9cZbgqxN7wV0HKsyVwhjU87woMDDTW4pklCZKFmGPgCsje41+Zk2CfomIewCezhtmNh8h19nb/UPWxwflLOhMCJhSE3VeqZT6k+fQ8xkeNknyMq6JHuxI3LslnOnj/gv4+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GkVRhPLr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ixSCkc1r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jmAAtApL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=beYxy38h; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GkVRhPLr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ixSCkc1r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jmAAtApL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="beYxy38h"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B837D1F46E;
	Fri,  6 Jun 2025 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749196301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p6yHYzHnziYKvQVg+eB8bpqQd4mKjnL/fU2jPtSxu54=;
	b=GkVRhPLroLdWtsNbA5YzSxfvtZgfblc/YFZJBXOWJY5LOnE4338DeKZajyRixTgQTM7tjK
	bDpa2pc6LlSGKxJUgSakNLCYB4EklsOXWW115uQH4zVxZX5F63QnlGl0+XuMGviroo1Oy0
	lPCnuEzbO+nFv1GheNbZbCWaOEdRupE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749196301;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p6yHYzHnziYKvQVg+eB8bpqQd4mKjnL/fU2jPtSxu54=;
	b=ixSCkc1rIc01pV8FMKhPoDbOUGLc1IEd2YNMNbbeokAbTRYdoP/3uWxlrEGKW6KkYnVFN7
	o7M+7Uoqr6iuQvBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jmAAtApL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=beYxy38h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749196300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p6yHYzHnziYKvQVg+eB8bpqQd4mKjnL/fU2jPtSxu54=;
	b=jmAAtApLjrC/fAxcLtt7RO5MsLXbgc2J7L/PAfq/Xbei450Zs7BvxUrQR6hwhVYVvQ6afJ
	41Kb2JJO2s464NrxWXZr+Skj+in9N+h9Kop25K9pJLwjfLcjUb0txCgFXavDhVJ2rzlzzs
	w/fsDqVDV9MMsDQ428RHnohBc9TXwrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749196300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p6yHYzHnziYKvQVg+eB8bpqQd4mKjnL/fU2jPtSxu54=;
	b=beYxy38hcvWHQOOt+KVnko5USCV08ZrQwf+lj43luZOXqBO66VICAitwjJkW9K921MLCKs
	/IYcdZ72Qv+QYACg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2115B1336F;
	Fri,  6 Jun 2025 07:51:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fK1lBQyeQmioeAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 06 Jun 2025 07:51:40 +0000
Date: Fri, 6 Jun 2025 09:51:38 +0200
From: Oscar Salvador <osalvador@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] mm,slub: Use node-notifier instead of
 memory-notifier
Message-ID: <aEKeCg_xyTpZyA-P@localhost.localdomain>
References: <20250605142305.244465-5-osalvador@suse.de>
 <202506060918.HDCPogq9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506060918.HDCPogq9-lkp@intel.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B837D1F46E
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,lists.linux.dev,kvack.org,redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,vger.kernel.org];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -3.01
X-Spam-Level: 

On Fri, Jun 06, 2025 at 09:50:39AM +0800, kernel test robot wrote:
> Hi Oscar,
> 
> kernel test robot noticed the following build errors:

Fixed, see:

https://lore.kernel.org/linux-mm/aEKdvc8IWgSXSF8Q@localhost.localdomain/T/#mb3acf8bc17463f621f2b85d688817acd65cef042

Thanks

-- 
Oscar Salvador
SUSE Labs
