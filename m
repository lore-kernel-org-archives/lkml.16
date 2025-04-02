Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B1235C1B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583083; cv=none; b=r9I3SRiBDzgee9pKPJKQHIKAFxx/fFEyKIXurCy+xaz6qLKPU0qK8J2/j5+M7yQBiG59dAcO5I2/ZanV9t/UVfWPn171UPcqgA2K9oQTt2hclopHTb/2ceDrl5zVP8gczPyWfkNPsraUpOdkQ0akAQNmQ5BWtL3M/qIDUnvZ1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583083; c=relaxed/simple;
	bh=KpLcYbrHVfCU5lpqyLtXrasc+74ajQ6IUD1JAcxOssI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egtg/5PhtLz1a1Njl/tERO7aaWkSo0GXRG/NuN+sKG/R/bIAfF40U+qHNytY3Xfj6Ad19YFp+nSDFUnkdsI95ssivpRQ6+KNlXF0ZlW38nKWZWQ6EyNz4xVq7RBK5aHrfo6df9CGHN7bg9RrW14jZfqoHJ0D3tSqURdGot3QLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VDsWAyZW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VDsWAyZW"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac297cbe017so117186666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743583079; x=1744187879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ewjxji6IY/5vNR6ri48+Aciv3sy2R06Z/j3CAF5o8hg=;
        b=VDsWAyZWa8oGdeKEyrcuV7inTTvGPSC0WG1Wsox+VALJdx+v1ieNDjD0u3j76/HUbT
         kaj0xw9FiZj/ZaaFpqGeFS+n2MZUDihy2SmDaYN0ElgjjbC5WfNK4ZxunwUBHPHQxzhn
         kuZrC2smFs4QT/b4ZIOxiiO97DKyETJDUHeCzwZQkd3tk/isLpYORuCHAVFZta5lysgZ
         msrWT+RK8yXLkA44Bb92gsknVXIEL8aDSpLJTLis4x5iIpJJRHcNicsCIq+BNbJufAuX
         b1QtslmlyM0MpLdtyo4JwydDWfv6RWyMVCqSf+uJO1rFfOsKwv9CCGeCsV1SKXxpeTrf
         nHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583079; x=1744187879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ewjxji6IY/5vNR6ri48+Aciv3sy2R06Z/j3CAF5o8hg=;
        b=Kl+WGZCy+AM0cxdSzX+JwJycIsccA5SrVklbYNgGOp8KGJjZCSY6GfTQDMaPqXKa7p
         28j+ZgSnAzYTbyilFtdCJqjRES1ymCXFFU4p+2ztBuNBXteR1ESqrpWEtirpWkAUI6I+
         wtmZBpQ29qyVmgx0eBXRGpcBpagHqV+bZ6GqTXeYyEstTjz6B9mQ7qqPXrPpl7b3MSrG
         BtjMY+82Xj8gcefqeVOihWFxbCv4UsukUel35JBgajyKlDDoca69mXkalITxYIZMujrZ
         lgwTWpQMhKdPZc5jaEnuoAVWedI/Y9ubsnk2Z5ilA21iZp8O12sBePViIoDeYYnMfQ1A
         DIjg==
X-Forwarded-Encrypted: i=1; AJvYcCU2zDW+/Hr3N4lxdnUExzd/lFcy69iWHAECyvcxYE7J9IaiS48l1cmuB9LhCbphR8bw4NUkjON7SfdxHNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zyk86wbjPsvB34v8Kk0km5Bx6KkbovMsQJ/vv/tBu90bCIWm
	CjQoIBCKiRNYJZtLmBHeNcNN71+M+sAW4DO+NmFMpdUGAed3gXd0qlG/V6wiHxqSPoUahjDU0kE
	AyitGxtGPgR1yIMMmxeHheigXtx0WHOBn+iSqOA==
X-Gm-Gg: ASbGnctTgmVt4Dqsjuc5ng0RxWj6Pm5uv4Gd7tzUXtJUnoV45WXNY+dx7jvrY1/T0Jh
	azkd7hLgCEbka6mWCw6vdquq5u4oPUSlW6pBkoXBJdRvn7nlucgf0hYFpWXYfQEukdlm2roLNjf
	ohDLT/1/fF+W/MsjWQ9UJWxnx1
X-Google-Smtp-Source: AGHT+IH0pZQXPIsyshZNcJikLUSgvoN+xfTfjXFKehtu6edO0p2rSXRH03DqtByAaVQ7BKiVGBgd3Q7D/uaupNVEq/E=
X-Received: by 2002:a17:907:3f29:b0:ac3:ef17:f6f0 with SMTP id
 a640c23a62f3a-ac7a5a670ebmr93213666b.5.1743583079476; Wed, 02 Apr 2025
 01:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331082347.1407151-1-neelx@suse.com> <2a759601-aebf-4d28-8649-ca4b1b3e755c@suse.com>
 <CAPjX3Fdru3v6vezwzgSgkBcQ28uYvjsEquWHBHPFGNFOE8arjQ@mail.gmail.com>
 <b1437d32-8c85-4e5d-9c68-76938dcf6573@gmx.com> <20250331225705.GN32661@twin.jikos.cz>
In-Reply-To: <20250331225705.GN32661@twin.jikos.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 2 Apr 2025 10:37:47 +0200
X-Gm-Features: AQ5f1Jqo0iwFCHxqBfuK--cN0_u5G5hQolFpGNc8fxZ9Qu7JV6qFHZhlP6qRpV8
Message-ID: <CAPjX3Ff2nTrF6K+6Uk707WBfvgKOsDcmbSfXLeRyzWbqN7-xQw@mail.gmail.com>
Subject: Re: [PATCH] btrfs: zstd: add `zstd-fast` alias mount option for fast modes
To: dsterba@suse.cz
Cc: Qu Wenruo <quwenruo.btrfs@gmx.com>, Qu Wenruo <wqu@suse.com>, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Nick Terrell <terrelln@fb.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Apr 2025 at 00:57, David Sterba <dsterba@suse.cz> wrote:
>
> On Tue, Apr 01, 2025 at 07:44:01AM +1030, Qu Wenruo wrote:
> >
> >
> > =E5=9C=A8 2025/3/31 20:36, Daniel Vacek =E5=86=99=E9=81=93:
> > [...]
> > >>>                        btrfs_set_opt(ctx->mount_opt, COMPRESS);
> > >>>                        btrfs_clear_opt(ctx->mount_opt, NODATACOW);
> > >>>                        btrfs_clear_opt(ctx->mount_opt, NODATASUM);
> > >>> +             } else if (strncmp(param->string, "zstd-fast", 9) =3D=
=3D 0) {
> > >>> +                     ctx->compress_type =3D BTRFS_COMPRESS_ZSTD;
> > >>> +                     ctx->compress_level =3D
> > >>> +                             -btrfs_compress_str2level(BTRFS_COMPR=
ESS_ZSTD,
> > >>> +                                                       param->stri=
ng + 9
> > >>
> > >> Can we just use some temporary variable to save the return value of
> > >> btrfs_compress_str2level()?
> > >
> > > I don't see any added value. Isn't `ctx->compress_level` temporary
> > > enough at this point? Note that the FS is not mounted yet so there's
> > > no other consumer of `ctx`.
> > >
> > > Or did you mean just for readability?
> >
> > Doing all the same checks and flipping the sign of ctx->compress_level
> > is already cursed to me.
> >
> > Isn't something like this easier to understand?
> >
> >       level =3D btrfs_compress_str2level();
> >       if (level > 0)
> >               ctx->compress_level =3D -level;
> >       else
> >               ctx->compress_level =3D level;
> >
> > >
> > >> );
> > >>> +                     if (ctx->compress_level > 0)
> > >>> +                             ctx->compress_level =3D -ctx->compres=
s_level;
> > >>
> > >> This also means, if we pass something like "compress=3Dzstd-fast:-9"=
, it
> > >> will still set the level to the correct -9.
> > >>
> > >> Not some weird double negative, which is good.
> > >>
> > >> But I'm also wondering, should we even allow minus value for "zstd-f=
ast".
> > >
> > > It was meant as a safety in a sense that `s/zstd:-/zstd-fast:-/` stil=
l
> > > works the same. Hence it defines that "fast level -3 <=3D=3D=3D> fast=
 level
> > > 3" (which is still level -3 in internal zstd representation).
> > > So if you mounted `compress=3Dzstd-fast:-9` it's understood you actua=
lly
> > > meant `compress=3Dzstd-fast:9` in the same way as if you did
> > > `compress=3Dzstd:-9`.
> > >
> > > I thought this was solid. Or would you rather bail out with -EINVAL?
> >
> > I prefer to bail out with -EINVAL, but it's only my personal choice.
>
> I tend to agree with you, the idea for the alias was based on feedback
> that upstream zstd calls the levels fast, not by the negative numbers.
> So I think we stick to the zstd: and zstd-fast: prefixes followed only
> by the positive numbers.

Hmm, so for zlib and zstd if the level is out of range, it's just
clipped and not failed as invalid. I guess zstd-fast should also do
the same to be consistent.

> We can make this change before 6.15 final so it's not in any released
> kernel and we don't have to deal with compatibility.
