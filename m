Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D762045BC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225605; cv=none; b=EoLisg6sbqfSnO6Uuyo+Q9/8xuQqrrLcdzEj9sBFqPr7hMcW8hDqwXPvMtBWge2AeKM9M9JM+x7OLYV8EUd1jaIjOcB/kHANAYV758VbmXEzOr3TOBa+8/ro2gAcAVF21XmhxPJRhYHihfFiTVpyybtGntEyIaNQ19zC5rdakfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225605; c=relaxed/simple;
	bh=gtTIBC3Q0QQGcFu2q4J0SR9kkM1GoIUuQgVywB2Xm4Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FIyUQtEukSVucvp48FjHmtCO/seFyS7fI/ERtBs903+caWr7VQFuunK6fFPfWb0hEY72OdFWH+5ZMi8NP3UBd/bFzRKrCz+hv039L9Q85hpr40tupVukJh2yN01kZnCtdVy2SRMJg28tXHMguiJmiuGFAMkahvwhe2krKS2VHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=APoi7mvv; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="APoi7mvv"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8fb83e137so33323556d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1745225603; x=1745830403; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eost/be25fPZpDXj7+CKmcbdoPmFkSJH4e4lTEubNDE=;
        b=APoi7mvv/BH/zxnddt4130JohqyWgrJWBOQt39Ji4Nz+Wf3UlnHjvkernW7KRIhiiV
         l9LXvwZIQa3wP/2Endg3JWKUG+e9tG3X1jDQ/GR6l03AMxDuRI1KEqWZj+y0Pgt1JOsg
         ByWsFHXOi3JmJ22lFVAXARHI3oJiu8m70RX8s8zxycJdmTN2n1DDu6WwwH4kw239SLCR
         iadQDWN51ZpIZ2U4bnB3Qy/uxR7kbBAnS9QXlyzoEih1sVplzRyZIk6/3fAPFPtz91BN
         Azn6nrxdEXtOkNENRT+Ks/PhuRUtPzwAZY/4vNjUrnOG9lx96oSSDTRhqX9jAG91KXEf
         LKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745225603; x=1745830403;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eost/be25fPZpDXj7+CKmcbdoPmFkSJH4e4lTEubNDE=;
        b=fHQAfaM6uebmmQoaww6635wmLCWWUFzCALaTAyXWiGfggTrBpZcJUGhz98rBiblPfb
         jIFkDa1B5XFRUc4KVo2yjqNRRhYYUh5NWGpL4keCVLsqdKpQ6/rTLp1RWXUntRSvqjlr
         G+G7HJHX0d8x3XYfXOLQRw3ube+Bn4nBUsgwDXQPwk/OkgyZshj0BtnngMCNP4vZaH4h
         Ypmj5xzFpqSXsxPI5LpJ+rR5IqLQSKC1UcVXw7blgFeJuRUbFCdxYbfYpzfOh3s55PlA
         QTyPAPQzBh76BtKz7JaYI2lwD7GGYLf/slBVE7PN1IdNaGXcPq9sb5b4zWfT/VuREm2v
         N+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2n8bUG43wvVX3s6zJLGpgeYtQF0rIZvaK8/mZO7slpWf7jFqdN/MV59Re4telApy69JDagmoUFRPtA8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1e/cB3qieMRX3npKAcrSUKt2S4xPkkIgm2NSz/FqXSztD+WNR
	GTHsG9Ha7tgNDUm+MEGV7tUOcTejmY8LyWDaQUwopFl9GE30vLJkWZcYzdLeh1eg+ywRwg7x4SQ
	VgZTT7jjbqSvS6Lurr69nTJpvE0usI7R9snYhtIPS2eGFFsWOp9Q=
X-Gm-Gg: ASbGncv8nyndpk+N80UM9vT5yVbIJVNeUh04LEd4RuHkNnwfn/AbjD+PRJdTgrFKZ83
	I9IOk9r4pQKhugLcgU+V2CHyhC9osqp4F85yd2VwkJew2kG9V4mwMkBSa/2HCMzdngYCEC/8vfy
	GbH/g09gxCtpBMMAaPhBKdL38q8y4r68L3bjfWzA==
X-Google-Smtp-Source: AGHT+IFTXLFiHer36IIFOWiiN9O7eVQGpX9NVs4SsqjUj1WLyMeUJsEgUuoy2uu7qC1VOo1sFR3meKw1188fTPpCJ/Q=
X-Received: by 2002:a05:6214:c88:b0:6ed:df6:cdcd with SMTP id
 6a1803df08f44-6f2c45701ecmr201847936d6.21.1745225603134; Mon, 21 Apr 2025
 01:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Fleming <mfleming@cloudflare.com>
Date: Mon, 21 Apr 2025 09:53:10 +0100
X-Gm-Features: ATxdqUEI-DjXLEjTsWXDLoFAcw_0tI_MLiWA4ak0uvSP_dcRAK-NMpaRY9Ngsl4
Message-ID: <CAGis_TVSAPjYwVjUyur0_NFsDi9jmJ_oWhBHrJ-bEknG-nJO9Q@mail.gmail.com>
Subject: 10x I/O await times in 6.12
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"

Hey there,

We're moving to 6.12 at Cloudflare and noticed that write await times
in iostat are 10x what they were in 6.6. After a bit of bpftracing
(script to find all plug times above 10ms below), it seems like this
is an accounting error caused by the plug->cur_ktime optimisation
rather than anything more material.

It appears as though a task can enter __submit_bio() with ->plug set
and a very stale cur_ktime value on the order of milliseconds. Is this
expected behaviour? It looks like it leads to inaccurate I/O times.

Thanks,
Matt

---->8----
$ sudo bpftrace -e 'k:__submit_bio { $p = curtask->plug; if ($p != 0)
{ if (((nsecs - $p->cur_ktime) / 1000) > 10000) { @[kstack] =
count();}}}'
Attaching 1 probe...
^C

@[
    __submit_bio+1
    submit_bio_noacct_nocheck+390
    submit_bio_wait+92
    swap_writepage_bdev_sync+262
    swap_writepage+315
    pageout+291
    shrink_folio_list+1835
    shrink_lruvec+1683
    shrink_node+784
    balance_pgdat+877
    kswapd+496
    kthread+207
    ret_from_fork+49
    ret_from_fork_asm+26
]: 184
@[
    __submit_bio+1
    submit_bio_noacct_nocheck+390
    _xfs_buf_ioapply+599
    __xfs_buf_submit+110
    xfs_buf_delwri_submit_buffers+399
    xfsaild+691
    kthread+207
    ret_from_fork+49
    ret_from_fork_asm+26
]: 28123
