Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9243204849
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516192; cv=none; b=AYt6luw2ej2Mw8YMMt2Fxu8dMReMo1jJvR4RdtHi5JpGVgba67hizuv5ntrdib/RveK0zY6ALAYGS4La2FOBgNXu1lE4/QSVozHG8NV/5GApZiAY9t5zwG5quQwYxgu+KMdkXGa5DLdKdJkwCFou7FFYe46vc/EY1WiuwhvA1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516192; c=relaxed/simple;
	bh=gi8ezW4wfPniYfBk9LsjhTi2MvNLUeRwNm6MAErtPp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBdObMyLfsM45NC7QgxittJVkK4G/eFZ0B70xgod8fOM6IxiVZouEtfY7zAkgZTAAfDIIJqoA2c0Ads/mSx6uouwqBt3KKyRQpmu+3wAru+P0PAkoXy8GChOnpvc9LyxiKqRuUBUbotmiEpcJgJxa3e0cy17qgmownWC6jJVdig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=18PN1ce/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tv6oQ6jy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aKgTWHHD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ineTQmfz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="18PN1ce/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tv6oQ6jy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aKgTWHHD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ineTQmfz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E619421188;
	Tue,  1 Apr 2025 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj9vWZeoAUzkYdmfSEpF/aL9/NzMXGds7KzoCm3bc4I=;
	b=18PN1ce/+WUuLFogKF+6gixFI8ILqw9yL8p6hN9Dd0s0Sw7hxoVfc9AZa7Y2Pgwy2ey54Y
	x6Jo8Gii2AzAzkcy6HQCQGnFXM7tnErQe/yiIjtRU3bGKFIU5zrTi3ML17CZy9uIGec2tE
	12ClHPizWbS1fNjaNEXHebvvsUSDRBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516189;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj9vWZeoAUzkYdmfSEpF/aL9/NzMXGds7KzoCm3bc4I=;
	b=Tv6oQ6jyN9VJwqH6oIo2U3kxA0rxWPVhCn3GvjOjgOM1AOfTVKklqUYlc1/6+rRKSOCsHI
	NQtMEUqk4huTTHAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aKgTWHHD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ineTQmfz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743516187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj9vWZeoAUzkYdmfSEpF/aL9/NzMXGds7KzoCm3bc4I=;
	b=aKgTWHHDreROvhN1dH8d0LtVrvnWvFkz8MsCHVhP0TnhZ51TpYJ/DxVloDNWUqjDZrbLOF
	TejUPoAW7SdAbWFz09SF6KQey4X3Rj1PgyHl3868ssX9gw+m7aarNmvdHlWBO7T+FHNmSD
	Je+8cZCM/0Q+3D+RXtsTb4lq4CjKSJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743516187;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj9vWZeoAUzkYdmfSEpF/aL9/NzMXGds7KzoCm3bc4I=;
	b=ineTQmfzNShJYOiXtPLd9pc8CAAu+3z5GzcwDKBNdEXCiqKiLjyhS6AFrtUhWk9UNPOu3e
	Hbih/lnA+XFHaVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85D18138A5;
	Tue,  1 Apr 2025 14:03:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jPMVHhvy62cmXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 14:03:07 +0000
Date: Tue, 1 Apr 2025 16:03:06 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev, x86@kernel.org
Subject: Re: [PATCH v2 5/7] x86/mm: remove pgd_leaf definition in arch
Message-ID: <Z-vyGtcrU9Y3n9it@localhost.localdomain>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-6-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331081327.256412-6-bhe@redhat.com>
X-Rspamd-Queue-Id: E619421188
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Mar 31, 2025 at 04:13:25PM +0800, Baoquan He wrote:
> pgd huge page is not supported yet, let's use the generic definition
> in linux/pgtable.h.
> 
> And also update the BUILD_BUG_ON() checking for pgd_leaf() in
> pti_user_pagetable_walk_p4d() because pgd_leaf() returns boolean value.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Cc: x86@kernel.org

I have been carrying a sort of this patch in my tree as well for quite
some time now, and I think that Christophe also sent it some time ago,
so glad someone finally pushed it

https://patchwork.kernel.org/project/linux-mm/patch/20240704043132.28501-2-osalvador@suse.de/

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
