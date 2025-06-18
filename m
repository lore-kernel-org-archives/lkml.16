Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B861EEA40
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750221008; cv=none; b=ZR2TabjcSVbhigtPRKbAf5WI/HPvEOCw/OIuHNPHO1hX6ZwfiAmkh20Z22KmVxGc/2SF9t/GKZMuwU6EZdlhHQOhqB7RcvBvKj3xJOKJYLy6OS9cApIJRAYDupvrI8d5oxTMfIPaMJzFnrmwsyFjqPpV3bOJlAQ1r02f8D5sFKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750221008; c=relaxed/simple;
	bh=cnv5GjxdyHGoyq43lEWSP0hI3toA2+qDDGt22eNajzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZXTSW/TlK6MNO9RQ8FMdwapY3r02891ShzWmRO1xsQX8Thx6VWDDX57LRb0V0HwAQoEQ+fiqLXEndmkvzgC/FgoiQ83NhhAK4OTT/NuUkw6jGVQWQ5Z64dB3SIDCSF9pMpAdkYDiJUtrTPB0yZJAThitGMJYAFfZbghNV2FsQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9DmlquM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9DmlquM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2357c61cda7so53925ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750221006; x=1750825806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnv5GjxdyHGoyq43lEWSP0hI3toA2+qDDGt22eNajzA=;
        b=i9DmlquMZgx1pcgbefFkrNwNb4RXUM+NrdsokD6UU2LEn2eopLIxeVrskqV2t/oFRt
         Fl47ibafkotwZLXWSVAtqJ8o41CFbZe8VlymQfjShDuCD+8WPYdNGj5ia4iam3vF5Bt+
         unTbz8bDNXmBsT4DscKcRsd/rZ34ag3fbaJGhohtWXLamV6hh7RfZjA9JqEsmumrAI26
         FoNHipjGH7KD0Rd1ed2U8gUVblGSNChhORekUIacuAS5FiADVm2zgR8ROQ5q5qu8DTZ6
         EIZrX1LyA/Oe/V6jdNHQ67XFOaKaABi/ZU9C3tr19TM+D1xTfapEO2MR6OxnhvFZK3PZ
         T70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750221006; x=1750825806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnv5GjxdyHGoyq43lEWSP0hI3toA2+qDDGt22eNajzA=;
        b=DDlUuwNaYqEp3w/c2qiJZqtjskk0MrDPwyBSOV1vnu1F/11YH9a0jNoLMUeqDl2COI
         2AE9klXuKCEOI1pbL/tUZXFPBKvQGA/t8YeDuewCyrFTgOaY5xfNb9QfYL+zc9oGIEQV
         PSrSnY5lnM/2xDZcdo/6vwR0Zl2p12nX09B3TT5w8ItKWj2WwM070NcTJIpNyo82I8D5
         NLJ2wsn97Y2k3OYT/8lKdgaLWKyW1OzIxKWxrjk9xbUy9UrVUNLbbyeh2phMToG+Xmfi
         JzLQk19RMU9vuaCgkIgqntqbj4A1KMByga5FlM+W0AEud+R1Uznzepq1Gy4QvOnRvN6t
         LybQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsNPsXXo+h4JHukgZ4CsnmjrW2BYJlrNK/ZuQCj24CaUL4lw/OmKm1bpEB+e91830jORbyfHUrIq23F9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85ZiZlCeFNsecEdk07uRBpqWb2Y9fCA8jzlif9nurpi23AWcH
	GtoKnwEtrXcbhu7rmBrHFGASum6y8K492cfHADhsYRJEBef/gtYVdHWIS8ppEIkOn+Yb1/Cz6LO
	QJ2r174wM5LA2rc1DBk9eD5Zol33VXxpKRYeuPOHv
X-Gm-Gg: ASbGncsKvLvVRbrxqjN8OBnk5BVVo7iU7bvWT8KXVpy4toQsGGcj/7uuYWIhhE5PlQO
	19IlfSiex0X3Z/v5xSzl9aH2wbDSf79pVJZtk4HzOQECes5FmD6NG8v5Zft5qDocxzAulMxfRLE
	WbwyFZc1dYlosQEUR8BGLK0cbJkDn+TBArNwgE+jck8A==
X-Google-Smtp-Source: AGHT+IENELLSP/KcmKf1YptjAsIx1HMJDAYb2Ftt72/p7SVdYp9EhZgkn3LCbd5fFy0ZwqhHKjnrwVeMBk5uqkAQewc=
X-Received: by 2002:a17:902:e851:b0:234:bfa1:da3e with SMTP id
 d9443c01a7336-2366eda3120mr9916775ad.5.1750221005430; Tue, 17 Jun 2025
 21:30:05 -0700 (PDT)
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
 <8f686932b23ccdf34888db3dc5a8874666f1f89f.camel@intel.com>
In-Reply-To: <8f686932b23ccdf34888db3dc5a8874666f1f89f.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 17 Jun 2025 21:29:52 -0700
X-Gm-Features: AX0GCFu4yfcPomAipNAsT3_NOzA6y8clKhCXIj9a5E78JCdL6Xy_5HOXIDslwKM
Message-ID: <CAGtprH_RaZ9aTB-da1rzjXYZhLvLViAWfALJz3dojqjH2eSgmA@mail.gmail.com>
Subject: Re: [RFC PATCH 08/21] KVM: TDX: Increase/decrease folio ref for huge pages
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
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

On Tue, Jun 17, 2025 at 5:34=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Tue, 2025-06-17 at 01:09 -0700, Vishal Annapurve wrote:
> > Sorry I quoted Ackerley's response wrongly. Here is the correct referen=
ce [1].
>
> I'm confused...
>
> >
> > Speculative/transient refcounts came up a few times In the context of
> > guest_memfd discussions, some examples include: pagetable walkers,
> > page migration, speculative pagecache lookups, GUP-fast etc. David H
> > can provide more context here as needed.
> >
> > Effectively some core-mm features that are present today or might land
> > in the future can cause folio refcounts to be grabbed for short
> > durations without actual access to underlying physical memory. These
> > scenarios are unlikely to happen for private memory but can't be
> > discounted completely.
>
> This means the refcount could be increased for other reasons, and so gues=
tmemfd
> shouldn't rely on refcounts for it's purposes? So, it is not a problem fo=
r other
> components handling the page elevate the refcount?

It's simpler to handle the transient refcounts as there are following optio=
ns:
1) Wait for a small amount of time
2) Keep the folio refcounts frozen to zero at all times, which will
effectively eliminate the scenario of transient refcounts.
3) Use raw memory without page structs - unmanaged by kernel.

>
> >
> > Another reason to avoid relying on refcounts is to not block usage of
> > raw physical memory unmanaged by kernel (without page structs) to back
> > guest private memory as we had discussed previously. This will help
> > simplify merge/split operations during conversions and help usecases
> > like guest memory persistence [2] and non-confidential VMs.
>
> If this becomes a thing for private memory (which it isn't yet), then cou=
ldn't
> we just change things at that point?

It would be great to avoid having to go through discussion again, if
we have good reasons to handle it now.

>
> Is the only issue with TDX taking refcounts that it won't work with futur=
e code
> changes?
>
> >
> > [1] https://lore.kernel.org/lkml/diqz7c2lr6wg.fsf@ackerleytng-ctop.c.go=
oglers.com/
> > [2] https://lore.kernel.org/lkml/20240805093245.889357-1-jgowans@amazon=
.com/
>
