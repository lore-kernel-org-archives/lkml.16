Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695091EB9FF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999588; cv=none; b=Y4RN4jJI7vzfGZTCo9DTUcdhxkIjLCou6nuZKjg7D6/eeig/V+p00aSYqFVkoybX/F3ubtObAQvQk4CBRJ6q7S7PstcNCzBzLWhF5DS75DXWoEuSTytyiIW2CQbO61YADNUXFs8oY5SJfkNaO1wOBTeVMGG8sSu5gH7Ykh+g2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999588; c=relaxed/simple;
	bh=T/Nvdduylg23i26sc51odBZfhfL1c5lzIeMemr0BI38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyA8XLzcCz1p05fla7+kC1amHmwZk6vrRX3CVtKYWgjdTHQOYa+RR9r+Fn2Zrqv4UqLMzIhCg6iv0VVp/oYbRO55OHECeSNyW0ycPpFjn/RgbARMcDZ/Rec3ZloVVsXOWaCO+V8hXp2Dq7Z5K3UZMRkiP+tym6VlEuvMDL18DVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d7DJoNY2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T19h8BdC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=efpJ3/4u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d/Zf6MUa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d7DJoNY2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T19h8BdC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="efpJ3/4u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d/Zf6MUa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 912612118E;
	Wed, 30 Apr 2025 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4GAOYL2VzrxAlQlWWCojpqxPYbLREkwNFMN+v5Oxkg=;
	b=d7DJoNY2pLlGdccIrJCVUInDbB7wBsi+cP6N898dOy60cLfUpjHoTNl0Aui6lcug2n4FRQ
	O5uboBzUh0xAj3EgpGt+/5pbkMwJerSUPrt5j7RJUdz4AGTiNoJ+dsMBL3TGELAZtEe9a7
	UNIQOaKJWfiSpfZDFLd1dpQprNeRa8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4GAOYL2VzrxAlQlWWCojpqxPYbLREkwNFMN+v5Oxkg=;
	b=T19h8BdCrFEmYzNFGfUV3kk02PV4PSP0aPtZfDLRZOcgKY/wcZxRz0zxCZ8eJqliKYUftl
	KK8ZEN7b1Ba3f/Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4GAOYL2VzrxAlQlWWCojpqxPYbLREkwNFMN+v5Oxkg=;
	b=efpJ3/4uWyT/PuQux43hnUYi+ePMkR9t3DYZ0FN+KpLJL65Ym2q2UfUQmuprKkT/bOlwDG
	8x5QF7fo4Rd7u1+0JaUXL8aMNzqAMNcXNzT33gv4XcIl5U/DJWUoeLYZ0fm3mSaNlasi4V
	b62BT++4CSjRNfBoiZyoekuLL4vSHE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4GAOYL2VzrxAlQlWWCojpqxPYbLREkwNFMN+v5Oxkg=;
	b=d/Zf6MUataRL2N/k5/sEoJwldBf7J7kGKkO8riUHNG+53KJOzcWqFZgO8BMIscsn4aLK4t
	2wbD9ne5WpfctRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9F7E139E7;
	Wed, 30 Apr 2025 07:53:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WwNcNd7WEWgyBQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 30 Apr 2025 07:53:02 +0000
Date: Wed, 30 Apr 2025 09:52:56 +0200
From: Oscar Salvador <osalvador@suse.de>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v3 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aBHW2NJ95-HBORl3@localhost.localdomain>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-5-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171608.21111-5-nifan.cxl@gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:helo,oracle.com:email,samsung.com:email,suse.de:email,localhost.localdomain:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On Mon, Apr 28, 2025 at 10:11:45AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_hugepage_range() has two kinds of users:
> 1) unmap_ref_private(), which passes in the head page of a folio.  Since
>    unmap_ref_private() already takes folio and there are no other uses
>    of the folio struct in the function, it is natural for
>    unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
