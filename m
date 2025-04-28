Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D0B1D618E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824026; cv=none; b=F1K01bRedY2xJEc0lpS83jD3yhFCqQaR7rtb9mdNZvRlKF3Rp0kD3PfQCeWv66fZjMJiJMJqtc/smKY7UKdGWgmTEDPr9jGEh6Y5YubBsvjN4CzqPdi/BTWiS+89GJjnEAlL1tS2u2SjJfE/eFmyZ7stbsJb69NXQHqxDoaooQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824026; c=relaxed/simple;
	bh=lyRsP4eznY/dLm/NwEQqGPRcbJV313C9rXqNd6bRV0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSW/ctBhHnY2tuX4NaFsruQdZwBcUaWe0+xmC1njMhj7okuWRFVMEj+6Zw6HlbjHCgMN7o1kPdqbxkkf3d6EY55lcPRLnQr3rVbv2EpblaK7f4wG2pX6grkzwS04kJz1gPE0Kumj1tIrSDPCBs+IheBCPGXI7f9UEqr55v4H+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uo8qzijE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uo8qzijE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3UHlymsuGJ3Sl8WG5Aq3yhutdRMJDhj2uirfH8/AuPM=;
	b=Uo8qzijEo8gYAZXLGbx45v9vkzAQXIsoGS9lv7NZU7Ouiz7FGHPOhD1+YTk5zjmaYkekue
	L6poCPr1bDAaCwS4+PANAgo9MwoaAfGANKmr08fS80atAZDOaZi2BkMLdvIc4MyqRlCNKT
	SWZV5CSIKXYTop8jit/Cv7mxn4W652k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-ldCkY7rWMVKHBM4s8ciYIA-1; Mon, 28 Apr 2025 03:07:02 -0400
X-MC-Unique: ldCkY7rWMVKHBM4s8ciYIA-1
X-Mimecast-MFC-AGG-ID: ldCkY7rWMVKHBM4s8ciYIA_1745824021
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so29446145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824021; x=1746428821;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3UHlymsuGJ3Sl8WG5Aq3yhutdRMJDhj2uirfH8/AuPM=;
        b=Gb1uffzizWFamDhEglEVtYobz9BoDdCBn9zfkMxXwgyY1yjpQtSgEqcrun/hU8eVGt
         4U5iYFYu+JahcUYQEceA/7qNB+bqXuM/qebQe36deVwlDsmBYo52GiUCNQDWkQY/ce5G
         YfAVgRWudqxHbYyroGaGwph8jPwAwSLmx/iYCXH0L+rjms/6ipa9PeBe/CZnvoKS4fXZ
         ADtEf+126kEny42g+z5JKImL0zSuMHBnt94oiVAQMDWRhhJJDdi/CJ56pc6JMnKq/v5a
         cf3LoJQNMtfOIG1R9u0nWmo2YCKE5Sp2LcNa5cG2rsJWS8pmlXuX98byWxqxR/jPJfx8
         uypg==
X-Forwarded-Encrypted: i=1; AJvYcCX+d2d415PU5x1GB078AfIghym/nlkhzcQcC0Bs4BrI4eF/ReKpMK2ZrcQTqKNr7D4vb91aXotm97mMfws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Aln8J4xjAoqOFRUCs6yGXf3YzpjCO7bZfdpFj+Qrs7itOSrD
	n9gvQXUg+ay49ogEOvqqw4TK1bvkx03hFAaeb0/IZy+YJAnpnOxYed0drqoO5OS1gVbR6snRryw
	GzLnheUaSOmKXHMsT9QeLPsXWSFuyiJitc7/6yd1SHrdEpu0fgpTedmW9lAAKzQ==
X-Gm-Gg: ASbGncv4QNx7Ions7Akidg4NiGV+eBh+ki889ytlCiZAinakisnXIIR4lni5wIBe0kc
	rGmXsj+u3X4Zzx+c0yDn4fe0hmFR8dGHr+NUNb8ompvhKY7uztRoxF5FJlsiA6kOjtbKUzNRBMb
	BuICwB/DPOB02ilbdBQNNJ6pp78qA5SJ3jQH6AssOLZYKZMawPioTptgyn3fbJcL6W7KAYhN+Yt
	jj71rjgDrfcIAaDHWgC/ZdN32p5LtN8R4bJnBV9m8LSs5F7N3WHXwOctKUytj1IWeiOKdGaDZhj
	HuNBdmtRCD5GakWKhIjW5Z49BgtoQUzG5IAzu4Q9PYBJiGfw8rzzVIpOftuW+zd2Was7nghBbc3
	od7AIZGBvXUAPhDA83xpx4B2UWJohVNpojVkZKGU=
X-Received: by 2002:a05:600c:34ca:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-440a66aaf1bmr84021855e9.24.1745824020822;
        Mon, 28 Apr 2025 00:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5vI+QUcSRxc3VofS2FREQCSTlw1QzEVbQsEVMMtzbDu9hLqKcCFkP0GlDjwtwlzDGi/rqKg==
X-Received: by 2002:a05:600c:34ca:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-440a66aaf1bmr84021655e9.24.1745824020445;
        Mon, 28 Apr 2025 00:07:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1ddsm115057995e9.30.2025.04.28.00.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:06:59 -0700 (PDT)
Message-ID: <e3e33130-35ab-499b-b86f-f0c2b3121cf2@redhat.com>
Date: Mon, 28 Apr 2025 09:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mm: Introduce for_each_valid_pfn() and use it from
 reserve_bootmem_region()
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-2-dwmw2@infradead.org>
 <0eae5cc8-5714-44dc-97b4-e1b991c0e918@redhat.com>
 <d828f037583bf1a4380fd02b1156befa11128d89.camel@infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d828f037583bf1a4380fd02b1156befa11128d89.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26.04.25 00:01, David Woodhouse wrote:
> On Thu, 2025-04-24 at 23:11 +0200, David Hildenbrand wrote:
>>
>>> +	unsigned long pfn;
>>>     
>>> -	for (; start_pfn < end_pfn; start_pfn++) {
>>> -		if (pfn_valid(start_pfn)) {
>>> -			struct page *page = pfn_to_page(start_pfn);
>>> +	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
>>
>>                             ^ space should be removed
> 
> 
> I was treating for_each_foobar() like for(), which always *does* have
> the space before the parentheses. But a quick grep shows that that's
> the minority, by at least two orders of magnitude. Fixing it locally;
> thanks.

Yeah, it's frowned upon. Note that checkpatch will properly complain:

WARNING: space prohibited between function name and open parenthesis '('
#70: FILE: mm/mm_init.c:782:
+       for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {


-- 
Cheers,

David / dhildenb

