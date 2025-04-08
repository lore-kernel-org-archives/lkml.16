Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A5E10E5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103761; cv=none; b=B8urR93nH8ivUnLcwQ//KCCv6nEW/sMWCJ5l4ij3hdlwBMB7FV8vNyaa9YtfikaFEA6qc9WXn1srvfDlSSYurc5d/T6BALP0QNr7YN3pxFucKgLWCsOQBB69eGY0/EyVIYEAj2QuVmRHcGiM6/1sZjWJhllKvM30IalWtiRXBYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103761; c=relaxed/simple;
	bh=wUEqluowgRBb9i8svrCU2yNZvDnZ8B7NhfPohvOH0MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDQOaTtY7OHTnjOUzIOZ5zb7MpZfwDl7ZUzMwSJCHHNMrSuLGFsNyCeR5G3o2+qUSDE9MBb4xj5JwZKeZYfcOuSi4lWgj5QytAzgPP/TtpCEFyavAnhPkpZUi1d4c7U5kawoyUWVMlTfsTMEMyAviPMIViG+ViqeyKHwJYVvOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cPlCDngP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cPlCDngP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744103758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=InsuyFLXeIMRD01vbL4dFqQRN1eOtj3julYl6SNP0bU=;
	b=cPlCDngPMhXjN1AXd6W1I7JKrQuLajeOb6HI+BI7DZUY/oNvAsz2cbQ7vrwxZ3TBTyBvuZ
	ys/it9nkwmTR41OGw40IpC2NxMtlrsFiNKDZLEwGzGxWybtqC1pKBKHtoWMO9oXwzH69LH
	g2NwFuAp7MQo7AopgKB/IHCCRsgoYFk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-fJ6r5-rINZS2N6QdpYG8Ww-1; Tue, 08 Apr 2025 05:15:56 -0400
X-MC-Unique: fJ6r5-rINZS2N6QdpYG8Ww-1
X-Mimecast-MFC-AGG-ID: fJ6r5-rINZS2N6QdpYG8Ww_1744103756
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so43931355e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103755; x=1744708555;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InsuyFLXeIMRD01vbL4dFqQRN1eOtj3julYl6SNP0bU=;
        b=dkKKi1q21SyriWipxNJNSlfSZn6Srj7RXRULnOM8adsbJx9jHwtlm+8xjpQMbBP/l8
         bU6uWItytT7uShx81hrOzIHb2vd10TuXzdB3770wRgGEdjhJa2+5fgcqkUjSH2AIaKxj
         aAZNBNQ473x5uBveJSRny3TtJgqFZ5Lf/INe8dr9B+vaTUjn3P2FRGTLFNIwUnDKGJiS
         IGDeLk/HcxdVWRreA9xEHk5tpsDGTiDB8TqLvw/ArBlSMlAieiIPTQCV1v+QOd5zKYH8
         Bosf0mCFLQbZ0qtZfA0U+y3Egf8tbsju/Zcal+fwJw9qzm7125jxc1usih9pMP7fZgpy
         WqSw==
X-Forwarded-Encrypted: i=1; AJvYcCWCs4crBnMsQ16tyy/cylH5FZOIrVmdY1E8ol8K4reae8VMcFA1SPHpgMRlblTAL8zne+uLvdzMwJgqKbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIjlVKU006o+LX8d/DTYNPxnzv7GIlTvwJOD3orC4mI+l2OViV
	xQ+M37e1E8c+Cw1IlbGsnASshvzdTxCOM/09C11b5mVdqvOmHoCfDeI/L1iIJnk2PXPbMSrkbBr
	VgQN2ptfblgDGGecRaDRo3XzhfIltYj+CIbeHoj/ZTRmvQOIh8jh4EyRhGuG6iTJNodTkmOqg
X-Gm-Gg: ASbGncudv/ubOUzD2WJJgZHUnYLZDaYVTXyY8juWBdg/JshXQRgZ9MgMHCXu8xvOSpJ
	SmTeC2K8Cw/x5ldAiSWPyarC38xwpgbxwWOUPTb4SVUahGhwaXspI7ra8p4eop1B/+FSOcqjddj
	+r7lH4RYKQYjsaRxWSFATTXWw3c+6csExUjr/KeWb3YNR7liNKG7zekhoan6aMHjcm09TZlCw96
	hQmfv94BkPW+n4cwQpbJ84vHW7ImtkUlTxYLNltamzJM4nux99HHaNdP/1RREd+2pXtKggbcEJ7
	UAStNo3sMB3oikeYO8C9oCe3udiHfF61rmx18dFns0dgVnFTHTP4OWqEHFZzirmi/tTLcBLJQZ0
	2XhVEZCf8pgwSskK6Ea/9X6DlM4RpjunrlVO/x+Zj
X-Received: by 2002:a05:600c:1c9d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43ee077fb74mr83257135e9.27.1744103755654;
        Tue, 08 Apr 2025 02:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0f0TlXm3sVD/wKAejOiKkwNxNf7NA28SticH3lKRwsTIlaSTphqvSFrnsEN6HfZF8ogfbCA==
X-Received: by 2002:a05:600c:1c9d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43ee077fb74mr83256895e9.27.1744103755239;
        Tue, 08 Apr 2025 02:15:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4f00:a44a:5ad6:765a:635? (p200300cbc7074f00a44a5ad6765a0635.dip0.t-ipconnect.de. [2003:cb:c707:4f00:a44a:5ad6:765a:635])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16f1a73sm158435015e9.24.2025.04.08.02.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 02:15:54 -0700 (PDT)
Message-ID: <f31be5fd-601f-4742-aa76-e7314b907cdb@redhat.com>
Date: Tue, 8 Apr 2025 11:15:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mm/gup: remove unneeded checking in
 follow_page_pte()
To: Oscar Salvador <osalvador@suse.de>, Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, mingo@kernel.org,
 yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
References: <20250407030306.411977-1-bhe@redhat.com>
 <20250407030306.411977-3-bhe@redhat.com>
 <Z_Tmljh8dfhRMtCM@localhost.localdomain>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_Tmljh8dfhRMtCM@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.04.25 11:04, Oscar Salvador wrote:
> On Mon, Apr 07, 2025 at 11:03:05AM +0800, Baoquan He wrote:
>> In __get_user_pages(), it will traverse page table and take a reference
>> to the page the given user address corresponds to if GUP_GET or GUP_PIN
>> is set. However, it's not supported both GUP_GET and GUP_PIN are set.
>> Even though this check need be done, it should be done earlier, but not
>> doing it till entering into follow_page_pte() and failed.
>>
>> Furthermore, this checking has been done in is_valid_gup_args() and all
>> external users of __get_user_pages() will call is_valid_gup_args() to
>> catch the illegal setting. We don't need to worry about internal users
>> of __get_user_pages() because the gup_flags are set by MM code correctly.
>>
>> Here remove the checking in follow_page_pte(), and add VM_WARN_ON_ONCE()
>> to catch the possible exceptional setting just in case.
>>
>> And also change the VM_BUG_ON to VM_WARN_ON_ONCE() for checking
>> (!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN))) because the checking
>> has been done in is_valid_gup_args() for external users of __get_user_pages().
> 
> I will also note that you changed the flags check to VM_WARN_ON_ONCE.
> I guess this is fine as we have the WARN_ON_ONCE version in
> is_valid_gup_args().
> 

Yes, that was my reasoning when I proposed it.

>> Signed-off-by: Baoquan He <bhe@redhat.com>
> 
> LGTM,
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

