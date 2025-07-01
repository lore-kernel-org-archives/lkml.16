Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E927584C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372731; cv=none; b=txu1c3rOsvyYvNZzI5rJjcxc507xyM3Ji0TcMzOzozksrBH8kA3clV+nf3etIDAoVCggtj3QvBm/s7KETSkYyeqcAtw+X3r4nI6XLHAyBHYlPSk70WXcz4sdCB4fICn1Ia5JKR2Ep7VpX8VqyESYcxR+mIsjkzfHv3/MtxAqxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372731; c=relaxed/simple;
	bh=z/CCrJhSfJ+0N7wRoqbjcqIKdxPJ8urhIm9XK/idS34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jk3MbbvUhxQLRmyB4dBOCwhU4FB0y3xNLBSGEwPXeRMoZfWdTHPtFd19Ma4LjnPaTg9KB40ivqpDRG7C1RlDugrRLe9raQiG6uH+r7bhDl5KjixWPk/3sESPUW0DH3rhQm+BS21avtl57NCzH/cDksp6r8k0vj1DoPq/UOxenbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XmkRPQAQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XmkRPQAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751372729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tj8pB/rMHLZ+6PtFNz+xS6WiL3VVVwDceOqfATE3uy4=;
	b=XmkRPQAQiSFFQCQy7/73MhS29tiJF4wiKNa0goqfy+g2HwZPOUUDa+PGEsYFUerhAOcl1J
	OIjkNgZWtJbC+bFYg4TreWSG/2URLzgf4cU4jMo/MGFQ3mQ0ORTOO1PEYQGCE+cxzv56Ek
	4+/k4DjMZkZLNvXB0P1bJql1I5KwkKY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-W-lCawKyP6ig2DpQ-jHEuw-1; Tue, 01 Jul 2025 08:25:27 -0400
X-MC-Unique: W-lCawKyP6ig2DpQ-jHEuw-1
X-Mimecast-MFC-AGG-ID: W-lCawKyP6ig2DpQ-jHEuw_1751372726
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4538a2f4212so25727875e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372726; x=1751977526;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tj8pB/rMHLZ+6PtFNz+xS6WiL3VVVwDceOqfATE3uy4=;
        b=k2jpsUhAJPdrDM31IyzMwbZ2CeLKQuISko73qJUo4+ImVh000py0YgGQvVE8zaxjmT
         C1lGQFy4bHvjcdcmjJnCm/OJfajNlWoc/jblWp/yNuC4vTZjXANXlHHkcqmfycOX2fn3
         sU5Z9L5irl6KRM3GfJL/diVREub5aT+KJeGJaCb3BXOnP8DuDmXMxz1lBg43Wbe64zd1
         vNGBln0N9Jc9d2b4XtyviIs4sjjkpUjhI4aA729QSublEDr1fB472Q/B6T6EkVPTrD9k
         H8GpO5Vq5+9qt6xFLDH7Dl0WIgtBZhS6XTUZD3RhsVp0MhJc9Po+psA3/AtMpv6t75Ko
         P7fw==
X-Gm-Message-State: AOJu0YwW4AJIrwDWse41r4L89mtL5jCAJSMECc9FpCGuVqXF2owAgCJU
	84GG589hG969L5+I5FoQvxMY7hUmhs2G7HaFSLILl7KZs+0oNlaMbFDl9GL+KSVO81QdIKR1EhZ
	S4KWoTuXR5/JDT117KHzh/13B7Vf8ceSWrgMyhcx63QbFSiKpNfVyzBIwO6uJ8dddpw==
X-Gm-Gg: ASbGncvScVFI2HKdpAun3+39c4H/AaKQk6BHzIiBblrK8/pa35xLr633mX6loh9qudw
	rWDp7qO/fqQRmeE1GAW0UEp1EXvekB4EVlTrORUtEA12eb9lCRteC7WnH4WvEXHlsfCC1y7AZrW
	FNG20QpODswjqhAA8cW6c0mA5wxTEkHwu2ZOeH3wmAnAwuSo6/Z78XEUaNvtt1ZbBdqo/SqycFx
	fJVE1YFKTVriqGDaU0MJxGNX1C3VBm1vaoSyo+n/675ZJVc8DOaKj+FdP8c8+mBWu+2gl/CUlvf
	Oa11SjRuJJFI8R99Q6KbvUrLdInX6lka+looQ3/lFLEu24bHqttfrFE4HyyALIZe9LqNPV9EfNf
	vkNOcowr6hNwk0poy4vYdPO+L/MDMz/tKlRdjpoZcp4KlFshqKw==
X-Received: by 2002:a05:600c:198a:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-4538ee7df15mr201513465e9.16.1751372726406;
        Tue, 01 Jul 2025 05:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtxNR73SFMqIoSFe5cIm5GNMerZkIb6R08bnmv81T1e6WZOFEwjwh+c20OjBL0zx8GNPpXsA==
X-Received: by 2002:a05:600c:198a:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-4538ee7df15mr201512785e9.16.1751372725799;
        Tue, 01 Jul 2025 05:25:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a43325asm162371015e9.16.2025.07.01.05.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:25:25 -0700 (PDT)
Message-ID: <e29af2bf-34c7-4d26-a5d7-f061d2642bd5@redhat.com>
Date: Tue, 1 Jul 2025 14:25:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/29] mm/migrate: remove __ClearPageMovable()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-15-david@redhat.com>
 <24d2b984-857d-4a11-b016-dc0227d81c88@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <24d2b984-857d-4a11-b016-dc0227d81c88@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.25 12:43, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:55PM +0200, David Hildenbrand wrote:
>> Unused, let's remove it.
>>
>> The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
>> still mention it, but that whole docs is destined to get outdated and
>> updated by somebody that actually speaks that language.
> 
> Yeah I've noticed these getting out of sync before, perhaps somebody fluent in
> Simplified Chinese can assist at some point :) mine is rather rusty...

I already saw doc updates for this. Obviously, I can't review them in 
any way, but people seem to be active updating them.

-- 
Cheers,

David / dhildenb

