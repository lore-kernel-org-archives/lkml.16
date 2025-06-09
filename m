Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F0610D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749450968; cv=none; b=g4bS89PPGSh/UWfRvUtKnX1n4RgVZifdafLWUwNo2kcaFnouu+p4gdDuTtRcS5W13XkJh4+PJc8814w8S8CmSHHTCvVkIKn8D0ZuMb1366yxCRY36Y4yovEhRTSDEG6zapRTkPJAk0cOmfCV/sBsooU7oI1Fuy0ulIZq0aYxGYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749450968; c=relaxed/simple;
	bh=DLAL88a4FC4DPY+ofxZZ0wDlZVzrTRO/IiXf9Ts8Cog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNRgBh9GRXLXqrYh9IG8/EIo4JGa95nDo9bEvHMy9mp/eHmOfI21Bh+5Ppdd7gdvEolZP0h6Hcbke5WY0hPFIBG0dBJtl7UY7dsWF/EPgSDzsnhgx1YVnH2XBXAMJF64J26zC3Qgk1ADAURk3lbSnU8955xfaeKDQMcxSibvZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ryv8C36+; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ryv8C36+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749450962; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NkGvTMFQQCyEpDTkBUCTdfjzDh5e8ly4M3dbCb1Avtk=;
	b=ryv8C36+uYqYDotOByFHSNPNhnMLI/7ZU2c/xWTDCNJ97/gJt990xr+NIXlwefhLiUC6iRfH2oVwx2KmEhCqq9IRSPobGlGDHA3jlCkBvd0u8NDG81MQxsZdh3GXQO8+ZJSwzRXNEjRwpDveplm0/g5wC2X7ORfh7HdP8Nnp0C4=
Received: from 30.74.144.144(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdM8f3A_1749450961 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Jun 2025 14:36:02 +0800
Message-ID: <a862f31a-bf85-46fe-aebb-ae8c78e5a983@linux.alibaba.com>
Date: Mon, 9 Jun 2025 14:36:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Nico Pache <npache@redhat.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <CAA1CXcDgm4EK5sAs6eFa0RiJHaO=H4vCLMKfjZe_GCXvP+c=xw@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAA1CXcDgm4EK5sAs6eFa0RiJHaO=H4vCLMKfjZe_GCXvP+c=xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/9 02:37, Nico Pache wrote:
> On Thu, Jun 5, 2025 at 2:01 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
>> means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
>> will still attempt to collapse into a Anon THP. This violates the rule we have
>> agreed upon: never means never.
>>
>> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>
>> To address this issue, should check whether the Anon THP configuration is disabled
>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is set.
>>
>> In summary, the current strategy is:
>>
>> 1. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == false
>> (global THP settings are not enabled), it means mTHP of that orders are prohibited
>> from being used, then madvise_collapse() is forbidden for that orders.
>>
>> 2. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == true
>> (global THP settings are enabled), and inherit & orders == 0, it means mTHP of that
>> orders are still prohibited from being used, thus madvise_collapse() is not allowed
>> for that orders.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..199ddc9f04a1 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>>                                         unsigned long orders)
>>   {
>>          /* Optimization to check if required orders are enabled early. */
>> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>> -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
>> +       if (vma_is_anonymous(vma)) {
>> +               unsigned long always = READ_ONCE(huge_anon_orders_always);
>> +               unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>> +               unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>> +               unsigned long mask = always | madvise;
>> +
>> +               /*
>> +                * If the system-wide THP/mTHP sysfs settings are disabled,
>> +                * then we should never allow hugepages.
>> +                */
>> +               if (!(mask & orders) && !(hugepage_global_enabled() && (inherit & orders)))
>> +                       return 0;
> Hi Baolin,
> 
> Thanks for making this change so we enforce the 'never' being never
> rule. As others have noted, this statement is hard to read-- is there
> any improvements we can make to the readability as Lorenzo suggested?

Yes, will do in next version.

> Either way, I've tested this and the functionality works as intended.
> 
> Tested-by: Nico Pache <npache@redhat.com>

Thanks for testing.
