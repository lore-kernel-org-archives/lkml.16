Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2FF1EF081
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260077; cv=none; b=QOYsPasfQcY2KqcKw1a3T/SXH7veRAq1kBpcstjDy3Dhf+iXxK3K55f2Sm6XuHXzhdvPMbglfPOQlNmZ40XQYuWdvvkT/9gr5fXhs11gHZNROua8qa4LMIU9544jokVYEFA7UuzBZ5HIqa5pJ4av0gI9R8ru4OWTCX/GjaKt5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260077; c=relaxed/simple;
	bh=Uwj56g+UudL4tlC037hd/re8acBWYOU4vfYbDPyPlKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6huJMsRZpJxih8kfQYNcpuilJRKobfaseiMuEWAhAalDcS3+8HFcvc7rynJc1hdjvxW49AbIACegWoZ5MD1iQBORBGpZuDv1v/+oXi+S4aaCq9GWmM7pUn26uLV3lB+gSAEVs6kfzXkGrcBCY928xr7ISbmSGJ42BZ87+jt8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZmNsQzij; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZmNsQzij"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21fa56e1583so24910135ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739260074; x=1739864874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOxJUR1r6moJ1nFDgHvdggcLKQEb9GI98orRGi6n50c=;
        b=ZmNsQzijVXxtM4XXjf46j8EnqARDXphRKubVUiRKerlJr5iI4CJdfaehDenjeFt9LL
         WSpwQOrl+7TGlIEHG0TL4Q4zVlu5/SRl9hHT8F4AeOAJeOZhic77PjxaJIR740FPukNl
         YymTnzaLd8cOqKlnRxpfz4/tgVlhQrb4tg3JwAiO8x3WqTgach4EpBCGzdYIuSNT9I1u
         cZ/Ugqo8jdMV9Y8ToMGEb6284x/clDyBhF7x9/nb9EkpC1NvZd9mXBbokxtwXwbl7bmb
         zliP3G353FwNvkIZNiWciy3icuqjvhkJhgudUSeXceDwfsoigO9Kdt/XBa7OSXuPb/2q
         0cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739260074; x=1739864874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOxJUR1r6moJ1nFDgHvdggcLKQEb9GI98orRGi6n50c=;
        b=k3QsBVFPfl/keo2Bxv6OEIQb6yk1P6NK4IEjyEvlm2yqKS143i2kfwdP4tEov4hBjW
         nKcDwSniCnC5Dd1wzD/1hMAvWetLh+BSWSho+Q7aUo7HBdwwRySHLSEH5C3//osHQ+vS
         I07gI2KDQnFAy95niZs2dNEB/Wbi8CSFB6jf3sb3uee2pjz1RSBAu4vs+EPLjydb4Jnd
         5eeYOdWtchQDhw91sGFyfUfFuOrm/MITq8Vv4IgWVIZHQzQpBr059GcJKvD4tdPx5Lrv
         gX38vbpO0Bg5uCbTiAUVcwPTSvsDXeGJ6E9fGc2AXn4+vTzXt57cuEOBACHPDHSOhFez
         p0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFM4/8vFf/AoAedsLzsopmj9ZstYUI4CU3bptbloHfOxK2fStclNG8zA13XF9aVLyF+eKVmzyXxO9yE0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNlBeWROxjLiMzgIq/K+WLTF+758TEnS1PmOQI9ly/nhs/Ybra
	sbD+RVhE3aLxwcy0wYZ9WLGA3MPuEQYX1Ni2r+Dv+StGdHFzgHtmpXW1PKYODdM=
X-Gm-Gg: ASbGncu18DYNylBy7u+Zr07iLw0BdVEkAAB3N27yvEnwoSPu0XCTWUSMRlKzccs0qXZ
	PWXYJbl1hOXLqz12TnKQQuLMb+ZIAIH7Mfrjwa41VlalzIHqE+W/lsudggEKXPlSnbI0jMhWQLs
	RmVJWwcU4l/QcxHf2eblEqMaNIVMU+Us1lJl+i8Un4kFLoRSn02J30OEW3EkPkpjl8ngrw+zVf3
	xTAIV9CBUVLw2csO7WeFfFJDjBL8rB8aubH3leNlQA+rEOZgJGdmfffaQZ558r0JeZIGniavZqR
	ZfXbZeqxDDvQqyRKBgcT3DWgCYTx0aIltRokL9TQlQ==
X-Google-Smtp-Source: AGHT+IEoxxPYXOWq1VEr2O9B36RIJecPKfV2ThBHPe9LsevuG0MSxUMQSOIpMfUYtJpsJ2pcKeMrCw==
X-Received: by 2002:a17:902:da86:b0:215:a039:738 with SMTP id d9443c01a7336-21f4e1cbb68mr256165615ad.5.1739260074055;
        Mon, 10 Feb 2025 23:47:54 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653bfb2sm90969865ad.67.2025.02.10.23.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:47:53 -0800 (PST)
Message-ID: <aa09e9c6-bef4-43c7-afe8-7ea300e3219a@bytedance.com>
Date: Tue, 11 Feb 2025 15:47:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/mmu_gather: clean up the stale code comment
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org
References: <20250211034348.39531-1-bhe@redhat.com>
 <20250211034348.39531-2-bhe@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250211034348.39531-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/2/11 11:43, Baoquan He wrote:
> In commit d7f861b9c43a ("mm/mmu_gather: add __tlb_remove_folio_pages()"),
> helper function __tlb_remove_folio_pages_size() was added. And based on
> the helper, wrapper functions __tlb_remove_folio_pages() and
> __tlb_remove_page_size() are created and used by upper level functions.
> 
> So let's update the code comment to reflect the current code about
> tlb_remove_page()/tlb_remove_page_size(), etc.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>   include/asm-generic/tlb.h | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)

Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!

> 
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index 9ae4ca02f29f..5f99b3cf73fc 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -67,22 +67,21 @@
>    *
>    *    See also MMU_GATHER_TABLE_FREE and MMU_GATHER_RCU_TABLE_FREE.
>    *
> - *  - tlb_remove_page() / __tlb_remove_page()
> - *  - tlb_remove_page_size() / __tlb_remove_page_size()
> - *  - __tlb_remove_folio_pages()
> + *  - tlb_remove_page() / tlb_remove_page_size()
> + *  - __tlb_remove_folio_pages() / __tlb_remove_page_size()
> + *  - __tlb_remove_folio_pages_size()
>    *
> - *    __tlb_remove_page_size() is the basic primitive that queues a page for
> - *    freeing. __tlb_remove_page() assumes PAGE_SIZE. Both will return a
> - *    boolean indicating if the queue is (now) full and a call to
> - *    tlb_flush_mmu() is required.
> + *    __tlb_remove_folio_pages_size() is the basic primitive that queues pages
> + *    for freeing. It will return a boolean indicating if the queue is (now)
> + *    full and a call to tlb_flush_mmu() is required.
>    *
>    *    tlb_remove_page() and tlb_remove_page_size() imply the call to
>    *    tlb_flush_mmu() when required and has no return value.
>    *
> - *    __tlb_remove_folio_pages() is similar to __tlb_remove_page(), however,
> - *    instead of removing a single page, remove the given number of consecutive
> - *    pages that are all part of the same (large) folio: just like calling
> - *    __tlb_remove_page() on each page individually.
> + *    __tlb_remove_folio_pages() is similar to __tlb_remove_page_size(),
> + *    however, instead of removing a single page, assume PAGE_SIZE and remove
> + *    the given number of consecutive pages that are all part of the
> + *    same (large) folio.
>    *
>    *  - tlb_change_page_size()
>    *
