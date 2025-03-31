Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFED321B9D9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743456228; cv=none; b=s3OLKBcPVJGiTdCtsa93nWb+wgPC2sa0eYAG2gyuQKRomLZhigDLEDOfN1SODqa94+BByUfeZ/Wx9Zr1vTQM14d5DaByiR4odFCfK55kVSvlTrMWWoKJ9BvEwwDJAjOLF5o0rNvD8UCr8Bpr/tZSmpPwRXpgWMa9UjYL+2XSBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743456228; c=relaxed/simple;
	bh=2PjEA6PEqXvUEzDs93/qP1FFZhf+Fl56SKt1x3Lq+AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnUJ2MK7E/6wyX8bHZx2CaWuOc9GspJiOuXn6iA1LQcVcPP8GJP7cFrc+Gaf4DJaLb0/GMSaDWp2UH23/I6rHvCaWHvKn1rSjf+F2quGTJf3OZBD3b1i/FHfc4cG0hu0Qo+5eNBXtCdWgZ//KhlL/nTvFk1jF8PxN353vavjBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTTRvQQ/; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTTRvQQ/"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6feab7c5f96so44333397b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743456226; x=1744061026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToiqwXTNWbSOaWmF/3nfIhcFQB86VWKA/YOyk/TfLa4=;
        b=hTTRvQQ/rIE0tVqoDGljL6rGGtgMK8UnvVtG86JbJORAdJIM9FzXkRNHSlXRlCVrX0
         yK2Q3cxMxQ46YL5wiXvcEVJH1xTbPrfhfKJsPzhzp6JeFmhPQr7qhM3KMMPY1VDHaVUV
         glZZEjopNLkJRxm8FOUMOMnWpyo2BEuciOjyebaUFMJbMqecIYDDnIDFnnnxJA82qW7K
         tTB/3c/4oKDnYZDo1aO4UCNCsKfe+XCJVcPUPwG+EfaxJnpOIv8PxZ8nKseNaFNtstSG
         Kv4mbqs9oapabCBa1h5hWbnSgtD49CPHfcLG+NdlLWV3UBOT5JLjWaJDniWQJ2R+z5uc
         NYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743456226; x=1744061026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToiqwXTNWbSOaWmF/3nfIhcFQB86VWKA/YOyk/TfLa4=;
        b=Zl1HB2lJvLEC9ZW4yEiQda4UG3NI5p2WtpdNnRCTnLQqXTgnpLk1je2pH41CAl02yf
         ziOImfuacxCuglJyemyUy/B6HA9efJXSTKVQmzbry3SCdM208uDQgDNJ/p5II2YAofeY
         wW+iAjlRPTgm6EczKe5CdSeNLJ0RSllJWDd0YYIDyPxJl6hACtm19xUGkEbzFpNk1+wn
         +kPLhdN+lfLdS7p7Nx6cKFfOc55mpL0uanR2cmxwl2+dkad/XfPsnBNPEXdAs1C9Z1Yb
         z+AuPzr30Walth5W8ON9j8GkNNwr0+zBd/mv7TtCSiWvTct5CeG4LA2AXvlZ6hGXQ2Vm
         ut6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWV/be0Ts+TpmpJCFHAnBvx7Prq5ejyhwK8UhMCc7rMSeCZAfDX4p+lo9TcRF0JJuHqvqZvtyhfIAZDW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLlIh4R9uLWLraHehV1bzbYFNWx30DY9F3o+kMht1MuXQCtJE2
	qjm/rNJsYjNqFhJlJfSpCZDVcQ1V1C6amOtj2q0/AZxwnZHG9G9F4meTKA==
X-Gm-Gg: ASbGnctJ70yjCjNRhTNYXnX27tZCPGl9VeVL9TfMrwCymLvW9xcTTqWr/+u0Hvc5gMh
	i/pUsrMnG0vcen3tMiTpF76SeWAVZxKwfawntgICeOMPZgEvXPq7Ru2eAFLjftVnMngN04cPFZI
	5+ImbgYBfo3otkZH4TQiMShQVsKJxLsSaP7z/YrycOgQoEo5sP526H9OsQnsxL0/C2tcVPWmBWl
	ML1d1t5tXIm+iRK0Uw/2MPRR1Xlw1+dNOo5pRmJttbvMJL/LuESov8MpgqUQYzprdw5bTmNdePY
	SXzQ6SqaFm9xJFGaXES7T/VnQBb/hK90bZTRsPyq3pYHN5HQBmmoTg==
X-Google-Smtp-Source: AGHT+IF2ccfX+N8GaDhZWoT7fQ4TPsL1iJZI+VlKe+DiDxzY0SY30WKJtzZwgizskXCPz7NweIs+fQ==
X-Received: by 2002:a05:690c:74c9:b0:6fd:390d:5a9c with SMTP id 00721157ae682-70257119196mr148843427b3.10.1743456225544;
        Mon, 31 Mar 2025 14:23:45 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:4::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023aa07ce3sm23481337b3.116.2025.03.31.14.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:23:45 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: akpm@linux-foundation.org,
	mike.kravetz@oracle.com,
	david@redhat.com,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [RFC PATCH] mm: hugetlb: Fix incorrect fallback for subpool
Date: Mon, 31 Mar 2025 14:23:41 -0700
Message-ID: <20250331212343.66780-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325061634.2118202-1-mawupeng1@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Mar 2025 14:16:34 +0800 Wupeng Ma <mawupeng1@huawei.com> wrote:

> During our testing with hugetlb subpool enabled, we observe that
> hstate->resv_huge_pages may underflow into negative values. Root cause
> analysis reveals a race condition in subpool reservation fallback handling
> as follow:
> 
> hugetlb_reserve_pages()
>     /* Attempt subpool reservation */
>     gbl_reserve = hugepage_subpool_get_pages(spool, chg);
> 
>     /* Global reservation may fail after subpool allocation */
>     if (hugetlb_acct_memory(h, gbl_reserve) < 0)
>         goto out_put_pages;
> 
> out_put_pages:
>     /* This incorrectly restores reservation to subpool */
>     hugepage_subpool_put_pages(spool, chg);
> 
> When hugetlb_acct_memory() fails after subpool allocation, the current
> implementation over-commits subpool reservations by returning the full
> 'chg' value instead of the actual allocated 'gbl_reserve' amount. This
> discrepancy propagates to global reservations during subsequent releases,
> eventually causing resv_huge_pages underflow.
> 
> This problem can be trigger easily with the following steps:
> 1. reverse hugepage for hugeltb allocation
> 2. mount hugetlbfs with min_size to enable hugetlb subpool
> 3. alloc hugepages with two task(make sure the second will fail due to
>    insufficient amount of hugepages)
> 4. with for a few seconds and repeat step 3 which will make
>    hstate->resv_huge_pages to go below zero.
> 
> To fix this problem, return corrent amount of pages to subpool during the
> fallback after hugepage_subpool_get_pages is called.
> 
> Fixes: 1c5ecae3a93f ("hugetlbfs: add minimum size accounting to subpools")
> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>

Hi Wupeng,
Thank you for the fix! This is a problem that we've also seen happen in
our fleet at Meta. I was able to recreate the issue that you mentioned -- to
explicitly lay down the steps I used:

1. echo 1 > /proc/sys/vm/nr_hugepages
2. mkdir /mnt/hugetlb-pool
3.mount -t hugetlbfs -o min_size=2M none /mnt/hugetlb-pool
4. (./get_hugepage &) && (./get_hugepage &)
    # get_hugepage just opens a file in /mnt/hugetlb-pool and mmaps 2M into it.
5. sleep 3
6. (./get_hugepage &) && (./get_hugepage &)
7. cat /proc/meminfo | grep HugePages_Rsvd

... and (6) shows that HugePages_Rsvd has indeed underflowed to U64_MAX!

I've also verified that applying your fix and then re-running the reproducer
shows no underflow.

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Sent using hkml (https://github.com/sjp38/hackermail)

