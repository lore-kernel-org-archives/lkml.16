Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4D6A2D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747629540; cv=none; b=WQeoRWIUfGO9iqsL+DLwIC644HN4NbyCdU5S4l/nB9DAL5x8PkZ7UuHGdaQ/1Gl+jPGsavaN4gz/qGzqJba8ln9WdvHLTcQQVe09YA9Kv07UdWyNzn3+QvOFrTFBSPmk+CruEt+HTkDLEFl56MLSUo72rscyzs+2r0prHdUclts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747629540; c=relaxed/simple;
	bh=shw8XG/3u3quipp4vwRmP5PaojKFiLofuTofQGyCl0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uJPmDEEm5kayMl0vS8bM40px4YtyaLXX3z6kwsXKQynCEIiHBeyTTvBAQknCdKVPehPJBO9YPRbRRHeEmsgjxoC7kl+ejq0qlinR3FCt4AYsUvNxjuQjUB34Qwb3FAZdBU2vIxor/kqcZ2gMfiyk05NZC6pHHQCQta2/4iq85iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgQL+xF8; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgQL+xF8"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30ec226b7d6so1042454a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747629539; x=1748234339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAfY/KEFs3Nnw4j+JwYD/mkRdFSm5hVCKhpfrM8/duk=;
        b=WgQL+xF8oBXp4FVSBiPVSaP7oWG/dSHD8YBNxeOWV/j/7kmNfW8cN+p+R//4/Fxan+
         qss36nC+DnUJbfm9V1uSWJ7Foo7vYJmChBOgKUjcHSnL9WMJ2BTyWPewN+mRcE2D5Hgi
         1SUDt/mc2epUKBGvEGwp+KbzJPumHR2fKIlAe3PMuifsjbCz1gJuIvJWcYZyshmJE4za
         lUrzcFRcKA7w2wisGbsqpy5yLXL98A6p4HSxxrqFzJ4OiUmX2dShjG1flRSboUUcInla
         nFMEfWpGvpIj8OMOD0aR8pmnfu1q2W7oOKSmd+le4Vyuc3TjwaDTV4gXcGj1s2MkmsGW
         6tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747629539; x=1748234339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAfY/KEFs3Nnw4j+JwYD/mkRdFSm5hVCKhpfrM8/duk=;
        b=VjWgJbEtmE9auefRlivvvN+L+N3V3UZaXjsy6P8aiIuVqxAjv/cWYz1ZBroS2JmqY8
         VW+O6ZzgnyuNZqyAS/mKWbv31JrCdbDAiXqrQ4BNu2F//57yK9t8eKUBG2wT5QVoeI2C
         o3d56AOCAth82kHNRrz5miNEQkD/XwGT6Bd+f+mXXjwUhZIr01uGfpovdGT48yp9V/dV
         ViTi16wK9qDEYvKd7jh7Ysf25ReNaWNGQkEo8Z8rB0uqPBqnqdW1E8MD7qD6cPm04Umz
         PC411fsVss13DRcLD4bz4xFpOU4VkxHTguBzy7rv26yfbHNHYijHtXWiKdczTd0MaOB/
         kSgw==
X-Forwarded-Encrypted: i=1; AJvYcCUxwTEWN825ZUl9c8V8Pr1hHG/xrvddx4pM2/OUzWCZ1IIMgxa+ijOts7UqgG+BKFTRvBDeTF33y9nNQ3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNgdnzFZKfs9+tm2lyo1RrV3Igzlm3ETVc+pZiIEnObDVZerP
	HvGn/7wTA1ac//FhosBqf5mtY2q+9zI52RKMNl+f1dFyDX/kN/GZK7fR
X-Gm-Gg: ASbGnctf67BvDgCiO43nMdTVHMk00WAoOmFUIlzOhEt1tBJWa9hp5Bd8Ie+HIB5e51L
	k+XdYRL09Z8hNlU8rVYMmE4PETg0iepCz77YK4+lIUSyHSluFYiNJ2QANB9X1UX6jPspBTO6908
	U2cxYd0xsmL2m6hGXzNvbNHvjaaVojYW4E1RBmx+jUqrBywNJLO7b6bok+t0JaUhMBeHCg1NQGR
	bDpKvWXXXMgi1IAVpWg3lbkyC9kJX4UWnHZJ6nceR0AEtNxnlhYaK6C7MM3lSBS1PYW3FbC7C6B
	MPoy9Unj7g58RYXlqP2oFanJUIfqNG6QQXPiQvz7idmC/0B0FR0UVSid+IogIpzL/Qum7A==
X-Google-Smtp-Source: AGHT+IEAeJ+bJmyxtXDNaFlfx7Bn3bxXTxbgWpW2guDrKArEZpwPg3CE3vDsvqo54QS63bj/RjMEdQ==
X-Received: by 2002:a17:90b:3e8e:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-30e7d5a93bamr17027254a91.27.1747629538588;
        Sun, 18 May 2025 21:38:58 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.138.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d4892c3sm5642403a91.12.2025.05.18.21.38.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 May 2025 21:38:58 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: ryncsn@gmail.com
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	chrisl@kernel.org,
	david@redhat.com,
	hannes@cmpxchg.org,
	hughd@google.com,
	kaleshsingh@google.com,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com,
	ryan.roberts@arm.com,
	shikemeng@huaweicloud.com,
	tim.c.chen@linux.intel.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	yosryahmed@google.com
Subject: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
Date: Mon, 19 May 2025 16:38:47 +1200
Message-Id: <20250519043847.1806-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250514201729.48420-6-ryncsn@gmail.com>
References: <20250514201729.48420-6-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> From: Kairui Song <kasong@tencent.com>

> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index e5a0db7f3331..5b4f01aecf35 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
>  				goto retry;
>  			}
>  		}
> +		if (!folio_swap_contains(src_folio, entry)) {
> +			err = -EBUSY;
> +			goto out;
> +		}

It seems we don't need this. In move_swap_pte(), we have been checking pte pages
are stable:

        if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, orig_src_pte,
                                 dst_pmd, dst_pmdval)) {
                double_pt_unlock(dst_ptl, src_ptl);
                return -EAGAIN;
        } 

Also, -EBUSY is somehow incorrect error code.

> 		err = move_swap_pte(mm, dst_vma, dst_addr, src_addr, dst_pte, src_pte,
>  				orig_dst_pte, orig_src_pte, dst_pmd, dst_pmdval,
>  				dst_ptl, src_ptl, src_folio);
>

Thanks
Barry
