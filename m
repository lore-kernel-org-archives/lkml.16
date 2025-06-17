Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10EE2E06FF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162104; cv=none; b=FAZ/sZZm9KSsm3YDxUo2fPX+F1qeSfhIseK8M+isUvaA8Wz0WsOYTpMGkB0teMNMKIHpUdLOMSFxFSgwB+poxKSW0wEgBybCF+VhK6H57uquwtFjV1T0IKDOUd6iVRlePJxGLFNoi4+NDHTTAU9zbtbo/NE2kvB1rOVh+dZcS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162104; c=relaxed/simple;
	bh=LLAHgdluLm5x5YBmK+qiWUwc8tIucU1SrEPB0E/Hj7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDMkVdzVgKjuMjr2dFQ7C1SSx/k8yJjGYxX5sewqPH0bkUqq23R3Xn7+fEX4gvUrWXXr2ElAmsO2NIANiCnrNxgfM3wXpw92MsXbyAkjTY4HZeq8Ei6QtH9AZ7uU4W1CFwqZBwN/txX2AyK25UlONSiZo4XyRNoSAXMU/mlZzwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b1+GmFHM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b1+GmFHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750162101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D0qajvAD1m1Xwz4yku3nLH9nqsxwn7lwGgZg7DJwBao=;
	b=b1+GmFHMMNWFyfqnQgsEkQP8qoV56litpZJE3DWZJjZrcyuT+jh9rjO80t+ViQTtJJrzap
	lhpw08Np1KPqvO+uth4iglOLtZPQIG5EEo+U8ZQld4x3P6g9gvgMT/MGzSRpUHOFVTe5aF
	SA7A1AmvD+eeXaECG19+HfpLoP6Zb4Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-SM52ewtcO0asKa4ZQSAYWA-1; Tue, 17 Jun 2025 08:08:19 -0400
X-MC-Unique: SM52ewtcO0asKa4ZQSAYWA-1
X-Mimecast-MFC-AGG-ID: SM52ewtcO0asKa4ZQSAYWA_1750162098
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45334219311so21383755e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162098; x=1750766898;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D0qajvAD1m1Xwz4yku3nLH9nqsxwn7lwGgZg7DJwBao=;
        b=NOdQMSspKR8n7Ug4Qzb9RXwlRkYay7+aGIBOVJl8FJFP6KXGRv8Z0XzlFoBVQm/EVK
         nrQooEb3kE4XOw4FPSAoZ4sK2J0h5pCFXMXb5a05kflMQRQ9aB6Apd2k0uG/ieCRNqXO
         dxjjZWWPqaziPIfTdLHev3B70Y5thTvMRMCMUSpLQuTdnRSOcPwTPbcO0CnHXEjB4bjo
         sxPyRo2P5ri3JWT4CjIRnC+7cnUhuQueNs+twSkqc3QIi6dmriNNT+buO1C+r9oXemJw
         q4UoMNC9sKH+LICqEwDRGLgyF6G6T+jtuMLS0c97HP4tVhSkIEjrhJMz7SKiDBaJcdRK
         WEhA==
X-Forwarded-Encrypted: i=1; AJvYcCX2eLrf/u5yAVs/x6M70ElgiocAM4SsKev0eQXlAErOwrQAHH0hL7RZEimR1B9Myzh2Wr8ng2Yz1anL1UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/Mpc4bl6k6GmPzUwR/gDRzQu9BoA0wy2q4Lwr+FEE14iod9R
	kJTJriniq5njySRo0T3hYbflWLOig9fr6zHXue8ti396ClQbfZwnQKqRaOEf2OTY85H2Od9x+dT
	KASkOeLibRlI8aD0entsao1XlQwmk0tWIAvcfOg85vOZJ22K69UH1TD24GdOlwn6gBg==
X-Gm-Gg: ASbGncv55wLBGzfRLf/IIOTKFJT+s2qraX/WXIHnGpHEvrLI1U56ExNKNeTqRYnH+IX
	rihO0pRTO9VsW32ebQ69DICHkmmE7NAcrlnF8d23chD4fNC1s8pp7uZDOoKFYU2G2we9Rl6qtBb
	sry0o6iC9DiB610eZq4WEmwyB4LtcDf51TY31bH9tHvU8figVC6Mt6R8egg0oe2N4nqh+vWaJSu
	h91z2iK6mcOl646fcVa6FXPTsd0pnoR4aehGGcPMYKFHRgOBPaOiZJ+hV27g3Zb+5LxG8rcXBiI
	KFGZ4/++1el27Kutx5stvo+91m0TWUv/BJXsedpnif31knpbESoMKUx55js2xUjqqzJ6b7GnngR
	TK/HDHuxnZ76PcKpFEKg9TE6EYsNoT4ckOlTlXlHgQslWZCQ=
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr116396825e9.29.1750162097981;
        Tue, 17 Jun 2025 05:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcjZMoZVqyhUU85/xMfAEISP0sV5ePTiVGQbzZHlrbLCanK+p4gIMfAB3aca+TCNqUCo+rRw==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr116396495e9.29.1750162097582;
        Tue, 17 Jun 2025 05:08:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60d0fsm13622090f8f.22.2025.06.17.05.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 05:08:17 -0700 (PDT)
Message-ID: <3eb8e1e2-5887-47ed-addc-3be664dd7053@redhat.com>
Date: Tue, 17 Jun 2025 14:08:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, James Houghton <jthoughton@google.com>,
 Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
 <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
 <aFFZtD4zN_qINo9P@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFFZtD4zN_qINo9P@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 14:04, Oscar Salvador wrote:
> On Tue, Jun 17, 2025 at 01:27:18PM +0200, David Hildenbrand wrote:
>>>    @@ -6198,6 +6198,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
>>>     	 * in scenarios that used to work. As a side effect, there can still
>>>     	 * be leaks between processes, for example, with FOLL_GET users.
>>>     	 */
>>>    +	if (folio_test_anon(old_folio))
>>>    +		folio_lock(old_folio);
>>
>> If holding the PTL, this would not work. You'd have to unlock PTL, lock
>> folio, retake PTL, check pte_same.
> 
> Why so?
> 
> hugetlb_no_page() has already checked pte_same under PTL, then mapped the page
> and called hugetlb_wp().
> 
>   hugetlb_no_page
>    vmf->ptl = huge_pte_lock()
>    pte_same
>    set_huge_pte_at
>    hugetlb_wp
> 
> and in hugetlb_wp() we're still holding the PTL.
> Why do we have to release PTL in order to lock the folio?
> This folio can't have been unmapped because we're holding PTL, right?
> And it can't have been truncaed for the same reason.
> 
> It's because some lock-order issue?

folio lock is a sleeping lock, PTL is a spinlock. :)

-- 
Cheers,

David / dhildenb

