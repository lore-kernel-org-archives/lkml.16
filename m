Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DAF20C000
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229089; cv=none; b=JsPotPsYLFrS2a02riyfrbvvvkiWNUeYNlJWGV0KI93e3xBgHksrW/13pzMDYkbC34+nz4YWoPF2lLhV+pUCb/Z82PSDPh4wdfqB2bYXY0y9GAB1a+a3ko+ljMdrV7YaIcggIAigw3N1L5q+pnH19pdweGi9vTsQusUf/Dm7fxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229089; c=relaxed/simple;
	bh=MnxMk8roYLNFFVxNqXyyb2UqDC+IhJnZOwPHT0hut5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfwQFhem/6QIQMn/5aDuzkdspb/WfaPzpMosKcPz0x1o/wT4sIJ2hwL8/B6c/lSHvdkn3SMQqR02N0xZdiaECLvKl5Ig2eAvHSdkBv8lfO9jCYZaRsR5JtMW4fqqW/p0TgHda90W+9k0Ofv8fFyPlrqJRJL8fw8BvHE/GmLHYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hLTjI7z1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hLTjI7z1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2348ac8e0b4so75325ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750229088; x=1750833888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnxMk8roYLNFFVxNqXyyb2UqDC+IhJnZOwPHT0hut5I=;
        b=hLTjI7z1F88tcsYEgbxfwsLXnN/sUx+ZR9iFmp/FdSygDu+o1YyWJtT59x99gNpdo2
         BZKtSbHDMvUG0ClOgqwD2cOF7WOzj4XuBFZXN6eY4P5j7BglAysLNdo7D4b308t1+jG1
         T6+eqLKc6YTof+MXF12XtAdW0U4saaIJpJTx+euPVHyHid0ZWlJWu/BRPiMr5gVMKrw/
         RRAbBIhjnAKjwXoqtCWbWyDAj1ySObLQL1L1rpOnxuqqzghhQd55wwNb6/K5LGbBSLJD
         pzeZbQTegesz/SjCYuNhZuiITZienWIEX0Q6Drh29P/uZx1Ib7aqjwPKGsz21V4m1OPg
         bemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750229088; x=1750833888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnxMk8roYLNFFVxNqXyyb2UqDC+IhJnZOwPHT0hut5I=;
        b=EqK6PO/SrVG/qMojXFlG1Ldhd/2nUzpFM55Q1l3e/qoC7mwfL6FiEp7dbCiuzv3iWG
         4quGddDRITHgMAIQjA4rXZMLwoAwX5o2tItTkrF1Xl5V6dOvH7wt0zBxsQtYrfdRTNLM
         BqbVnGvo7P1W6dJkFLFkJBgGBkUGv5G5WKovluw16vT3DpnzI9zwTM9p7/aUt+Lj8ZxJ
         YLJWF2K/cBC2Ts877T/HqsindpJdcedKREYxlTMlNyMUrHhoY4+78EeHFkE5tn44XCpG
         KlXpu10BkmJ2oyPyTI3xtzw++LXK4vWBBv2Nl4cF1+8xOdAn8UtZC583ZZ46SVoeDNrB
         y7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW8kQ3ceDYyihiRHUzTQjo7ljvgF4vDDvhKKM1R0pPyV8EAh2uNGHWFxqBW58ZjHxutflXFvh7kgeuw0b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGpy3l0cgz0leP8QVgCgEVxDJ0I7ACAlgtoqauHogRhSBoFi5a
	cvtK4wxvxfoRtZH/zh1GjLB2Rxfy7JQYKL+7A19MX35o8KXcFMSqbybtahvprA59Vpe5PVnUF98
	PKNcZRpTaNoWjKgOd1otdSkkk8DnO6BRk6K8MNAlH
X-Gm-Gg: ASbGncsinhebb4ijL+pDkE2uXspeTTA9fmdWzEmR9Z6jlNfpEnBN9cU79eY2OgCfYVT
	8r6sJz2z0m0Vgds8XypDAgdOfPoAE55xDulX1ddvu3aiMVd//eX23qJ4Y6VAYBh3T1xQ64XTfkF
	k6eUh4UQ7ZkgFioDafEoPeoejxnHGuvtX0jnzuOnHQIkUd4zKWjfdw
X-Google-Smtp-Source: AGHT+IEc904FWI+aBBaFjOlcFrOVx/ARP92eJTZVmuedtJfYq8uvoJ5C3kI/ct9/daWYevGOOp8HYMEqBWeyay0Fi8I=
X-Received: by 2002:a17:902:e5d0:b0:215:9ab0:402 with SMTP id
 d9443c01a7336-2366c82279fmr11342585ad.18.1750229087152; Tue, 17 Jun 2025
 23:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGtprH_Vj=KS0BmiX=P6nUTdYeAZhNEyjrRFXVK0sG=k4gbBMg@mail.gmail.com>
 <aE/q9VKkmaCcuwpU@yzhao56-desk.sh.intel.com> <CAGtprH_SKJ4hbQ4aSxxybcsD=eSQraP7a4AkQ3SKuMm2=Oyp+A@mail.gmail.com>
 <aFEQy4g4Y2Rod5GV@yzhao56-desk.sh.intel.com> <CAGtprH_ypohFy9TOJ8Emm_roT4XbQUtLKZNFcM6Fr+fhTFkE0Q@mail.gmail.com>
 <8f686932b23ccdf34888db3dc5a8874666f1f89f.camel@intel.com>
 <aFIMbt7ZwrJmPs4y@yzhao56-desk.sh.intel.com> <CAGtprH9Wj7YW-_sfGQfwKHRXL-7fFStXiHn2O32ptXAFbFB8Tw@mail.gmail.com>
 <aFJY/b0QijjzC10a@yzhao56-desk.sh.intel.com> <CAGtprH9WLRNcXWr1tK6MmatoSun9fdSg5QUj1q=gETPmRX_rsQ@mail.gmail.com>
 <aFJdYqN3QHQzMrVM@yzhao56-desk.sh.intel.com>
In-Reply-To: <aFJdYqN3QHQzMrVM@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 17 Jun 2025 23:44:34 -0700
X-Gm-Features: AX0GCFtiwvoRJbHWgS-76NIUD2dbTJ8utnoxdu3Kf7vjz4fEVoygUuUe9p_8K1E
Message-ID: <CAGtprH8_vR7ozfbmsTryJLRAKy06rc61zip2uw7cg_ptY01+zg@mail.gmail.com>
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

On Tue, Jun 17, 2025 at 11:34=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wr=
ote:
>
> On Tue, Jun 17, 2025 at 11:21:41PM -0700, Vishal Annapurve wrote:
> > On Tue, Jun 17, 2025 at 11:15=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com=
> wrote:
> > >
> > > On Tue, Jun 17, 2025 at 09:33:02PM -0700, Vishal Annapurve wrote:
> > > > On Tue, Jun 17, 2025 at 5:49=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.=
com> wrote:
> > > > >
> > > > > On Wed, Jun 18, 2025 at 08:34:24AM +0800, Edgecombe, Rick P wrote=
:
> > > > > > On Tue, 2025-06-17 at 01:09 -0700, Vishal Annapurve wrote:
> > > > > > > Sorry I quoted Ackerley's response wrongly. Here is the corre=
ct reference [1].
> > > > > >
> > > > > > I'm confused...
> > > > > >
> > > > > > >
> > > > > > > Speculative/transient refcounts came up a few times In the co=
ntext of
> > > > > > > guest_memfd discussions, some examples include: pagetable wal=
kers,
> > > > > > > page migration, speculative pagecache lookups, GUP-fast etc. =
David H
> > > > > > > can provide more context here as needed.
> > > > > > >
> > > > > > > Effectively some core-mm features that are present today or m=
ight land
> > > > > > > in the future can cause folio refcounts to be grabbed for sho=
rt
> > > > > > > durations without actual access to underlying physical memory=
. These
> > > > > > > scenarios are unlikely to happen for private memory but can't=
 be
> > > > > > > discounted completely.
> > > > > >
> > > > > > This means the refcount could be increased for other reasons, a=
nd so guestmemfd
> > > > > > shouldn't rely on refcounts for it's purposes? So, it is not a =
problem for other
> > > > > > components handling the page elevate the refcount?
> > > > > Besides that, in [3], when kvm_gmem_convert_should_proceed() dete=
rmines whether
> > > > > to convert to private, why is it allowed to just invoke
> > > > > kvm_gmem_has_safe_refcount() without taking speculative/transient=
 refcounts into
> > > > > account? Isn't it more easier for shared pages to have speculativ=
e/transient
> > > > > refcounts?
> > > >
> > > > These speculative refcounts are taken into account, in case of unsa=
fe
> > > > refcounts, conversion operation immediately exits to userspace with
> > > > EAGAIN and userspace is supposed to retry conversion.
> > > Hmm, so why can't private-to-shared conversion also exit to userspace=
 with
> > > EAGAIN?
> >
> > How would userspace/guest_memfd differentiate between
> > speculative/transient refcounts and extra refcounts due to TDX unmap
> > failures?
> Hmm, it also can't differentiate between speculative/transient refcounts =
and
> extra refcounts on shared folios due to other reasons.
>

In case of shared memory ranges, userspace is effectively responsible
for extra refcounts and can act towards removing them if not done
already. If "extra" refcounts are taken care of then the only
remaining scenario is speculative/transient refcounts.

But for private memory ranges, userspace is not responsible for any
refcounts landing on them.
