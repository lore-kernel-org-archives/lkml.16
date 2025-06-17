Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A22254878
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188775; cv=none; b=gHIRzuQXoiQJVfKkbze9WmQRwJAzfHpCHt+jJJOha8HCPIcTONV6HfWg5vMuMg4Hmr1ynnzP4Wo+6xoITF9nDM3nsyxupywOLS5ZisoDgqQYiNMFGlXBrYAz7y2qIyPV5TaAbfBPQ4Gh9iWlteBxdvY0U1WhzjaOTZgNcDNLJCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188775; c=relaxed/simple;
	bh=ves47J1muGKJhd/kO2JKlr9I8bsuRNvgukULjmQzbWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W66HioqqSCE8nFDCQpnl/nyXrlPtd4UuvswsGm0qOfQeoK4CMmakVQMmpKVW6XbNQeuVstejduckg7Axi4XwztXFXWGzZNkEa1DXQAoCXxPZV99jTaXNGpq+CL1V9YeOk/9R/2Vgkw59df2jZ89+S64gSQVmLifFDPEIqYX42kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ro7hmasz; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ro7hmasz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58c2430edso285831cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750188772; x=1750793572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ves47J1muGKJhd/kO2JKlr9I8bsuRNvgukULjmQzbWo=;
        b=ro7hmaszimTliPQatfV4ucx6bCKYi12Kh4svScwa9yPrFLJfQB55u15UgRKgFQcJpV
         23zTunXm8Bw6L1IBc0tKLP3kUyxc5DYmiD9PH11ZO3UQnta0TcBQdqVY3+w/eRqP83Ep
         YxrD8BC2wKv+7BJscCwoQ4zU+g6bukZ9RRfhKbRSff+qJgJIc503DSV9bRb0CCLB82ST
         w7+xn2iE2zUSiltSYpeLcBYOaC3HL7sdXilCM5yW+wRgbm+V2FUu68rB0gvo6SmWqwBV
         L6jvXKYPQn66nms8d0QvRkojQQB48g0nzsAXzYU3pGvCiwsrh97Z3tLObZIPS0NShV2m
         wz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188772; x=1750793572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ves47J1muGKJhd/kO2JKlr9I8bsuRNvgukULjmQzbWo=;
        b=fxX0zuDIaipNcpfA2KYDP/4Pk3AHXCCYED6vlQocgd37v0VhhEEDSx0SZc3YwQ4dMK
         EVbpvYM8f/bEtXsuChLHNbjyGWLYiGJ4sRM2Y7m2pPqQYp4bRkNr+RyoC7KDHcVkU307
         tSL2YO8rPXsDEbbgisIFhC5TtqFXXvt6YigfmobdExQESYjuuCZ6f57mmv8rZyW8Hx3q
         LanmDRgpx2JSQJ99CglsbNHTG8RTTA+7T4FPdV6Kx+7/Hgzuxy4nJzc18NYNMiIdai5p
         WsWHkDCsjpAAfHbSTW1OhWAho7BhgkGnV4v+jqyztkQagXY+yFb5qCLnJJcW2zuHwbgk
         3ztA==
X-Forwarded-Encrypted: i=1; AJvYcCWV7tFYo41GfpJPYZ7G8cUtWValsbTtN/SD18jS8RubtudB7ykm+yMTZRnydsvCqF4/PHKMyelUhInNaqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcRVxkK9VwLvtDuLRuKU7y4sFycXmAjX7+XU8c1rhs+uwOkEi
	b37WaBLKYjbjD1lSHMkxN5X4+ogJcWLc2+H6LQpf++ZzgLjsQGF043yRGJ4cNa/1pq47E5Ho+YR
	0Blntjs5yhuZPtNTXQKz+8D3hVE6Svx2TabjeZ7GQBQ==
X-Gm-Gg: ASbGncvnXDTl+14fW5kaFPXJ83KtaFpGZYOA58dwivFAHOJtQwYGK9CJze7qPRa2bCy
	Q/CbqkVyU7Zfo6/wQlo/TN3jUpBgwx//4FSZKVqQEVmBL0Ufkem8iktyIwnI+d7QR6D3raVwOqg
	YG4ITPGB1Z3BL0VfLkiLWvsnK2kZNgwnx4/bBPkDSo
X-Google-Smtp-Source: AGHT+IHJZQLBelhzlpJ0ptowIyHIBKA44ecNZ4lE6UyXBr92AYsut9j2K3HQ5qGuEv971SjC4f+GDuHHtKxJ/HrN3ho=
X-Received: by 2002:ac8:58d6:0:b0:4a6:f6e6:7696 with SMTP id
 d75a77b69052e-4a73b7c5539mr235522661cf.26.1750188772431; Tue, 17 Jun 2025
 12:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com> <mafs0sekfts2i.fsf@kernel.org>
 <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
In-Reply-To: <20250617152357.GB1376515@ziepe.ca>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 17 Jun 2025 15:32:15 -0400
X-Gm-Features: AX0GCFuqJ-tQnczF7gXXi8cFVYwNmh8hzNe9WhUyLpdDr7xmvZ9G9OUQyElUNtE
Message-ID: <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:24=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Fri, Jun 13, 2025 at 04:58:27PM +0200, Pratyush Yadav wrote:
> > On Sat, Jun 07 2025, Pasha Tatashin wrote:
> > [...]
> > >>
> > >> This weirdness happens because luo_prepare() and luo_cancel() contro=
l
> > >> the KHO state machine, but then also get controlled by it via the
> > >> notifier callbacks. So the relationship between then is not clear.
> > >> __luo_prepare() at least needs access to struct kho_serialization, s=
o it
> > >> needs to come from the callback. So I don't have a clear way to clea=
n
> > >> this all up off the top of my head.
> > >
> > > On production machine, without KHO_DEBUGFS, only LUO can control KHO
> > > state, but if debugfs is enabled, KHO can be finalized manually, and
> > > in this case LUO transitions to prepared state. In both cases, the
> > > path is identical. The KHO debugfs path is only for
> > > developers/debugging purposes.
> >
> > What I meant is that even without KHO_DEBUGFS, LUO drives KHO, but then
> > KHO calls into LUO from the notifier, which makes the control flow
> > somewhat convoluted. If LUO is supposed to be the only thing that
> > interacts directly with KHO, maybe we should get rid of the notifier an=
d
> > only let LUO drive things.
>
> Yes, we should. I think we should consider the KHO notifiers and self
> orchestration as obsoleted by LUO. That's why it was in debugfs
> because we were not ready to commit to it.

We could do that, however, there is one example KHO user
`reserve_mem`, that is also not liveupdate related. So, it should
either be removed or modified to be handled by LUO.

Mike, what do you think?

Pasha
