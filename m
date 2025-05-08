Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FC278E42
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718695; cv=none; b=TMrequ7G4y2qJvFCnKeMiza530QZt7W1f9HNaNvqpAm/NhUISoeQ7hq8rCtJ+eoCmpddgCSrNNJ05hipXch955yENAXC29cTQDKwpZcropSKm7ijjqdWYy1yfg/jAnXjF6GEOJBRgbCw7ssuXRWpAgwozrcVjPiBao36NFgJsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718695; c=relaxed/simple;
	bh=MWnsewZ5q/23GaQJidQkxPGjf8oIRVG9F9VPB5wHKGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEJAXFJOCfSQDW/CGM5j2qpZumIFwtLrEiQkR3FMkeLVk1Fw8CR2Wb4OUthbZxPcUivMUNE7TaEdGyQux1B0RtL9ecFQLRh2tvNshuYJqzEvJszDETQ720js60qp6jX7xSIDX/q4IYtgeGFOAqqRVvjgl4Fy17I3A4W2Vs/HOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ecItQsWU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ecItQsWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746718692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kNgdumueLsyUao68owW71ZuZc5Ooj3+4NxqtW1RSPzs=;
	b=ecItQsWUUL4pKiusifNpPut86liv96SvR2a6JjGDHu/04vmTh58BBwKybBCUAB+n54C8ot
	5w6moP/Kb9WqRHbx8bv+e1VL0g6U2zGPVK1ZtCF1c+XNv6/8+xQ4sBpz4gcuYvOjuHKWNu
	8+osIBmK4Fm+vkd0xJ1MYBrorQVJ0CU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-T1Jumb9KMly2evIFKAFrYA-1; Thu, 08 May 2025 11:38:11 -0400
X-MC-Unique: T1Jumb9KMly2evIFKAFrYA-1
X-Mimecast-MFC-AGG-ID: T1Jumb9KMly2evIFKAFrYA_1746718690
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39d917b1455so419841f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718689; x=1747323489;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kNgdumueLsyUao68owW71ZuZc5Ooj3+4NxqtW1RSPzs=;
        b=jrTsExL1oyZp7yjUQSRpSiew/GpgJ8XjoDiHmhwzMbRC4CdDSabkKlNSoAdVO5sFyo
         OegXxOBpHPVJT4MA+bEGhfYt4tK/qcaW46swKuoX+EaS9BZx29dz4DcmOJjR2i7ps0AZ
         Y3jOdeuu1NX4jYdFhtZeGQ9PiX6dVqxPkw9VR0l3VNDVuYbThDXWvmtc2E50lu2KpYVg
         MsVDXMSMq8SXnIbla3vi5bJuGPWUk4tRxRv5QPmWvCa0J3Z8D2NhsPe+d2yy8nhAZvma
         +F8Lrk/YpC7hHMP8Xa7+Nn81y/GwsehmGRjf7pJB4MyimZaP95Iliae7KgaDt6gKzwuP
         ZrEA==
X-Forwarded-Encrypted: i=1; AJvYcCUtMaQLrOV5B2Mq3dxpjDFSzWpyhywCI+oA6IJuJ5s1tQXRQaAG5MFciQAm6qof3XGjLalYuVDWi+c5Wd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsoy0yhulZ4d9w0tDx2jNP7a0eizQSj18iubtnl4KNKMwoH4XB
	BnAHhIxpKwNrnbkpqwLnqka0PifDJlXWHy+daKx4hZZ82LSGdHpN/npD73YABc//Jdv42bL94BW
	m0LQVPuJVbe3nt6ZMN7b2nsPo/PzQoDdF6r9zTIM352PSe3141N8Lpw1/ITtKDQ==
X-Gm-Gg: ASbGncsLTUuifWwBE696u5EtVJuD1jAHgTukuYJNfFooRknw9+CePtp9Qfu1wEbtlIu
	X5nfVL6NkqnH4KRhQLmwZ1bLiFaGikzoPdXN5gH+ng3P6CVMYwcKAOID36vtZKzILAtaFEafmJX
	kveRlEwkHrLVpytDJpYXRt3Jy2Pro2StWGRB0gIoRq60Qo0W9jUpMQXnEa2ngWow9aBUm/DRIJe
	wI37FRgZr+eN58PPvtbTOqurvv63qINaLt4QVA/TtNzHfZv4/hrebAsDgByPGzwFqXd9bKMz8dP
	gzcCuMRWK1La9MJw++7rgPrLKjdbxcShHBEEeVVkUVXGFXd0D03IDUHv+w654gr05a0pES48IBx
	fDAk0euQKQxFcxw4a0e3MhZd862cu4YyTFIqMIeg=
X-Received: by 2002:a05:6000:2411:b0:3a0:8ac5:16f8 with SMTP id ffacd0b85a97d-3a0b4a18f1bmr6233780f8f.20.1746718689665;
        Thu, 08 May 2025 08:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeRBpb/oIGiapcyP4cPbYWsRnSmfBqjZMmpGvYLTt1JIpEn2sUVwQBmQpL5eZWltFsaY/gSA==
X-Received: by 2002:a05:6000:2411:b0:3a0:8ac5:16f8 with SMTP id ffacd0b85a97d-3a0b4a18f1bmr6233751f8f.20.1746718689248;
        Thu, 08 May 2025 08:38:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf38sm279454f8f.77.2025.05.08.08.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:38:08 -0700 (PDT)
Message-ID: <4dc17506-6291-4b55-a257-8238c3c857f1@redhat.com>
Date: Thu, 8 May 2025 17:38:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 17:28, Lorenzo Stoakes wrote:
> Currently kernel/fork.c both contains absolutely key logic relating to a
> number of kernel subsystems and also has absolutely no assignment in
> MAINTAINERS.
> 
> Correct this by placing this file in relevant sections - mm core, exec,
> scheduler and pidfd so people know who to contact when making changes here.
> 
> scripts/get_maintainers.pl can perfectly well handle a file being in
> multiple sections, so this functions correctly.
> 
> Intent is that we keep putting changes to kernel/fork.c through Andrew's
> tree.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccc45b0ba843..55332d5bc499 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8830,6 +8830,7 @@ F:	include/linux/elf.h
>   F:	include/uapi/linux/auxvec.h
>   F:	include/uapi/linux/binfmts.h
>   F:	include/uapi/linux/elf.h
> +F:	kernel/fork.c
>   F:	mm/vma_exec.c
>   F:	tools/testing/selftests/exec/
>   N:	asm/elf.h
> @@ -15525,6 +15526,7 @@ F:	include/linux/mm.h
>   F:	include/linux/mm_*.h
>   F:	include/linux/mmdebug.h
>   F:	include/linux/pagewalk.h
> +F:	kernel/fork.c
>   F:	mm/Kconfig
>   F:	mm/debug.c
>   F:	mm/init-mm.c
> @@ -21742,6 +21744,7 @@ F:	include/linux/preempt.h
>   F:	include/linux/sched.h
>   F:	include/linux/wait.h
>   F:	include/uapi/linux/sched.h
> +F:	kernel/fork.c
>   F:	kernel/sched/

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

