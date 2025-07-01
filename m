Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F01FDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358882; cv=none; b=RhQnNSLjJ0sHK3MYKpnoSmPhPYejKsswx7eExl9OgXp8+O2wwDafOAhAubdbisty63VQYLV11WCZI3on0rWY0StG7dRh0SE04UfKJYZWKx8aSNM7rV7v1yp1cu6Y5/DM6faJkEsIRyqeLpOGUJzfCNZRWZKvbHh9Py3wxVHItm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358882; c=relaxed/simple;
	bh=lbS24cMJ3Oc3OQhNt/DSzGyRJOx2dd6GD9LmhgcNCIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ir1AlOf1Bi9UwVtVOnrpLtS9fU9jg+JBmLAkzJ+cVurMbq8tZqE1WuiC4fhmqESZtLlJ13eZBjwK5LVNo6nRUt6BXf8U1T74JOIFyJYhXWBojtLVCH5MC07JTsVYyOStW1tVfDlwcQ0V94WwVqKpqTi+KFnNKj5VB72PmjcyZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TrvU4jE2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TrvU4jE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751358880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XqmCuun4O9S0uzldpDEz2Hy5OKYqaKQE+fhycCpdDZQ=;
	b=TrvU4jE2sSNKwHtHjRFHdxMtnaGP48GvZwVsdTSdKlku5B+Mwbt4QUvtK+WmrEgXtZA8lp
	pvm4Ra9r2B9oQZfPUXfWvooSgSk3lxfqTzn+hYPbw89s10+kfthyA+DHKynL6AiT15HCLb
	2DCz+0WPbK6viRfodCkNKgrKZ6sgjEs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-QOmFTm9oNf6F-_rcUfC3dA-1; Tue, 01 Jul 2025 04:34:39 -0400
X-MC-Unique: QOmFTm9oNf6F-_rcUfC3dA-1
X-Mimecast-MFC-AGG-ID: QOmFTm9oNf6F-_rcUfC3dA_1751358877
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso3582948f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358877; x=1751963677;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XqmCuun4O9S0uzldpDEz2Hy5OKYqaKQE+fhycCpdDZQ=;
        b=USmbF45HRDHQ9zJe5wihu4Kuhb2qIZhNNp2W9JQzKCftZoBPOlfYBuDK/jJh0W8/H2
         mIRIldVPgraqQflO836c2gdHD/MvhH7WyOUxYBrdiQ967lusHwPqJDUyRxGti5UFiXvS
         qQjnT2N7ffZ0lbhobVytVFjRwYaWr86FaxOwaWSYCQuhJq68s1yM9o0kz6fABID7ps3o
         sUyvTGUYkQ/J1WZApO2PxrxLsZ/WGXW2g7yFX4cjLCS+rlusABpdrnCcgcBU9BXee1xi
         GrkE0JOubrfo65nNlQkkHGhuOJ0MIyvHszfMU6Qn28NsJIEHG8eXuwz+xffc87SgLf65
         WhXQ==
X-Gm-Message-State: AOJu0YwJdvK9aD5u/qcE3Mbrh99TU2FJ9XngcMI2ipQbUxTBMCRG2C03
	KJPbFWPpkaUtH85YCNrHxJZ/3Kb6zxHurJ/NUYkSMApCtb20/biTkOZL5B62JV7b9N0eTdL86/+
	TOlxLbyhhICL2pGyMtX2rBg7xNpvwypWXGnFf84R2FXh4LBQ/mvDiVzBCPi48iKT7aQ==
X-Gm-Gg: ASbGnctv2HutRgO/QJsS9oUxCI0GESOPNjkN24ItTJlc91Id9yig6HMGM9MejYqOhum
	gB5wvm2PY4b3d7YbXFfKxZacEu3OviaC09+QNnL01gKY91bp42Z/uCgIZBYc7nluG2n0/zsRrca
	TeihoWT3L0sDHBSgm8CJ0aV8pCDHRxgBKjLfMtGfN1g7xqgp04dHbc8ENj6UJOKLx8m/piMZdUV
	aTXqOrqrmWVnNLTcyoo5WGozihXe7mrOWhFKCUwTaS1iZtblRCMb4+cjWbqKhfl/3n32F01vRaP
	EqnuffLQvBqHN6JQjaoBAr2ROcC373ILm6zXE1EJHp3VJtHrTw9xknBsx8V7VT2YPvLLc8hLGt8
	V0DILFjsY2phC+exg0hHeb3YDFfqFGRrqkyipsAi+FE5ntGkruA==
X-Received: by 2002:a5d:60c4:0:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3a90d69c269mr11346916f8f.24.1751358877361;
        Tue, 01 Jul 2025 01:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF8cObrwLhR7FvJoCAh0zan/cCbAjnhUquLcc9ptC1Omlee0lmAh8jtPfZiWWwygYZe4cdqg==
X-Received: by 2002:a5d:60c4:0:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3a90d69c269mr11346880f8f.24.1751358876846;
        Tue, 01 Jul 2025 01:34:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f943sm12511942f8f.101.2025.07.01.01.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:34:35 -0700 (PDT)
Message-ID: <84e1eeeb-c78f-4735-a6d2-4bb15ea1fbce@redhat.com>
Date: Tue, 1 Jul 2025 10:34:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/29] mm/page_alloc: let page freeing clear any set
 page type
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-5-david@redhat.com>
 <8c5392d6-372c-4d5d-8446-6af48fba4548@lucifer.local>
 <d4d8b891-008d-4cbc-950f-2e44c4445904@redhat.com>
 <06e260cf-9b63-4d7c-809c-a9f2cda58939@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <06e260cf-9b63-4d7c-809c-a9f2cda58939@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.25 10:27, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 10:17:13AM +0200, David Hildenbrand wrote:
>> On 30.06.25 17:27, Lorenzo Stoakes wrote:
>>> On Mon, Jun 30, 2025 at 02:59:45PM +0200, David Hildenbrand wrote:
>>>> Currently, any user of page types must clear that type before freeing
>>>> a page back to the buddy, otherwise we'll run into mapcount related
>>>> sanity checks (because the page type currently overlays the page
>>>> mapcount).
>>>>
>>>> Let's allow for not clearing the page type by page type users by letting
>>>> the buddy handle it instead.
>>>>
>>>> We'll focus on having a page type set on the first page of a larger
>>>> allocation only.
>>>>
>>>> With this change, we can reliably identify typed folios even though
>>>> they might be in the process of getting freed, which will come in handy
>>>> in migration code (at least in the transition phase).
>>>>
>>>> In the future we might want to warn on some page types. Instead of
>>>> having an "allow list", let's rather wait until we know about once that
>>>> should go on such a "disallow list".
>>>
>>> Is the idea here to get this to show up on folio dumps or?
>>
>> As part of the netmem_desc series, there was a discussion about removing the
>> mystical PP checks -- page_pool_page_is_pp() in page_alloc.c and replacing
>> them by a proper page type check.
>>
>> In that case, we would probably want to warn in case we get such a netmem
>> page unexpectedly freed.
>>
>> But, that page type does not exist yet in code, so the sanity check must be
>> added once introduced.
> 
> OK, and I realise that the UINT_MAX thing is a convention for how a reset
> page_type looks anyway now.
> 
>>
>>>
>>>>
>>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    mm/page_alloc.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>>> index 858bc17653af9..44e56d31cfeb1 100644
>>>> --- a/mm/page_alloc.c
>>>> +++ b/mm/page_alloc.c
>>>> @@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
>>>>    			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
>>>>    		page->mapping = NULL;
>>>>    	}
>>>> +	if (unlikely(page_has_type(page)))
>>>> +		page->page_type = UINT_MAX;
>>>
>>> Feels like this could do with a comment!
>>
>> /* Reset the page_type -> _mapcount to -1 */
> 
> Hm this feels like saying 'the reason we set it to -1 is to set it to -1' :P

Bingo! Guess why I didn't add a comment in the first place :P

> 
> I'd be fine with something simple like
> 
> /* Set page_type to reset value */

"Reset the page_type (which overlays _mapcount)"

?

 > > But... Can't we just put a #define somewhere here to make life 
easy? Like:

Given that Willy will change all that soon, I'm not in favor of doing 
that in this series.

-- 
Cheers,

David / dhildenb

