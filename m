Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556E25E440
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017431; cv=none; b=ErjW0JnEMpacvAXLlktXhck7Y1PbCpu5rJMutDOcGt+ydk8428rvgxLdiT7zRVeN+rOZxFiBHJAzvDm8GZchRNNVi+CqoepNG0kqOLBNvDSwbG111070AGWRtrJlP+7GjIjKE5HD8zrT+MRkcC+Wiq/otmMaemtdsShzk0GujoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017431; c=relaxed/simple;
	bh=N8Tjaqp3Wh2fAwXzbNc6cCgM1Gvp5iI7X4kOTjYb6BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpGFFRCrU0uX4Q7pzg5YL5ZPlhdNCZ9b3hTAIXdpfsCbfzjekCwqoL7MEE89F4jD2Q6mkVXLfE4QCbQxRTYaCDoEWsgP5v09jIkQ/psYzY6UL82jLs5BI9YVPPxjn9ty8WJaJkN0QgIp8Cad1L4p7fl6enKh8632sXyjFP/mZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pdqb0ZUs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=N8XDfeiH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pdqb0ZUs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=N8XDfeiH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pdqb0ZUs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="N8XDfeiH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pdqb0ZUs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="N8XDfeiH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8935A1F803;
	Wed, 30 Apr 2025 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746017427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAQsAJDu2Xsow/E+rnqPZAXpSfb62jraBdxQTN9tQE4=;
	b=pdqb0ZUsmCD3gO1/vHbPocFiWxpO6NKO+6v+8QxbH9K9GogayFwiIyQ0vjaE/BOuctCL4d
	8mljHt5ff1GimF1IluoniaHHGN8RmGvGtTUCDJfyxF4FZ94s0b+z8H7AMa/LnrKDBzz6jN
	NiqRhDNKOWw39TF1CGgRNTeTPT7nisw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746017427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAQsAJDu2Xsow/E+rnqPZAXpSfb62jraBdxQTN9tQE4=;
	b=N8XDfeiH7rDIj9calH6R1qfb8zeFMhIwrJhPzxiXS641SM5IaQYdO3q/2+71WWRqRcjJ8N
	4+gEYa0kqVNvV9Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=pdqb0ZUs;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=N8XDfeiH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746017427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAQsAJDu2Xsow/E+rnqPZAXpSfb62jraBdxQTN9tQE4=;
	b=pdqb0ZUsmCD3gO1/vHbPocFiWxpO6NKO+6v+8QxbH9K9GogayFwiIyQ0vjaE/BOuctCL4d
	8mljHt5ff1GimF1IluoniaHHGN8RmGvGtTUCDJfyxF4FZ94s0b+z8H7AMa/LnrKDBzz6jN
	NiqRhDNKOWw39TF1CGgRNTeTPT7nisw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746017427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAQsAJDu2Xsow/E+rnqPZAXpSfb62jraBdxQTN9tQE4=;
	b=N8XDfeiH7rDIj9calH6R1qfb8zeFMhIwrJhPzxiXS641SM5IaQYdO3q/2+71WWRqRcjJ8N
	4+gEYa0kqVNvV9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72F4E13A25;
	Wed, 30 Apr 2025 12:50:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l0NUG5McEmiJZgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 30 Apr 2025 12:50:27 +0000
Message-ID: <921a7a3f-8552-4eb0-880b-9dac822ed256@suse.cz>
Date: Wed, 30 Apr 2025 14:50:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Content-Language: en-US
To: Wei Yang <richard.weiyang@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
 Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250430004703.63rumj4znewlbc2h@master>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8935A1F803
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com,oracle.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/30/25 02:47, Wei Yang wrote:
> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
> [...]
>>+bool vma_had_uncowed_children(struct vm_area_struct *vma)
>>+{
>>+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
>>+	bool ret;
>>+
>>+	if (!anon_vma)
>>+		return false;
>>+
>>+	/*
>>+	 * If we're mmap locked then there's no way for this count to change, as
>>+	 * any such change would require this lock not be held.
>>+	 */
>>+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
>>+		return anon_vma->num_children > 1;
> 
> Hi, Lorenzo
> 
> May I have a question here?

You're missing the actual question :)

>>+
>>+	/*
>>+	 * Any change that would increase the number of children would be
>>+	 * prevented by a read lock.
>>+	 */
>>+	anon_vma_lock_read(anon_vma);
>>+	ret = anon_vma->num_children > 1;
>>+	anon_vma_unlock_read(anon_vma);
>>+
>>+	return ret;
>>+}
> 

