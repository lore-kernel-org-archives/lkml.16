Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0936D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749190441; cv=none; b=qFXZvjCAJc+Q2OS5xotlDqWDFfILEePGllKojlwAyUB5QwIQWQqs/+yuMXQ6MiwLmxXIZGEQoHCltA1/le01hAFv8VQ47V6CZzMExfZHXxQM13SMd6pdt/PQB12DSis9+BvFHVymo3lSLr6Ag9maHQR4/Cw4pnZYm+gtKxPlUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749190441; c=relaxed/simple;
	bh=mqhpIX6RuR2e3+thVNhQsjZ7iiSbuOYACWKLV6nxHUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F79NsFz5OzRfdDyVSIGETiee4gt+jImwKVEMN+WxAHwtnVFO+WbjNjPq9Iwmn+NsiMSJaJpWl3B9zRZo3e/U0XH46iISCG7TVn5xA8LXomPdbjz8WbNlXiREddf9S5pFAkWEUkO4RsIWUJ3jXI2NafLv11CjMUw4cXM3P0sJNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWn+ongN; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWn+ongN"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32a5eb73ad4so14515521fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 23:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749190438; x=1749795238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpNZQt/Jk1dMkxnOVifTe5GqH7KTqYcyMCJD3GdCfiQ=;
        b=YWn+ongNEKHFvPqDoKSNLQ+i5EoAQJ1+n13cVkVBbhoU8St7qVv8S2Ehk6bT4qmRhi
         oyj0UOPTSCzHTS/ZFg5ESHcV9uHFetKOnmrPsgXFGCAbaiCAQlHRkjIXCXwwF0oSP7Sm
         sZjUpr++/OGxCdPVTO6CGepw7P6sYbg1SZ6as7rHZPkepMCtZd+WRpfOmtklWarEAWRa
         73M1gEPAnOFTjW0A6cSNp3G2vteRANV1z/2oVF0jMTTK3vF8Z/S5XyswnacW+uYi7ZW6
         tfBscPYbaq84NB4Svd8rsYFSuGoMzmjrxE/pKKDFZGBo7/j4IspReynWvBaKzh+Aj3m6
         Uy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749190438; x=1749795238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpNZQt/Jk1dMkxnOVifTe5GqH7KTqYcyMCJD3GdCfiQ=;
        b=MHNLpwnP1b2ewz0h5G/y85kLjORLVsUdv1MZIT+sQRN34t8tZGqr6z2teb2piBNkTn
         J3jmPb2dyo1fzRd4VRAXF0xbkDLFXm0nycgR03XgXiulRTVWjFpRIRBshA8T8mTGiJ4H
         9jNJt+Kjq0akXhjyn3HXOS/anBuxFTepUlLKtAtIkUI9zs/GTGSo7DykK3Xtey7TywPl
         oHn7vYZaPhGuzAg5bybaNzwbqSi4VVirLUWe+gb6k7ZxqripZ72w0AXGJ0nsJn0Ffvza
         spiOZSbpN4Dxw9FIICljIbFK1YbG/CQBFFXOnJTmskwppXbR8djaKj94iXlGaazqV+oC
         yXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUQrAvX81M2VoytWvv0UGgXfBQeEGoFVBw4CtIX5gVPhoGZUYQLmTeEhkfTHt72RxW0283FMTic59Y0AE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DXCmLrbuCP3vljS6c716gDmO08aXY0ZPr97h/L6Wmvb0Bt4/
	jPCndesrpDzYKxi8Ef/ZAJ6zwZVdgVYURtnbtKtHLLTxZS+KDi33jbihihtrW55SCZKGt/KNMBD
	sdbKJj8LwVROGizi1MBH8NIF9NujYL6U=
X-Gm-Gg: ASbGnctgvbpC373hC0i6F8b23aY8AzKSrKux+31RjP5xHQ7lzUJokQkfaYsHcxJjgix
	flNHoJ4ZrAv2iCV6NEU4snAeXILzQqyAhA987PX0WELHa8RH9Zq/sV3x7nU+W7Qk15htlhWUDZ5
	FjQniH7R2KbBR/cKzzV4wi+YzvFo78PJvP
X-Google-Smtp-Source: AGHT+IHtyAA75K0NgEjgRbDcsqE4SXagGOb8xzzlF3VJGOkTbh1v4g11tN0y9l0THW1J9PBFK/bF/H1Dh4p76kdd75k=
X-Received: by 2002:a05:651c:1989:b0:32a:62a2:f73e with SMTP id
 38308e7fff4ca-32adfbbe389mr5005261fa.4.1749190437684; Thu, 05 Jun 2025
 23:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
In-Reply-To: <20250605190054.GH30486@noisy.programming.kicks-ass.net>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 6 Jun 2025 08:13:46 +0200
X-Gm-Features: AX0GCFvpYd8kzCzsE_bJGrCUIOVfM5HdcONbpcfdkPDh9SLLBtH4pKiPicYESV4
Message-ID: <CAFULd4b1dQO3biWvRoHfpyE-Bot0urmWDzxfO0dEverzuQOpdA@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, torvalds@linux-foundation.org, mingo@redhat.com, 
	x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> > gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
> > comes with a significant penalty on CPUs without the respective fast
> > short ops bits (FSRM/FSRS).
>
> I don't suppose there's a magic compiler toggle to make it emit prefix
> padded 'rep movs'/'rep stos' variants such that they are 5 bytes each,
> right?
>
> Something like:
>
>    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)

This won't fly, because gas complains:

z.s: Assembler messages:
z.s:1: Error: same type of prefix used twice

Uros.
