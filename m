Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9C1EB9F2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750221197; cv=none; b=IKyHGjAZh5ZBlNTSNYqf33YX0WOKMBlmRaKA6hFLRC461LIrxBJdVx6elbriUd3Uq8erHlAo5AIVPbjG8Fx/urdeS4DVmEt/JK4aH0xuNsFx5/YNsWvJob0xJ2KUC4p9lgTb7FobHTcRa73lx4IB9UDVySIQpX0jygfgGhSJ9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750221197; c=relaxed/simple;
	bh=ebfzSblDd2Lney01spMGoUSSQfIA+CZSVyZnsdJadNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnUDhQP5Cg7ZzJF4CXaqbxHPXdoWVNcdlY9tjS+Y2lv+8QYjKeKrwC2FH3FKVV7JuYnkTa1ExNFtz0IHq4F6QVaDVaNY/U7BzE8/rFsbHjCOkgntAbPSoYdUpIBXwUFUtf0haa9IYkhf/x457nSWrVJJBy1fq1pQlFrpbYSysS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DykWTnyZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DykWTnyZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2348ac8e0b4so61045ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750221195; x=1750825995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebfzSblDd2Lney01spMGoUSSQfIA+CZSVyZnsdJadNE=;
        b=DykWTnyZnHBdv73Vb1Ow3drf69YlCm6fSxKeneUFdnZaY/FW+bc6iIeYhNJT1rEr2F
         VebcQVTWKKo7jqel3AwS+puYf6QmcZY7VvQkcMqUa6SvP7l7UsMxQzBfDOYF8UE8+1hQ
         xbO9NuaIKEIoJQ8qYMboAxF5czKu8ey4biG/3M8wNyXZ/qhbDrRzHqBP3DAuniz3wMiF
         jgGMg9qBRzTOHCUAKLo/IOM0Zf3+B8O6oXhZwxzh1+qZ6OL8uS/jnHnYDz4YPH64p8vm
         60CTY2yozakEmhQ0h9ZNXCD12Vapcf8c0XhJLbp5C9ETn8+xBjWEfqxSQqi4JQVvegn/
         5cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750221195; x=1750825995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebfzSblDd2Lney01spMGoUSSQfIA+CZSVyZnsdJadNE=;
        b=ayVkMDvzTiEgR/HzgX2DhjBgVHl190A1c7bOvLXCuJi9IDOhsRNDC0QEBAfMi2c8EP
         UyZxgRaJWV+MdwvvgZuxQ+nX9pJN27iP5dztF+L6zkSwYV8eoZR8Q/uS4injksRSbB7H
         wsaxVQux8G1LtFsn3S7xNv0PIJ1T9GEh/9eEWFiInK+jKUPsG3T+kgUvsKoQlkk5Qfs+
         lMPz9UF1uk19vDgpjI6SvUqKOFY77xa6bn3mzpLen7NoDlyORzVEClqT0I7MJOmoLNWD
         FLYD6pPo8LvyuBBH/q60aXQ7S2em5wzBTW6OvfTQbVQ7HPV9vGFnW9OpxC7w9c7m4MlV
         vaIg==
X-Forwarded-Encrypted: i=1; AJvYcCWhbfO77o02YAi2RBp6b2f7YAnXS6Navu9qt8g5M+WFWc2y09VN2577Vl9X6eVg5Drn+9xwAMAIuWmQwnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0CIlctKXMrV3bNWHv7mAeIjMVT3Qaln+dQu1cdTm3G99iHrC
	M4ICfaXy0kN5UoRd1UcbBqDSTtOhw1wGpOpkZpb8d6ezOpeWH3tkoXstT2a2QphRNlAM6WzzEgA
	QtS7YA00rVohKDeaUI/n/n+zR1a4/mcT4HhUGCHbX
X-Gm-Gg: ASbGncvNMVQJ0x89BV3TUIJhdjwiYcvbdwHUDw4nR0izzH1kE5S6OdNfUWe9uw6u8VB
	eVSOkmWxKLZhDasAsiJyvYdlKifGyPwpiyYpbe0hnviPJCySGNk5froOcbXLQ2EfFVfIlyV7jqf
	PsFKkXN2m5Ak7qPUyAOPlBjrnj07i+vuv1UESu4ByRVA==
X-Google-Smtp-Source: AGHT+IFKeAWQBuzaMSnC6mysNbtOjppLjuQArsLUzA4dlHLHSRqUjBPLMShGNPjFjvO18z6DuP9yuEGuuR8YpzTmskI=
X-Received: by 2002:a17:902:e88c:b0:234:bcd0:3d6f with SMTP id
 d9443c01a7336-2366ed968a9mr10548455ad.1.1750221194853; Tue, 17 Jun 2025
 21:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCVZIuBHx51o7Pbl@yzhao56-desk.sh.intel.com> <diqzfrgfp95d.fsf@ackerleytng-ctop.c.googlers.com>
 <aEEEJbTzlncbRaRA@yzhao56-desk.sh.intel.com> <CAGtprH_Vj=KS0BmiX=P6nUTdYeAZhNEyjrRFXVK0sG=k4gbBMg@mail.gmail.com>
 <aE/q9VKkmaCcuwpU@yzhao56-desk.sh.intel.com> <CAGtprH_SKJ4hbQ4aSxxybcsD=eSQraP7a4AkQ3SKuMm2=Oyp+A@mail.gmail.com>
 <aFEQy4g4Y2Rod5GV@yzhao56-desk.sh.intel.com> <CAGtprH_ypohFy9TOJ8Emm_roT4XbQUtLKZNFcM6Fr+fhTFkE0Q@mail.gmail.com>
 <8f686932b23ccdf34888db3dc5a8874666f1f89f.camel@intel.com> <aFIMbt7ZwrJmPs4y@yzhao56-desk.sh.intel.com>
In-Reply-To: <aFIMbt7ZwrJmPs4y@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 17 Jun 2025 21:33:02 -0700
X-Gm-Features: AX0GCFtLT2FkMcS_JKQW47xDGN1m_HAdgYfNG0jsWh4JqpK5QckAdFnigfWxYvQ
Message-ID: <CAGtprH9Wj7YW-_sfGQfwKHRXL-7fFStXiHn2O32ptXAFbFB8Tw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/21] KVM: TDX: Increase/decrease folio ref for huge pages
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>, 
	"Shutemov, Kirill" <kirill.shutemov@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
	"david@redhat.com" <david@redhat.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"tabba@google.com" <tabba@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "Du, Fan" <fan.du@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "seanjc@google.com" <seanjc@google.com>, 
	"Weiny, Ira" <ira.weiny@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>, 
	"Li, Zhiquan1" <zhiquan1.li@intel.com>, "jroedel@suse.de" <jroedel@suse.de>, 
	"Miao, Jun" <jun.miao@intel.com>, "pgonda@google.com" <pgonda@google.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 5:49=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> On Wed, Jun 18, 2025 at 08:34:24AM +0800, Edgecombe, Rick P wrote:
> > On Tue, 2025-06-17 at 01:09 -0700, Vishal Annapurve wrote:
> > > Sorry I quoted Ackerley's response wrongly. Here is the correct refer=
ence [1].
> >
> > I'm confused...
> >
> > >
> > > Speculative/transient refcounts came up a few times In the context of
> > > guest_memfd discussions, some examples include: pagetable walkers,
> > > page migration, speculative pagecache lookups, GUP-fast etc. David H
> > > can provide more context here as needed.
> > >
> > > Effectively some core-mm features that are present today or might lan=
d
> > > in the future can cause folio refcounts to be grabbed for short
> > > durations without actual access to underlying physical memory. These
> > > scenarios are unlikely to happen for private memory but can't be
> > > discounted completely.
> >
> > This means the refcount could be increased for other reasons, and so gu=
estmemfd
> > shouldn't rely on refcounts for it's purposes? So, it is not a problem =
for other
> > components handling the page elevate the refcount?
> Besides that, in [3], when kvm_gmem_convert_should_proceed() determines w=
hether
> to convert to private, why is it allowed to just invoke
> kvm_gmem_has_safe_refcount() without taking speculative/transient refcoun=
ts into
> account? Isn't it more easier for shared pages to have speculative/transi=
ent
> refcounts?

These speculative refcounts are taken into account, in case of unsafe
refcounts, conversion operation immediately exits to userspace with
EAGAIN and userspace is supposed to retry conversion.

Yes, it's more easier for shared pages to have speculative/transient refcou=
nts.

>
> [3] https://lore.kernel.org/lkml/d3832fd95a03aad562705872cbda5b3d248ca321=
.1747264138.git.ackerleytng@google.com/
>
> > >
> > > Another reason to avoid relying on refcounts is to not block usage of
> > > raw physical memory unmanaged by kernel (without page structs) to bac=
k
> > > guest private memory as we had discussed previously. This will help
> > > simplify merge/split operations during conversions and help usecases
> > > like guest memory persistence [2] and non-confidential VMs.
> >
> > If this becomes a thing for private memory (which it isn't yet), then c=
ouldn't
> > we just change things at that point?
> >
> > Is the only issue with TDX taking refcounts that it won't work with fut=
ure code
> > changes?
> >
> > >
> > > [1] https://lore.kernel.org/lkml/diqz7c2lr6wg.fsf@ackerleytng-ctop.c.=
googlers.com/
> > > [2] https://lore.kernel.org/lkml/20240805093245.889357-1-jgowans@amaz=
on.com/
> >
