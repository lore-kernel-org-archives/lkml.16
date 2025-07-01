Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1368915AF6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393061; cv=none; b=niCC5DxQsfud+NUQWLAkTzvKC+BQ7Sz+9g9j4EqqSgR3mKiEJWN2LXgE+/Z5EYGeNTBLToTlwsgnswa092ZG2NMaY1CyfJxlcM/np+2V/O3BGrHJKLkCSxkZ2HnPU0XigPJwvD7RuxIKOXI4VV4nMU5t813G5bDFW3tRg4NIgUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393061; c=relaxed/simple;
	bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1T05rR1bWm3e4o4g5O6SJib75GmLhwSyNr+lEcs6cY19qPJFbCWf3pl9MqQxy+044Ay6mABmAuEyLkOu4J6IEro1cCaaXOw3oVFbJGusYRkBIA8e9l8ryvqa0iNjTdPDNX2fAVGQNDSDjjGwRLgA6VxtrGtCh5B0JQ8TBELZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hifiphile.com; spf=none smtp.mailfrom=hifiphile.com; dkim=pass (2048-bit key) header.d=hifiphile-com.20230601.gappssmtp.com header.i=@hifiphile-com.20230601.gappssmtp.com header.b=Y7ur8Iws; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hifiphile.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hifiphile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hifiphile-com.20230601.gappssmtp.com header.i=@hifiphile-com.20230601.gappssmtp.com header.b="Y7ur8Iws"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32cd0dfbdb8so32166481fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1751393058; x=1751997858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=;
        b=Y7ur8Iwsh9eowUbuIxPYK/8yWU5SpCGDbfKqclT33xn7tf4kEFf5vDBng7SeWTxHwd
         t3xq4vfmnHkRbPZEFPkTGJayvIGgKtZG2FwlQz9rAH+qup7pV+GHnN1MF2bkiVqsDeOz
         ja8R9xOVjqT7yjK4ykr05F1SqE1av//NHEtjym8UJTd6JON6w+vwFx1I7ikP/+sqjl9k
         vM0+LCKtdZS7cTBxgHokyHMSVYH1MlQeeW2hE699qfMakTtCWoUYkW/9CWL5PUreriyF
         4h2unPNZTGHSoSynIwbKGRs3DvJ000t384cfpXUgN9nHKGvB86IY6HqSuVej3xtxvXc9
         UXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393058; x=1751997858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=;
        b=XFmvniwD4KrwM7nsH95uRC4gZnNRTVA0V8LUZNQ1zDdu2CZyZk2FXjCu7uoEkU3i5B
         1dZcrmqyWr7E3tCG8EF98VQ18RMjl0B04iUUl5eXP+wKIirdVXddKmQMKUns/K23BniG
         /gRX2EGhqPGmZ1PnQbPuBgDE65GYucn1ofbcUKBetriUlvk065Gr8aIS/41H+6y/AevF
         ls1JscnfBBc6JBBcuNWrNY6QQpSj6IAZJ4XHc7l+ARvtEfpWWGsuhyDyMtcUEuomusx/
         5ux/2h6f+8K5MwezrHGvQ+yQOm1wvHM+lq2zU+U+HgXUWTv0M5fCYfqtgpL5dNv1W42q
         Dc+A==
X-Forwarded-Encrypted: i=1; AJvYcCVd0BLfiw9DfbJJjATB+9U2pylSW6zphAqK6FabiokNS95kGOxd3CaAYp23d0d5rgBMYDJBdgoL2yMerhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOv6EF/acaKWqt8uMw1AKOxyFOcwRN4U/8FaYijSBzlULs2p0P
	1hfddKXHFKRA5FGr+4WRdnxsGDpt3YAjtKizdvuH1goBdx7Pt5qyNs1Xz+g8cXaU6zpI1zTE1xy
	xXaF5gaddpA1wlRUe0VMoxWcLOGlUx6Qr9h75MupxEQ==
X-Gm-Gg: ASbGncuqpmWER+dvhbirr9+hIMoIAL3eWvljcqf8LBReBrUSFdMXYK74xsW7Ao9L8WE
	s5ijf2ZA6hSgnjmwcEbnNdNrOgCceukjz4UdM+9EJiVqcaf7CSF70eZcP69Ovc4rr8D1uv20ysD
	StmtQsQhI9lo3ldr8WS5UtVb1kRGgy9u6qK7xZtKa4Xon5Rr2oVti5c4euJThWIrArLIJBOExvm
	5vj9w==
X-Google-Smtp-Source: AGHT+IE6y9R8uLja1br0fCyfzE0jDMNUQXyj9K5jFieZgPvJ9HnnxDlqVbdU3xGPBSrKWNmGMVpDlPgjkWqfN3nYZzk=
X-Received: by 2002:a05:651c:41d4:b0:32b:9e00:1237 with SMTP id
 38308e7fff4ca-32e00075d6amr326841fa.32.1751393057890; Tue, 01 Jul 2025
 11:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
 <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
In-Reply-To: <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
From: Zixun LI <admin@hifiphile.com>
Date: Tue, 1 Jul 2025 20:04:06 +0200
X-Gm-Features: Ac12FXzHRMRJLOOItsRIrxYGyHt7wf3A5-pMjsV73wxTRtwvTIExDU1XymzmqNg
Message-ID: <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"SoC support'" <linux-arm-kernel@lists.infradead.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 5:49=E2=80=AFPM Ada Couprie Diaz <ada.coupriediaz@ar=
m.com> wrote:
>
> Hi,
>
> I've written a small patch below that I think should fix the issue, but a=
gain
> I don't know if that's upstreamable as-is.
>
> > Best regards,
> > Zixun LI
> >
> > [1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613=
dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
> > [2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a89=
3e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772
> >
> Hopefully that can help !
> Best regards,
> Ada
>

Hi Ada,
Thank you for looking into this. Internally I've written the same patch as
yours and it works fine.

What's more interesting is the issue happens depending on chip individual
difference or aging. Among 3 chips tested, two with date code of 1933 and
one with 2223. The 1st one has many ECC errors as in the mail, 2nd one
has less errors, while the 3rd one passed the nandtest without error.
Maybe that's why this issue is overlooked.

Best regards,
Zixun LI
