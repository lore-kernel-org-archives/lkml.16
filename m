Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292DA309DD6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467986; cv=none; b=HQVTTQBCoBGl3ZOsRW5NLxK5AckFbLL/DzKtuP2kcL+owwGKrVBRTXiDa2cyLuV5A/DZZtd7rnAIr0vp96pgcurZJTPs14xcu1JcP8ZogNubVWD3ZwUYBFAu5wUiEEhpbA9NALTdeY2WLqhWX3QAT8ijxn+GKAMArhjfwFII6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467986; c=relaxed/simple;
	bh=1WpcSP1JHaereL+EgjjueQUUIKUuA5rHNbUpItx789Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQJz08+XDFcw4JfNkbDhqyiEEFElBoJwVWG1niuscm3KpB4W5CVMoq8bzcrJBg55wMYhmRid2K1dGYJY9w2nS5s2s5YdPUwgSzyfVmEF+6ojxxDZXt86jgE6PRr10iq/DtOL7yml5BdVK9tGsWjyhp4Y63l8ahIFKfXKyuEnBFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qp1MZTgQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qp1MZTgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751467980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T5nj6T4+km6XBVJylVpc2FdMnDZamikSe9UfbX+MJzI=;
	b=Qp1MZTgQYS9+vbcqFDpn7puH7zgqfyf8KK1GTPTUhUDJ4xPwb1PnWFqhMebk2vempsN+1L
	XzqDJM9dtUY3H6cwX9N8wdPxqk3nIShsKRl8CfABdYBN1yccZROTcINZcpoGYEjB8RDnLX
	8Z8ry3qa6kLOd7OVmyg2DWge3slU1hg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-R_kO8ffbOPStIRG6gfZiJw-1; Wed, 02 Jul 2025 10:52:58 -0400
X-MC-Unique: R_kO8ffbOPStIRG6gfZiJw-1
X-Mimecast-MFC-AGG-ID: R_kO8ffbOPStIRG6gfZiJw_1751467977
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a503f28b09so3612821f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467977; x=1752072777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T5nj6T4+km6XBVJylVpc2FdMnDZamikSe9UfbX+MJzI=;
        b=Wobmx7Jfwb8h/wpAXGAqYJ+YLy/YQyiAEkCdjCXKuGMPW0hBQc3bWtXFAwGTkvXGq9
         u5Wty6REqy27pf0pY8h915gJPUo12laeOYYpXNWv5FmT3n8ja91UjzqHFwgYV9TbLPT+
         FAPKx9gfhU11Q/YeZqfLFw5iMmTa8godnuz8xW8yVDpva73nuLM+zsPmfya//zzq+a3c
         q7rp7i6BHN4oo8jNW1JLZuTS/DNPJZLk8dbBiacfdwBoQQBYPc2bQqM7bQsv+w+1CcbD
         lb2dlgAVIQmsU0BLe7l1L43TkPsfKQ6Jkvvwhs7sSyPSGjfv4a43QQVBxfpXdCRsXBcE
         wxNw==
X-Gm-Message-State: AOJu0Yyq8nkeIZDl8a0/HGZ7d1kGKeTTjIeUJF70JGhC4V8NSpUX2Pxr
	Ak8RvO+S98aeZuKliCA1EhLedZAXqoSQ8ygaylu1ZbAA4Oykgx/AM5rfAw5wTZ9JUpNaq0nTZ1S
	pZkB8OkpqnTEWbnkIc2IwP2kL+Y3sDl9oscU3pAiflCbYWE26DkiF7RuUx80ORoPPEg==
X-Gm-Gg: ASbGnctvDOMkmes71MCIyLTAtIl7/RgIWTALUk3UdU+H2CqUUGvfrtrFU+jaDGGk5qA
	GiQhmZcf0oXZFPONsrm/gSnn1Qh5wa5vJRBdhiGKLpN3lzupAGbBTTPEEP8m3I/2C/Gjd1Aa3gk
	5t7FUS2lHYHz1SnYVy+GL8kuX+Tkj5T7uGXzZ+2Koisp7PCDs00bCPR8sy1DosBmth8fWjPH+f7
	+OI17CmpdzzYQEeo2u32xWZ5YKF6FJCAWbGtU6KesmMXZQUCf+wmFW/n+CuwijDe0lG+adcwBeI
	aLYqys81p+8HnkhAEJ9TYHqjS8tHdReRr+FvxABIwyckEHBc4HhRgIY=
X-Received: by 2002:a05:6000:2302:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b1f5813ebbmr2700868f8f.5.1751467977303;
        Wed, 02 Jul 2025 07:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6zmp9d2w2MJkn7HSBDnoWuF5cmgkYx/VRxm4DVngK4kJgBtnY9v5ljh4jmUYVqeNL+t+SYg==
X-Received: by 2002:a05:6000:2302:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b1f5813ebbmr2700827f8f.5.1751467976689;
        Wed, 02 Jul 2025 07:52:56 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e76e1sm16577247f8f.16.2025.07.02.07.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:52:56 -0700 (PDT)
Message-ID: <bd162903-6854-4b69-ad4b-89deb8e0d695@redhat.com>
Date: Wed, 2 Jul 2025 16:52:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 27/29] docs/mm: convert from "Non-LRU page migration"
 to "movable_ops page migration"
To: Harry Yoo <harry.yoo@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-28-david@redhat.com> <aGVA2p5mUWoBDVKJ@hyeyoo>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGVA2p5mUWoBDVKJ@hyeyoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 16:23, Harry Yoo wrote:
> On Mon, Jun 30, 2025 at 03:00:08PM +0200, David Hildenbrand wrote:
>> Let's bring the docs up-to-date.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>
>> +movable_ops page migration
>> +==========================
>> +
>> +Selected typed, non-folio pages (e.g., pages inflated in a memory balloon,
>> +zsmalloc pages) can be migrated using the movable_ops migration framework.
>> +
>> +The "struct movable_operations" provide callbacks specific to a page type
>> +for isolating, migrating and un-isolating (putback) these pages.
>> +
>> +Once a page is indicated as having movable_ops, that condition must not
>> +change until the page was freed back to the buddy. This includes not
>> +changing/clearing the page type and not changing/clearing the
>> +PG_movable_ops page flag.
>> +
>> +Arbitrary drivers cannot currently make use of this framework, as it
>> +requires:
>> +
>> +(a) a page type
>> +(b) indicating them as possibly having movable_ops in page_has_movable_ops()
>> +    based on the page type
> 
>> +(c) returning the movable_ops from page_has_movable_ops() based on the page
>> +    type
> 
> I think you meant page_movable_ops()?

Very right, thanks!

-- 
Cheers,

David / dhildenb

