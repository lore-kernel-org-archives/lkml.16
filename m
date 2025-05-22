Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ACB28934B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915799; cv=none; b=KBjSwNXZEijHNkTGl7v3rFJ/4iITAmpQaFPBFzCQ7BPG5w1YQ/MWA9H/4l2FKm9J68GKJGj1MMahwSeQVlAHO3hi2zomXu0a/ZGH346qUZQWsPITzZgHAsAlYx6xmsXlnW8SNuU0P8KJUzwVt+/xrbdWI06qKsEXv/urrtqisbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915799; c=relaxed/simple;
	bh=5rW1vHGH4iGZXXFotChC2aJYTsJnuFJygn8KK1nlFJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIH+KfZpz/1arTOZ2a5PvGLltBoeo5oUqXVQcTgLSKJHrVt+7msnNp5GCMaaeCWlgczWHfAjO28CTopipPOmRNc1y8nXU73NwFz4eHi1LU7q291kGZAPTl+nqGCXdzlI9fCds2ujXuX5Zocws96IA11UZTPOPMWljxaDsHcLi6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GauTPHzm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GauTPHzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747915796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h63Vh9AcL+XQZbWgxx9VYchL1II9slKpRWz9Edq0vFY=;
	b=GauTPHzmNZ5GdWtzwQgkloorjh8VSlqCuwDxTI63OZOnpuhamDSm0+p5zyAM9CLPAhnJsK
	61iHQfQFsuJ2BR30LQkR227VhnpDjV8Hj2kb8aeD6UWfMrjPzZexpFTX3IL7yCxLyvcITP
	hrsz4tA1InCld0qUVCLpbAIX8cGMGLc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-8o0D6Cf6MWCn0HlMA0UD5g-1; Thu, 22 May 2025 08:09:55 -0400
X-MC-Unique: 8o0D6Cf6MWCn0HlMA0UD5g-1
X-Mimecast-MFC-AGG-ID: 8o0D6Cf6MWCn0HlMA0UD5g_1747915794
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso3377999f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915794; x=1748520594;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h63Vh9AcL+XQZbWgxx9VYchL1II9slKpRWz9Edq0vFY=;
        b=B9YXgW1lI8k/xrlkD6Lie8JOpI2/+dydO/R2ll0rTNAfZf5TFWe7s4wvvHyPJ1LHPf
         v7JZXOdNG21DblahQ8CLFGRpLfftRwXSlPcxh4uwS0urAvKzwIO8K4s1Q98U37+GX/Hd
         +2S5dqgdQXZ6kGpWm63ISQnB3O+j+cnvwNThqc0Mme8MHlu1k5t3wgnULPtapRTd7iet
         Al6geHavbcIUsRacOrBVVVUpNILOT2PMdtw/r6FqXs/4wcRLsvrmWHStT6r/j6NR33a3
         jX9fZ3tBUNz/buvyFFK6YZ4FXiShyPcHh2VmwTmO1b3it8r8LmGr3CV3NqwvTQNzG1zb
         XmEA==
X-Forwarded-Encrypted: i=1; AJvYcCVSk+DJHsxYi9F/C/8fAXCuN8mPTFjU9gscYJb6VVsS1JMvB9lqGdYKZgCFd00BKBQQkzGxP5M2JKz0kPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpO5h6IEdtM5IpU0enK7/xp8/qKyAocyR+Bu6VAINjr5U2wloN
	okeIuPwJ7hQqSvQlSqGwCuOjJX1uk75mgrxOPE5T8OT3zchQkUxG4eXr0TuFNILDWwHsRLEepzB
	Z/UU7SCmseWAgzjfClAn7om5P0nSulWscWz1urRJUS5USxvSIMvld6vqLsLrxoBrqHw==
X-Gm-Gg: ASbGnctICF1GUDSHvDiJGbLXiVFXdg4FqnQLUY5o65mS5FcO615jY5vXAo0zXHCH7l3
	nsMFUe7nAxUaUimb4X5oSIsiMzRtI7XoHB/FTUpBTvIesTY71/q+Dr2ckQ5Tix5ryVW/ECptsM4
	UKJgv0DyAdgwRvNDcoIZW3xIUPl1Qrk74OzQxBCBLD37FN2E0mgC5U6y+zCGkx7/2+mgE/pwcRy
	u4RsVCLO0allCwT74csfQke60w9aHx0XU2XH7GFfP805vUkiE3MBIjR0+MD+SaTetW3yr0rZ+5/
	pvL1zK4aVs+6uzPfrU+16rYFMYoucy6bgano0Q0FK/jX8DzGt6tk7G76YryLODIDDfRIyy4J25G
	zfVVPGHtcOcxo8K4DXZytZRiDtWpzERyJZNEf2Bk=
X-Received: by 2002:a05:6000:2085:b0:3a3:ec58:ea81 with SMTP id ffacd0b85a97d-3a3ec58ef6bmr7406359f8f.42.1747915793866;
        Thu, 22 May 2025 05:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYHSIxI4JjI+m3HcB49s/0eJ6cNUV1jaWKNAeVskLvVaYMnsSZmXfYw51Uhm4k1N8gwNn0Mg==
X-Received: by 2002:a05:6000:2085:b0:3a3:ec58:ea81 with SMTP id ffacd0b85a97d-3a3ec58ef6bmr7406324f8f.42.1747915793483;
        Thu, 22 May 2025 05:09:53 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef01besm102300665e9.10.2025.05.22.05.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:09:52 -0700 (PDT)
Message-ID: <de532851-aee0-4841-b9d8-c4ffe3f576dc@redhat.com>
Date: Thu, 22 May 2025 14:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drivers/base/node: Remove
 register_memory_blocks_under_node() function call from register_one_node
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
 <a2cc58f18dc984fc9563b9c10d5708cc92ac579f.1747904868.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <a2cc58f18dc984fc9563b9c10d5708cc92ac579f.1747904868.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.05.25 11:17, Donet Tom wrote:
> register_one_node() is now only called via cpu_up() → __try_online_node()
> during CPU hotplug operations to online a node.
> 
> At this stage, the node has not yet had any memory added. As a result,
> there are no memory blocks to walk or register, so calling
> register_memory_blocks_under_node() is unnecessary.
> 
> Therefore, the call to register_memory_blocks_under_node()
> has been removed from register_one_node().
> 
> Acked-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

