Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9286F1FBE9B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841758; cv=none; b=gkLadIuKZfBlAud1q6Q1XxsSjXDYP9ugS49ISQSkb/+Hj9moqKhlJ9Eoypt5B6faGnYyKFgY588MJgpDAgxZBvgNw6WPXLldyz7mwG6yel9M8VNI7npRzXUOrCyTjfJo489m3STEYH9bWXIfHaxVFyFNtds5UBsWPCafuted+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841758; c=relaxed/simple;
	bh=tf35KtTzA5mss8fmiNEjVbGmUAJ95Y55dIVbi+StKhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPoNtwjIwxuWXhXJq4ucZed10Keb+hsVwoAJXn5FAEr6KED/wmyeVvWCVkwqRyFH22bJRcoeeGt5Z1WhHuNCyZ46xbLHe1lkiJFGRYtoD8krVq0qhO6sTwFgy/+2/cbBjktoSAY6wZNr9CNgl6RVDGiGvY2upzTUBq0544obddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IlfpN3Te; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IlfpN3Te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750841755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NintfTGRzXfaHVuSILiqulIMZ5CqmzdFP+2lgyyhAjk=;
	b=IlfpN3TeZxXZdWyme0IjPLmG7MJZu4ap+tslUT52bW0tVcbe0cOzr7HEJGQOoZApGNlLZM
	KpHh/ncfutDKPVnP5aPnREPxZimKVSo7KoZdmH5ALvy1dhE9vmVXKE6LOUZXwyIaEIqizN
	hP4THMPBXwQRWDIqk+3/bTenDZ4Ul0w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-IkZkAkHGNam7ijEaDYPvMA-1; Wed, 25 Jun 2025 04:55:53 -0400
X-MC-Unique: IkZkAkHGNam7ijEaDYPvMA-1
X-Mimecast-MFC-AGG-ID: IkZkAkHGNam7ijEaDYPvMA_1750841753
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4535ee06160so44345035e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841753; x=1751446553;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NintfTGRzXfaHVuSILiqulIMZ5CqmzdFP+2lgyyhAjk=;
        b=N8+cczfXTDH+S49PhkaKK+s0oceZHSEgHMkwcMdnIwauq5A7pm+7gBMgrnDA6bw7BG
         Lb7ajEXeEp0Zp/X+qpgvM6PIOhpCwx0c7+j/AgtH4Cx9Wc+xGgaBG1Y49FkgZkO66Tu9
         dbT/17Ybto8I1e+tn1w+kfJ38Z22g6rIQba7b2uBC5NCoQEmHRxmohfepwTgJ+PIuqbP
         +IVAg06lL3q5qCfh7D7CcKvpIq5Q/RBpAkHp8EEXEbhfY/ZhUImTCfF/T0kn3GTbe92A
         KDpPtKkZ9rXQpsp5L7lPS9vf0oTWnvIXRraa1tp4poPLzgF5PRoUkBvTjnoH7gC6zRmo
         ju/A==
X-Gm-Message-State: AOJu0Yyd6QpYpGJ8tNwRGZnCXDjde1u7W/O341zUVVhPwyrniDOYO0Rh
	KIKHmi9lgPb7nTo4hw6uxUBWud3UGMBS+l9XKcXA6ISROjh45735p0h+Vhlf2H4qDHg3AePgDro
	+TrtPeYnom8gjQjBHIm5/+hwDOKbg1Ykh7D9LkbY8MpBQp5LwNwA6E/3jIKt7GEjlow==
X-Gm-Gg: ASbGncuaHSpgP2VaV7BqsPYiQ9oQNLxXPNL+xv1+BvN4qXYzKjkus9Y+rNmIusHI3gx
	QskWHUbkkCCJ9g309V+cWX8MhoVM+LAawgyFUZ5Q60N5YSq2+rxlZEPy51FbyUPQydPPpLF4hrF
	AYbbUT9ERuB9gPKeXen6d1W+itExiF+z0eX9RNdI0KqAt3Rul/+3uSzdHyy5jxl4Vu9eC+X4Urm
	1C1CGdbrWpz4F2AnlYzzd0zWoxqkY9qQ8hknn3pHWbwWctUXCzG9/FONGn9YT17UbjogIASCwUL
	NH2ZtQDAECWD4DEMPKEv3FNmGTMyJSgB7Yut0MMMjan7nzGVL9AsBKAp5TKS5r445fdqxLzFy5X
	x9aggGw1M7j5+Bz1xJeMJGM6CR5dW/bXiMrHbG9mRT78d
X-Received: by 2002:a05:600c:8283:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-45381a9cb93mr19105675e9.6.1750841752678;
        Wed, 25 Jun 2025 01:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn9Ma24frP1Xh9SKWBbPl9V+zUB9RWKKedqyriMy2JgojdvqahW4a1Ef0ehUqtLxBkknO9Uw==
X-Received: by 2002:a05:600c:8283:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-45381a9cb93mr19105395e9.6.1750841752253;
        Wed, 25 Jun 2025 01:55:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051001sm3982593f8f.1.2025.06.25.01.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 01:55:51 -0700 (PDT)
Message-ID: <dc34a5ad-376f-4509-91c1-e220f88f97e8@redhat.com>
Date: Wed, 25 Jun 2025 10:55:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/14] mm: vm_normal_page*() + CoW PFNMAP improvements
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, nvdimm@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Alistair Popple
 <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250617154345.2494405-1-david@redhat.com>
 <06a2d665-0f1b-4e7f-9747-b4c782395dc0@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <06a2d665-0f1b-4e7f-9747-b4c782395dc0@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 10:49, Lorenzo Stoakes wrote:
> David, are you planning a v2 of this soon? If so I'll hold off review until
> then, if not I can get stuck in when I have time?

There will probably be a v1 called "mm: vm_normal_page*()" where I drop 
the problematic bit, and respin the problematic bit as a new RFC once I 
have a better understanding.

So, no need to review right now.

-- 
Cheers,

David / dhildenb

