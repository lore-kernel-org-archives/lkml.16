Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4562D97B1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029328; cv=none; b=UPaTKA4oVdYgBZ7+iZc1nJMSEtNcf5cb6T+8f6FHqe+uOW8xdAh+UWYrPAV6EL5Nvnq09Y4N6BhBZy4JFHz9W/Jxbdr/MiwbtbXfPRqxUwGpJa0b8JsG0JgEKGdsD3yfAsrFCd/RgaWHp2n6rwmCmULKdWhKVYtB5ousBBA0JeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029328; c=relaxed/simple;
	bh=F8EDOzjXrDbWmnlmZz1t7I4za8xIMeSWdmVPPoPujGc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1RD79HjHXiH329dxaQc0W9lmf8mStNRPLbkChUiGdat+MHr09FDa2lt9HXOVxUQjfZvZgCRTRf5eiFWjp/nokcZ5lO1lZ9iXiTAur3QYvrC4yO999nZDzvAkOFeUl72En/70oZF1BfUTqb1xnwhAOnzmdxQDhuC6ZDMwi+h7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TjHOIKIG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TjHOIKIG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso312697f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751029325; x=1751634125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22QdyLiFVtJ8aqoY0Hwoc5WCRF3aJ1CurJSMqFHJ5LM=;
        b=TjHOIKIGsTToYCvmb1pMomrug+hddc6M7/A6WuC/SDHTKFjXa1/72SHQ6yzY/CCXyU
         kwQ3UINLco0d5hiB86/u8OSWxEnrmBfUwuk6PsAm2HVdWVxfkhYy+lq3c8nXatxDx3RO
         e+JMAqNTd8N1HXCj11RWq/NBbBbgqsXng+IVVl4d6M9Uy4hkQjphEVs/f+HWkmUcFp9L
         vn7tqqMHvODkjWBcliiZbUSTk5W43zyQkg6Hkbzcf7+i+6bJkwxXUMelQgV7wy8pYY75
         FDRP3Fgr806mIasmnAm+0FFolQItsbn7WtrwiekoGhbkI0Mag/8cl3ISrKDFo1opy8vQ
         mrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029325; x=1751634125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22QdyLiFVtJ8aqoY0Hwoc5WCRF3aJ1CurJSMqFHJ5LM=;
        b=jR/YO+tlWjNxgT8VD+7OrJO7Ivi/VZ4yi32ZJYlvjoneuFYSCzXjaW4UZd04QL32JM
         TGKWa7UNnqIDGh0FUKzQdBmFLZ5zDiOzkDfm32iBc0PB/1d7hqNa10eJIZPOnqItXryL
         Be+EeVJfF1LBiNbtR68XVj7l3TCpmBT4VGn/ePfQoWu1SdAzFR0q4W11Y+2bEwg+o+eA
         7bUmSU8aX4qnLlnG2H9sKlTbb/RlpGwMno0XHgEuPLGUYy0jEmTaPTTzyDdY+/i/Wudn
         7Me6jzVG8M+BtogkjHoO+gDboP34/JvZXLNbUrCsHqRvruONPqikucRA9l6rWgUKtq7b
         5Leg==
X-Forwarded-Encrypted: i=1; AJvYcCUAsksbPvf1JSbz8NWvdgHmhDizMkCrVC4t4FqX4Cv5hpAoYukyVxu99LWpjJ3rrIuug/22jJd5JAQ5Bw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhSu7S4RlWymfua35r6qbAZl15S7MwADzntjYiZdAjDPB/OOvE
	hiBYi4YZ6PQlTPFDCMhO2JtWcnEsXPUPfkUNQ4dv2yMObIp5h5JTjNzuTeGWcBiHEJo=
X-Gm-Gg: ASbGncsrbcJk9P2fjjtSfzRDKe6Vd26+Onl7sj76MbUV6NsucyO521DzGZI6bDTd4ea
	LhYD0NFK+1z8CLMNyrnUpORDXKFCSUyrXim/7Kij8tFWFSSJHrfoF0iEFGoBOpYv0yv1ejFQpcD
	SPu/Yb+fkYtwerhosyHDMrLBWIgIB9xK5hszQKxRWEkT/4lUQopoQR3lUx0AbYuwTUkM2gLDiTd
	z63Dqd5ZZDx4uweWxz+WT6hwDscAueJOGyJbRwxm9nNRK9gGNNraGF9GHi3jLBGm37xruDZ4wAL
	1cxwMjqOVRSnDw8JZ3hxcDKmfifjHobGCLK8K3sSBgKhVaXAgTn9PKbYVRrqqgkyxK57uBEfp6X
	SNj/FQM8sUrLrvby9ZyXZsaFD83rNDkO8SVWgQQwjdIhX/sSPHKN1AydLMg0hG0da3UrwgYcTGY
	l6IQ==
X-Google-Smtp-Source: AGHT+IE+dpgMJXXbb3Q0ZAuKEMDWMdgM8HtfCx3M03+1P4Vz5NMyiQcifzE/Bk4mh1MZJwWBbhP/JQ==
X-Received: by 2002:a05:600c:8b22:b0:453:76e2:5b16 with SMTP id 5b1f17b1804b1-4538ee5dc7cmr13153575e9.0.1751029324438;
        Fri, 27 Jun 2025 06:02:04 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm50817745e9.30.2025.06.27.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:02:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:02:00 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Leon
 Romanovsky <leon@kernel.org>, Keith Busch <kbusch@kernel.org>, Caleb Sander
 Mateos <csander@purestorage.com>, Sagi Grimberg <sagi@grimberg.me>, Jens
 Axboe <axboe@kernel.dk>, John Garry <john.g.garry@oracle.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>, iommu@lists.linux.dev
Subject: Re: [PATCH 7/8] docs: dma-api: update streaming DMA API physical
 address constraints
Message-ID: <20250627150200.2192c6b1@mordecai.tesarici.cz>
In-Reply-To: <aF6Urf667AKtVGXr@infradead.org>
References: <20250624133923.1140421-1-ptesarik@suse.com>
	<20250624133923.1140421-8-ptesarik@suse.com>
	<aFynHWAYtKPFT55P@archie.me>
	<20250626070602.3d42b607@mordecai.tesarici.cz>
	<bdb3a37a-a9d3-44c1-8eb7-41912c976ad1@arm.com>
	<20250626154818.46b0cfb1@mordecai.tesarici.cz>
	<0f95be6d-2e13-4281-98b5-6d4311a3b98f@arm.com>
	<aF6Urf667AKtVGXr@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Jun 2025 05:55:09 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Jun 26, 2025 at 05:45:18PM +0100, Robin Murphy wrote:
> > Indeed that might actually end up pushing things in the opposite direction,
> > at least in some cases. Right now, a driver with, say, a 40-bit DMA mask is
> > usually better off not special-casing DMA buffers, and just making plain
> > GFP_KERNEL allocations for everything (on the assumption that 64-bit systems
> > with masses of memory *should* have SWIOTLB to cover things in the worst
> > case), vs. artificially constraining its DMA buffers to GFP_DMA32 and having
> > to deal with allocation failure more often. However with a more precise and
> > flexible allocator, there's then a much stronger incentive for such drivers
> > to explicitly mark *every* allocation that may be used for DMA, in order to
> > get the optimal behaviour.  
> 
> It really should be using dma_alloc_pages to ensure it gets addressable
> memory for these cases.  For sub-page allocations it could use dmapool,
> but that's a little annoying because it does coherent allocations which
> 95% of the users don't actually need.

Wow, thank you for this insight! There's one item on my TODO list:
convert SLAB_CACHE_DMA caches to dmapool. But now I see it would
introduce a regression (accessing DMA-coherent pages may be much
slower). I could implement a variant of dmapool which allocates normal
pages from a given physical address range, and it seems it would be
actually useful.

Petr T
