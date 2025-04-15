Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E927586B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701831; cv=none; b=CkNSAdsgJ8sTY2HQSH0Kcft/SRaeqOpYbaPseC7kyIcYJftGxvZWQaCiCBOJlCAgcYoFFSnkpLy5SsZQOi1nd0RHBV/sBB8ffv2/6M5s6L6ZNDKZfAbnrkaczXfMXdUC7AXdoEAXBCjkqJZoqa5Rq77uL3iECVrwjE0ZcMTTtYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701831; c=relaxed/simple;
	bh=8P/TeT2xesSTHKcxplLrBgU6GV3+ZHQvKoN3p0Xv0Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAs4WUdumHVwQQzgmVUFsrSs4hPqjbe/zFEVoSzkG+k8KgwbpkWAolUjN0fEUFT5rBAXYmzHAzuWV2ZTds1MF7QXcCT3n1c/VqeruiKAtDxEG8oDMdgh9lkGAx5lK0oRZKmWQ3t6kbXlHbYPAcxtA3O5Z2Ch78f8OSk/Ood9YyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Po1Odh1l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Po1Odh1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744701827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nykEKAeh4acsKdXeDPuBQHlu5evELl7tZo4cGDJKvLs=;
	b=Po1Odh1lS7wwLXRVI3A/CVGculapIFa7N9yAcm5pvqQqohUwMdelMhQvkvEynKvfcmIeE7
	JxBFMMHBHIVS4jYDY8Pf3TH6XvuAh5NUWYJy1rBM676R8khWO0pi3oFlP4FlmrSVTPtd29
	mELa6IAJHxS7YLSa63qzm8Q/uIZDhCg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-j_MQ2CLNM-GKTw6pFTwUpA-1; Tue, 15 Apr 2025 03:23:46 -0400
X-MC-Unique: j_MQ2CLNM-GKTw6pFTwUpA-1
X-Mimecast-MFC-AGG-ID: j_MQ2CLNM-GKTw6pFTwUpA_1744701825
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so32167465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701825; x=1745306625;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nykEKAeh4acsKdXeDPuBQHlu5evELl7tZo4cGDJKvLs=;
        b=aEGuW3MCAtPqAt3VjJg8Gy3626VLWk58qUhjIvyhIu6pvFTdtSRru0tMzl3pFJmv1+
         uRWqlJMs6ld/qjDkx8OLb/TsH9143/Uw1vR0URrkOcSE8kezitx84pxczyMTaQcDs3HV
         aMWrErTta2w1ghVCWF8M898/Msk+hnc+wDw4NEESRhw8mikBFWBz3owu0UM27sb7FAPv
         l3vR3E0qsnlsW0tk08IAvtP5dCkX/8Ys+vBhc7V26zYXWnJ6hxlOtu3elXT5GlZx0SvT
         uEsYOSCquaiBZ173N7ixIwDy3qyqnK70tFsdaNiB8OgjlCWkeaL1g/sNhF6XXuhsTZDL
         zUtw==
X-Forwarded-Encrypted: i=1; AJvYcCWyEmke0QM2pgIUosMh7LT3njUqJeaMjUbbEP23cHrQoijP3EqZZvsb93B6aOwHu+w+AxZOIgp/yLA2Zr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZX/gbSwGuv96IWFsIhgOQ95LKhKJcmIOGedBxdgPPWXHZbdh6
	r+h6tbKSa1LMmoPEc/NcoJbOXVKZ0PdfY7U58EQDNh2bUsQ/6QVK+nObPRC9be8D45bImB9S2ga
	irnpjuRvoW8ciUrjJLq0ZWYrLO5MRL5/gqwJ59sADGvxA8D+CEUUbMVLbLQFZ4w==
X-Gm-Gg: ASbGnctDJpL1wVrAImmh4jtgEgyt1CDt+SLnu+iHhuOgu6NgrZSD4pyFV3VbpEgB2wi
	enuP2McmkF4zkv+3fuAkch+1pTsY5DNh+1QvR5k1OodK1AWyK0jegQmo03yOIDxqLLMbnMDU/ye
	kPM5VIowFV8ZShvtX1PJAe+VEtfvM0ifwrDmrL5rTRFe5iHdtESwNtK439lTewDfYsdDTa722nv
	U0vHnlfgqAN00gvKh7V4ek2hI9h1YpS89f6MfEBjpakP09SRHb59KSOLDqU/jsHDuv0QXN+cy6S
	EAKuGb+6qH96KZP/mu0H0hDy8N8BLpDCu14bZW40RosygbclBrJHibTrg1IOMIBFGNwtIyxlKZV
	oBm8SZjX0+GeG2ZKPvAbZZu3J0af3+Ig46vaXMg==
X-Received: by 2002:a05:600c:5897:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43f3a9aa683mr86748865e9.20.1744701825122;
        Tue, 15 Apr 2025 00:23:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAZK9ne9BFrFBK9FNh2u572GCWpZNZnHSV61pujmCWL3CNM085fealxx9BR5pYLq2FSGJUJA==
X-Received: by 2002:a05:600c:5897:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43f3a9aa683mr86748695e9.20.1744701824738;
        Tue, 15 Apr 2025 00:23:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d7d8sm206192665e9.4.2025.04.15.00.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:23:44 -0700 (PDT)
Message-ID: <ab6d9bc7-4e6a-4604-9dca-44b13ce409b6@redhat.com>
Date: Tue, 15 Apr 2025 09:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before
 restoring vmemmap
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
References: <20250415054705.370412-1-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250415054705.370412-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.04.25 07:47, Oscar Salvador wrote:
> commit 4eeec8c89a0c ("mm: move hugetlb specific things in folio to page[3]")
> shifted hugetlb specific stuff, and now mapping overlaps _hugetlb_cgroup field.
> 
> _hugetlb_cgroup is set to NULL when preparing the hugetlb page in
> init_new_hugetlb_folio().
> For a better picture, this is page->mapping before and after the comming
> for the first three tail pages:
> 
> before:
> page: fffff51a44358040  0000000000000000
> page: fffff51a44358080  0000000000000000
> page: fffff51a443580c0  dead000000000400
> 
> after:
> page: fffff1f0042b0040  0000000000000000
> page: fffff1f0042b0080  fffff1f0042b0090
> page: fffff1f0042b00c0  0000000000000000
> 
> Tail#2 has fffff1f0042b0090 because of the _deferred_list initialization,
> which was also shifted, but that is not a problem.
> 
> For HVO, upon restoring that gets copied in some tail pages (reset_struct_pages)
> and so those tail pages will not have TAIL_MAPPING set and the check
> in free_tail_page_prepare() will fail:
> 
>   kernel: BUG: Bad page state in process kworker/0:3  pfn:10ac40
>   kernel: page does not match folio
>   kernel: page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10ac40
>   kernel: flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
>   kernel: raw: 0017ffffc0000000 fffff1f0042b0000 0000000000000000 0000000000000000
>   kernel: raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
>   kernel: page dumped because: corrupted mapping in tail page
> 
> Reset _hugetlb_cgroup to TAIL_MAPPING before restoring so tail pages have the
> right value.

Hi,

To handle that for ordinary hugtlb alloc/free I added in that patch in free_tail_page_prepare():

	case 3:
		/* the third tail page: hugetlb specifics overlap ->mappings */
		if (IS_ENABLED(CONFIG_HUGETLB_PAGE))
			break;
		fallthrough;
	default:
		if (page->mapping != TAIL_MAPPING) {
			bad_page(page, "corrupted mapping in tail page");
			goto out;
		}
		break;
	}

Now I am confused why that check doesn't catch that?

Apparently only a problem with HVO? Because I recall testing the ordinary alloc/free.

-- 
Cheers,

David / dhildenb

