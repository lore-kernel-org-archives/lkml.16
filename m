Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8482F4311
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728522; cv=none; b=RW5URQ3SiGjwR911zM83VNC/FHMvjUqKT7/qcWg2G6TzFu5x5RgOKm4E/MAJTz8hlfe0NMwae0RjJ9xBZs+32/dcvSkAXFqnrDIzdHogmSZDc1XdzJNYceRauvKpV/X4DwFJOV5pijSh+J9kEJr3TXvCrFRYtKX7rb8zWcXivVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728522; c=relaxed/simple;
	bh=JO2jjm9qYOdw2JshMb5OsK/0Q8ZwDMtKa89tdDngYdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ju565ysoLoiOiV5GNjXe+VEozkddhpdMFHQobiwuaYJvcrLYszprooctmHKvBaFS1qeLJq2QRk5NN0Je859sgnWbuY5/bToaYvEMREu46fajRPwLU1shDxVZRQKZFroSr/8cvLKuAO5TBGKUOdpCtM0Aj3LTZ/7LS70jpwvZ2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHSBmUJR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHSBmUJR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso659057a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749728520; x=1750333320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQiLIawa1V32qoLRiAiNhsJ7EGIPTtQuUgMBaxbGSIw=;
        b=JHSBmUJR0+k/HmI2OvFbJYYjsR809vHN66Xce/YQ//folTPgOm+1hm9SJl19TyWGwa
         yJXcKnAA+ZV9sp+rPFBTUNOM2/GnrQYijux90sNb0N6EcTpKyAvrKCJ+FL6w2+O/dnDI
         1MuIAUA5UnsAo74kh+q4FiEn4G31DPIfSbjkbXHxxEIAO0PKRsOewPzwGG7pAqckv3H2
         kvgNcuRNNIoXQWeBxSGajouOJ7BP90QIObl7AWMLX8mRlOXVhsk8ZDkGs1NJnew1rVvN
         F2Fs7KKUXNBDFp4TckfVeVVdGC1H6hhh2AfsvV3My5toIxWz8gZ6Z+2LetkCPQpYScwa
         2o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728520; x=1750333320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQiLIawa1V32qoLRiAiNhsJ7EGIPTtQuUgMBaxbGSIw=;
        b=fokdrJelKFCbzhtneK3qr3FWHrbjIemsQy8if70cQEJuhUNVTdyxKe+7dfMV+kcXCW
         lY5CQoPE57cnxau8LK+7gU2w0XBpcR0Ss+jQ+IzUhCx+I2SlmY0bhdzji5lmECJYTWuC
         PTQxsL14DsKX9YVo61tLEWHNl9Lg59K+OK9KV4z+L9uWusDxrWlEkBN9TO3dDWLY5EtA
         8jZv63wLUhppodPUCRdo1P3/ieG0vZgbcoF7qip9zEhUwz55FFRcoy4K4AiEOZxGIGWX
         S0xHSURocL36QxBrxGvbkbldSeWBXI3HQ2Yh5ZIASMZsbaHHHdg4NVd/ll7bYF3PgPuY
         Bsmw==
X-Gm-Message-State: AOJu0Yz66AwUXz4lf5pdBOBOSO+XJrFQw/TjejBa8fKUC9MKUJQz1pH5
	7qdO/2hh9P4DWNeRq8vmD/PY7Uj7wj/4EpbORo6jOApA8VyEDJr5k424pN9LgzBrZMOHBesRX0o
	LPfehtZFA2kQF0LKrz/YyQxjpgiUP41Q=
X-Gm-Gg: ASbGncvKEAnf78hBlkvaxsN+AGGpr5NCDMWIQ0QttOby5atd8oLeBN3QI+zccv7Yl5C
	SUUMJJuoFmxGfl9r7A9T5QaQfWp7/qsyx611sK+9w1fefhXCJkUPifgvslnORG3JIRBjGqKN9VI
	tBmFrrSKkS6gd3dHnoPjHuzKzoi6Fq9w9eYeh5nUnBDcZc
X-Google-Smtp-Source: AGHT+IHdBp+IoDkdTG/nt1rk4Di2kL71Qu1GGMsx1QgagC6jyO2vbN+W5WFbJ4cCZphomlDigaNYwUwOe2MJywkSIv0=
X-Received: by 2002:a17:90b:2809:b0:312:39c1:c9cf with SMTP id
 98e67ed59e1d1-313af0f80d9mr10946079a91.7.1749728519703; Thu, 12 Jun 2025
 04:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527093530.958801-1-gye976@gmail.com> <87tt4mok84.ffs@tglx>
In-Reply-To: <87tt4mok84.ffs@tglx>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 12 Jun 2025 20:41:48 +0900
X-Gm-Features: AX0GCFvpBlEiPiLB19NLIdP6bP__Ri2c8-rBfsAsOUluqZaBHoFJXhvLtEXeaOs
Message-ID: <CAKbEznsu=2O4b-3rHGVtqg=+s28Np2=cL+q8w6TbrkO6RPCVVg@mail.gmail.com>
Subject: Re: [PATCH] irq: Fix uninitialized pointers
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas, thanks for your review.

On Wed, Jun 11, 2025 at 3:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Tue, May 27 2025 at 18:35, Gyeyoung Baek wrote:
>
> The subject line prefix is wrong. See
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-=
subject

Thank you for providing the guideline, I see now how to.

> > Fix uninitialized `ops` member's pointers to avoid kernel Oops in
>
> You cannot fix an uninitialized pointer. You only can initialize it
> properly.

Yes, I will update the subject to 'Initialize properly' in v2.

---

> Also please describe how this ends up with an oops in
> irq_sim_request_resources(). The point is that any dereference of an
> uninitialized pointer is resulting in a problem and it does not matter
> where.

Yes, It looks good to just remove irq_sim_request_resources() from the
commit message.

> Dereferencing an uninitialized pointer can cause an Ooops or worse it
> can call into some random code when the uninitialized memory contained a
> valid pointer, which is way harder to debug than a plain crash.

Yes, then I will remove irq_sim_request_resources() from the commit message=
,
and explain it consistently with the subject.

---

> > -     if (ops)
> > +     if (ops) {
> >               memcpy(&work_ctx->ops, ops, sizeof(*ops));
> > +     } else {
> > +             work_ctx->ops.irq_sim_irq_released =3D NULL;
> > +             work_ctx->ops.irq_sim_irq_requested =3D NULL;
> > +     }
>
> The obvious fix is way more simple. Just allocate work_ctx with
> kzalloc() instead of kmalloc(), no?

Yes, that's a much simpler and cleaner fix.
then I will send a v2 patch according to your reviews, Thank you.

--
Best Regards,
Gyeyoung
