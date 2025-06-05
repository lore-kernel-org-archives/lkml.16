Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D61FC8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103712; cv=none; b=rhccMSh881bRMGfKM0XlbYr8r8H4o0UVVl/HbzhGoRj1KEjgwyQL+G8AOkLvP1qZAF3AthmtHzC2xpIZnvmoVWQaZ+lijhZjaSxMFME/QHqp6uht7vjROCegb8TClKUV2Sv+jpygeu4vwTqzuNhxRnju1PZAwNojrS0t9myEL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103712; c=relaxed/simple;
	bh=RM1itkxaRz7g3ICGMYXMtwipn2xfx5JM6HfrDY0nTVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVGpiU3q347txReRUfcWAr6Qfp5uQp0St94/p2V2U45L1WUwbKZx4JYmyCnmwFMIV9J1UPfrtAdTitK8D5p2FHVQYXurl5yAUQkESMYsV6mOwa74Okvw7grF3rEVNMqDVsSLetoLazq8aYE4X561WLB0keLLb7gMNKop5xGpxOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+oYi2zU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+oYi2zU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749103709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C2vSmJ6SVwQptQL8RpnG9tD7le9Q4uMxXrPnxOmuMhY=;
	b=i+oYi2zU7ZDcBxVCGzscdgcrWmC/6ir/lxVVmu4Cmmd/vIcrenSqw8scD0Xlkjd7mjhBfM
	wK78mpkb3WdAmZEWqBwJrso6f2o1KXtYtm4s94qqNg9zxalqbvFh79R5GP3MrOhMJ6MFeL
	KDgPBWcjeuVybKSF800dR5+rI0C3rVk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-KxjyYRnzPDWuOsLrO-OL0A-1; Thu, 05 Jun 2025 02:08:28 -0400
X-MC-Unique: KxjyYRnzPDWuOsLrO-OL0A-1
X-Mimecast-MFC-AGG-ID: KxjyYRnzPDWuOsLrO-OL0A_1749103707
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a52cb5684dso37104f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749103707; x=1749708507;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C2vSmJ6SVwQptQL8RpnG9tD7le9Q4uMxXrPnxOmuMhY=;
        b=nDFZtgpsgMTsXxGzHRH1Ihe0P/XP0q79f/feJaHqAMKNJe9mljh6/CmGZjo/uAeNAy
         fonTH/DTD9mvnLx57l20h5iz0CuPyNHy+jVa7y5nz/334Bas74gS+wGUkwEyErR41uYJ
         gjhI0B18FWMgPNSsNBeYaQ5k/cWc5UDEGutU7yrd7NFd4tgQxEqRIqCThYOid86/45/e
         KLiL3GlIktkYH3Nk4iPZX6kCjEpYsxYIYpBzAyNo8TgUGaxLEt6bx3vhcR+W8z9tCNOL
         uCnHmH1MQ/zSJIRUEshTB3F7U1ye9919WCVNQPJGNWVGC7ik1As8p1KJT6oF8JgaS9y4
         BJbA==
X-Forwarded-Encrypted: i=1; AJvYcCVIYbKhCY0cabvuf2TnZwSvUhtm/8N5QCwo70wW5PFINAx/CYJgM25tpHC5eItIv+4daf3Bgljd4B7o1Cs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9btLtLO6RJUv3Fa0+uLfx8pQJ5/yF7vJqCGkcMq3Um9VJybr
	eix8LiIFJiIcXtkVYMTylNKZR5XshPLiOtSGhnhKLWNCo4J+8oyIY4FM83h8CK69UrDbavr3rnf
	DXVBnLN5Cf7/Q0rnLGOLxb4cp5nPq1MpxSvSzYJH+aT0LlHoC7FdITlcbmo8Vs8vrww==
X-Gm-Gg: ASbGncuwSLoq8Cg9zCpJyOciPe8SSjQqe3arAqzWx6IUgVLLP6JTSPN0/aoL7QrdD5l
	y6BCeOox2lC2s/ZCZ73vSsWDMmkKlJVBF3Cw0nvFgzTnAux5tVuniO5P6l/Jx1XP4xyDWFG+5Za
	D9v2paBPJZWKGz9eHWkHFAEOeIYNDjhV5Q3yfNyGSsQecFGiYuG86IW0Gl49d+cDnaNCrLrmO6o
	PESI5rvUV1gwdfXwHFYl+BNG3b7/WaneH7m/aCqcSVSVEjzjPcvoW543G7Nj+klO7+Epz6rQ1I4
	riXp5q2YkfmcR2RLae9zQp7MoEabES21mqYZrKnExBU=
X-Received: by 2002:adf:a199:0:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3a529238091mr658707f8f.25.1749103706770;
        Wed, 04 Jun 2025 23:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaRqZBcrBEbzp9Fj3P1o2raF7MjsFUmUAj05+n6Rw0I/Fw2RYCKHcZTTLBoyG3oN0dCtYa/A==
X-Received: by 2002:adf:a199:0:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3a529238091mr658688f8f.25.1749103706377;
        Wed, 04 Jun 2025 23:08:26 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f5ef.dip0.t-ipconnect.de. [79.224.245.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm23211131f8f.41.2025.06.04.23.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:08:25 -0700 (PDT)
Message-ID: <f33f6f73-58bd-4877-a2cc-5436943da292@redhat.com>
Date: Thu, 5 Jun 2025 08:08:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f1a3e3c1-103f-46d4-aa0e-ea057e78954d@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 07:37, Vlastimil Babka wrote:
> On 6/5/25 03:07, John Hubbard wrote:
>> On 6/4/25 7:05 AM, David Hildenbrand wrote:
>>> Especially once we hit one of the assertions in
>>> sanity_check_pinned_pages(), observing follow-up assertions failing
>>> in other code can give good clues about what went wrong, so use
>>> VM_WARN_ON_ONCE instead.
>>>
>>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>>> well. Add one comment for the pfn_valid() check.
>>
>> It would be a nice touch to add Linus' notes here, with the BUG() history
>> and all. It answers a FAQ about BUG vs. WARN* that is really nice
>> to have in the commit log.
> 
> Perhaps then rather put it somewhere appropriate in Documentation/process/
> than a random commit log?

I mean, I documented most of that already in coding-style.rst. :)

The full BUG history is not in there, but not sure if that is really required if ...
we're not supposed to use it.

Is there anything important missing?


commit 1cfd9d7e43d5a1cf739d1420b10b1e65feb02f88
Author: David Hildenbrand <david@redhat.com>
Date:   Fri Sep 23 13:34:24 2022 +0200

     coding-style.rst: document BUG() and WARN() rules ("do not crash the kernel")
     
     Linus notes [1] that the introduction of new code that uses VM_BUG_ON()
     is just as bad as BUG_ON(), because it will crash the kernel on
     distributions that enable CONFIG_DEBUG_VM (like Fedora):
     
         VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
         no different, the only difference is "we can make the code smaller
         because these are less important". [2]
     
     This resulted in a more generic discussion about usage of BUG() and
     friends. While there might be corner cases that still deserve a BUG_ON(),
     most BUG_ON() cases should simply use WARN_ON_ONCE() and implement a
     recovery path if reasonable:
     
         The only possible case where BUG_ON can validly be used is "I have
         some fundamental data corruption and cannot possibly return an
         error". [2]
     
     As a very good approximation is the general rule:
     
         "absolutely no new BUG_ON() calls _ever_" [2]
     
     ... not even if something really shouldn't ever happen and is merely for
     documenting that an invariant always has to hold. However, there are sill
     exceptions where BUG_ON() may be used:
     
         If you have a "this is major internal corruption, there's no way we can
         continue", then BUG_ON() is appropriate. [3]
     
     There is only one good BUG_ON():
     
         Now, that said, there is one very valid sub-form of BUG_ON():
         BUILD_BUG_ON() is absolutely 100% fine. [2]
     
     While WARN will also crash the machine with panic_on_warn set, that's
     exactly to be expected:
     
         So we have two very different cases: the "virtual machine with good
         logging where a dead machine is fine" - use 'panic_on_warn'. And
         the actual real hardware with real drivers, running real loads by
         users. [4]
     
     The basic idea is that warnings will similarly get reported by users
     and be found during testing. However, in contrast to a BUG(), there is a
     way to actually influence the expected behavior (e.g., panic_on_warn)
     and to eventually keep the machine alive to extract some debug info.
     
     Ingo notes that not all WARN_ON_ONCE cases need recovery. If we don't ever
     expect this code to trigger in any case, recovery code is not really
     helpful.
     
         I'd prefer to keep all these warnings 'simple' - i.e. no attempted
         recovery & control flow, unless we ever expect these to trigger.
         [5]
     
     There have been different rules floating around that were never properly
     documented. Let's try to clarify.
     
     [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
     [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
     [3] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
     [4] https://lore.kernel.org/r/CAHk-=wgF7K2gSSpy=m_=K3Nov4zaceUX9puQf1TjkTJLA2XC_g@mail.gmail.com
     [5] https://lore.kernel.org/r/YwIW+mVeZoTOxn%2F4@gmail.com
     


-- 
Cheers,

David / dhildenb

