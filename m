Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180CE2561DA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035710; cv=none; b=Esy2f1hUFHeU2iPyQ+XXcibtldkTA9aIT57RHQlRj9eBSeyGHgUT4mv6BtHJN2okJGcPnSJkQ3q+CSB5zz28E8LLlvI3Y9cytxzTOTvnlxRhJVzV5l7U9JyHsMRCDy8kEDgHWFFmJK+yyQK2lmMy0JvBKqLYHb17pTINC77unD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035710; c=relaxed/simple;
	bh=mGFMxFi8gV1FZG7cdKx2Wa/G8Db/zL6Azj0mflCpcrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6xj6MBdW8yJzXbSrBRKZ9NXskTqkQPJCFbiJYmm+zPOQ85Xs0qTcnTdLEE8EZT6uhej+cZWKxGioC0bpGoWIfeBy8iiLY9OOHKRF6fI6l/FEks+FHhRGKN6eIayNsd6oMF3gb8rBR5Hu5kSct0clsBh38q2QH2OBzt3F/ff6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=z3ZJTNgY; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=gyj4OweD; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=C54bnwzF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WBPUIc8U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="z3ZJTNgY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="gyj4OweD";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="C54bnwzF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WBPUIc8U"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B71E211E0;
	Mon, 12 May 2025 07:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747035707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEZr+WVH1VP++sq8Otf7yGKS8ph1a7hu6dnNw62+7xw=;
	b=z3ZJTNgYV9pq+J5YDGoltbvcLclD6dEbGa8I4xr/jz0m3jeIVwABRSPjy5bqWYioWrfFi2
	vhjOnmgQ9BxM6AKfkEtju+yhQQ9mCKLnn4ygrTy2v9YmzrlteFlYhfNTVdxMYsqcw5ukkK
	xxFWALxVZtv0udGmPtGcq7NR0jWjmS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747035707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEZr+WVH1VP++sq8Otf7yGKS8ph1a7hu6dnNw62+7xw=;
	b=gyj4OweDtrqB9pU0c9OKtzrzAtSRATVSqEz9Ftf4iTx4OKXl5gfTRxT7Cg3pHOfXtXhC1j
	z9y/Dj2l10nVo7BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747035706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEZr+WVH1VP++sq8Otf7yGKS8ph1a7hu6dnNw62+7xw=;
	b=C54bnwzFVopUn40NKKGijYZzIVsoDr+MKz0y8YQNC8lc3LhXnEnwIKDNNCm+hPkkZcv4/g
	d7ExMP9n512snqMZgmFp9MtcV/3oue4JRT99jrqEvXhWaRIr9mdQ9Bq4nGk/vJK2/jjgG1
	rOMnXlEj0ePY2G/O+xsJivFT/JR46p8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747035706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEZr+WVH1VP++sq8Otf7yGKS8ph1a7hu6dnNw62+7xw=;
	b=WBPUIc8UxaadDhPzm0udi9v2Nr4I3+X5BnMBAXOXoOWWkxNvgHJTLr5SCeqWHK1SLYX6Ag
	XfLg+QdXCF02SoAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 098F7137D2;
	Mon, 12 May 2025 07:41:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T5RPADqmIWiMDwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 12 May 2025 07:41:46 +0000
Message-ID: <f17ba5e9-ac1a-4827-9a56-0ba09d635e87@suse.cz>
Date: Mon, 12 May 2025 09:41:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid]

On 5/8/25 17:28, Lorenzo Stoakes wrote:
> Currently kernel/fork.c both contains absolutely key logic relating to a
> number of kernel subsystems and also has absolutely no assignment in
> MAINTAINERS.
> 
> Correct this by placing this file in relevant sections - mm core, exec,
> scheduler and pidfd so people know who to contact when making changes here.
> 
> scripts/get_maintainers.pl can perfectly well handle a file being in
> multiple sections, so this functions correctly.
> 
> Intent is that we keep putting changes to kernel/fork.c through Andrew's
> tree.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccc45b0ba843..55332d5bc499 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8830,6 +8830,7 @@ F:	include/linux/elf.h
>  F:	include/uapi/linux/auxvec.h
>  F:	include/uapi/linux/binfmts.h
>  F:	include/uapi/linux/elf.h
> +F:	kernel/fork.c
>  F:	mm/vma_exec.c
>  F:	tools/testing/selftests/exec/
>  N:	asm/elf.h
> @@ -15525,6 +15526,7 @@ F:	include/linux/mm.h
>  F:	include/linux/mm_*.h
>  F:	include/linux/mmdebug.h
>  F:	include/linux/pagewalk.h
> +F:	kernel/fork.c
>  F:	mm/Kconfig
>  F:	mm/debug.c
>  F:	mm/init-mm.c
> @@ -21742,6 +21744,7 @@ F:	include/linux/preempt.h
>  F:	include/linux/sched.h
>  F:	include/linux/wait.h
>  F:	include/uapi/linux/sched.h
> +F:	kernel/fork.c
>  F:	kernel/sched/
>  
>  SCHEDULER - SCHED_EXT

