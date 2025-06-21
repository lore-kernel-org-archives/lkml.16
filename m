Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451EA18E1A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750474818; cv=none; b=B3J3KP8+3+fjC1EiCu1eekZE6OIxwkMYCffwzLs4PtbXlX44LrIrEa3Wy4+87qusZQVRzlasi+f5j8wYBGs7yRCUw6M5FM6HW8U6SrNqd0wuuepl7lR5abdnAT+oI6mtxRc8l3gyvGkZt6gSDMjecTr34vGOOzEmg6tqtA9Ox+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750474818; c=relaxed/simple;
	bh=2tE1AtBTKQpyhv7sb8Qnj3jxbXpTFxtQpYNHli3DIjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhWknhJ+BS5UbPKDyn5x+WoXd37qjTvhXmveD3PUa2iufaVDQieZW9rD9PfuWRZ5cDz4z9m5xIiAVFQSLVQ2vFSgYCsO/Ut3OFJTkdeMHzkiGbgyPVF97wv1jINL54U+C18y4b5yKmPovNPonbSpJZfKDFqaDC3SgGwxgUBwkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KKlnZLs+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KKlnZLs+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235e389599fso82385ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750474816; x=1751079616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tE1AtBTKQpyhv7sb8Qnj3jxbXpTFxtQpYNHli3DIjg=;
        b=KKlnZLs+k2Xb3JV1hw/wAeuBQZTjppFQkglRkCemzbSlVQ7LtX3dMZ9OZv/yIF8EB3
         Ta9QGL165XFLwDI7OYNot4Q/i/QpPEHIkDZSqMIY7BQPD4xNz5lG+L4CF+zO5E0jMdri
         Mcqn4BjZEiFGddBeRdE/RkwwdW+9xWW1SZGGs6iiwS1C2Ed5Kf/o+A7QO0JnJTktf86O
         46Dc30cmO2hT6lZdUin71ZU6QG+FBdjG0NPPYfI9macMxOMEA9PQALbtSgcbmR1pVaVh
         0KbGu8pS4dTnzQV/UwfiTarpKearyoHre2mo795PM915aWbifHSJGpf5qvMpR0KCT53m
         FD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750474816; x=1751079616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tE1AtBTKQpyhv7sb8Qnj3jxbXpTFxtQpYNHli3DIjg=;
        b=QhXvEwk7hqFMhDX6d1rXqT+9Fed6RLGoyNyyMV9dw5rob7ikTxVflwqVVp2flA4qAV
         FSPkFcn+HWVwcfutPx4jSDF0eZvg9VUvE+UALD555HnFnhpOFNNOju1jLOBy5O2tGel3
         mtdIGn5y6x55b5LyyI9ypCRhWlDSx2yGmIgUGMV6JSKYuHKQjoiwmBOAkQ/QEInkVOOx
         l0eE4S1ck6xkKk1zULEQUmiuNGMKi1YdCuh2W9gcqqBFpfyrWtA+HPccAiV7QE9vLXpH
         ugSgZvcPEa7FpgBzzifUFM/G49sq0VhFP69vopfXWn9KAuFhlURjH+v3T0pAIM1/HKMS
         zq3A==
X-Forwarded-Encrypted: i=1; AJvYcCU8a58RriN7JV4iygKmw0VvG3SvNJ94lgrWAVbXyLesxtLZfXeRWfvp1VwofHnfca+YWaKO68rrhhXy9/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy91SSIqYtY7/e+eSUIq2z0VnTuuH23OsIltUizgesh4q67DSKS
	FFj84sDw6VK8kcYtMlFE6o5regNpD21P7Pfe73nIVVE+RxugX0vI4R8PnhfiZ67+repZJ2Jyoll
	lrwV9RKar3HWEVFEmc9MLuzk8r87JeFPY3U4+0qpAuuOL3dOB+AjSh/sE
X-Gm-Gg: ASbGncsWof67p6pGa5BRXhxt0fGbYaSOImG7wHmJ704TMnu1FSbJzPHeUJ/T7Ye3O7R
	sUh/FMUEC3baNwFxMMnT2NtQMxd2NVv48XDhpcjXqsXjjD9yAU554i1Jlm9L8bbhbEZ9UYpDDep
	5JWp0S2yVD8WDHpAHfBPCj20cnsdGvNzLmWEmqyNOuEEuXSKj02k0ZNTRvtlGLCaiGJm01EeUyP
	uXa
X-Google-Smtp-Source: AGHT+IEY/aU0Se3+UYnj+WojsdQuNKOtyTP6W5LG+7i31rI/DUUVlsgJfuulY/SHNY57G65ZfdkmmtcznbVPvG7egDY=
X-Received: by 2002:a17:903:124b:b0:234:b2bf:e676 with SMTP id
 d9443c01a7336-237e57540d5mr628775ad.11.1750474815932; Fri, 20 Jun 2025
 20:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611095158.19398-1-adrian.hunter@intel.com>
 <20250611095158.19398-2-adrian.hunter@intel.com> <CAGtprH_cpbPLvW2rSc2o7BsYWYZKNR6QAEsA4X-X77=2A7s=yg@mail.gmail.com>
 <e86aa631-bedd-44b4-b95a-9e941d14b059@intel.com> <CAGtprH_PwNkZUUx5+SoZcCmXAqcgfFkzprfNRH8HY3wcOm+1eg@mail.gmail.com>
 <0df27aaf-51be-4003-b8a7-8e623075709e@intel.com> <aFNa7L74tjztduT-@google.com>
 <4b6918e4-adba-48b2-931c-4d428a2775fc@intel.com> <aFVvDh7tTTXhX13f@google.com>
 <1cbf706a7daa837bb755188cf42869c5424f4a18.camel@intel.com>
 <CAGtprH8+iz1GqgPhH3g8jGA3yqjJXUF7qu6W6TOhv0stsa5Ohg@mail.gmail.com> <1989278031344a14f14b2096bb018652ad6df8c2.camel@intel.com>
In-Reply-To: <1989278031344a14f14b2096bb018652ad6df8c2.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 20 Jun 2025 20:00:03 -0700
X-Gm-Features: AX0GCFvnKvhZ0bcNCqXM9xBLf2M3ohY0YJGRJxihyIJVNMUt217beDUhPiQye7M
Message-ID: <CAGtprH9RXM8RGj_GtxjHMQcWcvUPa_FJWXOu7LTQ00C7N5pxiQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Gao, Chao" <chao.gao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"Huang, Kai" <kai.huang@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "Chatre, Reinette" <reinette.chatre@intel.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 4:34=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2025-06-20 at 14:21 -0700, Vishal Annapurve wrote:
> > > Sorry if I'm being dumb, but why does it do this? It saves
> > > freeing/allocating
> > > the guestmemfd pages? Or the in-place data gets reused somehow?
> >
> > The goal is just to be able to reuse the same physical memory for the
> > next boot of the guest. Freeing and faulting-in the same amount of
> > memory is redundant and time-consuming for large VM sizes.
>
> Can you provide enough information to evaluate how the whole problem is b=
eing
> solved? (it sounds like you have the full solution implemented?)
>
> The problem seems to be that rebuilding a whole TD for reboot is too slow=
. Does
> the S-EPT survive if the VM is destroyed? If not, how does keeping the pa=
ges in
> guestmemfd help with re-faulting? If the S-EPT is preserved, then what ha=
ppens
> when the new guest re-accepts it?

SEPT entries don't survive reboots.

The faulting-in I was referring to is just allocation of memory pages
for guest_memfd offsets.

>
> >
> > >
> > > The series Vishal linked has some kind of SEV state transfer thing. H=
ow is
> > > it
> > > intended to work for TDX?
> >
> > The series[1] unblocks intrahost-migration [2] and reboot usecases.
> >
> > [1] https://lore.kernel.org/lkml/cover.1747368092.git.afranji@google.co=
m/#t
> > [2] https://lore.kernel.org/lkml/cover.1749672978.git.afranji@google.co=
m/#t
>
> The question was: how was this reboot optimization intended to work for T=
DX? Are
> you saying that it works via intra-host migration? Like some state is mig=
rated
> to the new TD to start it up?

Reboot optimization is not specific to TDX, it's basically just about
trying to reuse the same physical memory for the next boot. No state
is preserved here except the mapping of guest_memfd offsets to
physical memory pages.
