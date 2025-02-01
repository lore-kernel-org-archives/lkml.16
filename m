Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039092F852
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738446671; cv=none; b=sg9lRoDoDkqeXTHDQhX8LrEzVWPoaXdSdxZ89P07z8CPP8VIC1+dhlDS2zF8WTmCNLeHLPBsdtBdorEtBGFu2FVg38YongKf7aMiVv05lKhsGuYxFsSrH6LNOs981cC/pNiH2XWq4fR8jdAEjh5wn4jCpJwt4Ew7UsK+9/aqqyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738446671; c=relaxed/simple;
	bh=kddqWlzvi+SnUGZ97+H+9f4pznSUeD+3hXHdyv7op5s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9utF0/ckqzu7fO+bjtpeDC+YQiKZVFeRGJbOCnlKLuGB9EammCuQENz0r8VhjIVnDpukSIpwMV89IHWniDyZU/eXtJ9s4aUChgiz/PDZFkZ0z5fFjVTaCEvgGyh/DKJg0HdVatvAxViXMuA/8SuyFv/w8DEgZTEz29S7ploclw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XN+oSP4K; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XN+oSP4K"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so2770527f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 13:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738446668; x=1739051468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6+6LjaugE0DyQnf73qvCDL5j+VRZNBEK4vkemWJG2c=;
        b=XN+oSP4KcW3DZxCsVwEjCY7+wh2k5EEMBKAeQcYBwTGO+aZe0r+4NsEffln3OKvmtF
         NAqkyN2uJqBdXAbWwUnUwPWhkt2oWOyx1iM0r7nrD4Stz5foaiNfcrvHL28yqEW608tG
         CjbyW60PSNn+UmYCQE3frOwhK4w1n25VlTe9tcj22nGV/b+kTmWQ2CfatLWQTcZbJ3gH
         jbQwagfPs3t4Rz3EbRhjth/+f9WrhqhO9mTIxg3FrrW4SK3eglhRaDHdC3rDNR4Twb6J
         ka8LB0IjxH++GwesUqe8BsbuiJf8pRyUGf6zr4CJc2tXFdqlg0danYuPKBxlg9Ow4xJ1
         p0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738446668; x=1739051468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6+6LjaugE0DyQnf73qvCDL5j+VRZNBEK4vkemWJG2c=;
        b=bwJjr5cc/HRTOyNy1yO85exoM8yGW5xsAcR2UbPxZQDFieltUWvgJTJTmrVlOxdA4Y
         4P4/UxrVHxUCeI4Oi7lmddO07tErx/tmYYP/IHUowJ7X0bv1exZHac5SvTXrM+ruQQJV
         s9ULARvBw6ioqIQTCrC7642+gxYNJ33P8lpEfXzQ/v+GkF5e6H8DXvmIKG2YZeBstkej
         OhA23lKP5C/ccRkuEuXZ7s9lklOgz65ZDUznUoq7GTGQ1lmwoXX3DMYqhw1KQter3uy7
         k2LsJ5l46CfzMHdjpsrRPewEU1dXSXP5K60JEHNuXiKblUhdDKSuni3xn6KNj5OaI8md
         WKFw==
X-Forwarded-Encrypted: i=1; AJvYcCXYsM9gWHIcqYvjZv0wBzasu1DXKfIwfNMdcEJV7hrGGz4XGxu5Sa5cHFl8mkGnBGM6UuyeSeIorVzw7BE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytaSWjB/SNjAW5/WZ7nv3CLMD+KsopGOPaoK8/yEb9baABp10v
	6IPlzemuB9MtCHNVB5y7FGdJ4x/p5TRtkEttnM8ss0AB08n8q3q3
X-Gm-Gg: ASbGncuMDIhxRwE37diuULoaINbeU/GaTBY6dUE1Dm3j1SMVZJQkfMgzfYiBvRfZZg9
	ocf3FLlh8xneJ/jwc+uhyIv0WMz1hBf/+ZVT/Dc6UMF8lJqkRcX8oYDPHWfxi5drLB2ZHMFtvF9
	OAyRbSckr3OuqVwW68lL0q32akvybM05s5FR72bA1k5usfX1PGiMirShNLPBJF1aRnges4KBEE/
	14T1S7Ffb/Hs8cLIfQ+x008n94KoZBJboFfkLp6mzVgL0MrbgNaG8cuK6940rheQN9pIt681sOI
	q4gby9ljPxsWfbrEP7QVCZxNlDAoOybU6lnD6Vh9CxBLfNYgOyXqnQ==
X-Google-Smtp-Source: AGHT+IHYRiLd3QDJnOn5b+AXIOzWtb3HxAVhHzU0YObH3osU8dB6+cLswxUn6gthx+zEs/IB7VYZBg==
X-Received: by 2002:a5d:5f93:0:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-38c51e8e12fmr14080788f8f.43.1738446668128;
        Sat, 01 Feb 2025 13:51:08 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa3dsm8391149f8f.93.2025.02.01.13.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 13:51:07 -0800 (PST)
Date: Sat, 1 Feb 2025 21:51:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] pid: drop irq disablement around pidmap_lock
Message-ID: <20250201215105.55c0319a@pumpkin>
In-Reply-To: <CAGudoHFHzEQhkaJCB3z6qCfDtSRq+zZew3fDkAKG-AEjpMq8Nw@mail.gmail.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
	<20250201163106.28912-7-mjguzik@gmail.com>
	<20250201181933.07a3e7e2@pumpkin>
	<CAGudoHFHzEQhkaJCB3z6qCfDtSRq+zZew3fDkAKG-AEjpMq8Nw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Feb 2025 19:42:32 +0100
Mateusz Guzik <mjguzik@gmail.com> wrote:

> On Sat, Feb 1, 2025 at 7:19=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Sat,  1 Feb 2025 17:31:06 +0100
> > Mateusz Guzik <mjguzik@gmail.com> wrote:
> > =20
> > > It no longer serves any purpose now that the tasklist_lock ->
> > > pidmap_lock ordering got eliminated. =20
> >
> > Not disabling interrupts may make thing worse.
> > It is a trade off between 'interrupt latency' and 'lock hold time'.
> >
> > If interrupts are disabled then (clearly) they can get delayed because
> > the lock is held.
> > Provided the lock is only held for a short time it probably doesn't mat=
ter.
> > Indeed, unless it is the worst one, it probably doesn't matter at all.
> > After all spin locks shouldn't really be held for significant periods.
> >
> > OTOH if the lock doesn't disable interrupts then an interrupt will
> > increase the length of time a lock is held for.
> > This can be significant - and I mean upwards of 1ms.
> > Network interrupts can tale a while - and then the work that is deferred
> > to 'softint' context happens as well (I don't think a spinlock stops
> > the softint code).
> >
> > I've a feeling that unless a spin lock is held for 'far longer than one
> > should ever be held for' then you really want to disable interrupts.
> > =20
>=20
> Note that taking the interrupt trip increases single-threaded overhead.

I'm not sure what you mean.
Disabling interrupts isn't as cheap as it ought to be, but probably isn't
that bad.

> Per your own description, if the lock is contested and interrupts are
> disabled, handling them also get delayed by CPUs which are busy just
> waiting (and which would otherwise take care of them).

The slow path for spin locks ought to have interrupts enabled.
But, in any case, the interrupt is only delayed for the short time the spin
lock is held for.

> So while this is indeed a tradeoff, as I understand the sane default
> is to *not* disable interrupts unless necessary.

I bet to differ.

If an interrupt is taken by a cpu that holds a spin lock then any other
cpu that attempts to acquire the lock spins for the additional time that
the interrupt takes.
If interrupts are disabled then an interrupt is delayed for the time
that the spin lock is held.

The execution time of an interrupt can easily be a lot longer than
most spin locks are held for.
Either because of the work that an ethernet interrupt does (even before
deferring to softint), or because even a single PCIe read (eg to an
Altera Cyclone V fpga) can easily take 1000s of clocks.

Now the execution cost of the interrupt has to happen some time.
But you really don't want multiple cpu spinning waiting for it to finish.

	David

