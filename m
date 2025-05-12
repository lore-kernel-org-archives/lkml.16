Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA93D33F7
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031028; cv=none; b=q8LFiO8P+2GU2iUjOmkyiqlh8CsrvRJEddIUDt9IMf+LhS5zWQWKb7lPQtVGhthDnBLQqykBSk3lvpe7ASB/ABecVsHv7Vv2u94ERK9UsnNmLCVwnmAWsGrjUXQnHXf0l9CWXOmW5NCboNfjyh4/XL9M/hb++A3L4f+9fz4M4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031028; c=relaxed/simple;
	bh=YKZPxyAPkt19l7DyMtcpMY/rn8zpqIXb1p5NOfBGZNw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zx2tDLZ4dmZlzxCQndGUrH0iTzVovuu3u76JqNbY4x0/wuMubDbCRNv9zf6USJkVlF00DA9pydpj5oN6u2BVaPn6TBbMycgYjnncfhpiLX5cbc95sNJbvErS+t+9ps7LLSDjfSISXfNpMSwsosWDVhTg01JKPQaRMZVPXuBFHj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=iSpz9SM7; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="iSpz9SM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1747031007; bh=Icx3t6PWjAZDDn8FZi9nZ6LbPRYyuC2hPubQzJ2SlmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iSpz9SM7QbFbOK1WdV2JKJGum3JPIIkPI2lmsilQIy3Ke1I3O7zPdehjmUJpJLavd
	 RXWd6t/pbjV4z6Uvyh/UvaC9cddSO7+RVIjBYmALbvuikIv2rJ3s4j1kRXvZi8E7+S
	 pObTiDzRiOEhLkWl1nfQUe3sK1QlvdnkRXgMN5Xs=
Received: from localhost.localdomain ([36.111.64.84])
	by newxmesmtplogicsvrszgpuc6-0.qq.com (NewEsmtp) with SMTP
	id 5D113096; Mon, 12 May 2025 14:23:17 +0800
X-QQ-mid: xmsmtpt1747030997t577ur5ja
Message-ID: <tencent_57DE280591BB8727E962ED1AF8FB8628AB05@qq.com>
X-QQ-XMAILINFO: MiPTq5wGoKOmbwboCW6/0/Ky/AA8hJvXbWFTc/HiqqCERtjacIORDTJtsLpXJj
	 HVuGZi66vu5stM5jNDqEp2mD+eTrpKwNsCP56tlhcRQI9qH8lc+cucfiXcB4mDiFW35Jo2nrB2qG
	 0CLAwJ5JD8J2Md+bblC9enfkrzxfaTF5UP4fm3vuWD3X3Oq96re/6gz3PELxZr/AjdtKDEFgr9ba
	 CiX4s4bc1ULFoOYG+u1NjbpvgGjbAfkIQlZo+XxOUJfAkldHeDBQjCKrsQN6jIs5xNDIm5BJW0KS
	 DfxCAtcp+JE+270tiemYhHK58uk4y4fcECLSLjZ2PS/W4OyDYTjbI+iY7jI2p9FkRSK7ERn9pHHb
	 J0cpI9TeA8eZQBmpSidqU57hj07xdhFTAF51kff8PMNKvVR5LPxR4fJxvMy97dVNC0HS3zgR0vVH
	 bwfMx4Z4KdnThdNyKVqhlnRbpv8HyoOhVWFLqe6UXQj+MFB52mqnxmb7/VP45A2v8644LmXCY9Eg
	 dLkTFYpO3+99QPVa9BzFnrZaZOe81xPlW83b72KZVzwDUfV1wONWCo8GYUoZnXtn42IgZcw1TsLb
	 do6UBblENMK7aDHEoVx9Q2HiboNVCecDxSGIltXT4XFJZB7Ys7mpkY+9mK6Wyrafg5GOm3mPRff6
	 i3HZbk30WQUJxziX/rKYYanQNWrV6B02T42EQr9KlKd/eHJ1OYkmhZETeVaOHp+BOs3uRNnLwDrp
	 1Fv4YXZsHuS+j1caw2veNLpSJFF4iBm0y82eP33talsBLUlXdvZt5WOwOO6lLDetsjuHcwPWwTv0
	 LPsl7IBP6J+Xs/b6vnw2CxTLfe2hNqsv90ef6YXNWBHVmfQtzUyIT7UQG7qvf9zHx+1mEzuW71v8
	 IMTynqx3WzWyt6h6PNB/cR4BhnrV6lblLSHl8Fgv6xZOi/E9qP/VaOWOCwNpBLi/1GPbiS/lWtgS
	 Foh0T6mNt7LlPd41Z45JUQSNbcjOVRkLu6biIuGEE=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Feng Lee <379943137@qq.com>
To: 21cnbao@gmail.com
Cc: 379943137@qq.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	david@redhat.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	maobibo@loongson.cn,
	mingo@kernel.org,
	peterx@redhat.com,
	trivial@kernel.org
Subject: Re: [PATCH v3] mm: remove obsolete pgd_offset_gate()
Date: Mon, 12 May 2025 14:22:37 +0800
X-OQ-MSGID: <20250512062241.13432-1-379943137@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CAGsJ_4y2hHAsKWR9WLY79d5UDLcai=px+WbgDpoRJrysPqqQOw@mail.gmail.com>
References: <CAGsJ_4y2hHAsKWR9WLY79d5UDLcai=px+WbgDpoRJrysPqqQOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

> On Fri, May 9, 2025 at 2:33 PM Feng Lee <379943137@qq.com> wrote:
>>
>> Remove pgd_offset_gate() completely and simply make the single
>> caller use pgd_offset().
>>
>> It appears that the gate area resides in the kernel-mapped segment
>> exclusively on IA64. Therefore, removing pgd_offset_k is safe since
>> IA64 is now obsolete.
>>
>> Signed-off-by: Feng Lee <379943137@qq.com>
>
> You missed including the tags from v2 when sending v3.
> These tags were already present in v2 and should have been carried over
> to v3:
>
> Reviewed-by: Barry Song
> Acked-by: David Hildenbrand

Please accept my apologies for any inconvenience caused. As this is my first 
time handling multi-version patch submissions, I am still familiarizing 
myself with the process. I will make sure to study the guidelines thoroughly 
moving forward. Thank you for your patience.

>>
>> ---
>> Changes in v3:
>> - adopt more precise subject descriptions
>> Changes in v2:
>> - remove pgd_offset_gate completely
>> - remove pgd_offset_k from the get_gate_page function completely
>> ---
>> include/linux/pgtable.h | 4 ----
>> mm/gup.c | 5 +----
>> 2 files changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..f1e890b60460 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1164,10 +1164,6 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>> }
>> #endif
>>
>> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
>> -#define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)
>> -#endif
>> -
>> #ifndef __HAVE_ARCH_MOVE_PTE
>> #define move_pte(pte, old_addr, new_addr) (pte)
>> #endif
>> diff --git a/mm/gup.c b/mm/gup.c
>> index f32168339390..0685403fe510 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1101,10 +1101,7 @@ static int get_gate_page(struct mm_struct *mm, unsigned long address,
>> /* user gate pages are read-only */
>> if (gup_flags & FOLL_WRITE)
>> return -EFAULT;
>> - if (address > TASK_SIZE)
>> - pgd = pgd_offset_k(address);
>> - else
>> - pgd = pgd_offset_gate(mm, address);
>> + pgd = pgd_offset(mm, address);
>> if (pgd_none(*pgd))
>> return -EFAULT;
>> p4d = p4d_offset(pgd, address);
>> --
>> 2.49.0
>>

Best regards,
Feng

