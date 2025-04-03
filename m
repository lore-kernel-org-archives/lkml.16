Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F306DDA9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685323; cv=none; b=PMWkLJAesLGD3LDYkrUVNKlosAQj+JsqaFTquxmYBhyD3HUIFS821S4R/g0cxcLQ2afT7H9v5tx8jL9xYZAQhl12tdy7Mae7It/CKzJOepGQbUY0ieRTKOxPBMbojlRtEQW7fZIDwcaJQFvZndGOK6/0qtgvLOLniQjBC5sPN7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685323; c=relaxed/simple;
	bh=XPXWeGpojpRYioPWxTUuwayBB+AsIOsFFzoGkTRwnyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGnK3FKzlf7cRVWDCS8LY+6MQAd4GRTuy2YtzCBpCaono2so1bH5xVcq/KzMZJZOpbYH3sKJ67HF5fow7HVhLdEGia1WECmlZ/F3KwxIRbpVcGCpoNO3VqAEuGNQDeeev5mnVdYhLioUSRZ48ZBw/cBN4jbLBtqwvK+/IoEjoyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=METTQHqX; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="METTQHqX"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1104767e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743685320; x=1744290120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drTjAgjzVMuQip0MkHMIsxHd6WXVpRugoMYLwpJngIs=;
        b=METTQHqXWK7I8vpQHJKzpdA4KlqFU1sSEcDzOztCVvpEmWgKicXy7NZhwjooFW610S
         ZjFU8OOcCloYkOEPoj0CVGfGO6YdyRIz94UdRzsahGfW0pan03zKmIaZHeTIPxqrAXC0
         vAIDnJyKK17hijkPChmrJn+Xbt9LHpIrVISxhMimptdxBLT6w6v5GFC7ILSQJEfheQ/C
         CvF+wdNxvBYiZnMKMGUAv2jjQgMUdrWbVstkVSuXCCN88QiB4XZCZ3mfDoTzn80wFUog
         yv1uEPkXpkQXy7TMrGE6YDNClNkbnI6gWKB0kxxZQLYhzN8LqTZh877DaMGwKJzF50xa
         ThhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685320; x=1744290120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drTjAgjzVMuQip0MkHMIsxHd6WXVpRugoMYLwpJngIs=;
        b=JcuszKtZw1nIWsvniRCVKGVdOZlXOSXx6qlcEKzhK4E3QPkmSJH+eAD9xuwghdBGhd
         l5XX+fZHaLEePxbTwsa/aO2nOcQk49w3uVzLEFEZa2mASBFvbgpak9Sv2qw7O4vi7xBY
         ECmQXNCxse68C15d8mZuhEkn8/gGwcYiBMhImOTWx7yWRXtoMLbK5D1bzdJ73wV48UkV
         VxkYMUBU4USU64Bn6zj5Pz+GbpVEUMsWE3AVgZMFspmfxXc6ahdGhpeM+GzBQqlTkrJL
         EuZtcRI6rOoXg0ASCCvDWqk+ztoZlh+Za/6Y9C5wK+h1gF26xigFviXPilSEMi7cnoqY
         +5mg==
X-Forwarded-Encrypted: i=1; AJvYcCVGQUux4KTQPFMZzW39dw/uOscfOF87UbcI/pj5740szYhg2kWD4S7pYoNl3dI8FLDh3v2enonU0TAEyks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUApUdvKuUGWuFIUbjAJW74Jd6dQuyFbn8EQPNtI8jgeEE66Ld
	l55MKKSCPnDDmXxfqT2bEYANgJrydIB4qwTc6Bno8nDHLU79Ibf3R+TKhtAkFzLSN9N2d/Dscm4
	j4fWvAN/4ZReYVlIUpgKH+TmwSuTYqZULjRmj7Q==
X-Gm-Gg: ASbGncvsLlGamyTBxH9Ds3jtHJ7poyzc7Qdf+NrX+4Qtksu4Nx0ekc3OqEk7/j1B488
	xt10WVOlEdfzf7NRH5mDzQMljSd3XF/hKHx/H/1ZEXnBZp7RRWoCU5HP1uPFeGRgu3+OlIqKXIc
	u4dt1JL/ug86hZJtvVCB1mJDY868Oh0JrHcFTfHi8jI3pZByKfRo9P3dF/ZoI=
X-Google-Smtp-Source: AGHT+IG6nzPxWS7ePYNZ5+Oga1vo3wC6ZFL8ar0lCio7Y6TC0yBWQbh8ezJUeJEUyKZPylD3oxsVZIdB9Xj4y0cfG/4=
X-Received: by 2002:a2e:bc8c:0:b0:30b:efa3:b105 with SMTP id
 38308e7fff4ca-30ef912cb2emr24640471fa.19.1743685319415; Thu, 03 Apr 2025
 06:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
 <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com>
 <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk> <CAAofZF6Gnzm9isPt3NUuSPBmBWQsj56O43pPZAf64WEP8no2Rg@mail.gmail.com>
 <alpine.DEB.2.21.2504021933160.53907@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2504021933160.53907@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 3 Apr 2025 15:01:47 +0200
X-Gm-Features: ATxdqUHHRCxTOIKVon_bE52UEuUO1m27yo1LeOEGmqIlI0SHMvGaSWD0QnhCK34
Message-ID: <CAAofZF7YVK207bVYu5-p0CAKjpB7hHYomgd9wdV1J=5GkeNXbw@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, so I think that I will send the v7 without the "rename" part,
so we can address this in the future, if it sounds reasonable,
and find an appropriate name.

Thank you!


On Thu, Apr 3, 2025 at 2:00=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
>
> On Wed, 2 Apr 2025, Marco Crivellari wrote:
>
> > > Well, you should be able to set a breakpoint at `rollback_handle_int'=
 and
> > > fiddle with $epc by hand to see if the code sequence correctly skips =
over
> > > WAIT.  Though I reckon QEMU used to have an issue with presenting the=
 MIPS
> > > privileged context over its debug stub.  Has the issue been fixed?  E=
ither
> > > way you should be able to just operate on the copy in $k0 retrieved w=
ith
> > > (D)MFC0.
> >
> > Nope, seems not fixed so far. But yes, changing $k0 is working fine.
> > With the cpu in idle code (executing "wait"), ctrl+c, then placed a bp
> > in rollback_handle_init+4. Then "c" to hit the bp.
> > When the bp is hit, I can see $k0 =3D r4k_wait_exit.
> >
> > I changed $k0 with an address inside the region, and setting a bp on "b=
ne",
> >  the value is equal to $k1. I'm assuming the value is also saved
> > correctly in $epc,
> > considering it points correctly to r4k_wait_exit.
>
>  I think it's enough evidence to prove the code works as expected.
>
> >  > Hmm, "skipover" maybe?
> >
> > Now that I'm looking at the code, shouldn't it be better to address thi=
s in a
> > separate patch or another time?
> >
> > I can see the rollback_handler* is exported also in arch/mips/kernel/tr=
aps.c
> > And there are a few parts that makes use of the "rollback" name; I'm
> > wondering if also
> > the code should be refactored a bit then,
> > eg arch/mips /include/asm/idle.h:using_rollback_handler()
>
>  Yeah, I agree cluttering the semantics change with the rename is not the
> best idea, so a follow-up patch approach will be better.
>
>  Also I wonder if we could come up with yet another name that does not
> have the exact semantics implied, so that if in 20 years' time we change
> our minds again and decide: "Oh, let's do the rollback thing after all,"
> we don't have to do the rename again.  Though it's like I'm diverging int=
o
> the bikeshedding area here, so perhaps please just use whatever name you
> have found most reasonable at the time you're about to wrap up with this
> effort.
>
>   Maciej



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
