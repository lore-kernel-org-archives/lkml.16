Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7428D8E5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697966; cv=none; b=Cd4ouF5R0IkVO2FULeLQH29Kdp1jE4tZRPjSq1Lez9ul2aFgj2NlDi3vXQPi0Jcmd0i/ykgqtFFlGauSBlHebU99TpCl4DzS3+xg1pMJRD6GrgRZkJctgY1KxOljj67km5+NA1wy3VVbji3aRotteJGDxFzMn1DWC3CNGUqNg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697966; c=relaxed/simple;
	bh=Vox68x83AWJg1XIkHa7IzgFtSf2G7NN5QrGW7TbqMM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aS/NnKRPzCGr060Xhn4IC2g8XJ40Pn+UiDPWhM0ytJWPxYAzqlHLrdI+hJz6Vh7XWZfQcyM/2/i0k9ofOqc0wWdiSL8b1TtEfyI0tmta6dZbu9WYgqwfAkKgoawhn8lS5mqVEuhpFkoxf5VUGR8jSUxLNoUVoKwONyWkVaZQ4Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etbDxez7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etbDxez7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750697963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f5hwe5uyZiUrMoHUX/Z0pE+5E5La4EJvFJ/v9sB+1so=;
	b=etbDxez7EcHyGsFNhlA14HSxzYZq9uKMHi58BNNKuSznGXsltpgIGlON62tVg5yQTVnt7n
	vsRpGYoLCTeWT6vTy3OSA/uR2/l6+2BKhgVe+QlmlL6n/U9utj+7WG4Ak3g73LfsVKbX50
	x4PN4YM8GDnnV83T2wPGNEdLMbPRWeA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-GUThFtiBMA27MlsEszo1PA-1; Mon, 23 Jun 2025 12:59:22 -0400
X-MC-Unique: GUThFtiBMA27MlsEszo1PA-1
X-Mimecast-MFC-AGG-ID: GUThFtiBMA27MlsEszo1PA_1750697961
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so2451463f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697961; x=1751302761;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f5hwe5uyZiUrMoHUX/Z0pE+5E5La4EJvFJ/v9sB+1so=;
        b=uDUwXiIiOyZ1/G3wy/yfCLCK07/8Qv8M1Zbj/c+U3EwsuMwS2Z1N2SeTmNWvwceWM8
         NDEAf6BD0I0ih1Rsjktlr2saAAjY/dQJnYS6a+SaaDTcIrdOFUG+17WDWx4ES/m266dO
         KahpGHUsnlSccHWdVUyZ0ImzdLFLGcrxyP+S0Xirm7wMXPeu4ngkUIAC1Lo1LjXxOany
         jWe9GtoaPSC2pDr0RQkJrqKf//fMMy8pPA6OQJqs68DCepQC+Nr7hhGh9JFKsVsUI68w
         tLIhqk4D+aqoOwFeV/i8KFd41ACaEIZHiG9UOxw00/zzSIZBBvuyLGqlz9+9c5ecuiDO
         y1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWTYUZGmJhIDorLN12QWMJ+v2eO5cRPf+RwfT1bAokjkKagzd6ycN8zlhpU+OX842toeVKXgK0EbtEdQGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ZxQGV3RY1nRsjKfYad20ADyC+VsSQ5/v/+RC0m9NQAaYKRX9
	yrioj7oGCH6I3yOS4WnAYIlfjgynotY02lvkvaS11PJE433Qx1vdoOVhhrAuZo8yc2dOppMXt88
	eMHKbyhEjThYRQt4aP33kpK+4DM6I5gJDdFt5xjxivv29VpXBFvO81mcNB4sAv9xi7Q==
X-Gm-Gg: ASbGncuO6mgt8gxj5uY/j9FNuYjQ4YI9c/1a1oGh/fF2j1y6zM87ICCZtoofVUmna2f
	QkLa5mS54MAAIH4haLj9CfjEek8iNSWHjeK+eutbZxrIpRwtdR7yESqTZe41yLsa+jTxlMFWX03
	yn4lEKH4Kz5InaUL8uy0lxqTlciUWu5rYKVgzxKtJ0AaYDrUBw2pSSa/j0eUoaPHBemka2H3xCR
	s88bP+Bx2wPOoSgB6mjnPod9cGK/Q0UiZlWSk8Sv60txFjjrVnUXyqRSvaW6rL9xU2Nr+rOT5kX
	mjv4eu308EK5OoWqgY53rAMcmRmKKAhokO0GeyL2VMoQw7UN8X/3z+OR2TnPT4DGOlrYeVJ2aAK
	xCOYk9SJExC+hkGO36riYuVXR/ATlj/AIrc572ee5AxIcDIryGg==
X-Received: by 2002:a05:6000:18ac:b0:3a4:fc07:f453 with SMTP id ffacd0b85a97d-3a6d128a6cdmr9028760f8f.8.1750697961171;
        Mon, 23 Jun 2025 09:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXD8CIj4VDTvcMdwAo8mP9MJF8rEw5x7mXpeskLsZ/Z1/hijMDCWGLNsfOYE4+BciBv0s9BQ==
X-Received: by 2002:a05:6000:18ac:b0:3a4:fc07:f453 with SMTP id ffacd0b85a97d-3a6d128a6cdmr9028746f8f.8.1750697960764;
        Mon, 23 Jun 2025 09:59:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647070cesm115773945e9.33.2025.06.23.09.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:59:20 -0700 (PDT)
Message-ID: <6f92b7d6-7d3c-4830-a591-75dc4d55c46c@redhat.com>
Date: Mon, 23 Jun 2025 18:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Potapenko <glider@google.com>
Cc: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, catalin.marinas@arm.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 peterx@redhat.com, syzkaller-bugs@googlegroups.com
References: <6857299a.a00a0220.137b3.0085.GAE@google.com>
 <b5aa34ed-d7d4-4445-b8bb-6187b4100682@redhat.com>
 <CAG_fn=WBBwkZZZzBMp0SO3=POgKzNaJGkU_YJKcAKRVQdEYPqw@mail.gmail.com>
 <56862a1d-71c0-4f07-9c1a-9d70069b4d9e@redhat.com>
 <b79acb4e-8a50-4d72-9aaa-0ec5dba25678@redhat.com>
 <014a3820-8082-43a6-8bb2-70859cabdbc0@kernel.dk>
 <a72fe0ba-b022-4f6e-b401-78e93aadc5ce@redhat.com>
 <ea748461-2059-4aca-81a0-4d01c34926da@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ea748461-2059-4aca-81a0-4d01c34926da@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.06.25 18:48, Pavel Begunkov wrote:
> On 6/23/25 16:11, David Hildenbrand wrote:
>> On 23.06.25 16:58, Jens Axboe wrote:
>>> On 6/23/25 6:22 AM, David Hildenbrand wrote:
>>>> On 23.06.25 12:10, David Hildenbrand wrote:
>>>>> On 23.06.25 11:53, Alexander Potapenko wrote:
>>>>>> On Mon, Jun 23, 2025 at 11:29?AM 'David Hildenbrand' via
>>>>>> syzkaller-bugs <syzkaller-bugs@googlegroups.com> wrote:
>>>>>>>
> ...>>> When only pinning a single tail page (iovec.iov_len = pagesize), it works as expected.
>>>>
>>>> So, if we pinned two tail pages but end up calling io_release_ubuf()->unpin_user_page()
>>>> on the head page, meaning that "imu->bvec[i].bv_page" points at the wrong folio page
>>>> (IOW, one we never pinned).
>>>>
>>>> So it's related to the io_coalesce_buffer() machinery.
>>>>
>>>> And in fact, in there, we have this weird logic:
>>>>
>>>> /* Store head pages only*/
>>>> new_array = kvmalloc_array(nr_folios, sizeof(struct page *), GFP_KERNEL);
>>>> ...
>>>>
>>>>
>>>> Essentially discarding the subpage information when coalescing tail pages.
>>>>
>>>>
>>>> I am afraid the whole io_check_coalesce_buffer + io_coalesce_buffer() logic might be
>>>> flawed (we can -- in theory -- coalesc different folio page ranges in
>>>> a GUP result?).
>>>>
>>>> @Jens, not sure if this only triggers a warning when unpinning or if we actually mess up
>>>> imu->bvec[i].bv_page, to end up pointing at (reading/writing) pages we didn't even pin in the first
>>>> place.
>>>>
>>>> Can you look into that, as you are more familiar with the logic?
>>>
>>> Leaving this all quoted and adding Pavel, who wrote that code. I'm
>>> currently away, so can't look into this right now.
> 
> Chenliang Li did, but not like it matters
> 
>> I did some more digging, but ended up being all confused about io_check_coalesce_buffer() and io_imu_folio_data().
>>
>> Assuming we pass a bunch of consecutive tail pages that all belong to the same folio, then the loop in io_check_coalesce_buffer() will always
>> run into the
>>
>> if (page_folio(page_array[i]) == folio &&
>>       page_array[i] == page_array[i-1] + 1) {
>>       count++;
>>       continue;
>> }
>>
>> case, making the function return "true" ... in io_coalesce_buffer(), we then store the head page ... which seems very wrong.
>>
>> In general, storing head pages when they are not the first page to be coalesced seems wrong.
> 
> Yes, it stores the head page even if the range passed to
> pin_user_pages() doesn't cover the head page.
 > > It should be converted to unpin_user_folio(), which doesn't seem
> to do sanity_check_pinned_pages(). Do you think that'll be enough
> (conceptually)? Nobody is actually touching the head page in those
> cases apart from the final unpin, and storing the head page is
> more convenient than keeping folios. I'll take a look if it can
> be fully converted to folios w/o extra overhead.

Assuming we had from GUP

nr_pages = 2
pages[0] = folio_page(folio, 1)
pages[1] = folio_page(folio, 2)

After io_coalesce_buffer() we have

nr_pages = 1
pages[0] = folio_page(folio, 0)


Using unpin_user_folio() in all places where we could see something like 
that would be the right thing to do. The sanity checks are not in 
unpin_user_folio() for exactly that reason: we don't know which folio 
pages we pinned.

But now I wonder where you make sure that "Nobody is actually touching 
the head page"?

How do you get back the "which folio range" information after 
io_coalesce_buffer() ?


If you rely on alignment in virtual address space for you, combined with 
imu->folio_shift, that might not work reliably ...

-- 
Cheers,

David / dhildenb

