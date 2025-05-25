Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DDB13A3ED
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748155177; cv=none; b=Bi6ppBoDrD6/v/S7ENZWI4TXHagchfPGZIPmmoVgkt8WAsp4kFQ9PN0/r+hca3ukK1o4vuujQpIYlrKPFcBbx8RJC6waBk8Ih4M3fNeQ1EEkwQfyGa3qg0qwkmn5zWotQRGm2G9nr3f45POwRReNRi1ZK2vEuXYdgwvmLRiuf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748155177; c=relaxed/simple;
	bh=fXb9NEnuSqqcB+DmN55dbkaCKQbJNevvic0w1MRJHKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nISRFoWO6n4U6eFZXfONfc3SuyR3Dv/9abI7JkWCGCgAp07v7I8s/XXD3eamOVE4ybMuqWIPMU/27J/wHgbYnfRg/1jB3Amip+gdHDHrzaGJXDeQoiOAGFZ9fP2BG6l0JMSlxSakNg+9g8Aa42L1FEjAoZBZCRtZfZcAD6WVkas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jATYJdyA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pWakeYi1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jATYJdyA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pWakeYi1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jATYJdyA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pWakeYi1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jATYJdyA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pWakeYi1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 308451F7B1;
	Sun, 25 May 2025 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748154783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RjHHGqSB4eHlq5L3HKciHLIzSzNnPIHC/XuF5r4tJU=;
	b=jATYJdyA9iueG+TbdkiPNKsplqgrG8dvvxPsr4qozyEba8qeSySi24KhLzZq95VRY2XdHD
	hYGpfpAaVN60Lf0m90PyO5xCCkIgTlCrqNH5/jbBvdl+66Nqwc1kmA+4UbZi+o8xMNjIK0
	83nAb0EbscEMd4LValBtf2OIAWioPd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748154783;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RjHHGqSB4eHlq5L3HKciHLIzSzNnPIHC/XuF5r4tJU=;
	b=pWakeYi16yD52z+znmc5iOsKNC9tp8HFQyIGd6Hxc52sDvIN1LaUgnkXEwEwHPXbkxIpX1
	9XDtiLz0OUkjzXCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748154783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RjHHGqSB4eHlq5L3HKciHLIzSzNnPIHC/XuF5r4tJU=;
	b=jATYJdyA9iueG+TbdkiPNKsplqgrG8dvvxPsr4qozyEba8qeSySi24KhLzZq95VRY2XdHD
	hYGpfpAaVN60Lf0m90PyO5xCCkIgTlCrqNH5/jbBvdl+66Nqwc1kmA+4UbZi+o8xMNjIK0
	83nAb0EbscEMd4LValBtf2OIAWioPd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748154783;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RjHHGqSB4eHlq5L3HKciHLIzSzNnPIHC/XuF5r4tJU=;
	b=pWakeYi16yD52z+znmc5iOsKNC9tp8HFQyIGd6Hxc52sDvIN1LaUgnkXEwEwHPXbkxIpX1
	9XDtiLz0OUkjzXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A36D1386D;
	Sun, 25 May 2025 06:33:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7+6nHp65Mmi6WAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sun, 25 May 2025 06:33:02 +0000
Date: Sun, 25 May 2025 08:32:56 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= Navarro <rcn@igalia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, revest@google.com,
	kernel-dev@igalia.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: fix copy_vma() error handling for hugetlb mappings
Message-ID: <aDK5mGfiRxBREBc0@localhost.localdomain>
References: <20250523-warning_in_page_counter_cancel-v2-1-b6df1a8cfefd@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523-warning_in_page_counter_cancel-v2-1-b6df1a8cfefd@igalia.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.23
X-Spamd-Result: default: False [-1.23 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.13)[-0.671];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

On Fri, May 23, 2025 at 02:19:10PM +0200, Ricardo Cañuelo Navarro wrote:
> If, during a mremap() operation for a hugetlb-backed memory mapping,
> copy_vma() fails after the source vma has been duplicated and
> opened (ie. vma_link() fails), the error is handled by closing the new
> vma. This updates the hugetlbfs reservation counter of the reservation
> map which at this point is referenced by both the source vma and the new
> copy. As a result, once the new vma has been freed and copy_vma()
> returns, the reservation counter for the source vma will be incorrect.
> 
> This patch addresses this corner case by clearing the hugetlb private
> page reservation reference for the new vma and decrementing the
> reference before closing the vma, so that vma_close() won't update the
> reservation counter. This is also what copy_vma_and_data() does with the
> source vma if copy_vma() succeeds, so a helper function has been added
> to do the fixup in both functions.
> 
> The issue was reported by a private syzbot instance and can be
> reproduced using the C reproducer in [1]. It's also a possible duplicate
> of public syzbot report [2]. The WARNING report is:
> 
... 
> Signed-off-by: Ricardo Cañuelo Navarro <rcn@igalia.com>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Link: https://people.igalia.com/rcn/kernel_logs/20250422__WARNING_in_page_counter_cancel__repro.c [1]
> Link: https://lore.kernel.org/all/67000a50.050a0220.49194.048d.GAE@google.com/ [2]

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
