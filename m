Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0E13635C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746702421; cv=none; b=MfYMaN2MGyJ9RpvIaSSOHYL2Nm1BCuxKI1SSHDatfYLpgPZGTfr6GjtMIAkpIkOrxYmdZJ22kkEeCl7zWRSh5Wfwn6MOsfZfbNXwip5hIgm9ux526RMmpsyCLElPTsJ/b0tYlAQ1qp1CJQZz850rdHk56LdXldIzty5b3zSGR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746702421; c=relaxed/simple;
	bh=aJglINal1/T1lHX5f9PyTdZ+48auRmJfPE1vMPdMw9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VByetNgztGHGAJVFZfEhaF3xdAd5eeRfiAomXpvZqNcFmxiWy5KoTLscdbJ34ZCmiXMltrcvz8o6gK17Tspz8qxTCWC9j/W0JoD80KqXkUd5CCU4uY/bPRORIN1OjaK7Oycr1XIbEVJ+J+67qV3Ugn/Vidt30bQsHtQ6gAVf81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QEzevTsy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QEzevTsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746702418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UImp2+bBoiPwi0in1oKJ4s44UTb8emDFhMxEnH/0grM=;
	b=QEzevTsyxZmuv0Tyrv5tSIks0YznmSzhm7f0HIAh/vsSZTOCa4r5f4EEsY07La6EfvvO+2
	EHGD0fowFnGzDdkvwHuBppgEXHNMWnJp30Kl/bVgoydcR1+70cW4cmedg1E1pDYo6q9Eol
	uYumR0o3RH11X0ps33vqoX7QhQSheYs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-r62tRYLuOb6F8bMHii1qOA-1; Thu, 08 May 2025 07:06:57 -0400
X-MC-Unique: r62tRYLuOb6F8bMHii1qOA-1
X-Mimecast-MFC-AGG-ID: r62tRYLuOb6F8bMHii1qOA_1746702416
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso4223495e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746702416; x=1747307216;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UImp2+bBoiPwi0in1oKJ4s44UTb8emDFhMxEnH/0grM=;
        b=lbK/WZYPuMGOrNe4rfZiZ0ITlskazvrWw5K66frPzpfCftcqxM1j6eFdJUoLTncoxq
         LdDe2Jru9Bh/QiD5ksVzvcEhIxH2TSU2CaWTpF8/zaFOmpFX1miKfbrfZHE34otjvPV9
         2unWQr0szyNex3YmQrNUpqO7/7C6s5KP5tZGhNsDBu8lOIC15NIkyA+suPnraaSZ6MsB
         uPSVORgyOpfJ25inBQsPIPXGZfa52s412SS5PwmdakiZ9EM546Nxz5qxhaW1v83Xoct/
         39xBQVNroZfU6zPvGfmO931rebPXgPWim0URYhGce+LpxcXIMDGqSTyZLQzQIplCbDvD
         Uu1A==
X-Forwarded-Encrypted: i=1; AJvYcCXj+PclbQTjqHty4qdXZIJpqcJQ0AE55/tk/munEMU4Bw2l3c0u3TS1TaJERbGqc7teQtD2YacI8UQUpEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLO4z8PUM5AFrQSpF4pY2fTjJaGNnLYkdxwxyK8/3hG5DXI0XZ
	GD6i5InvZjDmgL9SEnZcEKhxXqMFHt6JTDGZg80xn9m1f+h5DmVWiXAb6KVXNT6WigQsdtAlK2P
	0BAqGKBRulZY0z7Xogjp/sVAvZDNW7PVsduRWqoRVwUW/DUvQgmIpgOCIDKTGfuns/If09A==
X-Gm-Gg: ASbGncvScuJEtNV2vCvqkG1SbIR9ciIL9+0DWnFUkGzlHebQM4W+UNf+o0K5Z0nK2Yf
	G6iU/JM89ojNiVpjyVi6TDZFMEG1E8Ty5U+zmN1BAuX6xgdazNknVnBPESejsu4WmnbI0q5yQ3l
	143NBUCx6vz0RzCoVdBR2G+VJY5ez933vzMMWjRQ1ppMUR8NucbusrXJuoWKJnQUXO8uHhb74ly
	efisZ5cRdHrhfaTM+I8pEh322g7emiiilOw8MU46g0h0vdO2ePh+eNP2Y5o94x1GCYS4+ytBO+j
	HzHBg9KKV9FjrQv/xxUJ4vipaEKH/KZ9D/Uh9+JTYyujsYdl6ZxcTeRtai/rr8dwsV4R++yUX4N
	eJNatd3wfD1ZV0nPwlq7feJdbllsR9sndc8ECOl8=
X-Received: by 2002:a05:600c:8509:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-441d44bc62emr72107535e9.4.1746702415918;
        Thu, 08 May 2025 04:06:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoI352KxPwR4h3zgYax6AFMpDoH+9ylayXPmQenh4kYk0KRAoAdzzg/QJUC83t5wOu27MiLg==
X-Received: by 2002:a05:600c:8509:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-441d44bc62emr72107185e9.4.1746702415499;
        Thu, 08 May 2025 04:06:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d1266624sm48253735e9.2.2025.05.08.04.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:06:55 -0700 (PDT)
Message-ID: <3b5d929f-ec2f-4444-825f-81e71f804033@redhat.com>
Date: Thu, 8 May 2025 13:06:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250507141132.2773275-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.05.25 16:00, Usama Arif wrote:
> Allowing override of global THP policy per process allows workloads
> that have shown to benefit from hugepages to do so, without regressing
> workloads that wouldn't benefit. This will allow such types of
> workloads to be run/stacked on the same machine.
> 
> It also helps in rolling out hugepages in hyperscaler configurations
> for workloads that benefit from them, where a single THP policy is
> likely to be used across the entire fleet, and prctl will help override it.
> 
> An advantage of doing it via prctl vs creating a cgroup specific
> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
> that this will work even when there are no cgroups present, and my
> understanding is there is a strong preference of cgroups controls being
> hierarchical which usually means them having a numerical value.
> 
> 
> The output and code of test program is below:
> 
> [root@vm4 vmuser]# echo madvise > /sys/kernel/mm/transparent_hugepage/enabled
> [root@vm4 vmuser]# echo inherit > /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
> [root@vm4 vmuser]# ./a.out
> Default THP setting:
> THP is not set to 'always'.
> PR_SET_THP_ALWAYS = 1
> THP is set to 'always'.
> PR_SET_THP_ALWAYS = 0
> THP is not set to 'always'.

Some quick feedback:

(1) The "always" in PR_SET_THP_ALWAYS does not look future proof. Why 
wouldn't someone want to force-disable them for a process (-> "never") 
or set it to some other new mode ("-> defer" that is currently on the list).

(2) In your example, is the toggle specific to 2M THP or the global 
toggle ...? Unclear. And that makes this interface also suboptimal.

(3) I'm a bit concerned about interaction with per-VMA settings (the one 
we already have, and order-specific ones that people were discussing). 
It's going to be a mess if we have global, per-process, per-vma and then 
some other policies (ebpf? whatever else?) on top.


The low-hanging fruit would be a per-process toggle that only controls 
the existing per-VMA toggle: for example, with the semantics that

(1) All new (applicable) VMAs start with VM_HUGEPAGE
(2) All existing (applicable) VMAs that are *not* VM_NOHUGEPAGE become 
VM_HUGEPAGE.


We did something similar with PR_SET_MEMORY_MERGE.

-- 
Cheers,

David / dhildenb

