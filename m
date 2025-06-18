Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88E2F4303
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268638; cv=none; b=dipME+j3rw6TjKPBqYPb4ZhOchp+YbsxzP4IBrI5cc0g4QtIpGFYXru542Z6c31rknDGl/i9BmMcwq1oNi9TYZrq1EmsG3dx5m+5kQDCEER40X4+3toSroaXJJW6EaQxONaFYN8CCFN/Lryp2HZJB8lJeXBemW1lc0CGeay9zvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268638; c=relaxed/simple;
	bh=tHRwcIe9jnu4lWUXzhI8RZs7515nnc3Vdm0B+zRvO1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtGTjQYjkpuSf5RLr4/jwFw57VJyVwljrH3tLU9ZHBYYNoXNDD3c97ZtAzU9cxwPdh1uBBqxbE7uFIrULjTRc+ajjSU+EeHEHF6c5reEFKZWdE/9tuluwD4uH9ekd6C/Oi/oPdtXirk+yQF/zGBy2a+1ZbmItRZyJeO9KfYFxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=IuTIhJvb; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="IuTIhJvb"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a58f79d6e9so88325571cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750268635; x=1750873435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ul1/ZS0C5mypt1EEBu+dbdiPXf41CMPEBGbHby4QA+I=;
        b=IuTIhJvbsmnE5LYjD4TGLrq0o2G7FWldmlswYMgM4e9mV06B8jLCWVe4+VRGVSMMKT
         r00Z81kTiHr0zSpENdWyRU0I9TVq1s35uJUekAM2nfDmMQjber1aPIexNU0sgLm2Nsx6
         kiqChduKPwaf2Nz4JN9lfE0oW3O0xg3solGSoTYLNcFwihb+MFhQR5ht88OL1ArmB9yi
         idAbm7HcjWL3p9JUr4mpNr9CbKxA+GB2YGp1PCokeM1o90kYrflcqVnqztWCCBZ4AC7U
         HlhQOH9ix9WoD6l+TP1mUY8jKQ7Umt5/BiEyc3AjBR0EUiV+nkKuik4CE/XweL06BJJ0
         jv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268635; x=1750873435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ul1/ZS0C5mypt1EEBu+dbdiPXf41CMPEBGbHby4QA+I=;
        b=EtCcLeRtj94w356Y5Tq9bC+7tLdZz+P6hRtmnRAm6ypwYgBvlGXFLw7/Icme7d65VN
         L7cDpOQwbmjGAmrZ9OI1FhRgRuEEZW4QP7nLGzFMKFBMjNDz1uq4G+u/y4Jj2s6CJSC2
         7QtsEQF9NeG9AH70a2JpTqtq9egeBBMvKM1SqgeinWzWmgrcMZgBCvn6iH1PwPkIzjhC
         AyMUNnFX11ubnw1OdJ5HZkxbxCHSnbSEAK2EPH9PyWDu+O4HXxKeLNo3nEUUbHQ2qFlu
         PXsLG/Ej5SjYk1ko6oxJjJ7KR+dfaKWO+EBuyKntLT3CbFBHQYBMrckosfDIB3r9Cx6X
         ZLgA==
X-Forwarded-Encrypted: i=1; AJvYcCWc3/KIKO37S9s6f+mXvDVsmu6bMvyh99tSKggyOCdtN2cEDOctovOb7Y+pM/GCNzloLKjbzi0sRqrZBLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznR+ikbkNHGm1MusDt/k3lJrUlSL+h0c17lc90YG+hS0oj1H66
	1OtTl3FdmR5gL5zJKfhVBt1k9ZqGXzmUpEj2Rvh234qpco9JzQdzPqVIDp+qu2ejhGpVdjPwsXn
	0xWscSwMr5ywNSCC1VT6wO+6cLZL71HKRR1cmXT44mg==
X-Gm-Gg: ASbGnctH8vhlHAFec+orL7cUH4F+Ejop9tM/QDCOvZW0dAYh6W2GSsLQhIFmsfN9dXl
	4a07UzeSZoGyt5rKnc1+uY48+pYnO5u+hoUZRUyKqjpG+x/2eVmDRpum1OLmpKF2VUvYYmrFMhT
	OgtCHEM1UR/mS60a58HykN0S82FOiQzckuGScW6pap
X-Google-Smtp-Source: AGHT+IFu5AzLPnTG+aRgFuuvEF2tLu87GBBdz0yPRuiaVFppqqiHFLRASTkXxhdOGgW2cjTM53gFmEJMm1pYRljeP8w=
X-Received: by 2002:a05:622a:82:b0:494:abde:2aa3 with SMTP id
 d75a77b69052e-4a73c55d18amr291709221cf.18.1750268634869; Wed, 18 Jun 2025
 10:43:54 -0700 (PDT)
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
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org> <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org> <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
In-Reply-To: <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 18 Jun 2025 13:43:18 -0400
X-Gm-Features: AX0GCFvgJpPcHTvmz3P0lUtBPY4Ij_RTnGTbaB_awtvHJcZktFGTbkb5RAtj-a0
Message-ID: <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com, 
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

On Wed, Jun 18, 2025 at 1:00=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Wed, Jun 18, 2025 at 12:40=E2=80=AFPM Mike Rapoport <rppt@kernel.org> =
wrote:
> >
> > On Wed, Jun 18, 2025 at 10:48:09AM -0400, Pasha Tatashin wrote:
> > > On Wed, Jun 18, 2025 at 9:12=E2=80=AFAM Pratyush Yadav <pratyush@kern=
el.org> wrote:
> > > >
> > > > On Tue, Jun 17 2025, Pasha Tatashin wrote:
> > > >
> > > > > On Tue, Jun 17, 2025 at 11:24=E2=80=AFAM Jason Gunthorpe <jgg@zie=
pe.ca> wrote:
> > > > >>
> > > > >> On Fri, Jun 13, 2025 at 04:58:27PM +0200, Pratyush Yadav wrote:
> > > > >> > On Sat, Jun 07 2025, Pasha Tatashin wrote:
> > > > >> > [...]
> > > > >> > >>
> > > > >> > >> This weirdness happens because luo_prepare() and luo_cancel=
() control
> > > > >> > >> the KHO state machine, but then also get controlled by it v=
ia the
> > > > >> > >> notifier callbacks. So the relationship between then is not=
 clear.
> > > > >> > >> __luo_prepare() at least needs access to struct kho_seriali=
zation, so it
> > > > >> > >> needs to come from the callback. So I don't have a clear wa=
y to clean
> > > > >> > >> this all up off the top of my head.
> > > > >> > >
> > > > >> > > On production machine, without KHO_DEBUGFS, only LUO can con=
trol KHO
> > > > >> > > state, but if debugfs is enabled, KHO can be finalized manua=
lly, and
> > > > >> > > in this case LUO transitions to prepared state. In both case=
s, the
> > > > >> > > path is identical. The KHO debugfs path is only for
> > > > >> > > developers/debugging purposes.
> > > > >> >
> > > > >> > What I meant is that even without KHO_DEBUGFS, LUO drives KHO,=
 but then
> > > > >> > KHO calls into LUO from the notifier, which makes the control =
flow
> > > > >> > somewhat convoluted. If LUO is supposed to be the only thing t=
hat
> > > > >> > interacts directly with KHO, maybe we should get rid of the no=
tifier and
> > > > >> > only let LUO drive things.
> > > > >>
> > > > >> Yes, we should. I think we should consider the KHO notifiers and=
 self
> > > > >> orchestration as obsoleted by LUO. That's why it was in debugfs
> > > > >> because we were not ready to commit to it.
> > > > >
> > > > > We could do that, however, there is one example KHO user
> > > > > `reserve_mem`, that is also not liveupdate related. So, it should
> > > > > either be removed or modified to be handled by LUO.
> > > >
> > > > It still depends on kho_finalize() being called, so it still needs
> > > > something to trigger its serialization. It is not automatic. And wi=
th
> > > > your proposed patch to make debugfs interface optional, it can't ev=
en be
> > > > used with the config disabled.
> > >
> > > At least for now, it can still be used via LUO going into prepare
> > > state, since LUO changes KHO into finalized state and reserve_mem is
> > > registered to be called back from KHO.
> > >
> > > > So if it must be explicitly triggered to be preserved, why not let =
the
> > > > trigger point be LUO instead of KHO? You can make reservemem a LUO
> > > > subsystem instead.
> > >
> > > Yes, LUO can do that, the only concern I raised is that  `reserve_mem=
`
> > > is not really live update related.
> >
> > I only now realized what bothered me about "liveupdate". It's the name =
of
> > the driving usecase rather then the name of the technology it implement=
s.
> > In the end what LUO does is a (more) sophisticated control for KHO.
> >
> > But essentially it's not that it actually implements live update, it
> > provides kexec handover control plane that enables live update.
> >
> > And since the same machinery can be used regardless of live update, and=
 I'm
> > sure other usecases will appear as soon as the technology will become m=
ore
> > mature, it makes me think that we probably should just
> > s/liveupdate_/kho_control/g or something along those lines.
>
> I disagree, LUO is for liveupdate flows, and is designed specifically
> around the live update flows: brownout/blackout/post-liveupdate, it
> should not be generalized to anticipate some other random states, and
> it should only support participants that are related to live update:
> iommufd/vfiofd/kvmfd/memfd/eventfd and controled via "liveupdated" the
> userspace agent.
>
> KHO is for preserving memory, LUO uses KHO as a backbone for Live Update.
>
> > > > Although to be honest, things like reservemem (or IMA perhaps?) don=
't
> > > > really fit well with the explicit trigger mechanism. They can be ca=
rried
> > >
> > > Agreed. Another example I was thinking about is "kexec telemetry":
> > > precise time information about kexec, including shutdown, purgatory,
> > > boot. We are planning to propose kexec telemetry, and it could be LUO
> > > subsystem. On the other hand, it could be useful even without live
> > > update, just to measure precise kexec reboot time.
> > >
> > > > across kexec without needing userspace explicitly driving it. Maybe=
 we
> > > > allow LUO subsystems to mark themselves as auto-preservable and LUO=
 will
> > > > preserve them regardless of state being prepared? Something to thin=
k
> > > > about later down the line I suppose.
> > >
> > > We can start with adding `reserve_mem` as regular subsystem, and make
> > > this auto-preserve option a future expansion, when if needed.
> > > Presumably, `luoctl prepare` would work for whoever plans to use just
> > > `reserve_mem`.
> >
> > I think it would be nice to support auto-preserve sooner than later.
>
> Makes sense.
>
> > reserve_mem can already be useful for ftrace and pstore folks and if it
> > would survive a kexec without any userspace intervention it would be gr=
eat.
>
> The pstore use case is only potential, correct? Or can it already use
> reserve_mem?

So currently, KHO provides the following two types of  internal API:

Preserve memory and metadata
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
kho_preserve_folio() / kho_preserve_phys()
kho_unpreserve_folio() / kho_unpreserve_phys()
kho_restore_folio()

kho_add_subtree() kho_retrieve_subtree()

State machine
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
register_kho_notifier() / unregister_kho_notifier()

kho_finalize() / kho_abort()

We should remove the "State machine", and only keep the "Preserve
Memory" API functions. At the time these functions are called, KHO
should do the magic of making sure that the memory gets preserved
across the reboot.

This way, reserve_mem_init() would call: kho_preserve_folio() and
kho_add_subtree() during boot, and be done with it.

Pasha
