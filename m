Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD229A2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226580; cv=none; b=QbAkgRJV9mzBSrDGMYdZ5LXXXzgKokBKizcPeTfUoJtMeMiCyv33CwzBIgxB6IKwJFZy/sVejiPkToSLBoW2XoFug22439Y7fz5C0ql/S6qxP/IjDCAaFV+ns4a3MyLZa5FCJSLddONTAlUqukCWPtohNpUHZLrDotqHcCe9HkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226580; c=relaxed/simple;
	bh=8H/VCzplXKUBZOF313iKsB6xpBniNPQjYp2oot0Da6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCz7m58x7eNuvU5reR1kxhAIClfXV9sn+dk6VuBW8qJFPsmSxvj/0yyJEk0cdQUCFT7PcVoQmUDVW4U0FECNYYWWFErlblAbfz5wU8jxI+7m0kLlw7eSslxW6EoS8oACt42RwxvJHFlqkLwDxcomtIB557Urciwg78KpxJUktSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=QlyJ72SN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=meyKTMOF; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=QlyJ72SN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=meyKTMOF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="QlyJ72SN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="meyKTMOF";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="QlyJ72SN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="meyKTMOF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3240522D41;
	Fri,  6 Jun 2025 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749226577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KmX6k6ykMpKa7Vw6PmwuNM7YaceN5+edcU5ngSZkNDU=;
	b=QlyJ72SNoaD5AoknDntbBw0UFL67rxA/8cuyJKcaH+0SpTj94DjAePV0QXHeRrM2jbzFz+
	x8j8HM/jp9QKXxIXQCuC+O6JGbVi3iWWnaiM8ciRnCbTS1rO5JawEKnz1m/yHNwm3mIYpD
	8KWzyOtilnaHDOwH9h9km594opCwt20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749226577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KmX6k6ykMpKa7Vw6PmwuNM7YaceN5+edcU5ngSZkNDU=;
	b=meyKTMOFImRwBV7mLEYKpDqvYrQR9ntF1879lBHac0chi6OZZRqcY3y89ZPh/g9K4+fDZp
	+RUbwGOxlFhOeDBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749226577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KmX6k6ykMpKa7Vw6PmwuNM7YaceN5+edcU5ngSZkNDU=;
	b=QlyJ72SNoaD5AoknDntbBw0UFL67rxA/8cuyJKcaH+0SpTj94DjAePV0QXHeRrM2jbzFz+
	x8j8HM/jp9QKXxIXQCuC+O6JGbVi3iWWnaiM8ciRnCbTS1rO5JawEKnz1m/yHNwm3mIYpD
	8KWzyOtilnaHDOwH9h9km594opCwt20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749226577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KmX6k6ykMpKa7Vw6PmwuNM7YaceN5+edcU5ngSZkNDU=;
	b=meyKTMOFImRwBV7mLEYKpDqvYrQR9ntF1879lBHac0chi6OZZRqcY3y89ZPh/g9K4+fDZp
	+RUbwGOxlFhOeDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1864F1336F;
	Fri,  6 Jun 2025 16:16:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u4tKBVEUQ2jpOgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 06 Jun 2025 16:16:17 +0000
Message-ID: <10e36f9f-5318-40bf-9f64-e254c7ccfbb9@suse.cz>
Date: Fri, 6 Jun 2025 18:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vma: reset VMA iterator on commit_merge() OOM failure
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250606125032.164249-1-lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250606125032.164249-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email]
X-Spam-Level: 

On 6/6/25 14:50, Lorenzo Stoakes wrote:
> While an OOM failure in commit_merge() isn't really feasible due to the
> allocation which might fail (a maple tree pre-allocation) being 'too small
> to fail', we do need to handle this case correctly regardless.
> 
> In vma_merge_existing_range(), we can theoretically encounter failures
> which result in an OOM error in two ways - firstly dup_anon_vma() might
> fail with an OOM error, and secondly commit_merge() failing, ultimately, to
> pre-allocate a maple tree node.
> 
> The abort logic for dup_anon_vma() resets the VMA iterator to the initial
> range, ensuring that any logic looping on this iterator will correctly
> proceed to the next VMA.
> 
> However the commit_merge() abort logic does not do the same thing. This
> resulted in a syzbot report occurring because mlockall() iterates through
> VMAs, is tolerant of errors, but ended up with an incorrect previous VMA
> being specified due to incorrect iterator state.
> 
> While making this change, it became apparent we are duplicating logic - the
> logic introduced in commit 41e6ddcaa0f1 ("mm/vma: add give_up_on_oom option
> on modify/merge, use in uffd release") duplicates the vmg->give_up_on_oom
> check in both abort branches.
> 
> Additionally, we observe that we can perform the anon_dup check safely on
> dup_anon_vma() failure, as this will not be modified should this call fail.
> 
> Finally, we need to reset the iterator in both cases, so now we can simply
> use the exact same code to abort for both.
> 
> We remove the VM_WARN_ON(err != -ENOMEM) as it would be silly for this to
> be otherwise and it allows us to implement the abort check more neatly.
> 
> Reported-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-mm/6842cc67.a00a0220.29ac89.003b.GAE@google.com/
> Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Nice.

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
