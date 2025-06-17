Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81502E266C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167938; cv=none; b=omcmcWVGkChgExk3QZ315jrZleg5i+2RYBGZn/BxVI3I5LMbj5mrzf18IRLFaH+MwTaJH9Rt5yHLKebKKbpmnJev0F+RgeRoEL9wY2g+PBVisdNPthBBRj8bXnmPj6ohiHF9uYsxckuckSUzJXUntwFqNWyv/D7l9r5Dsergd+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167938; c=relaxed/simple;
	bh=TqaxM3lVFv3UZrbMUL0llG0fYT1f+jhbJEl2XZa355k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WikXsS87r6DH29ph15rnpHRRmWDpl9bPgRxn/ZMfMccL1YZJfCplG/A3IguQC6NmPXlfXkusoQp/1OuzyvfT1eGeYkpkOWJnS/zAxiwvCE8TOYpQ35X9hdr6786FkbWvvriLG8reEsHrrItI85idDov7hdZks4VD597NlO3h+4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CGO5gPQb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGO5gPQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750167934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2wJZWv7tce/7bX9eEyOCO+Maxcn57Hdvffo3J3KjQro=;
	b=CGO5gPQbo6L1HM7kFbaRxXFWjJkXTqcVbh1KnMpxtGE7h916dZY8uF0Ck6+atYEXaL2CII
	9auu3jM7erodDTaMvz2DZtTBDcTGnVKXCKVPvqPK3axYqtZGdFkun/iO79b0jOo1+cgEzX
	1wqXU2GnYDyxIMq/2Hwtked816+diQU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-WQVd9qzXNvaNDwGySaBS1w-1; Tue, 17 Jun 2025 09:45:32 -0400
X-MC-Unique: WQVd9qzXNvaNDwGySaBS1w-1
X-Mimecast-MFC-AGG-ID: WQVd9qzXNvaNDwGySaBS1w_1750167931
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so472464f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167931; x=1750772731;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2wJZWv7tce/7bX9eEyOCO+Maxcn57Hdvffo3J3KjQro=;
        b=BIxzefwMuW4vHjy/q8FlrCmm4iRFFHG3Uuy8sbwGYrorhiw0ciovY1AaiQ3+g2ELGE
         P/urZxPLr6yHBqLfgnA0OYMR8AKujq4LeGHbLHH2V/l6sog4bsmpmjFwbaiE1WC7FBo7
         w9KqzR4uK19KCeVOru36VzqaXuo2675tdM74fLzHjigVaEDXW5M9AdpoF+bOI3eyBOxA
         g6tXY2Hg3iIV7IhoAUdIp45rUWmIUxyTcnxKFpWsgNR2hHDlMc6Vz2N+fS89THyTk/Wq
         vVeZZMSrclRRrtuXRT4agLzQmMThbEwtr1aTCUTKmGzDXdJLTzCTOaqD1+0OR72SU3CF
         YzZA==
X-Forwarded-Encrypted: i=1; AJvYcCXh2zbyFAe/Ysice4pXzCOgcOFvJ8e+u4mMYvGvKLb6btERvpGkK2FvvS8Ar3pWUnXN4R2dNGMHs6AiHrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlj+l2S5rkH9SlAqlOmxfZICq+/zarbQ795MdDcY8Kbbm4sLZz
	osPxZtR5tWXBYZBZdgnWbFRWas4WwphMikfSMezC7wZ8w/WJUr5y7jwzuRIIDqltClMpEjOJM3r
	CjtY41Ic1AxpIeTZmj39aZw/WJOEHPkfJuEG2LohohTc96tQ227vxM4bfu+IGIA3MXg==
X-Gm-Gg: ASbGnct8FQBM5nVEGBnVB90bs2lL8HONOAHUGDqdqVGaM7ZKOMFhcWwWvWd2BLeWtTm
	VXwfFIhXSOoCJECDx+wsvl8UpIEhUrwf23LvM2vwQrpoPwdHA2zJykb27v46/qGSRALnOhhGZqA
	8eggQfYJ8oUWPS20Nf/sfo17hJFh6bmNuT2j+XKI8dRRDMj8lXdVOzgrL6/SldRhOJiwsBvhLc7
	nKzDdvvYwXSR6HSn47nU79OQ5ZrOzczTOJtNQc1fwNhhU8Cz2/vYu2R3sViq1HBRFUMhFd9HQhX
	+IcgNfIGK7CTy0t6RFzvvnVtmxOko4fJdgrwbs2gckdY6DBx4Sm+iRzQlznJsPkFSNUwP00Gz4J
	Im/UXmZomoUhJfMxfbzvGeLe64+rCiTsFMj7u9o25vq65bGE=
X-Received: by 2002:a05:6000:2dc8:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a56d7bb11fmr11538950f8f.3.1750167930863;
        Tue, 17 Jun 2025 06:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbypEBaDDs19Bl9DuY1V8Qu3UyMIidLu0nEN7nOfiU5+Gdehh5BsZJgxN4zYE3IqruYL0KHw==
X-Received: by 2002:a05:6000:2dc8:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a56d7bb11fmr11538930f8f.3.1750167930520;
        Tue, 17 Jun 2025 06:45:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm108385935e9.35.2025.06.17.06.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:45:30 -0700 (PDT)
Message-ID: <460e16a0-c8d9-493a-b54f-2c793c969eb1@redhat.com>
Date: Tue, 17 Jun 2025 15:45:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
To: Jason Gunthorpe <jgg@ziepe.ca>, lizhe.67@bytedance.com
Cc: alex.williamson@redhat.com, akpm@linux-foundation.org, peterx@redhat.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
 <20250617041821.85555-3-lizhe.67@bytedance.com>
 <20250617134251.GA1376515@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250617134251.GA1376515@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 15:42, Jason Gunthorpe wrote:
> On Tue, Jun 17, 2025 at 12:18:20PM +0800, lizhe.67@bytedance.com wrote:
> 
>> @@ -360,12 +360,7 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>>   
>>   	for (i = 0; i < npages; i += nr) {
>>   		folio = gup_folio_range_next(page, npages, i, &nr);
>> -		if (make_dirty && !folio_test_dirty(folio)) {
>> -			folio_lock(folio);
>> -			folio_mark_dirty(folio);
>> -			folio_unlock(folio);
>> -		}
>> -		gup_put_folio(folio, nr, FOLL_PIN);
>> +		unpin_user_folio_dirty_locked(folio, nr, make_dirty);
>>   	}
> 
> I don't think we should call an exported function here - this is a
> fast path for rdma and iommfd, I don't want to see it degrade to save
> three duplicated lines :\

Any way to quantify? In theory, the compiler could still optimize this 
within the same file, no?

> 
> Make the new function an inline?

That of course also works.

-- 
Cheers,

David / dhildenb

