Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585BE27D763;
	Thu,  5 Jun 2025 23:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749166213; cv=none; b=Xw08Q/4+G4d6eg1q621Gq4UgkaGjfbHZf2qMPamvDm6HhiJ/VpNzMRP9Iey2G9lsH0a4iQcw6nPOLwyJCmWNedZuTp4LsUwr2wpyyHz7Ro2+tNsKB+uLmUJjty3gRgQXNIcDHv/8OGs3Kh6mWxXX7tTErk7TGYU24ak5cqHdCWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749166213; c=relaxed/simple;
	bh=5kEQsGN7NAp4+VEFAnTFOKHKVspES6OGH401R2B2VjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdBxiI2+5IdShroNdFBcRtmJI1lSz4wQAT7EaOzK5yqobYiJ4SmaionqcvSHUdnRznHdpophaIPwr1p7Mw8MN+kweRp9tMqv2cdb/XzYidCAaByFNqADhEbSOzXjDtuslMF8pomaSWwyNvMJfsSJ4xlm693+HEPyPoMmOmp+wlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQAqN4N6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQAqN4N6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23526264386so13718375ad.2;
        Thu, 05 Jun 2025 16:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749166210; x=1749771010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nIg/QKJK+t2tcG+N4zRKy0QR/HL0BRMZBIkzqbGzHhM=;
        b=KQAqN4N62r0YuiiOMrThudGzS58wUTQJHy9XQgOwUrHkrJTMJKRKXA0kCn2qjzqhKM
         PkklBMdvMbYjvqWIxBRsQcOujATniGOL6vlLCcKAI+hX6kiLM+Q30GtmSYuVXlrQbQ+2
         IZFcK5GQ2t9CjjBX0WxekaGDa8YNTgPxdl0JS8d8YlR/W3CXusiURUdhqS/6eWbeggeB
         /aPnJ8noVjNcsxma9IXexYJ0GT4MhHNnoUgjZKoFSRozrO+uHQSwRsZFlgv9eXIYP+AW
         k+CJFYtLJLnENtEITtBXXD7MBlgNYlVNDL0RyMAmAgKyNoyUs84ZUyCObOj3uyWhd/kR
         NknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749166210; x=1749771010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIg/QKJK+t2tcG+N4zRKy0QR/HL0BRMZBIkzqbGzHhM=;
        b=w7lCDHdmjTJN26RlhR2hmutABhCgJyMS77AqUi+jb4GxFBTBxkLz3e1IsGIcuwM28/
         pMR8wV/B9zh5pQzD1ibkhu6Prqo05wtKTfdJ6yUV7GFoUKDXkv4LorRH8FAq0T6ePTcy
         Tph540ND7uwvdAD9Voop5d6exlnoGZEybsEXPXFP4Eze7/m/Bm9OTeqppf6aPKoKijZk
         n7Qq7/KDtA3VbHcSBZvfCpXK+RkJkaMGXMO2h+SbYynCOfOO4Xe02/xSDJ4BB6P/CMJm
         7dEcvDHYA9KF3Kh/kcRwq5vDeeXDvqWaldxM0b9Vp44Z5zt8u3dSQml5R3icF0O91XHU
         aZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6g9F86Rp8Mk2nLGbrBe6RAjVxfrWIs4wVvOuIkz8XnG6XQXRI7Zt0eqhyalxdkabyDvSxkg9OQOcVJwpf@vger.kernel.org, AJvYcCVgVUblq8+egHv/jvsBhlltaMMFVFHxEcfuIwaLygywFBH0hnzGr+nEbCNwRdBuO6YsTAAepgMblzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7NNv4Q8vIeMnRVldIHjWW7NNhVbxmIjHs3ML8Fr5SsqrN1rC
	Vk3S6RiwkIGivPhN9huQpQme2O6/8+zsSWFPwrGOYEJfrNAd70VQShfz
X-Gm-Gg: ASbGnctzJl+5vXUU/JAQG2n8st1iz39eEEQqsWrivz+WWnvQHHMNAV/R/1VaF2N+QdA
	veMD+8PcRAPNM2JVUuAJsY6durlbq2EtgRIZeQyZLNyhcvy7ebfl8yUdjr8tY3CFUEVJ65a60LC
	QHppxjyxDshQz4k/OMSuh2+prGCWEcVp+/dIu64Z9gJHDhb5C1FmW0kfHz3s8mzA2oL0oy1oane
	kuropIQxkTm2XumMbTDvxU2wt/rK/Eh3DKQXDUYF81EPfiPr7QNtEK1xiWHe0mav6Nng0tAgkgj
	ka0rpmWU82K53xUMtjIwi+0XY4GGLGqYs3e1bH93x64lTumO3Uo=
X-Google-Smtp-Source: AGHT+IHXKd4dGIULKIaYlncrp+DqaXIwq0DERiJ/XQO9ES/5H6bjbbs9gaHl/qGj5RljyK1lfMJmeg==
X-Received: by 2002:a17:902:d483:b0:235:e1d6:4e29 with SMTP id d9443c01a7336-23601dc0136mr18210325ad.36.1749166210136;
        Thu, 05 Jun 2025 16:30:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056f8sm1405105ad.161.2025.06.05.16.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 16:30:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B8D784222987; Fri, 06 Jun 2025 06:30:06 +0700 (WIB)
Date: Fri, 6 Jun 2025 06:30:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <aEIofgUdu5z5USfD@archie.me>
References: <20250604180308.137116-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TKrJpDjXj3ldSAvw"
Content-Disposition: inline
In-Reply-To: <20250604180308.137116-1-lorenzo.stoakes@oracle.com>


--TKrJpDjXj3ldSAvw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 07:03:08PM +0100, Lorenzo Stoakes wrote:
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/proces=
s_addrs.rst
> index e6756e78b476..be49e2a269e4 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -303,7 +303,9 @@ There are four key operations typically performed on =
page tables:
>  1. **Traversing** page tables - Simply reading page tables in order to t=
raverse
>     them. This only requires that the VMA is kept stable, so a lock which
>     establishes this suffices for traversal (there are also lockless vari=
ants
> -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
> +   which eliminate even this requirement, such as :c:func:`!gup_fast`). =
There is
> +   also a special case of page table traversal for non-VMA regions which=
 we
> +   consider separately below.
>  2. **Installing** page table mappings - Whether creating a new mapping or
>     modifying an existing one in such a way as to change its identity. Th=
is
>     requires that the VMA is kept stable via an mmap or VMA lock (explici=
tly not
> @@ -335,15 +337,13 @@ ahead and perform these operations on page tables (=
though internally, kernel
>  operations that perform writes also acquire internal page table locks to
>  serialise - see the page table implementation detail section for more de=
tails).
>=20
> +.. note:: We free empty PTE tables on zap under the RCU lock - this does=
 not
> +          change the aforementioned locking requirements around zapping.
> +
>  When **installing** page table entries, the mmap or VMA lock must be hel=
d to
>  keep the VMA stable. We explore why this is in the page table locking de=
tails
>  section below.
>=20
> -.. warning:: Page tables are normally only traversed in regions covered =
by VMAs.
> -             If you want to traverse page tables in areas that might not=
 be
> -             covered by VMAs, heavier locking is required.
> -             See :c:func:`!walk_page_range_novma` for details.
> -
>  **Freeing** page tables is an entirely internal memory management operat=
ion and
>  has special requirements (see the page freeing section below for more de=
tails).
>=20
> @@ -355,6 +355,44 @@ has special requirements (see the page freeing secti=
on below for more details).
>               from the reverse mappings, but no other VMAs can be permitt=
ed to be
>               accessible and span the specified range.
>=20
> +Traversing non-VMA page tables
> +------------------------------
> +
> +We've focused above on traversal of page tables belonging to VMAs. It is=
 also
> +possible to traverse page tables which are not represented by VMAs.
> +
> +Kernel page table mappings themselves are generally managed but whatever=
 part of
> +the kernel established them and the aforementioned locking rules do not =
apply -
> +for instance vmalloc has its own set of locks which are utilised for
> +establishing and tearing down page its page tables.
> +
> +However, for convenience we provide the :c:func:`!walk_kernel_page_table=
_range`
> +function which is synchronised via the mmap lock on the :c:macro:`!init_=
mm`
> +kernel instantiation of the :c:struct:`!struct mm_struct` metadata objec=
t.
> +
> +If an operation requires exclusive access, a write lock is used, but if =
not, a
> +read lock suffices - we assert only that at least a read lock has been a=
cquired.
> +
> +Since, aside from vmalloc and memory hot plug, kernel page tables are no=
t torn
> +down all that often - this usually suffices, however any caller of this
> +functionality must ensure that any additionally required locks are acqui=
red in
> +advance.
> +
> +We also permit a truly unusual case is the traversal of non-VMA ranges in
> +**userland** ranges, as provided for by :c:func:`!walk_page_range_debug`.
> +
> +This has only one user - the general page table dumping logic (implement=
ed in
> +:c:macro:`!mm/ptdump.c`) - which seeks to expose all mappings for debug =
purposes
> +even if they are highly unusual (possibly architecture-specific) and are=
 not
> +backed by a VMA.
> +
> +We must take great care in this case, as the :c:func:`!munmap` implement=
ation
> +detaches VMAs under an mmap write lock before tearing down page tables u=
nder a
> +downgraded mmap read lock.
> +
> +This means such an operation could race with this, and thus an mmap **wr=
ite**
> +lock is required.
> +
>  Lock ordering
>  -------------
>=20
> @@ -461,6 +499,10 @@ Locking Implementation Details
>  Page table locking details
>  --------------------------
>=20
> +.. note:: This section explores page table locking requirements for page=
 tables
> +          encompassed by a VMA. See the above section on non-VMA page ta=
ble
> +          traversal for details on how we handle that case.
> +
>  In addition to the locks described in the terminology section above, we =
have
>  additional locks dedicated to page tables:
>=20

The wording looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--TKrJpDjXj3ldSAvw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEIoegAKCRD2uYlJVVFO
o9YLAP0XEbGybhTT0kMYnpcDPlleOpjIwK2lOzh5ejXz8EynYwEApRxlM9Qqf+x1
Hjc7iMbG0xjNPtyNl1s36fJcTI751gg=
=sqiG
-----END PGP SIGNATURE-----

--TKrJpDjXj3ldSAvw--
