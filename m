Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33FA22D4C7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285504; cv=none; b=etX4mWUl7Ahfp2brAzdy/Hic3QCsCWlyFfqI36pMz837elFGXeAwGG8eLLSl8YStrFgcXWhpmhv8S2AfQe+HLsy7nLGftdTivbA4lusVrUcx3ycswANfZ0u4xJuRUtO9KBfCrB0M7SGxOd/47p9Z8CGuSUrR0omb9xLn2CuK01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285504; c=relaxed/simple;
	bh=fD22dFwPn7jjrKVWpcWw2fRex4drTiGeMYHTWoQKi1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOIzEKIB/wy4ekcdygJnkAYewMUoKguyPMj9vKH8/aoO6bM9d7S3X0PuGloczHF7apyqBTFIjvYyKOdPIougHR/ryuQGnXrlZFXBUAIH3tpl/NJ122ineJMwXkRlnqks/3NXcuq1DeR2iLFcF1NF7s1VZZnC/yhOBXrmZcd6yBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cp5o/yL3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cp5o/yL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739285501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0lYtbdnnypFcNiRcv6+Uu06HRU3vMAla5QbvyE8U5Y=;
	b=Cp5o/yL32qVDtMRRHzqOv2BoTAZODd4cHP39iMlAfYVjUr4a0lw7Rdv4DYyChf4m1BJd1M
	sj+R3IjEhR2hS1lMQI35+X5uxi8OGEuwKbnFERnc8Rm16/GHES0YGu6/5E0yLOJudPSkte
	MMjaZkDGEBQ3yCXuvuacz6CzO1ErxiI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-HM2yQt7HO-GyHu-8WExN-w-1; Tue, 11 Feb 2025 09:51:40 -0500
X-MC-Unique: HM2yQt7HO-GyHu-8WExN-w-1
X-Mimecast-MFC-AGG-ID: HM2yQt7HO-GyHu-8WExN-w
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467b19b55d6so57206031cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285500; x=1739890300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0lYtbdnnypFcNiRcv6+Uu06HRU3vMAla5QbvyE8U5Y=;
        b=S0AcySbQUVIxr7iOwM1shvwj/NkxKTjoqy2h14MqCqiabZBfnId4m+EGIEZjtLUXPK
         4OG+cPHZYlanW5myzGa9VIbsd8NHQ1m895t+98MgJ8/OQ9f1cZ2ATwXNRGPNSYmxuPWu
         rIknWDXc7K2+njBqe3Cl20JXVZR87eCRDDS/KTMRagAVG80je3HPNv0vp9Mjrp7QrTt8
         tAX0Mt/81yNfH+GIM5lIgKMVDHajDUa0WKTJdBQex+OFVkfw6/418GI50LS8EEyJlcCU
         HQRbrG53Xe5WB5jSolhquoxw+kb3Hi1MQHEc/lss1rjmhvstzARaIqUiuh7ULuh4QdkC
         4DZw==
X-Gm-Message-State: AOJu0YwW/iPI5jyBGhl4UgARy069HXfdZ9ZX4rIyfqv+pRstQGStqfsW
	iQfIGEzkdzoOa4yPhnxKn+PjrJy7PHnKp0b4TmiJEmrEXWaywxv1L15lbj7AaFqivCJWQWWD2XJ
	lN72EEW9cAOLmmU5f6rZLXEZfpFwzYryNl88yS9PJOqfU1rhHejFcT2u4Ap+NGw==
X-Gm-Gg: ASbGnctlQlZp1d524v/04bnrSdZxUodwIL+cMayZAfgA2dXE5mQl44xrw5kdmpAFkB6
	lj8BAoFYxcFHYTLTqH0zGJ4oNDQAvERG/ufWwJ+lDuTMnV+mfVwodphMkVuyYTwxQ1xOyd5lgKA
	KAGYYQLHsyovmfpqTGk9rqSsLGmqvyHXzFvevy8Wff79W9vWTkXyrQC3lh+NPOi07XUUzTjlSJ5
	ziG61Zl98QpyFNmZTILad0VfsA3Thke7IRT3VoDPPXnjduTN8YQwwI+Cu8YTETg2twt8nT/OJCs
	kVOr
X-Received: by 2002:a05:622a:1a12:b0:471:8cab:6eec with SMTP id d75a77b69052e-4718cab7063mr132964951cf.23.1739285499836;
        Tue, 11 Feb 2025 06:51:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqpMXJkFVeSdMyW4O8CVvFJXxtdKttGMxO3hSI/z5qgxQYhMp5NMbZw0e9GouNCdFj+JVHTg==
X-Received: by 2002:a05:622a:1a12:b0:471:8cab:6eec with SMTP id d75a77b69052e-4718cab7063mr132964691cf.23.1739285499525;
        Tue, 11 Feb 2025 06:51:39 -0800 (PST)
Received: from [192.168.2.110] ([70.52.22.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47195c6a2dbsm24611101cf.48.2025.02.11.06.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:51:39 -0800 (PST)
Message-ID: <146d87a2-ad3b-4070-862f-c92c91df27b2@redhat.com>
Date: Tue, 11 Feb 2025 09:51:28 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: hugetlb: avoid fallback for specific node allocation
 of 1G pages
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, yaozhenguo1@gmail.com,
 muchun.song@linux.dev, linux-mm@kvack.org, akpm@linux-foundation.org,
 david@redhat.com, rppt@kernel.org, fvdl@google.com
References: <20250211034856.629371-1-luizcap@redhat.com>
 <Z6sTLjKlX39s0Mo_@localhost.localdomain>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <Z6sTLjKlX39s0Mo_@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-11 04:06, Oscar Salvador wrote:
> On Mon, Feb 10, 2025 at 10:48:56PM -0500, Luiz Capitulino wrote:
>> When using the HugeTLB kernel command-line to allocate 1G pages from
>> a specific node, such as:
>>
>>     default_hugepagesz=1G hugepages=1:1
>>
>> If node 1 happens to not have enough memory for the requested number of
>> 1G pages, the allocation falls back to other nodes. A quick way to
>> reproduce this is by creating a KVM guest with a memory-less node and
>> trying to allocate 1 1G page from it. Instead of failing, the allocation
>> will fallback to other nodes.
>>
>> This defeats the purpose of node specific allocation. Also, specific
>> node allocation for 2M pages don't have this behavior: the allocation
>> will just fail for the pages it can't satisfy.
>>
>> This issue happens because HugeTLB calls memblock_alloc_try_nid_raw()
>> for 1G boot-time allocation as this function falls back to other nodes
>> if the allocation can't be satisfied. Use memblock_alloc_exact_nid_raw()
>> instead, which ensures that the allocation will only be satisfied from
>> the specified node.
>>
>> Fixes: b5389086ad7b ("hugetlbfs: extend the definition of hugepages parameter to support node allocation")
>>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> 
> Acked-by: Oscar Salvador <osalvador@suse.de>
> 
> This was discussed yesterday in [1], ccing Frank for awareness.
> 
> [1] https://patchwork.kernel.org/project/linux-mm/patch/20250206185109.1210657-6-fvdl@google.com/

Interesting, thanks for the reference.

I stumbled over this issue back in December when debugging a HugeTLB issue
at Red Hat (David knows it ;) ) and had this patch pending for more than a
week now...

