Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9B1FC7D2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109204; cv=none; b=MvAr2l//p1jYe2BDJEyeak/jcb9fB0eiZIHHPrcoU5ftdBjXXzxZD65vudygvh6zWwZ+cF65IBC7vThBE5PxW7niugdGURCvXI0Me72N8xrm0rmetH+xjjoqSBx3sqEWPOA5kmzc7kz3me0oMVNk0wXeXR0XSbWpwMQKaoeziEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109204; c=relaxed/simple;
	bh=6pj9JZ3cOV3A2tfuPki7xtzLnqTk+7s2TVdtKwAD0jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lg+lXhLCdWQngZGzp7HbDycFhtHNTk8MFNrb6PHxRgkwJNxCEeKEfqAfJpHkDtXQ8Euuot1gDF3WXhPgOanjcd7fhsqrXbQdm2bFVG4FkYLKG5Hl6pXUzoW+vAVdOJ+EHQ0X1RmPpCuLpnWOrtbbtAsTHiSGdo6rTzDHmbEsgyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRFM+A/E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRFM+A/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749109201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BobdB6YRhYGiH5Wx1OVJ5tEllBMnM/ff9jWE8OFYOLA=;
	b=GRFM+A/EOuqZNBgpnw8C3DN1PcpxhZMcgVtKXasr1tbpBKzIanizVR1KWeWb78sWQQqofm
	jVnVl/4GuKWQO6hL2HX84MDR7NMqeuu/s187WvyE0G3FcGiJg3rfYLmlwDxQ97HTimAuV+
	RxQhl85vCSEhxaxKBKhoJ8vWwiKSawo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-okf17PAENCuQEHk5Bw9MBQ-1; Thu, 05 Jun 2025 03:39:59 -0400
X-MC-Unique: okf17PAENCuQEHk5Bw9MBQ-1
X-Mimecast-MFC-AGG-ID: okf17PAENCuQEHk5Bw9MBQ_1749109198
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4517abcba41so3568785e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109198; x=1749713998;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BobdB6YRhYGiH5Wx1OVJ5tEllBMnM/ff9jWE8OFYOLA=;
        b=skniPk3JegptlshB3q7UGKC+5ZjnKml4ml9q5pt7IVgAdNPdhvuBQyg4BF0COecGI2
         BqCeeBu4arA4KMMZSftfhxmwVcxbr6UrqS1i4GRDwCgyUsDbg+NlBZliij/Ufw58W0Dw
         jq6xD9TSXdDeabJziZ588W/zdofg1VoCNWGsCG4vz3awfQs9znGjO/IxpELYFJZ5nlvg
         VWgf/0ZXykEmkRIoG3e/r8KQWkuOvdaSRR4OpA5foQvCb4PCxeqO8ez/LgDg1nRhRu+g
         uRQBfNgzr19bL8/tyzrjxedEdK5tTXePwQyvs6BqR3Qyzy5vkC6FDr5Dtvm+3fKA/mmo
         1Ppw==
X-Forwarded-Encrypted: i=1; AJvYcCXoX0hxZ2yGOxg7NHMO72nzAJPEGyOoVYviNOJtWITe6usihD7QrMeY64l1v6+JvnV/foQbnuI79LtHDV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDNIg253oraukGpLq8AYKUni+vOxmPMy1DSEBpYZtiej/sKNj
	usKrKqufdvYmfyQCdd9PeaGYYHBTKYUfuUOviNLicJVTskd3e/N+LjlS0NmpvKftVU83+toDCy3
	h37CMBYP8RVSdZ7gOq1tdv7cf5xxw4ShT6ZPF3ts0HBB7xX3pcpw/03ubE5ig9T6Ikw==
X-Gm-Gg: ASbGncvCi4dGvr3mvDp+OWGsjWIW6xrY9YEdpCj5WWXLIVjgDr8hpuVrSBr1MrrCuQs
	UAUj2qn+Uxwe9CRka8aVWzx2xRBj3e0G7ACTfibm1OA5QinNZZ8GUh876emGMdyEQ2pwgjNa0ZW
	x+UbQ8VZtX+sxG45xJa+uFKll9Wh6dWaAszht3/yGbzlQLc+xvJyq1qABAyMBuPnWBMFPCg8ukj
	aC4DnTKO0+Uz4Z1E7LzJfAyf2HGFQD4mIa/cUdORI/YQvuo7aJU3EKTzN+NOyfZfCxLN9JuSTUN
	9v5q0risSs5pOQuY8zVcwF+fnxG7qU/zuLv/pXt2jgvYXyruJdm1JD5JmahcDjxwNR89hqq1T1R
	jLlMm7RtW1lCnlPfB/IvKZLtPnAzo4jFzbDwd
X-Received: by 2002:a05:600c:4ed0:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-451f09be35emr58479685e9.0.1749109197912;
        Thu, 05 Jun 2025 00:39:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMcv+qQYueRrHBBgigbdlnqX3kWAp3xUx/rcy+UcGiHeVGTYUfQFomNvqgzjttLYWhhLoaNA==
X-Received: by 2002:a05:600c:4ed0:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-451f09be35emr58479325e9.0.1749109197540;
        Thu, 05 Jun 2025 00:39:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb2213e6sm8961515e9.33.2025.06.05.00.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:39:57 -0700 (PDT)
Message-ID: <06b3479b-11a0-48fa-8fd7-3a885ef64a6a@redhat.com>
Date: Thu, 5 Jun 2025 09:39:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
 jaewon31.kim@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
 <CGME20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551@epcas2p4.samsung.com>
 <20250605033210.3184521-3-hyesoo.yu@samsung.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605033210.3184521-3-hyesoo.yu@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 05:32, Hyesoo Yu wrote:
> Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> introduced an issue where CMA pages could be pinned by longterm GUP requests.
> This occurs when unpinnable pages are detected but the movable_page_list is empty;
> the commit would return success without retrying, allowing unpinnable
> pages (such as CMA) to become pinned.
> 
> CMA pages may be temporarily off the LRU due to concurrent isolation,
> for example when multiple longterm GUP requests are racing and therefore
> not appear in movable_page_list. Before commit 1aaf8c, the kernel would
> retry migration in such cases, which helped avoid accidental CMA pinning.
> 
> The original intent of the commit was to support longterm GUP on non-LRU
> CMA pages in out-of-tree use cases such as pKVM. However, allowing this
> can lead to broader CMA pinning issues.
> 
> To avoid this, the logic is restored to return -EAGAIN instead of success
> when no folios could be collected but unpinnable pages were found.
> This ensures that migration is retried until success, and avoids
> inadvertently pinning unpinnable pages.
> 

The fix should always come before the cleanup. But Andrew already asked 
for a separate submission, so that will be taken care of.

> Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> ---
>   mm/gup.c | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 68d91b000199..a25c8c894882 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2300,15 +2300,13 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>   		unpin_user_pages(pofs->pages, pofs->nr_entries);
>   }
>   
> -/*
> - * Returns the number of collected folios. Return value is always >= 0.
> - */
> -static void collect_longterm_unpinnable_folios(
> +static bool collect_longterm_unpinnable_folios(
>   		struct list_head *movable_folio_list,
>   		struct pages_or_folios *pofs)
>   {
>   	struct folio *prev_folio = NULL;
>   	bool drain_allow = true;
> +	bool any_unpinnable = false;

bool any_unpinnable = false;
bool drain_allow = true;

(maintain reverse xmas tree)


Apart from that LGTM

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

