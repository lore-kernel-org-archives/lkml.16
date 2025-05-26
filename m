Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F753D994
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748264739; cv=none; b=PzX9rpnnl+iXNAaeBrICkd3aC4HkZkrQMPRJwDBpZJG9Xz0L78xGH2xZJPbeuQfOrSaVtHmGM2yJ8hvLJMERt4bymkbfvTSMy2AC8eQzgscSxEQVR1JLmbUt+huW69nrem7hwPzzTYaUHXV0vUUWygUYgI/aYnWsHpkBfBjS0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748264739; c=relaxed/simple;
	bh=v6mTVe0r5No8ZR8UOkYZb9izq2c0MULyKys9hf6Lj3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rur7by6R2g7dUqhgWfeLCWJK5BsKYMestumyvB2nAkLEAITmgHQC4UgOyKPU3IA8Z222KSbwb4UyiY4niqnfm55mXpJp46hKUXQtOuw6lhEWK4vKXV/dDeDgW9ZiaOGS34g0wmrbTajcTZdKXpiFlnXQxwWBAh6gPByMzeQ++Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sc/Tn5ef; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1+oGpO6p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sc/Tn5ef; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1+oGpO6p; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sc/Tn5ef";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1+oGpO6p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sc/Tn5ef";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1+oGpO6p"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3888221E64;
	Mon, 26 May 2025 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748264735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J3tMyCqiSjE1kJCU79um7mmnKprlw8Ww67GaVrX9wMI=;
	b=sc/Tn5efiky60/oSmdURgugLyuiFyo/brtdhqTsiobxDIucfG2/wmxFSeDTOdk5mAeCjA3
	ClZSAJLTSiy9PqUmEopksmhrs7CP0DA4zZrpZEsgHrhRrTyzF68BivNxB76ZE1hyCLDdGl
	s52tLw1HhyuYtYiVuu53iCK0xcw5epo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748264735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J3tMyCqiSjE1kJCU79um7mmnKprlw8Ww67GaVrX9wMI=;
	b=1+oGpO6p1fUgvv27Uv+IYq5LtKCly0vJGC++X4oMIJC/NE9MkjDSs8laUZuK1lBnGYzKKp
	e11xl7nHEkjmudCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748264735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J3tMyCqiSjE1kJCU79um7mmnKprlw8Ww67GaVrX9wMI=;
	b=sc/Tn5efiky60/oSmdURgugLyuiFyo/brtdhqTsiobxDIucfG2/wmxFSeDTOdk5mAeCjA3
	ClZSAJLTSiy9PqUmEopksmhrs7CP0DA4zZrpZEsgHrhRrTyzF68BivNxB76ZE1hyCLDdGl
	s52tLw1HhyuYtYiVuu53iCK0xcw5epo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748264735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J3tMyCqiSjE1kJCU79um7mmnKprlw8Ww67GaVrX9wMI=;
	b=1+oGpO6p1fUgvv27Uv+IYq5LtKCly0vJGC++X4oMIJC/NE9MkjDSs8laUZuK1lBnGYzKKp
	e11xl7nHEkjmudCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A897013964;
	Mon, 26 May 2025 13:05:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NShTJh5nNGjqMAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 26 May 2025 13:05:34 +0000
Date: Mon, 26 May 2025 15:05:23 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: yangge1116@126.com, akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
	liuzixing@hygon.cn
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
Message-ID: <aDRnE8B27VgCoJ3N@localhost.localdomain>
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
 <427043ca-ae91-4386-8ffd-aaf164773226@redhat.com>
 <347b3035-26fe-43af-8df4-b1610d305908@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <347b3035-26fe-43af-8df4-b1610d305908@redhat.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[126.com,linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,linux.alibaba.com,linux.dev,hygon.cn];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On Mon, May 26, 2025 at 02:23:58PM +0200, David Hildenbrand wrote:
> Already in 6.15, gah.
> 
> Please convert that code to never ever take any hugeglb locks unless we are
> clearly dealing with a hugetlb folios.

I guess we could just do?

 diff --git a/mm/hugetlb.c b/mm/hugetlb.c
 index 20f08de9e37d..8bd8b950e4cb 100644
 --- a/mm/hugetlb.c
 +++ b/mm/hugetlb.c
 @@ -2911,7 +2914,7 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
  	while (start_pfn < end_pfn) {
  		folio = pfn_folio(start_pfn);
 
 -		if (!folio_ref_count(folio)) {
 +		if (!folio_ref_count(folio) && folio_test_hugetlb(folio)) {
  			ret = alloc_and_dissolve_hugetlb_folio(folio,
  							       &isolate_list);
  			if (ret)
 
 

-- 
Oscar Salvador
SUSE Labs
