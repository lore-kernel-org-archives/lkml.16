Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25662F5C3E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568884; cv=none; b=VWLgJRJiAcZstYbXW90JA4LPYCOKvwc1zEZgWc6FzafOe0IbTMNNaFgJf+bxWPa/befiVSCwTl5fYLvCQ/dndDwb/Hr2du5Pz+gpchFq07pbuK862C47ngrrUZ/cKZURK8PJDGTt5+UHrBzs/iipArx4NEpM5b8FZ7NERYKBMxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568884; c=relaxed/simple;
	bh=KD5kqbnKMtYWf8xeAPcVQA7wPJaMOnGG9PePeItZ6X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+Ag37CSLMF4ge0cZ+Z4FPX/XiPBtVoyiRthoTnSF6ncf2BNZG2GO9I6fj5/osz7o5FQCJ2Ia0V8VGt0GsnBSUFPWzdo7mvHI6RkWlCXXGS+WWLor94JruCwlm/Z5Dm7S7jb4I7MPiBc4/sEN1xH0hM1RpH8pj6NGhXQ2ewAEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xe6qTk/a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ZBLDWh7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xe6qTk/a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ZBLDWh7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xe6qTk/a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ZBLDWh7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xe6qTk/a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ZBLDWh7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 63D3721191;
	Thu,  3 Jul 2025 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751568879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vzsfFTiRS699y17GeOyLYlzkrCo2oTvb9iPpWQ+lCzs=;
	b=Xe6qTk/aOmt7XhDBOHrBgT5umTFOZmoWnCdcEC/wmNQwQgan/3rYmR5Xfm6NBOcQk+nvT5
	CGHRVZf50jNPGZWt13vBzRNooaTmnSdcCjhNhlsFtF+C8YN1apkTQUp24fgcOxeyCZR9DE
	WOK/yZmFxAypXFSGyBj+PBBDFe3OPDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751568879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vzsfFTiRS699y17GeOyLYlzkrCo2oTvb9iPpWQ+lCzs=;
	b=+ZBLDWh7rdsznQTh7bWUvJ6kgOI2/juBBvMDkELqeHbfzgjw7H9nBz+ziIO1M+B/Jvov1Z
	9kDFKZQoj6HJL5Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751568879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vzsfFTiRS699y17GeOyLYlzkrCo2oTvb9iPpWQ+lCzs=;
	b=Xe6qTk/aOmt7XhDBOHrBgT5umTFOZmoWnCdcEC/wmNQwQgan/3rYmR5Xfm6NBOcQk+nvT5
	CGHRVZf50jNPGZWt13vBzRNooaTmnSdcCjhNhlsFtF+C8YN1apkTQUp24fgcOxeyCZR9DE
	WOK/yZmFxAypXFSGyBj+PBBDFe3OPDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751568879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vzsfFTiRS699y17GeOyLYlzkrCo2oTvb9iPpWQ+lCzs=;
	b=+ZBLDWh7rdsznQTh7bWUvJ6kgOI2/juBBvMDkELqeHbfzgjw7H9nBz+ziIO1M+B/Jvov1Z
	9kDFKZQoj6HJL5Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8C3C1368E;
	Thu,  3 Jul 2025 18:54:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b9W6Ne7RZmiDNQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 03 Jul 2025 18:54:38 +0000
Date: Thu, 3 Jul 2025 20:54:37 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Pratyush Yadav <ptyadav@amazon.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] cma: move memory allocation to a helper function
Message-ID: <aGbR7Y_TRpxooGjA@localhost.localdomain>
References: <20250703184711.3485940-1-rppt@kernel.org>
 <20250703184711.3485940-4-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703184711.3485940-4-rppt@kernel.org>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Thu, Jul 03, 2025 at 09:47:11PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> __cma_declare_contiguous_nid() tries to allocate memory in several ways:
> * on systems with 64 bit physical address and enough memory it first
>   attempts to allocate memory just above 4GiB
> * if that fails, on systems with HIGHMEM the next attempt is from high
>   memory
> * and at last, if none of the previous attempts succeeded, or was even
>   tried because of incompatible configuration, the memory is allocated
>   anywhere within specified limits.
> 
> Move all the allocation logic to a helper function to make these steps more
> obvious.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Oscar Salvador <osalvador@suse.de>

Thanks Mike ;-)!

 

-- 
Oscar Salvador
SUSE Labs
