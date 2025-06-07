Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0453B2A0
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749320230; cv=none; b=KKPoW8KiuG9qT0l7sgOJHqUB+ZUSPdgudYjNy4F50R1sy/DCLgMuxhnXZWr4VKPx1wnwz+BlfIiISK3M6OIRitHqDNXbx1Rxryi5vGBo7s058RZz7AxU4baO72ZeO7/2Po9rxvY2c8veX1Ei6wbatn/BJzgC0rE5fKSd3gqQhBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749320230; c=relaxed/simple;
	bh=YqZZguyaQZnHAF6KrLbVEz7cRXJTVlsD5fx5dH4me3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgrZcDFDt7mhcRkM4LHWeHpDfpDcSfEsLVFsRgO6DaHwPBcPQv1Ld3Efj3GnpH9qS9l5dr81d6VORWjeVRbkSouCnNM5fEqOFJAYNgWtED1/TFAJhRrTsmrvc3n2KJkHDsjYY8uM+ibGkIRZlFvpz5l0e8UC96OdGsF3M7V2MfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRPXAB34; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRPXAB34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749320227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v2CwoiOcZ5Lm7ZChShu0UdyCOIaiIaGNbqSuftFNKIc=;
	b=GRPXAB34djN13d/bgSBC3qRDV4SvDOQV8R5LpKd/yiIlq+DY3kDxz0IFLiwYD1TJZjnw4g
	sYqlopkwvgGIyRA2guWZE6qyFetKp5NKbBR3D6A8Jhueo9I1+C0F+ehCNhaQyagFErprFy
	L+aTduv/vdXZOhK5Oa05WYANDLQgeJs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-ykS8eJyFMbyxlKRQ2Ceq0A-1; Sat, 07 Jun 2025 14:17:06 -0400
X-MC-Unique: ykS8eJyFMbyxlKRQ2Ceq0A-1
X-Mimecast-MFC-AGG-ID: ykS8eJyFMbyxlKRQ2Ceq0A_1749320225
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso2307238f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 11:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749320225; x=1749925025;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v2CwoiOcZ5Lm7ZChShu0UdyCOIaiIaGNbqSuftFNKIc=;
        b=nv7bCAyvZndijkFBOCqwsPW4qe/Lnr0EsS1HOA7jxBoB9v13YMi9/GFR0WdRmsOUfR
         WEPJicNSYbPcB+GybY2NVBvtvZkEV+t5fF3CZF2xCsn6flRJhx4pU/XNGjNzbMTANVi3
         0Ty7W0b3b7LxrxEebOUxkLUtdrw50m8K8ZtpWAh/U8gzcJ06dLHc2YYtmZO5Vnsgq5n3
         1TqqD+DtLDS9KKOGvachbJyxv7fyXrLleov1sWkAu0dS1XrG03B1zq9Zn79Co6ncLb5D
         IoCl2VQGi/httqOtR1iywkvngv6bfd1UBgGo5LjFg4iYCchI/u2AJescq8P2EJYaHHf0
         3vvw==
X-Gm-Message-State: AOJu0YzPvgWNmf4WDbI+J4snl4JrKJH3kxMqzFOOQIQIQumJ1I7K9PT0
	qfUXr6tH/E0ujtKsmjPJBISl2z8k1MDDAowEb6xKOa+ai/wo8nltyZ1iPsnSaF1C80NuQQ8y7r0
	BBOwUKC3aLy0chuSkQ3mdljKI18JDq76d/+Xn+3Wg7MqozZMxitax6B119qn8xK9R0A==
X-Gm-Gg: ASbGncvjIwh5GMAtLSfgldS2wNtjLb+sNyDIiIUcCOJQocOYYc4td3+ZmWRNt96FQGw
	eZWQJ4PH3OJiyopr1woGepWT7O74vv+UcbhXJ21woq5YJLaiBGedSqpE9o008C57pGOEcuRDK0S
	hmjd3jE7a22AfkjUNfiW55A3UJILRCpPJfiee9AYYB26PLkJg8AYIo8zn7d6oDHg+cSsPwYLi3F
	+Eumf8YK4ieg+dna/grmMDsoUWYQykqJJdqGS/1FvVuqh/FD2sY1iZ57GfIrH4P++CFl9KAxomq
	UREMfulfwUM0MUnVnckIdXtBvPHXF7lCjz71qudJ/amcTDbXGBn5Zq12uOMlKCGsLjDYFfYWGgy
	muPJNQ86lqeuH5qf/P5UYT+Fw4IdiDgR5AbLbfZRxJ/Rg
X-Received: by 2002:a05:6000:2411:b0:3a5:2e59:833a with SMTP id ffacd0b85a97d-3a5319b173emr6412397f8f.1.1749320224873;
        Sat, 07 Jun 2025 11:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4Pkfa8eynAY3tDB8x72AOlK0O1TnmMmYBTx1UHVpYpetN22WOwBXdABTxLCISotP2ZkVMqA==
X-Received: by 2002:a05:6000:2411:b0:3a5:2e59:833a with SMTP id ffacd0b85a97d-3a5319b173emr6412384f8f.1.1749320224465;
        Sat, 07 Jun 2025 11:17:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:9f00:3bce:123:c78a:cc8? (p200300d82f4d9f003bce0123c78a0cc8.dip0.t-ipconnect.de. [2003:d8:2f4d:9f00:3bce:123:c78a:cc8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b653dsm5207399f8f.39.2025.06.07.11.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 11:17:03 -0700 (PDT)
Message-ID: <ebaa1561-eb42-43f6-ba33-e59982f6b359@redhat.com>
Date: Sat, 7 Jun 2025 20:17:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/proc/task_mmu: add VM_SHADOW_STACK for arm64 when
 support GCS
To: wangfushuai <wangfushuai@baidu.com>, akpm@linux-foundation.org,
 andrii@kernel.org, osalvador@suse.de, Liam.Howlett@Oracle.com,
 christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20250607131525.76746-1-wangfushuai@baidu.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250607131525.76746-1-wangfushuai@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.06.25 15:15, wangfushuai wrote:
> The recent commit adding VM_SHADOW_STACK for arm64 GCS did not update
> the /proc/[pid]/smaps display logic to show the "ss" flag for GCS pages.
> This patch adds the necessary condition to display "ss" flag.
> 
> Fixes: ae80e1629aea ("mm: Define VM_SHADOW_STACK for arm64 when we support GCS")
> Signed-off-by: wangfushuai <wangfushuai@baidu.com>
> ---
>   fs/proc/task_mmu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 27972c0749e7..2c2ee893a797 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -994,6 +994,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>   #ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
>   		[ilog2(VM_SHADOW_STACK)] = "ss",
>   #endif
> +#if defined(CONFIG_ARM64_GCS)
> +		[ilog2(VM_SHADOW_STACK)] = "ss",
> +#endif

Which makes me wonder why we don't select 
CONFIG_ARCH_HAS_USER_SHADOW_STACK for CONFIG_ARM64_GCS?

>   #if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
>   		[ilog2(VM_DROPPABLE)] = "dp",
>   #endif


-- 
Cheers,

David / dhildenb

