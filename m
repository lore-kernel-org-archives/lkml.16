Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEAA2E06D5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164644; cv=none; b=PfEmiEu6g4un2bZesvmwREoglQm32mlVsi9GZpyiXheFqvvIHATNRAm3pUQfcRpvxH4p1wjzQoO04VWtg60xxQwi0ARD58jzF8DZ53GU+rAb7x7ivVU+NobVyil6xae9DckqCgCcsrHwlbqqzj1Y4ajBokMWJrphEHnkxId746w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164644; c=relaxed/simple;
	bh=mFP36/xJzb9ugsidYh/5ESlsh+CQ8v6fUB28eVgO0fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkDnr65G3Xc8nAHZSXnJcy//fG8BIbZePNEPDVNDRSzTRkzZ8xUF6FEZZ5bg1S96EnDpq8mZDT8BpnUcfF9LczXbTEWb25oebrvvVgU8orC773skYczqbB2B0vgGgot6Pjp/f69Z3Un4DNb9YBgsw+BOJBimpJfKII+Bc6vpZw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cq1BnWTs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q4cpHeRQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QzVruuoG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mm9XUny6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cq1BnWTs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q4cpHeRQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QzVruuoG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mm9XUny6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E56321F79D;
	Tue, 17 Jun 2025 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750164641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH+njVf0uvHL0uYXmqaGHohQQXRDpzBL8cy0oMb2kz4=;
	b=cq1BnWTsqMIjTA2Y+sPx+4+79kjkdR0617oEqqXKimkqQ7qJIoYDK9LaoNqHGPKY6YLnPd
	tu4wqKWbd9injfH9F6P/oA1D/UdnKbJfkPEDHre+bSwWTErzUDk+5/cHXlpjOvLhkmO3j4
	Iv9wszNQ1XTC6tbXgB6W7xvZS6dtrGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750164641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH+njVf0uvHL0uYXmqaGHohQQXRDpzBL8cy0oMb2kz4=;
	b=Q4cpHeRQMLb+eHskegkKmSzwueNOzLpk5XgroiqHAQ96lfVsjoQzgVFk3AF+kQ2xB9e+fD
	YbiqUTp6HpVpDnCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QzVruuoG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Mm9XUny6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750164640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH+njVf0uvHL0uYXmqaGHohQQXRDpzBL8cy0oMb2kz4=;
	b=QzVruuoG3DVD/+VCj2gZhP9CQxD75Cuzfg21wikWRVPRVNbC6vsUR7X3lceVpMd9VPWF3t
	/BlTUBSgAeSmey418il5f7AeZqZBXDZOlscZn15IS30ZfBzExfe/j+KeO4udZAoV5CAgnu
	xplC4DLFvyLQGEnlui5P9zZBbwAaD0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750164640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH+njVf0uvHL0uYXmqaGHohQQXRDpzBL8cy0oMb2kz4=;
	b=Mm9XUny6WIKTLFewKMK93pV8kg4dIO9wdJglqzzCqr3gSnGTv4QMBU6DGWIikhYKdYiPZt
	j9iAHqy2bmxNq9Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69FA8139E2;
	Tue, 17 Jun 2025 12:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J9wSF6BkUWj+SgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 17 Jun 2025 12:50:40 +0000
Date: Tue, 17 Jun 2025 14:50:38 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aFFknpsmfb-Sh7xT@localhost.localdomain>
References: <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
 <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
 <aFFZtD4zN_qINo9P@localhost.localdomain>
 <3eb8e1e2-5887-47ed-addc-3be664dd7053@redhat.com>
 <aFFbIXLHdYbM3ooa@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFbIXLHdYbM3ooa@localhost.localdomain>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E56321F79D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On Tue, Jun 17, 2025 at 02:10:09PM +0200, Oscar Salvador wrote:
> On Tue, Jun 17, 2025 at 02:08:16PM +0200, David Hildenbrand wrote:
> > folio lock is a sleeping lock, PTL is a spinlock. :)
> 
> Lol yes, overlooked that totally.
> And I also saw the comment from mm/rmap.c about lockin order.

So, we could do something like this:

        if (folio_test_anon(old_folio)) {
                spin_unlock(vmf->ptl);
                folio_lock(old_folio);
                spin_lock(vmf->ptl);
                vmf->pte = hugetlb_walk(vma, vmf->address, huge_page_size(h));
                if (unlikely(!vmf->pte ||
                    !pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), pte))) {
                        spin_unlock(vmf->ptl);
                        folio_unlock(old_folio);
                        goto out_take_lock;
                }

                if (folio_mapcount(old_folio == 1)) {
                        if (!PageAnonExclusive(&old_folio->page)) {
                                folio_move_anon_rmap(old_folio, vma);
                                SetPageAnonExclusive(&old_folio->page);
                        }
                        if (likely(!unshare))
                                set_huge_ptep_maybe_writable(vma, vmf->address,
                                                             vmf->pte);

                        spin_unlock(vmf->ptl);
                        folio_unlock(old_folio);
                        goto out_take_lock;
                }
                VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
                               PageAnonExclusive(&old_folio->page), &old_folio->page);
                spin_unlock(vmf->ptl);
                folio_unlock(old_folio);
                spin_lock(vmf->ptl);
                vmf->pte = hugetlb_walk(vma, vmf->address, huge_page_size(h));
                if (unlikely(!vmf->pte ||
                   !pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), pte)))
                        return 0;
        }

Hopefully we can do some refactor here, because I quite dislike the
unlock-lock-retake-unlock-blah cycle.



-- 
Oscar Salvador
SUSE Labs
