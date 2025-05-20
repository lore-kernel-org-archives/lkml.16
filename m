Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3072417C4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747269; cv=none; b=dhsmgnWqApWAjd0ezSSkmsQYusjWuNKooyOiQByfi09YLEONIeXisiu3etesuxB1mXOp5LUMZuWaDlSogHInA28UTV8zJ76ADoIwnwqrcQNe8FkEuZcAfMLbVLiF/VnnMfsEvAexjEaJ0O/6kwJfjdNDoy6eJOIqQ+aC1AL+1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747269; c=relaxed/simple;
	bh=tZ89q1hyH2JjqKwjwdPzReEjZrd0vkRLvP3zpzRUMLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlLABxmGTfKmjsfy2D5QlE3uhQVAa8koWtssOjtsEI2l7GEN/ajN0/1Cl9qYAx5vmbDfupCjY/DHipZRL5Q5rqoLoqMvV4woUghQcegnYVR+H8yRXNAiqKzSllhK5814FXyQNhJI8T6J78G0A1V0oSK6zHHmDEuePIJrU99WC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dt0C0Unv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dt0C0Unv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747747264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RN9uNh6DydeOOpuk3bsI/XTuQJvk7n29I0gbS5xlhoE=;
	b=dt0C0UnvDo1gp6v3m/atCR2YcP+lO0hur6bCGKauRRjXQ4fjfhTmAVgoLFph+QIkKHe3yN
	7BmuM3Ml7q6K/oQ6BFJx2DxGaMHkGWNc4xEZ93Q0FQzXyKEURo9xZwX/lnyFUsIZ3xvmsv
	ZbmW9oTjKxUSfAyPngJyebd4vUcXnBQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-Fy5LxXuhMOSaaKi6hXfDbA-1; Tue, 20 May 2025 09:21:02 -0400
X-MC-Unique: Fy5LxXuhMOSaaKi6hXfDbA-1
X-Mimecast-MFC-AGG-ID: Fy5LxXuhMOSaaKi6hXfDbA_1747747261
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso12593655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747260; x=1748352060;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RN9uNh6DydeOOpuk3bsI/XTuQJvk7n29I0gbS5xlhoE=;
        b=Xlpbfh8I56b7vt4udjn8VKdRIfAuv7qsYa34jb2aP9aGIScYvC3nKYg7VdoX5gRCXZ
         KbzBdjUAnQYgzjaDtM3q6NbabUX71srySjdR/1s/wlqQcNNSoPqxKAqVZPoyNGyc/fH/
         Fw/ian051au3hIDZQs8J3eHEIGMy36bubNq5vZusxuJ2W2ksRjeS6Sq7KrovLZHIlVIC
         wA5TxVCYsXxEZ9f28eBDAw8Dgpno2Da3VjTj4+gZz+syEchhgQOuoD8iy7MIuQg3Ida4
         +6fxOVdPATvI5IIbUCyc6aWegaeHpoJEK/dpMnsqiAy57Zk4RNXqVf0dwBKdCfY1cpWz
         Lb5w==
X-Forwarded-Encrypted: i=1; AJvYcCWGiGUwmxqeDkYIPGDWEtlk2uLvnb+v+lkDvpbhgm0ns/KFRM0mwEiUnZm5v3rvFgbf8pAPLsrUyfcYqvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeFa5X13b9g4iT7eF8AhJkUWVcP9jLhs96g74y5+WjAeHNvPmh
	cTwUkHoReT+1EM7QYTWxdnmG+GaY3n6RBrVxrc+3Xhujlzm8w/O1LDdnUE8LhCBT1TSuyqd0/xO
	HWbubd13CH4NZzxGgEsvVg7abWzB/mTQbyoJQ+P1pMvrD2zvSzaSajS4Ta2I7WZ3Bug==
X-Gm-Gg: ASbGncuKpXTCqS+TUY3nFnny7V2ri+g/xgCffjP964a0sP6AruYvlo8HWRDAWZp2r6S
	xoL7ZX+ECtOhVsAYo5/d4sshEC4Twrs73nk7TPHL8ZX+UDkUF5vKJSXV733aSDZfXCN4b33WU9q
	7NDblvYB9knWQb1Prffh35B3hvozsihOpJjyYqtAgtrP3PVGnsBXxzsfucAoa9DEDNwFElYEYOK
	fyOyLdRJUa1e3AQ6UV8Crv5QHmgJjMowAnnqZzqWUYEb5ysKfmbPaYKrrRLR9EycnxM13Xd16J7
	Wqw9vwWEogQIKWqKLPhbKv0uF7lbIoupGPmgrG2qkVApXXgok2imEt6A02Gs3DzJSYlxk61xWnx
	aTcIh69Bj9AJNPj4dI6INR+H5P33Ob60a3KqEzSc=
X-Received: by 2002:a05:600c:8288:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-442fd6103b3mr152456745e9.8.1747747260654;
        Tue, 20 May 2025 06:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbQXhoEOSdVjXS4Hex1ZHQa+mX91nrwonlh96b4EMvrYs1MlxxxPE5QXlr505V48r3jiwQjg==
X-Received: by 2002:a05:600c:8288:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-442fd6103b3mr152456475e9.8.1747747260329;
        Tue, 20 May 2025 06:21:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f182538fsm32253115e9.7.2025.05.20.06.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:20:59 -0700 (PDT)
Message-ID: <f090ac45-6758-483b-b289-d6aaabf2dc98@redhat.com>
Date: Tue, 20 May 2025 15:20:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
 <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
 <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
 <43ab8a08-b577-4e6d-8920-1761ffbc01fc@redhat.com>
 <EDDFDB5C-2C2E-49E8-95CA-A1663C33EA7A@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <EDDFDB5C-2C2E-49E8-95CA-A1663C33EA7A@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> if a page gets freed while the pageblock is isolated, it cannot get added to the list of an owner easily.
> 
> Right. In theory, it is possible, since when a MIGRATED_ISOLATE page is freed,
> __free_one_page() can find its buddy and add the freed page to its buddy's
> buddy_list without performing a merge like current code. But it needs a new
> code path in __add_to_free_list(), since it is not added to the head nor the
> tail of a free list.

But what if the whole pageblock gets freed in a single shot (IOW, there 
is no buddy to lookup the list for?).

-- 
Cheers,

David / dhildenb

