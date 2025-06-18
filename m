Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840341A316E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228109; cv=none; b=FnABeo3mIM52kJVyEPI5pCSbgXXZ5CR2xOgzdKN1OXWGvxpvguEIjAitKUgCXAE7lHxNfQVCj1v6LR3HpuDNp1/cw8JIHfZstY1By/kGYYMAZEeVyhdOrNGwjXmWCd1S6NTyM7Kl9m6RyXVeRqWiY/OUict04UxDbhuHzkettfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228109; c=relaxed/simple;
	bh=W1l7UdPX58azGa/bEcJUEXuiZ0Q01OETBuhRIHPsOFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L28Z5SsuNZu7mhBlZVBS5CYIv5Ok8YIfjrUKz3AQqs1IAP+VZIQUWUrTNjaMIpssB37nMWVGOAI3SalidNYvdheDvL8szP91xI4jAO4AYvh5K/k+xByuj5qkF2Xp8Wxl34BvrwNw3HQx5MHDSRL8s4I+4IFOGP2pOVipvKP7Ri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SKxtc28g; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SKxtc28g"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso5240950a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750228107; x=1750832907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI57uaSGABNj0PlhCXhnWj7DOQSN5+fWjT4KpZNdSHY=;
        b=SKxtc28grEnzVD1GPFFKu3HtBjYJNVNByptNoifLJ51sPeSlkRGll+VF2u0HyJN2lQ
         qER4xCFByWm6Bn7XroeFwHFyCc644QJhWIR8U6J7CseqqElDsUpCoeuDZtOQ7bK7deCA
         4pEysTk0GM75BoGjajB102XhI8/927y7sygGvJNaY56XbUSGa5X6ItyRtr9ZFkBSOtD/
         GkXDh2O/aBqjZoOEGRtmkGwR6PvphMVwd0OrUJD53qCOdkC3k/sP+ipANINseW7LA8rb
         9B0cFQexcWUCrKoO9RTax0rHQN/lWWEMGjtz8nMPWAa2fCyCRGOnOTXBGjw/CrfA8M+l
         z1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750228107; x=1750832907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI57uaSGABNj0PlhCXhnWj7DOQSN5+fWjT4KpZNdSHY=;
        b=UPoYaKRROv4SmVRbHjr9ruYAXD5tMl9HRA4Rhctr97aGjPqHpSKjTMU+hUoRuCW9C6
         oVJwtfcDXHdyeFe0T/MGrN0/SO03qdZt8NvcJghn+3xVZJhdvgEwiETFb0uxSCdhK8lL
         WocN7jK57GGCIeWAukDAgmycv+1eqMJbTflFeAH5gmjKbsakZAQReEOZ8U0jLH1kjODG
         7eJ3mXIjZ4NTpCwgNEvvkpGmSRimVaf3868VCXOm/TtYG6+bvoSje1kleX0TODRNHFqp
         u6xn0X4E0upbU5C8HMoeFoKCtWfGB6XkWLoMwh2JnVMdqp/qYxso/dXHQOrT7MEpisqI
         pntg==
X-Forwarded-Encrypted: i=1; AJvYcCXzRZYW/nC3R7EArhUsD8YW1PP87aGTc6hAf2LYf6AyusreUSSCiLmevu6tsq9iUfIQFgXS7JIUZvLGpYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9NpXXAzIl0Su5S/dlbRGlDAHXj8oL3QJLvZ4z1yUT0vBTJQ8
	aRmNoKCEOQn9vMVDJ3r5wHeLd2/26BNtZPvA8UsUqs3AaBkpD2Strp5KaVoP/oWXMUo=
X-Gm-Gg: ASbGncuUht8FTZGujVNx8K4s0t49yqMu2QFxSOxp3qIXxggDwrNGpHdowk4dneGyaDe
	5jjTaCvcB+u7z0/jVYwGCgUHz7ua1AYmgSNqYTjPNGzmajC705J+nuT1cY4E1MBL9ReaKyi1kmi
	fj8D3GWLmwPDL9OzKvVy9/oSmzegYzFGJPm5laEEHd6xfqTe3A3xuw5wTuuL6Wg9HrtwHi/eOWf
	tyccJwd7BqkJSyObUaud7wuV6OqdIMgWRUumb1Pq8mhLUb0DwHLN7PEnVzYGQ7F0TQTpQYeNNVS
	dWwKYg31YIKFUpZTpvloXAGAGeqvj8qdNW0TdqzcLdJ3mjbWwe84R/u7cD2s0LWSJ4C7n6idGwd
	UN7Iu09dk4OcJ
X-Google-Smtp-Source: AGHT+IE+2M9MkPtRgZNvLkNSyl6vr4XBqYCNAnKxfe0Vg46VcdclkjFTQaKK865r2eMg2Tgra0VrYw==
X-Received: by 2002:a05:6a21:1512:b0:21e:eb3a:dc04 with SMTP id adf61e73a8af0-21fbd495d28mr24231233637.3.1750228106695;
        Tue, 17 Jun 2025 23:28:26 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168b971sm10044933a12.58.2025.06.17.23.28.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 23:28:26 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca,
	david@redhat.com
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Date: Wed, 18 Jun 2025 14:28:20 +0800
Message-ID: <20250618062820.8477-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250617152210.GA1552699@ziepe.ca>
References: <20250617152210.GA1552699@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 17 Jun 2025 12:22:10 -0300, jgg@ziepe.ca wrote:
 
> Weird, but I would not expect this as a general rule, not sure we
> should rely on it.
> 
> I would say exported function should not get automatically
> inlined. That throws all the kprobes into chaos :\
> 
> BTW, why can't the other patches in this series just use
> unpin_user_page_range_dirty_lock? The way this stuff is supposed to
> work is to combine adjacent physical addresses and then invoke
> unpin_user_page_range_dirty_lock() on the start page of the physical
> range. This is why we have the gup_folio_range_next() which does the
> segmentation in an efficient way.
> 
> Combining adjacent physical is basically free math.
> 
> Segmenting to folios in the vfio side doesn't make a lot of sense,
> IMHO.
> 
>  drivers/vfio/vfio_iommu_type1.c | 35 +++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index e952bf8bdfab..159ba80082a8 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -806,11 +806,38 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>  				    bool do_accounting)
>  {
>  	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> -	long i;
>  
> -	for (i = 0; i < npage; i++)
> -		if (put_pfn(pfn++, dma->prot))
> -			unlocked++;
> +	while (npage) {
> +		long nr_pages = 1;
> +
> +		if (!is_invalid_reserved_pfn(pfn)) {
> +			struct page *page = pfn_to_page(pfn);
> +			struct folio *folio = page_folio(page);
> +			long folio_pages_num = folio_nr_pages(folio);
> +
> +			/*
> +			 * For a folio, it represents a physically
> +			 * contiguous set of bytes, and all of its pages
> +			 * share the same invalid/reserved state.
> +			 *
> +			 * Here, our PFNs are contiguous. Therefore, if we
> +			 * detect that the current PFN belongs to a large
> +			 * folio, we can batch the operations for the next
> +			 * nr_pages PFNs.
> +			 */
> +			if (folio_pages_num > 1)
> +				nr_pages = min_t(long, npage,
> +					folio_pages_num -
> +					folio_page_idx(folio, page));
> +
> +			unpin_user_folio_dirty_locked(folio, nr_pages,
> +					dma->prot & IOMMU_WRITE);

Are you suggesting that we should directly call
unpin_user_page_range_dirty_lock() here (patch 3/3) instead?

BTW, it appears that implementing unpin_user_folio_dirty_locked()
as an inline function may not be viable for vfio, given that
gup_put_folio() is not exported.

Thanks,
Zhe
