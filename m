Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B35772639
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676440; cv=none; b=NpQv8fIQbpkzuWMmbMIYfFz9X8QTi95Xhw+HeHT16RW5uxS52s5bm2iGSaasGvhQVS4Bn0FLbWPuBarKLcEqD2NrNlzu8U6tuPeqfnmn70pEgPocXCIeGyLwn5XS4Yeyqiw36AfM1AMbXnRs3FSfebdALMtY/V0r8F2csw13qd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676440; c=relaxed/simple;
	bh=SGYRJ/Pa/rCRIAEp2DzT9CKDo2DR1Kor41Jpn068XTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQg7cUmiEbAbbHa60iV+qYtWX+4RFgMJZ3ddKRUkokz9ZyefAZN71zqML+q782ia/gub4icWDCY2lMBbpbRmrYwn9YiQUuaeVEFsT3glaiOGHbb9sJCZjduLPUldeK1Gd7D5EjLckArFrVD7lbZmZ01LsovGyEVd8Gs9qJVwZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAUqQZSx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAUqQZSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747676437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K36xPLX2EO98K8la7E6clUlgO3MhKSVoAV5X8FkiL4Y=;
	b=RAUqQZSxAbeLklPO/IW4i0RYQ52wJdqZwwoS1hmJT9AanLcJMjyWswzLMnpJByGaU0eeTc
	b1XtWqMhcl+m7gky+ROREaI+65ITDsbdxsZbYaIX/CAVmCxhOqZ7Yp8iRFYi6IsziKrpdG
	E7HGK99tc+UjKjxZWiKHX6BB+IgyjR4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-L-xygKyQMCOdGFPQx0IUEQ-1; Mon, 19 May 2025 13:40:35 -0400
X-MC-Unique: L-xygKyQMCOdGFPQx0IUEQ-1
X-Mimecast-MFC-AGG-ID: L-xygKyQMCOdGFPQx0IUEQ_1747676434
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cec217977so25069275e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676434; x=1748281234;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K36xPLX2EO98K8la7E6clUlgO3MhKSVoAV5X8FkiL4Y=;
        b=uhcidAkZ2YcWwlZ82kuUw84mDNI1oWI8CJRtWnqXX4Nkm5zrkDNPRtsdZtJ2zVcVtc
         ZIXrXLRQXfdaU94qmWCO7FtdHoB6x0mRSp8KrJEKWmNbLiZTrwaNXa1zD/OjLWQcuUJ9
         0/I0kKTtzH8SJOQgDSSLr5FaLAtuxkSKWO9iP9p+uXgfYJABAVPrDOdAwAtCgC4wE3q6
         JTXv5M9Dlcvw8kutZFdIQRM9VfEWkbN1lMx5ExfacMhzk2JMkKe3MVXvzynQ6st76pFf
         IaY/bOqPsCHRrMqyachhn5XllUE8BXkGF3ZZKHeP0A4fnjMYuDYCNu5ottSZDEZPHFKP
         wiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyvZA3jrVuD3B+rdIpWScx1Ad+QVm2r/eve5BjsA1TeIDkVkcx2KTJSyoCTGMkZT2zKqY91ZKl72mrcuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKzzi7bOG4fWU9eru6yMVl+nE2N+uxyGcXGlIzNABEeVnr+Oy7
	a6BH6Ox1pNAquG/a6F4xJq+LyEJUvqISh2KEVHwgLnPhg2WW56CtrvIQicVLteQoxxtkDzAMGiH
	ARSIc642AY2CXSwYTW0RiWYTNiI7uyhLpZkcFxBWqkDAGyUg3a6lLdrsXqPu154L/AQ==
X-Gm-Gg: ASbGnct8T8bDqU2rdiwSTPlOqkuwUTSS6kAMDPCBk/ZbsmWWT4le7GzwLhX/9jZeG/N
	1PjP6JCEVf8z1HCvrQuX/q1N0sRLn9YQ1nmojNiUwDgftcCmHAL546AVePTEWLL2KjrRKV2s5Z7
	ty+SiUiOR80KZPV1WqlePLWqk36tN733L4RBwkpQKsvIFw6G8vYbvel/zeqQ4u1DkYxidxvLc0r
	5xTDqqk1k8eDN62KxDawlu0ovla3iIyhgLV+SUedTy0lxE4EZOoVXSKvCA39XbnYo5SzmMtW24e
	IrqdSUZ37GT9Cetoa1i0evUwGi46+q4tKCwkB5QzjcIVBGgXwfaD1LDW2jHnaIjSSdtFgso/oUX
	OUaAEfCd+WNMlSV0xCQ2O/YAqqlHUVcXknAFvllM=
X-Received: by 2002:a05:600c:a46:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-442feffb5a0mr148453305e9.16.1747676434479;
        Mon, 19 May 2025 10:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUICFVfnitZqeXCiHKTi2mEcLXl0asuTZmmpVM4HpKVDE2zGdtICR9BqQW79GLRMernQBoBA==
X-Received: by 2002:a05:600c:a46:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-442feffb5a0mr148453035e9.16.1747676434156;
        Mon, 19 May 2025 10:40:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583e84sm143807005e9.25.2025.05.19.10.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 10:40:33 -0700 (PDT)
Message-ID: <1296c1ee-cb0a-456d-b5b4-e6153928d32a@redhat.com>
Date: Mon, 19 May 2025 19:40:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm: ksm: have KSM VMA checks not require a VMA
 pointer
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <cover.1747431920.git.lorenzo.stoakes@oracle.com>
 <daf12021354ce7302ad90b42790d8776173b3a81.1747431920.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <daf12021354ce7302ad90b42790d8776173b3a81.1747431920.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.05.25 10:51, Lorenzo Stoakes wrote:
> In subsequent commits we are going to determine KSM eligibility prior to a
> VMA being constructed, at which point we will of course not yet have access
> to a VMA pointer.
> 
> It is trivial to boil down the check logic to be parameterised on
> mm_struct, file and VMA flags, so do so.
> 
> As a part of this change, additionally expose and use file_is_dax() to
> determine whether a file is being mapped under a DAX inode.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---

Looking all good :)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

