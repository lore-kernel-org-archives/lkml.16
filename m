Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188921CC43
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914455; cv=none; b=VJlnRlnmNMwjXPfoF8ek5SVlmzIlJviS6oM5xPA4D9lLhtrsbnVvZEGrYXd7j6PRcAd0FF1mlPZolCBq6hivGnuSYrrjhe9yfWLyRcbxZOvOzU6E7qgJZk757iIDwizCVd8Dtryv5Dh3kNSeA823WX938xVWpLX9W/lOXkcSvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914455; c=relaxed/simple;
	bh=Iu48VWXxfYE4qOtSs1aZeE/0tS1/xAFzJuATkvzf+Do=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQ3E4Zd9j6QbVA5DFXznA1ZzgX+XJg8TrEW1H9EthNzUQWovXbYlhk6OuwzjTodEdAESbYWLSd4RsnzLa0KZSp5qzVyMPsLa0q5GeqkSYHMsxPpHq4vNErHB3z/0POlhgQu0fn1PKH3qGjYIX5l7q8ESJks+7wsON4Mhx/XVn1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jekk/LWd; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jekk/LWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745914445; bh=5AGJx+jsSbqy04UgbIsPfGmH+wCakCo1sPHJB3LsiSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jekk/LWdLY14eqN9rI07k/Xvwwdxr3i2BWZTa5GYagjs0bjOwjy1ZlwLKNI+uOqRV
	 a6aepq6IVTtnX8iwrSQcKqJ1VzzzYhERm11RaNZ3fQWe1MnVTk8d+KLleByuqvWZg2
	 LnbA0qzIG95yuxgJIKo5KDg02kLfLqjigKSIFdLk=
Received: from localhost.localdomain ([36.111.64.85])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 37B18054; Tue, 29 Apr 2025 16:13:59 +0800
X-QQ-mid: xmsmtpt1745914439te7xwq5mq
Message-ID: <tencent_2759B6462D88873D9249986B03C0E237EA08@qq.com>
X-QQ-XMAILINFO: N2zgDHximsrqvlBh7+K6XVa8JoDBlSiCexDqHwpV1q03j44E+wmnOyXe3KJUnA
	 QEIoLy82kd121OSZOrqFFcMyijnA7yu4fBsl4XLKWsWfOGKvyr24qwHq1D6jyKNSGu9Jx6mWaxGT
	 EoO23m06BYhOmgNd9yhjRpxIo1iWitrwgmPzktHsVmtT0jydmpSe3uZ9FgHWHb84XAyhOY47mL1t
	 D6L8FBZA4yx4lHBtgiHLGGWg5HBtB+U3dyTz0QBtkF4l6SqJ36pS1Ip5p14utdsBp86uzE8YsZka
	 vyp0v+s6Hyvaj/beU397lejWdbQ+V1WeW3JxnUDmpu8MQyO+4sFLmhrn9kYq3+r8p58d/opVrRsh
	 9rluUOufR0QGkVbKNv7P2PSoFFLInjtIYKDHZme8fpm5p2or5COTd/LJ1K/fZ1/+TG9Sx2yOt9vs
	 BgS7EhESn2MPj/IIZxaO1Uu1ZrjxIkLGuHXzOwG08hbpnmgV0gL71ZbO5IchHxNKC0MgrBbDwaiN
	 DJRjDkewfKCSZf6Zjg5pndjv2W+dMzVxzu/fTm5SG6Rm6BDQaEienFY9M3/CXevyC6acO1B7yxSm
	 Mo2oZIqC32JKk7+ku67nTlX6kUHqUoJXgjj3Hxau36VBk/pDO8L5pS2cH9fYSrUCKvyi6QpEnzlP
	 JTD/6jFHU+uqgqW9PRfw/+IPeex8EW2FTOHNjJgOcagl63RDbb5xmknxbYJDR5L1Kziaz81MNYAV
	 tmjjO/l+JKFiaToxn/cvCpDGu0KGJRxVF/hr9Ry/70rx4CoPZjrtEW4JX5/EOH1BMiw2lZxtKCVt
	 ofAJOn22ZsR8nvIeOREABCAIlJS/9rwNlybicpCspQ8yk3QgHEcJTgqEhjRCrb3lM4CTjgubZxgC
	 eXPBGM0DlDuAyc8Qp2tEW0Bo5n0OFLibnyDM2yspAL/A8fFFxij3LGY69idt4pHcecPbd5APZUPP
	 zmpNymX5QX44UNbFU5SSCoI6zAgDzqpVhDH9IDI9+dEkoh2T/mqA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Feng Lee <379943137@qq.com>
To: 21cnbao@gmail.com
Cc: david@redhat.com,
	akpm@linux-foundation.org,
	ryan.roberts@arm.com,
	libang.li@antgroup.com,
	peterx@redhat.com,
	maobibo@loongson.cn,
	lance.yang@linux.dev,
	anshuman.khandual@arm.com,
	trivial@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove useless code
Date: Tue, 29 Apr 2025 16:13:00 +0800
X-OQ-MSGID: <20250429081322.7791-1-379943137@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CAGsJ_4zn158TQV7Nc+vK-kmu6S4kOiFSZyUO7aK9dhwhrEq2cw@mail.gmail.com>
References: <CAGsJ_4zn158TQV7Nc+vK-kmu6S4kOiFSZyUO7aK9dhwhrEq2cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Apr 28, 2025 at 7:17 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 27.04.25 10:22, Barry Song wrote:
>>> On Sun, Apr 27, 2025 at 2:16 PM Feng Lee <379943137@qq.com> wrote:
>>>>
>>>> Remove unused conditional macros.
>>>>
>>>> Signed-off-by: Feng Lee <379943137@qq.com>
>>>> ---
>>>>   include/linux/pgtable.h | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index b50447ef1c92..47c5a54b7551 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>>>>   }
>>>>   #endif
>>>>
>>>> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
>>>>   #define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
>>>> -#endif
>>>
>>> Do you know who else had pgd_offset_gate() before except ia64?
>>>
>>> /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
>>>     resides in the kernel-mapped segment, hence we use pgd_offset_k()
>>>     here.  */
>>> #define pgd_offset_gate(mm, addr) pgd_offset_k(addr)
>>>
>>> btw, do we still
>>> need pgd_offset_gate() given that nobody needs it now?
>>>
>>>     1   1168  include/linux/pgtable.h <<GLOBAL>>
>>>               #define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)
>>>
>>>     2   1112  mm/gup.c <<get_gate_page>>
>>>               pgd = pgd_offset_gate(mm, address);
>>>
>>
>> Right, we should just remove pgd_offset_gate() completely in this patch
>> and simply make the single caller use pgd_offset().
>
> Yes, exactly. The original patch doesn’t seem to be appropriate.
>
>>
>> I think we can even do:
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 84461d384ae2b..05dd87ccce155 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1106,10 +1106,7 @@ static int get_gate_page(struct mm_struct *mm,
>> unsigned long address,
>>          /* user gate pages are read-only */
>>          if (gup_flags & FOLL_WRITE)
>>                  return -EFAULT;
>> -       if (address > TASK_SIZE)
>> -               pgd = pgd_offset_k(address);
>> -       else
>> -               pgd = pgd_offset_gate(mm, address);
>> +       pgd = pgd_offset(address);
>>          if (pgd_none(*pgd))
>>                  return -EFAULT;
>>          p4d = p4d_offset(pgd, address);
>>
>> Unless I am missing something important :)
>
> Technically, it appears to be correct. However, it seems that
> pgd_offset_k is primarily used to improve readability by
> distinguishing between kernel space and user space?

Agreed, readability seems to be the key consideration here.

>
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

