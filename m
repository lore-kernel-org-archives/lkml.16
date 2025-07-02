Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E094E26CE18
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457705; cv=none; b=SxpMIG/rx7iFhOKEdZYhoinWR4CwRrnfR15vmQ8mhN13EqAy+CIyMwGR2DgCdB7uQlXIpCR/n19Df7ClfCYYpqprMylL10MQyQjxb051ixnotQR97j0jPeV+6ibGK3FJmFKg89sTmQNuT373svPuixj/J5JTvMb8Rb1WGnv/eDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457705; c=relaxed/simple;
	bh=8Tuk80UZ36wXGTawuYmmkFn5al1BUfxolANcxk7UW1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9SJESm7iftDfIOOKQRs5aOPma027oJ/X2DDYwNeATJ1jE9DT6jFl0R3IRVnXaO4zzTGb1E0G6tMYBdE/CY3tbENrcMipHnonAP8wNJuZJZD0Bp3/BaNJ5+ncAhq18c1clypSCuSyaSGx0U87RS/N7hrM1PBdpjGfIEqoIlZkwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TmDc/umt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TmDc/umt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751457702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hbO26a8k63GS6w5haaq5bzL3sXJUv+0ecjPsgxsM3dc=;
	b=TmDc/umt+YSY08hUJsNtfGliljlHGAEOH+4VpfyBWS1KSH80oaXc2EzWNBRVoZq6lThMg3
	eocfVs+p0ysPCojwD3IYrORGrGRt/E/3SfyJWmnuqEUNselpiQxGp+aVbT8znOg8YD0242
	xJ3huV2+TuaP3Tm2eRo2wx+ZQExLZf0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-HhuqVnsPN5uVqHg7lJ4ewQ-1; Wed, 02 Jul 2025 08:01:40 -0400
X-MC-Unique: HhuqVnsPN5uVqHg7lJ4ewQ-1
X-Mimecast-MFC-AGG-ID: HhuqVnsPN5uVqHg7lJ4ewQ_1751457700
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a578958000so1743604f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457699; x=1752062499;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hbO26a8k63GS6w5haaq5bzL3sXJUv+0ecjPsgxsM3dc=;
        b=hIIRo5UkPAL61fOhTTeVYzKXnkBujwA2Q+3t2oBaOT/Bf3oqMyP8IJxKoG8e3GvuUl
         BPdZ14PpHAf6LY23kOGtp+cqSkx4MEtBLegE12v24Qpit7yVrC6mqsVoLiUh49up8YRP
         40FsMUtSb2XHIT2yf+g/tgYbexDEucDtT7UQ4Z4o1n0iYPOD+YtkaSPD4q9bg5DSJP1X
         Dmqk3GYKsSFQvWdg7Lf2My5LIAd2F3EMF5StNMGAKvoup0oYh/JsDVs0IPasdt6/g7r7
         cgaZ7A5Kku5zNTVkUFXUYUDWtEeQKaMUM2h+0VSe2Uk/aP6yGA6Z6wsJeCUyxLDJstg4
         V0qQ==
X-Gm-Message-State: AOJu0YwbH8HpMt4jt532g//TtHpiO3awBOTjZQno+SiEdsZWum2qIDds
	Y3FLncgNegO/14+WlUUDArDhskCcFgkjCLC/v4yA5rLcRa35t2qNGkKK6JPabBLaKN0DcMwTefn
	25DN+w7ybQKFZE3vRcMzfG/2DPwfpP9cfgzMWt7VRHHI1T+l/zFUmA5oOPZ90W9wsbA==
X-Gm-Gg: ASbGncupUdnLiDF+ZsXQadNH13qItKh2VdpHpfHleswxNU2bx7AiD+BgmBvt12K0jNc
	PBjyx0QL4m8psMEohbMZVq5qUB012WyT+FBrKa3t54MrA6lmTdITJGhtK4IvTO/WKU/s2xZ30Kx
	o7mSnPn/nOpixX3pKcWyxp/WYKjVmEvctPvV2kRcmQS77qWH6nlrdiDr1J2C0e8RhlXsmJj02HC
	yGmJVfMhJQemS8aBo2LwuMIVERIxtVOwRrMwP/CHlL8TaC/I+3rqtxIvWBmXbpLyUJvRVVYLgZ7
	+63enYAyIAKdSGQ6D3N93j4ajkn00zHbZMxLitS4d/iYdoG2rBq59RM=
X-Received: by 2002:a05:6000:144d:b0:3a6:d967:380e with SMTP id ffacd0b85a97d-3b1ff24427emr2184915f8f.3.1751457699183;
        Wed, 02 Jul 2025 05:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOIin31+Uuq9MXmWhu9WBlm6bN7FqxwwrGmyZTVwpVwvMd+yDtoM668iOg5XT1zVyyBI6yww==
X-Received: by 2002:a05:6000:144d:b0:3a6:d967:380e with SMTP id ffacd0b85a97d-3b1ff24427emr2184804f8f.3.1751457698446;
        Wed, 02 Jul 2025 05:01:38 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm209797225e9.21.2025.07.02.05.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:01:37 -0700 (PDT)
Message-ID: <a533ae7e-f993-4673-bb00-ec9d10c11c83@redhat.com>
Date: Wed, 2 Jul 2025 14:01:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/29] mm: convert "movable" flag in page->mapping to a
 page flag
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
 <20250630130011.330477-21-david@redhat.com> <aGUd34v-4S7eXojo@hyeyoo>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGUd34v-4S7eXojo@hyeyoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 13:54, Harry Yoo wrote:
> On Mon, Jun 30, 2025 at 03:00:01PM +0200, David Hildenbrand wrote:
>> Instead, let's use a page flag. As the page flag can result in
>> false-positives, glue it to the page types for which we
>> support/implement movable_ops page migration.
>>
>> The flag reused by PageMovableOps() might be sued by other pages, so
>> warning in case it is set in page_has_movable_ops() might result in
>> false-positive warnings.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
> 
> LGTM,
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> 
> With a question: is there any reason to change the page flag
> operations to use atomic bit ops? 

As we have the page lock in there, it's complicated. I thought about 
this when writing that code, and was not able to convince myself that it 
is safe.

But that was when I was prototyping and reshuffling patches, and we 
would still have code that would clear the flag.

Given that we only allow setting the flag, it might be okay to use the 
non-atomic variant as long as there can be nobody racing with us when 
modifying flags. Especially trying to lock the folio concurrently is the 
big problem.

In isolate_movable_ops_page(), there is a comment about checking the 
flag before grabbing the page lock, so that should be handled.

I'll have to check some other cases in balloon/zsmalloc code.

-- 
Cheers,

David / dhildenb

