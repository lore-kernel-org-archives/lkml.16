Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCD82BF012
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154490; cv=none; b=mdbWMEcXOaWZddOF8ar5JsTuAZsX4BqRsdAkCyYkNZyLvryovWmGbIfbMrgCu2IgB6s2SgzuwMe2wrNOkk4TcHNEhzK+EsvUWuwvpZ3nSeTGppYL1tvEElvIXB1fRpQIuV1DNCb/CoFD93LOOjM0bvGjG55U9MBZ/7xWF0jqmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154490; c=relaxed/simple;
	bh=1+g4UL/ZbUbWma9cmkwoDF33XCkJLFnFFbp2O2seKEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mB1hf7zcfaIA3SurkQsEB94pSxq+j092lzUvUz/usO0kYJx8cKKto79js4IyDp9zARCLpG184+CJTI+UckQcMyC/YoKtYUpsKl4qv898AFP66YQ/ERAGnhsk4mLW3cw2BU1W3/pm2Wr65ePRILhvl28SO56Ps1YctrUVtMrI9Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e8nNhMso; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8nNhMso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750154487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D2LAVh7uooqp9YTil4c+HDuHYaFshlYdQO8r9BWRYQs=;
	b=e8nNhMsogFgey//0r1Zwvznjgf54B25XRfH7jhrk/NNEd16C+eeB/UMxAkhahV2lQe2gFn
	alxj/g+l902fB0/hVyIVZGe2EK63K39YgM97M1WSr7hUxZNeMdJu5eJm9KLtMp3DR43sRm
	8R8PMiP09bT0HaldWk5QC4QcxE1ZkBI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-tUdoCWDIPBeCalayE2_pDQ-1; Tue, 17 Jun 2025 06:01:26 -0400
X-MC-Unique: tUdoCWDIPBeCalayE2_pDQ-1
X-Mimecast-MFC-AGG-ID: tUdoCWDIPBeCalayE2_pDQ_1750154485
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a578958000so1012201f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750154485; x=1750759285;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D2LAVh7uooqp9YTil4c+HDuHYaFshlYdQO8r9BWRYQs=;
        b=MgyYZk/YKpUkTN/539fqjRz4nbjUzsFiL64x/+Z6yKkIPd3tHtR03Fws6fSAGzwcnh
         6tK5aNatoSR8AW4pxvbdHzLEmxN8cfdna4oS1hGKa0jfzYZ2msYhDlkEDqB+7k60wEZJ
         RSrMYZZlrX9nTJlZyfRBtO04/MvGVvBipu4e/qH51mwVxd2QcxRD2WTCyahUO7pNSl3e
         utJOzNBr9q3eN2EJYQn5b1GJb3mqs2m3+uoOkgh8yompq4QXIjtJhSRHdJFyp8dPfQRG
         fx5c30G0Ti1JuUiT8hTzZgeyj/MJ+ZUxhBO9JKhxdzkANeTn52aLiG0Mq+kGvmnb8DvM
         fsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXznPeMiNYl/6Q4jRYd5FTzP56YP7Wa+2bAMbYHA6+Frx7wzWl+GRTA0INdVFNs7EO5/4f16U43x0nWABw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/OHmnVvsZ8kMpvqlkCodWDZREw5mEg9yVGaeK1SCxnNMzl8M
	FSXw594Z/QaZ30qRyojHj9Cn1NIubXfQ6A6w3EEM/S+2M01WXYZJK0Y+ndq7I5PIwy7lZcIatFH
	E/T1dW2x5EpVhPAgsXyZIwhmMiq3tNbKPWUY39pDhJfbje+LPqd0u/Kd5ZPaH7N+C1Q==
X-Gm-Gg: ASbGncsBeIwG9oEst0XYJznZpAKRV+ufq9caaTymb7NsFtdxmEUxKASyP0iJLeKSmGa
	3/7jGvIFP5mpbzXNjLkoKkLBa5raKuTsMpaHx3p/RRW3BousCp0hDOBblKxv56v8WV5neGAVf8l
	eIFv0+k6Qs8B/FLE/lGO2EM969ehyhtK//COPhhGDWcCvt3GohDg0eRlrnZMIUIeXeEBxmuEXFJ
	48Psk45dd5kXSHnGohpTRmdbILAX2uDUxcgC4+yPV2+GjDbkWbgTggiDaFX9F0VGHD0Oc1nil6A
	sHF3EbNy0gNyGgiRMZQewPv8xd5gMHwKm5752fgLUoOt/BiFrtzL2NsmDWO2ManCZHGpbUo1pPn
	X3DuRBubIJ5SmUzURBdc0x5swdcH1Yk9PZzivh2rQN/Ox8SU=
X-Received: by 2002:a05:6000:2313:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a572e79c14mr11339356f8f.31.1750154484996;
        Tue, 17 Jun 2025 03:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTXNCkLmBvsL6NJZzQRK8Qbb7IveX7nHFiStMCOZRB/q+yO/BndsXKTxPhoipM8hgYJlwV1g==
X-Received: by 2002:a05:6000:2313:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a572e79c14mr11339302f8f.31.1750154484571;
        Tue, 17 Jun 2025 03:01:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm13350973f8f.2.2025.06.17.03.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 03:01:23 -0700 (PDT)
Message-ID: <cd942b04-f655-43bc-a238-68266d21ecf9@redhat.com>
Date: Tue, 17 Jun 2025 12:01:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Harry Yoo <harry.yoo@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Jakub Matena <matenajakub@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
 <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com> <aFENQMQUDx4GeMuc@hyeyoo>
 <b6ba1a37-e26a-47d8-aa56-91b8bbc70220@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b6ba1a37-e26a-47d8-aa56-91b8bbc70220@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> I really wish we can find a way to not require the fallback.
>>
>> Maybe split the VMA at the point where it fails, instead of undo?
> 
> I don't think this is actually possible without major rework as we've separated
> the VMA and folio, page table parts of the operation.
> 
> Let me put thoughts on this in reply to David so we don't split conversation
> (pun intended ;) I think we have other options also.

:)

I'm still trying to wrap my head around alternatives, and possible 
simplifications ... oh my is this all complicated.

-- 
Cheers,

David / dhildenb

