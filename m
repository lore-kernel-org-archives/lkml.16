Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7520FAB9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207757; cv=none; b=uguqrQkVvteAMB7uZwPzIR4OBAT00QFVlXxOElN2hJWsrpYQ3GfcpGLKJBCiMnvPr94OxDw99BxfFkr5Z65fqE7p+jzgk/w4yDzzc2V+/LGR5/LRYZ0Mf/7JpYRU/0aRQWPnT32335+ujOgC8J2X9r+w5F+r0bmWKJZXQv5jhNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207757; c=relaxed/simple;
	bh=WY9nxPgCvde8fX6n7zhRAyJTTq9PldQtI0rtg67w0yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhZF2UqhW+z2zYlWuIvx8MHpJXLeAhdTFs4B2RsvQ9fwI3ND/IjHJoJF37rALezHiCV3LHqj1wp09c6Ic0t/5HEHFmGmAVotPoEg2FUsaq11nXlQs21D+tTunpxKQl78EMKnBWd0OGimZs5qK/gFi9rH7v1PYuTEAp4vbd+IflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kgh4HGDO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kgh4HGDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747207754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WY9nxPgCvde8fX6n7zhRAyJTTq9PldQtI0rtg67w0yE=;
	b=Kgh4HGDOqszb19RmdeCgIrbvN7pIHMv3Q79AFAGO604RHXomqVOyev4EWqnbnLC5mAM1cO
	jopO0AoqWIhdSqqAMUJhf5IGA8dR1Dld3OF2B74NWybHz8Ne9EQ/NeNe3+y2hvz837xj2+
	G6ZB55yD+4uDowohzP0HMH8dh1G7QmM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-Cor8vXoyM2Gp-bzRHEOH7w-1; Wed, 14 May 2025 03:29:13 -0400
X-MC-Unique: Cor8vXoyM2Gp-bzRHEOH7w-1
X-Mimecast-MFC-AGG-ID: Cor8vXoyM2Gp-bzRHEOH7w_1747207752
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30ad109bc89so6985456a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207752; x=1747812552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY9nxPgCvde8fX6n7zhRAyJTTq9PldQtI0rtg67w0yE=;
        b=XA2HwJaN1G+7CuWxf/cIW+oQ3tMDzTB0HyHx/MNZB4LVR16wNhFqgUuaco0HpavlNO
         m6r1/Dzg7na4kioX2F5h0FNIaiYqL3K3F9P5xoPWcIHDiV9aYARRmLUMaluU/Qu7NDjv
         P5Nk0rLqLwoEX/5xsNcSQpn92RGRLVDW6mLekrmGs6utG7PEViP+jI43CWCXtBKRLHoz
         BXy7To3tSjVYI0wFR4FGjpcVcaN9WmG/+Ceiv4xdDs6OHhA4+tq1vPuH93hie7vfWtkB
         8Wu2ujngsLIg23VWn31nRZVU5VLJRcFw5HErGs9xsybD8R528tCZUh1IlSV0nwNUe679
         PFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRP8ROAYj3GopsGe6Z06kqi6BiuOibsYTRlzZqUUT7+qmN/OXlkzEnqt+nrKR7TasuEcan9sCfo7YQGqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypXDf3qcRVrnwZSFT7r/wbI6kyH7m/7kkgKAD9RvuXqzPtcZ2+
	/77nshcjxJj9JGz2uNjn4NDm/kXApZovp9r7ZbSDD7uXNrCxh4ggrTHulA8ZwmKHf/qQsZoE/VD
	PDJVEoiFsUq2GsAITdYsAEaCsi4Q/i6BCzL8NysMOsVYSRGlgCpZLvMAvPGYhNlRBVB5OM/EYly
	4MUEgK2RCEKyfyLk3aGEyjS/DJm+NlFjXuNKuM
X-Gm-Gg: ASbGncu/L5VNOgnPOUYQfQwuAC0aXfjmuk5+2HRFpoKAvrlZ5zNHj5RPRb9/+Qf79Zk
	7OGfyVvCaRx6Q59nhX7PqofuA6nk852T4mT6GPbBzozFTdcpFIiDVr6ZwMxo9ghGIV4/ZMZ6eMs
	bpZ3ewPUFLO3J0oiUfPc284IvPkw==
X-Received: by 2002:a17:90b:58ef:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-30e2e625f04mr2998506a91.23.1747207752300;
        Wed, 14 May 2025 00:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErZhOIhtd3hI4AKZUHoezz+kYbi9KNoNaaRDKtt38OZ6UI/QdvxrBZC4rk+6QrFDTtDOghmI+q8BJtDQ8PcGA=
X-Received: by 2002:a17:90b:58ef:b0:2ff:64c3:3bd9 with SMTP id
 98e67ed59e1d1-30e2e625f04mr2998476a91.23.1747207751899; Wed, 14 May 2025
 00:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514065513.463941-1-lukas.bulwahn@redhat.com> <a0c3a812-8a24-481c-9354-4475ac71d68b@flourine.local>
In-Reply-To: <a0c3a812-8a24-481c-9354-4475ac71d68b@flourine.local>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Wed, 14 May 2025 09:28:59 +0200
X-Gm-Features: AX0GCFvvwL92M4FGbZOgsDbYBNn-v06sRogm_7vOCHV7R_FGPG5EmYFbXDI9rTs
Message-ID: <CAOc5a3M2Nvv0oREzWN_kzOJqt4s+0zzmqWdG4tM58RJSWAb4BQ@mail.gmail.com>
Subject: Re: [PATCH] block: Remove obsolete configs BLK_MQ_{PCI,VIRTIO}
To: Daniel Wagner <dwagner@suse.de>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>, John Garry <john.g.garry@oracle.com>, 
	linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 9:10=E2=80=AFAM Daniel Wagner <dwagner@suse.de> wro=
te:
>
> On Wed, May 14, 2025 at 08:55:13AM +0200, Lukas Bulwahn wrote:
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit 9bc1e897a821 ("blk-mq: remove unused queue mapping helpers") mak=
es
> > the two config options, BLK_MQ_PCI and BLK_MQ_VIRTIO, have no remaining
> > effect.
> >
> > Remove the two obsolete config options.
>
> A quick grep revealed that there is at least a test config still in the
> tree which uses BLK_MQ_VIRTIO:
>
> drivers/gpu/drm/ci/x86_64.config
> 108:CONFIG_BLK_MQ_VIRTIO=3Dy
>
> Not sure how this is supposed to be handled.
>

I noticed that as well, but that is really yet another clean up.

Generally, these config files in the kernel tree are ill designed and
terribly maintained.

They are ill designed, because when they are created, they are dropped
as complete kernel configurations, whereas they intend to set a
specific fragment of options, and have the rest as default. That
creates needless large files, distracts from what is important in
those files, and creates some record of the default of various options
at this random point of time where the config was created, which now
makes the clean-up pretty complicated.

They are terribly maintained, i.e., the command
./scripts/checkkconfigsymbols.py | grep "configs" -B 1, will show all
the references to config options in those config files, for config
options that do not exist anymore in the current tree. In the current
linux-next tree, there are over 200 references to non-existing config
options from such config files. At this point, I do not worry about
adding one more such reference in one of those files.

This whole proper clean-up of those files is a larger project, though;
maybe for some later day.

Lukas

> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Reviewed-by: Daniel Wagner <dwagner@suse.de>
>

