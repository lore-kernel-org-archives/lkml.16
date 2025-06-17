Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B072F2343
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175339; cv=none; b=i3swiiCNVYx0sJwRJIvVoSoivrO4pbzzzYWv/MTG1fE3qVvVAbSuonplda4P+vi2i9HEWlQqP7qwX8oSzeD8ocuDwQMSQMJjnFzFA9hRMDvJABd1Lq3e1tO1yfCymFplj3VMhfGcFYLebYBds6VriL59GD+JNV6Cb9p864CLzio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175339; c=relaxed/simple;
	bh=OkE4MzqwtlNIfKDz6YLT5KdopA1B8T2oMcnHBtM230s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bk2PPHnZ5f5KqTnfhcF/An8KJksY8a0zb8npuUeqaCpHkG+2KwQEArVFJLrxQGEmPugR/PGQuVltvnMaAJZBeE26rOLWeOsAoCjFFpfT07vtYowN0jCDLx3jZkUqdpidU8gLNxL27p5KmKX7oOheBzxqtM3IuNSSrQkWI1RiVA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJNtVxOG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJNtVxOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YiX9Kkg4lLe3CUJ/v7bcM16XX4W/Mb03rsmgcocbj/g=;
	b=QJNtVxOGsupiHNQfG+917jpMYoUF0D1WQYtNiBTNW9xCiBzaq/ctX1Tcuas8Uz7JlEOvw1
	GjfnVuICA1WZWJ9i4Rk3M6H45/PJywMkoOG1TrKOydbeXg3TPjaa3rcutuBAwwF+/76lva
	jUkfu0cSmQq2sW0UF1lkjYSnsajnni8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-Ky6oGEK5M4q5c92bJYbYTQ-1; Tue, 17 Jun 2025 11:48:55 -0400
X-MC-Unique: Ky6oGEK5M4q5c92bJYbYTQ-1
X-Mimecast-MFC-AGG-ID: Ky6oGEK5M4q5c92bJYbYTQ_1750175334
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579058758so1200238f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175334; x=1750780134;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YiX9Kkg4lLe3CUJ/v7bcM16XX4W/Mb03rsmgcocbj/g=;
        b=V1QCqzw8LvoFn5dId39MQaehFMQy4HO9lM6kv0xCWk0gMGHa6LtgxmOUt6ei8zC3Y/
         HrUevKQujam4u6yG4Wjk6Xfrw2kJ1/v4jobeqnoRDdzf+PAfCQM21BMbzwahhxPPHEJe
         amImcTUZwup+9kJxNPyemlCrpWRC/inuKoQwERJzyt2zeiCf6I0IFLvfFDxtlYu45wIZ
         +WwcUIyqdVc1O6sYLMJ7DWadhc/+WU9gsQ2aADEYXtNGMJsyapdEhVIKcKOPRCMzVZ5K
         4SMMVsM19SH37cVKJs4cRm5JUGRNGMfJf6YA/OuREKXR1UYqY19qZEf7cvfZjtPi5tTv
         Wo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWktApf+0p9a06TYKR8UeDRYRxFs03mFZayc9vSS0HG5SAiaqhE/iSW9G1UnNkT69cTSGiqbsu5hkv29FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfnGmx4qVCQ8UhSDVLek55SqVmlYGlhXMXS4PTvF2TbL43I7fu
	L2nJLAreIIFBG3Jrgpvl0Ueik7NMXvMkcPh59jEsMRjQSqie964XuFTasqecl5qaliUj4AyLzGB
	HMc+vBUjNj3lVGoGFp4WZKqFzLJoNCSmU4k7qDjD7MrDBgzaoCgGhws9GLo/8D4s/Ew==
X-Gm-Gg: ASbGncsDQKC5vMUEm90rHL5bs04lXDN93E0k5Ao2qsuIJPXjJkBpCE7kvchyxKWi8B9
	gDC5dJz+g8vCAhazxebk3nghQHrptyDoy+cqrHTrt0Hf8yZnV+sU446z3XtrvIqTdrYjstXk0V4
	qs3SZ11MRAOwTJkeybNhLVgJBvGDFmiSr7KnVZW6U5lKKjnRoPuFdraMHY4BjF3nKjXEcPmac8S
	r7crh/E3PIXc8Kog6nKeS0aD4gHessbkt6SkEd6Y62SJb3xdeCCW5Upbw29fNr0GQOjf5/Xy4qe
	r+KrOVTtq9IELVymofiNyegO8zGjj171UAXhQ5z5WhuoKHo5Q3y5VaPVi7fQkoYymhiFYdstvV8
	42hHEvGqLi60qreuFNLM55dSWmUkNpvodS07/BWeUnASo6ZM=
X-Received: by 2002:a05:6000:2585:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a572e99648mr10002939f8f.49.1750175334506;
        Tue, 17 Jun 2025 08:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6kGWWtH/t4NIiGM+jiDviDgxJxLiw/9P1H1XacBb8z2/gtdmB8LBxdt3t6T5OAHHu2R1LCQ==
X-Received: by 2002:a05:6000:2585:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a572e99648mr10002922f8f.49.1750175334142;
        Tue, 17 Jun 2025 08:48:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e254396sm184305065e9.28.2025.06.17.08.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:48:53 -0700 (PDT)
Message-ID: <6c329b3b-97ed-4e5a-9e71-e4b737b50bd3@redhat.com>
Date: Tue, 17 Jun 2025 17:48:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm/ksm: calculate ksm_process_profit more accurately
To: Longlong Xia <xialonglong@kylinos.cn>, akpm@linux-foundation.org,
 xu.xin16@zte.com.cn
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250604031758.4150209-1-xialonglong@kylinos.cn>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250604031758.4150209-1-xialonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 05:17, Longlong Xia wrote:

./scripts/get_maintainer.pl is helpful to identify all people worth 
CCing (such as, all maintainers).

> During the KSM testing, it was observed that the sum of KSM profits
> for each process does not equal the general_profit.
> 
> The reason is general_profit_show() only considers ksm_pages_sharing,
> whereas ksm_process_profit() accounts for both ksm_pages_sharing
> and ksm_pages_shared for each process. By concentrating solely on
> ksm_pages_sharing, we can achieve a more accurate representation
> of actual profits.
> 
> Thanks for review and comments!
> 
> Longlong Xia (2):
>    mm/ksm: calculate ksm_process_profit more accurately
>    mm/ksm: Rename ksm_merging_pages to ksm_process_sharing
> 
>   Documentation/admin-guide/mm/ksm.rst          |  6 ++---
>   Documentation/filesystems/proc.rst            |  6 ++---
>   .../translations/zh_CN/admin-guide/mm/ksm.rst |  8 +++----
>   .../translations/zh_TW/admin-guide/mm/ksm.rst |  8 +++----
>   fs/proc/base.c                                | 10 ++++-----
>   include/linux/mm_types.h                      |  2 +-
>   mm/ksm.c                                      | 22 ++++++++-----------
>   .../selftests/mm/ksm_functional_tests.c       | 10 ++++-----
>   8 files changed, 34 insertions(+), 38 deletions(-)
> 


-- 
Cheers,

David / dhildenb

