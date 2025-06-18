Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7351922DE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258130; cv=none; b=qBiYWhXXY0H9K0ZXfeHibI6uoukrbn97BxN5NkDwpAhHhhGHWVD3iZxXWcc92Ah+gAoq9CK0L8STQCuYFAy+7FQZaf1ajp5QeLbg9Z4fXPDgp16x3hflSEqyhlLNvxdaG3Hig8ZTp3QctO4ga5ZzNbO7nkn0DZpaHoPx31J1zj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258130; c=relaxed/simple;
	bh=wg+SUdZ3bXxOZknnl2JP3G2rwY0vInxZh1GPisslBOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJ/DOoU2C6Bd8IZcqTz3s2aks3Z+mBtm4qzMHPSthELxvI6l3uLA0P2an2V0YXloRN+TsE5We9X9XCiHGIIJaCjGQFUOS3lwUtL84YWfXfR0metufWJnFvJuVFzwQkeHV/hvpj9/SOCKgc2k6LrVJkLdViwtHF8W0R9azRlRRQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=XGTGHtjH; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="XGTGHtjH"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d094ef02e5so88721785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750258127; x=1750862927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8VeINRsa1OxgNrKUKFRtGWzNViSlD55EzoK83kRcQg=;
        b=XGTGHtjHlOI9OVCMLCw4R1bgKRKLw0I66vS5xr2+qsfoY4LWptNDG3q+xMOQIc/2wb
         s/nk241AemLaromGkSrrDPu8v6VIvd+PS068wTQ1iDl46dNSdEnRhqmHkFOPKTAnYR0k
         fRoviyRyoWCjOT/2Vn/WMXVOVeyGNVmLuWbksSVwE14rpURdkfp/Ijmu+MtVc9/RR/2w
         nxkL3mdISgSXxO7+mfeXQRghb0sWV1owNs9Tkm5raUCrHDL2ejOQ0cI8P5yleIUYyfeE
         VAAwORKTuKkcoElR5otv3rxb5lDOfrBF3OAYObOzQme4LBSRbNsIvGxa5giOGcHcx0+w
         3QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258127; x=1750862927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8VeINRsa1OxgNrKUKFRtGWzNViSlD55EzoK83kRcQg=;
        b=jihQIHi5mPkXF+nCxbimCFEmmDxTa2TXWMuTJ/KTGqF5NCTcWKExeAZo/XoJ0NFfd9
         sN3CKRr/9vv2h4VAcow3VAJUV8yUnFLL2xRXP5pA5m+LDDbEOS1tC8sAXwiXpvKSn26y
         /jD/KgX/1uYqWf9Qi32A61U8FqXEcx9lO/RWFrW5BK0guhYzsRjJ2MJlzHpfDgkZgx0O
         f05H1vpKDLqYuzqEmTNc4g1Fg6xQc9jKvgbkX/Td9bEXq3+BOaouDuZ4DhfUaqu4jY3w
         QyVk6xs7ZUqVMVZ1EUe6kyFgN+U0LI2rkzwhwvlqN/a/jsK2MPnW5MoNPPcshH9mHR/c
         2mSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPVDGiNsrjbv1atmNWn6YHnD9y0lcr1zBKqIDhwH424OvaurlkBePLsVxkCANiU8sVqxRsrW5lwOXBw0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKrwyHaApqLNCr695U4+UGDOBZU7MaqsnKVoeV2xIKEu5Rc9pK
	xfJN5vQXD/6K5e8LxCWWLHhbBz3GuivkKEfM6V3mJ0KwdPIhmMdadar7LwtyPgamSIfVQn5f5BN
	uqEAPTbNS4AfzD3gU1EHmBWnFWu1S0lchaQEGW6UK1g==
X-Gm-Gg: ASbGncvCJ5sv3fT+cHezo/Ldy0llyyPbRbE2J4SYYnM6T/0jwE2pjthcSVDm/s+BNWB
	X+OAbq4rJZNHF1vK3DgmWzDZ38YIvzQXAG0AwkXXmwKmhgC9ZsBx9hKuGqPQfwoNZYm16E3Ho/R
	YNPH9nfHOOIxNYPj/zhhiOHU7hG5omJ/gmt8yuj1CV
X-Google-Smtp-Source: AGHT+IFZ+d0LIRnvuQ/PF2vSUV7/GsXTYRq155Ys06jbKx7qhTIQJlphjp1gq8ybYgdEc5Lt1pO8pAEIGzK2HNg9BCU=
X-Received: by 2002:a05:620a:600d:b0:7d3:e56e:4fd8 with SMTP id
 af79cd13be357-7d3e93da631mr425634585a.12.1750258126838; Wed, 18 Jun 2025
 07:48:46 -0700 (PDT)
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
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com> <mafs05xgtw5wn.fsf@kernel.org>
In-Reply-To: <mafs05xgtw5wn.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 18 Jun 2025 10:48:09 -0400
X-Gm-Features: AX0GCFtpLB0oTRuEsFuAVbaG8Bvqsh21i0UCcwFP_32oEzA5tqSbuwcLuOtmBNE
Message-ID: <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, jasonmiu@google.com, graf@amazon.com, 
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

On Wed, Jun 18, 2025 at 9:12=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Tue, Jun 17 2025, Pasha Tatashin wrote:
>
> > On Tue, Jun 17, 2025 at 11:24=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca>=
 wrote:
> >>
> >> On Fri, Jun 13, 2025 at 04:58:27PM +0200, Pratyush Yadav wrote:
> >> > On Sat, Jun 07 2025, Pasha Tatashin wrote:
> >> > [...]
> >> > >>
> >> > >> This weirdness happens because luo_prepare() and luo_cancel() con=
trol
> >> > >> the KHO state machine, but then also get controlled by it via the
> >> > >> notifier callbacks. So the relationship between then is not clear=
.
> >> > >> __luo_prepare() at least needs access to struct kho_serialization=
, so it
> >> > >> needs to come from the callback. So I don't have a clear way to c=
lean
> >> > >> this all up off the top of my head.
> >> > >
> >> > > On production machine, without KHO_DEBUGFS, only LUO can control K=
HO
> >> > > state, but if debugfs is enabled, KHO can be finalized manually, a=
nd
> >> > > in this case LUO transitions to prepared state. In both cases, the
> >> > > path is identical. The KHO debugfs path is only for
> >> > > developers/debugging purposes.
> >> >
> >> > What I meant is that even without KHO_DEBUGFS, LUO drives KHO, but t=
hen
> >> > KHO calls into LUO from the notifier, which makes the control flow
> >> > somewhat convoluted. If LUO is supposed to be the only thing that
> >> > interacts directly with KHO, maybe we should get rid of the notifier=
 and
> >> > only let LUO drive things.
> >>
> >> Yes, we should. I think we should consider the KHO notifiers and self
> >> orchestration as obsoleted by LUO. That's why it was in debugfs
> >> because we were not ready to commit to it.
> >
> > We could do that, however, there is one example KHO user
> > `reserve_mem`, that is also not liveupdate related. So, it should
> > either be removed or modified to be handled by LUO.
>
> It still depends on kho_finalize() being called, so it still needs
> something to trigger its serialization. It is not automatic. And with
> your proposed patch to make debugfs interface optional, it can't even be
> used with the config disabled.

At least for now, it can still be used via LUO going into prepare
state, since LUO changes KHO into finalized state and reserve_mem is
registered to be called back from KHO.

> So if it must be explicitly triggered to be preserved, why not let the
> trigger point be LUO instead of KHO? You can make reservemem a LUO
> subsystem instead.

Yes, LUO can do that, the only concern I raised is that  `reserve_mem`
is not really live update related.

> Although to be honest, things like reservemem (or IMA perhaps?) don't
> really fit well with the explicit trigger mechanism. They can be carried

Agreed. Another example I was thinking about is "kexec telemetry":
precise time information about kexec, including shutdown, purgatory,
boot. We are planning to propose kexec telemetry, and it could be LUO
subsystem. On the other hand, it could be useful even without live
update, just to measure precise kexec reboot time.

> across kexec without needing userspace explicitly driving it. Maybe we
> allow LUO subsystems to mark themselves as auto-preservable and LUO will
> preserve them regardless of state being prepared? Something to think
> about later down the line I suppose.

We can start with adding `reserve_mem` as regular subsystem, and make
this auto-preserve option a future expansion, when if needed.
Presumably, `luoctl prepare` would work for whoever plans to use just
`reserve_mem`.
