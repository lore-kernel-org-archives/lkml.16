Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F819343B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652771; cv=none; b=WcdtQ5ZTxpLFBweDS935mtAifIaoJ/thhZMI+4ttrcSJCkeI/PzDGc76XorQ8fvekLgIDjNlMRMv8EMk+KYZR7Y9qbV0t3eAsmOAk/PTGeu/oLC1xuQQo1DLI/T0sJ7I7dxCnZdOK/9U9ebBEqea3y7tMQQq5oTZtQSVNJA1BgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652771; c=relaxed/simple;
	bh=B25rC45tM1vGBj67YCQoRT1nyigkFY/o6uT+zG6xt5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8A3pT099+Qj3aZ4pU3RQ1I6BA/yiZ/xN6Vc1KoYbVFl0mHsTCvgvAdFHvQVl/3ymgKDgldyVX+zWjQECavFGNTG/2JmdExvCP8j1VR15KAHod9cup5o/r+Msz/MF7jfeiOPFdfhadtnvVEC3TE8wdZrWDEvCWKBS4vjo5zSJdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a1c5jbV0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a1c5jbV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746652768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=neHytjR4nubPG+1S9p7VFPglTq2wLWk6QiZis8XoX14=;
	b=a1c5jbV0Bq/bH5U/Pad4xu7NCRru7l2KMzCf7CL131taqUjnDZ2clhII1twXzoyqJdFB50
	Xxh42SrDjSyHRdm3qFGZKYzlY4+hs6xgIgRRGCPfazyyTFHwH4j5J159TTbxxD0l/31vkz
	p2U8fwvf+IJzsJ7RCCPcmMOKCRpO++I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-KVnt8eiuPt-H78GePAVTcg-1; Wed, 07 May 2025 17:19:27 -0400
X-MC-Unique: KVnt8eiuPt-H78GePAVTcg-1
X-Mimecast-MFC-AGG-ID: KVnt8eiuPt-H78GePAVTcg_1746652766
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0b5d18cb7so107344f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746652766; x=1747257566;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=neHytjR4nubPG+1S9p7VFPglTq2wLWk6QiZis8XoX14=;
        b=AS15ekq12Bn5rCi4kqMyd0pckORpp2gu4EmmsmfzsTNo2ZcQR0vZ2APKRe5pFYnDS6
         IlTUw3UomVndCNciJ09NH4iS3LXjfHNsmTRHCPi0+a41d/y+MAGV9olbl92aTO9FUv4k
         gsdEewQ5Qikl98JZkklsGex3LMuoeRvt47edxTvfaeagqjwf4kRxEnKYeQ31o8l1Oogw
         K2kKv615Ku8siJdvlJJHwS+rWvHDlKhgK7renPiMObNLBExEJMlqnacjxUrEtpLRFMDG
         hARpurZ88m59h8pEvFq5SIebgspniSC4YbJbJw9Mmwx0jlfcgW3TlhJ8XUpIHR2w87EX
         kOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDCgLt2ebtAdBdmYLvrIY9r+oGiKW3aDi2k86j4KIyHBUU/z3NfNtOz87z2taZTeLJ89H6y12Dru9hsy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo4hcaHHWov6cCuygDm0XWXgMftIEpJfiTyBX/nqNXcwN4O61w
	Yq/qRvQAkWuxP5vpK/+qOruOKnoJKEJM5aFVA/Nm+B3kNCnlIQ+9BPeS8v72dGPpmbfJNTyT3bh
	R+IbCs0yrpHW5q3Q7mpGAw71Vm+qserwOTBZXtFXl6Iv3ilSFWUFrvM3Ox9w0ZA==
X-Gm-Gg: ASbGncs7QW/gTKaa8bVQJHDadB+rxCrY0tWQvuXDhhxujegOFA5zOjrwdPHKFfKOF7H
	ogeOyL9+OVkLMa3WQC8e5ja1c7S4Kn0vugoP2SSD0awo6r+Uyy6v53aue7pOrfWDa0Mo8aDGo8t
	UELOtJN9K4hdDebmVcG1UbREYRt5zBp5BkHktccmq0hj7+KtlBhEUra7yWcU9DQ+6r3j91+jTTn
	InvzQF8gajhpYHoxNRRW0oEsWrKKaFQ+CvwpPW015r+IGqrN8fBXscbKFPKFVEiub2wb29yfV6G
	iSIvotmxJNIM9w+SNN8uNiUf8Lh5VjMX/gh9D30YSPtBIPGRSRet6pfj9QsFhz5cC1/p0Hd2WZE
	Y91VtsHm791iI6OXr5FrZWR+JXmy6RXlBa5j+Ag==
X-Received: by 2002:a05:6000:3109:b0:3a0:6f92:ef7c with SMTP id ffacd0b85a97d-3a0b4a05578mr3741910f8f.17.1746652766059;
        Wed, 07 May 2025 14:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZg1ZwclbtWu92EkOgSrYAgd4OdOvPsqPEbzOd7j1h1Qx/6bqO6iJHm+V0g61eeKVFR7zfeQ==
X-Received: by 2002:a05:6000:3109:b0:3a0:6f92:ef7c with SMTP id ffacd0b85a97d-3a0b4a05578mr3741904f8f.17.1746652765733;
        Wed, 07 May 2025 14:19:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2b:fe00:532f:f82e:7128:936b? (p200300d82f2bfe00532ff82e7128936b.dip0.t-ipconnect.de. [2003:d8:2f2b:fe00:532f:f82e:7128:936b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0bb7c29e8sm35906f8f.7.2025.05.07.14.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 14:19:25 -0700 (PDT)
Message-ID: <70785e68-5152-459f-b241-fa5abc3b88ae@redhat.com>
Date: Wed, 7 May 2025 23:19:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: khugepaged: convert set_huge_pmd() to take a
 folio
To: Matthew Wilcox <willy@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtMYHE9BgiT8nT-@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aBtMYHE9BgiT8nT-@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.05.25 14:04, Matthew Wilcox wrote:
> On Wed, May 07, 2025 at 05:26:12PM +0800, Baolin Wang wrote:
>> @@ -1476,13 +1476,13 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>>   		.pmd = pmdp,
>>   	};
>>   
>> -	VM_BUG_ON(!PageTransHuge(hpage));
>> +	VM_BUG_ON(!folio_test_large(folio));
> 
> I don't think this is aterribly useful assertion to keep in a static
> function with one caller, do you?
> 

I'll not that -- whatever we do here -- we can (finally) get rid of 
PageTransHuge.

-- 
Cheers,

David / dhildenb

