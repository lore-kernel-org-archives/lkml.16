Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367ED2309B6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746760087; cv=none; b=sjgLaoqCOtueq8jZ3T89BjPacQ9SEyL6jlS/BRkgHiPuNuTLdySnOC1LlElo5MAOiYlA4Z7d4IGoa/y/L5OjwRH3G+F10l6ITO6qmwuIRtjbQoRJulBAEtNM612EsHFUz+Dgi83S2VJuF8cmxuYFBS2qjM7Hd1NjFJ0TS1bwME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746760087; c=relaxed/simple;
	bh=iqk68c+QQGvbd7rJYPDe0JmNd35oSEuv/1+SN7FTXhU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTRQaygU1Ufa0+jPlfDAzriRojvb2MhhjrFhWv1Q6RKv5XWqsX1qyupRF9Ad5HQG599yBoaA9aUpO/scEo/Z2QJeo5MLbBQCyorIz6GgRMLCJVznb9T1UOBLmQ6qF1HHpidAwjUfPvvXKuSe19nrIcBO2D12uAEb1P2Oc6s5kn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=aCji+cOC; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="aCji+cOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746760073; bh=bgw3UiHvSD8Fc7o5dSkvCf8YazJGfgPur4CeGx/BQXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aCji+cOCLZEKLlxIEy8SfeQOCuYC/u08PdNWVOuFSIRXdF8bWRA+rVdRQqv+vl/hn
	 rMg4xSDUks7/galyXNE3fpDiuL7+lvReLX87AgCsrw8h99L6NDmLBpaD3kLQd+OPZr
	 EcpfnZJwPFzrhOu5DuGMRry4wrKaIKTmY7LcGm0M=
Received: from localhost.localdomain ([36.111.64.84])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 1CEBD4DE; Fri, 09 May 2025 11:07:14 +0800
X-QQ-mid: xmsmtpt1746760034tk8w0juhc
Message-ID: <tencent_40ADC102E7DD9065891B95206EF54025F10A@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIeVvuFI3L4kRQOo+CpJCsItuMN1rZPXJ4DVUTCAb3zOGsVZIsHQj
	 cHF2BR84UEgEgT6jc0faxhnhKfSuL5xyRlWegznwGL2r0rhd1f+oZ1HBvYiX0JwbZ3LmUwNyGL1M
	 RjKNbjQ6iTLDaSOJpxoII9SpqtC06kk3b05+H51cmhpHURI2LOWYhvROuCXZy4rXGipYQUIgb3z2
	 o47ITk49TAZrO5yFm/BDnEliHlSZrXDxhNiXQVOvIOt7QyuVZgyy7+eypKZ/CJGP1EnwxpX6J/0i
	 QY9+bDcQp0zvWK21FySzX3XobuivPJptucZAAlEQAqA9tb8Jl7ZIYGO9FuLulT7P/EWfpLVhXue3
	 NL5GZmi2fnMZ5ESVgEzcfCvXkUSFTOc6YJnH8cFfeeTIWk2YZnaI6/P6lKTbpDWoSGRVzhYFfXoD
	 RF8GZjL4DCbqXCwa2ccl4oh1ULNXRB1Zpz3t/HEZqF/U3WHb5XVgRySO9xCE/OfBNcdtJZENb88h
	 6OX41mCZElGHn8HwRrfqZmzzrvHFwYuJP401uxpjOJfJWAn/H3E4eadvRIZpEylb2eOP6usCS9P2
	 slRCAaLFsdGT1N24TjAAX1VJ/miVbG7Hj+Gw7xpuvhThwqHyUXotTcTfptYIaDJJ1nrqn9lmQO9w
	 BrVYyQa5xpYlGviLnNuvkpGqCOc+1ERb/2s1byQeljptFzyGAVC4ZUp7ZHb1wAh7s+XvX9qgH8Vp
	 YQTl5mt5M/FO2ONYWrGRoIOIt4jwdiG8WwtTThTFkDBtQrPUizAFTAOpF61/O99vZmcDXisedUEJ
	 6RbkK38ILZDzM0uS+lfn57sxkZHNHSJZ1YGccJfkq2fTEqU/GzFgyjFZ+hscoWpx+Y0aJq9ZtI8+
	 TXaorEDYYbc4gCm5T3FunOyh1GmSbUftif4YiDcj1JjHdxOEMMS5fvh46xeDMJtb4BsDavhYbcqx
	 TuuHD/AFFuxOtvrA2oN+ChnRlHb+QV64D3nt6fedp9r9N8LfiehxY7K/LtZvUruDreIlAe5tolR8
	 696LOJwwCCVNdo+MJHn+TG3GUUmqxM+D0Ksnx9FQlOZsqkaQUE
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Subject: Re: [PATCH v2] mm: clean up redundant code
Date: Fri,  9 May 2025 11:06:34 +0800
X-OQ-MSGID: <20250509030637.717-1-379943137@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CAGsJ_4yLyXefpjycf05MYEnUis1UkEmH+kKVeKDnCsZzgGNUMw@mail.gmail.com>
References: <CAGsJ_4yLyXefpjycf05MYEnUis1UkEmH+kKVeKDnCsZzgGNUMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>On Fri, May 9, 2025 at 1:54 PM Feng Lee <379943137@qq.com> wrote:
>>
>> Remove pgd_offset_gate() completely and simply make the single
>> caller use pgd_offset()
>
> "."
>
>>
>> It appears that the gate area resides in the kernel-mapped segment
>> exclusively on IA64. Therefore, removing pgd_offset_k is safe since
>> IA64 is now obsolete.
>>
>> Signed-off-by: Feng Lee <379943137@qq.com>
>>
>
>Better to rename the subject to be more specific, e.g.  "mm: remove
>obsolete  pgd_offset_gate()" or similar. Otherwise,
>
>Reviewed-by: Barry Song <baohua@kernel.org>

Thank you very much for your review comments. I will promptly implement 
the suggested revisions.

>> ---
>> Changes in v2:
>>   - remove pgd_offset_gate completely
>>   - remove pgd_offset_k from the get_gate_page function completely
>> ---
>>  include/linux/pgtable.h | 4 ----
>>  mm/gup.c                | 5 +----
>>  2 files changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..f1e890b60460 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1164,10 +1164,6 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>>  }
>>  #endif
>>
>> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
>> -#define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
>> -#endif
>> -
>>  #ifndef __HAVE_ARCH_MOVE_PTE
>>  #define move_pte(pte, old_addr, new_addr)      (pte)
>>  #endif
>> diff --git a/mm/gup.c b/mm/gup.c
>> index f32168339390..0685403fe510 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1101,10 +1101,7 @@ static int get_gate_page(struct mm_struct *mm, unsigned long address,
>>         /* user gate pages are read-only */
>>         if (gup_flags & FOLL_WRITE)
>>                 return -EFAULT;
>> -       if (address > TASK_SIZE)
>> -               pgd = pgd_offset_k(address);
>> -       else
>> -               pgd = pgd_offset_gate(mm, address);
>> +       pgd = pgd_offset(mm, address);
>>         if (pgd_none(*pgd))
>>                 return -EFAULT;
>>         p4d = p4d_offset(pgd, address);
>> --
>> 2.49.0
>>
>
>Thanks
>barry

Best regards,
Feng

