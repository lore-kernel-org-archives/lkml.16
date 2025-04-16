Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A81C4A10
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814394; cv=none; b=rt1n2GHtZ3IeN8dcn1ZMnxa6SFuLmi5FsUMBh7xVRtEkMqtrHQ+6nvHyW5XDlsaaGkM9yGmM/XFeZJb2QCdmNVrdfQRZIL5gD0dQVDItfZ1xv9SUgs9il2Hjb5vbl0BRt/jSMYs3+3OOZOY3WjTZ+fUMxwySGRmxkJCN0O0Fs8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814394; c=relaxed/simple;
	bh=NyZp/p3u2cqQ86sFlG7CkAc5YLzn/UsQ8tCS7qoyq5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7jsiARA3NnedpZ4x+SOVcpN1OjU5AgL5cN4Y90YWSrbJTnvD3zeSb6e772DxMDPuMaP8ymzuTJPMqlwqw+HrO019r23BWYNNZPGDp2SapuKnnuXoEcMPeiA4LOOXtGVrx0S0CyIiQhs61vsa7chEzoK3PfrSRM0PqYWbnhqKJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AryvKFhi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Dpf65gFj; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AryvKFhi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Dpf65gFj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AryvKFhi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Dpf65gFj";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AryvKFhi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Dpf65gFj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C47941F6E6;
	Wed, 16 Apr 2025 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744814390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLi331sN5ip6RGEh/ki6qgktOXffAwJ91DpfOXL038w=;
	b=AryvKFhitmo9kIsFuEaJ+YZkL3oFlpwFgazpBWpuW25HgCApUNGbdNoLpsQfI7CWgv5Tk3
	lXtqjTWMBRQ94eD27QgQRX09Mrezbfxqe97WvWvgirlkr6NiVj/Vjmp6eoxAKmvyhGikJ/
	QqcNKQzUeas2j8cAnzoyTKqZuD+zru0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744814390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLi331sN5ip6RGEh/ki6qgktOXffAwJ91DpfOXL038w=;
	b=Dpf65gFj15PgpFO3N3gkjTIErz92k9TrTi5aM5179k0Th0QDJnBbDvxLRHKeqJs6SVtl37
	gp5XsqiJ+AXwauCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=AryvKFhi;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Dpf65gFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744814390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLi331sN5ip6RGEh/ki6qgktOXffAwJ91DpfOXL038w=;
	b=AryvKFhitmo9kIsFuEaJ+YZkL3oFlpwFgazpBWpuW25HgCApUNGbdNoLpsQfI7CWgv5Tk3
	lXtqjTWMBRQ94eD27QgQRX09Mrezbfxqe97WvWvgirlkr6NiVj/Vjmp6eoxAKmvyhGikJ/
	QqcNKQzUeas2j8cAnzoyTKqZuD+zru0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744814390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLi331sN5ip6RGEh/ki6qgktOXffAwJ91DpfOXL038w=;
	b=Dpf65gFj15PgpFO3N3gkjTIErz92k9TrTi5aM5179k0Th0QDJnBbDvxLRHKeqJs6SVtl37
	gp5XsqiJ+AXwauCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADB39139A1;
	Wed, 16 Apr 2025 14:39:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BcsVKjbB/2e5UQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 16 Apr 2025 14:39:50 +0000
Message-ID: <4782b071-6008-4fd1-b762-65a575dc333a@suse.cz>
Date: Wed, 16 Apr 2025 16:39:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: move mmap/vma locking logic into specific
 files
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
 <bec6c8e29fa8de9267a811a10b1bdae355d67ed4.1744799282.git.lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <bec6c8e29fa8de9267a811a10b1bdae355d67ed4.1744799282.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C47941F6E6
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.cz:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 4/16/25 12:38, Lorenzo Stoakes wrote:
> Currently the VMA and mmap locking logic is entangled in two of the most
> overwrought files in mm - include/linux/mm.h and mm/memory.c. Separate this
> logic out so we can more easily make changes and create an appropriate
> MAINTAINERS entry that spans only the logic relating to locking.
> 
> This should have no functional change. Care is taken to avoid dependency
> loops, we must regrettably keep release_fault_lock() and
> assert_fault_locked() in mm.h as a result due to the dependence on the
> vm_fault type.
> 
> Additionally we must declare rcuwait_wake_up() manually to avoid a
> dependency cycle on linux/rcuwait.h.
> 
> Additionally move the nommu implementatino of lock_mm_and_find_vma() to
> mmap_lock.c so everything lock-related is in one place.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
> index e7dbaf96aa17..5f725cc67334 100644
> --- a/mm/mmap_lock.c
> +++ b/mm/mmap_lock.c
> @@ -42,3 +42,276 @@ void __mmap_lock_do_trace_released(struct mm_struct *mm, bool write)
>  }
>  EXPORT_SYMBOL(__mmap_lock_do_trace_released);
>  #endif /* CONFIG_TRACING */
> +
> +#ifdef CONFIG_MMU
> +#ifdef CONFIG_PER_VMA_LOCK

CONFIG_MMU is implied by CONFIG_PER_VMA_LOCK so you could move the first
#ifdef later to make only #ifdef CONFIG_LOCK_MM_AND_FIND_VMA nested in it.
But doesn't matter that much.

