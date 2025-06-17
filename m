Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E221A5B94
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168837; cv=none; b=Nx4MbkJAiUymu6dtvFmtvLUt+rPEZxacmBJbo2Z/eF2H+0BvRCd4RXX1Og9fdJxgLVORHz13f4n5NuV2/Kxx2bvOmQ4kgiFA58wbnZchHzwRuhAceouSQhs+jIuhPiCM+2+q72cb0Lh4YhPZ7tVhd4As4KQ3EDcWSKSmoYWz8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168837; c=relaxed/simple;
	bh=ije51AhqUG/lwdiCWJ7xz+3B0BDcih6UQPBIdVTnVDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpuV7i894VjU2BvZ6myqE4tv3F9u4ROxe8GoDCHUDdbV4+ZFeZpNxKntG6dZnBgaJ1VjBhtNB6nBnEMRCe+sypKkNQhaRuoktx2qJleQpY1fTQdbgDGRMzn6tcMESe6SnRVr7GjaeQ7ChiElXtfmVVS68/a0c4Fn0SlxfSMkdkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WI78ZUD1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1GmTaEl9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WI78ZUD1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1GmTaEl9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WI78ZUD1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1GmTaEl9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WI78ZUD1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1GmTaEl9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C96E21163;
	Tue, 17 Jun 2025 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750168833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvVmPtHchY7T1WbOEdnqVsO+lWBeP5pT8i3uT3/gZy8=;
	b=WI78ZUD1BldogYHz8JLGx2q2LRS0gNKD0IBBgBfH1kPsWrzvUHzmyXYjCBE2GbEXmcv4ky
	3w17TiiPH1Jj/PXw8H+bdbJNyqpRBDS+E+oNdmcjrEElyOvtc/LOiMXoDvZzifW7rYotS2
	a5Pd6MD8EH2p/9hL9l9YjcYZe+UK7I0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750168833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvVmPtHchY7T1WbOEdnqVsO+lWBeP5pT8i3uT3/gZy8=;
	b=1GmTaEl9u4tHar0du4TbzFZftcwy9odLI3e+I3RF4ZgaX6sXF+6NeLNqNIxVTr8rUcscR+
	edQira45FlYGiuCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750168833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvVmPtHchY7T1WbOEdnqVsO+lWBeP5pT8i3uT3/gZy8=;
	b=WI78ZUD1BldogYHz8JLGx2q2LRS0gNKD0IBBgBfH1kPsWrzvUHzmyXYjCBE2GbEXmcv4ky
	3w17TiiPH1Jj/PXw8H+bdbJNyqpRBDS+E+oNdmcjrEElyOvtc/LOiMXoDvZzifW7rYotS2
	a5Pd6MD8EH2p/9hL9l9YjcYZe+UK7I0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750168833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvVmPtHchY7T1WbOEdnqVsO+lWBeP5pT8i3uT3/gZy8=;
	b=1GmTaEl9u4tHar0du4TbzFZftcwy9odLI3e+I3RF4ZgaX6sXF+6NeLNqNIxVTr8rUcscR+
	edQira45FlYGiuCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B435F13A69;
	Tue, 17 Jun 2025 14:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UjEyKQB1UWg0YQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 17 Jun 2025 14:00:32 +0000
Date: Tue, 17 Jun 2025 16:00:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aFF0_zt2ICVKtlXb@localhost.localdomain>
References: <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
 <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
 <aFFZtD4zN_qINo9P@localhost.localdomain>
 <3eb8e1e2-5887-47ed-addc-3be664dd7053@redhat.com>
 <aFFbIXLHdYbM3ooa@localhost.localdomain>
 <aFFknpsmfb-Sh7xT@localhost.localdomain>
 <dac7aa4c-136d-4a01-9601-7bc0314a98a2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dac7aa4c-136d-4a01-9601-7bc0314a98a2@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Tue, Jun 17, 2025 at 03:42:09PM +0200, David Hildenbrand wrote:
> Yes. As an alternative, keep locking it in the caller and only unlock in the
> !anon case?

Yes, that crossed my mind too, and I think that that would the cleanest way.
Since hugetlb_no_page() will be the only one taking the lock, we can drop it
there for !anon case, and put a fat (maybe not so fat :-)?) explaining the
deal.

thanks for the insights David! 


-- 
Oscar Salvador
SUSE Labs
