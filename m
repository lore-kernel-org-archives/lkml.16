Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85D723C4F8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749853187; cv=none; b=bnYwPSBdUzU1Wnwh+1qI0nRBepE5DAdzpfmbgrSxzulxjCzm9tFYKGF0gbnX6rDhlKxILTjtLRZCZWiv9w/PRvGNq+4QfNmycCJaods9JfkF1C/C04j4ZEHTPpn1u7sMfIzxKJbcI0XTqQiFrzwFRrGf2OPU48U7OvMoFcUxO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749853187; c=relaxed/simple;
	bh=lGoDVzvZHtKjCoMFQ206RusFiNUukA7uRfeTM6a8MWo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bBeva59XRvHlQtxXiGTlnN1tX4AnmWK1UKcZrWFcGMI1MFa+hOEsy53f5QEVyB2G4Am/LUTfW5FPu2wHcyol5RK8llExEvhMyVlHuWpSiJJctzUP3aT7PL7o/mwwayXs3lSQ1zQgDRO9TE51zQitr0Mz2lWpS5hrn1l0FXKphWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MmXk1Wul; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MmXk1Wul"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235e1d70d67so22868155ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749853185; x=1750457985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42AUdUBGNQTAFRrD0wAu6CzQXCkmh1XLsLi6b5Aht+k=;
        b=MmXk1Wul0PmVd4ZueFYvuSydyu+r5vgFuzmB+/1nYa41k5C16NYgezOxpnKosYWFYm
         G0rdBR7S8o4nNa0sgXYP0MYRkfktX1MaPzAy/lA4AxOydImMi0QJ1LISojUfPZwN8YIF
         S88X6LJBvDqbDT1VfCNHwiwL+yS4nplBHEtHEK88STAElfATwNlFgqqQld+Fsbr6j+hj
         RyrEKA9P7z0Fjh2lZ0hESoDRwi55WeYl/TPxqBn/wfoEjYXKgq1veJsurbrk+Tv9ePT+
         C+GjD2xWxw6arSzoTT1a0WWCo58gFSX0b4zvF625Y8ImVeEEBfsoxjhISsLn2mGYLDvH
         4ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749853185; x=1750457985;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=42AUdUBGNQTAFRrD0wAu6CzQXCkmh1XLsLi6b5Aht+k=;
        b=L8GW83oDfpFFqilxy779J10zzCZzWe+3l7Qwzc5vUzs2w0ULzcjF0dkJuQfnoj176t
         UB/rS9LRVvDFjufMgQTXwT/3e3nEmM07iEd+QuX5YqjHxqAgeiQ3IntaFHuBJVut6sb+
         3IiHoIFmQxUMOqht2Ezo6KIGwjXjtLItSU4/YlU+7UvbARM7IiwvJ1S0sTJ18064TJN1
         /UpkQmUVVE9OHDLSc37Iwcjz/nYmSQ7PMZ3bnD10oY/B49bBcIUjq5sKEvblLobZEEXP
         OXQFm+9vBb4IistOwD5XmwyD3Av328S/+LDwS4iSE2NrK0I6Z0PeWD7GNmk9jL5PF7UF
         veMw==
X-Forwarded-Encrypted: i=1; AJvYcCUfhedzFSC3+v/WeZBukafhmlLAF9806eJFnTSOMO8TWI4H+cg92ar7oqgQjfct4tbA0+bbep3fIe7tuBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynJ5tK4aRzs0yN9gdy5mDUlBP7AUaNba0icZT0BB/EX+QomAlh
	oPUF+jtAeVAk9zt4BkVyakvKUYAAvFGR1u8aKFPyMjiR17zFERr2qAGk0pyoITntlpqrsn+Rqkm
	/H6NA6g==
X-Google-Smtp-Source: AGHT+IE1Pe0RJu4cqLiBIYibBuLTbUdnctxXUYFVnTNR3P30eWn3CrihLdjtpSzgcLHep2PJ7XxCHCYjSUY=
X-Received: from pjbsg10.prod.google.com ([2002:a17:90b:520a:b0:313:1c10:3595])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce8a:b0:234:d10d:9f9f
 with SMTP id d9443c01a7336-2366b14e571mr16937145ad.40.1749853185010; Fri, 13
 Jun 2025 15:19:45 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:19:43 -0700
In-Reply-To: <cbee132077fd59f181d1fc19670b72a51f2d9fa1.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aCxMtjuvYHk2oWbc@yzhao56-desk.sh.intel.com> <119e40ecb68a55bdf210377d98021683b7bda8e3.camel@intel.com>
 <aEmVa0YjUIRKvyNy@google.com> <f001881a152772b623ff9d3bb6ca5b2f72034db9.camel@intel.com>
 <aEtumIYPJSV49_jL@google.com> <d9bf81fc03cb0d92fc0956c6a49ff695d6b2d1ad.camel@intel.com>
 <aEt0ZxzvXngfplmN@google.com> <4737093ef45856b7c1c36398ee3d417d2a636c0c.camel@intel.com>
 <aEt/ohRVsdjKuqFp@yzhao56-desk.sh.intel.com> <cbee132077fd59f181d1fc19670b72a51f2d9fa1.camel@intel.com>
Message-ID: <aEyj_5WoC-01SPsV@google.com>
Subject: Re: [RFC PATCH 09/21] KVM: TDX: Enable 2MB mapping size after TD is RUNNABLE
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Y Zhao <yan.y.zhao@intel.com>, Fan Du <fan.du@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, Dave Hansen <dave.hansen@intel.com>, 
	"david@redhat.com" <david@redhat.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, Zhiquan1 Li <zhiquan1.li@intel.com>, 
	Kirill Shutemov <kirill.shutemov@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chao P Peng <chao.p.peng@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, "tabba@google.com" <tabba@google.com>, 
	"jroedel@suse.de" <jroedel@suse.de>, Jun Miao <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025, Rick P Edgecombe wrote:
> On Fri, 2025-06-13 at 09:32 +0800, Yan Zhao wrote:
> > > > Eww, no.=C2=A0 Having to react on _every_ EPT violation would be an=
noying,
> > > > and trying to debug issues where the guest is mixing options would
> > > > probably be a nightmare.
> > > >=20
> > > > I was thinking of something along the lines of an init-time or
> > > > boot-time opt- in.
> > >=20
> > > Fair.
> >=20
> > Agreed.
>=20
> Arg, I just realized a one-way opt-in will have a theoretical gap. If the=
 guest
> kexec's, the new kernel will need to match the opt-in.

All the more reason to make this a property of the VM that is passed via
"struct td_params".  I.e. put the onus on the owner of the VM to ensure the=
ir
kernel(s) have been updated accordingly.

I understand that this could be painful, but honestly _all_ of TDX and SNP =
is
painful for the guest.  E.g. I don't think it's any worse than the security
issues with TDX (and SNP) guests using kvmclock (which I'd love some review=
s on,
btw).

https://lore.kernel.org/all/20250227021855.3257188-35-seanjc@google.com
