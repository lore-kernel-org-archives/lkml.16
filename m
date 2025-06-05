Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804E37E1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113288; cv=none; b=Ca0dbpeoHQ1FXBDw9x6deqIq3tSk4KfrRN30qU7mTpUbkazst9j6d7Ydo7+4sz3KIiF4WnkENziJGk36jBYH5zDWFjcHll/XSZD9bte+foP4HI6Vae/ok05n1I/eLI4TFVYChL4yASolxwtFQGAmQ0irnNEAecPhw6Ej2tcbHTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113288; c=relaxed/simple;
	bh=23jGBlfNy7jF+Sg/qbJXSLZgAa7BjLH7yDzZAQbJ3vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjMexR1PTAfULVL0fgcPYqXQUIE0YkoohWbTHmE+MD+gFFOl452cJcNAkULkusKT4JFTmt8MjuqecAeDQXUoniKHwZjuyWt6/RCTQkysu2iCxQM7H87f/+G9N6LD/+YVsvYWEr7kAJGzsv3d47usx1zJ7SgzGY7vuASR18WyrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wbCuIM3J; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Q5Qt3PoV; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=WN+MoBv5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=iNxBrZJJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wbCuIM3J";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Q5Qt3PoV";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WN+MoBv5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="iNxBrZJJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47333347B7;
	Thu,  5 Jun 2025 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749113284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XynFFcRiIqMIXFW30c/G7NhwK8di++5nyZupzy6ptTQ=;
	b=wbCuIM3JEsJxieaarbdCqnFfX4LQGczMazTTfEsawXxVBc+wcdLQoablyYeoyiBjtripQw
	AxNnqsn1F5ZDnrGnB6uzhxo3iSujlt/bNMROeAG1iTg2ni7YsZvDpkbBhI3NfNAAilOJEl
	WrbzxWPBjFaQmbOM08qvlW8MbZzWGHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749113284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XynFFcRiIqMIXFW30c/G7NhwK8di++5nyZupzy6ptTQ=;
	b=Q5Qt3PoVdnq55tIIueIkLD/0GZlG5jmvlJQK5h1OGEJmZodTKPjD8TeHOuuC+jlxbKqvhP
	N/TfMOe0EYhrEuCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749113283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XynFFcRiIqMIXFW30c/G7NhwK8di++5nyZupzy6ptTQ=;
	b=WN+MoBv5tjbXMOv4J6/nRjFUGdJEZn4s5u1HFNo2FCWfc5X3ZaJiB2u7xlbME22+2BYQ3a
	/PvkG5lionnIVF4L+sJSTT+oOYSZ5NA6bqX0OPm2GjEoNGRSioSWlQwlJL6FbY4KPxhxkS
	ZZABJmqUmt/SauQLw7qWfkWuJaczWV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749113283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XynFFcRiIqMIXFW30c/G7NhwK8di++5nyZupzy6ptTQ=;
	b=iNxBrZJJHys4nRvpw9i/ddXkUps5/49v/PlC3On6tZ0br9ryISWDlvjNrFqWVMqW/3tWsx
	UI4+v95vkX+3FpAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2EA18137FE;
	Thu,  5 Jun 2025 08:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TesJC8NZQWiTSwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 05 Jun 2025 08:48:03 +0000
Message-ID: <8e85a701-7791-46d9-9443-266c6049c01f@suse.cz>
Date: Thu, 5 Jun 2025 10:48:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <d08f2cb4-f76b-4ffb-b6fa-2a5a419fb86b@nvidia.com>
 <f1a3e3c1-103f-46d4-aa0e-ea057e78954d@suse.cz>
 <f33f6f73-58bd-4877-a2cc-5436943da292@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <f33f6f73-58bd-4877-a2cc-5436943da292@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -1.15
X-Spamd-Result: default: False [-1.15 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.95)[0.984];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On 6/5/25 08:08, David Hildenbrand wrote:
> On 05.06.25 07:37, Vlastimil Babka wrote:
>> On 6/5/25 03:07, John Hubbard wrote:
>>> On 6/4/25 7:05 AM, David Hildenbrand wrote:
>>>> Especially once we hit one of the assertions in
>>>> sanity_check_pinned_pages(), observing follow-up assertions failing
>>>> in other code can give good clues about what went wrong, so use
>>>> VM_WARN_ON_ONCE instead.
>>>>
>>>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>>>> well. Add one comment for the pfn_valid() check.
>>>
>>> It would be a nice touch to add Linus' notes here, with the BUG() history
>>> and all. It answers a FAQ about BUG vs. WARN* that is really nice
>>> to have in the commit log.
>> 
>> Perhaps then rather put it somewhere appropriate in Documentation/process/
>> than a random commit log?
> 
> I mean, I documented most of that already in coding-style.rst. :)

Thanks for the reminder, looks good to me :)

> The full BUG history is not in there, but not sure if that is really required if ...
> we're not supposed to use it.

We could put links to the history excursion email (and appropriate older
emails you link in the commit log below) to the References appendix of the
coding-style file, but it's not that critical.

> Is there anything important missing?
> 
> 
> commit 1cfd9d7e43d5a1cf739d1420b10b1e65feb02f88
> Author: David Hildenbrand <david@redhat.com>
> Date:   Fri Sep 23 13:34:24 2022 +0200
> 
>      coding-style.rst: document BUG() and WARN() rules ("do not crash the kernel")
>      
>      Linus notes [1] that the introduction of new code that uses VM_BUG_ON()
>      is just as bad as BUG_ON(), because it will crash the kernel on
>      distributions that enable CONFIG_DEBUG_VM (like Fedora):
>      
>          VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
>          no different, the only difference is "we can make the code smaller
>          because these are less important". [2]
>      
>      This resulted in a more generic discussion about usage of BUG() and
>      friends. While there might be corner cases that still deserve a BUG_ON(),
>      most BUG_ON() cases should simply use WARN_ON_ONCE() and implement a
>      recovery path if reasonable:
>      
>          The only possible case where BUG_ON can validly be used is "I have
>          some fundamental data corruption and cannot possibly return an
>          error". [2]
>      
>      As a very good approximation is the general rule:
>      
>          "absolutely no new BUG_ON() calls _ever_" [2]
>      
>      ... not even if something really shouldn't ever happen and is merely for
>      documenting that an invariant always has to hold. However, there are sill
>      exceptions where BUG_ON() may be used:
>      
>          If you have a "this is major internal corruption, there's no way we can
>          continue", then BUG_ON() is appropriate. [3]
>      
>      There is only one good BUG_ON():
>      
>          Now, that said, there is one very valid sub-form of BUG_ON():
>          BUILD_BUG_ON() is absolutely 100% fine. [2]
>      
>      While WARN will also crash the machine with panic_on_warn set, that's
>      exactly to be expected:
>      
>          So we have two very different cases: the "virtual machine with good
>          logging where a dead machine is fine" - use 'panic_on_warn'. And
>          the actual real hardware with real drivers, running real loads by
>          users. [4]
>      
>      The basic idea is that warnings will similarly get reported by users
>      and be found during testing. However, in contrast to a BUG(), there is a
>      way to actually influence the expected behavior (e.g., panic_on_warn)
>      and to eventually keep the machine alive to extract some debug info.
>      
>      Ingo notes that not all WARN_ON_ONCE cases need recovery. If we don't ever
>      expect this code to trigger in any case, recovery code is not really
>      helpful.
>      
>          I'd prefer to keep all these warnings 'simple' - i.e. no attempted
>          recovery & control flow, unless we ever expect these to trigger.
>          [5]
>      
>      There have been different rules floating around that were never properly
>      documented. Let's try to clarify.
>      
>      [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
>      [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
>      [3] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
>      [4] https://lore.kernel.org/r/CAHk-=wgF7K2gSSpy=m_=K3Nov4zaceUX9puQf1TjkTJLA2XC_g@mail.gmail.com
>      [5] https://lore.kernel.org/r/YwIW+mVeZoTOxn%2F4@gmail.com
>      
> 
> 

