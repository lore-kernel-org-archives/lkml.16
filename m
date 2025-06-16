Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E132BF01B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106999; cv=none; b=XDvK8Fez65JFNUFY1YibuvdisA1udf20lxG52380jjTcj8BydnJPfcyyFLZTQRK4Q74Y3Ko1nQt5AVkxumUQ32oJbYh2RXYVnB35PQoD7YTOAfpcRw1LnhYs6Z6axuBs/v4HszPxELsXxhGS7iSDdoDeTCsRSgfLuraISFgzhwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106999; c=relaxed/simple;
	bh=/xunBKud0ech7XfXRXkEpCsHJZQ5QmRGOyEkpZQB9x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi/zp/e79X0bd5yzLNnOV+R7KPAQE7aONEYKd7rsiCCitFasjbi2UqTfPLyltBUp4N5FIJuaqVW2g0vU6ICPfHHXsVpLACNESkE+07UWx8twOTkUMUamivSanxtCAxSQrXl7GgRkYjMdkPbskT1XwpcSoJYg2jhMO9y5ApTgL/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YAttqN0H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7hNA6m2D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W3PghcxW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HUF9GRSM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YAttqN0H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7hNA6m2D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W3PghcxW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HUF9GRSM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6E5C211F8;
	Mon, 16 Jun 2025 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750106995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18yqDCLN5ntg51EhC/wIdfRSd+Hx5yGpG/QRtXUZVUs=;
	b=YAttqN0HHAFZSywU00RTKVtPcb9oS0WsAab7Hyft4EzZ77CPJk25pQBZxeXA+B/qr0whdp
	07BH/dd2kwMSKRYThaOMhkgqhTN5G5ftrtFL+IHaXl2faHAaNCKtrOrvWyfUppY4IA8hmG
	NuDTu1aMryar34buFLPqDwe6UBDWsig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750106995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18yqDCLN5ntg51EhC/wIdfRSd+Hx5yGpG/QRtXUZVUs=;
	b=7hNA6m2D8606BAfSqit6HZX8VRUGme0J2m/Yqnrax5FMJIr6JN45pa4Up9lHsjNIKgc8vY
	kelsR3ZcmlaHLlDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W3PghcxW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HUF9GRSM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750106994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18yqDCLN5ntg51EhC/wIdfRSd+Hx5yGpG/QRtXUZVUs=;
	b=W3PghcxW19+6Zg1RBZ3Cb+MjiboL01OFK2h5E+bLmvd8kAXshp2Adh6gqGqTRiz4GdavfC
	u60tClwoBD7egsDUyLnVedayI79Ip7gUj2o6iMQLE2peho8eZLNmzuVSFJV3szg1M8dOMi
	A4hYDizX5C8JZhk3knZTZ18+kxELFQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750106994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18yqDCLN5ntg51EhC/wIdfRSd+Hx5yGpG/QRtXUZVUs=;
	b=HUF9GRSMax10BzIlWpzxXMAmXiC+xRO/gRN+aIGrodKJquLkoZpTSnNNN5wGPRV8TzB5OF
	ImEoROnebJ+y2nCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49409139E2;
	Mon, 16 Jun 2025 20:49:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Oee+DXKDUGiGPQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 16 Jun 2025 20:49:54 +0000
Date: Mon, 16 Jun 2025 21:49:52 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Subject: Re: [PATCH] MAINTAINERS: add additional mmap-related files to mmap
 section
Message-ID: <cxwmebrnmrhnlzk4n4w5r5zlv5jwzsqfejgmsqup5fljg6jeee@vo377ihsh76r>
References: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D6E5C211F8
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,linux-mm.org:url,suse.de:dkim,kvack.org:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 

On Mon, Jun 16, 2025 at 09:35:03PM +0100, Lorenzo Stoakes wrote:
> msync and nommu are directly related to memory mapping, memfd and mincore
> are less so but are roughly speaking operating on virtual memory mappings
> from the point of view of the user so this seems the most appropriate place
> for them.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4523a6409186..a5d1ff923a62 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
>  F:	Documentation/mm/
>  F:	include/linux/gfp.h
>  F:	include/linux/gfp_types.h
> -F:	include/linux/memfd.h
>  F:	include/linux/memory_hotplug.h
>  F:	include/linux/memory-tiers.h
>  F:	include/linux/mempolicy.h
> @@ -15974,12 +15973,17 @@ L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/memfd.h
>  F:	include/trace/events/mmap.h
> +F:	mm/memfd.c

memfd is a big stretch, no? I think it would feel more at home with shmem, or even VFS people. 

> +F:	mm/mincore.c
>  F:	mm/mlock.c
>  F:	mm/mmap.c
>  F:	mm/mprotect.c
>  F:	mm/mremap.c
>  F:	mm/mseal.c
> +F:	mm/msync.c
> +F:	mm/nommu.c
>  F:	mm/vma.c
>  F:	mm/vma.h
>  F:	mm/vma_exec.c

the rest obviously LGTM.

-- 
Pedro
