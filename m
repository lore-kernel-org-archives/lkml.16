Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FF1EE031
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261864; cv=none; b=eeuUcqXw80ta0g1P4pK1NfNci66VaFOJyj1hF5qW5Mi8dUYV6Ciqy1iS38oM7KXDPkPyVMkuTJ5UXwnBmtH6mvVJzihxcKvhgOsMGh68DgXRkr3a8xyqbozWz59pE7WgPT5H9iL958p74EKYSVN3eLjGOKexhQGORhl4SJqRrvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261864; c=relaxed/simple;
	bh=Q0zCvI1z0jvCd3KJkPG9TzympkIumm2MHUng9J0pb+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfaxsysYHSuuKN2zGvAd9orxnk2Iwt1h4CYNo/OojQGRmlctMemvnhnyolBQIv5RC/bJk1cvVGOi1taaV/tkbC/KtuvOvMo+3umjZuY1gH6x/TXWfWlkZdmPeS+Fpn5bJaZIqG3rz4d3DRSjXz61bdzAfbu0mmwzU5G8aDlQLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIIjb2bX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIIjb2bX"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa1e25e337so6537981a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739261862; x=1739866662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdSSN9QdNBs8eEdHrDTlxqtSDnLAK0QjbdfY2BqTAsQ=;
        b=RIIjb2bXeCNGSNwcy0xho1c2uRhVDW0bERWje8jYcfffeKhqkdWeSWt8Uyb//DeuEb
         098vSRnpgSS3DDu2qeN50xF436YnKJKWeXX/K4aoltAUlQ6prp3vlv6MAYdOEVqGuyxv
         971btETlJro4LzMn3xNsmzC54H8FfSlfB1KLHrgD1w6wlM8g8305g5eAKSBqdNVaa6gl
         4661bIrBFs5/bZWihPtEl3LeELr43Pzc+av0fGDeCXEdbPoHsQ0plVX40SPZ+C9w9eKC
         VIgzMLm/g1XSiFCEFZPOCL/xyxObmHSBoeMgJ9aALSvQ+OXm85Dcf7Gl5PLQCgurd4aC
         vFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261862; x=1739866662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdSSN9QdNBs8eEdHrDTlxqtSDnLAK0QjbdfY2BqTAsQ=;
        b=fM205YX5HFsYwpKqI9sI5cLRZjRs6rmcrfp8WvnEebJhcULvA/5m5IHgaiHDmbdXTC
         fbCwII+E1I6BvcsQOmertebRKiPKox2KykqzO6aKotXYAej1eNlIJUgfxdP3PbW+9rsH
         xvwrpqQCy8kT6+8lrBOtYcesyTa3zet+iiRAXIsY8p+OZLq2EeemJS+GzvEMcR82jRr5
         EJmiTDW/Dygv+6WKWaAPaPL9No/vjGbP6tqxSq0pnx7FRcVzFd7HPUXv5TD+aF3WfmRc
         noQxVcFqiOWCTN1G4LthdOpOAgCes6fQaQGrnInlW9ATHzVNn5FrM4phf2kR/7XAPeYn
         F6bg==
X-Forwarded-Encrypted: i=1; AJvYcCV8+skYP+KnsnxbQJmgCF+iKMshUtKDwlg/jlpBBz8qseqmCam5uuIdz0wNwBioNRPgYeswHuN0GcV+k3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Con1asyNjAHgSBARKWNf3VFUcqnPcBFtxed+jtZ/8V7oZHZq
	fvgLNPTpfKF0wu9ogC4zEIGsNlih+cKUnwzn40m+sLwaQoHyERg6DxT2PJDbRi/lnlah6V7LBCy
	BupMvDQh+x2nL9KBMltpOf1yMsOs=
X-Gm-Gg: ASbGncvvd6a/hhbBkYsqme0h50HNb/R465hUZi9Cc3hO8/QnQ7ugBTIiAN6yPzB6zAb
	kb8Q4pD2dhK448uYWYJNvS1ksVq2YrHfUmeL/MAxza8Jz92Ixen3Vmv+XOpGYiqX8eDGVuhni
X-Google-Smtp-Source: AGHT+IHB7b6T1cEPsukDgawzfpT3y4WANIOfYvlFKXg8jqnneqHuIIRpHG6i6Ao4zutuAREPOypukRqUnjaQG9qIQsU=
X-Received: by 2002:a17:90b:38d2:b0:2ee:48bf:7dc3 with SMTP id
 98e67ed59e1d1-2fa241646afmr26941864a91.15.1739261862206; Tue, 11 Feb 2025
 00:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122065605.285145-1-linchengming884@gmail.com>
 <20250122065605.285145-2-linchengming884@gmail.com> <878qqj3sju.fsf@bootlin.com>
 <CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com> <87frkmt8nu.fsf@bootlin.com>
In-Reply-To: <87frkmt8nu.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 11 Feb 2025 16:13:32 +0800
X-Gm-Features: AWEUYZnQPGM-zFSvmWzAgGExzap-pa5ZcJ795qZ6jg4sRRk3MfEEdZQSlSWjS1E
Message-ID: <CAAyq3Sa9+FZGiGnBV=KbwVnQhWX-vc21CK75OXSnDDsE89mx1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

Miquel Raynal <miquel.raynal@bootlin.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=88=
10=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:07=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hello,
>
> >> > +                             ret =3D spinand->set_read_retry(spinan=
d, retry_mode);
> >> > +                             if (ret < 0) {
> >> > +                                     ecc_failed =3D true;
> >> > +                                     return ret;
> >>
> >> Shall we try to set the read_retry level to 0 upon:
> >>
> >>       if (ret < 0 && retry_mode > 1)
> >>
> >> ?
> >
> > If we set the read_retry level to 0 upon, and set_read_retry fails
> > when retry_mode equals to 1, it won't return an error. This could
> > potentially mask an underlying issue.
>
> Don't save the return value in this case? But otherwise you would leave
> the chip in a retry state, no?

However, if we set the read_retry level to 0 upon, the chip would still
remain in the retry state if set_read_retry fails.

I come up with a solution: setting the read_retry level to 0 right before
the read_retry label. This ensures that subsequent reads always start
from level 0, and it eliminates the need to reset the read_retry level at
the end.

>
> Thanks,
> Miqu=C3=A8l

Thanks,
Cheng Ming Lin
