Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89919218EB8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882094; cv=none; b=b2LKnlOlPiMuOae8MgR+hlJjm30r6t8ZPb5pfJ0tGru78iM6gawAcDyuzjRQlaa/OIKXq5HSvrdzXcMA4qoDUz29hifpt990IVdanAmcKLAHdrz2ywO6gWElMxKqiw1AKva8VzBawVElUflrI8jeAYD9GWj95y2J2jBEwpHbzzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882094; c=relaxed/simple;
	bh=RMccFi3WKUwhFKWw+LE/Lm2CoEnvoJ0tUbhaJ63EkSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKGQGTBw6ix+KR/C/bBQRGDUD7+JlkYKue1tvLmu/LWP604TTmLsxsdgy/WCCqEWyVwgLQtcasaGqQiHJFR0bjqA8bvFyh0Dq3DUgJtdVLMtpzGP/snLTS/I3Qv5tGoemUXDmXK5uf+A3eaGGpQFFpthT9hsgsd/Wf6TxeYg5xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=W4T4+mvU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zKHBuWW7; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=W4T4+mvU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zKHBuWW7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="W4T4+mvU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zKHBuWW7";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="W4T4+mvU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zKHBuWW7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 31EDC1F74A;
	Thu, 17 Apr 2025 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744882090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLtwAF4dg+mgHl+p2zPK2s/lk+Xnj5KyZXjanmWtzug=;
	b=W4T4+mvU6uriXdQPPAkCCVTle9d8TNBjLd+io4DGa7m0uhlgwDe88wRIWOn68Y4dJcclUM
	Aa2KXgSdLNyNbsAjwqNbaoqG7rx15Yn2Po3GSguhnqxo6YIkFt5JxhdSWAeG+yT8VbV0Yy
	NBF1ZWgiJK91CpkrXc18FLT/B+gntvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744882090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLtwAF4dg+mgHl+p2zPK2s/lk+Xnj5KyZXjanmWtzug=;
	b=zKHBuWW7Q2veCHrynvQ8S31NLf7p/s97B+GPyjCjVSLSOwFFhFZxTB9znMWNOy9e6LwYnn
	bRO5+i16ckSPzQBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=W4T4+mvU;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=zKHBuWW7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744882090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLtwAF4dg+mgHl+p2zPK2s/lk+Xnj5KyZXjanmWtzug=;
	b=W4T4+mvU6uriXdQPPAkCCVTle9d8TNBjLd+io4DGa7m0uhlgwDe88wRIWOn68Y4dJcclUM
	Aa2KXgSdLNyNbsAjwqNbaoqG7rx15Yn2Po3GSguhnqxo6YIkFt5JxhdSWAeG+yT8VbV0Yy
	NBF1ZWgiJK91CpkrXc18FLT/B+gntvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744882090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLtwAF4dg+mgHl+p2zPK2s/lk+Xnj5KyZXjanmWtzug=;
	b=zKHBuWW7Q2veCHrynvQ8S31NLf7p/s97B+GPyjCjVSLSOwFFhFZxTB9znMWNOy9e6LwYnn
	bRO5+i16ckSPzQBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B071137CF;
	Thu, 17 Apr 2025 09:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P9riBKrJAGg9dQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 17 Apr 2025 09:28:10 +0000
Message-ID: <ce4a1fb9-fc64-4fef-971c-a0bee3f1214e@suse.cz>
Date: Thu, 17 Apr 2025 11:28:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add reverse mapping section
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Harry Yoo <harry.yoo@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 31EDC1F74A
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,linux-foundation.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,oracle.com:email];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/17/25 10:49, Lorenzo Stoakes wrote:
> Separate out the reverse mapping part of memory management and assign
> appropriate maintainers and reviewers.
> 
> David has long been invovled in work with the reverse mapping and continues
> to do so, so is well suited to maintain this area of the kernel.
> 
> I have a lot of experience working with the anonymous reverse mapping and
> continue to work in this area, and also have good knowledge of the walking
> code and code related to VMAs.
> 
> This helps people identify who to ask for help, and also additionally makes
> life easier in review.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks.

> ---
>  MAINTAINERS | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..4f6d09c3fd9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15499,7 +15499,6 @@ F:	include/linux/mm_*.h
>  F:	include/linux/mmzone.h
>  F:	include/linux/mmu_notifier.h
>  F:	include/linux/pagewalk.h
> -F:	include/linux/rmap.h
>  F:	include/trace/events/ksm.h
>  F:	mm/
>  F:	tools/mm/
> @@ -15539,6 +15538,18 @@ F:	mm/page_alloc.c
>  F:	include/linux/gfp.h
>  F:	include/linux/compaction.h
> 
> +MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Harry Yoo <harry.yoo@oracle.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	include/linux/rmap.h
> +F:	mm/rmap.c
> +
>  MEMORY MANAGEMENT - SECRETMEM
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0

