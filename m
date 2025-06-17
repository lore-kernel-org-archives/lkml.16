Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5448E2264A0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161851; cv=none; b=UUYnlkQDpyoEeBiQRXgjUJnQUoSu3Rq7ZS2Yo+lUrUjte/Mx3gXEfQEwDUBm+9vdAik79BEcPMLG8tqHN8NX72dzfuI5gaMIE1R46g5FNSAlkIGHVS/7tMt3C6fT6ttoYEqrDFssERwiGLSf1zEIzpBr0uLcodBaE+6cE99XISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161851; c=relaxed/simple;
	bh=LObtPLq3qmAZteYbpRYF/JkgO8RgDVYq8EdABv43EQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbpvghIOb19W7NwWdoV2IyixVfZnRcHa5ugULWHNlPmwm78if7sMY9deVQdZYEjebdIq+xaXzAdo3dZNMYWfyQTFvGc/PVEQCD22HLjALhT0oHuW0L4NTV/+wFFjzOCuenI5hmDybDwVab3tLN/U+30EyxtuA+JSgepOBr+dSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NGeIaIFs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yhtUiiUi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2DXxXOrd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZoSgydNW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NGeIaIFs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yhtUiiUi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2DXxXOrd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZoSgydNW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39D73211BA;
	Tue, 17 Jun 2025 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750161847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVj2aCMKBwLwEdjT9VXDVvKbMF+W3VDNjRvxdHhruE=;
	b=NGeIaIFs3gMA9WtE/kVniU+X0zxJH7fVgPGL8MxyuNU5N5mCODB83QGUE2UQ8sMRwuPckO
	/T9O80RwpjXAKuJFYZVYy0H0YpZEbMwoRm+w+JOCh2qrpChcbyzeyG5B+u97oj8+gS+EIU
	laJqY5fbh5L00tFl8YWWz8aJcbxnlZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750161847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVj2aCMKBwLwEdjT9VXDVvKbMF+W3VDNjRvxdHhruE=;
	b=yhtUiiUir+tMvfO+u8T+Es1Xpy7mTGbk58DiMTF4XdksR0gn/bARV5Zl+nRFEp1msIvD24
	Fhv2pJLlb8nnTmAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750161846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVj2aCMKBwLwEdjT9VXDVvKbMF+W3VDNjRvxdHhruE=;
	b=2DXxXOrdON9qf7FCS5xVLXBcBapFrFa/ZGwIWdla3lJTt8Otvkar8IN1o/YzCJ/8hsdFl0
	n5ay0/BzJEPq+upp7M7j9/ucI5J/edz4WyYbh0j+gceJWPNtwYvP1AIbQ/XkH6B4mWZ3aX
	1RdUAxNfqjsRxeHD5E2J5seGo6zYNJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750161846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVj2aCMKBwLwEdjT9VXDVvKbMF+W3VDNjRvxdHhruE=;
	b=ZoSgydNWoDK7VEsLRKEgoGq/Mm7jrtBE7EfcRRKYlvUrLftTYMY3sQqJJDV+sg84keQQ1q
	+nfPJ0k30SgW/rBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEF1A13A69;
	Tue, 17 Jun 2025 12:04:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VHvNJ7VZUWh+OwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 17 Jun 2025 12:04:05 +0000
Date: Tue, 17 Jun 2025 14:04:04 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aFFZtD4zN_qINo9P@localhost.localdomain>
References: <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
 <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
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
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Tue, Jun 17, 2025 at 01:27:18PM +0200, David Hildenbrand wrote:
> >   @@ -6198,6 +6198,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
> >    	 * in scenarios that used to work. As a side effect, there can still
> >    	 * be leaks between processes, for example, with FOLL_GET users.
> >    	 */
> >   +	if (folio_test_anon(old_folio))
> >   +		folio_lock(old_folio);
> 
> If holding the PTL, this would not work. You'd have to unlock PTL, lock
> folio, retake PTL, check pte_same.

Why so?

hugetlb_no_page() has already checked pte_same under PTL, then mapped the page
and called hugetlb_wp().

 hugetlb_no_page
  vmf->ptl = huge_pte_lock()
  pte_same
  set_huge_pte_at
  hugetlb_wp

and in hugetlb_wp() we're still holding the PTL.
Why do we have to release PTL in order to lock the folio?
This folio can't have been unmapped because we're holding PTL, right?
And it can't have been truncaed for the same reason.

It's because some lock-order issue? 


-- 
Oscar Salvador
SUSE Labs
