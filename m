Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECBD1DFF8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971161; cv=none; b=CIPSlsH1uORxOmq2fiI5CCVgTorGMqQMv7108tXWu4eTIsGo1n6vZYFHWieKC0djDndUdkP4KoWmLyMPx5o9l9ksII+uMcH/MRFOtz8G1whAt13GuGqG1xipENGKjIsaazHoD7aJmVJfmd6Ee7B4xcjc6h+XKFl286Ee+I+rnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971161; c=relaxed/simple;
	bh=PO/2kFw69AY9PvEPOU4HMlQRdDhrbZ/vZ/RQTnFDlVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZjY0gp0gZmOeyZBN+H7RXOVniPpdKog1LbZBXHA9N+DCZmusCGoeAHhgTswkyJ/sgQ9eWzwAUWeg+KvdhVTJsY84LXWJEo0dFJEtbXoiTOjgbVgYQUH0vCXtDYoeY1IvyUd1vQll6YUr8YeYo4ILrp7zZGAyc/vAzX18HgxBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fw6SQfFV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fw6SQfFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748971158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qUU4OFf74ZE0Vbi2j5eSNHQKfn59GptFs3ll0pDTE+4=;
	b=Fw6SQfFV3Hf5XYbPLavIqXpezxsgZU20E5NEqYlWPsET7b4FBtnq9pyKQbzmmdvVcD7mSq
	8XxvlWlaKLDbqH4Ba5jMAnD5YanPZ9JiPl/dhx1aMRSlrgogIsZObWezAVMCTa6rh0fJDD
	6MKYJPhKZCfpxy/x5NGIMAvc01pUKDc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-8CLlt4qmMoq-LnZUq8-sSw-1; Tue, 03 Jun 2025 13:19:16 -0400
X-MC-Unique: 8CLlt4qmMoq-LnZUq8-sSw-1
X-Mimecast-MFC-AGG-ID: 8CLlt4qmMoq-LnZUq8-sSw_1748971155
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442f90418b0so31619325e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971155; x=1749575955;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qUU4OFf74ZE0Vbi2j5eSNHQKfn59GptFs3ll0pDTE+4=;
        b=sX7AQextz9o4azn5vgwDDO91hFeLSAhcudX93OZYstzqt4fwqzHNr746NNcLRHQOWR
         pIDXaYOwvkNl223bg6PUwP9338CQsq50On0PctXjwVQpYF76NFABttP6sqJe6M6Mk3UA
         pUYTQFGlSWjoYS/+hKClUMrAExhhVOW0PUUG4UtJjzrl+hAQPzhzJjT5pXd/25IhmAaS
         zx7Dw58CAe/6r3MHh8akJ/1mP2exUFt/VNiSY3XgBVwD0dfNdtEOpboK2BDAGRHVIoJ7
         /nAQKWZnemIGZaWJVZUmtGI/VjY5m6/UhKJVckPR9DE/fCnA6YpOxcUFm+dXjmBmGEAv
         qnnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqKKGzNbSPEBgtavPaJb0mHd1iyrA15XEWuUp1XoUOXij5zBS71uyTRVSBzhCQ9UzsWYBLL3r2b1zE03w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsVfT7pTXhD2jmreI9iuNm/iBcS29EBmo57xHqvAk3am2zG1/
	E4g32cJsahPKodYtmAe1gVFF4NviKEF3EC2xk8y/irORoVLmmJO2s4d5FcUN5oXxlctZ/eC+ywG
	iWJxONJZBfH6qcqKIGrbxOrEUgAXS+K+MDeRKkdkdxISKVWkhAdxhL4ICClOuuGT/mQ==
X-Gm-Gg: ASbGncto2xeJP8FnuvbET5FTtkrGOaiIS2I+jVye6pS1Qe604QtB4nC3XVTWL7ja1QH
	n8mZwo43+mjelHoTHtl7ctdLsS/mdRGQDLMDm0ezEcjRT+v9O40K1v/c3zT4LZQGyZCkNYmb1bA
	lmCQCormEiivzwDilVGRj7/1b7TwQwvItAwYhXOXVm76Y1WE5i3O3CNyGBICs+c2Y9Qi3pnkJDl
	kR3A8ILktLC1to6Xy2nayyRv70LOPvYOdHL/VJC9dPCOvfcvr1CyfF97zTlAA2BSScPXZYLrXUQ
	8xRJzFri56vIgKhun3ZGphbornSn+qYv+0LJnrFXoL+nZU+JMzmrIB3QvCp2P7gJFqaAOWac1PB
	fQ8wNR48HJEVSNTbHNk/lGroFlu/kXhMFpnnpusg=
X-Received: by 2002:a05:600c:3596:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-4511edf2167mr105293405e9.25.1748971155359;
        Tue, 03 Jun 2025 10:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj7GIZlVjMRe5WGKxNpZPxEoYl4Ep47THdwCv36w36DKQBMvC50/+cJNUD1tUkHQAZp+l14w==
X-Received: by 2002:a05:600c:3596:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-4511edf2167mr105293095e9.25.1748971154970;
        Tue, 03 Jun 2025 10:19:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451e505c350sm29892395e9.0.2025.06.03.10.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:19:14 -0700 (PDT)
Message-ID: <1602a87b-b1bc-4b53-abe7-dce8adddbe46@redhat.com>
Date: Tue, 3 Jun 2025 19:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
To: Peter Xu <peterx@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, James Houghton <jthoughton@google.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de> <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain> <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain> <aD8NUSUV5zA4yNY3@x1.local>
 <fd10b2b3-064c-4ee2-ad7d-e30a0e194533@redhat.com> <aD8Yy0xfJdvLKp4X@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aD8Yy0xfJdvLKp4X@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> As stated elsewhere, the mapcount check + folio_move_anon_rmap need the
>> folio lock.
> 
> Could you elaborate what would go wrong if we do folio_move_anon_rmap()
> without folio lock here?  Just to make sure we're on the same page: we
> already have pgtable lock held, and we decided to reuse an anonymous
> hugetlb page.

For now we have

VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);

right at the beginning of folio_move_anon_rmap().

That dates back to

commit c44b674323f4a2480dbeb65d4b487fa5f06f49e0
Author: Rik van Riel <riel@redhat.com>
Date:   Fri Mar 5 13:42:09 2010 -0800

     rmap: move exclusively owned pages to own anon_vma in do_wp_page()
     
     When the parent process breaks the COW on a page, both the original which
     is mapped at child and the new page which is mapped parent end up in that
     same anon_vma.  Generally this won't be a problem, but for some workloads
     it could preserve the O(N) rmap scanning complexity.
     
     A simple fix is to ensure that, when a page which is mapped child gets
     reused in do_wp_page, because we already are the exclusive owner, the page
     gets moved to our own exclusive child's anon_vma.


My recollection is that the folio lock protects folio->mapping. So relevant rmap walks
that hold the folio lock can assume that folio->mapping and
thereby folio_anon_vma() cannot change.

folio_lock_anon_vma_read() documents something regarding the folio lock protecting the
anon_vma.

I can only speculate that locking the folio is cheaper than locking the relevant anon_vma, and
that rmap code depends on that.


I'll note that in the introducing commit we didn't use the WRITE_ONCE, though. That was added in

commit 16f5e707d6f6f7644ff07e583b8f18c3dcc5499f
Author: Alex Shi <alexs@kernel.org>
Date:   Tue Dec 15 12:33:42 2020 -0800

     mm/rmap: stop store reordering issue on page->mapping

But I don't think that the folio lock was a replacement to that WRITE_ONCE.

-- 
Cheers,

David / dhildenb

