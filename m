Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E879272E63
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645271; cv=none; b=I2s9e8JWR1uhej4on2kzpECccFjxRH8whj6aFgQFKPByMitxa8q8yw0SyWIjyQXpvn+XJg42vmyqsIrRoBt8iY7dCFPA/EoA5tt5T2hbdmWOHX8G+nh+wtCbeHiyM9h8SLchXtk/AZvwLq26FDzPoN4fU6i9YNXkZuRPUXDoCpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645271; c=relaxed/simple;
	bh=iAyv4qpqKWqOuzNkmMxLvDdk/3KJqLKx044qOXWfZVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c94PbTOTwxhWoCRaxNfxbfIqXEYGsFXX04QW2CjtTU0tQXSk7UVZRLOEMKh3J0qAiSdsSgIDCwDddY7j0EDsWPzWtpQpHaWqSELOI263XcnfbWa2+9xBvYBeBjKXQGIfXqRlTnkJgt/qHNGJOJdJI/6w33bxtBKDjTqD0e/gX0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S863rDJc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S863rDJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749645268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CeP4mQyu/RwYyyIh9i2z9hAz1X4g/i9DF9d0mMlEaXM=;
	b=S863rDJc4jb3LSDQKcYsiYzVfzEJjkNAvxIz243zldAdk/1UW9JS8eYg1RYvrDHCn3hMCP
	5+6Pg32EpmFK9+esqcAssnwlb9az/PZO5LPR/ABKlKAxoPB1UK5El7vPkl2o37mZ+Liy6h
	ZoVB0+BuW1Y4XmOa3a+nKQ7ESRBizHI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-09pWZniGOKuOBd9UNMHPwA-1; Wed, 11 Jun 2025 08:34:27 -0400
X-MC-Unique: 09pWZniGOKuOBd9UNMHPwA-1
X-Mimecast-MFC-AGG-ID: 09pWZniGOKuOBd9UNMHPwA_1749645266
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so920007985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749645266; x=1750250066;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CeP4mQyu/RwYyyIh9i2z9hAz1X4g/i9DF9d0mMlEaXM=;
        b=D5AbAz+IswUdTKf9Z/cyakTvyOxqHWyNXcvzKVOfO9qhs0nLsfGb9Vo1BK7ENQtJIM
         N324dg6d16DDsONIJuUjlggzvrThL/KDdJpjfkdt/0lueztiHWFxkWqdlEjbtLBYDAwi
         SnEibJe4nM9LrzQQ8Z5J670JFA052CdbNa734uM8RQ39a4CPuZlp8RgF/l15F/kAPtiy
         r3zzTtpOWaMd0yNoqdKktD6Ol48mKTIjcfSD2sA4sQ/JTQaSisI+IAaVWjgXGXJuoIhN
         +4QPgds5OxnbnMbAPo5/grNXsTX6iPoXR0npPQkxwfSn4p2uyoyqd0xK0FQR8bxqpP/z
         k5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXly/CUA4K+498SirNOfNcDUA+A0YxP610p8vi7pDEA5SkgKbIowIm2gpZX8i8cJjc6YkL3tv+DECOlwtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YylKqS9uqwdGwLn6duosunSLTj/yIWBprha0HWN1Bmehh06HFSg
	MORwDRZHsRQCSNxLy9DEDRr/iDXmLRQM44mCboWG7k+oqplOjSmujDKd7Z+8nvmPU7+hIwB6Trm
	95Y8PuCf/SWSNIGrd/SolepiaEmI811YsEYAPGkHPWLy5p2ptVY0Y4HIIv7J4vbzmeA==
X-Gm-Gg: ASbGncuU4jjt2DDTTJ9R7FwcKOS/c+EkzLTmwKBXIxGY0f+GMLLN9g8gs1Cl8edYtA0
	YDvt186gi1walb5Obpzxh2IDccEcgWZMmLbcXNi+99acjRAmFvMbcJWFwTqSop9K58FC6Sh+kMa
	z3QsiyB8ypvzbHZUCveT0jTgluLmVCJkxfXjE1IL+/y+DMMfY4jhH8cykolpuNssSFdvzrBHnZu
	FVWpuWvr6eNTlOi/XUgmldzDOTGGNUfooOaHiGM1gIMagdv8PSNOKtoe87I2cWj9ZLBYIBTl1QL
	SHN8wf7OoXSTv9DnMZyvWkN7+CmMBfhgbvo4aXk2mCmQ
X-Received: by 2002:a05:620a:294a:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d3a89d9c17mr484257485a.50.1749645265742;
        Wed, 11 Jun 2025 05:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAwzDboK/QnSv2d0esNXrw0qSuQbL8/45IXsgrBCmd4uKV+4TDuSnq++1f1FeKwz6ZXMg8Wg==
X-Received: by 2002:a05:620a:294a:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d3a89d9c17mr484253585a.50.1749645265351;
        Wed, 11 Jun 2025 05:34:25 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a608c45sm856080485a.59.2025.06.11.05.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:34:24 -0700 (PDT)
Message-ID: <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
Date: Wed, 11 Jun 2025 14:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.06.25 10:00, Baolin Wang wrote:
> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
> means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
> will still attempt to collapse into a Anon THP. This violates the rule we have
> agreed upon: never means never.
> 
> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> 
> To address this issue, should check whether the Anon THP configuration is disabled
> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is set.
> 
> In summary, the current strategy is:
> 
> 1. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == false
> (global THP settings are not enabled), it means mTHP of that orders are prohibited
> from being used, then madvise_collapse() is forbidden for that orders.
> 
> 2. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == true
> (global THP settings are enabled), and inherit & orders == 0, it means mTHP of that
> orders are still prohibited from being used, thus madvise_collapse() is not allowed
> for that orders.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   include/linux/huge_mm.h | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..199ddc9f04a1 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>   				       unsigned long orders)
>   {
>   	/* Optimization to check if required orders are enabled early. */
> -	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -		unsigned long mask = READ_ONCE(huge_anon_orders_always);
> +	if (vma_is_anonymous(vma)) {
> +		unsigned long always = READ_ONCE(huge_anon_orders_always);
> +		unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +		unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +		unsigned long mask = always | madvise;
> +
> +		/*
> +		 * If the system-wide THP/mTHP sysfs settings are disabled,
> +		 * then we should never allow hugepages.
 > +		 */> +		if (!(mask & orders) && !(hugepage_global_enabled() && 
(inherit & orders)))
> +			return 0;

I'm still trying to digest that. Isn't there a way for us to work with 
the orders,
essentially masking off all orders that are forbidden globally. Similar 
to below, if !orders, then return 0?
/* Orders disabled directly. */
orders &= ~TODO;
/* Orders disabled by inheriting from the global toggle. */
if (!hugepage_global_enabled())
	orders &= ~READ_ONCE(huge_anon_orders_inherit);

TODO is probably a -1ULL and then clearing always/madvise/inherit. Could 
add a simple helper for that

huge_anon_orders_never

-- 
Cheers,

David / dhildenb

