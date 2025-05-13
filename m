Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5ED1E883A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135547; cv=none; b=cfKzwEaelUlIRE0K4lV2dkE9VPHOpHNYKVW0AqFdL11Vc79TP/wSsulbltv1nQ3HJhThko9oU1F7I2Du+i9kPrJe4iatadP73Djmu+4R2VU6hOFJ2zq39yU7QLRDa+iZiXoUrGXLdRxyokCDHPdWl8HzyBpUzF01wTt5x5K7gEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135547; c=relaxed/simple;
	bh=jx0+CUZ4EKjOYqBTrzvNRrsrmlGJQqODHuBIWAuoAtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgSjarJJnM8L2Uv/1tY1vTQrRG2gS2v7RdQc+/Sxe44RZcYc2xxQWNG1MPsYBWjB9WuS8Jc64KqM7/Y65+Fjol7BzWwclLXkcBQzjyYeUsXE9CS1PjLBDKbFVfByqa8Kw3pl079xrqeCxqM14GpV9AdN3sufQ7ON3+R0dP/c+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDoaOK0T; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDoaOK0T"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso4957911276.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747135544; x=1747740344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jx0+CUZ4EKjOYqBTrzvNRrsrmlGJQqODHuBIWAuoAtY=;
        b=XDoaOK0T1K5jdMjUFblC12Pso6KIkIoIMt9dJPoOPoZutMNui02gO2e0/aYqAmNnCa
         k39R3qR9OGjKP2xyM3J9lhyC6GPY1WSxDwYLW4J3RXmeUwBOP2ojYZ+CVEX3RLvSBtXB
         7wpHikEiz0nS0/3KaaJbpgj55iXEjLDh6/gbJvYmK/z7hHHp0Bzl5b3Uvdg9eqMvx3gb
         obXjOvo5h/xa7UdDqz2onym/VjAuBocNMXIQ/eNquTXHf6qUltxgZcojzfx8rAMirCsj
         VzbC1u9VlFOnU6E1y3dsMkEN2E6W/9nXEjizDJUNS5ChVbS1N6M1fbi3AtJc76LXxter
         G5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747135544; x=1747740344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jx0+CUZ4EKjOYqBTrzvNRrsrmlGJQqODHuBIWAuoAtY=;
        b=AUUKBekXkLkx7cjWNr8RBMYsi+iFXhRnkK84PRL9Mn4r3ETvXtTgBn3P7AtgHP5Ei8
         daR6UBbmda4FdjDPYd6XmO2Klj3MPIYbgRHiH67DjD3SNzJ3Xl1VEcwc5zKzOcdAExhE
         qCO05jtgm25nRDR6o+oifiKxqtBaBAGEXfEakUvn8RPlAgMSL03luFFnI4ek/ieuYR2y
         t/LQJXUEoZGdy3RiI9W96cgYejWYH4c/MAc7kyUNVaV0MmLH6ckMhNpU9PikvwqZ7txH
         7El/YqYWtj9Qb8ieZtprEO5LFno9gJZ1VYM8JulXi+2npNygD8mCNojyXOuWh/gMcR1l
         //HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqoeQ0u5y8AJlp8yNTjDZIAq2ZVNacjxCcqhKiQFy8j8rh3kWpy2E9vAYOl4IQpd7aThFQzK5MvDoRJAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPwfoGMiAdODHHjUJZIns7LTHv2JgdLHiaFoAbGhpxEzM1Jcel
	NkXP93WNo8S4bhhaWCgqjMx2EtyZQVqk+MXA/5U056ayDB/AHmIL4xZM6TIOzjQfDBBjN2XzniH
	acxwy+4kdCt1+OxbKLxoXj82JWR8=
X-Gm-Gg: ASbGncvCssVENLDIaCO6juapBZs4RtQ1Nz+syX88XiD0w7wlbvEIPYkr69U7jAJWE1U
	O7ph/rMrChfFnEp/OxT+eknCRYuwDi0vb0M6epdvArske/QrduRMXh3X8J9sLKV8le2d/UxF3UO
	y/74xDjIH3yA/GSjBjC2biUcFG+AKUUQMKo7HC1ndb7SMEzIvztN7isgqcEw5aIYU=
X-Google-Smtp-Source: AGHT+IEGuuMxziFVdYtUP8z9TiEd4FVrseEW+8XGrscfjTnQ5gzhzi+tTBvoGUPcw5YgnCtq/jIVxJL1A7ZmTNzChIA=
X-Received: by 2002:a05:6902:220f:b0:e73:20fd:5959 with SMTP id
 3f1490d57ef6-e78fdc4d09emr20601806276.9.1747135544555; Tue, 13 May 2025
 04:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250428100738epcas5p3eb82b4ea94b229634f9319d23d7d7e14@epcas5p3.samsung.com>
 <20250428095849.11709-1-nj.shetty@samsung.com>
In-Reply-To: <20250428095849.11709-1-nj.shetty@samsung.com>
From: Nitesh Shetty <nitheshshetty@gmail.com>
Date: Tue, 13 May 2025 16:55:32 +0530
X-Gm-Features: AX0GCFuFnoLNeALUUDBFsbp6HxDnPDx3NuD5hpDHJ6C0RToIDBiGd2l00jeMANQ
Message-ID: <CAOSviJ3d1EjLPEni6BCZT502c3WCf1o42d5OQb+2dFx=z29zew@mail.gmail.com>
Subject: Re: [PATCH v3] iov_iter: Use iov_offset for length calculation in iov_iter_aligned_bvec
To: Nitesh Shetty <nj.shetty@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	gost.dev@samsung.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:23=E2=80=AFPM Nitesh Shetty <nj.shetty@samsung.co=
m> wrote:
>
> If iov_offset is non-zero, then we need to consider iov_offset in length
> calculation, otherwise we might pass smaller IOs such as 512 bytes, in
> below scenario[1].
> This issue is reproducible using lib-uring test/fixed-seg.c application
> with fixed buffer on a 512 LBA formatted device.
>
> [1]
> At present we pass the alignment check,
> for 512 LBA formatted devices, len_mask =3D 511
> when IO is smaller, i->count =3D 512
> has an offset, i->io_offset =3D 3584
> with bvec values, bvec->bv_offset =3D 256, bvec->bv_len =3D 3840.
> In short, the first 256 bytes are in the current page,
> next 256 bytes are in the another page.
> Ideally we expect to fail the IO.
>
> Fixes: 2263639f96f2 ("iov_iter: streamline iovec/bvec alignment iteration=
")
> Reviewed-by: Jens Axboe <axboe@kernel.dk>
> Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> ---
Hi Andrew,

Can you review and pick this change ?

Thank you,
Nitesh
