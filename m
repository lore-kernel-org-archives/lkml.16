Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837FD25B1CB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878581; cv=none; b=qFjr8TU8/MLch7+RabGF+YZukHaJVs3ClnPlpA5zvso5ekv4nn8PZC9oC/5g3bEC0Q37PFYzSg5N9TH5a/KESeRjkYX4KJfZy5HhVBG2li7LjcVNxoZ4ou9Xb+HQt1XMnroTGuX/uJQKThBtGQ/1jk2C+i+9iqsDEUmksrwLrZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878581; c=relaxed/simple;
	bh=hSSE7Oe/uXGyrkEbSOrIRFQO/RjVvuh69tjCqtRD1uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDx4++AFqxw3GXV98NYI74rgKvIEcqgOGudZa5E6w7V8184Gihu4THzai/U+E52PD95Cx6pSDNGuCyNoVtQOAQzdrQYBnHdRpsF/rLo3uW2pfm90mNCfNQ3EcxEul8dG5joNXEZEjyAFBkwZqrCKlVrzVU+guz1Mk4kT6BpswLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kiZFuYff; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZRu2zf7Q; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kiZFuYff; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZRu2zf7Q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kiZFuYff";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZRu2zf7Q";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kiZFuYff";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZRu2zf7Q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E6141F38F;
	Mon,  7 Jul 2025 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751878576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZU79MrZ8LQo+UlkJLdJa/PdmRpR+cAPK1gQqlHk4CoE=;
	b=kiZFuYff+P6qWXcaA5ggI7NA3iXSJcWse7jumq1ZLKl0yxQT2GgRy8pQJLrocrHv1m6TOP
	DYXoFSC1h0v8YmodmhVSOfEarVS8rNYjhAcaEEyvlmMGgYk8UFiliYmem7x+Q087TzG6ZH
	KE5B5iJts8GwNh+9W0mK5baW3RubeS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751878576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZU79MrZ8LQo+UlkJLdJa/PdmRpR+cAPK1gQqlHk4CoE=;
	b=ZRu2zf7Q/FgJ9KoxyydR8xRhYZpjhKqf8dYJ5dwn/wlrkLYBi/zvsAIwXA7XoHFSrHSMqz
	JCdatdbfpWzRlbCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751878576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZU79MrZ8LQo+UlkJLdJa/PdmRpR+cAPK1gQqlHk4CoE=;
	b=kiZFuYff+P6qWXcaA5ggI7NA3iXSJcWse7jumq1ZLKl0yxQT2GgRy8pQJLrocrHv1m6TOP
	DYXoFSC1h0v8YmodmhVSOfEarVS8rNYjhAcaEEyvlmMGgYk8UFiliYmem7x+Q087TzG6ZH
	KE5B5iJts8GwNh+9W0mK5baW3RubeS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751878576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZU79MrZ8LQo+UlkJLdJa/PdmRpR+cAPK1gQqlHk4CoE=;
	b=ZRu2zf7Q/FgJ9KoxyydR8xRhYZpjhKqf8dYJ5dwn/wlrkLYBi/zvsAIwXA7XoHFSrHSMqz
	JCdatdbfpWzRlbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7501A13797;
	Mon,  7 Jul 2025 08:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eAg7HLCLa2jVPAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 07 Jul 2025 08:56:16 +0000
Message-ID: <fd6cc30b-cc8d-4003-ba01-fefd5d696ec6@suse.cz>
Date: Mon, 7 Jul 2025 10:56:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, siddhartha@kenip.in,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, mgorman@suse.de,
 Rik van Riel <riel@surriel.com>, Doug Smythies <dsmythies@telus.net>
References: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
 <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
 <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
 <6eaaa2e4-9067-47bc-8dd4-d8ef56c26b3b@arm.com>
 <5D015E99-474A-4D98-8C43-488A46BEB2F5@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <5D015E99-474A-4D98-8C43-488A46BEB2F5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 7/1/25 20:49, Zi Yan wrote:
>>> This is very useful information and it's appreciated! Let's not drown this
>>> out with restatements of stuff already covered.
>>>
>>>> ⚙️ 5. mTHP note
>>>> Although this patch doesn’t target mTHP directly, I believe a similar logic
>>>> tweak could apply there too — especially with shmem-backed workloads (common
>>>> in model servers using shared tensor memory). I’d be happy to help test any
>>>> changes proposed there to derive the consequent results.
>>> Dev - could we hold off on any effort to do something like this until I've
>>> had a chance to refactor THP somewhat? This is already a mess and I'd like
>>> to avoid us piling on more complexity.
>>>
>>> We can revisit this at a later stage.
>>
>> Yes of course. I had run a small benchmark on a quick dumb patch I wrote and I
>> don't see any measurable perf improvement, probably because the highest THP order
>> getting chosen is always PMD size.
> 
> I think mTHP is much more complicated, since mTHP has many sizes.
> Trying to adjust VMA alignments to get mTHP might not work well, since
> you never know what sizes new VMAs are going to have.

Yes I agree it's more complicated. In case there would be a stream of
allocations of varying small-ish sizes, aligning each of them to its
smallest applicable mTHP could create gaps that wouldn't exist if we ignored
the alignment and just find any free area and in the end merge it to an
existing one. Basically we'd risk recreating the issue with gaps.

Sticking to one size (2MB) mitigates this to some extent. Unfortunately even
after my fix the heuristics might be prone to gaps:

- all allocations not multiple of 2MB - will merge freely

- all allocations multiple of 2MB - the alignment heuristic will kick in,
but as a result allocations should still merge as all boundaries are 2MB
alignned

- allocations alternate between multiple of 2MB and non-multiple of 2MB -
this will still create gaps

Note we already had a report about ebizzy regressing due to my commit [1]
and I suspect it might be due to this kind of scenario. A proper
investigation would be useful but I didn't get to it.

Maybe the solution is to first check if unaligned search gives us a range
that will merge with adjacent area, and only try the alignment heuristics if
it doesn't. This will still fail if mmap() is followed by e.g. mprotect() or
madvise() that will change an initially un-mergeable area to a mergeable
one. I have no ideas around that though. Just some thoughts to consider for
anyone wanting to change things here further :)

[1] https://lore.kernel.org/all/019401db769f%24961e7e20%24c25b7a60%24@telus.net/

> IMHO, it might be better to align VMA to PMD or the largest mTHP size
> (for example, on ARM64 with 64KB base page, PMD THP is 512MB, a 2MB
> mTHP sounds more reasonable there) if possible and enable
> VMA merging as much as possible for future huge page collapse.
> mTHP can be used to fill the non faulted holes in VMAs if necessary.
> 
>>
>> Out of curiosity, where do you plan to do the refactoring?
> 
> 
> Best Regards,
> Yan, Zi
> 

