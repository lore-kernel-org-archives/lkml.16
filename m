Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631551E0DBA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927902; cv=none; b=T0PfEK0uEAqTtMEAD7MXLqAGVdg047Y5Cp7WMh9RRQTFHmMVBRtmw9sopfpJqgPf3lH/wJ8TwztVJ2gcWqOMCFXWx/hZ3THCwvNbWwYBWu8vdEhD2PxuW3ixdbdJkNa1I52VuTUvXT9YWyVDTl2X5VWx5Vho9kqRRAJKjlpzXss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927902; c=relaxed/simple;
	bh=MdFbKAOEQYCc1jkBKljdoNZaXqm8BPhMNW5HxkmA/Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkFuBjNhvB2no0atcZ3bwAAJAEg6yWioxnvudoxYXPd+8Eb6s34Oip/9q7LQ/m34b7cw2qKfj3YqzrW9LOkWv7fRgwpzQIBamWPAZclcLfXYaHYcbSS7nqqC+rCz0w4BXwfV2nFIwIfype5a0HKM+RlOOjcwmQDq6OSAeCwK+Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwScV3bW; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwScV3bW"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e6e2971f79fso4564283276.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927897; x=1746532697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YC2LGGpE70kiPFeCCi72EkYRfCk+pYT/yGe+VdlkBmI=;
        b=ZwScV3bWffdnhcHL+PtUDFKREP9TBZa0z+8a5ITYu4fq3GCks1m4JMO+cCcMPUPnjr
         K2ONk0Y/thH+erfVCP6bgtwXciDNP/eKPZgeRg6b4XX/LO7g+//vbrrkQDTqiD2yQQYh
         b18aGoYbZtNlJCDAsTyDkxyNFm9qXSSgcZzncq1lCIulkddWDYebRVESeo1guA6RVz+5
         G01jF7qbw5bor3OK5u93HxRLI6j7XLm+/LophWgDFdcWXV4AYeJTXJwzn8FPxLFYK0CL
         IOs4DEa0UqhS6Y83jxknY952u9r9lHmIJqBFv6ybt6eNEqv7C6FmiTZEfJdEvxKGf+68
         jgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927897; x=1746532697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YC2LGGpE70kiPFeCCi72EkYRfCk+pYT/yGe+VdlkBmI=;
        b=tGvYX1sBtw9ALEfjW6QndbALFGIWy/+yltAwfeXryFsoxRVTQxY+dlW7XMKWxckR58
         m2HQbPcuROGXCZvuUq/ytbcao/TuzcFknfB6T4TTKqlh4QXoc7yy1OCyxLZbGWu1yd0d
         A0OXkv2TPTTKln6PIjUIThW2xJH+Jju2HMPTajh2LFnSKEQKw3EkrUsagUjXopUBLy+i
         nKQ3yCqr8tYvQ4s3boCN0uvcOUgwmxtbZJHHAEPZAvGMOPs1Jbml85xolYcOsFTrCi9k
         qiChIqHmh85CDS2uqNz4igTfZRHUOwnwEpCEbh22RbFgzT3NBUuvuq7nFxf/LhffClMk
         6o3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCKGY+QCHBZVPBK67YgJDUp5puspbzGehVOQ8YHya8AvUw5Ff1hN6qA/fj0+DjZ8rbcao5MCc8DPmy4kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKFxb5WiiUGCIu7Fjxx2tXLlhKsotEpBG7ksi3ooPKdpr2gzXb
	LNzKwrLpziX3xUyYrqLs22JnULJh4c5wBS9ymKtiuqvB3pwttdpwOMxUwg4vjbiqq+Wq6RjGDsE
	Fp5vKQmSQHhwf/EcX3dxoSasIG1Q=
X-Gm-Gg: ASbGncvLvf0QPfJjcMeI+pTtXhYkMrrrI3BN8TvVA77i15nQc4BwiHoH75hf26F0ngP
	JmqGARFwYtrRNMlfogNfhDzUq/iFRpmLl0dlNt2Ft/nGTuc19Lmw1mPfesarROnqu79ZjK4WbjB
	pERfZS1bk1HuGZCk12CZmqrw==
X-Google-Smtp-Source: AGHT+IFZuUpUcT0FpWh/xFcN7YV8mTmhhmd1TfDP2Xpd6GzqIj7t/GP6ENv//lBM+JolYrLZVqHMwRl7cIw868ZvG+I=
X-Received: by 2002:a05:6902:2085:b0:e73:9d0:1823 with SMTP id
 3f1490d57ef6-e7323472933mr17628295276.47.1745927897185; Tue, 29 Apr 2025
 04:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
 <871pymtab3.fsf@bootlin.com> <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com> <87bjsfv0x1.fsf@bootlin.com>
In-Reply-To: <87bjsfv0x1.fsf@bootlin.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 29 Apr 2025 19:58:05 +0800
X-Gm-Features: ATxdqUFw156jElhjP-eZDXnKLbf_YdyLPXPeNQmy3SBNzsMbmjDF-l2toZGqZGM
Message-ID: <CAJsYDVKiMeYY2rw_BxuW4BAxvMcq5hDwzhiPoAR=tkXzZpRYiw@mail.gmail.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and then
 update_cache in write operation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>, 
	Chia-Lin Kao <acelan.kao@canonical.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Steven Liu <Steven.Liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Miquel!

On Tue, Apr 29, 2025 at 4:15=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hello,
>
> On 22/04/2025 at 09:38:26 +08, Chuanhong Guo <gch981213@gmail.com> wrote:
>
> > Hello!
> > =E5=9C=A8 2024/12/5 23:32, Miquel Raynal =E5=86=99=E9=81=93:
> >> Hello,
> >> On 19/11/2024 at 17:39:49 +08, Sky Huang <SkyLake.Huang@mediatek.com>
> >> wrote:
> >>
> >>> From: Sky Huang <skylake.huang@mediatek.com>
> >>>
> >>> According to discussion with Miquel Raynal <miquel.raynal@bootlin.com=
>
> >>> and Chuanhong Guo <gch981213@gmail.com> on FORESEE F35SQA002G patch,
> >>> Chuanhong recommmends that we can use the following sequence in
> >>> spinand_write_to_cache_op():
> >>>
> >>> x1 mode:
> >>> 02H(program data load) -> 84H(random program data load) -> 84H ...
> >>>
> >>> x4 mode:
> >>> 32H(program data load x4) -> 34H(random program data load x4) -> 34H =
...
> >>>
> >>> 02H or 32H commands will clear cache buffer on SPI-NAND and load
> >>> data to it. For those SPI controllers which can't finish transmission
> >>> in single step, 84H or 34H will be triggered for the rest data.
> >>>
> >>> We observe that some current SPI-NANDs, including FORESEE F35SQA001G =
and
> >>> F35SQA002G, must use 02H or 32H to reset cache buffer in flash before
> >>> using 84H or 34H. Or users may encounter program failure issue. This =
issue
> >>> is not always reproducible, but it may occur and cause system instabi=
lity.
> >>>
> >>> This sequence should work on all SPI-NANDs nowadays. I also check wit=
h
> >>> Foresee that the sequence can solve the above program failure issue.
> >>>
> >>> On my test platform (MT7988), SPI driver is drivers/spi/spi-mt65xx.c.
> >>> And I limit MTK_SPI_IPM_PACKET_SIZE to SZ_1K to simulate lightweight =
SPI
> >>> controller which can only transmit 1024 bytes.
> >>>
> >>> The test step is the following:
> >>> - mtd erase /dev/mtd2
> >>> - dd if=3D/dev/zero bs=3D2048 count=3D1 | tr '\0' '\xA5' > output.bin
> >>> - mtd write output.bin /dev/mtd2
> >>>
> >>> Before applying this patch, write operation uses only 34H(update_cach=
e):
> >>> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st=
 byte: 0xa5
> >>> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1=
st byte: 0xa5
> >>> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st=
 byte: 0xa5
> >>> [78.962966] OP code: 0x10, addr val: 0x300
> >>> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st=
 byte: 0xff
> >>> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1=
st byte: 0xff
> >>> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st=
 byte: 0xff
> >>> [78.992527] OP code: 0x10, addr val: 0x301
> >>> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st=
 byte: 0xff
> >>> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1=
st byte: 0xff
> >>> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st=
 byte: 0xff
> >>> [79.019435] OP code: 0x10, addr val: 0x302
> >> I am sorry but above you said that we should not perform:
> >>      0x32, 0x32, 0x32...
> >> because the second time it would clear the cache again. And here
> >> you tell us that actually the core already handles that by performing
> >> instead:
> >>      0x34, 0x34, 0x34...
> >> So what is the problem?
> >> Or maybe I misunderstood the issue, but I think Chuanhong raised an
> >> issue that is already solved? Isn't it?
> >>
> >
> > The issue is that the FORESEE NANDs require the first cache writing
> > instruction to be WRITE_CACHE instead of UPDATE_CACHE. i.e. it needs a
> > command sequence of:
> >     0x32, 0x34, 0x34, 0x34...
>
> So Foresee NANDs do not support update_cache, why are they advertised in
> the first place? Could you we have a less impacting solution for the
> other NANDs?
>
> > This patch does exactly that, making the first instruction issued 0x32.
> > It should be applied to fix the issue above.
>
> My understanding is that this is very specific to FORESEE NANDs and you
> are changing this for all NANDs. I have fears that it will break
> everywhere else.

I just checked a few datasheets of SPI-NANDs from
Toshiba/Winbond/Etron/ESMT/GigaDevice/Macronix.
All of them specify the programming sequence to be:
write_enable->write_cache->update_cache if needed->
program_execute->poll status.
Some of them mentions that the only difference between write_cache
and update_cache is whether the page cache is cleared before
writing (Winbond), while others don't specifically say that.

The original sequence doesn't seem to be following any manufacturers'
instructions. We just haven't run into any problems until this FORESEE
one.

>
> Overall I understand the problem, but I disagree with the fix. Could you
> propose something less impacting as hinted above?
>
> Thanks and sorry for the delay.
> Miqu=C3=A8l

--=20
Regards,
Chuanhong Guo
