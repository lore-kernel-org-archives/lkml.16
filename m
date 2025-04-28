Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB64A101C8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873384; cv=none; b=JIKXCGE7GEo8Oq60da2gEnZqX7rmnqJfRTA0VSj83RL6yoKPOKsMLkb6Yay652i0HJLfX+2QmIfp2iAysDgwBsx/hbFzWZoBI7dCfysfLRgAa9httvEVMi+O3iSQIDuYQaxen5qWY/TS746LgsAgyb3IgQwEtIwIKHos5lwedAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873384; c=relaxed/simple;
	bh=j477d02MFhTA0VKjmSb3Mkuwa1XV5mkgC0IzVtZX8LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CooywLD+zoI3VkZopK6usWVO5FndqATTJn/I06+3Nnqm7+1DcS3UYrOqeuaqSlfQqWP0JCHy/tqQkw8LKF8BQZ/XBCLUxzyFK/6HLx+sgeyiTL3hTa5lukTD8/66hhJVO0ShsLZxhV1WYT4ii4lOrvdNb8F+Ei5PHrT/nyW4d1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cInFyfn2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cInFyfn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745873379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XDREKvD453rHlhe5WUMHEFcR2HjACN++SAUbuPpVueo=;
	b=cInFyfn2ZgZYc12/QJrMimrGPJLv/xfl6+zAT2Vh6FA4h5aWlgFKQokSYvyWNR5EhuuiPM
	PLl8kAxQL2QjHylW336flJiEgfQKnjp4Tu+YAZJU5oAOCCZ+sCwexZ1ftpKWIAUn4XGZId
	pKE1v58HdP6jNkyD4lrEYHs/Kp4bcrU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-MM16buRuPOGLLMXINA_Zzw-1; Mon, 28 Apr 2025 16:49:38 -0400
X-MC-Unique: MM16buRuPOGLLMXINA_Zzw-1
X-Mimecast-MFC-AGG-ID: MM16buRuPOGLLMXINA_Zzw_1745873377
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so26821735e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873376; x=1746478176;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XDREKvD453rHlhe5WUMHEFcR2HjACN++SAUbuPpVueo=;
        b=RhCcsyqEfTlsKu6bbo2BwWPKXXkpz89PoPtnLFEem4E+yR/P4b7e0k9Khczau+j4XF
         W9bnG9qGd4F682//GxBJjgUVTF++h6zGdoYlZHBchRCLAy820o9OEg153SZAvmvwk6H0
         5sdf7nbOly3mEEuY+n/O8xoXBBlFJ5e7tz+jzD0ky9+qT3eWjQMvy/9qc0nGu5exE+nD
         HAu0DTau2yZtLDiOpqRy/6v2C+C+g4P14FKjae7UIZd0PZDGIQb4dxPn9TJfndfGsl8J
         sqpVvEi6e3AMhYPIoaF+w2CPTb4vzUTH2XK8eennehWyIcEb9nI+MQG60hD78RBzxuXa
         PJjg==
X-Forwarded-Encrypted: i=1; AJvYcCU12fu3oddrDUWPNKpTGw1UulotED377shSECphrvC1aV0QiQSlcpEHN6x5Ax2Lntir0Z6atevCNfaQkrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHdKUBWJcj2XsMw8uMIHxUymvzRL62VI9gvK+jStjaCwtCoe5
	OMier2RXxhQs9cJ+TJ43gMRi0xHQShDY+/YQu6mjGZX4PTzx/NL3Lyz65kECv0xvszoAEdR2scf
	xHCwuJ0MHobN5D4OYWW4RA8VkB8jkt+FNgOMAxD0OhrCeVr+CocCZexMpopxEIA==
X-Gm-Gg: ASbGncshFAanZa8X6VOFZaaqFfzjsEdmZ0uBdEfGDSgU4BtNMdc/j3Y1crE1UdRNoix
	Maxk9osiq9WQeoIcKgsVhyMeEiEmeh82Jcb0v95xMwtLPELh5j7SAy+UNeU8gDHQDXcoNKPQRuX
	1jymX34V4WWID66n6Bihkxy/D3N/Og/Az1An96/nD1Wu5yGQdZ4kpWsU4Ea6ratsV+KI0KeAWba
	xgZzY/SVN9p5ZD2SYabfiNukIUi6chTrwImKq7eiIbX7T+sRVCMiYeS7OhRMpwiJ/mdRU9NXU0i
	1yV6FT9b2YmZFnMtzLwdGohccWrcB1jJ18m2oEY3LdgAhPARcIJefZsrKoJ2YUorAxIlvMuAInQ
	gonXlE0lbBw3XJO9oI4qfl/D85U0f4uJBmCX8aww=
X-Received: by 2002:a05:600c:1c09:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-440ab872047mr97282755e9.30.1745873376517;
        Mon, 28 Apr 2025 13:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgxq7yM+IFHvgV+3GvDjIgDCmyftucp+mtct+ZPAabueLHdRHuIJiXkiFR/NAW3ehnJrkiGg==
X-Received: by 2002:a05:600c:1c09:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-440ab872047mr97282605e9.30.1745873376186;
        Mon, 28 Apr 2025 13:49:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a1dc3sm165299915e9.13.2025.04.28.13.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:49:35 -0700 (PDT)
Message-ID: <bf27625f-e97c-4d9a-b491-1afb350f6d07@redhat.com>
Date: Mon, 28 Apr 2025 22:49:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] mm/hugetlb: Pass folio instead of page to
 unmap_ref_private()
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-4-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250428171608.21111-4-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.04.25 19:11, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_ref_private() has only user, which passes in

"only a single user"

> &folio->page. Let it take folio directly.

"the folio"

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

