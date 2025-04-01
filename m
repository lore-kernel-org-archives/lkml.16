Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE391E9B22
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495692; cv=none; b=CWutRZTSiLUqzqWrLIUci0khDOeUkw1fX1oJKSwSkDTE7filQ9c435mu2PiwwzsyA3zkWOUUufYWkMGD6S+RuRYb5U5xifyF70Nph8NJ98SU032FQs73Kcbpb4A4EfpfmndI6jveXc0kvyXm6sOt8mNjdsAlpgUEeTXwDzQxngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495692; c=relaxed/simple;
	bh=erAg64H5JzF4KOwEBL8w5UwSY0ziUFS0x4UX3Gz7LuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aatMM5x3EEuTO3kfh7HmE3dUnFN7g/KT0kZqxMugVenJ+jmN7SgCr7x+aHGPdGzazu00dJmnIbKT25rP+Hh5LwMDZTdxsz82IhYT7WiXUWzJd+LdAE37KIr5f2LyZw2WKrF47I8fhNzkz5rp6WUrFeq9Je0x2DYfV0pc4Q8q67k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VmVv+9l7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VmVv+9l7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743495689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PmzklFDXuEZJS1m9bkBKHZnun7luvYIXYrbHBw7L4oc=;
	b=VmVv+9l7MF2Jq/qNmIOfOAnoE3KR52IEfByZAUI6qj4NtGDWgI6gOyA20ixBQUBIG67DKQ
	0UDTETHptWBXWnrZhuUlnL8ZfKD/RTuL1lBCv399HsReDlkwBKJw1Plis4v1bGllCrtM/S
	Ot5FSFvIjQJrNPTzWoElquGocDkVMJo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-r4FntU_IMzm1Nn6tm78D_Q-1; Tue, 01 Apr 2025 04:21:27 -0400
X-MC-Unique: r4FntU_IMzm1Nn6tm78D_Q-1
X-Mimecast-MFC-AGG-ID: r4FntU_IMzm1Nn6tm78D_Q_1743495686
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so15853945e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495686; x=1744100486;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PmzklFDXuEZJS1m9bkBKHZnun7luvYIXYrbHBw7L4oc=;
        b=GlF0PMYf8YjgytHh0K0KyMiW6LGV3SGbISsKYVKYzpbhPWz+NaTMZ19g5tIcExfDS6
         luQeu/fMVft1Fw6FeNoozBgak5q7WFBR7ZSvy+E5CJ+JRy4Ze1IQuna+/CgmqWF9yupn
         HIuxKfuhmA95PkPaGXnF4N7J56OmXGxO74rDUWBdFimdxe0hHqH33s0l5KJEPsA5L3XR
         /HxX615Y2X6cSbxebw4USS3D+px1Iw2e27ekohxPqThy5KJeIRXRFCw/IDOMpuEE2LUC
         4WuupQLFKlB8hkJrDbvzwu+tkAiwsIzR0nw9w/l7L47wO83Rj1XjvPfdOjM9rgtMZLtl
         EAJA==
X-Forwarded-Encrypted: i=1; AJvYcCUvof87ggq/Y2vf4L7vX/w90P6I9U6CxLJYMirZAbIdo86Fk3yPQWx6atmP5swaBlRHTDofZEPbbocNA/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVA/d6nNRDsrqrCQ7Y2oHE078lVXm5AeX4lKjX6kgI2keo/ve3
	w9Likqyditt6kj/mscVzUNqvh+OWUfD6TKGgGg0cCW9KErVMDYx5pfF63wKJdLgEQtVl30M/Yw3
	E68v4/j0+osM1Be1QrVIp/lkrv1AqsThYKSeZZVVoKM/1uIAb+2uze/Vm10OQZw==
X-Gm-Gg: ASbGncsZzgl9A5UZHupJqz6zz0R3aJkCfA2+wV1EIS8R2psfLPTnpPgLHf6tT2rPjrP
	yavORhWdGpzNOnh0G+FYRIOGUzsoeaBllkx21/vNKUa0Rr5rzxa/kBMuZLcCO5y5NhaqutV7qqV
	4ug391m1kXlGtof9+1RYtosRNhFyiPX2SWlleUNB8Ilz+h8WekX49whthAWZ29a8v8BddOP4Frh
	MUmdO7XCQJ5il+W9DyhuJ+hgTFMlL4U7XbpDiZSrtayAzewOXlPGyj46X8aMLk1K959T7SeFZps
	mn7I6ncl7DXOG/11FCNlmsvnISApUDpR91PNco1nduE/RNEIIoBwCfvs8/dq/DfFGAGWCXalipp
	aB63XMnzVgMQMFSOiLGzjn44HvRPOrAyrkEw4ZYnh
X-Received: by 2002:a05:600c:4fd1:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43db8527142mr117393545e9.31.1743495686233;
        Tue, 01 Apr 2025 01:21:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtINwagq0snAds2FFb+sX9VQeIrTCb8h3/r3DbQ87k0g41CIwVU7XL9FVUU134tDH1lGe1ew==
X-Received: by 2002:a05:600c:4fd1:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43db8527142mr117393355e9.31.1743495685942;
        Tue, 01 Apr 2025 01:21:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff03715sm149329105e9.31.2025.04.01.01.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:21:25 -0700 (PDT)
Message-ID: <9fdbaec7-27d3-426e-9089-8447a8d6f4ea@redhat.com>
Date: Tue, 1 Apr 2025 10:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86/mm: remove pgd_leaf definition in arch
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev,
 x86@kernel.org
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-6-bhe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250331081327.256412-6-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.25 10:13, Baoquan He wrote:
> pgd huge page is not supported yet, let's use the generic definition
> in linux/pgtable.h.
> 
> And also update the BUILD_BUG_ON() checking for pgd_leaf() in
> pti_user_pagetable_walk_p4d() because pgd_leaf() returns boolean value.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Cc: x86@kernel.org
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

