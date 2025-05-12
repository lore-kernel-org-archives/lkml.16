Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C45F24BBFC
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037054; cv=none; b=V+lPq7hKdaD334jQ6QlXuhPPAPAYmI8f7Igy9aNveiciy6hf930lwKyLoV8vrFQsOeri1uYkROx/5cbSaovhi8EgS+VL/W9BvsxuW1Za8g7U/onpDB8z/lBppzygqQcNPuph1R3k4sIOB6Q7vym9RWZaacFHcHAMSVHnTPso1wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037054; c=relaxed/simple;
	bh=zoHzDkNVBXQ3VnGYqne8f2jmODFfoOLwceOzS7BI5fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHcmwpSwut1uvbvgk4fwS1LOnyQzomhLPlvHBHtgC69go+vdCAf/BBsne4dYGrojyYROfNaqPHWemSx7Ve3RliJ9TZtO2hULq30nITR3tL9FlhvJ7ZAORYO18NvT9mozO9xQSLStlS7lh4RsR77MxcZF8jqLwSGXt4xCNbTYnhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L00Vif0R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L00Vif0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747037051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=snh+QH0TbxAUQf/zaDf9CC8oNWPv+0lvMb/p+68WcTg=;
	b=L00Vif0R1QSHRvxUHLth32QDSK/g5bBPqQU9o2y3VkWZx3NZ7AYlXNgOEuk7QcVPRYacZE
	5PmDxH9AQY2Qvqi2HIPPrJwZQq7W5bZvOh1cBwrg87UE3C4Ks/fnV3v7p82o7i5r64VJ50
	6FZ+ajP3UCzwYDSv14IINjKW+gq6myQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-IDDTchPeNTONYwQtTwW0hA-1; Mon, 12 May 2025 04:04:09 -0400
X-MC-Unique: IDDTchPeNTONYwQtTwW0hA-1
X-Mimecast-MFC-AGG-ID: IDDTchPeNTONYwQtTwW0hA_1747037049
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442d472cf84so18132355e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 01:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747037048; x=1747641848;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=snh+QH0TbxAUQf/zaDf9CC8oNWPv+0lvMb/p+68WcTg=;
        b=t2k7ImjpgGMfeunWi1Om4A6n2oXs8LF+/oqIB1/U33gYtc+5sM8AgKYqDB/Dojb4EO
         AFR1rLmi/835Mm4Fn7N0YT70k5E4paIMuu9pElyobtoKGryEbEtIXht8AyT3cLWs+QFx
         aM443FK9Iz0xSjclzN+Mn8e9YYDUT2si094bnuB3k40PfSNZKm3ZAfGc0y3NHwMp7Tvk
         IHNgpCpWU8dDNyd8Pw7ef6izHF5xfaMw11/ZF+6P/A2LOQNpunqhcU+G+1SIyiWMrwDb
         P7NjQxDdjukL00X6t0pjgoTZxQXoeofY8b9KlwGUe0FI0h59WkUTiNQBmu0L9w/fVXcy
         8kog==
X-Forwarded-Encrypted: i=1; AJvYcCV3pYFvC0UeovjZmVEcqHMpWweMahO5ToYjmchSaQDnDvpGuM61ac5373QqUY3fQs/5BUoDgffx3UgtnqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1w0YD+CXDVRYimwH7HAz96d3RBSzheOwREWM9uWNZVdlCYaj
	dRXiRrpZjTtEpvrvyF/oquXEUoqLc6anLDE5U9Dip0vCJ60xpQBZ19MGr7TA/+FIDPYGLWaAyR/
	UYrHoEu+wySXt7Qe72pta13aTux+fP8U2N1/TMmmeXPPCy5sRx3WQ6WZKiiYNTw==
X-Gm-Gg: ASbGncsuYCx6+TKKKVaKCwpfHxgFJyjWpMDL/JdJraVB9QHdSk7fENvdL8lIP67ZNQG
	gyiB/X4/NDCFnhOIB7SFJ+el9qRag77g0HGHtKfRyFyiy/b+6CoVFgxx4nGZA71Li5inteE5Src
	kr98DAfbr/jpPivGW/vTeqy2zm/4gVGmpYjkKzSrUxcsfbVrtnglMuF02/VStXgM7cWRRBRuUqI
	zt2VFkHK+jHxl7BTqiuFzFnFkJrHp/jpw/vqQJNlIpedS4vOqBL2JzaXWoP3XoHO7wSUyFRb1rV
	qAgv8LI/xzXrC6MjFGW5iQ2ZZ/V8frxidhL+bgLlYv6Nj+yJabnfSNpdBf5TXxX5P1C2yLunRrx
	GHIxi8iaSMSphdT778dKp0Gn61h/yoyDzfjTQfRg=
X-Received: by 2002:a05:600c:8707:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442d6ddd6eemr68641375e9.28.1747037048576;
        Mon, 12 May 2025 01:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkHVIHF4pb5dUD1T9Fxp/lx5W/pjUXab+/+VsXPDd38chK2PxVURWXqFVGiF76z04cuc2y7Q==
X-Received: by 2002:a05:600c:8707:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442d6ddd6eemr68641125e9.28.1747037048190;
        Mon, 12 May 2025 01:04:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0? (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7e26sm159121325e9.37.2025.05.12.01.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:04:07 -0700 (PDT)
Message-ID: <5988076f-90c1-492d-aa44-b2ca3882923c@redhat.com>
Date: Mon, 12 May 2025 10:04:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: convert do_set_pmd() to take a folio
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 willy@infradead.org
Cc: hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <110c3e1ec5fe7854a0e2c95ffcbc985817180ed7.1747017104.git.baolin.wang@linux.alibaba.com>
 <9b488f4ecb4d3fd8634e3d448dd0ed6964482480.1747017104.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9b488f4ecb4d3fd8634e3d448dd0ed6964482480.1747017104.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.05.25 04:57, Baolin Wang wrote:
> In do_set_pmd(), we always use the folio->page to build PMD mappings for
> the entire folio. Since all callers of do_set_pmd() already hold a stable
> folio, converting do_set_pmd() to take a folio is safe and more straightforward.
> 
> In addition, to ensure the extensibility of do_set_pmd() for supporting
> larger folios beyond PMD size, we keep the 'page' parameter to specify
> which page within the folio should be mapped.
> 
> No functional changes expected.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

