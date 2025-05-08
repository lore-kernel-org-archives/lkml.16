Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B03EEAA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708923; cv=none; b=EUmQt6tYcYQ45VNVRQ0pWrbU6LenR+e25QFvh0UV/QOGtpMOHykUrJ20kxiK9ilV/FCbDwV1i+Cv2R5KMIHuEl6yP7p8mdVHxyfZHqEnOENyLV/nygwodIgSj4zvrUg73CKkEczFFtuqJe0WPppTNFPHAEmFPZNz2RGFFzPI4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708923; c=relaxed/simple;
	bh=NKLVSXbojhVHxZkKWa62AJaarSCZMsLq93CjXdXituY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzK1p3Jtd7+PvWhuSnWYzkLyYkf/RowaujdnC9j3yj7AXlL74//Tz2aH0GlyADuwai8WDPfAwMG0/Gp/evXHnjeOElW5R0eHUFs3J/PYtlmw2e1l1XIOlHh8sd2ENK+F36tOPmKCQRW/LeShbZbrky1MhC928uIqwnG3s/eY9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=FX9Mi4w/; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="FX9Mi4w/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746708905; bh=1HjdOb7bz/XbSeZg15babzCWMCZayg86NSsamfZRmfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FX9Mi4w/vCKd68OZFbFghq73V+/lC17W1EBd1N1HltaUKGQ7hKz7DYSrPq6cwG316
	 gtVMtxu6xW0ge8G8UOjp44UbS8YdoP4ZxdIwJgwoQ/OExrAYTkEgCiiSRgyKcgTS8b
	 HaZwkU9eUn9jLrVxQKh7g5KByMdo2E/hHuygrB6I=
Received: from localhost.localdomain ([36.111.64.84])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id C3496874; Thu, 08 May 2025 20:48:52 +0800
X-QQ-mid: xmsmtpt1746708532tmcsz22ek
Message-ID: <tencent_27AC10231AC4AB1EEC24EBB53960919BD907@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuaQ8hTjbMU5BFL9zCvXZXhxttMJDmR+i6BwcDyJ7rP7FVFm1lkJ
	 XvUaqRRj9j9fVRHAGm1/AqHas9Q3f7ukouWKtbd/qCyxGOwftYfxig0umLFrv6nuHqVElu/VI+2q
	 BOFSBBwTrzCfExjlkje6XVZ+AflJcNZ95/LlcgeaKbVxh8FDKPhqK7DTkwvMKXE60eYU2GEUtqxd
	 N8t7HxtqArWsVXhPAnqJyRmRCzRU/XxpyXxhclhvrjl95Iyjsochx3EgMSv5qYe+axnUS7hNo6iM
	 UaX1njjWYKX5M46W+s3coHArJPLgLE0cavVKZtjRWKCt51Pv1yrLDAaUm/I+qcyZHGPFrbHJpNg5
	 qZOyZ1JqUbfxzms/4/MBGv/bNyrNReoDYfbArgnKPwGO2iIw3/qQXGxt6nh/ekQzK6HA2ZtCEr/j
	 8eEmnvIjNW/1jz8wpsjI6Dl8nQN2hD6Qp9gXaXeYCfdPAWMeKNFcviK0nFCddkjc5zMKLZrHtODM
	 akivtznXmLsIymCV72MbBe4OiUIxcw1E2/hFA75Vvz8oLyaZt2lGRryspSn8ZHJ1jBEfuKhsb4up
	 kYHazAvml8WZYB2NF0l8DlDVMWyIU47i7qD0BnL5NX+TqzWr09AAY6AiF6H5sf4TKzwz/gCYIN65
	 FipvBj+48AQ8qzyG84QWLtc6BnorNvNaNC9C87S086hD5NWF9Wj4UWQvBlUj7p3RrBzywz6wRvW4
	 +FafMwsRABReQbE3X67vA0v2LGuLvnmdpn+Fqx7X4aKPI8F3TDZwamn8T5pnFA89IDPhBS14pV9L
	 +f3tO+8fgHkw5wDwrf5zCzoS5LCaZoMXQ+gzrkJeWUtyI/+U9fPk06KaK1dkl70uT/hKSZAIzDD8
	 KoTQldtKPwcakLtO/6T4xfuNqhes5kDvM4zUn1A3G7AJhlDrut9UcxHCBK3VbwHRUY4O6RFG2iYr
	 VWsOGwOLpkBGVs6IyeFr/yCSA+uTtdCaLagwfKJ+Tp/orczPgLJKrHUuIEEOto
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Feng Lee <379943137@qq.com>
To: 21cnbao@gmail.com
Cc: 379943137@qq.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	david@redhat.com,
	lance.yang@linux.dev,
	libang.li@antgroup.com,
	linux-kernel@vger.kernel.org,
	maobibo@loongson.cn,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	trivial@kernel.org
Subject: Re: [PATCH] mm: remove useless code
Date: Thu,  8 May 2025 20:47:51 +0800
X-OQ-MSGID: <20250508124815.863-1-379943137@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CAGsJ_4y5QB7UTD3Mvwqib-c6DYkKCP_9V1s9eVoXLZGx+A5ObA@mail.gmail.com>
References: <CAGsJ_4y5QB7UTD3Mvwqib-c6DYkKCP_9V1s9eVoXLZGx+A5ObA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

> On Tue, Apr 29, 2025 at 1:59 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 28.04.25 13:03, Barry Song wrote:
>>> On Mon, Apr 28, 2025 at 7:17 PM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 27.04.25 10:22, Barry Song wrote:
>>>>> On Sun, Apr 27, 2025 at 2:16 PM Feng Lee <379943137@qq.com> wrote:
>>>>>>
>>>>>> Remove unused conditional macros.
>>>>>>
>>>>>> Signed-off-by: Feng Lee <379943137@qq.com>
>>>>>> ---
>>>>>>    include/linux/pgtable.h | 2 --
>>>>>>    1 file changed, 2 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>>>> index b50447ef1c92..47c5a54b7551 100644
>>>>>> --- a/include/linux/pgtable.h
>>>>>> +++ b/include/linux/pgtable.h
>>>>>> @@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>>>>>>    }
>>>>>>    #endif
>>>>>>
>>>>>> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
>>>>>>    #define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
>>>>>> -#endif
>>>>>
>>>>> Do you know who else had pgd_offset_gate() before except ia64?
>>>>>
>>>>> /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
>>>>>      resides in the kernel-mapped segment, hence we use pgd_offset_k()
>>>>>      here.  */
>>>>> #define pgd_offset_gate(mm, addr) pgd_offset_k(addr)
>>>>>
>>>>> btw, do we still
>>>>> need pgd_offset_gate() given that nobody needs it now?
>>>>>
>>>>>      1   1168  include/linux/pgtable.h <<GLOBAL>>
>>>>>                #define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)
>>>>>
>>>>>      2   1112  mm/gup.c <<get_gate_page>>
>>>>>                pgd = pgd_offset_gate(mm, address);
>>>>>
>>>>
>>>> Right, we should just remove pgd_offset_gate() completely in this patch
>>>> and simply make the single caller use pgd_offset().
>>>
>>> Yes, exactly. The original patch doesn’t seem to be appropriate.
>>>
>>>>
>>>> I think we can even do:
>>>>
>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>> index 84461d384ae2b..05dd87ccce155 100644
>>>> --- a/mm/gup.c
>>>> +++ b/mm/gup.c
>>>> @@ -1106,10 +1106,7 @@ static int get_gate_page(struct mm_struct *mm,
>>>> unsigned long address,
>>>>           /* user gate pages are read-only */
>>>>           if (gup_flags & FOLL_WRITE)
>>>>                   return -EFAULT;
>>>> -       if (address > TASK_SIZE)
>>>> -               pgd = pgd_offset_k(address);
>>>> -       else
>>>> -               pgd = pgd_offset_gate(mm, address);
>>>> +       pgd = pgd_offset(address);
>>>>           if (pgd_none(*pgd))
>>>>                   return -EFAULT;
>>>>           p4d = p4d_offset(pgd, address);
>>>>
>>>> Unless I am missing something important :)
>>>
>>> Technically, it appears to be correct. However, it seems that
>>> pgd_offset_k is primarily used to improve readability by
>>> distinguishing between kernel space and user space?
>>
>> Yeah, but this is GUP ... ("user") ... looks like that check/handling
>> was in there ever since git happened.
>>
>> get_gate_vma() only exists on x86-64 and uml.
>>
>> I wonder if that could ever actually reside > TASK_SIZE such that we
>> would even need that.
> 
> I assume that reside > TASK_SIZE can only be true on IA64?
> 
>  /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
>       resides in the kernel-mapped segment, hence we use pgd_offset_k()
>       here.  */
> #define pgd_offset_gate(mm, addr) pgd_offset_k(addr)
> 
> Since IA64 is dead, is the code also dead? It seems we can safely move
> forward with the approach you're proposing.

Thank you all sincerely for your patience. I will carefully incorporate 
the valuable feedback into the necessary adjustments for the upcoming 
patch version.

> 
>>
>> But this whole gate stuff is confusing ... IIRC it's a single VMA shared
>> by all processes, and not actually linked in the maple tree etc.
>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>
> 
> Thanks
> Barry

Best regards,
Feng

