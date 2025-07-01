Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E61E1DF2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354021; cv=none; b=A3DyvmwYRnwVmOyFT1LGkgZ5oLEF17NhtZIm6bUwXP76DXklhg6YlbLmMJckO7J15u6takjNi/+I9n/mmN8qg/GGOjUpiA43h6BMahJGY83VHtE7EW6WjNIwgJu5x7btCx3Vbmz7vK050B0Uyh2jQLYOmLg230hZLHbnKpr2CB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354021; c=relaxed/simple;
	bh=fvdNtZFG98bTz38ZaID/Nl35em193wk9jbzh9oNekbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKIm5gUXhImWUzXX72A7dG1yQTh7HmT1OdtT6JozLoKF9r2n+X1vAOFL33+HxgbTAmOLwLWWBh9RCNBQ0CK3jmc+5LJAbwy8dA8Vt2nbVgKkxz5n2WKBb/KDqAtlUCKGGnSszIFm+pl3VrBIVqyCOdTZ1SjFrLKyqhZYV+ny9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RqAxwo5i; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RqAxwo5i"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235e389599fso152465ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751354019; x=1751958819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxL3VNZ4Zrs6oBZrgQg54Wx4zFWI9GcyhIpiUNXFiPo=;
        b=RqAxwo5i+jcJymCqsuxOiF5nmXrFWflOGLATFMFU2fzM5QSQIF5fUXTsjA6RmzK+Vx
         Acca1wojI5UzVkoD8cAyWonK4KMmSDUrN+oX7GznlZmc7LlmhmOVSAB5CtZ5Aklur4gH
         xWok9CsP7dE2Ij7NXbTiGsRZ+M3haq3ZG4Pcifgwh2b0kVq7tueb2xy/nuqrX1bFJq0V
         OuK1WbN26ydqfrw1rVhoJx9dz/mApuKc12oRLGgXaBa6SABxelJHNDYGmMX9kH5+NR6D
         Kohz9pIDIffi9aVNrLcKc/vsF0W3oeuMMvmpXPGYd5wycfv1LrT2RSpSAHgKSKWSBuQL
         9QOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751354019; x=1751958819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxL3VNZ4Zrs6oBZrgQg54Wx4zFWI9GcyhIpiUNXFiPo=;
        b=l2Ip5XVmrOOpuNwXHICCBR7VmiPn4QmPDHR0lAFl2JdgSzeboxl1laON4O3pHuL/Ll
         EGKrOy3zNoTRQTGDFpYy19p/8hyGjoprCRyA3JTbOqy256qP9ScIQGNm4n1pZ6LsKz2y
         66W/1a+SrQIL1RVYa0AYo4elasK98/96Cd9QPEt/M9jKTkWs+px89KhZxiQPhlo96uPP
         F5Vu/UE/jhIpTM4Od5GxewLXDeNYy092JcRINvUWJdA7yWD2DPUP60/6V3DjCNptAhF/
         mnRbIcdrCtr5TlvehgGPQjf6gq2x0EKxSb4NpQW6R6KsiXFhdA4leg9EbETot3FR3wbd
         FRfg==
X-Forwarded-Encrypted: i=1; AJvYcCUGSHT5oy9/TkFdgNU2Go8Tp5fv++gNNkabDL7g8t/6ysq1BAM7qScEBMwoKzTe6inUHiiTz0rzH9h/1ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIeuOItf6QWI36e60DBwlOKtPD4pH1+su7WaVAr7qn3rR734V1
	J47OQ/LSKZFBoyAMCGMjHuZiIvGUDNnqTEtJ+RlJRsfBa1EIC4vhZbNWzwgSR3Lh5uXgXyHw9s9
	MDZdmvkF1RHVGLAM6j71K6jeXtuvAJsX9DOxcfUm1
X-Gm-Gg: ASbGnctlC0AfW3qDRzZCo2P1bnY569R9AIkxUgE6c+SMaPX2xfle8voI7igRlVU7TFP
	hN0GHeVHVySMxFBlzYLSFjSIYCipQwPkzOGFvFjz85qhFBiGity2kge2P56hmDnRj6af6MfOC+/
	WfJn43WuplyRlvTgVb5AfeV/mkEGHAVFpp1nIsz1iKYhyciZ8QeznnxnieXN8rSwhrmtFt3h1BS
	UUm
X-Google-Smtp-Source: AGHT+IECig08eHKTTvf45dHSJaJUQDbe4/XeGRIpH9pZV9TKF+yYFATBI2QtHbYGZhiRR5ayYC8ekg+hNsS90nakNG8=
X-Received: by 2002:a17:902:d506:b0:234:9f02:e937 with SMTP id
 d9443c01a7336-23c601b0ca0mr1180985ad.25.1751354019225; Tue, 01 Jul 2025
 00:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <447bae3b7f5f2439b0cb4eb77976d9be843f689b.camel@intel.com>
 <zlxgzuoqwrbuf54wfqycnuxzxz2yduqtsjinr5uq4ss7iuk2rt@qaaolzwsy6ki>
 <4cbdfd3128a6dcc67df41b47336a4479a07bf1bd.camel@intel.com>
 <diqz5xghjca4.fsf@ackerleytng-ctop.c.googlers.com> <aGJxU95VvQvQ3bj6@yzhao56-desk.sh.intel.com>
 <a40d2c0105652dfcc01169775d6852bd4729c0a3.camel@intel.com>
 <diqzms9pjaki.fsf@ackerleytng-ctop.c.googlers.com> <fe6de7e7d72d0eed6c7a8df4ebff5f79259bd008.camel@intel.com>
 <aGNrlWw1K6nkWdmg@yzhao56-desk.sh.intel.com> <CAGtprH-csoPxG0hCexCUg_n4hQpsss83inRUMPRqJSFdBN0yTQ@mail.gmail.com>
 <aGN6GIFxh57ElHPA@yzhao56-desk.sh.intel.com>
In-Reply-To: <aGN6GIFxh57ElHPA@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 1 Jul 2025 00:13:26 -0700
X-Gm-Features: Ac12FXz5n0nRXiv5tX1uPxgTYg1ZNQypYDgTfnT8A352KSP8Co9WwSmcusOKr6w
Message-ID: <CAGtprH_GoFMCMWYgOBtmu_ZBbBJeUXXanjYhYg9ZwDPeDXOYXg@mail.gmail.com>
Subject: Re: [RFC PATCH 08/21] KVM: TDX: Increase/decrease folio ref for huge pages
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>, 
	"Shutemov, Kirill" <kirill.shutemov@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
	"david@redhat.com" <david@redhat.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "tabba@google.com" <tabba@google.com>, "Du, Fan" <fan.du@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "seanjc@google.com" <seanjc@google.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Li, Zhiquan1" <zhiquan1.li@intel.com>, 
	"jroedel@suse.de" <jroedel@suse.de>, "Miao, Jun" <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 11:06=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wr=
ote:
>
> On Mon, Jun 30, 2025 at 10:22:26PM -0700, Vishal Annapurve wrote:
> > On Mon, Jun 30, 2025 at 10:04=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com=
> wrote:
> > >
> > > On Tue, Jul 01, 2025 at 05:45:54AM +0800, Edgecombe, Rick P wrote:
> > > > On Mon, 2025-06-30 at 12:25 -0700, Ackerley Tng wrote:
> > > > > > So for this we can do something similar. Have the arch/x86 side=
 of TDX grow
> > > > > > a
> > > > > > new tdx_buggy_shutdown(). Have it do an all-cpu IPI to kick CPU=
s out of
> > > > > > SEAMMODE, wbivnd, and set a "no more seamcalls" bool. Then any =
SEAMCALLs
> > > > > > after
> > > > > > that will return a TDX_BUGGY_SHUTDOWN error, or similar. All TD=
s in the
> > > > > > system
> > > > > > die. Zap/cleanup paths return success in the buggy shutdown cas=
e.
> > > > > >
> > > > >
> > > > > Do you mean that on unmap/split failure:
> > > >
> > > > Maybe Yan can clarify here. I thought the HWpoison scenario was abo=
ut TDX module
> > > My thinking is to set HWPoison to private pages whenever KVM_BUG_ON()=
 was hit in
> > > TDX. i.e., when the page is still mapped in S-EPT but the TD is bugge=
d on and
> > > about to tear down.
> > >
> > > So, it could be due to KVM or TDX module bugs, which retries can't he=
lp.
> > >
> > > > bugs. Not TDX busy errors, demote failures, etc. If there are "norm=
al" failures,
> > > > like the ones that can be fixed with retries, then I think HWPoison=
 is not a
> > > > good option though.
> > > >
> > > > >  there is a way to make 100%
> > > > > sure all memory becomes re-usable by the rest of the host, using
> > > > > tdx_buggy_shutdown(), wbinvd, etc?
> > >
> > > Not sure about this approach. When TDX module is buggy and the page i=
s still
> > > accessible to guest as private pages, even with no-more SEAMCALLs fla=
g, is it
> > > safe enough for guest_memfd/hugetlb to re-assign the page to allow si=
multaneous
> > > access in shared memory with potential private access from TD or TDX =
module?
> >
> > If no more seamcalls are allowed and all cpus are made to exit SEAM
> > mode then how can there be potential private access from TD or TDX
> > module?
> Not sure. As Kirill said "TDX module has creative ways to corrupt it"
> https://lore.kernel.org/all/zlxgzuoqwrbuf54wfqycnuxzxz2yduqtsjinr5uq4ss7i=
uk2rt@qaaolzwsy6ki/.

I would assume that would be true only if TDX module logic is allowed
to execute. Otherwise it would be useful to understand these
"creative" ways better.
