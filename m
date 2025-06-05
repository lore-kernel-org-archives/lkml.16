Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019081BEF7E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088282; cv=none; b=Vf2eJS+WEt11ZLtQfzkrOJYaF2CJ2SNpolh+l+OhWP+h5YaB/VUe30ZGvSljpRXYFR8aSDZMmmen2BV867J5D6RJCE98PruV4F5SPSU3rULso2wyQE3pHAsAD5yWzkVu0Sv8lbpaBFKQkJOaAKBYIXD4wd56FNcDx7Ljlw2eJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088282; c=relaxed/simple;
	bh=Yi8DF512UCzmVxdqiiVnhqdNBf7mr98slXO/xgZ3GEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLgioCaN/638hzcOZjc+TgSKimjW1lgVI3wJOmAjH4x8Uku7X2Oduo7pUirCptCNezff2JM72896GCIdOXq2/MvAXtvS3Uzz/omUaGdeak6nGbijz38AEku8z7/6kC8guhYNHlZnUDvczCZo2hwUNmRKNHXN2OjT7thMHP/DPIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WnBSKAgY; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WnBSKAgY"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26e6c551f8so49581a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 18:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749088278; x=1749693078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi8DF512UCzmVxdqiiVnhqdNBf7mr98slXO/xgZ3GEA=;
        b=WnBSKAgYo/icmBVCMNxIlvpqMKS4/z3Bdu7oDjcTEqnLRJ3Q0MeyidTt64YzJ6Q+QX
         cg7Avxwg17JMYq9suu298rpED4H9nLwNdKf1YfBYVON4+lBPQZjGe/gMbNbdtQG0H8FV
         EMI7ngtrH2Ms/7d27Zy3rNl8NuJQ9G30E60DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088278; x=1749693078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yi8DF512UCzmVxdqiiVnhqdNBf7mr98slXO/xgZ3GEA=;
        b=FiaTyplwVgcbRTkSzSAccJu8QZA/cDeUd3M1Z4HxPiVZL6R4wyQs6jbrIOJz77kjoq
         vccOnYIjWnanO6Od7rNMK6DJuHLx6UWLEoOnyRmEa9AB97JeIaHoO4t5tzhz5eYD/j0h
         ctUsZw8UWdIFD87fE0bB7wnhr15WL/tO/Ix17rAnBYuQbFFpI7ypqUFn13WqbwzDS2bT
         c+NudMatWlxeC/d4WJsd/zisJoplwwaA3e5M4czN2qGRUMXZ35/OzbIK5f4Q/c+2i/YB
         yuIXpSyDULY+9hBvWmNxIwFZJZ9RVj1HMz3AmeIZ5alKKQEJEVEgpsGaERljQhRsP87P
         gM5A==
X-Forwarded-Encrypted: i=1; AJvYcCXL73Pcyx1V86W+Uj5CP9Ks1RUbd2TYz/ShmmWcXgQt59lJ/06aFMeIQhnjElqfwHA2daHwpvCeGdPa9qA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+MPTub0zaJM7IvoArw7ZK4A1xQNcbUFb6hcvEsEUvW/VSmtP
	q+0R8V8Sf4AsCRWbUUCcV+LNN4rRGttVuwG87jx/9PLZmTGKoYVDZYmU23quDRwYlx3hbpQeztX
	v2n1vOOmArjjWbA3hjlCcSM/iabkEYWVqxHRTl/qe
X-Gm-Gg: ASbGncst91gjerURsETYZP1sAyZBDXPTpqvxHEXghXqNUEPkKUO3sY2lbpfNL3BTmxH
	fBsjzeSdsU0yQNf4g1slYHWQWYRff0op4DKTnrAkbP6XnZob9uENJSfBzuTnoSLfP1F5AJNEn+4
	p2bfwOCMuLt6BnqVABMVoahOPUPsO85r6vgA==
X-Google-Smtp-Source: AGHT+IEaFKpjsWFeskLAEGV0N1RudoEjQsia03gkWWg1f3quBLAvO5IT5KWoJHnonAXrBHF0+OjfG5W1pzvZPIDQF9A=
X-Received: by 2002:a17:90b:180c:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-3130cd7eab2mr2600137a91.7.1749088278026; Wed, 04 Jun 2025
 18:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530034713.4165309-1-dregan@broadcom.com> <87ecw2ns3s.fsf@bootlin.com>
In-Reply-To: <87ecw2ns3s.fsf@bootlin.com>
From: David Regan <dregan@broadcom.com>
Date: Wed, 4 Jun 2025 18:51:06 -0700
X-Gm-Features: AX0GCFtC8Agsi1wpjEZkyB90by2xTmeQg1m7afAny8GVFx1QEwwSpixj_fSsOh0
Message-ID: <CAA_RMS52nYO=XqQH9VkCDTC=OrrCLSAcXXeR41qCKNNVLzzi5g@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
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

Hi Miqu=C3=A8l,

On Mon, Jun 2, 2025 at 7:19=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 29/05/2025 at 20:46:59 -07, David Regan <dregan@broadcom.com> wrote:
>
> > Currently we attempt to get the amount of flipped bits from a hardware
> > location which is reset on every subpage. Instead obtain total flipped
> > bits stat from hardware accumulator. In addition identify the correct
> > maximum subpage corrected bits.
>
> This change does not feel correct. We gather two statistics:
> - the maximum number of bitflips corrected in a single ECC chunk
> - the total number of bitflips among the whole page
>
> The most important one is the former, because it may trigger wear
> levelling from the top layer (UBI, usually). It feels like you are
> breaking this, am I wrong? Would you mind to be more explicit otherwise?

Detecting the maximum number of bitflips corrected in a single subpage
(ECC chunk) doesn't work correctly, however the code will still
trigger an EUCLEAN since we return max(mtd->bitflip_threshold,
corrected) . My fix is to accurately report the maximum number of bit
flips per subpage, in addition to counting the total bit flips per
whole page to update the mtd corrected bits stat.

>
> Thanks,
> Miqu=C3=A8l

-Dave
