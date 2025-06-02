Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B01C8629
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852661; cv=none; b=Z1h0QbgtOVReQmOBM2kuDf7zUl0Z2bgS7R/3qp6dnimVE3K37ffexS/RijbMv8bnoCsrsKD1avh41ftaMwS4fQqndBzwax0krlin1470gz5uuIkW9d31GkQhENXiX7AEx7JxoH6tbBURwabvkZEj9g/E+xpyjImBbPrL6Muu928=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852661; c=relaxed/simple;
	bh=z9EmpY7z92fHZSjGH1Yqr+txuDTiN1BAAx38J8/utbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZgVAMYmhJmweRxexy4Zzv5z1H7Hi4VtypUfsJNzY9BewvhF7hdBoQXDkqkATsozxi2O/cidcCTiQOhAQhVcrA/cqMyaYRCf6xP8l9DM+rVQlqKP6GuZy4QDJ/I9E1D++F8Z8SLiY/kmKLBINwKAdGTAMxBlVrgZJ4FLsagTrk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=W4tM2GX7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=AtXtRF/U; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=W4tM2GX7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=AtXtRF/U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="W4tM2GX7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AtXtRF/U";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="W4tM2GX7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AtXtRF/U"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EF4A216F2;
	Mon,  2 Jun 2025 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748852655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UD8ca6htrwG56j6z357MyYbe+Zb0EK9l9LJ0+RTTU+E=;
	b=W4tM2GX7rvPd2XXYzV8zDIU1Epgm5FjaDac8C92eQb0GIK0pwzjjKMt/51cjR1P98nvs9Z
	rljke0qDewGTzDnPtS6ffAEGBS1Rr2eAIopwVTRWk8MHP/iUel2dVaGaRdun1RlywyNIS6
	FzskXD9a8aOx8EKBQ+ve8/LxZobWh/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748852655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UD8ca6htrwG56j6z357MyYbe+Zb0EK9l9LJ0+RTTU+E=;
	b=AtXtRF/UGAgXnwmlfaXoQsaQfS2eXrgzRTwGn8SWwL/QZbtAHlsJkkx6rXu/cGKMaVKZFb
	PNktu+GqQfD8mBCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748852655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UD8ca6htrwG56j6z357MyYbe+Zb0EK9l9LJ0+RTTU+E=;
	b=W4tM2GX7rvPd2XXYzV8zDIU1Epgm5FjaDac8C92eQb0GIK0pwzjjKMt/51cjR1P98nvs9Z
	rljke0qDewGTzDnPtS6ffAEGBS1Rr2eAIopwVTRWk8MHP/iUel2dVaGaRdun1RlywyNIS6
	FzskXD9a8aOx8EKBQ+ve8/LxZobWh/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748852655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UD8ca6htrwG56j6z357MyYbe+Zb0EK9l9LJ0+RTTU+E=;
	b=AtXtRF/UGAgXnwmlfaXoQsaQfS2eXrgzRTwGn8SWwL/QZbtAHlsJkkx6rXu/cGKMaVKZFb
	PNktu+GqQfD8mBCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C154136C7;
	Mon,  2 Jun 2025 08:24:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4rfVIa9fPWisaQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 02 Jun 2025 08:24:15 +0000
Message-ID: <ba288a84-a4c9-4bf2-a584-f8c5d05c1767@suse.cz>
Date: Mon, 2 Jun 2025 10:24:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm, slab: support NUMA policy for large kmalloc
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
 <20250529-frozen-pages-for-large-kmalloc-v1-2-b3aa52a8fa17@suse.cz>
 <e391fe8a-6bef-4067-86d8-b75ece441b75@gentwo.org>
 <b8a5dc9d-3697-47b3-bf66-f9bd726389fb@suse.cz>
 <17a999f3-7e6b-17d4-2caf-4912221894ec@gentwo.org>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <17a999f3-7e6b-17d4-2caf-4912221894ec@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 5/30/25 21:05, Christoph Lameter (Ampere) wrote:
> On Thu, 29 May 2025, Vlastimil Babka wrote:
> 
>> On 5/29/25 16:57, Christoph Lameter (Ampere) wrote:
>> > On Thu, 29 May 2025, Vlastimil Babka wrote:
>> >
>> >> The slab allocator observes the task's numa policy in various places
>> >> such as allocating slab pages. Large kmalloc allocations currently do
>> >> not, which seems to be an unintended omission. It is simple to correct
>> >> that, so make ___kmalloc_large_node() behave the same way as
>> >> alloc_slab_page().
>> >
>> > Large kmalloc allocation lead to the use of the page allocator which
>> > implements the NUMA policies for the allocations.
>> >
>> > This patch is not necessary.
>>
>> I'm confused, as that's only true depending on which page allocator entry
>> point you use. AFAICS before this series, it's using
>> alloc_pages_node_noprof() which only does
>>
>>
>>         if (nid == NUMA_NO_NODE)
>>                 nid = numa_mem_id();
>>
>> and no mempolicies.
> 
> That is a bug.
> 
>> I see this patch as analogical to your commit 1941b31482a6 ("Reenable NUMA
>> policy support in the slab allocator")
>>
>> Am I missing something?
> 
> The page allocator has its own NUMA suport.

It has support for respecting a preferred node (or forced node with
__GFP_THISNODE), nodemask, cpusets.

Mempolicy support is arguably outside the page allocator itself -
alloc_pages_mpol() lives in mm/mempolicy.c. Although some generically
looking wrappers alloc_pages() lead to it, while others don't
(__alloc_pages()). It's a kinda mess.

> The patch to reenable NUMA support dealt with an issue within the
> allocator where the memory policies were ignored.

I'd agree in the sense the issue was within the slab allocator, calling the
non-mpol-aware page allocator entry, which was not intended.

> It seems that the error was repeated for large kmalloc allocations.

After some digging, seems you're right and the error was done in commit
c4cab557521a ("mm/slab_common: cleanup kmalloc_large()") in v6.1. I'll add a
Fixes: tag and reword changelog accordingly.

> Instead of respecting memory allocation policies the allocation is forced
> to be local to the node.

It's not forced, but preferred, unless kmalloc() caller itself passes
__GFP_THISNODE. The slab layer doesn't add it.

> The forcing to the node is possible with GFP_THISNODE. The default needs
> to be following memory policies.



> 

