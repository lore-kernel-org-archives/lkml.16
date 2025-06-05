Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A71DEFDB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126549; cv=none; b=M9qFw5MBWbaaJDZw1WmaXjPVj46hTyDPIFxpz+pTItlhOix8Mte679d3fyzqla2rtP38beRQ5h13KrabVs+AevsIsnnYlfxASI1Af9pj/ei4bwiYJ2LmmNgD/4lgSgxUplpsnSoCVS+pv1rewoMQxFm3/N0gSlufxpmfPOMwsu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126549; c=relaxed/simple;
	bh=Y7/Qx169NyGTMFBsvULGAENgxMohaGNGuek09Zv1q18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtDw+rtlPXPKRb3VrZC69p6RL5anPpJKgZpE0KEjFcmtXfrIlZ9ZvvQmgmp5GFu/IDmc8lW+njKUmEm8i83P08s7ij6HQkk1O3qagRi8MvEaXgwo3R8p+mm5NCJow84f1cFVsF7m50ztfgztIHuluBIlMlVE7Fc6el+QcLNe/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aJICybcu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aJICybcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749126545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/pvkMpLzQly/NifQixkZ4rLBIhF30r1u1wYiITL9kCs=;
	b=aJICybcuuf7F5Vv5AGeqDKIAiKkXwVWc3meJHQQs4A+PwG/9cNdUOkZ6z9uI66BpQMCzGi
	y3RLzGU0RYtJP/axINXRZDn+82324d2MJ4HiUFIJz8TUfNIz7JLqXPnelM8nh6xwS3vxjA
	jkvRXtBpU/uVtqkU5SGOxoAjj2jZsRw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-IebJwmDBNruki4Yq_P_9Bg-1; Thu, 05 Jun 2025 08:29:04 -0400
X-MC-Unique: IebJwmDBNruki4Yq_P_9Bg-1
X-Mimecast-MFC-AGG-ID: IebJwmDBNruki4Yq_P_9Bg_1749126544
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso5777115e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126543; x=1749731343;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/pvkMpLzQly/NifQixkZ4rLBIhF30r1u1wYiITL9kCs=;
        b=taFtIvKfoOuz+0y8DplfU04FWdRTw+tsvMYFrqzMc4gCcj1TD6hpaETlBG+rHToaAM
         SipNF00EaUzWLa1jvmTEPb67WD8D4oPgk0IANR8imgVjc1LGWnTTm6xIhkyFYk+6oU9t
         TDb+gnojTkAD5tHLhbefxvOpehckwScLQYoROxjYiW7sIhK6FKgNCsnfOGBfO4pbvpiF
         CawVqFesmkRfIW2V7tJsfbMPBbRy98NeMy5zLAXiX0zWbSUNn/YkDuNkdq8xy9oVgMT8
         m1DB+Ge5Nxq5VNq7hoazj5U6h0QMTKyxlNdit/Q1zRymVJf6puMUBlZvUdXG38rOmp5e
         Wxcw==
X-Forwarded-Encrypted: i=1; AJvYcCU/owIj+cwiWakK5uxnqFMXomnttwme5T9V88yJiR+bbtHeHUATMYFB1JUKJkZ47o9J3F9Zhovj0aXGuhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwSaflixZ6xHWsu8p1hvWnHMi+stQ45+kB66bkqgBux6fh8hwx
	AsChf8cmf95PLsuI75OkRm1OvBBS3jZhx2WtH4neAevwuimCI32XVv/HJFglaQ8NpNCpNqmV5Yi
	m+fe/6xtdFmigsEv6T2GU2ir+HAodIUPPKMqGiDN19xs1BAYrqAVLew5EqjxjdzM7GQ==
X-Gm-Gg: ASbGnctkP3fQk9cpPDL2NVyOIkF7265lPekyLE79S7M097x3C4+EWm4rxMJP0H+6l3b
	3LiHUnu61Gk9YK7si7CNQXbr151xEj0ybRkCFQbDKPEep9CZI85kTppJTUjiT+pAgyyV9cvJFL/
	naocvI0wEgCX9R2NgXDOmgugpd7lDkRWR56AdRNOVjnEmfiZdb2jphVRbShI79Acy30ZwW75QEY
	KSQj7e6Eu3cW1hgWw9L4ykclP5tDBtgH8kMxSvRir/+3b0/g51D5Qv1wXRDG7H3p/EQSvH32LAV
	CSE7WY48LzYUI0HnCkrzApEe4FaVz9gQ5Q5vAVqKj4s9aiJwbUY96kkDUGBOyXaY7w+2Z5qKtvc
	t+BG2F7lK3bWGEn0a0o6brgrbkOG30ebWxExU
X-Received: by 2002:a05:600c:c87:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-451f0b482ebmr56885815e9.32.1749126543529;
        Thu, 05 Jun 2025 05:29:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+IxiMOHl2uAA+BiSuFHTHciBLdvRzBEsK6b+DlMsuIYLN3cy2dpwVwYbMMYwV61d+RkJywA==
X-Received: by 2002:a05:600c:c87:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-451f0b482ebmr56885515e9.32.1749126543110;
        Thu, 05 Jun 2025 05:29:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb2082cesm16980755e9.19.2025.06.05.05.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:29:02 -0700 (PDT)
Message-ID: <8d995aa8-31f4-4bbe-b79a-c9e1c2ade1fb@redhat.com>
Date: Thu, 5 Jun 2025 14:29:01 +0200
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
 <f33f6f73-58bd-4877-a2cc-5436943da292@redhat.com>
 <8e85a701-7791-46d9-9443-266c6049c01f@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8e85a701-7791-46d9-9443-266c6049c01f@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 10:48, Vlastimil Babka wrote:
> On 6/5/25 08:08, David Hildenbrand wrote:
>> On 05.06.25 07:37, Vlastimil Babka wrote:
>>> On 6/5/25 03:07, John Hubbard wrote:
>>>> On 6/4/25 7:05 AM, David Hildenbrand wrote:
>>>>> Especially once we hit one of the assertions in
>>>>> sanity_check_pinned_pages(), observing follow-up assertions failing
>>>>> in other code can give good clues about what went wrong, so use
>>>>> VM_WARN_ON_ONCE instead.
>>>>>
>>>>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>>>>> well. Add one comment for the pfn_valid() check.
>>>>
>>>> It would be a nice touch to add Linus' notes here, with the BUG() history
>>>> and all. It answers a FAQ about BUG vs. WARN* that is really nice
>>>> to have in the commit log.
>>>
>>> Perhaps then rather put it somewhere appropriate in Documentation/process/
>>> than a random commit log?
>>
>> I mean, I documented most of that already in coding-style.rst. :)
> 
> Thanks for the reminder, looks good to me :)
> 
>> The full BUG history is not in there, but not sure if that is really required if ...
>> we're not supposed to use it.
> 
> We could put links to the history excursion email (and appropriate older
> emails you link in the commit log below) to the References appendix of the
> coding-style file, but it's not that critical.

Not sure if it's really of value. I mean, whoever questions the rules 
(for whatever reason ;) ) should probably look at the git log ...

-- 
Cheers,

David / dhildenb

