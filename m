Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976A218596
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721740; cv=none; b=tg+hFHm1ju0XX3aRDFH4qVPFtVy+0eksqYme1olxpfwJcx8nf7XG67Yqu866t3YCTQyEiXEwX2lWjPwIBCQZEOC4Fjbw7q5+rW3l/H0IMkvhXPpmF/KY7P6tR3W/5raIgxyeKNtFPnzYuGLufV9vWnK4qW5SFdiunsZTOnzipA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721740; c=relaxed/simple;
	bh=m1HKbq78Us6LvTsFYq7f5GyQZbgKEbFCUsF2gE7tF5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFo705fwuTH7rQe0//0aWiH51UKUdrmp7ihI4rFwiwPq/5ji8laIfTlFzsj7m7SjiTd1GSyUINQaPdWisFEamYA9y5WlQQ8/dSvpw6iY5L1BPIlP88JtXkMpPj5hhoqn43UD+q7/yy9cQ/RkkClyV7FB2BWQk2TbhQNq25RQXLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HDipr21A; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HDipr21A"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-237f18108d2so66255ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750721739; x=1751326539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJZykzRp9XmGyR+bnKu4AsjxXNvJ484o746cN0kGIOw=;
        b=HDipr21A5OiM5dG3t/ElumqU3x0U5We13tG2lNXxvfXvvibRm0E3v04ilyrng9bDMf
         fYQbffjTFdOfdfx8ivQx/yCtmQxOb4q6l5zTL6NZXqnoW95GK0HXTYcDcjWpioBtVPnJ
         HllmrQBxvgxNGii8siXP/cAMiNoHxxIvSSk/w27rhqD6L5qyKvYjWd4JdIb7VXBqsIKx
         fxIkB5OizHyfhVdd382VAhn+qk35qw4CVS81d+6vlANtvAsOJO1WVTy+30m5o3Wn9QOP
         KZQWdS0YUo1nwnfA2Qx9agkY6w6Tm7ppuXwC48pOy6kMtZp8b9DlMkowXltUdXQRzAne
         hRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750721739; x=1751326539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJZykzRp9XmGyR+bnKu4AsjxXNvJ484o746cN0kGIOw=;
        b=SLvyFyf7FWmMW5t2YQt166FaZqohe4pSwjlWYCTGR+GMFqusPguNK+jLoCYlmHhfWE
         tniOI8+6pdiH65G7L3HwDb6/kHqa3fCUmqd/EV8I86qzfNviRcOzKkam2gpw2Ed43j0S
         QMNjp9To8NukvEWxE9yAClWnld248FPd11npYgXLZT2YZXfFQ8NKwQa/vH1Bq3m5du8p
         OTDPj+oNfmPRFzVeh3gYrq64b6aJH/+8ihqwti9ikslzEflpMfdvIBX4h0Bli7GNnIsx
         /4K7GmsU5Nr0OgUkR2xSxkWOsWK+nwspHBy6cNVHLMxGn4CQ5bxL7HruNNG7kfluMWWG
         SIMw==
X-Forwarded-Encrypted: i=1; AJvYcCVJxYHo1T4nWNQKtw6/EctARSjh+2cKpBTQ6Q41l4Tse40Dyu4cUA5bY4OEEYC/QWOMpsByEx51YYwZ+1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsFBJpx6yNR5fGbrWRUvxeIJh76vbB/TI4oL1/wSMiSoxNFYjN
	M1AtufugFanoSryo+wXfxY2j8eEnpm/9/j0xotc3kl+r0wcEb6eOzL5QLsf4dYN5r4lBrbpEaBJ
	6Zf2632MXdVjKYfHrgZzr/YvxpgaEx0kMjMpx9poQ
X-Gm-Gg: ASbGnct1XHDhlvuaeTORF9ram2BnF4QrE7eO98DWpQGG347GN9246ZsL9jWCY1dIVty
	QQmaexs25HTdmdA4gJ8D3M9Mfmok+u7WdpNZQM+6P9/VZLujsDEUugDKuMBB+Uh9+z6jshGKZUF
	gffcAPeI0DRBUpe2N0KjZZNsj119chTfVgVUaebe0ByEW2A17pJ7eR9OARKYWmKBuEyaDVoBY1
X-Google-Smtp-Source: AGHT+IHHi7AieERcNnwiCtwAQr+c1gSn7f18Q5q/KjVn16GYv8KAYNJTic+iEGQjgx2v132Il9E3nwVRKB4urQHS71M=
X-Received: by 2002:a17:903:350f:b0:223:2630:6b86 with SMTP id
 d9443c01a7336-23803ec11aemr328645ad.7.1750721738376; Mon, 23 Jun 2025
 16:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611095158.19398-2-adrian.hunter@intel.com>
 <CAGtprH_cpbPLvW2rSc2o7BsYWYZKNR6QAEsA4X-X77=2A7s=yg@mail.gmail.com>
 <e86aa631-bedd-44b4-b95a-9e941d14b059@intel.com> <CAGtprH_PwNkZUUx5+SoZcCmXAqcgfFkzprfNRH8HY3wcOm+1eg@mail.gmail.com>
 <0df27aaf-51be-4003-b8a7-8e623075709e@intel.com> <aFNa7L74tjztduT-@google.com>
 <4b6918e4-adba-48b2-931c-4d428a2775fc@intel.com> <aFVvDh7tTTXhX13f@google.com>
 <CAGtprH-an308biSmM=c=W2FS2XeOWM9CxB3vWu9D=LD__baWUQ@mail.gmail.com>
 <CAGtprH_9uq-FHHQ=APwgVCe+=_o=yrfCS9snAJfhcg3fr7Qs-g@mail.gmail.com> <aFnJdn0nHSrRoOnJ@google.com>
In-Reply-To: <aFnJdn0nHSrRoOnJ@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 23 Jun 2025 16:35:24 -0700
X-Gm-Features: AX0GCFsjOjS73cim-nFdh51zPwjCo36e2glhCmQoTmB3B2V_KD4zts3ihFF816g
Message-ID: <CAGtprH-THz=odJ=yGKbr_exdy8_00FUGPir1g7pWOv6Ckt+h+g@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
To: Sean Christopherson <seanjc@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 2:39=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, Jun 23, 2025, Vishal Annapurve wrote:
> > On Fri, Jun 20, 2025 at 9:14=E2=80=AFAM Vishal Annapurve <vannapurve@go=
ogle.com> wrote:
> > > Adrian's suggestion makes sense and it should be functional but I am
> > > running into some issues which likely need to be resolved on the
> > > userspace side. I will keep this thread updated.
> > >
> > > Currently testing this reboot flow:
> > > 1) Issue KVM_TDX_TERMINATE_VM on the old VM.
> > > 2) Close the VM fd.
> > > 3) Create a new VM fd.
> > > 4) Link the old guest_memfd handles to the new VM fd.
> > > 5) Close the old guest_memfd handles.
> > > 6) Register memslots on the new VM using the linked guest_memfd handl=
es.
> > >
> >
> > Apparently mmap takes a refcount on backing files.
>
> Heh, yep.
>
> > So basically I had to modify the reboot flow as:
> > 1) Issue KVM_TDX_TERMINATE_VM on the old VM.
> > 2) Close the VM fd.
> > 3) Create a new VM fd.
> > 4) Link the old guest_memfd handles to the new VM fd.
> > 5) Unmap the VMAs backed by the guest memfd
> > 6) Close the old guest_memfd handles. -> Results in VM destruction
> > 7) Setup new VMAs backed by linked guest_memfd handles.
> > 8) Register memslots on the new VM using the linked guest_memfd handles=
.
> >
> > I think the issue simply is that we have tied guest_memfd lifecycle
> > with VM lifecycle and that discussion is out of scope for this patch.
>
> I wouldn't say it's entirely out of scope.  E.g. if there's a blocking pr=
oblem
> _in the kernel_ that prevents utilizing KVM_TDX_TERMINATE_VM, then we def=
initely
> want to sort that out before adding support for KVM_TDX_TERMINATE_VM.
>
> But IIUC, the hiccups you've encountered essentially fall into the catego=
ry of
> "working as intended", albeit with a lot of not-so-obvious behaviors and =
dependencies.

Yes, that's correct. The "issue" I referred to above is just extra
steps that need to be taken by userspace VMM and is still in the
"working as intended" category.
