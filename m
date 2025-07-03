Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504A28DB64
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 04:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751516311; cv=none; b=YbyvE4Eg7O2y1vnq5CyH/NDbqUQr/E4JA7M3KSmMGHjGoe2bsvmyxmq9AYDaFKBBBgZ/tpNe2FvmZ2Vdty28TqehGNuoTMdSnpkAQigVgHDoIjNs82YiaxlTSX3Q7jcBz7zUQJpdacTgMSrnWJKPbo8KALd+SjuX0pytjlk/VFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751516311; c=relaxed/simple;
	bh=n853TwlO290HC3DFOSZa3fC5HPi/a6KwpQlo+fZZXWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3/2rnlCA4BMUUjq7DVmnKfOLNABOv4++5+8v9CVW1WKafH32kJRU6+1TZeLlMHjuylGihrUmymAylQl6S0o94uxPgeoibs5bE0sOjOYcBQbnL91r+eHqqEhjUe1uueH93+obd967JLlcILYUKko4Hsyl/piYHNoi+nJiPa8fik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Lq6AR6aJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Lq6AR6aJ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7426c44e014so7568218b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 21:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751516309; x=1752121109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6A9qM1W1kTMfxV7iEFaeSovxnFad4ELH4SHsOsiAsk=;
        b=Lq6AR6aJxebvK+4lRzboUjWWGULi4QAaGggRuZ+cI1TiGsLUY/Rqi3+bi5eEkJrCpG
         vqvwcPmTuYIpbFfWNIDDXFfGfra8Ge6oaiEG0RJ19rUIOXQhQbPY+Z9+OPthdAYUMUFW
         YUZXPIg12aA99/qnGKuWWMJqYXhozdq9oJRzDFm0i/MOeNJ6gJt0R8+av3sOnEQtOH+2
         iEWERFn/HazKjmjA7LoZNENHihHKKBlyzKFlCjTV0LqYFybjoJTNp0qDepLzGg36I1gX
         XCOSZlFB7q5/FiVyd8mragICFF/t1WQ9GirtOYpLayxDLXuHsHinY/Hjq+dtKGpTBcCu
         mhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751516309; x=1752121109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6A9qM1W1kTMfxV7iEFaeSovxnFad4ELH4SHsOsiAsk=;
        b=CSZS6kwgSMEFCENSEFjCxQHUKL5GO4j/ke1MHKH9+EmLulWyF3+2GAh2QIPKflxX6U
         X6hOhdPREb+O+/udn0US5qa1qZC7opHuv1ksrVIDy3n5k6lPUJVdKpPohNBxSat9vCO+
         ZpjuPW2Q/14aVl3uCV0cVblnA6XrwQ+l1t9k7iF+WBEsPmooudXV3ZyDIU+1I0akFH7T
         3uK5d7YCD2AzitQuEzVp7mlGDidfl0lKAF9rWbhSr9goNPa0y4e0ADIoy1ejronSn/DX
         6NQaII+wvsyZR+NwDHuDccDzjU67FkVdE6kxUdlc9U54lgPvf23M/CGEMEd1KGFt6l99
         A6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqUibRKcbEbSS3YnbixXdpFiIS4C3QSMLoIqOK6lMqzageBzcDRkdio6/uBtRYTFptxyoqJkmb4Qt/JQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnuzR0lrmqb+YPSP1Zg8OtxdqhBWozx5deEcQDakPp2ckxO2zY
	/bFROImLWhPCbs80cnJ6Az3nm2HuRyLFhQUPoPbR9egZZUfs6/oAe0g6XKjr1fSgBTU=
X-Gm-Gg: ASbGncswShzYe/zQA9RHF8cPNLmGQzuKcMPFA0owC2uhzVV5uXNVMDORQl9Y9R8mbjK
	sMN3WDEWkUdhFm0G848DAhvB80g/hqRf7sgBVjJzHtHk1Dblt1Rao+KJWhth6LtOA1BkcNXlFNv
	t+CZH4eIpDN6ybyKdvBkw1w/wFWfj81GC9v8D5djS9aPlpZBP19iB9+GIhZ0ZJV1LG+ryIQDpeX
	5bk3K6NAdWdSARhIwf1vuY6AglHQTolRTPP1reotb7yV7iTMYT260i8fKopQirkXhuuLcpeoLvF
	RS2Bjfy8ze5IkzwvAhyWSk21VJ10CzkF3ohtVMS4wwoHLW412sTMvnli+i/aMMFyXqZsrb6tmjm
	2TxfA+gBAsYVs
X-Google-Smtp-Source: AGHT+IGODDTqgpEaoXWqjlMlT787ig8FJP/T1SAPH4oWUJ6Gg94JEZiVKBCBdsPXOE7/4ni32QnqvA==
X-Received: by 2002:a05:6a20:7fa9:b0:21f:a6c9:34d with SMTP id adf61e73a8af0-2243cae4263mr2443342637.1.1751516309240;
        Wed, 02 Jul 2025 21:18:29 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5573e71sm16905004b3a.98.2025.07.02.21.18.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 21:18:28 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca
Cc: alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com,
	jgg@nvidia.com
Subject: Re: [PATCH 2/4] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Thu,  3 Jul 2025 12:18:22 +0800
Message-ID: <20250703041822.37063-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702182759.GD904431@ziepe.ca>
References: <20250702182759.GD904431@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Jul 2025 15:27:59 -0300, jgg@ziepe.ca wrote:

> On Mon, Jun 30, 2025 at 03:25:16PM +0800, lizhe.67@bytedance.com wrote:
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > The function vpfn_pages() can help us determine the number of vpfn
> > nodes on the vpfn rb tree within a specified range. This allows us
> > to avoid searching for each vpfn individually in the function
> > vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
> > calls in function vfio_unpin_pages_remote().
> > 
> > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index a2d7abd4f2c2..330fff4fe96d 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -804,16 +804,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> >  				    unsigned long pfn, unsigned long npage,
> >  				    bool do_accounting)
> >  {
> > -	long unlocked = 0, locked = 0;
> > +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> >  	long i;
> 
> The logic in vpfn_pages?() doesn't seem quite right? Don't we want  to
> count the number of pages within the range that fall within the rb
> tree?
> 
> vpfn_pages() looks like it is only counting the number of RB tree
> nodes within the range?

As I understand it, a vfio_pfn corresponds to a single page, am I right?

Thanks,
Zhe
