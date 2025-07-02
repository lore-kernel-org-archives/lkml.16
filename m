Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267F81EDA12
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445101; cv=none; b=LUJNl7C8QIDcCsk3XV3qPp5kNutq2cMOntxuGReVOoEYX6xTi22keBnhmK8hlQsIzgtXaF9xfqDjC22NCEycmUt89nPclYuL1liFTYUVguWnaHURI0k98dSDE8mx01DJSOh16eEkvpmKjhKV1CcLPHNQC+6dfn6GUZElqHjUDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445101; c=relaxed/simple;
	bh=6aauH7GxwhBKi+6d61tWGb+oCiO/etqMPfFkkNcWKO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUdpb5bEy8hRUMjV/dMIEi3EJ0Z4noL7+gdmswheYu0fLiInd0F6XpMjZlKHep/VRQrSNTGrGa5a2WcQNGsH6f3GZt3dXsygYTG9r1aKat6zgSr8Fgi8nJDd001kEfmFHRR67k/Xo8EVnx+4iy681D+CNeWQ6f38W6Qy/w1jTYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QiEAct9W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wuPrkT/0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QiEAct9W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wuPrkT/0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QiEAct9W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wuPrkT/0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QiEAct9W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wuPrkT/0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23C2A1F445;
	Wed,  2 Jul 2025 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751445097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LijqastEw3qUFvzyEsXU6aL2cJLK80hhol4mjxgoetw=;
	b=QiEAct9Wwld6eiFsCWaeg7JyqreCup1dlsZK/HxKUDGAhto/EjHAh2aupwTEoo2l+xgAry
	vidOWtKD2FnVbwPy9qXOVSTfNYRg79oSUaJue7j0sDL7yla/xjxBsDg6kgIy/FziQOW3/R
	0LOnY5008Lz1KsHWYdq4eKxCHqz3pMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751445097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LijqastEw3qUFvzyEsXU6aL2cJLK80hhol4mjxgoetw=;
	b=wuPrkT/0KxUgvex9/pbZ/fGEEaxXDqsySvCpT6Kd/D3qJDfadidhwXng8JamMVT5l6fUjY
	AOLe/hl557q9TYCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751445097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LijqastEw3qUFvzyEsXU6aL2cJLK80hhol4mjxgoetw=;
	b=QiEAct9Wwld6eiFsCWaeg7JyqreCup1dlsZK/HxKUDGAhto/EjHAh2aupwTEoo2l+xgAry
	vidOWtKD2FnVbwPy9qXOVSTfNYRg79oSUaJue7j0sDL7yla/xjxBsDg6kgIy/FziQOW3/R
	0LOnY5008Lz1KsHWYdq4eKxCHqz3pMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751445097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LijqastEw3qUFvzyEsXU6aL2cJLK80hhol4mjxgoetw=;
	b=wuPrkT/0KxUgvex9/pbZ/fGEEaxXDqsySvCpT6Kd/D3qJDfadidhwXng8JamMVT5l6fUjY
	AOLe/hl557q9TYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F04A71369C;
	Wed,  2 Jul 2025 08:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5QL5N2fuZGgLTwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 08:31:35 +0000
Date: Wed, 2 Jul 2025 10:31:34 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Message-ID: <aGTuZpieryYFBbdc@localhost.localdomain>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627115510.3273675-2-david@redhat.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,suse.cz,google.com,kernel.org,suse.com,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,surriel.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,localhost.localdomain:mid];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

On Fri, Jun 27, 2025 at 01:55:07PM +0200, David Hildenbrand wrote:
> Honoring these PTE bits is the exception, so let's invert the meaning.
> 
> With this change, most callers don't have to pass any flags.
> 
> No functional change intended.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

I'm not gonna jump into a dialectics battle :-), so whatever ends up being the
FPB_flag:

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
