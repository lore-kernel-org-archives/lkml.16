Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CBA21CA00
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459802; cv=none; b=qcqTDTyh2M9Y4DAX2VZT7CXo5iN2/qzkFf1hxGi/ekLlBGsCHCDRIYnn4fyIUtE7USjVDtDauGEzIGzU4Mj5/2l2yhu5oYAUabAsCE40XVGch83KYSxuIAkAYoJrg3Fumi2ynVsoWw2L67+O6rP+ToA5quUoV1GZvsfImgAiWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459802; c=relaxed/simple;
	bh=4PgTmaMk5ogvFcIREugLBrsHV37djLsMSD7buWsbe98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPvPdTf4j4SEpE2WQGEGZSxLHgEAf1Aftpp/R5AQqQFda1arNE7Kyx8G/1u8OfedsRSlHFKF+G1b+LjIENED1MEG7ii4WQsnD7tS3g7Wg7v1Dcov5poHCkeNCq53dEivoaHTYhW7J3J0Lqdkg+WxGnSEg9uOCD5zAmqP/ZnSupU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dUBxx51s; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dUBxx51s"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25520a289so828101066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743459798; x=1744064598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PgTmaMk5ogvFcIREugLBrsHV37djLsMSD7buWsbe98=;
        b=dUBxx51sYO8jjWrYYxpmQqh/UTVmB45bSyxrkhrmCLG1dfI5o/iki1sOkL/MzFDAnj
         MsCRfICv+uB/wNAAiJxG5MgNLypwJLG8ZSG/kVNLcXXMa0AUIr6LbGVR2TgR/5Vc22n5
         6QcwfntF8635wDFnIrIiDs3YgRcop45BiLP5JT747K7akcD7tEII5RBnKQUtGa5zVt9V
         EJKiftlggThP1pPo/zwkkJ4ox1nLgN9l7sNbZ6p0kEtnXUvmiq3MhDe+7Btxk4rp253H
         MJV+DEe+00YN7aYhtHDmc1XE3C8xIEu6loBzXkEtNUFfplEpRJYz30iMLFuAMtIAz1M9
         DL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743459798; x=1744064598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PgTmaMk5ogvFcIREugLBrsHV37djLsMSD7buWsbe98=;
        b=n/h2rAySFvE9Mg3u+75n3vvp+GBJt4u3g/nV21HFtZKCMBvjUvykikQ1ZXfXMJe21s
         Qh8ieUApQrHfCe42Tw/YnnNbc3GjvDqwpSJmDFIPfmB9pnWBwjl0yYIQU/Sr1gf8CAtO
         Gi/F6LXKRq7VRmOV6QRWXJtzoZze+FSXVNRsfqiopYhfU2v2ovKYpE85PFtWXouF7QxI
         L6O3DhHuSxAbQYphThkIQn0Y6Mm58aSO248W54Mk4O0HDLNBZzgFUSnelJqpS+SUnSfB
         2r1aF0frfW4DtVZpr1P0iDuIKVsGQPfILh/6GJpYbBG3Ed8XlZTuQOuk+p22HOrn+9cr
         HBLg==
X-Forwarded-Encrypted: i=1; AJvYcCXENI6mPcBHPitraQZTX/YnXzLoyl3f1xqpQI4oX6lA0ZA4Etk9AalrHMLahboqgsVL0+6VWOBPZFgpP5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHsq3vx0L5KuImLID+9FQkgg5FGILe9nRwdk2bgknNn5IqsU2
	IUsfuGk2IZDT+nq17HhP1+qUIlbdUNVyCrObspUAqt5hkKCAyA1gZnlkCSD4E3HEjlpQ1bT0Ala
	Ev7u0tBeFbAUefG/UZy+AEWeI/4ja+ABwJTF6
X-Gm-Gg: ASbGncv0wJnTjX4CFz+uCYr1LYJR3JYjjfsR5PTG9lhJzvFjhSoIqCIpEy02YjJO/jM
	FlWrb7EFeIdjzyvYiO8m3ASxw86meTLoZ8HxVT7wboBqWxjVjMBqhWQICPLQOG6HeV567HE4cAj
	5lCIagbgR9GeKYPHaD8Nredt/2NejQlT8o2V8=
X-Google-Smtp-Source: AGHT+IFHMx1yE7gHW582wXMuvOh7tHgTZivr88kXV0aPgVkLgrM9yfWRJOM2hQFiPDsaHWm4esXlGziN0BjlWvQIYQc=
X-Received: by 2002:a17:907:2cc6:b0:ac3:9587:f2a1 with SMTP id
 a640c23a62f3a-ac7389d8dfemr885055566b.20.1743459797781; Mon, 31 Mar 2025
 15:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331103900.92701-1-sgarzare@redhat.com> <20250331103900.92701-4-sgarzare@redhat.com>
 <Z-rSMi2uCvShLbLS@kernel.org> <CAAH4kHY-Orjr_+rcYNemuWrAOOtyrCMD5s6KsOrkX740AARXiA@mail.gmail.com>
 <02190762dd82104070ff1a2942a7be703f4ff53d.camel@HansenPartnership.com>
In-Reply-To: <02190762dd82104070ff1a2942a7be703f4ff53d.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 31 Mar 2025 15:23:05 -0700
X-Gm-Features: AQ5f1JqX-yW5Je-QNs6buiWjeJcb2hXA7Vjgj8fcMn8wzx6HtqYBhlJtZrCDaIw
Message-ID: <CAAH4kHYwDgnYsMhJ8zZWn1uU4tqqnSXOLKEJNMb-3OCNrM7Z9A@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] tpm: add SNP SVSM vTPM driver
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, 
	Peter Huewe <peterhuewe@gmx.de>, Ingo Molnar <mingo@redhat.com>, linux-coco@lists.linux.dev, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <jroedel@suse.de>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 2:26=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2025-03-31 at 13:56 -0700, Dionna Amalie Glaze wrote:
> [...]
> > I might be unclear on how I should be testing this, but I do see
> > /dev/tpm0 and /dev/tpmrm0 when I build with CONFIG_TCG_SVSM=3Dy, but I
> > don't see the event log in securityfs. What am I missing?
>
> The vtpm driver for EDK2/OVMF I suspect ... without that the UEFI won't
> lay down and event log for the kernel to pick up.

This test is with Oliver's PR https://github.com/tianocore/edk2/pull/6527

>
> Regards,
>
> James
>
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
