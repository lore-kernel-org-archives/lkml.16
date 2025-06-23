Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C751CCEE0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706403; cv=none; b=XQOoz8u0tM4c+y3etDWJRZM88PrEgrN7CyLEUqTf47Htt10TnRg7UnQCwiuvet4vxzM6Iu566Xd1qzdDw+FPGQlZZcUG798HfXWETZvtvc4QFVR0qq6CXgh89xGGsiu6/BWbK56E47UoDMQLDW7N6/N0VoaEuC9FDgE6qa5ixkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706403; c=relaxed/simple;
	bh=bPtpUMLV7xr1X126BF6oFqeloarjTFZdO7WU6y+TfGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gatVAnw5QFWpIL/RMrxrdgvh13VyKPQ0MikDMuE92/b5vbO6goMNbh44Qb/F3AUdHqHoo1vSOVx2v5YK8Qjgj+hnFWLoVhdKBD0bSsoyh/LK2X8wGMKMVXYW43Gec6n9WNZoFhc0DaUCbJlV9KLToPQtjn7gvJ1YpHHORp7w2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SWkxRRbY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SWkxRRbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750706401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ia36cUstBWOxqzqqBwAJNyhejCeff2f/ZNqE/bIBYoU=;
	b=SWkxRRbYv9u+Vgh6/C0yfxX6ryjA3YkaDFVolGTASVwRWrBUmcxzI+Uz0Y8cx88cfdcXjD
	tfJae0dPppMX8psNZFReRLLx5udlajNpDmzknrzraoFH9sBbGqHnOLKPMdS4OVjKS4W0as
	V06DK2+zNQiRD8pciKjgc1Ul3/7pjIo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-ctgFqt9KNhSqegK3l2VecQ-1; Mon, 23 Jun 2025 15:19:57 -0400
X-MC-Unique: ctgFqt9KNhSqegK3l2VecQ-1
X-Mimecast-MFC-AGG-ID: ctgFqt9KNhSqegK3l2VecQ_1750706396
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so24458105e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706396; x=1751311196;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ia36cUstBWOxqzqqBwAJNyhejCeff2f/ZNqE/bIBYoU=;
        b=D4jobOebMcSK/mSjPwfVpZbeDtWW0uQT+BAknerTOrz3cwC7zkZsNC4tSMbMufR4ap
         ArJmx5n8BnwEM0dZD4S5+ndTM0xpZKXBLQnF2iMjjEataw1EbkAJIOTAiiF/2fUr4DgW
         01H7uX6PgM6Oqs59ircHVJH1apMG4Rj9YBc3Tn/GLxPMu5u/GQfX3UoHTy+1MTw0WayO
         loOt9LxUEBbNarc/X7KoSA6bo4kABZ2Eb3SCM27HJ5l6RW+UfOW5hQvTLFh5lvMgGUkp
         dWHe2cNdeUKbwYyVb1ZyjL03BjKfqRiMPNeH93tmFMI89MOlzC7dlUclnlH2A+Y82dZH
         /wjw==
X-Gm-Message-State: AOJu0YyOZnDP+qoczKBCzgrNBPdOoOCnilqJ+YG/KygTfqD9D/YqMk5L
	H4sBJC8+maiqPxfaGbgqdGFDG8YdF6WINxqiO9o8vG/Uz+1tQz2ZUPY7ym3cB7vnsXj1R2GVHE4
	gALLQHHFqKykekuxNcpCL0sWGHkZiiLQZTPy2bFOqk0vQ6xZJBksizzdVMTyeDutBWY618XsP2F
	rq
X-Gm-Gg: ASbGncuDRm49l3nHKV5baLkAWU4P6s1GmDmXusyRLRrJoChwj0L3kGl/xDzuSrT06gu
	U1fRLuLaQdPIVg9Ehrv872Ucu0QbFMI73NRhvh8F+0P7KUNWLFl3A4rLa9KNLaFfo8jEKqe66XV
	N0VXxO2iCKTgh7LGHFSOFP/nUElqciJQbPLB+6lEZtgY1prKrh2DD8i51Z2MGrwKQ+lhVf6wNBO
	Gl4kPiQxg90MhHXTVRv9HvOMJC73npjnubU7HILK70BXEgk10P3NOPCMSGDmr+KS2HhRLgrbwQ5
	S0mA3GSmcwXa3Lv6vgnM/a+6Sf0FkOsi1gCos4KkEDLhfX3uD8uLRBTbe/+Do+cUjr/HGtYfPbp
	SU5TsnCxD7FstkZbN01ZHjweVZFnPXnOkMFsv1jz3x4NXMXh0uQ==
X-Received: by 2002:a05:6000:4107:b0:3a5:8a68:b836 with SMTP id ffacd0b85a97d-3a6d1329befmr10573954f8f.44.1750706396484;
        Mon, 23 Jun 2025 12:19:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnTvk3P/6PK4mDZPRi5nS+fcbmFs9L1Lavfj+RH/ks3CCp4alELqSqD5c1ZTArrgC0L3tcnQ==
X-Received: by 2002:a05:6000:4107:b0:3a5:8a68:b836 with SMTP id ffacd0b85a97d-3a6d1329befmr10573942f8f.44.1750706396086;
        Mon, 23 Jun 2025 12:19:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117bfd9sm10346368f8f.57.2025.06.23.12.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:19:54 -0700 (PDT)
Message-ID: <155d1f58-6568-4efa-968e-af3873707ad0@redhat.com>
Date: Mon, 23 Jun 2025 21:19:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/14] mm: compare pfns only if the entry is present
 when inserting pfns/pages
To: Pedro Falcato <pfalcato@suse.de>
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>
References: <20250617154345.2494405-1-david@redhat.com>
 <20250617154345.2494405-4-david@redhat.com>
 <dq5r2xmw3ypfk2luffas45up525aig4nu7qogojajspukak74o@gtg4kwwvjb5c>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <dq5r2xmw3ypfk2luffas45up525aig4nu7qogojajspukak74o@gtg4kwwvjb5c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 20:24, Pedro Falcato wrote:
> On Tue, Jun 17, 2025 at 05:43:34PM +0200, David Hildenbrand wrote:
>> Doing a pte_pfn() etc. of something that is not a present page table
>> entry is wrong. Let's check in all relevant cases where we want to
>> upgrade write permissions when inserting pfns/pages whether the entry
>> is actually present.
>>
>> It's not expected to have caused real harm in practice, so this is more a
>> cleanup than a fix for something that would likely trigger in some
>> weird circumstances.
> 
> Couldn't we e.g have a swap entry's "pfn" accidentally match the one we're
> inserting? Isn't that a correctness problem?

In theory yes, in practice I think this will not happen.

... especially because the WARN_ON_ONCE() would already trigger in many 
other cases before we would find one situation where it doesn't.

That's why I decided against Fixes: and declaring this more a cleanup, 
because the starts really would have to align ... :)

Thanks!

-- 
Cheers,

David / dhildenb

