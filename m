Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584921D00E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186113; cv=none; b=Dl3iQ24+AmMDjQ2V7yoKoEu6fljLwMWLC0ArQiOD4ovYPaOGu0LcTpRfea0igdGIayAnatn5a5HUIVOl/gtUg5UoOt/dakq/LxBluzhPmGYSkjQvumwb6ev57DLxt/Oy+627ZST4stOmg/WMRDE1Q4hvx8YByiAow0ZDsnmF1vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186113; c=relaxed/simple;
	bh=GdHQrzSqzwEKHztn/nNI5axEkTBZBEtJo18AKx4QEiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuPjU8nO+F08DLcEGw9jFS1ygqmIKs2k9WLO0kH34dBjVMUf+XDsqcO5WN2ONrk5VlNo/Bs9PFAE9DjWrogBIBx1Mj46sgScp2fxBfefKaCOj3nniwcoYr59oWdYgnXzjyyy/venMzjJjnBuFm+G44y4ZFNhOov1ta2pZ3teJP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Z75kljqI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aR3oNbkA; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Z75kljqI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aR3oNbkA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Z75kljqI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aR3oNbkA";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Z75kljqI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aR3oNbkA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7ECE51F79D;
	Tue, 17 Jun 2025 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750186109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTSn+Ik2A8uKUOC8XyvW19XB4mBv3M0LmOmm6BrXT84=;
	b=Z75kljqI5AgqTGKEppANhv5EhZdbnqY9mq2cnxHDK4Sjz9k1+oAgnXmt6HjND034HRMI73
	TqFeptaODCTC2kyXJNbK0vRIRBd5ZfMMMPw2BOYjgL8yASp2Zuu1tmfk1693dEk5B2gw5k
	bt1M0prcEDVPZIR2BHSNHpTwbtEaiaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750186109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTSn+Ik2A8uKUOC8XyvW19XB4mBv3M0LmOmm6BrXT84=;
	b=aR3oNbkAFrlYRuLg87bEGOF0LRXOheeMdnx8jHFLoY08FuuxVBaYfhknLdXVLwGCSgBFyS
	gUmCONjtqJPRmRAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Z75kljqI;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=aR3oNbkA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750186109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTSn+Ik2A8uKUOC8XyvW19XB4mBv3M0LmOmm6BrXT84=;
	b=Z75kljqI5AgqTGKEppANhv5EhZdbnqY9mq2cnxHDK4Sjz9k1+oAgnXmt6HjND034HRMI73
	TqFeptaODCTC2kyXJNbK0vRIRBd5ZfMMMPw2BOYjgL8yASp2Zuu1tmfk1693dEk5B2gw5k
	bt1M0prcEDVPZIR2BHSNHpTwbtEaiaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750186109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTSn+Ik2A8uKUOC8XyvW19XB4mBv3M0LmOmm6BrXT84=;
	b=aR3oNbkAFrlYRuLg87bEGOF0LRXOheeMdnx8jHFLoY08FuuxVBaYfhknLdXVLwGCSgBFyS
	gUmCONjtqJPRmRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E63A13A69;
	Tue, 17 Jun 2025 18:48:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tTOgGn24UWhaNgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 17 Jun 2025 18:48:29 +0000
Message-ID: <bd71c67e-5599-40b1-a6fa-a66a98a9bd68@suse.cz>
Date: Tue, 17 Jun 2025 20:48:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: add OOM killer maintainer structure
Content-Language: en-US
To: Michal Hocko <mhocko@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
References: <20250617085819.355838-1-mhocko@kernel.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250617085819.355838-1-mhocko@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7ECE51F79D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On 6/17/25 10:58, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>
> 
> Acked-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

With others' concerns addressed,

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c1d245bf7b8..5e339c1457ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15841,6 +15841,14 @@ F:	mm/numa.c
>  F:	mm/numa_emulation.c
>  F:	mm/numa_memblks.c
>  
> +MEMORY MANAGEMENT - OOM KILLER
> +M:	Michal Hocko <mhocko@suse.com
> +R:	David Rientjes <rientjes@google.com>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	mm/oom_kill.c
> +
>  MEMORY MANAGEMENT - PAGE ALLOCATOR
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Vlastimil Babka <vbabka@suse.cz>

