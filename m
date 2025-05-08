Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFC12397A4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694803; cv=none; b=q8qDUzsW62Vf2R5CNAhiMUFs6TfKeWEfTZqerHhBrsg2+0DonrTlQ4OJ7NtFByTYfgxMrSmoIzcDz9LnyRomY8MJtw+carpdeQaNw3ACL6La3fggXZ8Hz6ozoZXELQ4QnVdfJuqIC48YU2yqIuwTdHzr6KNEojuLccGq9XNCNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694803; c=relaxed/simple;
	bh=ndQF1JUtQPfbpS9NlJ5rMEcSRWoZDITUT4WBSrSdAsA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=osaVleRkj7kduRRy0bJCjE1mkXA20gcb5iup89YBbYjqMENIbHdBUj/jDwQa+mr0MqmhER1ikf+uN5ZlPZlI0wOPby0QiV+xCNq7W8mP8GBfjZiF22XWWk9u0IrPq60DhDGIcGvurB7c6oXCqbJk7rGptRTy5uFVpDa4Y68RLRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EzWm8jbo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EzWm8jbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746694800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOQcTqANU1leNfWALhEgYRCRqcO0Qjjft1AKNAg4mjA=;
	b=EzWm8jboQKZQDT7mmVEnXsbRfW7FVq8eEOuRHQ9pQiJTGgJai9FehzUcj1KhbyNpsCwtIT
	fuAeTwlkvHgUBmjaKMzYB6O4i8h+An0xUqF4l+TRDRWcBvgYO/vWfxExpNmb4X/IxVdPRH
	8FUMy06RZmLOLBqK/5JEFLemzTaicZo=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-Owr-70HUMBykHm_1GiUlPQ-1; Thu, 08 May 2025 04:59:59 -0400
X-MC-Unique: Owr-70HUMBykHm_1GiUlPQ-1
X-Mimecast-MFC-AGG-ID: Owr-70HUMBykHm_1GiUlPQ_1746694798
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b20027d9ac0so156332a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694798; x=1747299598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOQcTqANU1leNfWALhEgYRCRqcO0Qjjft1AKNAg4mjA=;
        b=CALITGqy2OJowIfdRCiR36MH6V58TLifuGZDM4eAWQUV3xoVv0ldUGxiZpEzVQp22V
         OJQUBPFdj4QiWYAQRZ6O+HqNrEZsdQ5qhRTjfxf1lThxVSAe9dsHpiFlAuu/f/ZCyNz5
         E5HH6lRZYU2M8iO6Mr6Fqn+qawr/qO8LqpYiW9SsRPHjX/SrzEDObJnuk+rHNawAUaRv
         g9FxOQ6QkErcDWDi7YiZkT9gLa7uOTYuUra0rc5wBssus5Skk0VySn13ABqIknfNmOL8
         vYX42sgIp/5iCAzpF1IgqW9r5SbMU5QXXOAzgGi+EtQS3QseVEPUYINCGEi3KcImjvKK
         51aA==
X-Forwarded-Encrypted: i=1; AJvYcCWfdVByvofWdu51GxYL1AjY5sOM/l2OggDjHyWO9OuOQiL8Lj8VQ+g2Crctg2/R52dGGNpyCf78AkhcfsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGB4zQsRbkRb43IpG6Lf+2uo7kbe5Dc0GXCNcDzHd1T/EZpbZK
	rcLI3B8nppnctbP8Bo6QW6MQue6V+9P38eX7gz+0flp4NKRofCg+d8JRvTXT3BQT0srhqJQlvDV
	kM/+7cuTp7szC53D/dYnB2V3uSiCzY1/8wrgITbsiWiX3WOf0uD/m5TaIXSRuhA==
X-Gm-Gg: ASbGnctfcZfnFvh92zMMW51BzCUgpN4z3ewiTr+5zKb5pV/jVxbETcyG3VGsqJxUyxb
	2Aea6qz2LbKniusAvdZV28h/z5iBvM3R9reHUfG3fGHpKADFG1q5ytvYvsFZhZZgjK38/Yokmef
	l6zi96mGsSuoX3ypUGDlwuIZy9dOmBjAjVf1lZRVJXN51/sCIICQb18WFK/6qoMC+UlarRPX6jB
	NtMp9kBvcnF8ahSL3f6QWsc61sn5n5/k+jm5mbafM2soq1guo/2a6KdlnyR3+eKaQMfrnZDmROb
	PDMfOJaPPWlP
X-Received: by 2002:a05:6a21:3a83:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-2148b526dd7mr10023543637.16.1746694798028;
        Thu, 08 May 2025 01:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1EwAUJsR9DPVq6ks/wjHy3vUPtJEluOMLF3EubNvy3Xr+lYJJSx5JADt/lM5REM16u/RwNw==
X-Received: by 2002:a05:6a21:3a83:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-2148b526dd7mr10023516637.16.1746694797754;
        Thu, 08 May 2025 01:59:57 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405906372fsm13173105b3a.148.2025.05.08.01.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:59:57 -0700 (PDT)
Message-ID: <8a05e7da-3640-4e79-b215-c705b879472f@redhat.com>
Date: Thu, 8 May 2025 18:59:50 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Drop sort_memblock_regions()
From: Gavin Shan <gshan@redhat.com>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 qperret@google.com, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shan.gavin@gmail.com
References: <20250311043718.91004-1-gshan@redhat.com>
Content-Language: en-US
In-Reply-To: <20250311043718.91004-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marc/Oliver,

On 3/11/25 2:37 PM, Gavin Shan wrote:
> Drop sort_memblock_regions() and avoid sorting the copied memory
> regions to be ascending order on their base addresses, because the
> source memory regions should have been sorted correctly when they
> are added by memblock_add() or its variants.
> 
> This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
> the hypervisor memblocks"). No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   arch/arm64/kvm/pkvm.c | 19 -------------------
>   1 file changed, 19 deletions(-)
> 

Please let me know if I need to resend after a rebase, or anything I need to
do so that it can be merged? :-)

Thanks,
Gavin

> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 930b677eb9b0..d9c9174f89a1 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -10,7 +10,6 @@
>   #include <asm/kvm_mmu.h>
>   #include <linux/memblock.h>
>   #include <linux/mutex.h>
> -#include <linux/sort.h>
>   
>   #include <asm/kvm_pkvm.h>
>   
> @@ -24,23 +23,6 @@ static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
>   phys_addr_t hyp_mem_base;
>   phys_addr_t hyp_mem_size;
>   
> -static int cmp_hyp_memblock(const void *p1, const void *p2)
> -{
> -	const struct memblock_region *r1 = p1;
> -	const struct memblock_region *r2 = p2;
> -
> -	return r1->base < r2->base ? -1 : (r1->base > r2->base);
> -}
> -
> -static void __init sort_memblock_regions(void)
> -{
> -	sort(hyp_memory,
> -	     *hyp_memblock_nr_ptr,
> -	     sizeof(struct memblock_region),
> -	     cmp_hyp_memblock,
> -	     NULL);
> -}
> -
>   static int __init register_memblock_regions(void)
>   {
>   	struct memblock_region *reg;
> @@ -52,7 +34,6 @@ static int __init register_memblock_regions(void)
>   		hyp_memory[*hyp_memblock_nr_ptr] = *reg;
>   		(*hyp_memblock_nr_ptr)++;
>   	}
> -	sort_memblock_regions();
>   
>   	return 0;
>   }

