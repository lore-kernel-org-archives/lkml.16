Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79992676F8
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640224; cv=none; b=aJEMFF5oNmVFmZDWHJp2NcWCqFsOQz7PeEHDj/w1nwKWPMi4gqRjHbU5bhueaFAGow7Ae1B+VzdA0yKT56WClPBQc7kJ2hj6RFUPmHJlln2BZeIRTjDyyU72k+a0v7iNL9qR0ld2NjfXLQMoxAPxDqYcJy59kJpEMo6s+fdZTas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640224; c=relaxed/simple;
	bh=NT7TLaSJAoi81dS4m8sJyxF0hvbKUjDVEc7foF2W6Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wtlzaad+uiKWZuuI/eJZR6Q2kh5+IjpFmZ3Y+2cffLACppUtdX4EcgB+vUYLjbkuA4X76NEnzUNLkeoa3szcp0gDwHhZaLsvD2UguZ0PstQabCM2HN5n5lzK1WaanQKn36cnkpnQFblFGNZcWsiGwi6QjljEfUSMgddjIabhxCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fblvzt90; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fblvzt90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747640221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=80wtfnAlh96OoLoiwv3x6iJ+JYsT4zGSO16abWYF0wU=;
	b=Fblvzt90VeYhNLB/A2J7KkC9A+zDVbXikFMeyAJtNLWDuoiE461h8JEdcN+qQD8xmGhFFx
	Hn/yKNBTxMmd/M3RJ/hjDztVOuHpfhihkoLV80x1AprvyzSo515neDmM3hHPl4+GomJS9W
	xTct/JLRYLb3lsPtSHYAXpil4NcvkxE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-3IAqW-b5PfCOhikShH-AGA-1; Mon, 19 May 2025 03:36:59 -0400
X-MC-Unique: 3IAqW-b5PfCOhikShH-AGA-1
X-Mimecast-MFC-AGG-ID: 3IAqW-b5PfCOhikShH-AGA_1747640219
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c122fa56so19805715e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640219; x=1748245019;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=80wtfnAlh96OoLoiwv3x6iJ+JYsT4zGSO16abWYF0wU=;
        b=fNJZaTVqQ/oaRNp1rhDGIvvn9MPLpFbRuiI6FxyRFxZjUGHmbzTXf344XXxPSp8FpR
         VTubBljR0sb56exO1RPR2OC3yf5vHCvnoPMjDMRIsCMw6W2QSEgsDU2uYodRlkylvdEd
         Hbwpt2iLNHe6owCq50IwXstkE9g0/dMz0l05C49mWuED0uBUO+q6RsT+UEDLKCMupfj/
         XTRe/XeUNmxJcuxzuFE1dqyfb/wZloya2b8Zu76Q3DXjV9VlcxLU5hcJeXpvlmMoo700
         Q41EBflyGNjp/478uSuFk5MI5OcwVG59HIw8YFCXa7FeRsQK4oMaFvr4HGKft8KWFrbB
         SxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKHJ8Cf+z3J05a8TXkMU840iMSbeFPn8LZBn2lqrsok+Hk4ySzF8QPIsNc/uWmR1xufQ2R5ZIM/ZLRoKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEWENOAL8mfCW/bj9P1jHVRELMQxuFso25X6jMvXgaWoH/VXA+
	v9QdGNYNeg4KumRBwr8Kbz4oRZtOYHkkqpHRvDeLLJ/gCFiTz6i2EKJxFKDwKrV5s6wQtSK5oZB
	IDYP1mOV4R1aSsdFcO6P23+FO/m7A4xgnxR6m3Ir3wiJbpo/e9lvq/MKQl++JrurO+g==
X-Gm-Gg: ASbGnct2okPOgpmUT6sSYJchz5wMykLJYLXBpfWYaARBCEuWWwE6etEqrOTeorzhTR7
	4E+LKa/P6RHcJAd8+IPfCjHuFPW6vkNK2/OQPltM7y7/Nr+s1SvMB8CAN+LOB6eIzwGSKwwCkAT
	gFSzqc2WCn+XcTNNhtigvq0a++nkPuxRLtrzKDCWHelmcSKO2a3oKTS2+Y7MtbDWDgbC0XHWiPJ
	lO6Qukmovx7sGX/+o0UIgPGnlWT6ounJUIuLI/fF+WEJfW7ZI3JvkqE2bqLZtvONsf7KY09pNoM
	d3jGm3ZKdG95w9HG6tfBJVlVEkMUOOu+y83cjty7
X-Received: by 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-442fd60cb7bmr100939625e9.5.1747640218747;
        Mon, 19 May 2025 00:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgk+uqG5Zax91u1s2vF7UerVD3hqohIuaAeQMuL1J3L6cZpu+KuC3kHGl6yiOGTot5QM7QLg==
X-Received: by 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-442fd60cb7bmr100939505e9.5.1747640218412;
        Mon, 19 May 2025 00:36:58 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a707.dip0.t-ipconnect.de. [87.161.167.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33804d9sm200084815e9.12.2025.05.19.00.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 00:36:57 -0700 (PDT)
Message-ID: <14bbdbd4-fa86-4317-a051-8e1defc7192e@redhat.com>
Date: Mon, 19 May 2025 09:36:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] RCU Detected Stall in sys_process_vm_writev
To: Guoyu Yin <y04609127@gmail.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com
References: <CAJNGr6v1GL=ZzgGar7NCjCGVBaAO7YVYU7bBhUt3T4T-DAnUAw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAJNGr6v1GL=ZzgGar7NCjCGVBaAO7YVYU7bBhUt3T4T-DAnUAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.05.25 07:19, Guoyu Yin wrote:
> Hi,
> 
> I discovered a kernel crash using the Syzkaller framework, described
> as "INFO: rcu detected stall in sys_process_vm_writev". This issue
> occurs during the execution of the sys_process_vm_writev system call,
> where RCU detects a stall on CPU 0.
> 
>  From the dmesg log, CPU 3 is stuck trying to acquire a spinlock in the
> pgd_free function (arch/x86/mm/pgtable.c:490), leading to the RCU
> stall. This is likely caused by spinlock contention triggered by the
> page pinning and unpinning logic in sys_process_vm_writev under high
> load or abnormal conditions.

pgd_free() calls pgd_dtor() where we should be taking the pgd_lock. 
Apart from that, only the buddy allocator might be taking locks when 
freeing the page.

> 
> I recommend reviewing the page pinning (pin_user_pages_remote) and
> unpinning (unpin_user_pages_dirty_lock) logic in
> process_vm_rw_single_vec (mm/process_vm_access.c) to ensure it does
> not cause prolonged spinlock blocking due to scheduling delays or
> resource contention.

This almost reads like AI generated content.

Anyhow, unpin_user_pages_dirty_lock() should only be taking the folio 
lock, and pin_user_pages_remote() should only be taking page table locks.

As I am sure you wouldn't bother us with AI generated slop, what makes 
you think that the pgd_lock is relevant in the context of GUP?

-- 
Cheers,

David / dhildenb

