Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226C42048
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739155842; cv=none; b=COa6/0cIxMpnrbA5fxZS1oDmSMpTQDVMtJ2T1JB+i0/A7b5nyCEaHByGm032bqzARTY7LdVm8+snl6ZbuNr3PLvW2gRHNAeG4+Xgy3cQHm8VCp8z7nD53rZEEaGNAz66L/76wffVQzJUtIS7BKytYFswMXwDnjgVB58Q0uLnc0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739155842; c=relaxed/simple;
	bh=5OqSdtmDsKRZhOFOHmici/zst75pXvFmaCU+2XsEgTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+098UJ7czyw7Lz2Is1l/cwuFbkL7s8QGfTVgU8XQJqV4RjCsusMiceFIgJVW5Ur7pLhGAYiyj/i/ApSWyXz1drJH1BmvQ719ns6btptrOdnH1QP2+d58BqDPmR56rS/CKMC6LaeCVnrWqMhDleCaddNadQt62HVPEuLaAGip9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5qOzRTT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5qOzRTT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f0444b478so54443165ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 18:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739155840; x=1739760640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCn7t+K1U3n4uOM/x7emrxEaBDWkk+oxjf8WC+Yk7bQ=;
        b=T5qOzRTTr+DOq9CZ2x8oY+r8dNu/bKACjQyJOJNC1z8DmPHaPAUnlvvpR20YH05Wc6
         g+2O788CDzI23f45EKaUv5D5SpLp1G4o0tUwywtiAiypPzMDKYAqkZ9q+wHyTHMeYdtQ
         pdyVVQP3wSaIRyDpogV8x13pcbYCdyZYoZ7ZQFq7YosHqTiXCwsSp43nsWHRpdJYkVdY
         pwLUjmi+cTkv4uFFXP6UdG4vvQdhtUE9wUSILiA57L7JqUE5Wk3WopoACVtIcWirDDqr
         OoLXPIEx6FqRNEC0Cb5IImB1lvNkVDjiTicYoLYjBwoElznbuiu/fPgUnKFnMU3W6MOq
         CtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739155840; x=1739760640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCn7t+K1U3n4uOM/x7emrxEaBDWkk+oxjf8WC+Yk7bQ=;
        b=AmVcnGHiuVAhp4Si1tfO+40IlqsmdQBmxNWKaCwMkzI1o0hyUSZZSIObOrOCoIXIFr
         ddyaPfBwR3PSW7poD6kSkALhNfqcGoeXTSl6Hrx529Gu6JYoFVZ7moaPkg+nNgKGXsIb
         Apog1ot7+dcV8ETFn9jk3HfvQLQ5l7yuoM/twnvXh4MkAt/ebveAwu1XgzkoWmpmfVxe
         MIiR9KgZPymhYwSZzjZNrEEujGe6YB4mboArDTrhGNrDzJwEhA1g5Eg7EVn4TjTa2wcd
         10WwF3Y1A7q8Duunr8ejriagz9DlTSY+vQP61Ryb6cWqZz4ECM/gWF9/MIs2InJY5SLc
         TWHA==
X-Forwarded-Encrypted: i=1; AJvYcCXtzFRNjbAV0ht5cjhoVA9mqQLl+hl+TBslbN4dBhoLkHtt5yxK0xsquDtAn/MHeASeX50zvaShktEifrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqx3/hMjI5cbquC004Eu9Hlscb8JirjvhB6ImHfe2JQ3WfiMyg
	8iYOLG7A2GdTQmJL8tCUhYQqdcx16R2QzmLKqTxFnekHTXdWhEyfXppc9VE0nSfOzIkmb622hG9
	YhKPiGPLrApbXIxmNlY4DG5Tzfvk=
X-Gm-Gg: ASbGnctcINRF8CUbiXvCbDcglQR7Pcs8sRbHEFNzcT1yfiVzDHGR0q23+WJlP71Q387
	O17xMwXdBqa88/dHw8K0C5pheTicLu4DwdYZFHfaoht38AC0iGoS/t/wBRJTS4BIBoeoqayWR
X-Google-Smtp-Source: AGHT+IEgXij4R24JRSThKYkKqbCQ7OkMggSfd9GXnvuwEm/Ffiyzp+cnvCiadhFNuK7pCtuOCyozDn5bSj2B15crrNg=
X-Received: by 2002:a17:902:ecc9:b0:215:9379:4650 with SMTP id
 d9443c01a7336-21f4e7596d3mr190576365ad.42.1739155840112; Sun, 09 Feb 2025
 18:50:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122065605.285145-1-linchengming884@gmail.com>
 <20250122065605.285145-3-linchengming884@gmail.com> <87pljv3st9.fsf@bootlin.com>
In-Reply-To: <87pljv3st9.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 10:46:31 +0800
X-Gm-Features: AWEUYZkdaxqmpCxih6PIQDxAt0S7tCGB_aE9jpN72ZcPk1pW_rnucJcJgUK-KtQ
Message-ID: <CAAyq3SZKS8+Bzh+bdbkrFffCPo8Z7Zf_9O7oit98HmdzJC7qVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nand: macronix: Add support for read retry
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

Miquel Raynal <miquel.raynal@bootlin.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=88=
7=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:07=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hello,
>
> On 22/01/2025 at 14:56:05 +08, Cheng Ming Lin <linchengming884@gmail.com>=
 wrote:
>
> > @@ -377,7 +424,9 @@ static const struct spinand_info macronix_spinand_t=
able[] =3D {
> >                    SPINAND_HAS_QE_BIT,
> >                    SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
> >                                    macronix_ecc_get_status),
> > -                  SPINAND_CONT_READ(macronix_set_cont_read)),
> > +                  SPINAND_CONT_READ(macronix_set_cont_read)
>
> I think there is a missing coma here and everywhere else where there is
> continuous read support?

Thank you for pointing this out. I will correct the missing comma in this
instance and also review other areas with continuous read support to
ensure consistency.

>
> > +                  SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
> > +                                     macronix_set_read_retry)),
> >       SPINAND_INFO("MX35UF1GE4AC",
> >                    SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92,=
 0x01),
> >                    NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
>
> Thanks,
> Miqu=C3=A8l

Thanks,
Cheng Ming Lin
