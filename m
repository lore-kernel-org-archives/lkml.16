Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D12137E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454526; cv=none; b=SIQnpIx1ihXscikAoZ/LdontYNel7zdMYHcQwXdTPt6Brih/2hsICFeO+nij4ehqQhM3vkbNWHADYkcVXCXQeCqpCXGUgHrYE97Gyxn+faqBXnEqt/vaLK48QEOgXp1qQrxdtMYOBFlA8n1QDHh9uqVqCZW8I1Y+sydF2pmlSYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454526; c=relaxed/simple;
	bh=L1ecn8Y9NOV83HEMfX3X19e8U2tPunQpsGM2rhiinNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWTTgb47IwqQa+z2tH09FSBIWsmsnoy4yaarCWgN6eOp/17+FHPjmJyMuikPinJSQr1yLSCX/z3oJV4XrlHyfnxZVnHouk/WgneA+o5/QfoHjpCBwhuKsuIHuof9LQaeMv+Zz++KfJxkmR3hAyX7KgVu7xdspMmujbVT1HZVCl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j7P5cShV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j7P5cShV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2357c61cda7so14695ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750454525; x=1751059325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZ6fyBYRwb8NLMCE1iyqV7/OmIfJzXWHP/9vAp5jm8A=;
        b=j7P5cShVvbivwBQtDRjcF1ouVUI0aA9BFqEc6PkFGCRRVKJ2l+ChIE7b0gcrEPGrZs
         lAKSQvJlrwk7Xc/zSPvev0/vd0xas9zgVJdAX2+rCedtGMRsNnRVXyAAJtlq/wdTdmUd
         iZMduikgX0cXsa4+JTT2qkufzmk1xq1bXlStvjGKQTC9tjoElZz4rvXiqGa7xB27kzea
         yZxfM2c0VRcKJk/CGORJ66ey7uPUYuLHrW6d5+AEGLViF37MI5SrSbMp56P4zC7IZxEH
         +K07ArIarng3o73yMYqvis0ws9MnuuQVuLPX7IZPgboGkr0ppv6EbyjvNf1BThMyuSSM
         m2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750454525; x=1751059325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZ6fyBYRwb8NLMCE1iyqV7/OmIfJzXWHP/9vAp5jm8A=;
        b=XofSorrbgIZ6H/zLC0Sxrp4d/UHErGfyLgHOnA0LpbhcyXOk+1lB/789fNU0AbbhOt
         wdteC84v6s+mzVIWAZCXwx0MybvKD3hisLIyFarjLfgpl7oJ7M7yrwHIP0RbnVtHj086
         YEIrSA+mwpkRciEdY1vCp3hc1Nw/Sd/3ukAchivauQl+NgjZA0Iv83N0jpdyDhLNYQyj
         Ff7nBc9D7zqbZCZVGt/AzPU+s/uGZvHXgzuRE9gdR6vr2Z22gcGtE+K2oE5EB34Eyaf9
         x2v2mqR+/6ldPbMdClscy8fJh0C3HqGD6KjtN1RMFCRJ6m52xvwIDFn+r3CQ6R6jXJUb
         8pTA==
X-Forwarded-Encrypted: i=1; AJvYcCWi1FSd2sm4Misav+pLXmtrkwNSHnxnf0zDksJHQM6EMpyiyY14K4W2ZOWDN5nZtOk3uMzSYahD0Pcumh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ft8QlMGH8bgyKh7wuIj8YeMCQXrdRPNZO8LebGeq8+/E/o34
	ShAWyS2IruDhsQeEQWzMV9YDYFlzjpjYRYJe+bPF/xqgzdErk6XDZ6FK24egMFsOyeaURlSGWBO
	D0ryZu+q/85Fx5kD2MufUMB18EmitvGMNBvjT2PrC
X-Gm-Gg: ASbGnctumjB8qMCKvUkwSeimBUwGcno90cBDt5S/1/t63J9KigUtkJ4bvj7AkK9UTVb
	Daj0xi19/PxMup3JIuIMShjzYclGE/j5/kIXVtFQ63Ux22AoPLB1Zq7eSYqlTE7qcUQrmbzzwXe
	ftFynoTGK3hXtA/7DlGWUrpK47YDRe52Zgbho2zs5TfcThjNs97S/n1yT2VUvjafLTTS41S4r2M
	w==
X-Google-Smtp-Source: AGHT+IEhAijABev1ooBQkfRNbIkjNR/9RBhG89GC15CaC3tPY3bPJX4Y4pXZGCjBMtcu+SC/ixfrv8JPQEVVGpYgLC8=
X-Received: by 2002:a17:902:d4c2:b0:235:e8da:8e1 with SMTP id
 d9443c01a7336-237e481577amr762195ad.18.1750454524367; Fri, 20 Jun 2025
 14:22:04 -0700 (PDT)
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
In-Reply-To: <1cbf706a7daa837bb755188cf42869c5424f4a18.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 20 Jun 2025 14:21:52 -0700
X-Gm-Features: AX0GCFs9meOMY9_1Q9V3C3CdaLDIJcvn3mSwJRL8K7bYt2CzMsxYXXjpAvfDbXE
Message-ID: <CAGtprH8+iz1GqgPhH3g8jGA3yqjJXUF7qu6W6TOhv0stsa5Ohg@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Hunter, Adrian" <adrian.hunter@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"Gao, Chao" <chao.gao@intel.com>, "Huang, Kai" <kai.huang@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "Chatre, Reinette" <reinette.chatre@intel.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 11:59=E2=80=AFAM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2025-06-20 at 07:24 -0700, Sean Christopherson wrote:
> > > The patch was tested with QEMU which AFAICT does not touch  memslots =
when
> > > shutting down.  Is there a reason to?
> >
> > In this case, the VMM process is not shutting down.  To emulate a reboo=
t, the
> > VMM destroys the VM, but reuses the guest_memfd files for the "new" VM.
> > Because guest_memfd takes a reference to "struct kvm", through memslot
> > bindings, memslots need to be manually destroyed so that all references=
 are
> > put and the VM is freed by the kernel.
>
> Sorry if I'm being dumb, but why does it do this? It saves freeing/alloca=
ting
> the guestmemfd pages? Or the in-place data gets reused somehow?

The goal is just to be able to reuse the same physical memory for the
next boot of the guest. Freeing and faulting-in the same amount of
memory is redundant and time-consuming for large VM sizes.

>
> The series Vishal linked has some kind of SEV state transfer thing. How i=
s it
> intended to work for TDX?

The series[1] unblocks intrahost-migration [2] and reboot usecases.

[1] https://lore.kernel.org/lkml/cover.1747368092.git.afranji@google.com/#t
[2] https://lore.kernel.org/lkml/cover.1749672978.git.afranji@google.com/#t

>
> >   E.g. otherwise multiple reboots would manifest as memory leakds and
> > eventually OOM the host.
>
> This is in the case of future guestmemfd functionality? Or today?

Intrahost-migration and guest reboot are important usecases for Google
to support guest VM lifecycles.
