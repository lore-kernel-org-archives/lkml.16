Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C613CA97
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412425; cv=none; b=JgGp/T/rVqev4zpItwtEsVctx4iYmafOa2nZ0DVvYwj52bIzjvcrXPE5lBHivOUh6fMslLHap2uELfEVwGuQRQUVIvoeu5dmpUxq/GmR5nqwo5zsBpBzP8vCffqwChGAJfFs9AZ+DVebUettLXlCvp+qCSGej8Fk1LQqKLbFbSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412425; c=relaxed/simple;
	bh=Bky+8MWF/6TmbU/epiFIkxPUy3Xfu9g81VIhsMxMqf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQpGVwPkjCDU+JBP8GcrLWV4yy5omqRMftfF6AQJ1Qqcv9Xlgojw+/g89O11Fz5NM7IAZHIdj1wt6G3FOfL4peuUBN9vvfOgShBr7i9zi33+gsGfX4fKwvttxKJ3i0GF2lTyd5B3LOKsQNLgzmHdDSQDVIY6VsIjkb8M1NMOKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ob9K7zGZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=T49yfcsa; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ob9K7zGZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=T49yfcsa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ob9K7zGZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="T49yfcsa";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ob9K7zGZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="T49yfcsa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C7241F38D;
	Mon, 31 Mar 2025 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743412422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kLXXsGlHWZwkUdNRUUIH6VKKJXq9knD8wm0PDXl9TA=;
	b=Ob9K7zGZriqXDcgnkkYBJa+J5iYWdg4MVtA5kS4UGqDc18oscD7NU95KnMMU2vrP4Iax4T
	IxO9JBt81j1ZCIo+yZLSGGgkqiR4lz0rB180foYtkzH5VXUtX/uZfLMMmnHkHrc/2TM4n0
	2juyluPsb0MEAMW9DSDe5ojM9661bV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743412422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kLXXsGlHWZwkUdNRUUIH6VKKJXq9knD8wm0PDXl9TA=;
	b=T49yfcsaNp42G+BFa80QKFXFFG7g5551rV2UbUtQ6TPTxB+zy/Z+I44NTuwWKN7VIn/uUU
	hZv1Wq53e7/NB3Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Ob9K7zGZ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=T49yfcsa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743412422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kLXXsGlHWZwkUdNRUUIH6VKKJXq9knD8wm0PDXl9TA=;
	b=Ob9K7zGZriqXDcgnkkYBJa+J5iYWdg4MVtA5kS4UGqDc18oscD7NU95KnMMU2vrP4Iax4T
	IxO9JBt81j1ZCIo+yZLSGGgkqiR4lz0rB180foYtkzH5VXUtX/uZfLMMmnHkHrc/2TM4n0
	2juyluPsb0MEAMW9DSDe5ojM9661bV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743412422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kLXXsGlHWZwkUdNRUUIH6VKKJXq9knD8wm0PDXl9TA=;
	b=T49yfcsaNp42G+BFa80QKFXFFG7g5551rV2UbUtQ6TPTxB+zy/Z+I44NTuwWKN7VIn/uUU
	hZv1Wq53e7/NB3Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0310F13A1F;
	Mon, 31 Mar 2025 09:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ms/fOcVc6mcSTAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 31 Mar 2025 09:13:41 +0000
Message-ID: <cf12cbac-e8c7-45dd-ac5a-93a60f6e87be@suse.cz>
Date: Mon, 31 Mar 2025 11:13:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] mm/mremap: initial refactor of move_vma()
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jann Horn
 <jannh@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Harry Yoo <harry.yoo@oracle.com>, Yosry Ahmed <yosry.ahmed@linux.dev>,
 Oliver Sang <oliver.sang@intel.com>, Yi Lai <yi1.lai@linux.intel.com>
References: <cover.1741639347.git.lorenzo.stoakes@oracle.com>
 <ab611d6efae11bddab2db2b8bb3925b1d1954c7d.1741639347.git.lorenzo.stoakes@oracle.com>
 <b2fb6b9c-376d-4e9b-905e-26d847fd3865@lucifer.local>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <b2fb6b9c-376d-4e9b-905e-26d847fd3865@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1C7241F38D
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 3/30/25 18:52, Lorenzo Stoakes wrote:
> On Mon, Mar 10, 2025 at 08:50:37PM +0000, Lorenzo Stoakes wrote:
>> Update move_vma() to use the threaded VRM object, de-duplicate code and
>> separate into smaller functions to aid readability and debug-ability.
>>
>> This in turn allows further simplification of expand_vma() as we can
>> simply thread VRM through the function.
> 
> [snip]
> 
> Andrew - I enclose a fix-patch for the issue kindly reported in [0] by Yi
> Lai. Since you've not sent the PR to Linus yet maybe you could squash this
> in? Otherwise obviously one for 6.15-rc1.
> 
> I've tested against the repro and confirm it fixes it, also the fix is
> 'obvious' as is the cause. I have replied to [0] with an explanation there
> also inline.
> 
> Apologies for missing this before!
> 
> Thanks, Lorenzo
> 
> [0]: https://lore.kernel.org/linux-mm/Z+lcvEIHMLiKVR1i@ly-workstation/
> 
> ----8<----
> From 3709f42feb30e2cfe2f39527d4cd8c74a9e8b724 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Sun, 30 Mar 2025 17:20:48 +0100
> Subject: [PATCH] mm/mremap: do not set vrm->vma NULL immediately prior to
>  checking it
> 
> This seems rather unwise. If we cannot merge, extend, then we need to
> recall the original VMA to see if we need to uncharge.
> 
> If we do need to, do so.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Can we get a testcase that hits this path? :)

> 
> ---
>  mm/mremap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 0865387531ed..7db9da609c84 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1561,11 +1561,12 @@ static unsigned long expand_vma_in_place(struct vma_remap_struct *vrm)
>  	 * adjacent to the expanded vma and otherwise
>  	 * compatible.
>  	 */
> -	vma = vrm->vma = vma_merge_extend(&vmi, vma, vrm->delta);
> +	vma = vma_merge_extend(&vmi, vma, vrm->delta);
>  	if (!vma) {
>  		vrm_uncharge(vrm);
>  		return -ENOMEM;
>  	}
> +	vrm->vma = vma;
> 
>  	vrm_stat_account(vrm, vrm->delta);
> 
> --
> 2.49.0

