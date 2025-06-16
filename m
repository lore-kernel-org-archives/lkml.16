Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E01DDC33
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067177; cv=none; b=h4U4BdPYmK0k6YTNUlJm2fx76UILip1km/HYagpbWog3+5cq79DqLrNvnAJ3yG4WIt3XU5jc4xJpg6PPq9XZ+OBevwFKiEvT5Ww5DYOi2pS2VOkPA9o20BT+k+UqIgwpXEeab8gpPipr9nkPeyrUCO3oel5WDn1vl0aULxUWzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067177; c=relaxed/simple;
	bh=BI8LIOoaWxZ9ZU4rqgk8yOCwSaiMDSfmMVuZY888waE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meiIjgbkFsHpEFeBmlOTXhtNOxY1ndzq3WjdNpxsctC7JsiAPWDfnTB5dLYl4fec2JEvOU7ERvVMwalKPjZjnx7e8Z/weIW8Hf2sxVdXPkamSdXpc5XAE58vH1F/u/Tkc6pwrDD7BkptbVPN0QEBaWh5ZQvT0ImSpV5JoyEma7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AoANGJ8R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AoANGJ8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9LpBwQhNiE5GmshdXCIa53CrveoAMtvXDG7n1Vt+nVY=;
	b=AoANGJ8RpdkjYPjV2xYxRY+0psf4yaWL7n1ZYWUxmFJnlk8hzieadL7jxUjxOoSd7rGc6x
	wViQPkg2dnwJB3gsxZY2MU/ukNChG8CM+5nWyKKfAZEC0DKrFNjURx9rTMApPxOPdcnCeI
	RQySHYSJg1ak8BGlFTN921y3+h8h2Ig=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-fKW0tBLYM0SfKyAqq4HSfA-1; Mon, 16 Jun 2025 05:46:04 -0400
X-MC-Unique: fKW0tBLYM0SfKyAqq4HSfA-1
X-Mimecast-MFC-AGG-ID: fKW0tBLYM0SfKyAqq4HSfA_1750067161
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso34509075e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067160; x=1750671960;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9LpBwQhNiE5GmshdXCIa53CrveoAMtvXDG7n1Vt+nVY=;
        b=Inzb0Flze8F64BPo3RhGEwHf1m2+fgVDIkGQ1kJgU9oE2RFi7vo2UahCR3AE918e5L
         8Vw5oXFjLerZPUvttK66WNlGZ/SBX/FMxoq06ZtG1ENrSBgZJSSlSWitlDpmh8QJD/Wd
         /4MPiSXGo8oS5Tp5fBUWIkmBzjsZsQgkQG5D24o+3XynkOw29tngJvIKdxkG7nkpQqVp
         LD0WgpOgF7QY2q/OMcMvG/0QBfRDVyrm6BDLOq4ssQ4pGhNT7dFada9OhVQHz/r0XjC0
         kQycdRJfHtNlDZ0HkAKuiLbqqcQihfZvBKktziuK/Z9nA5RfoN8clFwjBSA6HGBbwZi0
         RsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvFhHtYD4WFsvjUcUVaCB/CEB2QXsOGGS8nDAjbMHN+21dRBOlDfsQMjQjbk5n/ib5sA4gc48817RYjnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywo2llR19xNjOv8WcRuSPvo0Yuk0U3vHgaBmcu7IkRPcwo1B34
	5LGWWtCgynFdc+OiAFQ6QSEGZR0OhseUX7YPIcdC1jlLqX+moin+UfhY5gE28MIl+hzRUcVbgaV
	KU7WNlXhCNjxbc65FWBPuH9lLDS+JLyJvcIuOzzOGJdgaOqrz3rN1nf0eKV9awXu61A==
X-Gm-Gg: ASbGncsjd90cNkPAV8PkGyhLrP1owzyHKlA9nZlbrd7iNStyZsLd1fRZ9Xa9fs2y7it
	C9GRQI3ea2f03QyTziujzUs3Osqk08W1tFj7Ph5HBRMs2WUMjuyzToziXpA19bZXJqN36mbqssJ
	5djE7hun9oDvZf/7tuzfNLrgi2eBxrOXgHsNibCuUAexpo38CGOWqwlx+RWW7H6olRhAV4RMWqT
	rp1DvEL0Yb3NqptdoKYmUitmZ8eyOE21FoDzIY2E+lhnRZq8DZP1C/vKCVfQl0mW2JremtIwdCL
	SsLex0d726d9ZmVRLUMbgB5TthpBySAz5te9M+oJorqd8dzUoQ7s3M4B1nenSTQYVMAZUc4DuEi
	HfL3nVxOlJdMspFC5WSSln0S4TFpaluuNEsB8R7PaKP0d/ao=
X-Received: by 2002:a05:600c:a016:b0:450:d3b9:4ba2 with SMTP id 5b1f17b1804b1-4533cac06acmr74755445e9.24.1750067160424;
        Mon, 16 Jun 2025 02:46:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBSBsqoa72A42RcmXkBG9lG51qenCWppKc7zo8qZQnQmQOSEpYDrQSdVz/aVJQr08DxTPJ8g==
X-Received: by 2002:a05:600c:a016:b0:450:d3b9:4ba2 with SMTP id 5b1f17b1804b1-4533cac06acmr74755055e9.24.1750067159963;
        Mon, 16 Jun 2025 02:45:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087f8sm10750271f8f.53.2025.06.16.02.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 02:45:59 -0700 (PDT)
Message-ID: <e40aa590-f0a2-4666-84b0-c33c8f4fef87@redhat.com>
Date: Mon, 16 Jun 2025 11:45:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in
 include/linux/mempolicy.h
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, sj@kernel.org, akpm@linux-foundation.org,
 corbet@lwn.net, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 bijantabatab@micron.com, venkataravis@micron.com, emirakhur@micron.com,
 ajayjoshi@micron.com, vtavarespetr@micron.com, damon@lists.linux.dev
References: <20250612181330.31236-1-bijan311@gmail.com>
 <20250612181330.31236-2-bijan311@gmail.com>
 <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com>
 <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.06.25 18:33, Bijan Tabatabai wrote:
> On Fri, Jun 13, 2025 at 8:45 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 12.06.25 20:13, Bijan Tabatabai wrote:
>>> From: Bijan Tabatabai <bijantabatab@micron.com>
>>>
>>> This patch is to allow DAMON to call policy_nodemask() so it can
>>> determine where to place a page for interleaving.
>>>
>>> Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
>>> ---
>>>    include/linux/mempolicy.h | 9 +++++++++
>>>    mm/mempolicy.c            | 4 +---
>>>    2 files changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
>>> index 0fe96f3ab3ef..e96bf493ff7a 100644
>>> --- a/include/linux/mempolicy.h
>>> +++ b/include/linux/mempolicy.h
>>> @@ -133,6 +133,8 @@ struct mempolicy *__get_vma_policy(struct vm_area_struct *vma,
>>>    struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>>>                unsigned long addr, int order, pgoff_t *ilx);
>>>    bool vma_policy_mof(struct vm_area_struct *vma);
>>> +nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
>>> +             pgoff_t ilx, int *nid);
>>>
>>>    extern void numa_default_policy(void);
>>>    extern void numa_policy_init(void);
>>> @@ -232,6 +234,13 @@ static inline struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>>>        return NULL;
>>>    }
>>>
>>> +static inline nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
>>> +                             pgoff_t ilx, int *nid)
>>> +{
>>> +     *nid = NUMA_NO_NODE;
>>> +     return NULL;
>>> +}
>>> +
>>>    static inline int
>>>    vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
>>>    {
>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>> index 3b1dfd08338b..54f539497e20 100644
>>> --- a/mm/mempolicy.c
>>> +++ b/mm/mempolicy.c
>>> @@ -596,8 +596,6 @@ static const struct mempolicy_operations mpol_ops[MPOL_MAX] = {
>>>
>>>    static bool migrate_folio_add(struct folio *folio, struct list_head *foliolist,
>>>                                unsigned long flags);
>>> -static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
>>> -                             pgoff_t ilx, int *nid);
>>>
>>>    static bool strictly_unmovable(unsigned long flags)
>>>    {
>>> @@ -2195,7 +2193,7 @@ static unsigned int interleave_nid(struct mempolicy *pol, pgoff_t ilx)
>>>     * Return a nodemask representing a mempolicy for filtering nodes for
>>>     * page allocation, together with preferred node id (or the input node id).
>>>     */
>>> -static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
>>> +nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
>>>                                   pgoff_t ilx, int *nid)
>>>    {
>>>        nodemask_t *nodemask = NULL;
>>
>> You actually only care about the nid for your use case.
>>
>> Maybe we should add
>>
>> get_vma_policy_node() that internally does a get_vma_policy() to then
>> give you only the node back.
>>
>> If get_vma_policy() is not the right thing (see my reply to patch #2),
>> of course a get_task_policy_node() could be added.
>>
>> --
>> Cheers,
>>
>> David / dhildenb
> 
> Hi David,

Hi,

> 
> I did not use get_vma_policy or mpol_misplaced, which I believe is the
> closest function that exists for what I want in this patch, because
> those functions

I think what you mean is, that you are performing an rmap walk. But 
there, you do have a VMA + MM available (stable).

> seem to assume they are called inside of the task that the folio/vma
> is mapped to.

But, we do have a VMA at hand, so why would we want to ignore any set 
policy? (I think VMA policies so far only apply to shmem, but still).

I really think you want to use get_vma_policy() instead of the task policy.


> More specifically, mpol_misplaced assumes it is being called within a
> page fault.
> This doesn't work for us, because we call it inside of a kdamond process.

Right.

But it uses the vmf only for ...

1) Obtaining the VMA
2) Sanity-checking that the ptlock is held.

Which, you also have during the rmap walk.


So what about factoring out that handling from mpol_misplaced(), having 
another function where you pass the VMA instead of the vmf?

> 
> I would be open to adding a new function that takes in a folio, vma,
> address, and
> task_struct and returns the nid the folio should be placed on. It could possibly
> be implemented as a function internal to mpol_misplaced because the two would
> be very similar.

Good, you had the same thought :)

> 
> How would you propose we handle MPOL_BIND and MPOL_PREFFERED_MANY
> in this function? mpol_misplaced chooses a nid based on the node and
> cpu the fault
> occurred on, which we wouldn't have in a kdamond context. The two options I see
> are either:
> 1. return the nid of the first node in the policy's nodemask
> 2. return NUMA_NO_NODE
> I think I would lean towards the first.

I guess we'd need a way for your new helper to deal with both cases 
(is_fault vs. !is_fault), and make a decision based on that.


For your use case, you can then decide what would be appropriate. It's a 
good question what the appropriate action would be: 1) sounds better, 
but I do wonder if we would rather want to distribute the folios in a 
different way across applicable nodes, not sure ...

-- 
Cheers,

David / dhildenb

