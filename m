Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE8126158A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104175; cv=none; b=l8XZqBRYzSOfQBiZIwCNOae9Ar381RF9/KuyIdsH8/8ewAH5zKWsAswRbOc2QkTqhNtXWdixTZFovbmQAasSpZrHdhurM9XbA2KbXZNnYqX1k4vl5IeA3RF4Fs+JSRKnOgSmk0m5iGG5IjltznSCRCdikBsxJlLZvrg4NOiPZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104175; c=relaxed/simple;
	bh=/M7kO/AN0DirQE8MCvfxa2LHwD+GEtyiWtNwq5y8tYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G54P++DR7+iXebSfnWhCvqypd+pq10DtZ6dyTBKj4TfztvQQV/eJo/Vz7Xz2SV/qqSsSd04t3Tb3F1lBjMvlb16BG2aDUPSpDbnX+Tj1POY2K8c88wPcgeQwJHvsWHgvjaD73J6CkPGvPZmWnQ6v1A+/ETvd4EhFmPPsJ0f0pv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GerwB3Ol; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GerwB3Ol"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523f670ca99so2402168e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104173; x=1744708973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQJxu0CgY3ztGh+KGz1XEllD5aCbm4Ec5wR9oKzfzj8=;
        b=GerwB3OllRaBwdjkzLFrV59TAmT4Ch0fQnKS9P2dupuCmgfBY4DglZJdkYsOLuTxSv
         aum6AgFU8xJFf7RZ1JVBsNVjw8NM7+nENNKSJ1pARlTLNcG+f9IRY5T/6sh3ep0LNzh7
         gaoPiaLg4C/1lElaNaeRFJdcKUGMNu4nsod1dDLK+ruvDxzoBqH8w8ta4zinNMz4MceP
         eGsPnlC2y+XrS9aQDTlu7p++nPuihtDmokgr/4WubZctY3rxYP6YJxWmF92yAlX9A3hC
         rePeb7Zn2m5ov88zUGLsd2X8a7/L2ZGc/ojvysjNEjgeOgQZsFLbSyYif+JkUPgiBdrr
         Q7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104173; x=1744708973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQJxu0CgY3ztGh+KGz1XEllD5aCbm4Ec5wR9oKzfzj8=;
        b=pkwZMfhnhtemPDp6gVOKAfsE8dh0CwVLPu0pdkyLzsW9ljLWqDCHzAm8s1qhXsyihs
         79mP8eu0fc6LbqRsaZr3C8z/Styxz8vGaErJpcXNT8P8pVYBMjKgOFfKOG3qlIAYejCI
         /eGjnu6qFqfv4iwCVwgg/5QV3V8Oaa38HdjzWd2Kw/CKou3bqQrRl5+tt+TKyiEAOvQI
         ljWa1gjFmOR9GMbuLOg8ofGV01nwH0Oa/Qb4PNG/YoPdsFDvEX+nCmiOIV0p209S3iYe
         RixEaaDio3HSUOn59KIfA07A1nbYZdjJr6fMBYZh1CtqjzwZMmjEFQCxP6HLBlFQdUJs
         bOWg==
X-Forwarded-Encrypted: i=1; AJvYcCVryis1lDHDpPREXQQvVPvCtuZS9UUY3NH6Pr5JrjPPUkYu9crLXaQwyh3tlhuTu1YdB9SxsRixPUCgpmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJE6VIPelW3/w00Iaw1Pv3ZWpG5buywr3eMvO9iXF/Izqoa9n
	mn7OY3jG6kWomteYKfp31MhDPuaVe4FzIxbSsELGN4Q5DOvCLpkIvOm72cVqM+GVP/lfm1sy6cq
	f6DGaFlw52fP3YX69z8yYLQbqKBM=
X-Gm-Gg: ASbGncvTFv7DmCrY2RnHNLKcWkMCfH37ZB8ptuczOx9atzp+p41QMJ0OpYHo0DT00Eb
	V7pIx/KCoA14TZEPvMr0jac1neZ4CE6p4veqUxYXIw6ZdNrkVJVHtjYGoIIO+fYTEdQhnQDD6bs
	iKA0EhbeFN6WBNfou9m12qacS+M1M=
X-Google-Smtp-Source: AGHT+IFqm7trkHxsW9aThI6ptC3yUFdyXutxAMPMGPBTlY31LBfZp0Y12C6f0vwYqJkOnUOQsHoXmwZRHrcKeAih2cI=
X-Received: by 2002:a05:6122:6585:b0:520:51a4:b84f with SMTP id
 71dfb90a1353d-5276444fe9cmr12081257e0c.4.1744104173131; Tue, 08 Apr 2025
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
In-Reply-To: <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 10:22:44 +0100
X-Gm-Features: ATxdqUHWCJobI7lIeUJ-4_4hJAPdZTYS5oHhQSwcsK_KLFX4CDP6067roMe28Hs
Message-ID: <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:20=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > The code contains no spaces around binary operators making it
> > hard to read. This also doesn't adhere to Linux kernel coding
> > style.
> >
> > Add white spaces around the binary operators to increase readability
> > and endure adherence to Linux kernel coding styles.
>
> ...
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq + 1) & 0xfff;
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum + 1) & 0xfff;
>
> You mentioned Linux coding style, which also requires lines not to be
> so long. These lines are. That's why a few versions ago I suggested
> you to change these to be two lines each. I don't know how many times
> to repeat this (it's third one).

Okay, sorry
I will add a third patch for a line break before the patch for %
operations since each patch should handle a single thing.

Thanks.
