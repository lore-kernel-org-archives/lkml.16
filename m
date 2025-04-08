Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF639268FD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111216; cv=none; b=BQhCI5DRxQxwfg4+KGi7FdciibcdRKfBNmjubl+w6UPZ5HV8gD86d+1DvxoPVosyC/pQunDO16zdEdBWmFVCHj+Au7oM8mDMP3n8P4a/GgMAtVWvi9p3AUui1giXMGIA3Cmq7/VHE6sWSdwnENkNc4rLEn9ClDiiKnvPItpQ4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111216; c=relaxed/simple;
	bh=IsnK/CJhMOB5ezHxsAL2yUfPY5VpgkdOg9K3FGVRifE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVXa2xMNcpvlQXLSA+VA7nGz35Ky8YaFGapTuzwOpkguRlhwrmYDP7LooK+L/LZS8gxPLxo3yx9cdcwmzG8SRPm/nUt8bZd8Eq6B8jvy8Iyx9jH8gT5bq4MplpPF60cFtdeLej3L9FrVSqewx2NBxdbhnYvQrsmfIxaXwvSzn1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JW1B0Flz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JW1B0Flz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744111212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxlGUJtYElxMWl8rsjV0NknW3/JmIWt6QA0dt0dS8Gg=;
	b=JW1B0Flz1OSNpy2Le5EkHFwUS9EKwR4LGUPFS9n092VG3/QYVUMo5txyTkYwLI/h+C8p80
	yt48+ic/dgyBXelwB/+qSaabb80oJXUeJkEQPkvY9RMaDGhrFk6QND08fpPzQd6d+D1Ktc
	cT/1OYdMTmpLb3PIXh+Xl0w/FwwMXDQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-e2J9cplEOYiaGWCla06KWA-1; Tue, 08 Apr 2025 07:20:11 -0400
X-MC-Unique: e2J9cplEOYiaGWCla06KWA-1
X-Mimecast-MFC-AGG-ID: e2J9cplEOYiaGWCla06KWA_1744111210
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22403329f9eso45965555ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111210; x=1744716010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxlGUJtYElxMWl8rsjV0NknW3/JmIWt6QA0dt0dS8Gg=;
        b=s7vgh/jNks8K91lTBE3I4iH+V3O2AKC/HUZPy6bmTWYOYPtYYVX/nn2/wYX6Y29M1B
         0yA4ZjbJntvoKCis6m7VpJPFq/nnx8Ov8MR+gh/WlFxQJDUKmkZbY7e3wQAZ4FmcoHiK
         b6LZhXLLuV+mW6EJx+H+H8M1idWp860fpI7zNwMChJprPNP+jaiwIkvBmFO6Hz5Sabl8
         cQKxoXjoPKIF0Fjm65YW2m3pVF4zKoQrpp2+rQNmdKy19bqTk9QqIOmvza0CRM7SKuTw
         EbAPL7iroJI4kfQcYB+z17go98L2NXoiM658LMOh/aPxIvFYIWzKGOwCvtuhsTBvLi3g
         ie9A==
X-Forwarded-Encrypted: i=1; AJvYcCVxqk6xifylCtanI/uVULHZTH6ICqZHr7WlrYgOVrAX32xxskjPK8T7JOooVU+WYPmcEbG2uQYxtHvtSf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnb9WFgpSEw3dkYN0GgewNduBqd3O0YJ+Ud0CM9CzT7Cd/W+IN
	wliX7lWL0Zd0U6wML6rQsRgq0HvnbhDEmfbWadmLo8Oeu2eF37x1jZr2pkhABh0QhAkuajXehHo
	J80grLw3cl9mTGq1ftrCiQBht5RGH4ErZ1QvH6bOuLYZrzyPVRNZoXBqbg2dP0mAEU7mYvVxca7
	aiZF5IU7lFwjBQyC+6PNbSvUg/U02hVcIR9fSg
X-Gm-Gg: ASbGncvUXVW065LRIIqiv3uqtUBcJ5L4DcE/OaWkKrtwXx2/JUrOYg3DtJnJRT//YBe
	Trfhyy1SGgXdSeBx/gJunrUttpFOeYn0Onp4XmX0Po5lnQy3aOWsddaWL8nnr4yElESbrAz0=
X-Received: by 2002:a17:902:e809:b0:220:cb1a:da5 with SMTP id d9443c01a7336-22a8a8cec34mr238988855ad.40.1744111210555;
        Tue, 08 Apr 2025 04:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfj3NzNQEOef+4bFL5S7xAlawV84jImrAOEcndKQ7zZiAPCt7WHwsWtCqW95u4ZSL3aeAqCFB/AGt6ESaJB0M=
X-Received: by 2002:a17:902:e809:b0:220:cb1a:da5 with SMTP id
 d9443c01a7336-22a8a8cec34mr238988485ad.40.1744111210268; Tue, 08 Apr 2025
 04:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407182104.716631-1-agruenba@redhat.com> <20250407182104.716631-2-agruenba@redhat.com>
 <77b1b228-3799-43e3-ab30-5aec1d633816@I-love.SAKURA.ne.jp>
In-Reply-To: <77b1b228-3799-43e3-ab30-5aec1d633816@I-love.SAKURA.ne.jp>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 8 Apr 2025 13:19:58 +0200
X-Gm-Features: ATxdqUF091z-QTWG4loZUeytMgFUpudH-__g8f1MG4U6oA2wpIwWgfAYKS_mKk4
Message-ID: <CAHc6FU5HrGWYpOwd6OMhG7EdyjB3zp-RV5dP=W-=29VnYa96-w@mail.gmail.com>
Subject: Re: [RFC 1/2] gfs2: replace sd_aspace with sd_inode
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: cgroups@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Rafael Aquini <aquini@redhat.com>, gfs2@lists.linux.dev, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:04=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2025/04/08 3:21, Andreas Gruenbacher wrote:
> > @@ -1156,6 +1146,18 @@ static int gfs2_fill_super(struct super_block *s=
b, struct fs_context *fc)
> >       sb->s_flags |=3D SB_NOSEC;
> >       sb->s_magic =3D GFS2_MAGIC;
> >       sb->s_op =3D &gfs2_super_ops;
> > +
> > +     /* Set up an address space for metadata writes */
> > +     sdp->sd_inode =3D new_inode(sb);
> > +     if (!sdp->sd_inode)
> > +             goto fail_free;
> > +     sdp->sd_inode->i_ino =3D GFS2_BAD_INO;
> > +     sdp->sd_inode->i_size =3D OFFSET_MAX;
> > +
> > +     mapping =3D gfs2_aspace(sdp);
> > +     mapping->a_ops =3D &gfs2_rgrp_aops;
> > +     mapping_set_gfp_mask(mapping, GFP_NOFS);
> > +
> >       sb->s_d_op =3D &gfs2_dops;
> >       sb->s_export_op =3D &gfs2_export_ops;
> >       sb->s_qcop =3D &gfs2_quotactl_ops;
>
> This will be an inode leak when hitting e.g.
>
>         error =3D init_names(sdp, silent);
>         if (error)
>                 goto fail_free;
>
> path, for what free_sbd() in
>
> fail_free:
>         free_sbd(sdp);
>         sb->s_fs_info =3D NULL;
>         return error;
>
> path does is nothing but free_percpu() and kfree().

Indeed, an iput() is indeed needed in that case.

Thanks,
Andreas

