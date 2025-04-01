Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F11E47B3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496090; cv=none; b=MDqJhRjep2etxKYLothimBvoqvkEzcP2+GBBWPKPn7i2fafG4VF51OA11Ld+EJIwrKtfdLFBo+0gFCQ9IeIOPjVxRuq3MlOd3O0kPydNQebpWS0WJ8sWk7Js2Dskl5vznXGxxpgKZrnGAlJhrcqSQTOqrbHdFlW6/mgOitGMbZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496090; c=relaxed/simple;
	bh=pDihNCCDma+VlIuv63KxjPYHmQWJzFHn62ZZzs4AjKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Za3U5la0j2xrypoLX+hdCYhUdC98hUietr1Gdw0dLSxpBxjGj15Q2w8/PlJRaJWYglsEPgHhEDmLoPJVfH9IUYNwPzIR/Wp7zByH6neAg84/DC7BGRkWzofNRbDI+Al/UBCcb7YCb/pKD6Gh/sAEMP/xAH/a/sLL0f0iPOQLSsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NnyeM8D+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NnyeM8D+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743496086;
	bh=pDihNCCDma+VlIuv63KxjPYHmQWJzFHn62ZZzs4AjKo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NnyeM8D+/BeY/vcbfIo13k9HBGBKlO3DKxzRA1PSrBxweQyvyKE3WLR5P8zgE81+X
	 8i3M7hVIB6U8kY5SnLo68duDjD9MTyJhGtbmu9rnmK2UejwRMFkNhFi8kIJOkCqvjn
	 83QCfsB4IRZBs6/YOxXKAKPEMDRCcQ1W1ojqY56oT2D4nn7PizyytNmyqXZiy7hRdr
	 c5JrqC2J5DaMPlm0i5xWNLnWp1dKBAb6d/6qV8Q0SPhecZy0a76M2jzbBmKI/Fp9sz
	 szLFkptT4B0mFdsZ4t3NuztwmExcsePbAqpI6H2cvNpBgEb2OSbDuwUToU8U/FysH7
	 W41Ja0e/5qIVQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E17C17E0FAF;
	Tue,  1 Apr 2025 10:28:05 +0200 (CEST)
Date: Tue, 1 Apr 2025 10:28:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v2 1/6] lib/scatterlist.c: Support constructing sgt
 from page xarray
Message-ID: <20250401102802.07519073@collabora.com>
In-Reply-To: <20250326021433.772196-2-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
	<20250326021433.772196-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Mar 2025 02:14:21 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> In preparation for a future commit that will introduce sparse allocation
> of pages in DRM shmem, a scatterlist function that knows how to deal
> with an xarray collection of memory pages had to be introduced.
>=20
> Because the new function is identical to the existing one that deals
> with a page array, the page_array abstraction is also introduced, which
> hides the way pages are retrieved from a collection.

Let's see how things look/work with an xarray -> array copy step for sgt
building, and we can consider adding an helper for direct xarray array
to the scatterlist lib later on. The reasoning here is to limit the
number of dependencies on non-DRM stuff at first.

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  include/linux/scatterlist.h |  17 ++++
>  lib/scatterlist.c           | 175 +++++++++++++++++++++++++-----------
>  2 files changed, 142 insertions(+), 50 deletions(-)
>=20
> diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
> index d836e7440ee8..cffb0cffcda0 100644
> --- a/include/linux/scatterlist.h
> +++ b/include/linux/scatterlist.h
> @@ -447,6 +447,11 @@ int sg_alloc_table_from_pages_segment(struct sg_tabl=
e *sgt, struct page **pages,
>  				      unsigned int n_pages, unsigned int offset,
>  				      unsigned long size,
>  				      unsigned int max_segment, gfp_t gfp_mask);
> +int sg_alloc_table_from_xarray_segment(struct sg_table *sgt, struct xarr=
ay *pages,
> +				       unsigned int idx, unsigned int n_pages,
> +				       unsigned int offset, unsigned long size,
> +				       unsigned int max_segment, gfp_t gfp_mask);
> +
> =20
>  /**
>   * sg_alloc_table_from_pages - Allocate and initialize an sg table from
> @@ -478,6 +483,18 @@ static inline int sg_alloc_table_from_pages(struct s=
g_table *sgt,
>  						 size, UINT_MAX, gfp_mask);
>  }
> =20
> +static inline int sg_alloc_table_from_xarray(struct sg_table *sgt,
> +					     struct xarray *pages,
> +					     unsigned int idx,
> +					     unsigned int n_pages,
> +					     unsigned int offset,
> +					     unsigned long size, gfp_t gfp_mask)
> +{
> +	return sg_alloc_table_from_xarray_segment(sgt, pages, idx, n_pages, off=
set,
> +						  size, UINT_MAX, gfp_mask);
> +}
> +
> +
>  #ifdef CONFIG_SGL_ALLOC
>  struct scatterlist *sgl_alloc_order(unsigned long long length,
>  				    unsigned int order, bool chainable,
> diff --git a/lib/scatterlist.c b/lib/scatterlist.c
> index 5bb6b8aff232..08b9ed51324e 100644
> --- a/lib/scatterlist.c
> +++ b/lib/scatterlist.c
> @@ -423,43 +423,53 @@ static bool pages_are_mergeable(struct page *a, str=
uct page *b)
>  	return true;
>  }
> =20
> -/**
> - * sg_alloc_append_table_from_pages - Allocate and initialize an append =
sg
> - *                                    table from an array of pages
> - * @sgt_append:  The sg append table to use
> - * @pages:       Pointer to an array of page pointers
> - * @n_pages:     Number of pages in the pages array
> - * @offset:      Offset from start of the first page to the start of a b=
uffer
> - * @size:        Number of valid bytes in the buffer (after offset)
> - * @max_segment: Maximum size of a scatterlist element in bytes
> - * @left_pages:  Left pages caller have to set after this call
> - * @gfp_mask:	 GFP allocation mask
> - *
> - * Description:
> - *    In the first call it allocate and initialize an sg table from a li=
st of
> - *    pages, else reuse the scatterlist from sgt_append. Contiguous rang=
es of
> - *    the pages are squashed into a single scatterlist entry up to the m=
aximum
> - *    size specified in @max_segment.  A user may provide an offset at a=
 start
> - *    and a size of valid data in a buffer specified by the page array. =
The
> - *    returned sg table is released by sg_free_append_table
> - *
> - * Returns:
> - *   0 on success, negative error on failure
> - *
> - * Notes:
> - *   If this function returns non-0 (eg failure), the caller must call
> - *   sg_free_append_table() to cleanup any leftover allocations.
> - *
> - *   In the fist call, sgt_append must by initialized.
> - */
> -int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
> -		struct page **pages, unsigned int n_pages, unsigned int offset,
> -		unsigned long size, unsigned int max_segment,
> -		unsigned int left_pages, gfp_t gfp_mask)
> +struct page_array {
> +	union {
> +		struct page **array;
> +		struct xarray *xarray;
> +	};
> +
> +	struct page * (* const get_page)(struct page_array, unsigned int);
> +};
> +
> +static inline struct page *page_array_get_page(struct page_array a,
> +					       unsigned int index)
>  {
> -	unsigned int chunks, cur_page, seg_len, i, prv_len =3D 0;
> +	return a.array[index];
> +}
> +
> +static inline struct page *page_xarray_get_page(struct page_array a,
> +						unsigned int index)
> +{
> +	return xa_load(a.xarray, index);
> +}
> +
> +#define PAGE_ARRAY(pages)				\
> +	((struct page_array) {				\
> +		.array =3D pages,				\
> +		.get_page =3D page_array_get_page,	\
> +	})
> +
> +#define PAGE_XARRAY(pages)				\
> +	((struct page_array) {				\
> +		.xarray =3D pages,			\
> +		.get_page =3D page_xarray_get_page,	\
> +	})
> +
> +static inline int
> +sg_alloc_append_table_from_page_array(struct sg_append_table *sgt_append,
> +				      struct page_array pages,
> +				      unsigned int first_page,
> +				      unsigned int n_pages,
> +				      unsigned int offset, unsigned long size,
> +				      unsigned int max_segment,
> +				      unsigned int left_pages, gfp_t gfp_mask)
> +{
> +	unsigned int chunks, seg_len, i, prv_len =3D 0;
>  	unsigned int added_nents =3D 0;
>  	struct scatterlist *s =3D sgt_append->prv;
> +	unsigned int cur_pg_index =3D first_page;
> +	unsigned int last_pg_index =3D first_page + n_pages - 1;
>  	struct page *last_pg;
> =20
>  	/*
> @@ -475,24 +485,26 @@ int sg_alloc_append_table_from_pages(struct sg_appe=
nd_table *sgt_append,
> =20
>  	if (sgt_append->prv) {
>  		unsigned long next_pfn;
> +		struct page *page;
> =20
>  		if (WARN_ON(offset))
>  			return -EINVAL;
> =20
>  		/* Merge contiguous pages into the last SG */
> +		page =3D pages.get_page(pages, cur_pg_index);
>  		prv_len =3D sgt_append->prv->length;
>  		next_pfn =3D (sg_phys(sgt_append->prv) + prv_len) / PAGE_SIZE;
> -		if (page_to_pfn(pages[0]) =3D=3D next_pfn) {
> +		if (page_to_pfn(page) =3D=3D next_pfn) {
>  			last_pg =3D pfn_to_page(next_pfn - 1);
> -			while (n_pages && pages_are_mergeable(pages[0], last_pg)) {
> +			while (cur_pg_index <=3D last_pg_index &&
> +			       pages_are_mergeable(page, last_pg)) {
>  				if (sgt_append->prv->length + PAGE_SIZE > max_segment)
>  					break;
>  				sgt_append->prv->length +=3D PAGE_SIZE;
> -				last_pg =3D pages[0];
> -				pages++;
> -				n_pages--;
> +				last_pg =3D page;
> +				cur_pg_index++;
>  			}
> -			if (!n_pages)
> +			if (cur_pg_index > last_pg_index)
>  				goto out;
>  		}
>  	}
> @@ -500,26 +512,27 @@ int sg_alloc_append_table_from_pages(struct sg_appe=
nd_table *sgt_append,
>  	/* compute number of contiguous chunks */
>  	chunks =3D 1;
>  	seg_len =3D 0;
> -	for (i =3D 1; i < n_pages; i++) {
> +	for (i =3D cur_pg_index + 1; i <=3D last_pg_index; i++) {
>  		seg_len +=3D PAGE_SIZE;
>  		if (seg_len >=3D max_segment ||
> -		    !pages_are_mergeable(pages[i], pages[i - 1])) {
> +		    !pages_are_mergeable(pages.get_page(pages, i),
> +					 pages.get_page(pages, i - 1))) {
>  			chunks++;
>  			seg_len =3D 0;
>  		}
>  	}
> =20
>  	/* merging chunks and putting them into the scatterlist */
> -	cur_page =3D 0;
>  	for (i =3D 0; i < chunks; i++) {
>  		unsigned int j, chunk_size;
> =20
>  		/* look for the end of the current chunk */
>  		seg_len =3D 0;
> -		for (j =3D cur_page + 1; j < n_pages; j++) {
> +		for (j =3D cur_pg_index + 1; j <=3D last_pg_index; j++) {
>  			seg_len +=3D PAGE_SIZE;
>  			if (seg_len >=3D max_segment ||
> -			    !pages_are_mergeable(pages[j], pages[j - 1]))
> +			    !pages_are_mergeable(pages.get_page(pages, j),
> +						 pages.get_page(pages, j - 1)))
>  				break;
>  		}
> =20
> @@ -535,13 +548,13 @@ int sg_alloc_append_table_from_pages(struct sg_appe=
nd_table *sgt_append,
>  				sgt_append->prv->length =3D prv_len;
>  			return PTR_ERR(s);
>  		}
> -		chunk_size =3D ((j - cur_page) << PAGE_SHIFT) - offset;
> -		sg_set_page(s, pages[cur_page],
> +		chunk_size =3D ((j - cur_pg_index) << PAGE_SHIFT) - offset;
> +		sg_set_page(s, pages.get_page(pages, cur_pg_index),
>  			    min_t(unsigned long, size, chunk_size), offset);
>  		added_nents++;
>  		size -=3D chunk_size;
>  		offset =3D 0;
> -		cur_page =3D j;
> +		cur_pg_index =3D j;
>  	}
>  	sgt_append->sgt.nents +=3D added_nents;
>  	sgt_append->sgt.orig_nents =3D sgt_append->sgt.nents;
> @@ -551,6 +564,46 @@ int sg_alloc_append_table_from_pages(struct sg_appen=
d_table *sgt_append,
>  		sg_mark_end(s);
>  	return 0;
>  }
> +
> +/**
> + * sg_alloc_append_table_from_pages - Allocate and initialize an append =
sg
> + *                                    table from an array of pages
> + * @sgt_append:  The sg append table to use
> + * @pages:       Pointer to an array of page pointers
> + * @n_pages:     Number of pages in the pages array
> + * @offset:      Offset from start of the first page to the start of a b=
uffer
> + * @size:        Number of valid bytes in the buffer (after offset)
> + * @max_segment: Maximum size of a scatterlist element in bytes
> + * @left_pages:  Left pages caller have to set after this call
> + * @gfp_mask:	 GFP allocation mask
> + *
> + * Description:
> + *    In the first call it allocate and initialize an sg table from a li=
st of
> + *    pages, else reuse the scatterlist from sgt_append. Contiguous rang=
es of
> + *    the pages are squashed into a single scatterlist entry up to the m=
aximum
> + *    size specified in @max_segment.  A user may provide an offset at a=
 start
> + *    and a size of valid data in a buffer specified by the page array. =
The
> + *    returned sg table is released by sg_free_append_table
> + *
> + * Returns:
> + *   0 on success, negative error on failure
> + *
> + * Notes:
> + *   If this function returns non-0 (eg failure), the caller must call
> + *   sg_free_append_table() to cleanup any leftover allocations.
> + *
> + *   In the fist call, sgt_append must by initialized.
> + */
> +int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
> +		struct page **pages, unsigned int n_pages, unsigned int offset,
> +		unsigned long size, unsigned int max_segment,
> +		unsigned int left_pages, gfp_t gfp_mask)
> +{
> +	struct page_array parray =3D PAGE_ARRAY(pages);
> +
> +	return sg_alloc_append_table_from_page_array(sgt_append, parray, 0, n_p=
ages, offset,
> +						    size, max_segment, left_pages, gfp_mask);
> +}
>  EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
> =20
>  /**
> @@ -582,10 +635,11 @@ int sg_alloc_table_from_pages_segment(struct sg_tab=
le *sgt, struct page **pages,
>  				gfp_t gfp_mask)
>  {
>  	struct sg_append_table append =3D {};
> +	struct page_array parray =3D PAGE_ARRAY(pages);
>  	int err;
> =20
> -	err =3D sg_alloc_append_table_from_pages(&append, pages, n_pages, offse=
t,
> -					       size, max_segment, 0, gfp_mask);
> +	err =3D sg_alloc_append_table_from_page_array(&append, parray, 0, n_pag=
es, offset,
> +						    size, max_segment, 0, gfp_mask);
>  	if (err) {
>  		sg_free_append_table(&append);
>  		return err;
> @@ -596,6 +650,27 @@ int sg_alloc_table_from_pages_segment(struct sg_tabl=
e *sgt, struct page **pages,
>  }
>  EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
> =20
> +int sg_alloc_table_from_xarray_segment(struct sg_table *sgt, struct xarr=
ay *pages,
> +				       unsigned int idx, unsigned int n_pages,
> +				       unsigned int offset, unsigned long size,
> +				       unsigned int max_segment, gfp_t gfp_mask)
> +{
> +	struct sg_append_table append =3D {};
> +	struct page_array parray =3D PAGE_XARRAY(pages);
> +	int err;
> +
> +	err =3D sg_alloc_append_table_from_page_array(&append, parray, idx, n_p=
ages, offset,
> +						    size, max_segment, 0, gfp_mask);
> +	if (err) {
> +		sg_free_append_table(&append);
> +		return err;
> +	}
> +	memcpy(sgt, &append.sgt, sizeof(*sgt));
> +	WARN_ON(append.total_nents !=3D sgt->orig_nents);
> +	return 0;
> +}
> +EXPORT_SYMBOL(sg_alloc_table_from_xarray_segment);
> +
>  #ifdef CONFIG_SGL_ALLOC
> =20
>  /**

