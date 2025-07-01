Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77181E1DF2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353791; cv=none; b=ArbsFF11k7Zs6X5ld4nIh53pzDlr+vdfamnFIkorXRG4UOmg2e/45m2W/Cy9QsmwCL5BGo61+X6qrFci99NlgVIr+asCOcYeSQZUSyLn2aFhRWvsg5ebSoXdKxdGA+kRGnExqTlIpDIjI1j/bEkqF2e9xRdc2EXSpLlSEwz2lyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353791; c=relaxed/simple;
	bh=2hq4JCcN4z4xEGvmEokksJaUXiF4LRMyhndIHCk4ulA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LlA5toCnP8k1PZNJ9perSCekqN8rnKz0xhRkVSE8JgndV8wNfGc6hXZJnOGOXF05Yn7g9qzu6lh+wGt8UDqkBpwH6v84n7pgdxMfRalUYKc8DC4ACyrOJRCDD07UwiH4zTdgyjflEXmUtu0a2mr1rOR5qiaDeKda8T46DppSEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=oOzdKgyc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="oOzdKgyc"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so907785566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1751353786; x=1751958586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y38AAXsAJd3bGos1ifagMLdar2TgEuC+xmcby9+v3Zs=;
        b=oOzdKgyc6QIWna0fY1lbftOPSCeLb6xJfm7w7YHyWpFOHrBg0L5bRCbKCdJuN6kKF7
         Igi6KP81lLw2g7TAdR5VF+4Y6pV2Zq7gyDg60lCqaJneITz1aec75el7YajLr4+CNynH
         k8UDghd5YmFQas0tLyB+fGB6JH5CexLgL3brC4+c7KmdNlKGosa5Ruon/CYkeAvTdRi4
         aiF15Ep2EGlhtV7Ihhs1lkKlTznq+GgiSUH8h4Lhc5q+goOuJk/GsUXZ2/uf3D2mY3Un
         ihlFOVMV2fDGvRGTfCLVUz7U8UTEdOO83+/tb6185cIuowM/WQlpZz5V51RU7+OE4Spn
         PWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751353786; x=1751958586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y38AAXsAJd3bGos1ifagMLdar2TgEuC+xmcby9+v3Zs=;
        b=iFshKNXrTIFAOknVcTT3FTfujxUJ44eV6IcOtxga0yNT68O/LcAFpDVhPaYdyv/sJh
         ygXsHCeOXx9fNsOJ9w46SRqgQni/GppqEH3DSy2fyLGKnLT4FB+dPbrVmWvRZ08CEI4s
         fD9QnZ+BYTIoSyn+ya6pZHxyYL8HTPgTaJmODVpbYAbXTvsE+dCXUSESBZ30GHX+HIcA
         25rctk7++aXvqNnIEA4/qCJ4XC6p4wNHlIfwdPrX/4w5CA7/zn3yELYIViebm82ZuRzd
         RbOpZWHnbh+Ae4r9P2iU9Bift735zRFs940O6IlW4eU35J++GheTJB8FpTCURPJemV4D
         vnGg==
X-Gm-Message-State: AOJu0Yz70Y9NIXenk3cEqBo3w44Z6Ptdea0Hef+MqwQqf9T2gRw6/0sL
	6GAwMFiiz/RcXbKZjTUlwkXW6ku1GexlM7qS1aG+went/lmJfqq1W8PisyA4dO3BPXw=
X-Gm-Gg: ASbGncu7BK4+QkGiClIXej1vi7zhrjuRh3cY6k6yWaQpXqOq6007O+XMAdIegGDlYKH
	0y5eP4jr8m78OO6PXQfXBEGCH5NrnG283RFt/dxRYb65LxNGWQjmNzN6C7GJCDamH3DRxwarJ1T
	Xxrd3vENA+ZNxxOZfCXeYIowHITC1pn6gMF1gbOUFwnqap5Y2Q6eB1C/UMaa8M03cUHTcqft+rL
	XhSF6FogSvDBMo9sPqnbGb4zI2e532S3e/8e31Ie3HYowSI8/3VAbZEktK4HD1tHJ/76GXsCOob
	bgZXnrz/Te3g3cFTouRCVbr6qCFqopJN2PkMfDg3YCVdiWzKpxX6kHpliiKWyaWkEElb7mx9gEe
	rktV+TOyTOhy+FSlIiHKPxBx3omY=
X-Google-Smtp-Source: AGHT+IG3RuoJ2BkEOIOPAMGl8XCV5kKpcDgg7D6y87yVO6s/fbOlmcqvDqhSos21KN8h1lSUZcnyJw==
X-Received: by 2002:a17:907:3d92:b0:ae0:c215:5be2 with SMTP id a640c23a62f3a-ae35010fd55mr1552179266b.30.1751353785354;
        Tue, 01 Jul 2025 00:09:45 -0700 (PDT)
Received: from somecomputer (85-127-104-84.dsl.dynamic.surfer.at. [85.127.104.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b347sm817941266b.35.2025.07.01.00.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:09:43 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org,
 upstream@sigma-star.at
Cc: linux-kernel@vger.kernel.org, kch@nvidia.com, sagi@grimberg.me,
 hch@lst.de, upstream+nvme@sigma-star.at, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v2] nvmet: Make blksize_shift configurable
Date: Tue, 01 Jul 2025 09:09:42 +0200
Message-ID: <2920993.eCsiYhmirv@nailgun>
In-Reply-To: <132c1bdf-e100-4e3a-883f-27f9e9b78020@kernel.org>
References:
 <20250630191341.1263000-1-richard@nod.at>
 <132c1bdf-e100-4e3a-883f-27f9e9b78020@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Dienstag, 1. Juli 2025 02:34 'Damien Le Moal' via upstream wrote:
> On 7/1/25 4:13 AM, Richard Weinberger wrote:
> > Currently, the block size is automatically configured, and for
> > file-backed namespaces it is likely to be 4K.
> > While this is a reasonable default for modern storage, it can
> > cause confusion if someone wants to export a pre-created disk image
> > that uses a 512-byte block size.
> > As a result, partition parsing will fail.
> >=20
> > So, just like we already do for the loop block device, let the user
> > configure the block size if they know better.
>=20
> Hmm... That fine with me but this explanation does not match what the pat=
ch
> does: you allow configuring the block size bit shift, not the size. That =
is not
> super user friendly :)
>=20
> Even if internally you use the block size bit shift, I think it would be =
better
> if the user facing interface is the block size as that is much easier to
> manipulate without having to remember the exponent for powers of 2 values=
 :)

The initial intention of this patch was exposing the blksize_shift property.
If we want to expose this as more user friendly, I'm fine with it.
Maybe "minimum_io_size"?

>=20
> >=20
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> > Changes since v1 (RFC)[0]:
> >=20
> > - Make sure blksize_shift is in general within reason
> > - In the bdev case and when using direct IO, blksize_shift has to be
> >   smaller than the logical block it the device
> > - In the file case and when using direct IO try to use STATX_DIOALIGN,
> >   just like the loop device does
> >=20
> > [0] https://lore.kernel.org/linux-nvme/20250418090834.2755289-1-richard=
@nod.at/
> >=20
> > Thanks,
> > //richard
> > ---
> >  drivers/nvme/target/configfs.c    | 37 +++++++++++++++++++++++++++++++
> >  drivers/nvme/target/io-cmd-bdev.c | 13 ++++++++++-
> >  drivers/nvme/target/io-cmd-file.c | 28 ++++++++++++++++++-----
> >  3 files changed, 71 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/confi=
gfs.c
> > index e44ef69dffc24..26175c37374ab 100644
> > --- a/drivers/nvme/target/configfs.c
> > +++ b/drivers/nvme/target/configfs.c
> > @@ -797,6 +797,42 @@ static ssize_t nvmet_ns_resv_enable_store(struct c=
onfig_item *item,
> >  }
> >  CONFIGFS_ATTR(nvmet_ns_, resv_enable);
> > =20
> > +static ssize_t nvmet_ns_blksize_shift_show(struct config_item *item, c=
har *page)
>=20
> As mentioned above, I think this should be nvmet_ns_blksize_show().
>=20
> > +{
> > +	return sysfs_emit(page, "%u\n", to_nvmet_ns(item)->blksize_shift);
>=20
> And you can do:
>=20
> 	return sysfs_emit(page, "%u\n",
> 			  1U << to_nvmet_ns(item)->blksize_shift);
>=20
> > +}
> > +
> > +static ssize_t nvmet_ns_blksize_shift_store(struct config_item *item,
> > +		const char *page, size_t count)
>=20
> Similar here: nvmet_ns_blksize_store()
>=20
> > +{
> > +	struct nvmet_ns *ns =3D to_nvmet_ns(item);
> > +	u32 shift;
> > +	int ret;
> > +
> > +	ret =3D kstrtou32(page, 0, &shift);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Make sure block size is within reason, something between 512 and
> > +	 * BLK_MAX_BLOCK_SIZE.
> > +	 */
> > +	if (shift < 9 || shift > 16)
> > +		return -EINVAL;
>=20
> And this would be simpler:
>=20
> 	if (blksz < SECTOR_SIZE || blksz > BLK_MAX_BLOCK_SIZE ||
> 	    !is_power_of_2(blksz))
> 		return -EINVAL;
>=20
> > +
> > +	mutex_lock(&ns->subsys->lock);
> > +	if (ns->enabled) {
> > +		pr_err("the ns:%d is already enabled.\n", ns->nsid);
> > +		mutex_unlock(&ns->subsys->lock);
> > +		return -EINVAL;
> > +	}
> > +	ns->blksize_shift =3D shift;
>=20
> and here:
>=20
> 	ns->blksize_shift =3D ilog2(blksz);
>=20
> > +	mutex_unlock(&ns->subsys->lock);
> > +
> > +	return count;
> > +}
> > +CONFIGFS_ATTR(nvmet_ns_, blksize_shift);
> > +
> >  static struct configfs_attribute *nvmet_ns_attrs[] =3D {
> >  	&nvmet_ns_attr_device_path,
> >  	&nvmet_ns_attr_device_nguid,
> > @@ -806,6 +842,7 @@ static struct configfs_attribute *nvmet_ns_attrs[] =
=3D {
> >  	&nvmet_ns_attr_buffered_io,
> >  	&nvmet_ns_attr_revalidate_size,
> >  	&nvmet_ns_attr_resv_enable,
> > +	&nvmet_ns_attr_blksize_shift,
> >  #ifdef CONFIG_PCI_P2PDMA
> >  	&nvmet_ns_attr_p2pmem,
> >  #endif
> > diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io=
=2Dcmd-bdev.c
> > index eba42df2f8215..be39837d4d792 100644
> > --- a/drivers/nvme/target/io-cmd-bdev.c
> > +++ b/drivers/nvme/target/io-cmd-bdev.c
> > @@ -77,6 +77,7 @@ static void nvmet_bdev_ns_enable_integrity(struct nvm=
et_ns *ns)
> > =20
> >  int nvmet_bdev_ns_enable(struct nvmet_ns *ns)
> >  {
> > +	int bdev_blksize_shift;
> >  	int ret;
> > =20
> >  	/*
> > @@ -100,7 +101,17 @@ int nvmet_bdev_ns_enable(struct nvmet_ns *ns)
> >  	}
> >  	ns->bdev =3D file_bdev(ns->bdev_file);
> >  	ns->size =3D bdev_nr_bytes(ns->bdev);
> > -	ns->blksize_shift =3D blksize_bits(bdev_logical_block_size(ns->bdev));
> > +	bdev_blksize_shift =3D blksize_bits(bdev_logical_block_size(ns->bdev)=
);
> > +
> > +	if (ns->blksize_shift) {
> > +		if (ns->blksize_shift < bdev_blksize_shift) {
> > +			pr_err("Configured blksize_shift needs to be at least %d for device=
 %s\n",
> > +				bdev_blksize_shift, ns->device_path);
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		ns->blksize_shift =3D bdev_blksize_shift;
> > +	}
>=20
> Nit: to avoid the indented if, may be write this like this: ?
>=20
> 	if (!ns->blksize_shift)
> 		ns->blksize_shift =3D bdev_blksize_shift;
>=20
> 	if (ns->blksize_shift < bdev_blksize_shift) {
> 		pr_err("Configured blksize needs to be at least %u for device %s\n",
> 			bdev_logical_block_size(ns->bdev),
> 			ns->device_path);
> 		return -EINVAL;
> 	}

It's a matter of taste, but yes...

> Also, if the backend is an HDD, do we want to allow the user to configure=
 a
> block size that is less than the *physical* block size ? Performance will
> suffer on regular HDDs and writes may fail with SMR HDDs.

I'm not sure whether it's worth putting more smartness into this logic.
=20
> > =20
> >  	ns->pi_type =3D 0;
> >  	ns->metadata_size =3D 0;
> > diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io=
=2Dcmd-file.c
> > index 2d068439b129c..a4066b5a1dc97 100644
> > --- a/drivers/nvme/target/io-cmd-file.c
> > +++ b/drivers/nvme/target/io-cmd-file.c
> > @@ -49,12 +49,28 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
> > =20
> >  	nvmet_file_ns_revalidate(ns);
> > =20
> > -	/*
> > -	 * i_blkbits can be greater than the universally accepted upper bound,
> > -	 * so make sure we export a sane namespace lba_shift.
> > -	 */
> > -	ns->blksize_shift =3D min_t(u8,
> > -			file_inode(ns->file)->i_blkbits, 12);
> > +	if (ns->blksize_shift) {
> > +		if (!ns->buffered_io) {
> > +			struct block_device *sb_bdev =3D ns->file->f_mapping->host->i_sb->s=
_bdev;
> > +			struct kstat st;
> > +
> > +			if (!vfs_getattr(&ns->file->f_path, &st, STATX_DIOALIGN, 0) &&
> > +			    (st.result_mask & STATX_DIOALIGN) &&
> > +			    (1 << ns->blksize_shift) < st.dio_offset_align)
> > +				return -EINVAL;
> > +
> > +			if (sb_bdev && (1 << ns->blksize_shift < bdev_logical_block_size(sb=
_bdev)))
> > +				return -EINVAL;
>=20
> I am confused... This is going to check both... But if you got STATX_DIOA=
LIGN
> and it is OK, you do not need (and probably should not) do the second if,=
 no ?

I was not sure about that.
Is it guaranteed that STATX_DIOALIGN returns something sane?

>=20
> Also, the second condition of the second if is essentially the same check=
 as
> for the block dev case. So maybe reuse that by creating a small helper fu=
nction ?

Ok.
=20
> > +		}
> > +	} else {
> > +		/*
> > +		 * i_blkbits can be greater than the universally accepted
> > +		 * upper bound, so make sure we export a sane namespace
> > +		 * lba_shift.
> > +		 */
> > +		ns->blksize_shift =3D min_t(u8,
> > +				file_inode(ns->file)->i_blkbits, 12);
> > +	}
>=20
> It feels like this entire hunk should be a helper function as that would =
allow
> making it a lot more readable with early returns. This code here whould be
> something like:

Ok.

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT UID/VAT Nr:
ATU 66964118 | FN: 374287y


