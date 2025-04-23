Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F0152F88
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435814; cv=none; b=kfbLb35KUX5vDfEb1xmJEzzsOUAEbyk4eBQa+wLhmq9otgACFGAR7Dw/dE9FT4hMMP3aVtR8sYybMxJeIz1kLChP2zO5MkO23dLrRDYAT7UwFgB/3KU8bR+giI8zef/qg0ysdgC+DfVNzTIvat2eo4IZQCqpvBz1Xe/BoqYZUT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435814; c=relaxed/simple;
	bh=usPULwU7RtXrwZvNWHMYFDQdYBlOam/a2ijXgwdgRjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFcBZ+HAadFr65IF0aTDR6wEsaHs7se4lRLxAY8e/aaOdCIvf/15GQj4Wu5Di1yp3fMYQnpq4zbKZbsUSlMJ3Eo5lEgx88uzuOcnxEmPZMluSPobXMdTFU8kM+tQaJJzZtPamkljfEBfbs6UIyHPoc71ix/U25VLmmyJLaS2HKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=baCFS5kK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="baCFS5kK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745435812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7zIUNWNp26moq7KsheJCfprvsR7MnxIB3N9LdHnr7/0=;
	b=baCFS5kKlnvT6mQcpDszU9LEqzAzql2PmjvfDTWBEyIzPS1tc+6uuwuL1snDFYunRt06h8
	BF5o6IO4ElfqvLTjHbZEdlYHHAuKxki8TDnI6IFN/meOYQBF9WdWYZtCf68vNz7uGpv1E+
	NyyARnurnRbEfvkT1ePSaUsA0IcKCNs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-NyvYO7-YPRSFaa90jNYVqA-1; Wed, 23 Apr 2025 15:16:50 -0400
X-MC-Unique: NyvYO7-YPRSFaa90jNYVqA-1
X-Mimecast-MFC-AGG-ID: NyvYO7-YPRSFaa90jNYVqA_1745435809
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912e4e2033so66290f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435809; x=1746040609;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7zIUNWNp26moq7KsheJCfprvsR7MnxIB3N9LdHnr7/0=;
        b=ed1PvtsF17N4WL5dwanQvsIigDStZKf60y88t2F9EDTMApLq0hW2vAY3nTOpskGuQG
         ajlo7FzY+E8uh32zzP09w3J+NNfo5Fi4Mbx19jz6rcLnG2dUFYCOrRswEYoTxMWilMmy
         buR6+AcyLc7cIAkwjzOAgQjGGa/wyfE2bDSpFosekQ1oV//XNUOClQLcfIFlmIttY2Iv
         KGnfZI4QINbv2ONcwvq/v3oWNx2HgG/KlDB3RNyjEX/8XoWQqApjIfnZsrYVQ27vI4RO
         vv7ndT6dIIuDzQTsqVnZmx27PWb4dANH0zsH6D6L1m6Aoap1X7WJAG/LyZ0i8F+rwgHc
         E2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIteTHtfszo6oV7yOePkas6w91s1eTjwkSM7AZKg70RHvWBijkXhyWwGn3CpwvxnCSj9cN7DNlfl4B0x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGM0YVGriOuEtOIJPqJ/OFuyMjgtWu1UH3HO8hem64Jtc4ePB
	MvvQiYXeRdIgTG3LzbtIO8Q75EY/5/xunXH/BPH+EU0VNbsrv831IxkdKfJixRwFFoJe7Y2K0kg
	onH5gTnTX4hIDegh5JbHmrGgkQ4ofG2M9BeOk5z1XFKpCvYs4kts5Ewv7y5xJLA==
X-Gm-Gg: ASbGncsgnL93r4C/6ohpOy90hA0gp+Tx3na0tRRy17rbhYi8prCAMzcaOYY77+uUjie
	4hkBtenJCenWvTwDC5w8xQr6/WwUfZQ19DCZVFadArAil6bj11XCCAlyLRSXRlIa01j7YjZDnan
	LntVB1n14R3FD38LGoRlk1d5lHLpw3MitKjESlsxewnAtq+j9PYwSEnr/LRRKPzvPs8XRa+rOXM
	OW9q49Wj/Oe92/n42K5RPScggkI4UfR56iHPMbj9rKayEuPhb4XaEbCgvgiq8+c1GusBP5Lie94
	BEY3GUhe3Dqi0U3FEgqXHszsGmDf2WD1O2ihCmNDzjVlcOiPuurJajpNSlt3a4YLXwUYb/lsLbZ
	16rty9o2CdFDYNUIb53ZarcfxTVF6JZ0vSlGZs9s=
X-Received: by 2002:a5d:5f4c:0:b0:39e:f89b:85d3 with SMTP id ffacd0b85a97d-39efb9538afmr18034911f8f.0.1745435809384;
        Wed, 23 Apr 2025 12:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX7EfCQdzWKRNhZulEfBZnXBZvgTH/2QsdkN0/YbThfSXG0B99xSu5FCNt7O8i8os3Kvlq/w==
X-Received: by 2002:a5d:5f4c:0:b0:39e:f89b:85d3 with SMTP id ffacd0b85a97d-39efb9538afmr18034891f8f.0.1745435808999;
        Wed, 23 Apr 2025 12:16:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:2c00:d977:12ba:dad2:a87f? (p200300cbc7402c00d97712badad2a87f.dip0.t-ipconnect.de. [2003:cb:c740:2c00:d977:12ba:dad2:a87f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4930f1sm19927871f8f.61.2025.04.23.12.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 12:16:48 -0700 (PDT)
Message-ID: <c203836f-5a3c-4143-a898-1fb2bbbfda2c@redhat.com>
Date: Wed, 23 Apr 2025 21:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
To: Matthew Wilcox <willy@infradead.org>, Fan Ni <nifan.cxl@gmail.com>
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
 dave@stgolabs.net, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
 <Z_XmUrbxKtYmzmJ6@casper.infradead.org> <aALVZdStnPQ-d9PA@debian>
 <aAk2dCTru-C595oY@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aAk2dCTru-C595oY@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 20:50, Matthew Wilcox wrote:
> On Fri, Apr 18, 2025 at 03:42:45PM -0700, Fan Ni wrote:
>>>>   	result = install_pmd
>>>> -			? set_huge_pmd(vma, haddr, pmd, &folio->page)
>>>> +			? set_huge_pmd(vma, haddr, pmd, folio_page(folio, 0))
>>>>   			: SCAN_SUCCEED;
>>>
>>> I feel that set_huge_pmd() should take a folio.
>> There is a patch on the mailing list for it,
>> https://lore.kernel.org/linux-mm/20240817095122.2460977-5-wangkefeng.wang@huawei.com/
>>
>> If the above patch is needed, do_set_pmd() should be converted to use folio.
> 
> Maybe?  I think we'll eventually want to support folios larger than PMD
> size.  So I don't want to pass in a folio here unless we can calculate the
> precise PMD-size chunk we want to map from this folio given the
> information available in vmf.  I know that today the implementation
> does this:
> 
>          if (folio_order(folio) != HPAGE_PMD_ORDER)
>                  return ret;
>          page = &folio->page;
> 
> but eventually we should do better than that.  And I don't want to
> lose the information about which page in the folio we really want
> to map.  So have a think about what the right interface should be
> (passing in a page?  folio + offset-in-number-of-pages?  Something
> involving the PFN?)
> 
> The obvious hurdle is folio_add_file_rmap_pmd() which today takes both a
> folio and a page.

The interface is prepared for that use case: I decided to pass in folio 
+ page to allow for folios that span multiple PMDs. (obviously, the 
internal implementation does not allow for that)

We could later change it to folio + offset, but should do so for all 
rmap functions consistently.

-- 
Cheers,

David / dhildenb

