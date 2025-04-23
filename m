Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95671EFFB8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411556; cv=none; b=e3yLZF2eUvs1ltHFYFE9nnbPxwbLK02u9ygjiDYLpGHWs8bcxIHufugliWd0FalVtgVhZhTEUN0Gqoa2NJLGvYGAnnhYLtj4KAnYOTHCzGk+AlXHYGxW24OsTChrj1NEtB4M89vIf0hOSBRTprBIT0AxNbS/t0AWtMhBWMQsyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411556; c=relaxed/simple;
	bh=mJhKQTfrAhh4BzPI5pq8gWIqWNfAb/DvNUwZWhUH3Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQI6tk8zU+yHC7qHtuAVC31V1eUsPqLymO5h+sJ1LGsZtlV4OEVDgo5AOB3pGsHbqWZzPJ2gOyk9OPJS/u3PD5ZLBaftvoErjg99NGoyFzVs2ztlQ1w4oi9SLp/n5uJ6wbkULlNCaBq8NANHUPf1mOfJtxkprt1UvsPSRRBFzMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hMMmlOUT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ChoqVBIe; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Vl93H8+e; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5fiYpCXg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hMMmlOUT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ChoqVBIe";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Vl93H8+e";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5fiYpCXg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD6751F38D;
	Wed, 23 Apr 2025 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745411553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+iIls4z8xeuOcfEvRVGaYa5/fPNQUPIznzgy2HtOxo=;
	b=hMMmlOUTS8//tyxqT+t0RqR9eXiGJxiSE4OdqT9autOcA9+QMaghBsyj8GGtKtBcOMuLjz
	bnGZnUDR/VVqNXP2OBA1510hvxHMeosy1iMo37qF418tio/WsZpoY6xWdDKLXwBV4bSlo5
	/ggLrhUL5qb2JdWFGGdyY4xw51THQOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745411553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+iIls4z8xeuOcfEvRVGaYa5/fPNQUPIznzgy2HtOxo=;
	b=ChoqVBIemm+Wbh6WETGXemIrO3YTrVsCC/gDISNj3OJpFJV2dwn9AFu/1Cx4WlpzohLJ2L
	FjtMo90hGR4YNnCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Vl93H8+e;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=5fiYpCXg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745411552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+iIls4z8xeuOcfEvRVGaYa5/fPNQUPIznzgy2HtOxo=;
	b=Vl93H8+eCoXEURG6KaKcz1DuJvM4gDH1cFnUbp+GKzCKAPRPu1mk9UBMRNFupfiR2dqfgf
	PaH4w6RnOj3Ux7q2Bs7QY5QH99/T8q5Ost1M1NBb8EPthaEzniFGBSXrX6NXZd5IMBb5Ff
	sHJA13UFLRqKqEUPLx+dPV6+S60VklE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745411552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+iIls4z8xeuOcfEvRVGaYa5/fPNQUPIznzgy2HtOxo=;
	b=5fiYpCXgyE+w7CYRj1Rw+AstsM2gCSHKfWkFj9wt0sWJ32fGLbSvuixaA6ffBdytt4fd/p
	0n7K8tDNQVEYeIBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C575E13691;
	Wed, 23 Apr 2025 12:32:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VtDgL+DdCGhpRwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 23 Apr 2025 12:32:32 +0000
Message-ID: <8fe05ca4-86be-4d77-9074-cf04ef2dd322@suse.cz>
Date: Wed, 23 Apr 2025 14:32:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add core mm section
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DD6751F38D
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:email,suse.cz:dkim,suse.cz:mid,suse.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 4/23/25 14:30, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a 'core' memory management section establishing David as
> co-maintainer alongside Andrew (thanks David for volunteering!) along with
> a number of relevant reviewers.
> 
> We try to keep things as fine-grained as possible, so we place only
> obviously 'general' mm things here. For files which are specific to a
> particular part of mm, we prefer new entries.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!


