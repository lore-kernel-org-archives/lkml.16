Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C2D13B284
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697204; cv=none; b=HpsYXZHUXaLTw0j2ApeRfUGQIv5VCJL8aWN32fd6nv8XvEuN4ess+IsjHqMXVB0o2aT5fbs7d8zHSi85KednB58zFsebeaSvDdzyoIewBJ4YGokewEuaJya8i5G6sa3oYEJnoFfPgUN15B3G1STxQR/ydd02SvbtGMEEJ55vQUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697204; c=relaxed/simple;
	bh=VDo5/z1MABEPyetQiMf6RMfNJ5iyWDH7G74HUP9WRCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOm36u7IjGvrpPXMlHrgIeDlKwMi6VYCJhCfosFs3BwK8owt2y8TM29lvWK9TchMR1kX4BrICAJD48fEbMFpf2emB9DXinUaxydoGzTEJrVKzU5IUVpr8sIgtrTRj+ZYKRqITTaRy1TMSzko7TweQte/kau2tmkgGoPmnnRxxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGdJV6dK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGdJV6dK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad1b94382b8so835640966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750697201; x=1751302001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DWnkVbhCelsSkMmNhV/IGRpglEYrrvHIBFGaENB+/Y=;
        b=MGdJV6dKKDrcBTy/7ODaSy946jxx7ta5GV4oDQ/CPHuoyPBX5APumL6ojwdXIXz5VS
         OJQuRq+Al3yNc9Df0gnwSvmsT3LEbPMZVloA65csOuPs6GL9lOdejxa65M+Yg3W71ptc
         exXiNvCxXeOyaO2aSX5ue9ynA3V39UBcUjzhz5oa4Wpzz2/GgC8fQX/wY9HBlF7zI5sH
         rWJByjMgCO27wZwA3h9PIUrJJpbYXWNhlI8oH59x7oz/m0wuYnFJbw+B/sPZ24RIMxZd
         qmnzf3mLQtmhVl2eNjt8NV9/GqZBVmtljaNDQfjOes7btsvDLnCdmz15JYtiiX3qfXyA
         YbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697201; x=1751302001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DWnkVbhCelsSkMmNhV/IGRpglEYrrvHIBFGaENB+/Y=;
        b=XSz48ElVPrwMpSQOE+iUyxQvKEqaq2UvpRiOpx2cA74dPlTvDfClm5YXAziUNS6bGj
         CmX2IexSCpQyqa1ikwnw6c28ijjkCNphCufxkvrZflbs7gt/0HLNZpneGTnS4/rK4vYu
         Z626z+7qGctMvISYSIay12uwR8Pl1r7OGg6Pb8nth+ThFCKvzW0PRLK3I5CEWlkemgIJ
         zGEQctwpF3Wbm8elfUm0eCNSf8Y+JuWnTvUdaPh/2YW1cIsS9NXLaTs2LfJBfY2eG26y
         Y45WTLxG8iMaErnr/fQNDdwqptYdQbb/xhwCZTNTPvIPDiHNwQMReq1/M3YCUBZNOa25
         MOBA==
X-Forwarded-Encrypted: i=1; AJvYcCU/BAXAVudyEfJ1QuGEfVY8MwUYIylwZPjKwRpC2EqC+ImwP/lN/63gkMfgKlk5BYma/Qm0yCjVYiTcsE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLlKRjgAhwgxDQJOqbQEpQQf+b6bJ5tB5KI4gXOy42SwTn9CNp
	8aUZ+FbkrN3RD5hXYIA1J91oL56l1ecP24bTgMIOV4bQ78MRH+wW4Kjw
X-Gm-Gg: ASbGncsgPYIGPhugu/x8we0nPLi4Jcg/bT29K/PHxnp79u/68MK9JB8lv/RTvKLIj/s
	AZRPhwi8fzIbOM8e8EjYLRWMcTNAsKJCAUXQ9gQG+erBBzF7vFG3vJnWIrzjrQUOw2IV0+UjAzz
	lMou3Cg5984OuXkwozCk8pBhc6W9ub8bI3jBBYXLqP0G83cOxNxyr8ZNl/ifJ0brHB/QiieHOve
	ulT14jfHE+w8ugggIc2EP0Lw8NBf2D6jIhKmRiqTd735PvrTnjZMHt5qfskT/GdNXCq6M83SR0K
	bVQX33WivOsPmgfmwi/7St5n5bsOziimgSBY2VZrWaCE1RmrvTw6YW+taXZdGHbWwt3GIca3xRB
	2RwKfLWY6GA==
X-Google-Smtp-Source: AGHT+IGVk3hAk+zkZOObee7QtVbPeMGvaHD1uiWojMmGupfBDz2h+/EUWsPc/XulZI0q+i3kLQHVgg==
X-Received: by 2002:a17:906:2c1b:b0:ad5:23e3:48b6 with SMTP id a640c23a62f3a-ae057bd6e23mr1054592466b.45.1750697200898;
        Mon, 23 Jun 2025 09:46:40 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::2ef? ([2620:10d:c092:600::1:85c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6f8asm731941866b.117.2025.06.23.09.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:46:40 -0700 (PDT)
Message-ID: <ea748461-2059-4aca-81a0-4d01c34926da@gmail.com>
Date: Mon, 23 Jun 2025 17:48:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>,
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
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <a72fe0ba-b022-4f6e-b401-78e93aadc5ce@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 16:11, David Hildenbrand wrote:
> On 23.06.25 16:58, Jens Axboe wrote:
>> On 6/23/25 6:22 AM, David Hildenbrand wrote:
>>> On 23.06.25 12:10, David Hildenbrand wrote:
>>>> On 23.06.25 11:53, Alexander Potapenko wrote:
>>>>> On Mon, Jun 23, 2025 at 11:29?AM 'David Hildenbrand' via
>>>>> syzkaller-bugs <syzkaller-bugs@googlegroups.com> wrote:
>>>>>>
...>>> When only pinning a single tail page (iovec.iov_len = pagesize), it works as expected.
>>>
>>> So, if we pinned two tail pages but end up calling io_release_ubuf()->unpin_user_page()
>>> on the head page, meaning that "imu->bvec[i].bv_page" points at the wrong folio page
>>> (IOW, one we never pinned).
>>>
>>> So it's related to the io_coalesce_buffer() machinery.
>>>
>>> And in fact, in there, we have this weird logic:
>>>
>>> /* Store head pages only*/
>>> new_array = kvmalloc_array(nr_folios, sizeof(struct page *), GFP_KERNEL);
>>> ...
>>>
>>>
>>> Essentially discarding the subpage information when coalescing tail pages.
>>>
>>>
>>> I am afraid the whole io_check_coalesce_buffer + io_coalesce_buffer() logic might be
>>> flawed (we can -- in theory -- coalesc different folio page ranges in
>>> a GUP result?).
>>>
>>> @Jens, not sure if this only triggers a warning when unpinning or if we actually mess up
>>> imu->bvec[i].bv_page, to end up pointing at (reading/writing) pages we didn't even pin in the first
>>> place.
>>>
>>> Can you look into that, as you are more familiar with the logic?
>>
>> Leaving this all quoted and adding Pavel, who wrote that code. I'm
>> currently away, so can't look into this right now.

Chenliang Li did, but not like it matters

> I did some more digging, but ended up being all confused about io_check_coalesce_buffer() and io_imu_folio_data().
> 
> Assuming we pass a bunch of consecutive tail pages that all belong to the same folio, then the loop in io_check_coalesce_buffer() will always
> run into the
> 
> if (page_folio(page_array[i]) == folio &&
>      page_array[i] == page_array[i-1] + 1) {
>      count++;
>      continue;
> }
> 
> case, making the function return "true" ... in io_coalesce_buffer(), we then store the head page ... which seems very wrong.
> 
> In general, storing head pages when they are not the first page to be coalesced seems wrong.

Yes, it stores the head page even if the range passed to
pin_user_pages() doesn't cover the head page.

It should be converted to unpin_user_folio(), which doesn't seem
to do sanity_check_pinned_pages(). Do you think that'll be enough
(conceptually)? Nobody is actually touching the head page in those
cases apart from the final unpin, and storing the head page is
more convenient than keeping folios. I'll take a look if it can
be fully converted to folios w/o extra overhead.

-- 
Pavel Begunkov

