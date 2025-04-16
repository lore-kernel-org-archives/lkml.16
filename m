Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE491DDC1A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814448; cv=none; b=G6q1DKW9dKV7Lx67Cdfn6eJH+dVCkVCuaLbLDVy6nYepxziwkUebxr9mA3IgRguGSxcY3LmHPYZe/LQ1x2eAzvjJKSzMgWJsU1aky4CKDJrBnpOrXzKGJEnq/88Oo6rXhG9MG1kGgnq47ZQ4/vvf7BC9gnhOAAWXLoF81V8ALik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814448; c=relaxed/simple;
	bh=LlSof9T7ik9gf9n0oMjYZlsp6af6FKP0YulqfG9qtzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgZbP6o1aLv9ZFSEQvmsd47TA0fRtJFDhIHt3wttCE3VyGDQswfCtNcmVWBHMrvCRCb6d+TuC6V0Vol9iSp92nskhJGUNbc27va0NR7BfjLi1e27ZcoKQO5ETGVW7/hDtemV+JjbiNg/RscAFOc5/DWIxtgZ8rZQEqzxGx/ryK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OHhcSz9G; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IO7xzOke; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OHhcSz9G; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IO7xzOke; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OHhcSz9G";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IO7xzOke";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OHhcSz9G";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IO7xzOke"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D04A21134;
	Wed, 16 Apr 2025 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744814444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HWystX7c8kYn5ynSfBxkhfZbbNgIK7hEFRP0uVGa2s=;
	b=OHhcSz9GO5BZbX4a673DLXKlfs8XN2SYWa5JZcADTJdWjPhR462cKS2cRuc2l93OQ3deVU
	5+rJl3Pyl/h8q2JwbfQJoBUqCkT8pKybFaef/45IwWCHLcGqZSRV1j5frkjJ/2qsLBdwb8
	oAnQDkkSx4vaBQXtAd4sSCnAXycino4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744814444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HWystX7c8kYn5ynSfBxkhfZbbNgIK7hEFRP0uVGa2s=;
	b=IO7xzOkem5IGLr6h8EmL8wAtElo+fVqZhUROYJ4JOZQ+NyZhoYXmVMQmTZGGJCo0SVe4/n
	wOguomPfgeMGHnAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744814444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HWystX7c8kYn5ynSfBxkhfZbbNgIK7hEFRP0uVGa2s=;
	b=OHhcSz9GO5BZbX4a673DLXKlfs8XN2SYWa5JZcADTJdWjPhR462cKS2cRuc2l93OQ3deVU
	5+rJl3Pyl/h8q2JwbfQJoBUqCkT8pKybFaef/45IwWCHLcGqZSRV1j5frkjJ/2qsLBdwb8
	oAnQDkkSx4vaBQXtAd4sSCnAXycino4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744814444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HWystX7c8kYn5ynSfBxkhfZbbNgIK7hEFRP0uVGa2s=;
	b=IO7xzOkem5IGLr6h8EmL8wAtElo+fVqZhUROYJ4JOZQ+NyZhoYXmVMQmTZGGJCo0SVe4/n
	wOguomPfgeMGHnAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57CAA139A1;
	Wed, 16 Apr 2025 14:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l+sYFWzB/2cCUgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 16 Apr 2025 14:40:44 +0000
Message-ID: <23311d9f-ca6f-4dbe-a24d-a5ef244173d2@suse.cz>
Date: Wed, 16 Apr 2025 16:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] MAINTAINERS: add section for locking of mm's and
 VMAs
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney"
 <paulmck@kernel.org>, SeongJae Park <sj@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
 <e6ed679a184ca444b20dfa77af96913fd8b5efa0.1744799282.git.lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <e6ed679a184ca444b20dfa77af96913fd8b5efa0.1744799282.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,linux.dev:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/16/25 12:38, Lorenzo Stoakes wrote:
> We place this under memory mapping as related to memory mapping
> abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> files, so this should encapsulate the majority of the mm locking logic in
> the kernel.
> 
> Suren is best placed to maintain this logic as the core architect of VMA
> locking as a whole.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: David Hildenbrand <david@redhat.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

> ---
>  MAINTAINERS | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..03bbc41138c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15595,6 +15595,22 @@ F:	mm/vma_internal.h
>  F:	tools/testing/selftests/mm/merge.c
>  F:	tools/testing/vma/
>  
> +MEMORY MAPPING - LOCKING
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	Suren Baghdasaryan <surenb@google.com>
> +M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/mm/process_addrs.rst
> +F:	include/linux/mmap_lock.h
> +F:	include/trace/events/mmap_lock.h
> +F:	mm/mmap_lock.c
> +
>  MEMORY MAPPING - MADVISE (MEMORY ADVICE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Liam R. Howlett <Liam.Howlett@oracle.com>

