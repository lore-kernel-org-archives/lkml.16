Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E4280A5A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749451221; cv=none; b=hRoyUGCJxrYPDQuf5PdR8TSSR1xAkNWh6bxB65D18RwzMfzxtvJ2HFygKLeqbt912nKWhWwVXfEAsXabZG1RRHa4mZ+fCEfptToCC3XrK8Xlbd3eCHDwRbK/Am8n+5W7BXP66zR9/bO9peh2oua6oCf6sCsbHhz+6Akb/NcohxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749451221; c=relaxed/simple;
	bh=kXSN7IFbNHOBkSOAgJX49pNmraL3yKQ5OMPLuq59bHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWRA+Cn3UK7k091ixYRQKD+mZOy09Rwt0MRgXzj+IB6uCnLYl9CBneSrxoMxsBouNLIs/JYukuJF/Q0uoh1FWvd1aw+2Rsi/uhk8xlyw4fovQbjabAVYbtCQ+FtgH0rBz32CpnI6AUVKJywMvdZX4i7orvfym2VShLhEF92V8OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KG+balfo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KG+balfo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234d366e5f2so45281095ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749451218; x=1750056018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOBnPobGP9YgsM1Pe2OfLfTXXne+220yuokM6yXD+2Q=;
        b=KG+balfoRbzsX+H3iaQiuqc9t9Q1CEhxOkI5ZZ0f0ZMZZeb53srZw6vmwlsjTALawO
         NIf0cy317CQHV4nM53UZs+R7rRaurDWMHiYgkZ/hQWMkcpWDaPRRHlZZ2QOdRapBbI15
         9pdaRv1pDpCFI3ZqBWDwcnVGuZ0eWctAk4CC35t1lLDtd4S1ubLCVZjBkBIfHVWNOrRU
         9WyQky+ahno7x2tOFMwn8nACmLmNdR6Ip7eN/NIOr0Rpr8Baj1nl9SeQdq0aQ8FXQ+So
         fCvH2VvuVMnbt9xXxItZXOlpS3xYYnRXTGNcw1qAByZa3M09wWWGSYWwH/baEXx37oFr
         mRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749451218; x=1750056018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOBnPobGP9YgsM1Pe2OfLfTXXne+220yuokM6yXD+2Q=;
        b=s+sGmnrBsbDR9q5z0mprzVTcTAzZsaCjxHQkYHbVYMPqCJHBg/U/MQ/jRF4hjKLPse
         2Y5MV4BTqzk+a3j9kg63vTY49axI3kqO3VsWCGPYq9BxF9+Q5eR4i3VWOeXU+yeW/g4D
         Ca7qX/Py1pkRHpRGtx52QTRpN1fR0CW4B/fhHyr037EsR3tmvPrNZnAEouiQDjh9g1CF
         buZpbnyksIqpSPUhSU3Rd4BDIbClf3VeyDMnn7tBW12RJcwk5NAfMHhbQpnU5YnPxwYK
         GCG2TB33eTHuDNxWDUQH3UEK5qwe0nYJYNZB7YWYZPgAeClOOgG8MHSADUdVJwffz0os
         OTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhaezAeIqGOBlFE3LIidY+KXDrr85TsOSD0+lWVeU+az5jYP7aZC7IrrbzKj/7/vsRnWrOee2O1SpYBlA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl2wccmlbnMuAde1UqvV/RQNXTKtU4pw3IgnXRfY3G7P5eAoJz
	jDYwmMtraKHJHLocd+IR57uePlWNNbp33JZTCgTNUi4AU/1QADiU4UUuFyfpA8T0kic=
X-Gm-Gg: ASbGnctZ4WYGV7pojoZ6uJXHnVQuQAF3E/h4SIsjcAPkCinEZDwYPyqlaO5ulNIlXkC
	MU5SV/YjTaenKXxO8hBnRSpwTrnq1LA930P0C0GjGycC5r5ylexs+d8TBUtni4vSfGYx0n+fUrH
	zW5gdKI9M45/CQH+WUl2tjbje+k8HINx+53566CCf9x9Ry1pQuUg5FTlx6Hr7FvhadMAz/PFU19
	TZEPqjZZX79nWFGmjj+UEJMYHNwrX5HjkdVnt2ljgKs3Uz+I8cBngNzOACTMgq/43gQXO/T1zzw
	GDF5zV8W7WvcRzQadTHYTUA5KxKNXEX28DLcGeZg/iorUQ3w1P1QByRhq6GzxmzxzYjyaz637Qh
	SKUs=
X-Google-Smtp-Source: AGHT+IFgQnrG25ddoQWGgoXokHSHFzoI7JWs9fEQH7NcS+EBWHSRH6Zi8DV7xTIk/Qe+xMBxtIDCxg==
X-Received: by 2002:a17:903:3c2f:b0:235:cb94:1399 with SMTP id d9443c01a7336-23601cf6bb3mr132731845ad.6.1749451218614;
        Sun, 08 Jun 2025 23:40:18 -0700 (PDT)
Received: from [10.254.237.177] ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fce7esm48540165ad.114.2025.06.08.23.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 23:40:18 -0700 (PDT)
Message-ID: <5fac6f20-2643-4d98-a29a-06471f156762@bytedance.com>
Date: Mon, 9 Jun 2025 14:40:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
 <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
 <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
 <bfb56be6-d55e-4dcc-93a3-4c7e6faf790f@lucifer.local>
 <f0069b65-9ca8-44e5-8c98-1d377798c31e@bytedance.com>
 <d68ba9d4-5850-4b70-bbf3-00d79f19fd3f@lucifer.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d68ba9d4-5850-4b70-bbf3-00d79f19fd3f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lorenzo,

On 6/6/25 6:44 PM, Lorenzo Stoakes wrote:

[snip]

>>
>>>
>>> We could in theory always add another callback .pmd_entry_sleep or
>>> something for this one case and document the requirement...
>>
>> Maybe, but the SRCU critical section cannot prevent the PTE page from
>> being freed via RCU. :(
> 
> Idea is we'd fall back to non-RCU in this case and take locks... but then
> ugh we'd race everything RCU and no it's all or nothing isn't it?

So maybe the RCU+refcount method is feasible. We can release the RCU
lock after incrementing the reference count, which can ensure that the
page table page is not freed.

> 
> Overall - I will stash this response somewhere and come back to it if
> somebody else doesn't in the meantime :)

Thanks!

> 
>>


