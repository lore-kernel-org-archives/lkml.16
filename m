Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A098D20FAA1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072580; cv=none; b=NToGu9/2DCQCUskhU91weugy2VylfFDSXtcrxkwuWF1wnXy6ySTS0QHEtMcN//uOTJJaWS3RfxFhG4ozt5XAjsl3dv2vu+FHyiiy0gzkZIsadpnlwIn/RDKD0xcL62Mz//bmDlBwqU2qbcAOn+aDAX/73u93ThB5YO2evDjxq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072580; c=relaxed/simple;
	bh=bZp6+qoWUwtsAHkj3pA5HDm49A4zRsnAPTdR/T+G4vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLBXiCIDfLfir2NWvYcky9YDsCEaohUm3kAm2YAXXNFF6ri2s/NOysUU8oqzc/IXtKRQYIfLuOSUZ25dpPyFcHlR05GV+HZ8caeZf+t2aLrJsKseGjnm1DXyt9t6zCE3ouEXDBvl6Ghw2Qg8RpbzGkO1ll1Cujv7SAEux+Km/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CKdrdXBe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kYIX/XN0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CKdrdXBe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kYIX/XN0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CKdrdXBe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kYIX/XN0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CKdrdXBe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kYIX/XN0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 994052118F;
	Thu, 27 Mar 2025 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743072576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zoUJssoAdrvJqWgjZFCmV+8e3DtgaI0aJxl0KKpj6HM=;
	b=CKdrdXBeuKC5pYXqiD4CspdJUO9MJd4q+LdpQAyzshpCKMWIpIsxJu2fx4BNXLxZ7g3IaP
	HfY6uJzr8XfkTne9zw/DloPb2t3/uQ3mHyKoUlJZhX1oUjRCTIYEqTFE9NqF+txg17j17J
	sfAVyK8djuaM80D/w1fueR5Vt7z6990=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743072576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zoUJssoAdrvJqWgjZFCmV+8e3DtgaI0aJxl0KKpj6HM=;
	b=kYIX/XN07hRZqeTrySQ3zv2ha7V/7iFcN7cKr3U+WRKkVOfQSjquIYmC41sgsbpYDRNB12
	mhoUd80KUVV3zNAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CKdrdXBe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="kYIX/XN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743072576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zoUJssoAdrvJqWgjZFCmV+8e3DtgaI0aJxl0KKpj6HM=;
	b=CKdrdXBeuKC5pYXqiD4CspdJUO9MJd4q+LdpQAyzshpCKMWIpIsxJu2fx4BNXLxZ7g3IaP
	HfY6uJzr8XfkTne9zw/DloPb2t3/uQ3mHyKoUlJZhX1oUjRCTIYEqTFE9NqF+txg17j17J
	sfAVyK8djuaM80D/w1fueR5Vt7z6990=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743072576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zoUJssoAdrvJqWgjZFCmV+8e3DtgaI0aJxl0KKpj6HM=;
	b=kYIX/XN07hRZqeTrySQ3zv2ha7V/7iFcN7cKr3U+WRKkVOfQSjquIYmC41sgsbpYDRNB12
	mhoUd80KUVV3zNAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7D8D139D4;
	Thu, 27 Mar 2025 10:49:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3wgIIT4t5WcBHAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 27 Mar 2025 10:49:34 +0000
Date: Thu, 27 Mar 2025 11:49:28 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
	david@redhat.com, 21cnbao@gmail.com, ryan.roberts@arm.com,
	ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
Message-ID: <Z-UtOF97qjcm4Hgu@localhost.localdomain>
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
X-Rspamd-Queue-Id: 994052118F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,google.com,infradead.org,redhat.com,gmail.com,arm.com,nvidia.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Wed, Mar 26, 2025 at 11:38:11AM +0800, Baolin Wang wrote:
> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		walk->action = ACTION_AGAIN;
>  		return 0;
>  	}
> -	for (; addr != end; ptep++, addr += PAGE_SIZE) {
> +	for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>  		pte_t pte = ptep_get(ptep);
>  
> +		step = 1;
>  		/* We need to do cache lookup too for pte markers */
>  		if (pte_none_mostly(pte))
>  			__mincore_unmapped_range(addr, addr + PAGE_SIZE,
>  						 vma, vec);
> -		else if (pte_present(pte))
> -			*vec = 1;
> -		else { /* pte is a swap entry */
> +		else if (pte_present(pte)) {
> +			if (pte_batch_hint(ptep, pte) > 1) {

AFAIU, you will only batch if the CONT_PTE is set, but that is only true for arm64,
and so we lose the ability to batch in e.g: x86 when we have contiguous
entries, right?

So why not have folio_pte_batch take care of it directly without involving
pte_batch_hint here?

-- 
Oscar Salvador
SUSE Labs
