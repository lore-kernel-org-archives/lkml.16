Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BE71F12F8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122625; cv=none; b=EdM7eNAFMdAa2NU3GDf3SotMIN4rcsWQPI1XDnek+7qEpRPDf/3wfgNUiPz+M1fY1W+wLqoXAvvQV124d5pJSRmF+kYqIk8lan579x9AvGJCxkjUakN0d+ZSHisZF+14y4h4sb40aRSSbfUHueVkqHQecIgW9uKXlGzqYJX8ytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122625; c=relaxed/simple;
	bh=krU1Sg3RCwMKkG2EHCWcfC+xnsb9o2PFUa/MAVSJCEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBBEJqhrOWMYMVhijgvV5h/eTo0zkhjVmE5c1hsvvrr7oGz6U21aHELesZRY6pRM6eC1yjsOjhFOuauUhTp77Kb+vHKNSHyI00nItCtkSBNwE3r0FEOvfby+fO8IscvtyhtAld5kaci7wzOTFjLj3Cws86pm4fmFLyOQx6GHzDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WyfEMidx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WyfEMidx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad2216ef31cso613479466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747122621; x=1747727421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbx15P5bR+V1GlX7KV4xE3K+3/1ghgzLSbo/fj+Lw3M=;
        b=WyfEMidxE48pECEG6aHQbPwQnLVKTEdjFrg1li7A3F3GYQNpoBQQA+l6W1agUMRMA1
         cE+pquGXDNC/9aoe9BZPDl3tIKyWCbgAhfOgpbtGrU6Bq+UO5upr0J5fu5tfFVY6kPaq
         Gkx7JOvh90Fyk3QjL6ksYZCBJk/FIbvxp4vDa5/IwvwxqVk/2dOrrMEY2gmbGSljaPkB
         c28aAeImvtFnNVBBNgQh/StItLNMCYLvRSslGyBS1866PHeBqiqC8AoESybLUiI4K7IN
         hoUd8RoN0E3Hz6o44q4RuFtBTtAxlVl0RYpLD9st6f7Q93TpJT0dwa/02jXHkuBw51xF
         /tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122621; x=1747727421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbx15P5bR+V1GlX7KV4xE3K+3/1ghgzLSbo/fj+Lw3M=;
        b=pdK3TgKteibRFMmJ9V+y6E9jZMhhr000QMyteNqlt4hhh7gYBjXAt2Qcm0ZUoIUDDc
         V3ikOhQ00yAPg56tJoEsSOydc4sCWIxh/ThSOx/MdzOdm/1cHLN+XvF+Cmj8s7bx/jqZ
         A/gCJN7mXgk8I8u2Zl9I+6TYdmi6ipyA4YCFm+cwvHQjN3l8MjyHgA7cB4Or37MGLraC
         1QcVkEF+lwor0b/v5LtLqaHPDetpgfMByK8/ELgqx3iy6HUUT2QXFx+6fO2N/552FyWW
         n0259Vqs+xvP3GAvrqc9+2gNpdzwXZ6iyugx/tlKEg0urWmBkaG0KH20Cls4TyC8x7z8
         IAbA==
X-Forwarded-Encrypted: i=1; AJvYcCX0FD7RKEpCIQkNi3XpdC4ePPyImL4D9Ujw2HzI/4ZvZPFVTVoLzFxgr+inOHirer2/+4A7evFzyxbchos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1rmShC/FMd/FL7Ge6jhIo5JnMlNfdu2ko2eejpj0/LDcuxuA
	+J7RrBsY3sQpKRrIOWbwLzYhoGLQqJgkNMRS6AjFjpdCYdrptLbezVfI8ag8eXI/HkH2SHNSr+6
	V0xdZ0v4G7WnTl2f5cxpllVBDHN/iNXhLSz1NSQ==
X-Gm-Gg: ASbGnctS8t4kT2KK2A+i/gMu1KMyw+HDACwYwUjIdxQ2kLL8V0Ck2+JqO5On96PBmqu
	OKIGAgGidpCcB+ddJNJsTFce7donKpvD3bJG7A3aNOwU1L7Yf2Ai9KpF+dYSN/XhjOs1COb5qfq
	DrE9Cao2LKRZHrb5n7F0SqTfayXNNADU0=
X-Google-Smtp-Source: AGHT+IESJNifxjTIWbN+YaTvGiDVixINiLHP3D+SQIGf0ilJ+WDW4SxVXcU8CZ4FaumUN8fK3f7r4RyGjM5M61BADus=
X-Received: by 2002:a17:907:3f1b:b0:ad2:51d8:7930 with SMTP id
 a640c23a62f3a-ad251d87b27mr699367966b.12.1747122621134; Tue, 13 May 2025
 00:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512132850.2973032-1-neelx@suse.com> <20250512175353.GA3472716@zen.localdomain>
In-Reply-To: <20250512175353.GA3472716@zen.localdomain>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 13 May 2025 09:50:10 +0200
X-Gm-Features: AX0GCFvpOlnDoiBFJ9GVPix74qGApiZGAyvW8-mPyHiTR65notxoBWDkhFW8lGU
Message-ID: <CAPjX3FeEvwkKWPB+DqZYufmjyAuyXxzHmtL+S6z7o971=yMxWw@mail.gmail.com>
Subject: Re: [PATCH] btrfs: correct the assert for subpage case
To: Boris Burkov <boris@bur.io>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 19:53, Boris Burkov <boris@bur.io> wrote:
>
> On Mon, May 12, 2025 at 03:28:50PM +0200, Daniel Vacek wrote:
> > The assert is only true in !subpage case. We can either fix it this way
> > or completely remove it.
> >
> > This fixes and should be folded into:
> >       btrfs: fix broken drop_caches on extent buffer folios
> >
> > Signed-off-by: Daniel Vacek <neelx@suse.com>
>
> I would lean towards removing it, personally. But LGTM, thanks.

Good. Let's remove it then. Will you amend your patch?

> Reviewed-by: Boris Burkov <boris@bur.io>
>
> > ---
> >  fs/btrfs/extent_io.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> > index 80a8563a25add..3b3f73894ffe2 100644
> > --- a/fs/btrfs/extent_io.c
> > +++ b/fs/btrfs/extent_io.c
> > @@ -3411,7 +3411,7 @@ struct extent_buffer *alloc_extent_buffer(struct btrfs_fs_info *fs_info,
> >                       continue;
> >               }
> >
> > -             ASSERT(!folio_test_private(folio));
> > +             ASSERT(!btrfs_meta_is_subpage(fs_info) && !folio_test_private(folio));
> >               folio_put(folio);
> >               eb->folios[i] = NULL;
> >       }
> > --
> > 2.47.2
> >
