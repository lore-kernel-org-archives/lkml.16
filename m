Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647D259CB5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751569536; cv=none; b=n6CqAEscfE6dh1+AqKQ7OVwuYwJmAzkqQzctM86jBX0t6voxyHxDYdvHRY4Ruiz2VTkIxgbxpL+e92p/Yz066EwvqhPIzPHRRcLm/+X2DKkvPD4SvJDIcLPoRQT8trzo7CAyOI37sTsBjkD1gz/FZOMflianYQb5VgDmtJ6aWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751569536; c=relaxed/simple;
	bh=4+MJjeW2hiM44MuofBy9Llynx1Jvq8BS3Q7t4UwhJ+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHJSHHscfDjoStxe1FLrsrzsoOCDQJOKw+9NQcAEcHGTtT5shQ9sYO8DQ+2Y7C+0HTOZJEVrB+bQAi7NIImQQgxzCWNCNKRuv0/N/7W/bordxTtQ8rl3FvpOMUFRO5KkjxFY4Cv5QZQhBbKOD3bN5gRZJrA5kPTVygDBCT5PTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OH4XL/xY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH4XL/xY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so103753f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751569533; x=1752174333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEes5oE48jiUB+IbTjNoonD0N5PundEhMgfAv/RRt5A=;
        b=OH4XL/xYA0Rx1DLbJ5kyS2cbAiFTqQdrQh2OHakpOwP1jVVdWfcK1UNeKSKLENJAk9
         QW9A+hdMJMAgGVTE5I8XQkzH+oIaQde5Pj+qRi1sXAb++ULiezV6bMXNJqXn0kiwIy/K
         5PqO6wP+gWnMIVnVMlhkk0kZbNgruIXosyg+169J8u/Mm2YcMR+sIt1nypKZyoCOaxvJ
         UmX3U2GOYlbky2sXFihWhYX7U0iHr2/c2HoU8UlAtD6k8EVJ5anSR79+ymFm0ZTW9fvQ
         Bz37PYqwgf8UlCRXjpicQWzacP9TZ9A1imnM8K9HtZU0alHIOyQ5W5tsx5gSq8c3CVo0
         6gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751569533; x=1752174333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEes5oE48jiUB+IbTjNoonD0N5PundEhMgfAv/RRt5A=;
        b=cR3Fwz4Qn7S1YokGVK24RVHQZwaMVwmKEK6nDvFCmAaS4uH38FAbRIhCDEaaq/aJSj
         w1vfe1XuKyL43Fl4BuTuPGUujc3gy94X6s3gfMfBJpwFWdQJ6PT+Zxr27n9BhU08b+de
         ukr63ihf9R5VYuv7SHOqnPb5ty+fTetBuJGxYJwWcgUXpnLXR+ecWjjeC8lIOoZirs9x
         VogZTCkdb9ATLNdk9Ue2qv6rmsm4dSNhyABbUfleJUoIz8P3NwCMFuXozE8OfYGfq2QB
         bZsCLTVbilyF2E/OPff5tD6Y8vL4ax9GKJE3bgtszuY+fBzNdh5r4AemJPcxXPFPZe05
         AauQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQODA/f4GjKbQTk6DOEcR2OOoYZCnmIn+xEZbUhzhPl2VIv7vISRzZ3Kw9Ic1+f9awJpAEISatzfLRhe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6QNHj9d/AhMzg1md3UKznVR85tcdQklb+Zdj79Bc7teZQNAy
	K8p4T5ztmIqNIWp7DwxC7FJ50h9qT8jyM6Ym7mx8ltrEwsAaWRnM8UDJKNPamvfr09md/duUgfr
	ymbyCVBowye2KqkjAph+e4IwH0jEmpis=
X-Gm-Gg: ASbGncuCGeKaLg/mwh/7zLDWOW7YPUo8Sh/uEMclpeEZAWJKaVpfnAw1H0pRehKnxCb
	ssdkcQMZoadL/ncItwvo7dFdNSgOmUo/9631HbNcj3HyxgnMPflPc/uh9I9n92Rx7LEao7uyzgl
	Ip8n9pwWRudq4wr1pciyiSTSejPAQh5KXOs9sGpWnf1iSDCA==
X-Google-Smtp-Source: AGHT+IHm+VSOO90qj3mCUca2MtaNAmV7aZE1T8OrfB8NfoaCcGe/nTsW+Ix335J9Fw4FfhCKnToRFYqt56sVh1PC2zM=
X-Received: by 2002:a05:6000:401e:b0:3a6:f2a7:d0bb with SMTP id
 ffacd0b85a97d-3b1fd74c660mr6335061f8f.12.1751569531635; Thu, 03 Jul 2025
 12:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703181018.580833-1-yeoreum.yun@arm.com> <CA+fCnZeL4KQJYg=yozG7Tr9JA=d+pMFHag_dkPUT=06khjz4xA@mail.gmail.com>
 <aGbSCG2B6464Lfz7@e129823.arm.com>
In-Reply-To: <aGbSCG2B6464Lfz7@e129823.arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 3 Jul 2025 21:05:20 +0200
X-Gm-Features: Ac12FXyxUbHA_lo-Kj6ls_i2v0Skaq2nx5J2PN_n_cVaHRgGx5xPMKN_AxPcMMo
Message-ID: <CA+fCnZfq570HfXpS1LLUVm0sHXW+rpkSOMLVzafZ2q_ogha47g@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: remove kasan_find_vm_area() to prevent possible deadlock
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	akpm@linux-foundation.org, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	rostedt@goodmis.org, byungchul@sk.com, max.byungchul.park@gmail.com, 
	ysk@kzalloc.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 8:55=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> wr=
ote:
>
> Hi Andrey,
>
> > >
> > > find_vm_area() couldn't be called in atomic_context.
> > > If find_vm_area() is called to reports vm area information,
> > > kasan can trigger deadlock like:
> > >
> > > CPU0                                CPU1
> > > vmalloc();
> > >  alloc_vmap_area();
> > >   spin_lock(&vn->busy.lock)
> > >                                     spin_lock_bh(&some_lock);
> > >    <interrupt occurs>
> > >    <in softirq>
> > >    spin_lock(&some_lock);
> > >                                     <access invalid address>
> > >                                     kasan_report();
> > >                                      print_report();
> > >                                       print_address_description();
> > >                                        kasan_find_vm_area();
> > >                                         find_vm_area();
> > >                                          spin_lock(&vn->busy.lock) //=
 deadlock!
> > >
> > > To prevent possible deadlock while kasan reports, remove kasan_find_v=
m_area().
> >
> > Can we keep it for when we are in_task()?
>
> We couldn't do. since when kasan_find_vm_area() is called,
> the report_lock is grabbed with irq disabled.
>
> Please check discuss with Andrey Ryabinin:
>   https://lore.kernel.org/all/4599f645-f79c-4cce-b686-494428bb9e2a@gmail.=
com/

That was about checking for !in_interrupt(), but I believe checking
for in_task() is different? But I'm not an expert on these checks.
