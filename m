Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2AA2750FA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702444; cv=none; b=q4E9oMQnmmG8EzWM8b64SKZZNFGkO3JhWmfl91OByEZFZZ5T+bVMMpBKXoLelAJsbIjEU/Jcc3rwpYoZvIPjTPDnAVy2BnFrij0/dmC44/fhbfIcVEWzVY0LCAbLlZ4C1yflAK7VbjvBDuWi/iL4VRo83i342M0/HX3EB1pjH6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702444; c=relaxed/simple;
	bh=QGR/qeZajeoXMhjkX+0D+izNA/eyrkACsYcYn2JwLiA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pikT07VJ5QGafyjTQN0YPikZe3BRuwG5b7xvZNspTVtkcPQywJkiiI5NlRv8K1t1jRwGs3e97TZJBnAgtpLRcIaHpT5lx7OHqSa4u7RjQ0cPo5RgmPHIr4FPi6slZ1nmxKXvv4SX4XSWujksV5o7yrzIcPAXvyxlOp9U1YDC2/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J8hbVbp+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J8hbVbp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744702441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xIFMI+T6fnOgB/KjAeO1zTUntTma171i89ubQ9C1AnU=;
	b=J8hbVbp+o0TOp0j+txalb8LWL5JmxudFon5/2LvEAibB1yAkIfN/aWZtz9UjbvlvXYNiE9
	zWrdBCpSn3s+LTDgQ9LBLl196d8czEhEGv988WI2iXgbh1nIIpBa27sWroWC6KeD4keEVw
	nI9PrlXzKFuY8JVTRn1BkYQRbmp+P4E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-p6R96uWrMoOiwjycyAtf5g-1; Tue, 15 Apr 2025 03:32:44 -0400
X-MC-Unique: p6R96uWrMoOiwjycyAtf5g-1
X-Mimecast-MFC-AGG-ID: p6R96uWrMoOiwjycyAtf5g_1744702363
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so24896375e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702363; x=1745307163;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xIFMI+T6fnOgB/KjAeO1zTUntTma171i89ubQ9C1AnU=;
        b=M67rGg8FtUTLNIXx+1sodVjAvrGzmyi4ucSIFi07u5El0aG3lSIDI62LDCrv3+H7QB
         GuEhlcEmTc7U3qSjCHVLH5VcNu/kvJoNwv7E63p+vnC62itmvmzpa0PvldA3uKq0rE2L
         EwIxMx4DfNRDGL4B858LWKpJ4Ez4MmT0YC416zqJZRhhqC6KZ4HjP7xTc4RjosFi9lNG
         3lQntSVaDQ9uMG6f+KWuB9BKudT56gti0t5QZh0oo49NiHMhC/4Z6Mh/BUZegz/wK13e
         b9S0cddJXEZGY7rNeJxcll6D7f2HI6mLAkZ3gK/cYtUtmyxt6p9pOM+HwraRTEq9/Ch8
         LIaA==
X-Forwarded-Encrypted: i=1; AJvYcCViusBo9tx7DQDrnW9SDbjrtGq4cgiidYL/2GaH/1HQjGe1iZeOb811gpO4waICo359XtwYv1JGokEhzJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxonxC8jdJbb/Y800qWhvdDww4Q1yyh2RoIfnfGYUox9Nqf9g4p
	1a+6CaPoRzHX3hQyf2GprpXrb1xyY1MifIkRPg99iWRws9LK/GPQy2cCRb3THg89L8mCLISBlE5
	fhuaalL99g9mUWFc88oEuzvPtC7Gx/rORqU0DWRQO1L3MwNdAV9ZTnswxQCnJig==
X-Gm-Gg: ASbGncslAYqiXWAfrA+V1KzpVoEo3N2i8PN1Ry6AsO1Xw+b4D5QGD1MnTAcnQ30gCSR
	trt168Y1NCs0xkMiJIkp5PSjgbMwoeRuleOPtl9nmHadO3giZg25vXilpvSpEuqIq6LtDGWgYrH
	Qd4LpUUKDtKApm4WZnzzQyEkCAaz/jZ6pvBDi5ROB8kDGPRfz1/hPr7KKPnA7ybzIq4TvtlpfSb
	22e2e8kGk/tv8aVORiHrzVgwGCpfdbjrTG81bCBEEFEQcUfPEE0E5svEvGQ02xNL2alaxEViesF
	g2VnV6tvSbU663qV8iwCWkrq/YqolVHio2sk7u3syfvX3WNiPtPv4Mh88SeqjobhVObdK5d8hSX
	y69E/spWs51ny1DHq+IzTGUKjIQQAYEWVxmc2LA==
X-Received: by 2002:a05:600c:350c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43f3a9b02a8mr149563565e9.31.1744702363138;
        Tue, 15 Apr 2025 00:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+0Jna8p4LwUBoszTjW9MImefyZV7qIEu1DCmZPjAFp0t+FBUX9VUo8PvWSXe5DcaCwQdCEw==
X-Received: by 2002:a05:600c:350c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43f3a9b02a8mr149563315e9.31.1744702362805;
        Tue, 15 Apr 2025 00:32:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c43sm204222495e9.25.2025.04.15.00.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:32:41 -0700 (PDT)
Message-ID: <a2447027-bc5f-461e-8fd8-93704dd543e4@redhat.com>
Date: Tue, 15 Apr 2025 09:32:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before
 restoring vmemmap
From: David Hildenbrand <david@redhat.com>
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
References: <20250415054705.370412-1-osalvador@suse.de>
 <ab6d9bc7-4e6a-4604-9dca-44b13ce409b6@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ab6d9bc7-4e6a-4604-9dca-44b13ce409b6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.04.25 09:23, David Hildenbrand wrote:
> On 15.04.25 07:47, Oscar Salvador wrote:
>> commit 4eeec8c89a0c ("mm: move hugetlb specific things in folio to page[3]")
>> shifted hugetlb specific stuff, and now mapping overlaps _hugetlb_cgroup field.
>>
>> _hugetlb_cgroup is set to NULL when preparing the hugetlb page in
>> init_new_hugetlb_folio().
>> For a better picture, this is page->mapping before and after the comming
>> for the first three tail pages:
>>
>> before:
>> page: fffff51a44358040  0000000000000000
>> page: fffff51a44358080  0000000000000000
>> page: fffff51a443580c0  dead000000000400
>>
>> after:
>> page: fffff1f0042b0040  0000000000000000
>> page: fffff1f0042b0080  fffff1f0042b0090
>> page: fffff1f0042b00c0  0000000000000000
>>
>> Tail#2 has fffff1f0042b0090 because of the _deferred_list initialization,
>> which was also shifted, but that is not a problem.
>>
>> For HVO, upon restoring that gets copied in some tail pages (reset_struct_pages)
>> and so those tail pages will not have TAIL_MAPPING set and the check
>> in free_tail_page_prepare() will fail:
>>
>>    kernel: BUG: Bad page state in process kworker/0:3  pfn:10ac40
>>    kernel: page does not match folio
>>    kernel: page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10ac40
>>    kernel: flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
>>    kernel: raw: 0017ffffc0000000 fffff1f0042b0000 0000000000000000 0000000000000000
>>    kernel: raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
>>    kernel: page dumped because: corrupted mapping in tail page
>>
>> Reset _hugetlb_cgroup to TAIL_MAPPING before restoring so tail pages have the
>> right value.
> 
> Hi,
> 
> To handle that for ordinary hugtlb alloc/free I added in that patch in free_tail_page_prepare():
> 
> 	case 3:
> 		/* the third tail page: hugetlb specifics overlap ->mappings */
> 		if (IS_ENABLED(CONFIG_HUGETLB_PAGE))
> 			break;
> 		fallthrough;
> 	default:
> 		if (page->mapping != TAIL_MAPPING) {
> 			bad_page(page, "corrupted mapping in tail page");
> 			goto out;
> 		}
> 		break;
> 	}
> 
> Now I am confused why that check doesn't catch that?
> 
> Apparently only a problem with HVO? Because I recall testing the ordinary alloc/free.

Ah, reading about the HVO hackery in the comment above NR_RESET_STRUCT_PAGE, might the following fix it?


diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9a99dfa3c4958..27245e86df250 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -238,11 +238,11 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
   * struct page, the special metadata (e.g. page->flags or page->mapping)
   * cannot copy to the tail struct page structs. The invalid value will be
   * checked in the free_tail_page_prepare(). In order to avoid the message
- * of "corrupted mapping in tail page". We need to reset at least 3 (one
- * head struct page struct and two tail struct page structs) struct page
+ * of "corrupted mapping in tail page". We need to reset at least 4 (one
+ * head struct page struct and three tail struct page structs) struct page
   * structs.
   */
-#define NR_RESET_STRUCT_PAGE           3
+#define NR_RESET_STRUCT_PAGE           4
  
  static inline void reset_struct_pages(struct page *start)
  {

-- 
Cheers,

David / dhildenb

