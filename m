Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270C26560D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207128; cv=none; b=Mh+Ow7k6XSHEBuCc63aotms+hEXRxGE76BYzFqlAeKxJJIxm9Ym/Iv+qlO8OpRipE+79ESrJvIh35piS/fAhkscmyzPBs65euDClhukWgbtI2lHMDqfJQWu93FoMHWAP8UMCnnOffROnvTshQ3bxspoJ1y1551Ib1TFVkWgsALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207128; c=relaxed/simple;
	bh=kqJ/vzdi+4pD3l7Oie2qrj02zzEjykMDOwyt0xCoIfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QM+Hw9EW+TUSZoI2ibPXXqSxqRJ9e2BSbmWGUzimh5Icl7TV6zTFRpshsHurnXUcOEnEKbsK3SdujcyRcpLviVZCNdQrNInjtRjqrTMdFtvGjdRFpynpfwZiJe/pb3YyYizVJjcbKQpAIIeVz/Mf3xUiUUfqHswImzyXvMtW7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDf5TEUN; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDf5TEUN"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-700b17551cdso67588697b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207126; x=1744811926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFkzRRjGlfniqiiK4NmzxF6T91eKT4uib6F/VnX4S4U=;
        b=DDf5TEUN7/7DNzZ3CU+jsDcTtQbgvPsi0PHMpWi9aCYaLlIoPdt1vNEvRZs2eJnKsd
         gKpneRnr7lgJyL+w8la2sqmNazd69WYVqlps0eA54JM350w8kPfuO4SVF41Vy7PfeEut
         Ophy7PXrI3Rk70F+oEF7usx6Rw37Nk0x+LN1qPDiMc0rfzSJJhjJmqi614gWsByDxTDB
         G8bIy0nW0EZwjSHkal8VuEIgN0bjH80M5dghdfvckWnjuDe6oa2Tzx/ah08p0DB+c7Ti
         QKdgDzhG2PMw1f+sByp8s0fg5dw0gyc/i4ENcflJNhEnsw4oV1rwCqLTLiikAD9DK/yH
         9+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207126; x=1744811926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFkzRRjGlfniqiiK4NmzxF6T91eKT4uib6F/VnX4S4U=;
        b=B6OBKvCXwh+OKLUROYhg7POw83pwobWaraEKiUQ9MiFmTm1wuaetcnsuGOJ9V+zZLZ
         HJgrrmyE7px4iV8iJdVQrFogLquEH5/vhNTj6MLVifWj6Cp90BL4XKFmXdP0gvmbkyfI
         zimXieqnayaggHV1B1YAtD0dS2u+QqxFAPrD8+PYz9r/LA8ALlwdz0rgrdO2XHaP65p/
         5MmG/bxHMmmsd+xjBLltxm+jcY6sEA9u60l7pcC9NbEW++UCSbDNEumBmaJSKnSz09Ij
         zGW8BE5KLAAtWlzQgJNKRTrQ9Tkf1MOt8L0P6u3iGlGoLGi091G3AX3uyoNWCS8PZrJr
         cR2A==
X-Forwarded-Encrypted: i=1; AJvYcCUQpGsWQ/27zB5tRtBZV8sLozNvHkydrFN/uH28hb7uQeTPp51YQXBaIrWyEwL0vwshSfIS4g/9VtYdVgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/zRgKtiCbKHNKB60reunnRa8vR2yaJ4lq418LCNRKRdbaSXF
	nZeqDYF55LCgztsB5+u13ACdLbaoq6dGMO1OlVeVeTEcsiqLTNNh
X-Gm-Gg: ASbGnct95tDNK6PADM/ixelF5n6xHJNHMsT4Qfz95XBDZpnV6V8s2HE0fdLc1cmsmsP
	uM6mNPfFDjq2tTW1xaNh/cqYP8gNLdST6scVjc21TC7CGMw972gOck7udbtTVRQpmtqccfKLzit
	63L8vCll3PxHT1Yk329R2ybeBLf9GzDylymGf4jknDfdaADYVpXoreT2QZX6AdqjNZSO/zSGloY
	6fQzi10HI8jMhNPB1ODC+B/Uwftkd/4plNRF2NUGsm1d6yh6bymDaPs6N0vNaqupdshI+7Z5EZa
	pQdK+zKy7QxNiHvwmK0Rf7hA1plbsqFc6np9rLsG2UFnOszZjQ==
X-Google-Smtp-Source: AGHT+IHgPEjLwXOKG3kfB9pqA9r0caEyN2w2YfhQl5CfbDz2Qdkbj+qyNa/RbQvICrjyM89E/6a6fA==
X-Received: by 2002:a05:690c:6f87:b0:6f9:88ba:aa5d with SMTP id 00721157ae682-7053ad6c3bfmr40470387b3.9.1744207125590;
        Wed, 09 Apr 2025 06:58:45 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e372ed0sm2728577b3.93.2025.04.09.06.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 06:58:45 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: akpm@linux-foundation.org,
	mike.kravetz@oracle.com,
	david@redhat.com,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: hugetlb: Fix incorrect fallback for subpool
Date: Wed,  9 Apr 2025 06:58:43 -0700
Message-ID: <20250409135843.2012726-1-joshua.hahnjy@gmail.com>
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
> ---

Hi Wupeng,

I hope you are doing well! It's been a while since this fix was sent in, and
there hasn't been any comments on the test either. Would you consider sending
this patch again without the RFC tag? I think that might help in the way of
moving this patch forward : -)

Thank you again for this fix! Have a great day!
Joshua
