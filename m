Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB2323B601
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750187218; cv=none; b=Jcw/DhL0VbDgUI4t6R60KN8qCgia0c0ZnPIaqx3U+H4hLiGcFXvMYVYCwOv/sbI5UhK+ZFYCPUyBpu5MkQ/5mjNs1ZR1qO/PhlIDs0s+r0NNVXVtWJNf+QvCPbPEO5v0BcwqhstSWmG8uVfysl9w42TOsfbT3QVBFet7o3HCuA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750187218; c=relaxed/simple;
	bh=NjEpyV2reoKmQ4OMokRWXfa1oJ/gUjEW6p79Pm7ZLwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFUuWwKPIvTMqUbPPOP3JmodCf/kwZDOZAz1ePefRPC5f1GwPUw0aWYx4KtOhSuKTO5xicJ2qkPREJroXHwfuRoBOJgSOhGGCV6c+FGIrhFBdK8r6vHX476a8rIy44lgzACFAgiXOfACeg44b98WN1LRHx1ALjOt9nFWRMleWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=btNblDtt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="btNblDtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750187215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NklbRWjlj41SMrVzq/iYuJR+yK8O3heQ8KVXCc0a+xQ=;
	b=btNblDtt0UOXjzkPa6yMDYyer03BDHEsr5Q9eenetJiVI3eONs3gAoMNeZWF/9EDEixvvP
	8TswsAWcYaekStI38Mn4CkhnEyXog01ZAFzBB1vUsXDzPqvlgeYv5QdmX37CAu9y/dNhJB
	y3L6+xN+ewE0iNrYQwX2GC7N6Kp0u7M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-wHk0DG2HPJiNxaLl6KCqQQ-1; Tue, 17 Jun 2025 15:06:54 -0400
X-MC-Unique: wHk0DG2HPJiNxaLl6KCqQQ-1
X-Mimecast-MFC-AGG-ID: wHk0DG2HPJiNxaLl6KCqQQ_1750187211
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so2205116f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750187211; x=1750792011;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NklbRWjlj41SMrVzq/iYuJR+yK8O3heQ8KVXCc0a+xQ=;
        b=maLrWkiPb4HpQ2a4gGWY1PG9evBwEHbRYUqGaO5Gv0La8yUlgcu89M0EhW1Lcyw/AO
         NjSSJDb2sXfRHZM+R3ko22oZjJlT/kgWPWkM/tOFEoQ3l20ngMWB2ZmyjFfrHyJP7nwx
         ypgz2GEWEn8OukbrGxpVlMYarIlpSOkQOYCVN9/2UVDgHJEhgwr7tRI6EgEQz37mju2n
         EtP2uRoHk6YbdVun8IrZhD9mTSSGveuck2INHSU44Z4CIs+3wcf2T0v3+KY2f5Sfqz4X
         eJWY027ZmyWPiRyrOyyHkDRwUUiVRjzy7aRW+re2wizWl1iA94usxp4DS4jlfShSh1DB
         r8SA==
X-Forwarded-Encrypted: i=1; AJvYcCVjX4Fp/1kZBZVVI2nlZFsJ4xjrrLRgw3B9C6kWfuEabBEG9tdKyjZmpReFDNulM8DJrtGanqlP6TFPhE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeOVW/X36APFssuwY9YASvD0kkGYL85AguzvWkY3D+MFr1f8Z
	KsYV8DYDf2RDKgKio7UbjCDQKreF7jLtHbDZ0SXGcZ1K/k0vKeMiTN7IR3qTIAM8YzIPxUkPpI7
	Wi442TlA0k2ZZd3+LO/fpj2boeij2Zmz3jBQVGbtrPiDwSXg8kNqEKuLmEN56uqE5tA==
X-Gm-Gg: ASbGnct7e3g56d+OHhSZ3LUobUQAfJtoK85q9wKbBpvoMjwsxXCFPuaSOb8nU3c4Gp+
	BjghZgIqm+/yWnqsc7DPgplrvzubEY9zzzM4HtjyQmTH+5W1jjR+xRqwSR8MuKDF1FePCSKKPLt
	5qdHgsjcpmGXBjhbHQHPfX0+gNq5/ue8r64MiPOSWMGYZlg14qyea2/PGENvOmoVT6a8WZ+X/Ns
	J3phHyxIW6N975CrrpBX9uH3nRNk2QE9jJcEhUAlVGx/jG4kn/lsj7niSq1hOx8B0Rybnj6kezk
	fjD3k5YfORcb4ttoPCNTgLirbCMSBDF49thet/t0FiaQQAwcMzcsxaN32NY8w6AX8f5lpGn1fIz
	wu5eHM/Eqsfq9s3PT8S/nwOMvQjgtkuyFFniAp/c6getZA8U=
X-Received: by 2002:a5d:5f95:0:b0:3a5:2cf3:d6af with SMTP id ffacd0b85a97d-3a572e2de24mr10917846f8f.45.1750187210702;
        Tue, 17 Jun 2025 12:06:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPCi7rlqaHch+kEXx24PXaoIRJ/U1Q9R2CPVgTiDXxmvF0H2GmUbbk8Ms0B4qcR9rQ3B5Edg==
X-Received: by 2002:a5d:5f95:0:b0:3a5:2cf3:d6af with SMTP id ffacd0b85a97d-3a572e2de24mr10917836f8f.45.1750187210286;
        Tue, 17 Jun 2025 12:06:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a579808c24sm10008277f8f.43.2025.06.17.12.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:06:49 -0700 (PDT)
Message-ID: <c73fd105-8dc0-4446-84a3-53473c94b1b5@redhat.com>
Date: Tue, 17 Jun 2025 21:06:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update maintainers for HugeTLB
To: Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250617185910.471406-1-osalvador@suse.de>
 <8173e254-f129-4f02-98f1-f9b98374a8c4@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8173e254-f129-4f02-98f1-f9b98374a8c4@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 21:04, Vlastimil Babka wrote:
> On 6/17/25 20:59, Oscar Salvador wrote:
>> Change my role to Maintainer as I am quite involved in HugeTLB development,
>> and will be more so with the upcoming HugetLB-pagewalk unification, so I
>> would like to help Munchun take care of the code.
>> Besides, having two people will help in offloading some pressure.
>>
>> Also add David as a Reviewer since he has quite some knowledge in the field
>> and has already provided valuable feedback.
>>
>> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> 
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> 
>> ---
>> I also asked Peter Xu to become a R, but I think he is currently too busy to
>> commit to that, but he was happy to be CCed instead :-).
> 
> Not sure I understand. R: is the way to get CCd by get_maintainers.pl,
> otherwise only the people who know about this would Cc? (unless they
> forget). Or you mean to be CCd on this patch?

probably CCing him when there are questions on specific patches.

-- 
Cheers,

David / dhildenb

