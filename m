Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EAF222578
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748018450; cv=none; b=WUKdv52fqUGwrzu99BM3LhnCYW3TyvhjQaeFJQQeL0e4dr79a1BwpRk1UUnVNUql0wisb990Sq2ou8SFQE+f+0d8ldFA5xOfmvHi7aEenH+jtLTNU+yTRncWqO0uCLfKzxJJ8khqdDIGjhc6WDCe/6SWALVbChK4ZH/ra1+/VL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748018450; c=relaxed/simple;
	bh=l2TFir+vNb/vrID6aQMq17jFX6ZrzDNcaOSKkZFY7k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUBb8hUyaaFiN9SCjmeefnccgLcNCg7dIg+Yjo2y5x4V9ciPpb8qFA2t8+H8fwmrznruP72vrMhWNRmGNQ/OvyE++y966ATi+ZHI7Ck/Gkv8YZF2jV7/AVrJVec07Hp7M6zABNWCmKr0c4i7HRVmgKSuEhcLTeBm2YkZ9Cjds60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA1sjQ7D; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA1sjQ7D"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52934f4fb23so29209e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748018447; x=1748623247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQrF9YRsflR7/GINj2+0t5pNix1EimXCUknfwsemFCk=;
        b=PA1sjQ7D8MpY2sQSvhvN86Fkzko6lfbzGq3w2aEzSUcQQk6C74jAwxhV6deIELaGkY
         YbQBpGt4UlnT1jH/dbdZPOuQuuerQ8G9JM6yAz36Ws09QE8VE0868eoT/3Y0zc65Ws1d
         iXPYw3mRburCl0Wvyiwnn4yHKExQeg8Ey13J5tNHZA4jzN0v3af4NiB7zCE8xxERowo8
         a7+F7AwR/r42NRaPMkigjOM03gFXN2aPfPve7t+fuPbkA0MZScXZLanLT2r0mqyho7Zf
         LWJ4a+qehrIPIY6ucdwLUe3goPgwT0KFuma3YHz7SVYOCUYvkBpcreintWOL+VOKUn++
         QsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748018447; x=1748623247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQrF9YRsflR7/GINj2+0t5pNix1EimXCUknfwsemFCk=;
        b=mQ2O4Ek/G80TO1JxLHw4EJlZvgM1OXBhBX1ArWTIzFJ5MdiBZcH3cVCzYKXVl/w+Pa
         O30k1JJfCR6Or/O2YfSVrsqZsS/igezwBg1PRkX5bFmzTPOkaDCS8ANGDHmh9ab0keSO
         J5l7Jr027DeNxhBSYYmzig1/jdPGg2Y/Act6DcfZvS50pVpGVV72d+cXHwBrC5ONrTRY
         LvlPFGEZhnEavDyzLLHj7Qs4sjZNaaml9jLtnDvO8WJP1qi7VzrZd3im0z4Y7xz4AdxM
         Rk+WijMwFOJhnOL5Tbe4sHQbkC0sdR4DLoVeRuu2GrzSIgPpLHI37ivAgMranj8xmL38
         +8UA==
X-Gm-Message-State: AOJu0Yw/X8DyaNc5DLmYw/+ZsouzzvSSZ1A6cVFK7msxrdp6AnwTVKbK
	GnzQt3SykfDAp1u37Dm+IS9BpzYCzeYvPm6XG9RDKLKkwfzIlxjJiMYQslmbbqwgWcT+Pb/M1RD
	IbpY2YeAm9d3tfsFo2gUKLiFF0b0ofOI=
X-Gm-Gg: ASbGncvoaGX2/mKt3NmGuFXv2WyZTyK3oKH9F9KSRFTMcF3fDjZcLtdAKDgP+hP4T/A
	y+cU8bkvMCmjdKq+V8mNRBTHG+uHW00xoG15rs0LQzkt03IpAU0+Wv2Cpe9k4tbsFF6mcS2UCL4
	OU0AUTzH+1AvXcuUfZoKA1JoyoPPfvABvHjcHzCSZ/lSjrHGVStTZ9bDzCPKfKrkCcxg==
X-Google-Smtp-Source: AGHT+IFJF3StJDxqiD0vWnc7KLhQkAqadAul90UhKf0HXRlPlhBzdYYdqyDiUxyvUltGjZEPkuIt8u8b9yB5Haiq2Kw=
X-Received: by 2002:a05:6122:1d48:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-52dba80aa18mr29570055e0c.4.1748018447322; Fri, 23 May 2025
 09:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522182644.2176645-1-daeho43@gmail.com> <52eee781-f53c-46a9-8ce4-96c5a0589240@kernel.org>
In-Reply-To: <52eee781-f53c-46a9-8ce4-96c5a0589240@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 23 May 2025 09:40:36 -0700
X-Gm-Features: AX0GCFuDGCRC94xkoWEBxrP6Skv4W0yvPLEXQKva3_rO-JHqoXHFhlWGlpJD-LI
Message-ID: <CACOAw_xCQpmiRRuhjpGbB4mKzonE24Uyg=jtrxge-hFZrn5dXg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: ensure zone size is equal or
 bigger than segment size
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 7:06=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 5/23/25 02:26, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > Otherwise, it doesn't work with a crash.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> > v2: relocate the code
> > ---
> >  lib/libf2fs.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> > index d2579d7..148dc12 100644
> > --- a/lib/libf2fs.c
> > +++ b/lib/libf2fs.c
> > @@ -1347,6 +1347,11 @@ int f2fs_get_f2fs_info(void)
> >                       }
> >                       c.zone_blocks =3D c.devices[i].zone_blocks;
> >               }
> > +             if (c.zone_blocks < DEFAULT_BLOCKS_PER_SEGMENT) {
>
> If c.zone_blocks can not be aligned to DEFAULT_BLOCKS_PER_SEGMENT, do we =
need to
> handle below code?

We need to make sure that c.zone_blocks is a multiple of
DEFAULT_BLOCKS_PER_SEGMENT, right?

>
>                 /*
>                  * Align sections to the device zone size and align F2FS =
zones
>                  * to the device zones. For F2FS_ZONED_HA model without t=
he
>                  * BLKZONED feature set at format time, this is only an
>                  * optimization as sequential writes will not be enforced=
.
>                  */
>                 c.segs_per_sec =3D c.zone_blocks / DEFAULT_BLOCKS_PER_SEG=
MENT;
>
> Thanks,
>
> > +                     MSG(0, "\tError: zone size should not be less "
> > +                             "than segment size\n");
> > +                     return -1;
> > +             }
> >
> >               /*
> >                * Align sections to the device zone size and align F2FS =
zones
>
