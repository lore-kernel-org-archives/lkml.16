Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB6238D49
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958623; cv=none; b=Hpfr/66JM49gqOLSO2CGX6lKs0CuGMPdDDDREumEPBCSlExF1CgH1iY3BkVXP8QY75Hxd2/TEKww1U0qIu5YlbS/ZSX3bc0TvJ2HdPW/Oz/FM83WLFsI1WP0QxWQcN87uR7v1oif8YhWNjIl4hL+cEYQ6SGnemLN4JICBoJrJxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958623; c=relaxed/simple;
	bh=1doqpPZBZdBJM8o+kHQlB7CeX2bycDJ6ijoRgFE2Vjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWUmAEh9fL/ovtfzIDBotjtbLJ+SIgkVW8ZeWHqEB1Itrcn7JyVySrgdgVzQANApqN9fcFEMcPWj5VCBccsNwvaooFz8jSg7QXQNoDUx/reiK/0KnWHB2Yq6hNomuaMJkJL1FN0q5MNMYoHoCRWA0oA9OwSBwfiWEnVzOHOOPJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kNIl6V3J; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kNIl6V3J"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a43afb04a7so29710211cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958619; x=1749563419; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=kNIl6V3JpKp6i8E1J3rartq8Eb1PZ0J+L6CKvgEXKdMxoKIiAfmyApPk6Y4TMiZb1x
         It/fmYK+k1cXfB8qG9pGwNRJjb4gPaxbUch+Mm8CIWuz7JVInJmWeoYZE3nZDBxao0md
         udDjoJz8SeH9bHFbetsiOzOJhUqdkwNzpkDkG1GV1/K0iEliFCR7/7nYpNCdgUlejOPG
         4xxdlClipsKftsjPceD+0xfW+xGFK49r1r5C25TYjU4CIh4b+FvbGPnpBsK8Q0mYwzCX
         xhN9Jb3u/lp1E5JmRLMQUZ5KmpVwImFt3N02p34b/K1tafFpvi/pGJeK3f9QTwtxu0N4
         YlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958619; x=1749563419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=hNZDCcReX7w4Z6ZZtmy872/DF+scz66vmWn8wUuqO3VMayMx9qj4IQMH1PsInZRwZg
         0wUS3DRDI1OACJ1fJafcHphPgrTzL039kvZZbkYjob1pB5xedR89Zd1bqPN4sY97JZEq
         5wdtmkThR/xH3r/l+ofqVV0+b54UZZ9f7F542OsOwci9INV43+CbnrefIB8+J7GPejpa
         Z9+WEBvM1DeUQOEb5/810y+0QDS5eiJv3O3xRV0cKfJfQZHsFZsIBzpr6ct2+NNXqNLQ
         1jx9fkk2KAtIseBrNGEiuw/VDW8MNWrSIA6h0b73j90j8/8Mt9XRK3WJJqDCwzljVzHE
         JCmg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Tn7E4lAgX+oSW+t6CsR7LkKnzgmbqLaP/yA6WRizgPLzPXqHVv9footZXKtLgR+BS68oIRo7OMalQu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0XihKPI8uzzZWcQcQOwulhpHcGDfOfde3bel2gy3IIGaKRvZV
	CIqhreJaXFZzGvWe0xqKXFhnVniD4imDndYAfOvIzbVZ6KiBl8n/ZUXY/0700CJR1QdgHCWLNcV
	mRABt
X-Gm-Gg: ASbGncvYveI86VPfcWL50kRJK+SO7d96f0dAX60cyDLAAQe6gtWBleo9YcHOGPoMQhf
	r4DLSDb7XdJGrwWzYmyNMPv+iMspvIMynQf61qtBOdXvH8sNM5dT0ww0W3ZQpC8pNbWTF4opi0J
	H6fiV5L6sZI4EW94B6k+OifOXiUJWBRrP4giu4I0YKD8JhUmXUpNyplYPvgQXTYUqqf5ynVAOvT
	WcfnmMNlq6t0GHtRQcfBDDSV576CfJG1mKOkP0ayK0oQpgPTpCSz4aYH0+xdjglIMyehWrN8f20
	D/jLA+ZFbiV4hkYpUCa78IVTO5bHw3OreLGkQg51gIU0wXSDs0g66AWYaAFuxIUHPo3cD9bTrJO
	TSq/pPDfSrdHQ94qqw6vZeduuwwQ=
X-Google-Smtp-Source: AGHT+IFrQ3mNOrW6/ZBr5BKf2weoO3iOKbQMChhnKb6iKzSLwy4jyxYkXr8u6rUugOKC/0R4gbcrnw==
X-Received: by 2002:a05:622a:4d96:b0:4a4:3171:b942 with SMTP id d75a77b69052e-4a4aed86ba3mr229299171cf.39.1748958619327;
        Tue, 03 Jun 2025 06:50:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358eef6csm75933171cf.48.2025.06.03.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS1y-00000001hCj-1MTz;
	Tue, 03 Jun 2025 10:50:18 -0300
Date: Tue, 3 Jun 2025 10:50:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net, Will Deacon <will@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 10/12] mm: Remove devmap related functions and page table
 bits
Message-ID: <20250603135018.GK386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:11PM +1000, Alistair Popple wrote:
> Now that DAX and all other reference counts to ZONE_DEVICE pages are
> managed normally there is no need for the special devmap PTE/PMD/PUD
> page table bits. So drop all references to these, freeing up a
> software defined page table bit on architectures supporting it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Will Deacon <will@kernel.org> # arm64
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  Documentation/mm/arch_pgtable_helpers.rst     |  6 +--
>  arch/arm64/Kconfig                            |  1 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  1 +-
>  arch/arm64/include/asm/pgtable.h              | 24 +--------
>  arch/loongarch/Kconfig                        |  1 +-
>  arch/loongarch/include/asm/pgtable-bits.h     |  6 +--
>  arch/loongarch/include/asm/pgtable.h          | 19 +------
>  arch/powerpc/Kconfig                          |  1 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 +--
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |  7 +--
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 53 +------------------
>  arch/powerpc/include/asm/book3s/64/radix.h    | 14 +-----
>  arch/riscv/Kconfig                            |  1 +-
>  arch/riscv/include/asm/pgtable-64.h           | 20 +-------
>  arch/riscv/include/asm/pgtable-bits.h         |  1 +-
>  arch/riscv/include/asm/pgtable.h              | 17 +------
>  arch/x86/Kconfig                              |  1 +-
>  arch/x86/include/asm/pgtable.h                | 51 +-----------------
>  arch/x86/include/asm/pgtable_types.h          |  5 +--
>  include/linux/mm.h                            |  7 +--
>  include/linux/pgtable.h                       | 19 +------
>  mm/Kconfig                                    |  4 +-
>  mm/debug_vm_pgtable.c                         | 59 +--------------------
>  mm/hmm.c                                      |  3 +-
>  mm/madvise.c                                  |  8 +--
>  25 files changed, 17 insertions(+), 318 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
