Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14672820A8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749453728; cv=none; b=S4j0anQaZ0mHEy1ihfx93OpSIMUf8tAdKw06Ilw+c+4A3gbWCPthBamqNG5sWUcBwI3mgw6DzhwbcETOmlywrumyYAA0Min3e0Pa4NWtCyBnGkIXC6iN6Gi4GxxpyPj+ruMcJobKlMyEO74Rtzo4tIwSm3PWtTEQJEGEKBu2XeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749453728; c=relaxed/simple;
	bh=T6K+sYSly0OGharzJEMeoqNrKJdrAwobGIRkXo+z5JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qW8dFdrgh3D/C1ilx1FDegN8F3weq4BnmGZezZkf5Sy66xH8jyQINdzmGfS0A6WvzJZJ0gWyx1Rq+YQ1r8Cp2YGRmSU/jVpIURky2iVCUPia897uEFVQgd4mdA22PX8dOVQmEb3Kl5su0xmwOoeUdwyhAEZwAzOnKr5UYW8PAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SZmGlgSN; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SZmGlgSN"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3121aed2435so4280473a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 00:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749453726; x=1750058526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlZBYyVcyDUOvgy5ixpGTAUg8PQpkLuJBFcAyQwuqwA=;
        b=SZmGlgSNmXc/SfgDU3U8UERZmXeHdFAV1NHapQLBe60wfBZ06h4EyKfK0HtTwnPnx7
         Xyq3bRxbddjaYgu6+6h4M5hFaQkQKOoYiR6kE8wrl6LBdVtTs4QX4Z2RuNBn53mNfpOA
         RoQ13vz21ucd5oWzx2m6XxZi9IwFHiqc+iff8wcKnYII/6tYL+mMKcSYYvnSkVRRwsDL
         2i3oQuy+FA8uPpCvXwvSm9TaQ5N0AhLN7TWMPPhFSpDpsA519fmhLKKIb00G09SGSO5+
         yKUPPWu4HMckpNKprl6KwRw0drP/fghZeWLpFqDbwORIj4XNah3hXGwEWopY8QhOs1gC
         j0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749453726; x=1750058526;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tlZBYyVcyDUOvgy5ixpGTAUg8PQpkLuJBFcAyQwuqwA=;
        b=NYiAet/jeUcfUhXZ65ttuO5n9XUVvO9UklfwWpzA7RNCINaJIPS0NZ9iO4I0M6akGo
         O+jkGVeAjekcDJ14Tel0Q8Kx0fQ4JA8tNTOfbb1DI54Y+ZZO13zIYCsSVYQxCEoNBFgv
         02or/Svt2/vJOFuFEA4ZwxQx/rGYqjD+NrbOWgdZbP9aYm3ufV5HqFO/hj/VNMDuZXjw
         3olHqHd3oEHVMyjxgDIpP7YBGZeDWSufb81DYaZqCwfeX8WIF0ajJlvTi+GhpiTLsAdv
         GmvXHptCWdsEPQ2TDzVcM8wqcffmI4+v96vEosfbLBzMuj28kTrFletxh0gcJveZTEwq
         pezg==
X-Gm-Message-State: AOJu0YyzxOwAuA9JhCZQ9HbrV5fTrHYdmBg979/q4r2wADOFE1NiI8tH
	SjYIhwxcXXLm/flnGdH5ppiwt7hOGkv6Cq1QJQbsZdVYtTmUmYp8QGJaI+NhdUrCB7E=
X-Gm-Gg: ASbGncuLTw3a2wD4GlSfXfnLbE/6yloRkEd+GnpIiqoUvPw4TUTQ4b6mcTH4R1YrrcF
	oXa+hiJz9RqSFg114h3Dp0NEYbs6zz2uhMiUVjRG9G5WSa3vXmq29DhvCSR5/65z2wC1UlpgE+D
	Rs2VLktACFubugDkm0TDC0POjUSmNEMaXUvkcUvKkkzh40ROd+fCXRQbo1MEdOMmKhs4JukgreR
	I+KYCG1SlMrYhcNJ+qb6HocXd58reK+KVTydNnrvtwEgt2Mk5TWjAe/j+inpZ6JZulCPr+inkSm
	8y1TELT6J5nieMVGvOaFm0sF3G4hMYdZZ1C9BECTbbfgqn8ASOge7JaS/zIT6JgTsX/44lFn99E
	/CbTybxKB2TSaiV+9dA4=
X-Google-Smtp-Source: AGHT+IEh4LPffN8yuJEsvHfJQbaYgOAOjlnHV104Z4hZYSIoE1PS8agIZzSxAbwcbd3A792x5GiqXA==
X-Received: by 2002:a17:90b:58cb:b0:311:f692:6831 with SMTP id 98e67ed59e1d1-3134707730bmr16002660a91.32.1749453725873;
        Mon, 09 Jun 2025 00:22:05 -0700 (PDT)
Received: from [10.254.237.177] ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f44bccsm5041596a91.22.2025.06.09.00.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 00:22:05 -0700 (PDT)
Message-ID: <ade4bd69-7f76-4e3a-b81d-ebb7c9653e4a@bytedance.com>
Date: Mon, 9 Jun 2025 15:21:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250607220150.2980-1-21cnbao@gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250607220150.2980-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/8/25 6:01 AM, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> Certain madvise operations, especially MADV_DONTNEED, occur far more
> frequently than other madvise options, particularly in native and Java
> heaps for dynamic memory management.
> 
> Currently, the mmap_lock is always held during these operations, even when
> unnecessary. This causes lock contention and can lead to severe priority
> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> hold the lock and block higher-priority threads.
> 
> This patch enables the use of per-VMA locks when the advised range lies
> entirely within a single VMA, avoiding the need for full VMA traversal. In
> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
> 
> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> benefits from this per-VMA lock optimization. After extended runtime,
> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> only 1,231 fell back to mmap_lock.
> 
> To simplify handling, the implementation falls back to the standard
> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> userfaultfd_remove().
> 
> Many thanks to Lorenzo's work[1] on:
> "Refactor the madvise() code to retain state about the locking mode
> utilised for traversing VMAs.
> 
> Then use this mechanism to permit VMA locking to be done later in the
> madvise() logic and also to allow altering of the locking mode to permit
> falling back to an mmap read lock if required."
> 
> One important point, as pointed out by Jann[2], is that
> untagged_addr_remote() requires holding mmap_lock. This is because
> address tagging on x86 and RISC-V is quite complex.
> 
> Until untagged_addr_remote() becomes atomic—which seems unlikely in
> the near future—we cannot support per-VMA locks for remote processes.
> So for now, only local processes are supported.
> 
> Link: https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local/ [1]
> Link: https://lore.kernel.org/all/CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com/ [2]
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   -v4:
>   * collect Lorenzo's RB;
>   * use visit() for per-vma path
> 
>   mm/madvise.c | 195 ++++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 147 insertions(+), 48 deletions(-)
> 

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks.


