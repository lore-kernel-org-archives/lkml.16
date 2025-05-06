Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0B226560B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526233; cv=none; b=dBMhzhqOys6BQFQBhFBWQTbc0zGrPO+VGUN5Q5uthyn98X7T7s3T7JccCWs9eo9Cu2T22ZKuk2TYCQ/64DG4jQ06vKYdlh4UxoXOCYBxvo8rK6v/Dyoqj1tws/Eis+qsxQcaz+h3YM6NZf1vBtzDdGHgHR7YRLx9nrOMczPR4d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526233; c=relaxed/simple;
	bh=gGGmxUbk8vrtJ1Mmr4cCd7hWM2vCgRBh42AoFwpNydQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piX0RF2H/ns6+FsXqwJrT5ccywoT8S/C8REynWpnCj9kUxNDEdHqvQZWv/vqls6nftsjxiROUyGaNQYCKlmG45o/H3/DMtf18sjRnv4ixRy5Om0zUr3yFpfHVIAxrXTMZq31PaIOlNw2tRHDacxl6QrJb6qL61gUknV4hqMeIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ieg6V+jx; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ieg6V+jx"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30c2d427194so48030451fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746526229; x=1747131029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vx8i6SIIlfpmbQpS4R1+ncEn9UEtN+IsuQ5slgbwHa4=;
        b=Ieg6V+jx4qkmEBhBkCeuiVPfg88plHKv8N7rUnWJ9nwMEc2+GeQF/6OhbWw2DJ5D23
         KuY93gwXcwpfSkoadD668Jc9nBkw4PKKH2udAkgbH2ro8igDuK+BYEhubdkOcQaLsP95
         2UYNUkeHLORFP9jql0ZGjeVKjBt7xyBngCid2+qcNcLKp8Vsl/gRjiXgvybHScmMN3Wt
         rniz2UHSi0piXZ5gm7jlPRjckx0DPfOJHjKgHBeSDf3UU39v2g3HYxx2/rFzCNiEpk2V
         YvlVOeVQDK/3ydvm6etlmdg+VJ+kNvonh49z51hl71fd5zIj5F15O16No6HlqgFPy7Cx
         81sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526229; x=1747131029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vx8i6SIIlfpmbQpS4R1+ncEn9UEtN+IsuQ5slgbwHa4=;
        b=evlYWti74BhNIYIkkDMGbWSntOeKGkgz3Ef/cr+Baxs0Uc7r1O/THGgLMdtp8ri/9W
         8mEoJ8U9zGVnruxwZRBN6Pxz2+3eoXW7KMGVyTBSV+l01l33SxSwkuv+AeOvpO8eCOXF
         fAywoBy3TLh8eJnZFxlRCrmccldu/+FY3rrYOxpfSjbMwg4rh89ofX9XfN6Sa2yYnXZu
         XOZkdz5+GOZujYsgxK7Qcx73iewg6IjMZR9yRkiSdLYVyZdfAXIYVCb1Ag1QtkkS/jFR
         DUCo+Te4K5qcrtL+gDtAz90+ybk2+E/pO1Vpe5xL0UG35jHkq8qZZ8RXanr6nhnFQyqf
         06MQ==
X-Gm-Message-State: AOJu0YxUTU4+efaboM7TI9KRXRoyTi8stzqPrYbJMgNJ5P/6VNcB2jLo
	uvVfVeF5gi5HXwWLB4OzMwVULtF3esCNnxrSBY1OrUBNWlKmQ1YEvIJ8NjRkN+xM4oyMY+JDA8k
	cN7cxSgJ/Od1YwRFSo6KiRFq9RPe+00WGjPqWOw==
X-Gm-Gg: ASbGncubpCH6dclr45qEh8qqvhxYaww2PwBVAfJrLbb4QYqHHo+PcvWafTc5V+lCMxq
	PfiTIqrPRJ40SoF71gzx65nzZjj78rDY2WpqeXMXXKqzF3YjqRKyPHpkX4Ffhs+z+EuY702S3io
	k8fYk2x5+M+PKhC+rJltnd0O3lMT9xWn4II2JU6DA3C665qRiSpdBSTtewJ1Tv8DGhjg==
X-Google-Smtp-Source: AGHT+IFDAP9Lw/1+lUDPydOLzcnkxY2RUFDk8XdLLkCRbTD/DPDm1yFAPqG4/nwE/cuM/8hV2OnR0x24rkbUQomMHqw=
X-Received: by 2002:a2e:b887:0:b0:30b:f274:d1e2 with SMTP id
 38308e7fff4ca-320c3af0581mr50762521fa.1.1746526228731; Tue, 06 May 2025
 03:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503082834.49413-1-marco.crivellari@suse.com> <aBlMLQl504ThYbnf@slm.duckdns.org>
In-Reply-To: <aBlMLQl504ThYbnf@slm.duckdns.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 6 May 2025 12:10:18 +0200
X-Gm-Features: ATxdqUHovGAhlVBNhE5_utEiR3kJaiFKcCVPTtgunFIAQUNvOfwgQ4cahsSLjFk
Message-ID: <CAAofZF60A82utmB2LiVw910cdFDiHd+fPaozUKpQwfXUqv7R_g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> Can you please make a summary of the discussion here? Referring to old
> thread is useful but it'd be nice to have the rationales laid out in the
> patchset - why this is desirable, what is the transition plan and what ar=
e
> the rationales for it? Also, please include a short summary in the patche=
s.

Sure, thanks for the advice.

> Let's keep the old names for a release or two and trigger printk_once()
> warnings about the renames. These are pretty widely used, so I think it
> warrants a bit of extra effort.

Good, sounds fine.
But I don't understand where printk_once() should be placed.
Can you give me some further guidance?

> Similarly, let's warn about violations and assume the old behavior at fir=
st.

Ok, so warn (printk_once()) if both flags are present but if none among
WQ_UNBOUND nor WQ_PERCPU are present, assume WQ_PERCPU.

Did I understand correctly?

> Do you mean caller?

Yes, sorry. I meant "every alloc_workqueue() caller".

> How is 3) different from 2)?

I get your point, I will use a single patch.

Many thanks in advance, about my questions.


On Tue, May 6, 2025 at 1:39=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Sat, May 03, 2025 at 10:28:30AM +0200, Marco Crivellari wrote:
> > Hi!
> >
> > This series is the follow up of the discussion from:
> >       "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOU=
ND."
> >       https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de=
/
>
> Can you please make a summary of the discussion here? Referring to old
> thread is useful but it'd be nice to have the rationales laid out in the
> patchset - why this is desirable, what is the transition plan and what ar=
e
> the rationales for it? Also, please include a short summary in the patche=
s.
>
> > 1)  [P 1-2] system workqueue rename:
> >
> >       system_wq is a per-CPU workqueue, but his name is not clear.
> >       system_unbound_wq is to be used when locality is not required.
> >
> >       system_wq renamed in system_percpu_wq, while system_unbound_wq
> >       became system_dfl_wq.
>
> Let's keep the old names for a release or two and trigger printk_once()
> warnings about the renames. These are pretty widely used, so I think it
> warrants a bit of extra effort.
>
> > 2)  [P 3] Introduction of WQ_PERCPU.
> >
> >       This patch adds a new WQ_PERCPU flag to explicitly request the le=
gacy
> >       per-CPU behavior. WQ_UNBOUND will be removed once the migration i=
s
> >       complete.
>
> I wouldn't call per-cpu behavior legacy. There are plenty of cases that n=
eed
> per-cpu behavior for correctness and/or performance.
>
> >       Every alloc_workqueue() caller should use one among WQ_PERCPU or
> >       WQ_UNBOUND. This is actually enforced warning if both or none of =
them
> >       are present at the same time.
>
> Similarly, let's warn about violations and assume the old behavior at fir=
st.
>
> > 3)  [P 4] alloc_workqueue() callee should pass explicitly WQ_PERCPU.
>
> Do you mean caller?
>
> >
> >       This patch ensures that every caller that needs per-cpu workqueue
> >       will explicitly require it, using the WQ_PERCPU flag.
>
> How is 3) different from 2)?
>
> Thanks.
>
> --
> tejun



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
