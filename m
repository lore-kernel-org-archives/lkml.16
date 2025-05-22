Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7EF19ADA4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936894; cv=none; b=jhqpDGiwVDoI7/PgQUpir7sRb76p6PVa8Xy458in/7lvw8HtG4lBA7GcKsdQzBnia8cOymD7Ifep2cjSQU2ZhiJKeOwJS/j6ypWRQ0LEplCItgewXhU0VR5mBZbHglRON6GFZjCACmdu/zj27bT94l4Ki1Ppgv1mY7qBdcWAqgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936894; c=relaxed/simple;
	bh=zSrbOWuHQ1Z5sVIesfrhCLH21IIccGRYbToiYGXm2ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nk6gF/YaUKSFnNvIuDzfuq22ggfeikYeHlWXfSkXGqRQdtzXx9QSDRmf6ilB5Ww7nCHmm5WAFwzG+VxoVN58upHIzPW70jcSXmtXqIQibRzIKrLJ9qrsG9mYOCcBRdla2RUscYGf63U+kMpOCNAUFKKmXKMx+Yp5zpDTZ1sMRno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RfM/oqgp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RfM/oqgp"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1035a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747936891; x=1748541691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSrbOWuHQ1Z5sVIesfrhCLH21IIccGRYbToiYGXm2ZY=;
        b=RfM/oqgpgpo2BtQ8Hydjx6/l9ufY9xv4wAaJOqjruHsFFkRFPO+6wCY4ez1Ye8wucs
         mGfFe8PJxJMsiTjzx0X00xzWYrqzDEszkCcRrSBOGgppUme+aIpMR9ocj7sEjF6iklkX
         qaychnd5CS5VSeLT4skrXoqrOaIV6eBr9PQW6h4bZE9oBdK6II19NujshnoWClpC7XFF
         DzI1N2insLehKcDiC0zkWKpqW6CNF1I4YlplfSdmgwr5HpRJDxa2uTiBHfaZKceCloF9
         /DcHP/Cqs69AKDa6bg8xXzHYYzQHb1b8pqXJBOYOc+gg7uC2HeoAg43EP5c+uR7mZL7v
         QcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936891; x=1748541691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSrbOWuHQ1Z5sVIesfrhCLH21IIccGRYbToiYGXm2ZY=;
        b=p9XVzS7N0cVQ6ohL4WixWln5ojdpgnnNcGv8ITJ05/w7oOkZpUIWMnxOcidlSMvpXh
         PCGF2E7K9Zpk19DRhWO8F7IJH2p7Fz3l2+ZfN4R26CdKNcgiHbTlFDelLKrWDcV/ccRc
         zEiCZSXsXPW8cstZK3tFB5p2I+4Myq27R7CVjt8CW25gRjGIVycAdENJwmfXsI3CgT5N
         181dahYxY12FiEWz5QyWc8yueYMohJpY+ytBzkmBBRDIqx0SvlkfAsSJ/VGvh+SQN33v
         X+8YomYwINBfJ4JOFIW/Urx+a15TCv9E0MMUZm8hMI+8lRH/0/gRwAkWT6ghpyoYylgq
         aNXA==
X-Forwarded-Encrypted: i=1; AJvYcCX70yo3WjN+cKH8CongrgvmzR9gWnlSexrmHZmrt+c40CH8m4KpLjMQpBG+VKgy2LISJi4gMVxfuOO9pqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0jIEZHH9/ntC5g+Gpgqx/8M59Kfbf4V6bM1OWZ5RFfyHX+5Rp
	+s8VihLxbAwOjl91bGI6G/uWgfQ7SwtHtJG583OvZnjdESXho2yitgwcy2s+BvbCqJsh6m2ORUf
	c2Qudp83G9Ko5oXvrSPHSF9h8J++NKC2Uy95uf29V
X-Gm-Gg: ASbGncsHvuuWsoPMBP5Iqw/47biKo7yONcoE+vkdS36x8duRCdfLvawGPlTafLD6fTk
	trNys92jXL+MTxhV2N4UcqvWidJ3SUG6VkZBPlVLzGKQw9dAdS6wZefLBr6C5+Fv7KGcFCcyNCo
	JbdVhDkTqhQoBULftBKzp8sYswrlIrYdkdXsBbu4S5fkbtQTcjZicYlih/jP+UR7TXBag6MWl8V
	nnDSO8abA==
X-Google-Smtp-Source: AGHT+IFxJE445XHoSMx5+PG2/5xKb63gk3NMgNuLdGQr4KqW7SDg77Lnmqsxp9mSej5j68Z9BUaqOffGqtQwskjYt88=
X-Received: by 2002:aa7:d905:0:b0:601:8e4f:2eb3 with SMTP id
 4fb4d7f45d1cf-6028fbe2b59mr9108a12.0.1747936890338; Thu, 22 May 2025 11:01:30
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522012838.163876-1-roman.gushchin@linux.dev>
In-Reply-To: <20250522012838.163876-1-roman.gushchin@linux.dev>
From: Jann Horn <jannh@google.com>
Date: Thu, 22 May 2025 20:00:54 +0200
X-Gm-Features: AX0GCFsRGhGmDXFm5yb_HSIAhFgPKv3Mqm8Lu7C30sJ_pCqFSfVgLnVDarBenOE
Message-ID: <CAG48ez303kEZ8rWrP9AvsWGddcptAxuk6C56eBQ1Z6RJW-a_mw@mail.gmail.com>
Subject: Re: [PATCH v6] mmu_gather: move tlb flush for VM_PFNMAP/VM_MIXEDMAP
 vmas into free_pgtables()
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Nick Piggin <npiggin@gmail.com>, Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 3:28=E2=80=AFAM Roman Gushchin <roman.gushchin@linu=
x.dev> wrote:
> Commit b67fbebd4cf9 ("mmu_gather: Force tlb-flush VM_PFNMAP vmas")
> added a forced tlbflush to tlb_vma_end(), which is required to avoid a
> race between munmap() and unmap_mapping_range(). However it added some
> overhead to other paths where tlb_vma_end() is used, but vmas are not
> removed, e.g. madvise(MADV_DONTNEED).
>
> Fix this by moving the tlb flush out of tlb_end_vma() into new
> tlb_flush_vmas() called from free_pgtables(), somewhat similar to the
> stable version of the original commit:
> commit 895428ee124a ("mm: Force TLB flush for PFNMAP mappings before
> unlink_file_vma()").
>
> Note, that if tlb->fullmm is set, no flush is required, as the whole
> mm is about to be destroyed.
>
> Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Jann Horn <jannh@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Nick Piggin <npiggin@gmail.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org

Thanks, this looks better.

Reviewed-by: Jann Horn <jannh@google.com>
