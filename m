Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C71AF0BB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750874040; cv=none; b=a/jfhbZzFBoSH4T9/iEgplYmxaM9lFLCdq7Oep+Q3xyRhY1XWUa5SNxvR9PclZXyfCjc0rWLWw7RvpG0nrcpxELFHflNGMcsRE4VVyA/8qLrDz6ym6umfEeBPaYpUkOM+BlkReOEXEal9UqbL4VJgfPpdmbS6ybtxreWR4GpxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750874040; c=relaxed/simple;
	bh=CFUEUk5xUpc9zLE1MwObmu07Edbhws/ym50msGMLvF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbdoUFjlexJFNdCMoXWUYc5XjCnCLoBqie702O0l1308Zipv30TdoO87mtxf1Gle/MS/NcNNAbmDnkNgnFnKfS2d3rOJcvHusy2ErNgVYLJ3uML5Md4uoKYzUj81uNV5O1dfVywlOKFP6Co+nfWeX68NZSLALqLmLwsFvGxAMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yTB784w3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OkH7btFD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yTB784w3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OkH7btFD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yTB784w3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OkH7btFD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yTB784w3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OkH7btFD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF0B32118D;
	Wed, 25 Jun 2025 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750874036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xpFHd114ytKEjWw2eJqvNKzl0S1pv8LJlzpfoSAjlsA=;
	b=yTB784w3XxqRr7tcxhkaBvuZzXqXY+0sCrUczooEDmVbsqzulbzwOI6mI495Sty0Opqg2y
	ufD/nc6rQ2JNqJ2fR/mXyPRPtlEOXPO03e+lDE1rYUR0q7fonet7DKQL7gOmJIU97Kf1Q+
	ISPYybpHgiF8jNdTZL/RR+RQEcVtdtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750874036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xpFHd114ytKEjWw2eJqvNKzl0S1pv8LJlzpfoSAjlsA=;
	b=OkH7btFDSFFBOL+YISuxJ5+1t1zbEDjBDQpIE7fHlzo6onuifQeRoqOgkqChwc852Vjdky
	kSufkadGnUtlX3Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750874036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xpFHd114ytKEjWw2eJqvNKzl0S1pv8LJlzpfoSAjlsA=;
	b=yTB784w3XxqRr7tcxhkaBvuZzXqXY+0sCrUczooEDmVbsqzulbzwOI6mI495Sty0Opqg2y
	ufD/nc6rQ2JNqJ2fR/mXyPRPtlEOXPO03e+lDE1rYUR0q7fonet7DKQL7gOmJIU97Kf1Q+
	ISPYybpHgiF8jNdTZL/RR+RQEcVtdtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750874036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xpFHd114ytKEjWw2eJqvNKzl0S1pv8LJlzpfoSAjlsA=;
	b=OkH7btFDSFFBOL+YISuxJ5+1t1zbEDjBDQpIE7fHlzo6onuifQeRoqOgkqChwc852Vjdky
	kSufkadGnUtlX3Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A53B13301;
	Wed, 25 Jun 2025 17:53:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0VuQO7M3XGjIUQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 25 Jun 2025 17:53:55 +0000
Date: Wed, 25 Jun 2025 19:53:54 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as THP co-maintainer
Message-ID: <aFw3sljxMuas-y64@localhost.localdomain>
References: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Level: 

On Wed, Jun 25, 2025 at 10:52:31AM +0100, Lorenzo Stoakes wrote:
> I am doing a great deal of review and getting ever more involved in THP
> with intent to do more so in future also, so add myself as co-maintainer to
> help David with workload.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Great Lorenzo :-D

Acked-by: Oscar Salvador <osalvador@suse.de>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b9a4fa905e1..a8a963e530a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15945,9 +15945,9 @@ F:	mm/swapfile.c
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:	Zi Yan <ziy@nvidia.com>
>  R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> -R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>  R:	Nico Pache <npache@redhat.com>
>  R:	Ryan Roberts <ryan.roberts@arm.com>
> --
> 2.50.0
> 

-- 
Oscar Salvador
SUSE Labs
