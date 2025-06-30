Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0E28B7C8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751313581; cv=none; b=fr6dK/F1n4bMrrPB4EX8v+OhxClLdWmdpbQCpjWEUnreAjPwLPnK02ak0xHXMEOuyDwJgsX9yDDwBAZG9xAZDWjxWJFfYzlxE67xEay532V3i2xI7ismlB0C38EcnprKJkw0bvQfO+TdCdZ4WRtHp2NX7TjEjButBogIcLm5uD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751313581; c=relaxed/simple;
	bh=bEyFQdROXjvQGTSACHDcdffQHMnpw3tqIfURRH6j37Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5yGjHNlolafLzP36vRGwDoPBMPwsVuy2c3tvEBVGEGNUfAK/c0IyHepqmkkFs+N2xfFrQYw5EESHUd/JoC9Vm8GkMFKnDJ5pdN+6UjLlHJmreqrnqcNj9AyKSlChwUP0YLQdrKslClI4scCwcnU3LgjbF6+ePY65O4uw9IndCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cj2ajvX/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cj2ajvX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751313577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HdrBjyR4v5jVUYn1vKqc34BfB7r5dg0swuUmPBgV3KI=;
	b=cj2ajvX/KtEg32xD7Ffr0Wtr9c1tooa4o+kO+2t0plpEp/HNVpLMWW2xAxCWDX7LAg2IJG
	BupeA5Af1qKIA9dyKUIExn40lqDPrWvw5Czp3h1NgYVoi7sn/Jd64JVMUz9BUJblAaAfNz
	ffA9MtssL0CUQfZxLdgRbz80pDKyD1M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-jQT8Ii3ENrGIoQ8go1yfVA-1; Mon, 30 Jun 2025 15:59:36 -0400
X-MC-Unique: jQT8Ii3ENrGIoQ8go1yfVA-1
X-Mimecast-MFC-AGG-ID: jQT8Ii3ENrGIoQ8go1yfVA_1751313575
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so24069565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751313575; x=1751918375;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HdrBjyR4v5jVUYn1vKqc34BfB7r5dg0swuUmPBgV3KI=;
        b=BHn3mGM8iuVUvOOX4GRmRNP7F/LGbZAUIvjO5XdWf0xzOKIxEm/RE5dhE2BXIu0kAX
         EfDbRPRGZBzTj2yzGb8pCDoOU791vhVuA5KcboWsq6cQ5rfehXASi3FltntQk6F+l8vW
         Z3J7OtLqW0oyYn1gplbauaSOYXn6l3NRrLavdJ4CQ1MMCv3OFeTM6QW0hvqKwvvG6mfs
         0yvihiYzSK8CItTXt+vKBIvXa4GjMr2tgngduk5W1O79HUcZaFL42Qz8xEMORNZL72xb
         MawE5uAMQPa6AiV0t9scWXAU3Is/T2UwJ6D4nNoKw5WsIV7FGoCa/aaaCCCH/aKE0BDF
         oShw==
X-Forwarded-Encrypted: i=1; AJvYcCUaFeTiR18p+VKmne/tlG9FHSad+OrFrRRalx4g5/PmuDLGOBeyktyyz/oKTigO+MS72jYR0w7ZniBEwQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xkWXwJA8Q7/WN3gRkxsMRaMYmd6q9+tIXunOfxyuN88Cts/V
	k9hnipf2ME9Ik3txQY1YB2irpjXIlYS6x1cMw3lpCF4AVIwsIfDUrXhMJPuzQ87qchGlDrPaAdK
	+854UbDxR4HHIt++6DzR53uSsNQGthJfd5HJc53NHwCLA5bWuNMbtEx22Ii3LdqJ8Cg==
X-Gm-Gg: ASbGncvXT0DP8d+JJMv3bGhVGpS+T2qQ0D7RVo6DlQGoIZC5ZWb+w8pli6Er3bvhkUy
	lX5b7Cy1qhC3eFhiXcV0o3MdRrMWLcxDONl/nfWDDMZH7wMVM2r4ULunYAHXMYW2ospxbwEfgxw
	2Vd8rl8pKHh1Tg+q6lCCl0jCvL9gBjtNTOFA4nqKRMudRECjatDHUjpdYXNAskzSETv+KcX4fHB
	2rK7SqiGy2SPFmdKg7Nd49+ALcoafkKZb8x9ZfyqCJp83p3TxCMqOepWgAcuNe7EhYazoTJCenJ
	TD5FG+37p9G/sJJR/p7C0cdmYJS1WgzFGyt50Dno0CW6lUt8PpCMNXCE5HXuFPUSL+WSh+kFsLR
	YlWePSJ8kFHu36WMB30FdBjLhCFiEEi0M22WHEUF/9DFh/OZpSQ==
X-Received: by 2002:a05:600c:4f91:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-4538ee62323mr136097455e9.23.1751313575155;
        Mon, 30 Jun 2025 12:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB25voiAoiR44h3/h5Hyv2OovvDqu/+y6RXHR7m45D5JHSU9OHh2vv9oqZJUIAD+vuFLCH6w==
X-Received: by 2002:a05:600c:4f91:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-4538ee62323mr136097265e9.23.1751313574715;
        Mon, 30 Jun 2025 12:59:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad1adsm175294865e9.24.2025.06.30.12.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 12:59:34 -0700 (PDT)
Message-ID: <5e878654-e00e-4782-bb99-b460a93dd6ab@redhat.com>
Date: Mon, 30 Jun 2025 21:59:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/debug_vm_pgtable: Use a swp_entry_t input value for
 swap tests
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 linux-s390 <linux-s390@vger.kernel.org>
References: <20250630164726.930405-1-gerald.schaefer@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630164726.930405-1-gerald.schaefer@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 18:47, Gerald Schaefer wrote:
> The various __pte/pmd_to_swp_entry and __swp_entry_to_pte/pmd helper
> functions are expected to operate on swap PTE/PMD entries, not on
> present and mapped entries.
> 
> Reflect this in the swap tests by using a swp_entry_t as input value,
> and convert it to a swap PTE/PMD for testing, similar to how it is already
> done in pte_swap_exclusive_tests(). Move the swap entry creation from
> there to init_args() and store it in args, so it can also be used in other
> functions.
> 
> The pte/pmd_swap_tests() are also changed to compare entries instead of
> pfn values, again similar to pte_swap_exclusive_tests(). pte/pmd_pfn()
> helpers are also not expected to operate on swap PTE/PMD entries at all.
> 
> Also update documentation, to reflect that the helpers operate on swap
> PTE/PMD entries and not present and mapped entries, and use correct names,
> i.e. __swp_to_pte/pmd_entry -> __swp_entry_to_pte/pmd.
> 
> For consistency, also change pte/pmd_swap_soft_dirty_tests() to use
> args->swp_entry instead of a present and mapped PTE/PMD.
> 
> Link: https://lore.kernel.org/all/20250623184321.927418-1-gerald.schaefer@linux.ibm.com
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

