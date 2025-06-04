Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5FF1804A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022985; cv=none; b=f8ts+nsGM1r3uVMIzom6sOTzks8jVG3uNO7zwd0+7pQBSgoF8wovDYQ3cOof/GpfL6x0H9P3vNdBDcgs6ATn9KtaTWC4TdLXqfhraFlypfn0uMhSmIoge1ExtpQVuO0dN2rUPU9ncU7cz50fP3zxB7Vzoiw5m9rdKBR00/6BrZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022985; c=relaxed/simple;
	bh=+uegaZ9lvQZdUB1rhyJSzXJH5x9pve2Zr8HYfiKGpIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVFxlbXXyprqeIiPK9PyIN7vnqP0Y3qoo2k3L3NZc/RjgxvR/yMg0y2hdmEVsY0dtjEgJIsC/SElfw1jAhe0VWnGv9S4t4pr0vh7QSlYJZlspOcHVtJubvY+2Cc3IzJB//bXcdKu69mSCNRgh6h8KrU8I5s+sVQ0QnDvReZU4FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-JdzkHqxdO4atFtpe70OK6g-1; Wed, 04 Jun 2025 03:43:01 -0400
X-MC-Unique: JdzkHqxdO4atFtpe70OK6g-1
X-Mimecast-MFC-AGG-ID: JdzkHqxdO4atFtpe70OK6g_1749022980
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso2352503f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022980; x=1749627780;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WBu9CXsPxsyP23V5BjiF02P7lDkTjUYGFNngEG62zZA=;
        b=kYWx8zKYDnEx64c1LbTT4PuzzS/ARcMIEeLnJBQLKVeV8uJ9kNSvU7uX/gBwg+Furw
         lLxBQiqkT6TJEwFEsgviwgPjHU01LJG6Y2MWCEBuw12LYVM8rjht76gHS01soxTe+XFh
         hYHXERID8uFeoeOdSW9JfpsgbbkZLCABBvaJQPsAwASMJaN85ySh46J1QWnf2Vlx9+Oi
         mMDNfig59B7RURx8SEHQzTo8tuJpFwXPjorNzJVivy8Drz+I47ydBh4iJVlBGjNCpHMu
         wTSO2Ygrgybo82Y09tGZif18ayD9Z2cUZ3I9FO0bNEwOgD/L7I1tP0P+XB9Ag3n0Gjss
         sVhw==
X-Forwarded-Encrypted: i=1; AJvYcCVN3f9OC06MNtht0ouBCSBnPCbrtWzYTkeA0bidmFbesrh/YOOb2s66J8DmClKFzcKM814GFSV7O9Wc0hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKq20CDQ1I2wm7iHlFBcm5vmKshfMGUGUaApa9AR0B72K4dKT
	VgD1WAQDjFwRuN8gfiMR+d5kSITfjboqSaQhZzlEWJ0Z/giNDlxQYoaEVV8FBI9NkqKy+5n880r
	MWN1OxHPoyeU1iMgH6JXEzNdVetliw4t2ISx58lvpkhvuogYlxvXuHJ/iIDSL3j0CNA==
X-Gm-Gg: ASbGncsOJcy8RPQjm2ORMW36Cec8rG/gAlBHg/QPTgB1v6egofh8uDjiAPfbVUJiaYG
	UCYW5iV7CKPsAHDK3fSFEqjRx3/muteKDkhmnZoj3y9pO4u4ffbFu5aGmiu9AMFEVRXT7Jq84Pu
	YryCPZvMMi+I7dhbmLsYtHXkvyur6/d7Z8pSOs4C+7fmp+qI7xZnHYXnsu6NOx7mxDxp1rlHvlF
	YC32yp6ssJGkvzFHPkE2tEAqd26rdUkYnNXgZsr8DcaSdSYo4P0ZXN8d4u3uDmVRm2lT7tV1S49
	wf92Je+OGuqJm8zjAvSeuJUXPSslAYPf/coE24pdyf1i/f1NnWaO
X-Received: by 2002:a05:6000:250f:b0:3a4:eed9:754d with SMTP id ffacd0b85a97d-3a51d8f6aadmr1228179f8f.6.1749022980330;
        Wed, 04 Jun 2025 00:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYoqBWnjeBfwpgm0oQLwM2ZhKRrYOF7+jef4c4xVn7/1m68R97Hy2Z0VSfOv6aVZZMy/jgsg==
X-Received: by 2002:a05:6000:250f:b0:3a4:eed9:754d with SMTP id ffacd0b85a97d-3a51d8f6aadmr1228160f8f.6.1749022979909;
        Wed, 04 Jun 2025 00:42:59 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f831.dip0.t-ipconnect.de. [79.224.248.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5236d4466sm91234f8f.100.2025.06.04.00.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:42:59 -0700 (PDT)
Message-ID: <72d1df17-1e2d-44ce-95eb-fe79db3f4e05@redhat.com>
Date: Wed, 4 Jun 2025 09:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] kdump: wait for DMA to finish when using CMA
To: Jiri Bohac <jbohac@suse.cz>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <dhildenb@redhat.com>,
 Michal Hocko <mhocko@suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz> <aDoVO4H4CpXPjAdI@dwarf.suse.cz>
 <da52a835-6a4b-4f11-acac-f4ef995da7e1@redhat.com>
 <aD8b7Q8Z9sC8meGU@dwarf.suse.cz>
 <d7cbbab2-8fe0-4a10-8b06-e47da955865e@redhat.com>
 <aD_4bT1AJv7aKhxy@dwarf.suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aD_4bT1AJv7aKhxy@dwarf.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 09:40, Jiri Bohac wrote:
> On Tue, Jun 03, 2025 at 06:25:57PM +0200, David Hildenbrand wrote:
>> On 03.06.25 17:59, Jiri Bohac wrote:
>> I'd phrase it more like "Pages residing in CMA areas can usually not get
>> long-term pinned, so long-term pinning is typically not a concern. BUGs in
>> the kernel might still lead to long-term pinning of such pages if everything
>> goes wrong."
> 
> ...
> 
>>> If you want, I have no problem changing this to:
>>> +	mdelay(cma_dma_timeout_sec * 1000);
>>
>> Probably good enough. Or just hard-code 10s and call it a day. :)
> 
> Thanks for your comments, David. This would be the v5 of this
> patch:
> 
> Subject: [PATCH v5 4/5] kdump: wait for DMA to finish when using CMA
> 
> When re-using the CMA area for kdump there is a risk of pending DMA
> into pinned user pages in the CMA area.
> 
> Pages residing in CMA areas can usually not get long-term pinned and
> are instead migrated away from the CMA area, so long-term pinning is
> typically not a concern. (BUGs in the kernel might still lead to
> long-term pinning of such pages if everything goes wrong.)
> 
> Pages pinned without FOLL_LONGTERM remain in the CMA and may possibly
> be the source or destination of a pending DMA transfer.
> 
> Although there is no clear specification how long a page may be pinned
> without FOLL_LONGTERM, pinning without the flag shows an intent of the
> caller to only use the memory for short-lived DMA transfers, not a transfer
> initiated by a device asynchronously at a random time in the future.
> 
> Add a delay of CMA_DMA_TIMEOUT_SEC seconds before starting the kdump
> kernel, giving such short-lived DMA transfers time to finish before
> the CMA memory is re-used by the kdump kernel.
> 
> Set CMA_DMA_TIMEOUT_SEC to 10 seconds - chosen arbitrarily as both
> a huge margin for a DMA transfer, yet not increasing the kdump time
> too significantly.
> 
> Signed-off-by: Jiri Bohac <jbohac@suse.cz>
> 
> ---
> Changes since v4:
> - reworded the paragraph about long-term pinning
> - simplified crash_cma_clear_pending_dma()
> 
> ---
> Changes since v3:
> - renamed CMA_DMA_TIMEOUT_SEC to CMA_DMA_TIMEOUT_MSEC, change delay to 10 seconds
> - introduce a cma_dma_timeout_sec initialized to CMA_DMA_TIMEOUT_SEC
>    to make the timeout trivially tunable if needed in the future
> 
> ---
>   include/linux/crash_core.h |  3 +++
>   kernel/crash_core.c        | 15 +++++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index 44305336314e..805a07042c96 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -56,6 +56,9 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>   /* Alignment required for elf header segment */
>   #define ELF_CORE_HEADER_ALIGN   4096
>   
> +/* Default value for cma_dma_timeout_sec */
> +#define CMA_DMA_TIMEOUT_SEC 10
> +
>   extern int crash_exclude_mem_range(struct crash_mem *mem,
>   				   unsigned long long mstart,
>   				   unsigned long long mend);
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 335b8425dd4b..540fd75a4a0d 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -21,6 +21,7 @@
>   #include <linux/reboot.h>
>   #include <linux/btf.h>
>   #include <linux/objtool.h>
> +#include <linux/delay.h>
>   
>   #include <asm/page.h>
>   #include <asm/sections.h>
> @@ -33,6 +34,11 @@
>   /* Per cpu memory for storing cpu states in case of system crash. */
>   note_buf_t __percpu *crash_notes;
>   
> +/* time to wait for possible DMA to finish before starting the kdump kernel
> + * when a CMA reservation is used
> + */
> +unsigned int cma_dma_timeout_sec = CMA_DMA_TIMEOUT_SEC;

Likely no need for that variable?

mdelay(CMA_DMA_TIMEOUT_SEC * 1000);

Then, move the doc over to CMA_DMA_TIMEOUT_SEC

... or rather just move the "#define CMA_DMA_TIMEOUT_SEC 10" over here


With that

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

