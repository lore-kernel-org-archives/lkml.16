Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B67221505C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993336; cv=none; b=s86oTNZgBngs0x82UTs6zAXw5r3j9qcxRvOiUy/XzStQSfdgEa2xqJs45srVGBNcSoy+CeVajNMSngd3yE63cekgd1xH73SnfydIRTNDlImqOR7Jm4P0xgME5i+/M7/pPYsS/zTiNggiVuJILmRdfPUbazVRLn6XOVnryS6WUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993336; c=relaxed/simple;
	bh=Xaqjq8y6sGmO1ZUk2didNrSa73aZGxUDMzs+j+Zi8/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nuXhNCWWeWXgGGzx9tdJSARqM4Z2fN9LHkX4wnCE8JAn3nZ3MSEnCIb1MUReTxPZuWjCkEMH9DDrjc8srJVM0/YY7/iFvx2MuHBNdO0POJigjUFCdhGTHPCNAZ6Bu+zqXmKlnGOcQ/dOQirzk6Xqmv4kzCsyf0gx2QqlIQkqCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dloq/+KF; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dloq/+KF"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af570998077so1593824a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744993333; x=1745598133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1pjtyBfSlLKyL/NS0nFvpCvZz0n/zUmSG0nruCRN+Q=;
        b=Dloq/+KFdEApVpqRrbhvgPKsQg9NjrQXeSav8hNK5eD3hOrlZxastwt84tbwGSL5RH
         d38YL+VqiM7yiuX6R3wC8mVm/YcohiM9CyGUn47pmfuZkBJtuwC+TLq/Fm2R8r/j9z37
         6plZGoy2c0P+L97tT9oIb9LIY3/hFrnZtK+S6EEhOON4UsDhxtfA/2CbtSWf07RkJJ8q
         UTmY2QEGy+NJ0JH/T36jYwG0BTjePOxQk5dN3vXBbTIShxq9X/QF/CtzrHz+wDlQtMpR
         jaU5kPz8CMWRouCGoBQU9Ou4rB1UirFDIHf4F/gMsbrbvSxY0GTi9gQhdKz+oOzePOR0
         8oLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744993333; x=1745598133;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1pjtyBfSlLKyL/NS0nFvpCvZz0n/zUmSG0nruCRN+Q=;
        b=b504xnEGKTceeNOPnh2555VdMBv2N4IZ53f7U+TciXSPlcN81nWIoDRIg8s3Ref7+j
         yyTPVWje5E/9omrllA9610F+sHr3EG5bUg3d+6/EUdnZ0peWc+kMBdUB9M9czPAHr2pr
         n7ADFhZSincq7Y47EZ7L60Dcf1EwPZM2cpEac970bE05iClv0E18IgorFPXEUwZE9Ryd
         tYyT5wS6Pp9btMj6v+LL4SFcOoQLHjSj5zN0qfNpyK2uDqZkp8ErgLyhNaKG0j4UXI3+
         W+6zvN6ALjJSoa7SlPfP8bg/zFGwJzymmJyxjtwl7h3aHy+XXBs/8Qj7yaKGLEKXtr9r
         Meag==
X-Forwarded-Encrypted: i=1; AJvYcCVCNdrvuvWbc6ukIMisg3kQuiCbju5cQ1oDTx49vVUuzIXRAAUD6bPO5ZfwTXgBJnhGgabcn8fcCTxjiN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMMZqe85QJu6yfqc4ocvpni4eFk0YymIQR8g4FtZRM0iNUi1W
	mfOlX59/X8z4ODARGkBd+PDsiJlErpAzQu2iEqAPaTaDUWGyrK5C1AxjtfYkKMtuIFz2TjCERWv
	ppA==
X-Google-Smtp-Source: AGHT+IHqwNO/x37hOdGCk0YIJnSIGZEumqGvWSf5j1xktHt7N62gEkfdWFum/WCMhL+WKTL+rztUgYv0GjY=
X-Received: from pfx42.prod.google.com ([2002:a05:6a00:a46a:b0:73c:26bd:133c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bad:b0:220:f59b:6e6
 with SMTP id d9443c01a7336-22c5356798amr39350385ad.8.1744993333345; Fri, 18
 Apr 2025 09:22:13 -0700 (PDT)
Date: Fri, 18 Apr 2025 09:22:11 -0700
In-Reply-To: <6f070686a44225d36bc1086dc1643841b3d43d19.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <6f070686a44225d36bc1086dc1643841b3d43d19.camel@infradead.org>
Message-ID: <aAJ8M0Mm9bv7xlVs@google.com>
Subject: Re: [PATCH 00/67] KVM: iommu: Overhaul device posted IRQs support
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025, David Woodhouse wrote:
> On Fri, 2025-04-04 at 12:38 -0700, Sean Christopherson wrote:
> >=20
> > This series is well tested except for one notable gap: I was not able t=
o
> > fully test the AMD IOMMU changes.=C2=A0 Long story short, getting upstr=
eam
> > kernels into our full test environments is practically infeasible.=C2=
=A0 And
> > exposing a device or VF on systems that are available to developers is =
a
> > bit of a mess.
>=20
> If I can make AMD bare-metal "instances" available to you, would that hel=
p?

Probably not, my main limitation is time, not lack of hardware.

I'm confident I can get a functional AMD test setup internally, it'll just =
take
a bit more time/effort (there are other people working on the testing front=
; I'm
hoping if I wait a bit, someone will solve the hiccups for me).

I'd been holding this series since ~October of last year, precisely due to =
lack
of bandwidth to configure a working test environment.  I felt that I got fa=
r
enough in testing that the odds of something being _really_ broken are smal=
l,
and didn't want to delay posting for potentially multiple more months as I =
assume
other folks in the community already have readily available test setups.

And no matter what, I want to get more thorough testing on a broader range =
of
hardware, e.g. from Intel and AMD in particular, before this gets merged, s=
o in
the end I don't think me getting access to different hardware would move th=
e
needle much.

Though I appreciate the offer :-)

> Separately, I'd quite like to see the eventfd=E2=86=92MSI delivery linkag=
e not
> use the IRQ routing table at all, and not need a GSI# assigned. Doing
> it that way is just a scaling and performance issue.
>=20
> I recently looked through the irqfd code and came to the conclusion
> that it wouldn't be hard to add a new user API which allows us to
> simply configure the kvm_irq_routing_entry to be delivered when a given
> eventfd fires, without using the table.

Yeah, especially if we gated the functionality on a per-VM capability.  Tha=
t way
kvm_irq_routing_update() could completely skip processing irqfds.  At that =
point,
other than the new uAPI, I think it's just irqfd_inject() and the resample =
code
that needs to be modified.

> I haven't had a chance to look hard, hopefully your rework doesn't make
> that any less feasible...

Quite the opposite, it should make it much, much easier.  Currently, both
vmx_pi_update_irte() and avic_pi_update_irte() pull the GSI's routing entry=
 from
kvm->irq_routing.

After this rework, irqfd->irq_entry is explicitly passed into=20
kvm_arch_update_irqfd_routing(), i.e. it removes two of the gnarliest paths=
 that
expect irqfd to go through the standard routing table.
