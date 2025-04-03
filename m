Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896A123F42D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665108; cv=none; b=gAJ+3W0XxT+I3gIE/oCI6vxBXBfp8iITqfT8d8A07FbkcmbUzjjJZG9fpTgFNpoBudoB3QGrofuD6ug1HQZDkAAyhgR3p7KTUwt9NFzsI/7Rb/KEwxPpu7Prkm8VqaVXRHyA9NOqBbokFaqLBoSDJxSjxRaWEBrLz33uBoKvP8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665108; c=relaxed/simple;
	bh=YN1Pk7jWr6qt8VFwt5sSRW7qNiwjVynCPaVYLUDjnco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6q0FHcWi9ovs+r3cr8tlxnDQh0Urgb63HRBJwu7/VMgIw6kS5jtSPc2mBZ7JqYuGzI8LtQVOox0btttapPh8Vk4ICEjREe+UMGdaUVbgEPOiqV5EULAkXX24oOaeHktY8dtzTyfAV9NtIc84Zy6ADqfBj0qRfF96MA6RkhrZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fP9iFvHa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q5+kNh+K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mdx6mtOj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=87gxF9P0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fP9iFvHa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q5+kNh+K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mdx6mtOj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="87gxF9P0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CE711F38E;
	Thu,  3 Apr 2025 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743665104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KeaHAMR8ENgFFbELZLDJEj7XhlNjVDTBZt2DEloISc=;
	b=fP9iFvHaBSRp9dmHUMrk6pRg2zhENYlB53sL+48QdTcydIyNfMQrkUo0h8oKvuF/TDkbvU
	fn0egzqyUCgDzDF1xan9Rnx3gqC0Aqa8TtAeTsolj12sN6GFx4S+KYkZIcOl2ln49ra518
	zr30UlaOC9B2iiK6zU2/4brcWqXHzMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743665104;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KeaHAMR8ENgFFbELZLDJEj7XhlNjVDTBZt2DEloISc=;
	b=Q5+kNh+K0TJhWDwMUOWl1aZGOfh0CROBD7ThnT9g6pG9SlX9mkW1tyIrWCuimcifOBRhf6
	4zQtbv7WtoIzukBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743665103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KeaHAMR8ENgFFbELZLDJEj7XhlNjVDTBZt2DEloISc=;
	b=Mdx6mtOjVw6I38KZnL+zKKJTljn1B8R9c7y3w2XmwJ/FamC5qkDDS42MPqvoh5oW/EMQO6
	H3Fnx0RGjUjbeQz8UDuzG3izdsFY8lIXBjzq3x/cyYeRxOShrHhGdEdbTMn9/8ZmvMUD/i
	lyXeJRv1+2DG8+2d/xfF1+L1YU28SEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743665103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KeaHAMR8ENgFFbELZLDJEj7XhlNjVDTBZt2DEloISc=;
	b=87gxF9P085/iUswHelCNwDBYtlG7OKaKsSk9tx/6RXW6jl9ZiYYHcsdFwNV12nIOT9tkpF
	tyYKc6+fYSNJhZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC94A13A2C;
	Thu,  3 Apr 2025 07:25:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A0EeM8437meGRQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 03 Apr 2025 07:25:02 +0000
Date: Thu, 3 Apr 2025 09:24:57 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Liu Shixin <liushixin2@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Nanyong Sun <sunnanyong@huawei.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: fix nid mismatch in
 alloc_surplus_hugetlb_folio()
Message-ID: <Z-43ySa3tvGQllUy@localhost.localdomain>
References: <20250403064138.2867929-1-liushixin2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403064138.2867929-1-liushixin2@huawei.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,localhost.localdomain:mid,huawei.com:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,localhost.localdomain:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 03, 2025 at 02:41:38PM +0800, Liu Shixin wrote:
> It's wrong to use nid directly since the nid may be changed in allocation.
> Use folio_nid() to obtain the nid of folio instead.
> 
> Fix: 2273dea6b1e1 ("mm/hugetlb: update nr_huge_pages and surplus_huge_pages together")
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
