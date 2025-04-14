Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAF25D52D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620217; cv=none; b=WkTbwM8OxOa0f2vA3WmXjy0wLtxhDQ4irgJLocNq6cd0e3jdEVrv5MfdQ5yWJYEmHN6XLhJBGO8FUe+hpY1kxYiar13y6uyBFB3PJXK10eJB10ijnD5p9viFHZJbX+9L01ZhkO/+aDv4fRuOQQQPKE2dT4F0OC+aaY2s/W4W7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620217; c=relaxed/simple;
	bh=AwgKm8kvP2a4PUSc9WNl5iIsdlsfHWGIBQqXHjp2bEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7Qgwv3jJCfrmWtvxF9xV8xR+J8QgTs/Cftw1TU+yQ0pMZSrRjzgjbzVardwyY/xvbcX4EQaKaXlURaFFWx6i6+/nmToEZFp+YtgGufbpFtc0ci+aSNGH4CkOKH+x4o/QZ3JS+7kUUfHlqJ8HJjI8ciflBtz7v9GWaw7ZeAYzNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cMY0c5au; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HqYieTUq; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cMY0c5au; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HqYieTUq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cMY0c5au";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HqYieTUq";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cMY0c5au";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HqYieTUq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 14AA521228;
	Mon, 14 Apr 2025 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744620214;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvjQtz75tDEkQA+bj18RK+CDB7e9yCet6uptqL/3LjY=;
	b=cMY0c5auBMELfot1AMzpxdSKzQto7Fz75mz/14AwFhaLvfN9mWLXYSuY/ptfZdxBRz/In+
	HEB5n7bL1pq5bGjW4b/SNalB6HErDK3iF9k890rgRsygtfcSqj4SK/2jQIHgl/7Aot3xID
	i9QnCA+QD0hxCdHt3bPc2Cvzth2U9no=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744620214;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvjQtz75tDEkQA+bj18RK+CDB7e9yCet6uptqL/3LjY=;
	b=HqYieTUqBvWYaGSd3RFYff42KtgPI/5/sO2135FbcDdjgA/C/15fptT4sBXRGjPLVVyymg
	uh55axNz4PtavaAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=cMY0c5au;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=HqYieTUq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744620214;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvjQtz75tDEkQA+bj18RK+CDB7e9yCet6uptqL/3LjY=;
	b=cMY0c5auBMELfot1AMzpxdSKzQto7Fz75mz/14AwFhaLvfN9mWLXYSuY/ptfZdxBRz/In+
	HEB5n7bL1pq5bGjW4b/SNalB6HErDK3iF9k890rgRsygtfcSqj4SK/2jQIHgl/7Aot3xID
	i9QnCA+QD0hxCdHt3bPc2Cvzth2U9no=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744620214;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvjQtz75tDEkQA+bj18RK+CDB7e9yCet6uptqL/3LjY=;
	b=HqYieTUqBvWYaGSd3RFYff42KtgPI/5/sO2135FbcDdjgA/C/15fptT4sBXRGjPLVVyymg
	uh55axNz4PtavaAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC1AA1336F;
	Mon, 14 Apr 2025 08:43:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eyBvObXK/GccJQAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Mon, 14 Apr 2025 08:43:33 +0000
Date: Mon, 14 Apr 2025 10:43:24 +0200
From: David Sterba <dsterba@suse.cz>
To: Po-Ying Chiu <charlie910417@gmail.com>
Cc: peterz@infradead.org, dsterba@suse.com, wqu@suse.com,
	mhiramat@kernel.org, beckerlee3@gmail.com,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] rbtree: Fix typo in header comment
Message-ID: <20250414084324.GA16750@suse.cz>
Reply-To: dsterba@suse.cz
References: <20250412015516.8924-1-charlie910417@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412015516.8924-1-charlie910417@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: 14AA521228
X-Spam-Score: -4.21
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[infradead.org,suse.com,kernel.org,gmail.com,vger.kernel.org,ccns.ncku.edu.tw];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:mid,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, Apr 12, 2025 at 09:55:16AM +0800, Po-Ying Chiu wrote:
> Correct "drammatically" to "dramatically" in the rbtree.h header comment.
> This improves the readability of the header comment.
> 
> Signed-off-by: Po-Ying Chiu <charlie910417@gmail.com>
> ---
>  include/linux/rbtree.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
> index 8d2ba3749866..78a7a260c36f 100644
> --- a/include/linux/rbtree.h
> +++ b/include/linux/rbtree.h
> @@ -7,7 +7,7 @@
>    linux/include/linux/rbtree.h
>  
>    To use rbtrees you'll have to implement your own insert and search cores.
> -  This will avoid us to use callbacks and to drop drammatically performances.
> +  This will avoid us to use callbacks and to drop dramatically performances.
>    I know it's not the cleaner way,  but in C (not in C++) to get
>    performances and genericity...

Maybe the paragraph can be rephrased entierely, "drop dramatically
performances" does not sound right to me.
