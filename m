Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC5211297
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682889; cv=none; b=ZnZM0nbn6b1DAycsZryZ0EkK2vNAolxkGediomtQNRXlicGFFkpmJbPe+Pvv+k+mxJUlCHABvL/LvKQQUNiXexpnsT7VEWciT+5IME6NMoX0eSeHzDByFdg3FaZ7f7xCuq3JUCkNQikH1Kh9Y4C+taGJv37RZFTG4Vxn/njshV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682889; c=relaxed/simple;
	bh=2jMJ4qG5PKHly2MQR94Rkj0h/xPhqfeJw+aExviwfkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkXKH1UWau1t6PFGXptvOaUTZEadKcsOeskwdGZtTbwhLTt2MKVwfFqB8+yqavB56Abbz1+oQqo2vGVhqdVE1WvyhAYD3PCRpi6aeNhnn4pdPlL/VwbVoJmHGar6yJdwf5yrP0+3bGhj9Lh9545Ov47W14K68GP+vR6IO0THFJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNbvWoQl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNbvWoQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747682886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qVQZc5INnoqutZYmTut12ZA5XDVGTeIuyWo7ArztSjg=;
	b=DNbvWoQlyGI+1MukcRo2/gFk61hsTKyJ84BOI5zZMPfGiTCZcWLV4JXyISjMKyeHeju6U+
	TJOFpepP8MPP4SlMIVx9duGDVdgt80veRdJZe8patZpoxJPa6V3DRthTs7bmvFLJwcPa4u
	pgX3e9VU1IOKOfjPA9RkvQebig7GGGo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-Aww4PPueOL-cWpg-aliphQ-1; Mon, 19 May 2025 15:28:05 -0400
X-MC-Unique: Aww4PPueOL-cWpg-aliphQ-1
X-Mimecast-MFC-AGG-ID: Aww4PPueOL-cWpg-aliphQ_1747682884
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso42732425e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747682884; x=1748287684;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qVQZc5INnoqutZYmTut12ZA5XDVGTeIuyWo7ArztSjg=;
        b=PBRy2i5Ve/ii7E5E2f629XO4CePzlslg+PXWJUVH7fuxNF4BeX0A9H8p+2MCgPXuPu
         4AJnkaS6pOIw4aq2AWiLpYZALKYOCMPZ7ghmrB6X+35CQ/lopEtRWf21AwzOZv9P8/Y5
         mFTLA2KhFu1vioHtYZPhnlJBXljFkoYagD3tGau2K9SO2QKQ/ipCduOEqtmsQooCklyR
         mjL3Rk6SB7FTncwmbiuIy8QYo55m0hbXqXqYQ2Ve8TH1du9B/8rX0xGQVjR4yU7t0749
         y+9OGxxyih06963P5ZoOxgCCrZhJTaSh+1xPcq/C+EJR6FNrEZ9cwlxzRERVSXYjxs1g
         N61A==
X-Forwarded-Encrypted: i=1; AJvYcCX7z6XPf63ASPeFxT37I/00KX594OzMoFEDIwhkIfz0ruhfso7RxDBk9I+/DuySYJd6/jZaykf5B0J06Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHOmwc4ynQnGYAf3VUNhSEGCuUQ78650hAivHaVE3Qvjfaj0mD
	z7moFW4GEbt6Rom6wPU/peOyOLB2wVzIfTdfTIoin9jEFGIIWhZW2CDX30FCPtUopXYIGmt/zXs
	xuv9mm/rB3l9PiHzm74bfdQu7eaDEsQbTrnRNqMQebUBz7QtmVaLQdJCJcIyZvXEfJsNTXoSzG8
	n1
X-Gm-Gg: ASbGnctMFTxsg76maE3KjEtnJPUQFrPEMiP50GrqbfRBavgY8YO9TYkBC/kx1tmuqGe
	M9ySTF7xQIaaRD+qv8bbxVUNQuXrbZOWDgS+w4NmuLmaIAhucwbcLdQ1npPKaF4iOD/P91oTYUN
	fgmw3fMOVAucyuur0U3+EOAWAEYUa+a5EGazXnJ28YftKOVu07weHudABEuUYKvAzbABJOqCdP/
	R10hnhuuzh8Yay8yjB7Y/Z1ZLipU+j+vbgGaZVoUPkwCoFBsHCS3g+IP/x+6JmSk97nqNCzCkVL
	I6JMZREQPZ0cpySCNQaq9D57Swg2Pp2Shw+8qSbXzO2t2xb9dZ0g0cNrT977VonV7VTOOOaFI0u
	ovyi0FnmXdeL/c/BP4C2YwANCV4Zn8Cc48nbHPB0=
X-Received: by 2002:a05:600c:c1b:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-442feffbb8dmr150315545e9.17.1747682884059;
        Mon, 19 May 2025 12:28:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESb912KpWPc+1WCxDZznxhcbTv/hYw+6+52hmHHhfCLzW1q+2VC3U6RSKNRPFkZUWbVZWovg==
X-Received: by 2002:a05:600c:c1b:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-442feffbb8dmr150315345e9.17.1747682883673;
        Mon, 19 May 2025 12:28:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm736785e9.10.2025.05.19.12.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 12:28:03 -0700 (PDT)
Message-ID: <de02f1cc-558b-46c5-add9-5c55385c409a@redhat.com>
Date: Mon, 19 May 2025 21:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mm: prevent KSM from completely breaking VMA merging
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <cover.1747431920.git.lorenzo.stoakes@oracle.com>
 <418d3edbec3a718a7023f1beed5478f5952fc3df.1747431920.git.lorenzo.stoakes@oracle.com>
 <e5d0b98f-6d9c-4409-82cd-7d23dc7c3bda@redhat.com>
 <2be98bcf-abf5-4819-86d4-74d57cac1fcd@lucifer.local>
 <e2910260-8deb-44ce-b6c9-376b4917ecea@redhat.com>
 <fed73be7-6f34-48b9-a9c9-2fe5ad46f5ba@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fed73be7-6f34-48b9-a9c9-2fe5ad46f5ba@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>>
>>>> So, assuming we could remove the VM_PFNMAP | VM_IO | VM_DONTEXPAND |
>>>> VM_MIXEDMAP constraint from vma_ksm_compatible(), could we simplify?
>>>
>>> Well I question removing this constraint for above reasons.
>>>
>>> At any rate, even if we _could_ this feels like a bigger change that we
>>> should come later.
>>
>> "bigger" -- it might just be removing these 4 flags from the check ;)
>>
>> I'll dig a bit more.
> 
> Right, but doing so would be out of scope here don't you think?

I'm fine with moving forward with this here. Just thinking how we can 
make more VMA merging "easily" possible and avoid the KSM magic in the 
mmap handling code.

(that early ksm check handling is rather ugly)

Your patch promises "prevent KSM from completely breaking VMA merging", 
and  I guess that's true: after this patch merging with at least anon 
and MAP_PRIVATE of shmem it's not broken anymore. :)

-- 
Cheers,

David / dhildenb

