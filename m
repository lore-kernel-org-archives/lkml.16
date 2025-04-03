Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591A2451F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670793; cv=none; b=lt9M58wQhykTINpknlSF52RQawd4JYs364Vu/wyTpSYnMcwVZaZVjscltsDw0ogTyvNr3YJf8nIekfeFeRPMbr+xsra2oXEBxw3ZbvReT2pduNcWwApeTuHhoEsUF4aT4xYuUpf0asBbgkpVfnHc+RuRh6oQtCgtrB05ZV5OwtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670793; c=relaxed/simple;
	bh=mGUq16/UmGEEMYrIY2tCZfZXSIRhMmrpOz9HB+k/VcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5lgnFYmokppZXXfIkIwcoUdxkp70/jgz9Ic6cYK2UvIixQ35YJv68xJ+3Swf7byJoJ10jfHN6/1q5MeRxlqYm6WdEk1g2G5AAwFgEXmQVVsgO6ytsn6y5YmmyQHFg41GeSH95Wu9Nvrw4uZKgutCPgM4Ifm9wBaykYh8xCQz9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DXV6Yn3+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DXV6Yn3+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c30d9085aso216719f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743670790; x=1744275590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ICyC3s+pJ3fIMtUsu9o7pDmgGeOfPEFH4SmR3vdTuEY=;
        b=DXV6Yn3+5S0ihm7HYWBo6LFOlRmBONcNjHz37fbA5B+9HOzwUgILrSBqkb0xSwcToA
         5zkid2oWr0MBjJnt4v7QTmKiRcG9b4W7baVLFIa6HthbZ87/+xOBjTT4OLSGts8InM4a
         3cDlxfHlezx4895cqH7hI1+POYSNkdyrSyCuCzJhsz5+LQzMI625FtOiab7CZAbJ0Wa5
         DSIc0aqhij7k4BHQopLFTtrSVMRnHj4/79G7QAcl/FUknd/9I8KsmT5BS9aNqKt1EYdn
         O74YGGrrieXh61xjpuffq9Emd2Xm9j5OoDSQQmqZHWpnvh8HMA313ZBOoedJYUW4wIoL
         1cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670790; x=1744275590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICyC3s+pJ3fIMtUsu9o7pDmgGeOfPEFH4SmR3vdTuEY=;
        b=sUXg7FTNIWccmsrb7eHmzYyfdGaZXmSIX75GeZSaxVn7EQVe7MaxVn01j5n00KIDTy
         /d4/DfEfmFfezTxJBZVtdTcFKgnTf8y+yo9FCkgecixthRAM+aQN/sMxvyPFHInmidXa
         ktOSGypa1STgxvKcXvUywq5dInyNeB+I4zfOzDSlRCtt0WrImEmm5ELusyJ81XchgmUl
         2OLI4Pi0ljCnVoTDCfjQMtYl3UZQFtUfyS9XDTLx8OjYN9etor8aQVsF1SmccOCnlrsz
         oY0RDqdagtejuUJnINVkcDqJErDpOxwFnChmY+eeh/+xmbEldpgDmWMJ5FYdUZGIheRm
         Xlhw==
X-Forwarded-Encrypted: i=1; AJvYcCWpS83LYOyIrN62HcF9yFv+qYA2Ms46+A3BBWnyUlGrPo/4k2f4zGnCEjKkggRxRCc7cy+UWcVffErmopY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDtqAcox5ddXYYu8evnUKd43EzHfKKb2wqqLP5yIP1zEUKzx7c
	+TBn6F6EvdnTib6JWxRe4OizdxERm0syRbm69/UB3IPYdzSFtGNgEYzqKGrRfRs=
X-Gm-Gg: ASbGncvPuqwP7pQicBHYgBsYmeH6RTFQb2kCijouE9M4e0NcxZWse2I9D8wUSRWOFy/
	STMFPQzozf/mInjO/yKmid09dADQ9F0PTPzZMnM4HeyuHI+biYE6XXoeBWaj4IycCNlRqJ1rj2f
	PO85duJXxXSqBvdDYSlyXBCqLHXzorhPR43oGjCmIaFca0BY7aXJgGirVXr+4zpRhJsIkW8BMjn
	w4fpgXuHs/Rb0nBKf5XiAlfKijxqG7p2X/1A1K6ic2dFZdHg/4PHACbAXrh6ZTiUdzRG8BQjumo
	kbf87YNwrp9UjK5K8vFiK292ljPooGqon5gSdHxogmylBGvo8jbphqo=
X-Google-Smtp-Source: AGHT+IF6/cKhg/tRYLRyYy0gd6WLgBem2gk7vTyRY7tWsUc2r/1wFw8LOKnBmlJm7eilsE2eyynOmQ==
X-Received: by 2002:adf:f40d:0:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-39c2f945f61mr1028102f8f.41.1743670789943;
        Thu, 03 Apr 2025 01:59:49 -0700 (PDT)
Received: from localhost (109-81-82-69.rct.o2.cz. [109.81.82.69])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30226dfesm1199443f8f.97.2025.04.03.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:49 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:59:48 +0200
From: Michal Hocko <mhocko@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Dave Chinner <david@fromorbit.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>,
	joel.granados@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm: kvmalloc: make kmalloc fast path real fast path
Message-ID: <Z-5OBJrdjDBj_nrr@tiehlicka>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>
 <Z-43Q__lSUta2IrM@tiehlicka>
 <Z-48K0OdNxZXcnkB@tiehlicka>
 <ad7b308e-64aa-4bd4-be1c-fbcdd02a0f10@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad7b308e-64aa-4bd4-be1c-fbcdd02a0f10@suse.cz>

On Thu 03-04-25 10:24:56, Vlastimil Babka wrote:
[...]
> - to replace xlog_kvmalloc(), we need to deal with kvmalloc() passing
> VM_ALLOW_HUGE_VMAP, so we don't end up with GFP_KERNEL huge allocation
> anyway (in practice maybe it wouldn't happen because "size >= PMD_SIZE"
> required for the huge vmalloc is never true for current xlog_kvmalloc()
> users but dunno if we can rely on that).

I would just make that its own patch. Ideally with some numbers showing
there are code paths benefiting from the change.

> Maybe it's a bad idea to use VM_ALLOW_HUGE_VMAP in kvmalloc() anyway? Since
> we're in a vmalloc fallback which means the huge allocations failed anyway
> for the kmalloc() part. Maybe there's some grey area where it makes sense,
> with size much larger than PMD_SIZE, e.g. exceeding MAX_PAGE_ORDER where we
> can't kmalloc() anyway so at least try to assemble the allocation from huge
> vmalloc. Maybe tie it to such a size check, or require __GFP_RETRY_MAYFAIL
> to activate VM_ALLOW_HUGE_VMAP?

We didn't have that initially. 9becb6889130 ("kvmalloc: use vmalloc_huge
for vmalloc allocations") has added it. I thought large allocations are
very optimistic (ie. NOWAIT like) but that doesn't seem to be the case.

As said above, I would just change that after we have any numbers to
support the removal.

> - we're still not addressing the original issue of high kcompactd activity,
> but maybe the answer is that it needs to be investigated more (why deferred
> compaction doesn't limit it) instead of trying to suppress it from kvmalloc()

yes this seems like something that should be investigated on the
compaction side.

Thanks!

-- 
Michal Hocko
SUSE Labs
