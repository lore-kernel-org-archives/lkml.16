Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483A528DF0F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357392; cv=none; b=cImvj1zdVQFn8gmxR1/KMjJldQHU4AFRRoTwOUI3NVBhWuVXo0c1QYWd5I7K/RR7iDip0B6GMrubZ5KK+WrwpkNI/Fa6ksQVfP/Td0nVL0ikcU/OzylXth6esWqNB3u7nnjdu1htReht1NVdJhx12+XExVrATkdf4vAht3RZqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357392; c=relaxed/simple;
	bh=6EM7W6Px13BkrnxhIGCscRQju3/pLtXfaLISOGXj2DA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEXTrAielfuKFkF7b5cPPZFqRD1ZuHMvAclPpk8MaSK0V4KezpaSFWuekG3iRW6e7irbPqotT88OA8e5ziy6J1xrN2WGyxyvm7YA3K7PR2cKQeILn8b1KX2DXxP8oB/Ddk1GOuMdgDuZyO342TXEsv56kFhGUDotcX9QgXmF0aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fjPAo/pS; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fjPAo/pS"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31aecc78a3so185981a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750357389; x=1750962189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wn2R/tcCHSpRThGeyczBO7p55CHFgEwb59xkAN4huA=;
        b=fjPAo/pSOSRGjK4d985pyzt4e4r7fMh40FvjG3FlS8VINRnX9cqfMUEHh0KcZxBNaA
         EIQFzIIH53FXkCU/JfrJtCbRr6jhFAQdGXWrbsEoVP7dvIskTwroqlTXQCt3zNAx2fuP
         WUTItT0dzkosv+NhySf5kgLp5Lc9w75Gts3VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750357389; x=1750962189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wn2R/tcCHSpRThGeyczBO7p55CHFgEwb59xkAN4huA=;
        b=q0Nd5MQQQIKeODp8CW0kUS4dqIcpAE4vPtVR91WCLu2TWGCt8yax2Jpb6f6YR/v7g2
         2zqPSxOZj7GtpSoJ0YTMNa+giVEMQPnT5bwym6Qu8UjNW4hxbosu6+cVHM00CVONKCRJ
         zBAr/zpnpDPpM3NiDkVJXYWhTeFc9U9nE11tdBU8sMRV4Bs/r7gtC+//5g3kJ//sItfs
         ZJT1P7QnjUCnsIIXWAz+Q0cwAyEMZJ1ldk9TQ5R+qmH8yY9FjIo63xl10aSDCJpR6wUz
         +8Q34jZF8KZI8DyCqiXmPFd0MnnsmuXcLtbg2ANrQ+XEZNl5WqkA/ZhI5rQSCuUhgd83
         f98A==
X-Forwarded-Encrypted: i=1; AJvYcCVUaHi488Teq2Ms/hjFok1nOEDT3dE8Lhe2Xy0PkOX57QbIjVHLf9iKjvwp7nrsq2NQ4L9tm9v97bXy9Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJwYK3nP9zCZUE0QNGWU6Im822BV+E0n3mNudtKZeIz5kPagr
	w/J2FWi8A+rvuq3KHY5Yegwb70UwBU1nJK14pqfD0oLQR+FtB/GNPBbA3uSRB1/+TGqHhM0xgdM
	mc80RnxwCKuzdE1Pyp8YgQta929tTN6K3qJmPYib4
X-Gm-Gg: ASbGncvy680MjMgiLfPClTusfakXCJ6PfsoAAcZBV7XAP1Vvl+FEupClSBTp+Hxe5JQ
	OjshDyvYW8uD7/crRNUvNOiao2tn9CXV0Ns7xtufMnc1pn6+0OFXc0Kmk2Ve0YVC6+VTpV2ZdNi
	u0Oldwt4SuNDCD4i3Ko/IK3HhnrfeUnWuobsRG4SCY2foQrUy6n4Xw0Q==
X-Google-Smtp-Source: AGHT+IFSj1i5cMc91WlmDpNumVdtdb8Ld/9OiYqe+qTePMX50c4RyMW+w6PNGPiUCp7f20XynJdqwZhRDrpoEUBp4ag=
X-Received: by 2002:a17:90b:57ee:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-3159d8c6488mr131664a91.3.1750357389545; Thu, 19 Jun 2025
 11:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606165756.1531164-1-dregan@broadcom.com> <8734c9z2ye.fsf@bootlin.com>
 <CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com> <87h60dmn86.fsf@bootlin.com>
In-Reply-To: <87h60dmn86.fsf@bootlin.com>
From: David Regan <dregan@broadcom.com>
Date: Thu, 19 Jun 2025 11:23:03 -0700
X-Gm-Features: Ac12FXwY4L3iGAb6y8Z7xuuGcl1xTOk1NYTk9evRoC8IYcMVu9a22ogFJ9qGxfY
Message-ID: <CAA_RMS5a4kB0=P+XSS_-zL+KmP2YqSSQghb=c6UvvxQg16FiQw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Regan <dregan@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, 
	Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu@gmail.com, dregan@mail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi   Miqu=C3=A8l,

On Wed, Jun 18, 2025 at 2:07=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hello David

...

> So far the reporting looks good (and the nandflipbits output looks
> correct as well).
>
> > [  676.408441] mtd_nandbiterrs: Inserted biterror @ 2/5
> > [  676.413411] mtd_nandbiterrs: rewrite page
> > [  676.418122] mtd_nandbiterrs: read_page
> > [  676.422267] mtd_nandbiterrs: verify_page
> > [  676.426194] mtd_nandbiterrs: Error: page offset 0, expected 25, got =
00
> > [  676.432727] mtd_nandbiterrs: Error: page offset 1, expected a5, got =
00
> > [  676.439260] mtd_nandbiterrs: Error: page offset 2, expected 65, got =
05
> > [  676.445868] mtd_nandbiterrs: ECC failure, read data is incorrect
> > despite read success
>
> Here however there is something wrong. We do expect a read failure,
> instead of returning wrong data. There is still a problem, I do not know
> if this problem was there before though, but this must be fixed.
>

Thank you for highlighting this issue, I will investigate.

>
> Hello Florian, if you have time, I'd welcome you opinion on this patch :)
>
> Cheers,
> Miqu=C3=A8l

Thanks!

-Dave
