Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3162F41
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 19:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746991560; cv=none; b=YqmTlAyOb5LZIZBftyhhOyZEE3rCakqwF3WF2XDNwopN2eZ0gOKmfs9HjJKw+02xQVe+8xxmfSVqfdZtRAk6m+Pubfz9sDWKXqOkVDHLpBJav4hQZMJwQdNFX5B6yM8punL2HdQ+dTxhen13yBMY6KZCrXtJCzODIw+aHQvPGrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746991560; c=relaxed/simple;
	bh=tQv3a58bV8AQXJV7UVA8pp0/Dlup4/QeUPvx73V+C7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpLRVUoa9iH89og9hZZB2IV4I3L4QWPgtNxkStxMhbj6ir48/Jn74QyziW0JqhdAdhbKS3Tjc3hGZglklt7NI7qnV3Ztc8grspN2hrbU/tNtSIHSNifYPB19LBfV0hn1cxUDZnT5Wqh7J3XEGd4VDhPprxLdQmdkwUpUwrlgDMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyussZ+x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyussZ+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746991556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSknZWzIXqvAtxKfsugg8SXVU+aLf6cDZHfS/FHiCJU=;
	b=iyussZ+xOnbMFGIWNq/AouWrRPfpNUP8Z8EpGhb/Gs2729KCtDUA8NpNd6SJnaNqVsWHQ9
	DujkOvS3qIsCglGPMua3IxalgfL0toDTO10HTPmcnxjsNn35RNm5AuJw+u8kuyhjEhSqGO
	YSPSTi6laE8iMxWBzsf3mlkfEc/poAA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-lX-H8nxjPBuRi4CPErhp4Q-1; Sun, 11 May 2025 15:25:54 -0400
X-MC-Unique: lX-H8nxjPBuRi4CPErhp4Q-1
X-Mimecast-MFC-AGG-ID: lX-H8nxjPBuRi4CPErhp4Q_1746991554
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22eb21a2788so50759455ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 12:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746991554; x=1747596354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSknZWzIXqvAtxKfsugg8SXVU+aLf6cDZHfS/FHiCJU=;
        b=lQais2wmFIcwF3l32uP8PReAjf13PbynOUuVypZcEAKyfQhTnWKSRmYkSJ7j6Qj5EH
         yjl3C53lFmQ1drad0KITHPaIheJTxYdsR3LtFqBb9+ej4J8SKxFAZTogEKiq7hFEGpsA
         HV6DRAmMl731kvcGtX4TCzdpNfCummsltEjwGrIE7XmwEEGq95pAdsVd7/rKjnkqf9m2
         5fudauwWmwnK6BsObUg2SHPhW0T2yTtxHoY8VBBYiuO1IEILpmzoVhf/jJGom2jgr8FJ
         2FQhofihaUDkXCSjyGUpSoU0Pwz89EyAYJ7GCLnKAtRmTobCGHcmG3E00ogPXuOyOxyM
         iWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/xonOI1olJyItfEtnwJJV7AR+cbAXS9n+Y0HwHdBjDWDArjj5kGUmk+7GyQORO+L1Pf5AspknOAfX8T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfDXLZ0LSbg6j/l4bsAE2t16dq5UEFcEYNTpVYYB9b6eMSwDM
	tPOVgwYzhWkleL8TOEyQkVI4a8/w9p8n1v0ZLeBFGmdXSnQJrDuRBtCh3yMD45S7CNP22cmZ1L0
	DsKh8Pu4SkBXEg1DVEsBAE5reL7gN8KrsCyTmAzcDPSx/vqv59MGE/1G5CwpOfNmF9La8LRlbF6
	o7MatWMQIEAp4IchNi/e3Yo/2H0o07vUS5FM4E
X-Gm-Gg: ASbGnct/zcfhLaEZZtTv0BEP9NVqdL40wCM5lElGQJe3LFIgtMTNhPeYp279XIonwtu
	V18RTR/jep69e+820UYOiLsVTHTkHgnzxsv70dz7OENN2A3TdoThVt8/uihPklSsG2/M=
X-Received: by 2002:a17:902:e88d:b0:227:e74a:a05a with SMTP id d9443c01a7336-22fc91c0c08mr175053205ad.44.1746991553813;
        Sun, 11 May 2025 12:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd/YLMq4KWnGa4/y+2VBdUSxemRLtkrZDS6SVfir+GFJD0h8AuQwX9xu3G10fal9CM5lwlETy228XpuJb55F4=
X-Received: by 2002:a17:902:e88d:b0:227:e74a:a05a with SMTP id
 d9443c01a7336-22fc91c0c08mr175053015ad.44.1746991553434; Sun, 11 May 2025
 12:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511183133.31544-1-ebiggers@kernel.org>
In-Reply-To: <20250511183133.31544-1-ebiggers@kernel.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 11 May 2025 21:25:41 +0200
X-Gm-Features: AX0GCFvKOnEoZfolm9crwWaY9YPoY1xpV9DcdoF9USbgpq_57h4KumRSbr9G6lM
Message-ID: <CAHc6FU7gs_jg8kkZz7-raHLotx55pn-x3hqqDaiV2cpG5YL_pA@mail.gmail.com>
Subject: Re: [PATCH] gfs2: avoid inefficient use of crc32_le_shift()
To: Eric Biggers <ebiggers@kernel.org>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 8:40=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> __get_log_header() was using crc32_le_shift() to update a CRC with four
> zero bytes.  However, this is about 5x slower than just CRC'ing four
> zero bytes in the normal way.  Just do that instead.
>
> (We could instead make crc32_le_shift() faster on short lengths.  But
> all its callers do just fine without it, so I'd like to just remove it.)
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>
> Please consider this patch for the gfs2 tree for 6.16.  If it doesn't
> get picked up, I'll take it through the crc tree.
>
>  fs/gfs2/recovery.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index f4fe7039f725b..9080f1b5f434d 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -116,19 +116,20 @@ void gfs2_revoke_clean(struct gfs2_jdesc *jd)
>  }
>
>  int __get_log_header(struct gfs2_sbd *sdp, const struct gfs2_log_header =
*lh,
>                      unsigned int blkno, struct gfs2_log_header_host *hea=
d)
>  {
> +       const u32 zero =3D 0;
>         u32 hash, crc;
>
>         if (lh->lh_header.mh_magic !=3D cpu_to_be32(GFS2_MAGIC) ||
>             lh->lh_header.mh_type !=3D cpu_to_be32(GFS2_METATYPE_LH) ||
>             (blkno && be32_to_cpu(lh->lh_blkno) !=3D blkno))
>                 return 1;
>
>         hash =3D crc32(~0, lh, LH_V1_SIZE - 4);
> -       hash =3D ~crc32_le_shift(hash, 4); /* assume lh_hash is zero */
> +       hash =3D ~crc32(hash, &zero, 4); /* assume lh_hash is zero */
>
>         if (be32_to_cpu(lh->lh_hash) !=3D hash)
>                 return 1;
>
>         crc =3D crc32c(~0, (void *)lh + LH_V1_SIZE + 4,
>
> base-commit: 3ce9925823c7d6bb0e6eb951bf2db0e9e182582d
> --
> 2.49.0
>

Applied to for-next.

Thanks,
Andreas

