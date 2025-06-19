Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F25269B01
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340665; cv=none; b=mi29iI52Gp+Cz6BJcJJsUE9vC9abLUiW8iqv5FkpHBHQo1GsUlc1O2uGfzclPwy6VMf5tk2fbCDQ4s78ykDEeFx2nMxekVG0tT++43rPgqDe3szXS9TYyJdJ6i2tZTgEiGP5ZrIg9opHxj4RYnqzmCzKEiILyEg7B9kT2iQsZiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340665; c=relaxed/simple;
	bh=HVqeC48N1cUFcSWdsmh+VpvQPJrtZxJ2xVfXF08G4qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BENL3AJzFkxuKdJZZDAKuIPxAGRS3xVXUTvcI8wFaYUZgkd9DZ/dBwcD2vUK8ffQyVrvHiN4oD651JoMU/uQVI3ZY8i7t9J7to7tQi5HRWmpn+id5QicX1cJQGHFXi7FTyWRMagCYZZ8XkcuJOIdFHSuydAUkg8bxhXj5HyuRRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=meJEbItU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kT0eqKZ8; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=meJEbItU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kT0eqKZ8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="meJEbItU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kT0eqKZ8";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="meJEbItU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kT0eqKZ8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ABB8C21197;
	Thu, 19 Jun 2025 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750340661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vE+0s1lYm1T1NM1GtVBjtDn0WvdG3ES0gUD74JCiFFQ=;
	b=meJEbItU75wc0jIVoshCNbce/5TiPJSZx88sm/HSj/ahxi458TByT1/bX9Ev+aU5VrmIW2
	h/dhYvauCK0+znOIdH/toqj8oblsz4YIthLxeoPQSrDl6GYaJmiVtXtMC64mz1BQwtoGjn
	K5MPk2Mmx6ch40Ps0gLrpjTlN1Ga6l0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750340661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vE+0s1lYm1T1NM1GtVBjtDn0WvdG3ES0gUD74JCiFFQ=;
	b=kT0eqKZ8zp5/OzMh807JMbpUuyfp3cocR+zLwIPAIjwpnpubNcq0kXG7LnXKEGkGEIPU/i
	fINr4FWBxCOnSQDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=meJEbItU;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=kT0eqKZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750340661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vE+0s1lYm1T1NM1GtVBjtDn0WvdG3ES0gUD74JCiFFQ=;
	b=meJEbItU75wc0jIVoshCNbce/5TiPJSZx88sm/HSj/ahxi458TByT1/bX9Ev+aU5VrmIW2
	h/dhYvauCK0+znOIdH/toqj8oblsz4YIthLxeoPQSrDl6GYaJmiVtXtMC64mz1BQwtoGjn
	K5MPk2Mmx6ch40Ps0gLrpjTlN1Ga6l0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750340661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vE+0s1lYm1T1NM1GtVBjtDn0WvdG3ES0gUD74JCiFFQ=;
	b=kT0eqKZ8zp5/OzMh807JMbpUuyfp3cocR+zLwIPAIjwpnpubNcq0kXG7LnXKEGkGEIPU/i
	fINr4FWBxCOnSQDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EC37136CC;
	Thu, 19 Jun 2025 13:44:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ozIYIjUUVGgmFQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 19 Jun 2025 13:44:21 +0000
Message-ID: <7a1d94ca-65a1-4b60-83a7-055c69d5c882@suse.cz>
Date: Thu, 19 Jun 2025 15:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vma: use vmg->target to specify target VMA for new VMA
 merge
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Kees Cook <kees@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250613184807.108089-1-lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250613184807.108089-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: ABB8C21197
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On 6/13/25 20:48, Lorenzo Stoakes wrote:
> In commit 3a75ccba047b ("mm: simplify vma merge structure and expand
> comments") we introduced the vmg->target field to make the merging of
> existing VMAs simpler - clarifying precisely which VMA would eventually
> become the merged VMA once the merge operation was complete.
> 
> New VMA merging did not get quite the same treatment, retaining the rather
> confusing convention of storing the target VMA in vmg->middle.
> 
> This patch corrects this state of affairs, utilising vmg->target for this
> purpose for both vma_merge_new_range() and also for vma_expand().
> 
> We retain the WARN_ON for vmg->middle being specified in
> vma_merge_new_range() as doing so would make no sense, but add an
> additional debug assert for setting vmg->target.
> 
> This patch additionally updates VMA userland testing to account for this
> change.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Nit below:

> @@ -1086,27 +1087,29 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
>   * @vmg: Describes a VMA expansion operation.
>   *
>   * Expand @vma to vmg->start and vmg->end.  Can expand off the start and end.
> - * Will expand over vmg->next if it's different from vmg->middle and vmg->end ==
> - * vmg->next->vm_end.  Checking if the vmg->middle can expand and merge with
> + * Will expand over vmg->next if it's different from vmg->target and vmg->end ==
> + * vmg->next->vm_end.  Checking if the vmg->target can expand and merge with
>   * vmg->next needs to be handled by the caller.
>   *
>   * Returns: 0 on success.
>   *
>   * ASSUMPTIONS:
> - * - The caller must hold a WRITE lock on vmg->middle->mm->mmap_lock.
> - * - The caller must have set @vmg->middle and @vmg->next.
> + * - The caller must hold a WRITE lock on vmg->target->mm->mmap_lock.

The assert uses vmg->mm so maybe the comment should do the same? (IIRC mm
was added only later to vmg?)

> + * - The caller must have set @vmg->target and @vmg->next.
>   */
>  int vma_expand(struct vma_merge_struct *vmg)
>  {
>  	struct vm_area_struct *anon_dup = NULL;
>  	bool remove_next = false;
> -	struct vm_area_struct *middle = vmg->middle;
> +	struct vm_area_struct *target = vmg->target;
>  	struct vm_area_struct *next = vmg->next;
> 
> +	VM_WARN_ON_VMG(!target, vmg);
> +
>  	mmap_assert_write_locked(vmg->mm);
> 
> -	vma_start_write(middle);
> -	if (next && (middle != next) && (vmg->end == next->vm_end)) {
> +	vma_start_write(target);
> +	if (next && (target != next) && (vmg->end == next->vm_end)) {
>  		int ret;
> 
>  		remove_next = true;
