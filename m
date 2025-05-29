Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D63222584
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529079; cv=none; b=YsbNKnyN/lCnViL0h8AQTOCGgjOnGfSkWkiZIqhmhSiZvppX84UZ+bZDrQKRnDH0E9QDl6QEqfso15Gw/nNon/hbmoT4Id3hliNndswd/czv65odANhf/8+5btdG4Bgs6HXi+Eej1IGhvLwF+TVW7aRHyJUCWsWXjsmxmtbhJJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529079; c=relaxed/simple;
	bh=s50DIHBvTSTUoNZI5xejr/EgeAPMXXcRhvG3h1nQbS0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K7KKiPnBKWGmRWYOxU7iZMT3Iae2Jh5BWjhwKbhNHSaE2+vGZ5LSRmqxQiTdsjkNqUTD5Rf15gZjr4TMcFqtjzQm5Xcddbz0M0eK6TAaaJTHhDZtDfP3QvxFykZ/Llx5SRSvYH4k22huJD6A9HcNyHVzQR2P0Y55R0+v3knAGGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tDJMEU6j; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tDJMEU6j"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so845380a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748529077; x=1749133877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHYp1ck4xduERScXV3HMu0GhyVe2Ft9tD7XedzHEDSw=;
        b=tDJMEU6j83l9zIEDY8NnNAWKf85368lxCm6glm79JfAwgH51gadyg9ZQbOHpMxreuG
         e9e9SW6LD9SLIVZeNGlhbSDD4syY1lCqZr+NMiiDZhx5DF1LMPGF3n35OPtjd6vuVoGd
         UU1/LD9Bo9gTPQHjFUWcBkWKfkJMQtQzbsOvNUsP3Jhfl9tuybm9p47UriAyAXOtlt9z
         lP3IFwifz8PeldeHQItULLA1E3+UlofcT1i6Ear6iMwRtccrgldiCpVGTY68AFvB35LZ
         Aj+KG30QkZCItVcIEmoqA0gCZJGvzb+a5816M9tlWgeB3tYQSIQq2rtmmEoVkEPGe3hV
         +bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529077; x=1749133877;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BHYp1ck4xduERScXV3HMu0GhyVe2Ft9tD7XedzHEDSw=;
        b=Am3Z2q+KVnapaOH/yz7hpAheYC79X98xtMMK5haI098xH1aEd2G02RFaqVIR4IYGPA
         aOeFgpQaGOdcjkaV1uP8vWqdsTgIlV9lDUPLIV/spmzkNxQTHY3kFhTH/vSp/8uOwaOW
         8zXRhyWlGTYOUNCzV5iVZNhouVMcpk0taQkTW5w8slnSIxQMRris8row2U5fNR/LkrI3
         7yLuEXduR5O647jknisVY03iq7mPEtEjhWvSiwYIK60qFmJPJc0NenBkvYFZedYWCgkG
         yuxt8pFSk3QA451ajRoEeSj52oB5sJaKCUO3IJh/NYRcbPJ9fWFVtdeXIrZZ4Nn4QqQ6
         r/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeGM3BUZ/Wezoimn/32P2Zh+myZ4gm09YpjNQBZugy+5d930/OTaNf8KMwnP0OcC4SMzVgb2lqvnbf5l0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BgXlmXXzI92wlc/hlDoOiO/5Y2Dz0l+yjRvNHgSePIYBIPmf
	U0I6jR2akCslIQ+HPYSJuWOgqqdwPo7mWITgNxRnnR6kkzeIpl2wVvPlv67MrLq6lVFpKBezcUE
	33kWviQ==
X-Google-Smtp-Source: AGHT+IEAgn6mOFzpsqVl9r6+YOxIGAp0ixzr0nLW9znp+DUdsWzttRPnaKMYiSVLJxnM6GKQCDmm2skU950=
X-Received: from pjbpw14.prod.google.com ([2002:a17:90b:278e:b0:311:df47:4773])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3807:b0:312:639:a058
 with SMTP id 98e67ed59e1d1-3120639afe8mr6031771a91.27.1748529077444; Thu, 29
 May 2025 07:31:17 -0700 (PDT)
Date: Thu, 29 May 2025 07:31:15 -0700
In-Reply-To: <019c1023c26e827dc538f24d885ec9a8530ad4af.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519232808.2745331-1-seanjc@google.com> <20250519232808.2745331-12-seanjc@google.com>
 <d131524927ffe1ec70300296343acdebd31c35b3.camel@intel.com> <019c1023c26e827dc538f24d885ec9a8530ad4af.camel@intel.com>
Message-ID: <aDhvs1tXH6pv8MxN@google.com>
Subject: Re: [PATCH 11/15] KVM: x86: Add CONFIG_KVM_IOAPIC to allow disabling
 in-kernel I/O APIC
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025, Kai Huang wrote:
> On Thu, 2025-05-29 at 23:55 +1200, Kai Huang wrote:
> > On Mon, 2025-05-19 at 16:28 -0700, Sean Christopherson wrote:
> > > Add a Kconfig to allowing building KVM without support for emulating =
an
> > 		   ^
> > 		   allow
> >=20
> > > I/O APIC, PIC, and PIT, which is desirable for deployments that effec=
tively
> > > don't support a fully in-kernel IRQ chip, i.e. never expect any VMM t=
o
> > > create an in-kernel I/O APIC. =C2=A0
> >=20
> > Do you happen to know what developments don't support a full in-kernel =
IRQ chip?

Google Cloud, for one.  I suspect/assume many/most CSPs don't utilize an in=
-kernel
I/O APIC.

> > Do they only support userspace IRQ chip, or not support any IRQ chip at=
 all?

The former, only userspace I/O APIC (and associated devices), though some V=
M
shapes, e.g. TDX, don't provide an I/O APIC or PIC.

> Forgot to ask:
>=20
> Since this new Kconfig option is not only for IOAPIC but also includes PI=
C and
> PIT, is CONFIG_KVM_IRQCHIP a better name?

I much prefer IOAPIC, because IRQCHIP is far too ambiguous and confusing, e=
.g.
just look at KVM's internal APIs, where these:

  irqchip_in_kernel()
  irqchip_kernel()

are not equivalent.  In practice, no modern guest kernel is going to utiliz=
e the
PIC, and the PIT isn't an IRQ chip, i.e. isn't strictly covered by IRQCHIP =
either.
So I think/hope the vast majority of users/readers will be able to intuit t=
hat
CONFIG_KVM_IOAPIC also covers the PIC and PIT.
