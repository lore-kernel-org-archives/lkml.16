Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C9A47
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347362; cv=none; b=H1LZdppHT9NLOvs1bpCnkh7hh8WTdtv7wgsH47+bvjpb4E+8Qi1cw9mDjZeWr7B2B2RksixNUJayj7VtZzRMVgy1wrCK1UXqNFR0gQ5KMIZGho+n/NszW4EHUMnGMeInoawAI5pPUH/eyCq8RX/V1FZWg1uRV/MwLDeFLazdDdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347362; c=relaxed/simple;
	bh=VYqlj+Y3w6GrxsL/42ioSVNT3PVbnq2E31Nz6I6CgQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5HazrevTRuqYGVXQ0020Xa/OqrK73h8DYNS84mDjBRklYBYmpjlZnZ4V3ugm2v0o6dXETbGkBFjWp2ir5EOCm+Bv6ACd+1UGer6AOs1qEj0pOYuYBn5qFxZVUwA/uMi/YwFqhZwmw/KSsVAhsMUnSophGng8AeLs/HjsigSLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e3s5Xq0r; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e3s5Xq0r"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e389599fso134895ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751347360; x=1751952160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug5SHg66aGnCTuPO5TyvNH1aNiq24HsB7hp/dDRBT7k=;
        b=e3s5Xq0rbvkD+CxKqUc8VB0dID14p47RfNwXUF1BTUYJsMVPmHZGqRRg2DRswmHwVQ
         Tq7wfLik4ZUErGf12agWIH1PWeAFIDEbM9umNBcp87Nk2AzUWHb0EIUir4Rr6aeTdVnq
         3ULjW20N2q692pRNeFxXb7jVZafz98+6utaa464XhUg0gCeYjDHYYcHW2znD3ezoR1A8
         ugwebOJTNq1MsHxIqX+BkOzl3evIXZfO3+cr+xOUliT0LvQhx+ulHmCx7CFNNODslEdT
         oycdqcRcKgcWc4su9HSjdTiBlhcycrICT0WXovHx4gYE7F/4DHyxIKtOhovBj5DJ9/1c
         qLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751347360; x=1751952160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ug5SHg66aGnCTuPO5TyvNH1aNiq24HsB7hp/dDRBT7k=;
        b=lnNU9s810cxRiOdIEeKQR+dkiVsOsbnR2zodsNQiViUm2JCecVp0mFFZK09223BTst
         2DbpIds8T+V8OwQ+4iIKxXK0fFKd2DVu45lHFXh6gorwu2DypFnPUtxjDFria6jM4QDQ
         jyW1nitxE7+JgQPftEFNLMGA+mTx2YmaNdCM7lc3Phs1ON/me47uwSRlfWFIS30OSUx/
         VtvFBFiLQdat7PUfP6sCC6e389n7sjnTjS9OByDACTHz2R0wwAeAMbMaNu3GmP20tuRk
         E3890Zo0BRRHnPN7Og8TXrJiFXeGLekyxops0gsuaXGVJ5XsFe0Z5s7KDc3+lGzvNWy5
         2sbg==
X-Forwarded-Encrypted: i=1; AJvYcCXN2gSnSc8OKr2NZB0/ljK8P/eEUQgVgpsOHJ+SiB6RBaV8IHQqLkov3JHkxLzVYNJSuetJgL5EH6biVAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5cF+xEJazSvyMGy1IAtPz4ZJGNQx/X2LU2HJd/yEYL75YhfGi
	zhM6aLRNOZ/ZG89yo9oPW+ddkfDUh2sH1iES2OWhJKScilyG4P2/K6S/9nA05lpD7Ded3A3FmSQ
	9qERe3CpkTxKKFJSw0gmWoj4MOYILZmxBZh5dzBhN
X-Gm-Gg: ASbGnctKqp8z5w7WCecKVHmmp6C3oWfyjt1rRVe3sWj8KqXnIHapd+mKAWr6e5kDw1g
	nuRhn0D9CMkmnjE31EisIMIltFV7n812XhwDgkfTp7YaIIhHKY9NjjbHMOInOoJNHfdPMrapQr6
	dW7WNvpDKQdZJElmQ/CbEjf48wDX/7tWkx98tqoPqmYccrHgADA2nKfJdHBk08jVhjRfXsbOusC
	nC0
X-Google-Smtp-Source: AGHT+IGQ1LJkpXjCB3M6JsBjwHbg7F16Ktug72Dgl4yuUaJr657M2qrWBr6Ub2+QfnlBJIK3KOceKatIxx+yhG4pXjI=
X-Received: by 2002:a17:902:ecc1:b0:215:7152:36e4 with SMTP id
 d9443c01a7336-23c601d19bcmr1027895ad.27.1751347359848; Mon, 30 Jun 2025
 22:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a3cace55ee878fefc50c68bb2b1fa38851a67dd8.camel@intel.com>
 <diqzms9vju5j.fsf@ackerleytng-ctop.c.googlers.com> <447bae3b7f5f2439b0cb4eb77976d9be843f689b.camel@intel.com>
 <zlxgzuoqwrbuf54wfqycnuxzxz2yduqtsjinr5uq4ss7iuk2rt@qaaolzwsy6ki>
 <4cbdfd3128a6dcc67df41b47336a4479a07bf1bd.camel@intel.com>
 <diqz5xghjca4.fsf@ackerleytng-ctop.c.googlers.com> <aGJxU95VvQvQ3bj6@yzhao56-desk.sh.intel.com>
 <a40d2c0105652dfcc01169775d6852bd4729c0a3.camel@intel.com>
 <diqzms9pjaki.fsf@ackerleytng-ctop.c.googlers.com> <fe6de7e7d72d0eed6c7a8df4ebff5f79259bd008.camel@intel.com>
 <aGNrlWw1K6nkWdmg@yzhao56-desk.sh.intel.com>
In-Reply-To: <aGNrlWw1K6nkWdmg@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 30 Jun 2025 22:22:26 -0700
X-Gm-Features: Ac12FXyA-w-dfqDos41dPoFYviJkwnTyUL8ABtay1z3xRmiT2sgcPlBoMON2FnU
Message-ID: <CAGtprH-csoPxG0hCexCUg_n4hQpsss83inRUMPRqJSFdBN0yTQ@mail.gmail.com>
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

On Mon, Jun 30, 2025 at 10:04=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wr=
ote:
>
> On Tue, Jul 01, 2025 at 05:45:54AM +0800, Edgecombe, Rick P wrote:
> > On Mon, 2025-06-30 at 12:25 -0700, Ackerley Tng wrote:
> > > > So for this we can do something similar. Have the arch/x86 side of =
TDX grow
> > > > a
> > > > new tdx_buggy_shutdown(). Have it do an all-cpu IPI to kick CPUs ou=
t of
> > > > SEAMMODE, wbivnd, and set a "no more seamcalls" bool. Then any SEAM=
CALLs
> > > > after
> > > > that will return a TDX_BUGGY_SHUTDOWN error, or similar. All TDs in=
 the
> > > > system
> > > > die. Zap/cleanup paths return success in the buggy shutdown case.
> > > >
> > >
> > > Do you mean that on unmap/split failure:
> >
> > Maybe Yan can clarify here. I thought the HWpoison scenario was about T=
DX module
> My thinking is to set HWPoison to private pages whenever KVM_BUG_ON() was=
 hit in
> TDX. i.e., when the page is still mapped in S-EPT but the TD is bugged on=
 and
> about to tear down.
>
> So, it could be due to KVM or TDX module bugs, which retries can't help.
>
> > bugs. Not TDX busy errors, demote failures, etc. If there are "normal" =
failures,
> > like the ones that can be fixed with retries, then I think HWPoison is =
not a
> > good option though.
> >
> > >  there is a way to make 100%
> > > sure all memory becomes re-usable by the rest of the host, using
> > > tdx_buggy_shutdown(), wbinvd, etc?
>
> Not sure about this approach. When TDX module is buggy and the page is st=
ill
> accessible to guest as private pages, even with no-more SEAMCALLs flag, i=
s it
> safe enough for guest_memfd/hugetlb to re-assign the page to allow simult=
aneous
> access in shared memory with potential private access from TD or TDX modu=
le?

If no more seamcalls are allowed and all cpus are made to exit SEAM
mode then how can there be potential private access from TD or TDX
module?

>
> > I think so. If we think the error conditions are rare enough that the c=
ost of
> > killing all TDs is acceptable, then we should do a proper POC and give =
it some
> > scrutiny.
> >
> > >
> > > If yes, then I'm onboard with this, and if we are 100% sure all memor=
y
> > > becomes re-usable by the host after all the extensive cleanup, then w=
e
> > > don't need to HWpoison anything.
> >
> > For eventual upstream acceptance, we need to stop and think every time =
TDX
> > requires special handling in generic code. This is why I wanted to clar=
ify if
> > you guys think the scenario could be in any way considered a generic on=
e.
> > (IOMMU, etc).
