Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880027AC45
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769725; cv=none; b=e1CiMF8H1nSrMV6VS3jWhapHPTcgoPqYle0SwbMsltB2VHl46O4BTBtadUAEMTdkZpnod0GLHCTDClcqp5H6Lw4KBB5k9g643z6anBVnSVkvpb5ub5ax/CaDvc/QoCM1bCJZD2RC4+mE3B8Xz/1yXd96TZhfgwbCHMRfN/226Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769725; c=relaxed/simple;
	bh=3agW45/orkxK4TWq6pZ9P6YJQuzYqnefcIdgkf60dXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hj6Ji965VGTP3GE4sbCFUe/L3GR4vuGsnjOF1L776mShe3DlaHg0CC81MLd4ws4CMH9Hq//mJ/GSORzNwg4eYhbdlNEghLtf+nTEPQfwkKmnliAqoTe/YCexn1o6MjplC0A1gc9iO8pDrLDLTVJXamsh4yyuja/Y6ybAmyqM2lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EI++tI+B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EI++tI+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750769723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=clpzns1bthf3rKA1DeKUctJa7cobMWM9337ool6Tph0=;
	b=EI++tI+BVLm7H0HD+/A4WWBPesYpiwkAFPa9S9g56n5pUAz6FWCfTvYrb0QawTwbx3BQUa
	R7FTGoLHJ9cE7Iy2iSW5P+5iyUo8iSDJEV7tv6Ca3Uu5WEt4pMZO2Z1rZc+nqOnuxc6gkn
	/xFlOu9WOxMrobgoujEiDesm7zQwq14=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-6kYyZpilPtW8xlOBt_7-bQ-1; Tue, 24 Jun 2025 08:55:21 -0400
X-MC-Unique: 6kYyZpilPtW8xlOBt_7-bQ-1
X-Mimecast-MFC-AGG-ID: 6kYyZpilPtW8xlOBt_7-bQ_1750769720
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579058758so2292986f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769720; x=1751374520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=clpzns1bthf3rKA1DeKUctJa7cobMWM9337ool6Tph0=;
        b=k0bt7C7/7WqYrtpAr/t9fpkkL3yfS8O80+34O+9mdFVmK2vuWtmqqoYeA1fRGqVE+h
         vtc4bZT+9Z8PJJlcjvfkxGJEg2NtpInbFDhJ6PjZa0uz0j1zuOo0f1fyJt+QkTIuQana
         3+hth0BZy3kA44nlYRk/PgRS9BBTQzTnvHCmM9C5MhlRDl+a0O1pFSFEmnlTQQdWUP9t
         lNpTf3nZzT5PRfHJe3lfQ0B0wDbbsSb9x4xTOLjkFEMSdVDQV62YNUUpJBpSD0Gv64r2
         XPsu49kfHGoPy4WhQ7qPjF85RoaFlC3L16JZZSeLgw8iKIARejJUlx+63XXjMCAILPc8
         5S5g==
X-Forwarded-Encrypted: i=1; AJvYcCUS7lnkmj+PPw+Fmnsmp/YqwlrfiPJl+MarMSB+t6tB+BWXa78U+BteNLGJUvuzz+DLGe2H1FXp8GB3u/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZ8RKCkADCjnEpvxOnxRVipLc22AsT6B1j9hpVJQ2TWx7TjjC
	l3Bd8UmRljDFltYm9jDdj5adqHrsQcledruFW/8mfh7CHtXA0u5SB4q9VuqTPgzdHjJkBhWGR3a
	BktllhGhm5193QPV8EGPA07U2OPcSWFE/XPWeUUTaNPjuZQ6Kwisq89Km6Y0tSvd4WQ==
X-Gm-Gg: ASbGncupxi5czMKbzCiKjAnfDyxGdTFkLt15tHVPUUmF79c48llkDwwzzmO9SS5KV5h
	5xOnMHCgYmw7JpeFSiXr+vxWCugQ9jOo/4c0jeQNP8f9vu0qZeZc/OnKG/5IvRxsxE/Vsh4ffPg
	TBc3BNXqgss4ngQhuuCr4IQByj+Kpp3Ile1ozhvnSwoNwbAIlyQIrK51EWb2RjjTbm1saze2+0a
	ohYA4EydAncUAnqWpGyp3n/Kg5eKvBQwHQ6Yf86xcltIYDGmQV0imNN6LoSqetMuRJzgN5lDLDR
	r/gvBIPSOLOMUzM4fWsqjdXqxU2t2YVIxK1uESKy5BaaQnHP+sGZo8k=
X-Received: by 2002:a05:6000:1a8f:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a6d12d53e2mr13305409f8f.31.1750769720073;
        Tue, 24 Jun 2025 05:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh4THL5emWc0HD1tw3nsNZYj1VEaMpjz22Eur+XQ2rV2HeBYN4VCIAezpif1T43Wtj7fZ/Bg==
X-Received: by 2002:a05:6000:1a8f:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a6d12d53e2mr13305369f8f.31.1750769719620;
        Tue, 24 Jun 2025 05:55:19 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ac4asm173506505e9.3.2025.06.24.05.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:55:19 -0700 (PDT)
Message-ID: <a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com>
Date: Tue, 24 Jun 2025 14:55:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250214093015.51024-1-21cnbao@gmail.com>
 <20250214093015.51024-4-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250214093015.51024-4-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.02.25 10:30, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> Currently, the PTEs and rmap of a large folio are removed one at a time.
> This is not only slow but also causes the large folio to be unnecessarily
> added to deferred_split, which can lead to races between the
> deferred_split shrinker callback and memory reclamation. This patch
> releases all PTEs and rmap entries in a batch.
> Currently, it only handles lazyfree large folios.
> 
> The below microbench tries to reclaim 128MB lazyfree large folios
> whose sizes are 64KiB:
> 
>   #include <stdio.h>
>   #include <sys/mman.h>
>   #include <string.h>
>   #include <time.h>
> 
>   #define SIZE 128*1024*1024  // 128 MB
> 
>   unsigned long read_split_deferred()
>   {
>   	FILE *file = fopen("/sys/kernel/mm/transparent_hugepage"
> 			"/hugepages-64kB/stats/split_deferred", "r");
>   	if (!file) {
>   		perror("Error opening file");
>   		return 0;
>   	}
> 
>   	unsigned long value;
>   	if (fscanf(file, "%lu", &value) != 1) {
>   		perror("Error reading value");
>   		fclose(file);
>   		return 0;
>   	}
> 
>   	fclose(file);
>   	return value;
>   }
> 
>   int main(int argc, char *argv[])
>   {
>   	while(1) {
>   		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
>   				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 
>   		memset((void *)p, 1, SIZE);
> 
>   		madvise((void *)p, SIZE, MADV_FREE);
> 
>   		clock_t start_time = clock();
>   		unsigned long start_split = read_split_deferred();
>   		madvise((void *)p, SIZE, MADV_PAGEOUT);
>   		clock_t end_time = clock();
>   		unsigned long end_split = read_split_deferred();
> 
>   		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
>   		printf("Time taken by reclamation: %f seconds, split_deferred: %ld\n",
>   			elapsed_time, end_split - start_split);
> 
>   		munmap((void *)p, SIZE);
>   	}
>   	return 0;
>   }
> 
> w/o patch:
> ~ # ./a.out
> Time taken by reclamation: 0.177418 seconds, split_deferred: 2048
> Time taken by reclamation: 0.178348 seconds, split_deferred: 2048
> Time taken by reclamation: 0.174525 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171620 seconds, split_deferred: 2048
> Time taken by reclamation: 0.172241 seconds, split_deferred: 2048
> Time taken by reclamation: 0.174003 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171058 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171993 seconds, split_deferred: 2048
> Time taken by reclamation: 0.169829 seconds, split_deferred: 2048
> Time taken by reclamation: 0.172895 seconds, split_deferred: 2048
> Time taken by reclamation: 0.176063 seconds, split_deferred: 2048
> Time taken by reclamation: 0.172568 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171185 seconds, split_deferred: 2048
> Time taken by reclamation: 0.170632 seconds, split_deferred: 2048
> Time taken by reclamation: 0.170208 seconds, split_deferred: 2048
> Time taken by reclamation: 0.174192 seconds, split_deferred: 2048
> ...
> 
> w/ patch:
> ~ # ./a.out
> Time taken by reclamation: 0.074231 seconds, split_deferred: 0
> Time taken by reclamation: 0.071026 seconds, split_deferred: 0
> Time taken by reclamation: 0.072029 seconds, split_deferred: 0
> Time taken by reclamation: 0.071873 seconds, split_deferred: 0
> Time taken by reclamation: 0.073573 seconds, split_deferred: 0
> Time taken by reclamation: 0.071906 seconds, split_deferred: 0
> Time taken by reclamation: 0.073604 seconds, split_deferred: 0
> Time taken by reclamation: 0.075903 seconds, split_deferred: 0
> Time taken by reclamation: 0.073191 seconds, split_deferred: 0
> Time taken by reclamation: 0.071228 seconds, split_deferred: 0
> Time taken by reclamation: 0.071391 seconds, split_deferred: 0
> Time taken by reclamation: 0.071468 seconds, split_deferred: 0
> Time taken by reclamation: 0.071896 seconds, split_deferred: 0
> Time taken by reclamation: 0.072508 seconds, split_deferred: 0
> Time taken by reclamation: 0.071884 seconds, split_deferred: 0
> Time taken by reclamation: 0.072433 seconds, split_deferred: 0
> Time taken by reclamation: 0.071939 seconds, split_deferred: 0
> ...
> 
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   mm/rmap.c | 72 ++++++++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 50 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 89e51a7a9509..8786704bd466 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>   #endif
>   }
>   
> +/* We support batch unmapping of PTEs for lazyfree large folios */
> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> +			struct folio *folio, pte_t *ptep)
> +{
> +	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	int max_nr = folio_nr_pages(folio);

Let's assume we have the first page of a folio mapped at the last page 
table entry in our page table.

What prevents folio_pte_batch() from reading outside the page table?


-- 
Cheers,

David / dhildenb

