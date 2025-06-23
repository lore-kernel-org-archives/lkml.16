Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1D257422
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697316; cv=none; b=AVE+uRi/uICMOae2pIv+oIEKkK1npzIaExdA8DMOqSKPZg/VXoAy5+lnYE0sfkfvFp2knxcc7EulCT18tv0RuqNyEqK/L45cy5RA+Ql/YwjGRune8d9YMtyffaGvtRKjdfkGtgrVkGSWfOoZOrR5fIenbT3rcx+Klk7aOiLgiZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697316; c=relaxed/simple;
	bh=Vh0K3JgybiXqh8bhuli73IwsyvXMrO6Lef7CPmI5wDI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bpVpYZR2g9YtC22aT0+cgdEXUl2y+CmSX8AmU50lrcdNoCMoojWzPFVybe66zLxsBP0gF0lD2jnn1wiXcECn4ABlp/VU55qlrqxObujStLhxHZEtRKavWlgM4RQWkArEq5sv8daGXnCZfbVTIZdT8MDldxPaCta2SbUTrkqKvB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1LymG4/E; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1LymG4/E"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so5485405a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750697315; x=1751302115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNsTl7o1kMR/XQbvyza/I69IGDpibUQIxWthc0R5kZI=;
        b=1LymG4/EM4gyDyP4t5tl2ZTcBZ4qP2jl/64qed6xXju3sXvf5ZvrUdWldzIhj4lDaQ
         LdFpsGKo6EkuPfytUV5+MtPPIP0O2TKVm+qNo5aHE9AKaTeunhtkxF7IFO8hu9N26a6h
         Xpx/7nWvqK3g5UkoCw7KMQ07P1lGxhJqCdBaq5F1HpQJZk5x4skjkxqRMs3GN11OZzXG
         U02L2UdZr5TUqsMTgJLhlnrTLmgCPgtzYyj3V0yx4UEzsktN3Ztp+3B6kAvFghKePTKe
         C4cwOaTwlOwAYCwgH3ttvRnANIlAO082Pvwb84BxuEdxcUVxW79JlMneCIFWWv+nriHD
         WwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697315; x=1751302115;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MNsTl7o1kMR/XQbvyza/I69IGDpibUQIxWthc0R5kZI=;
        b=Q8THDEmfQtWkLF+1bGRq+F+IdzyYvYYFstK4EGAGlBsx5na+aWLaNUoId4V/i4Loqf
         0wzrBgrcRuXmPzaZW4np/oE0athSD4LE3p6v8dsl3k8ucvyYsCwsE8TyOnoJa+Qe52V1
         jRk8vpx0N28OCkntUbqxYw+GMGqkg96h69zpY2SC+M4b/zAVPLNDVk9RcQ6PqHThhfp6
         p/mvQKzq9Qby3FXkeTW9V+PG9C8QqgxCUE2dDDy0tCcR0VffIXyi76EK0UxRIRwUICkk
         JvveCCE+Ak2ZswQIU5IbyZEUA8BiGdvAN+YWwcGAmFA2w0W0EG/iaLZQaVAgMRqUkWai
         W5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVExL0hQdIxvTGrkt7+kbzrVpEt5RCmzBC5rGe8gRa4L2Y0XtTn2TsRUqUBtPyV+81pfTtgMCaCnyOTjmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmX/zRw+QTTcR/Dh6tSYlpTWQJO1y8rUGdVaeCAjpD9wk8FFB
	kmccLAqI5zd1TIOv1alfW5fGuvB5qvbq67HzHQF/u/DnC94D7gY0XUEMl9sEcTit9X1VjPfLkZK
	IE6Wj+A==
X-Google-Smtp-Source: AGHT+IFb0LToMc4+oHvP1f0u0d+eBVoHOPu4uIjs79zNzocSTjaX1tNGgg2qHX7XgkL7ws8zyZ0c2z8q4fo=
X-Received: from pji8.prod.google.com ([2002:a17:90b:3fc8:b0:313:246f:8d54])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3cd0:b0:311:b6d2:4c36
 with SMTP id 98e67ed59e1d1-3159d8d6847mr16718135a91.26.1750697314798; Mon, 23
 Jun 2025 09:48:34 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:48:33 -0700
In-Reply-To: <7cc618b80681e8e1402c73886505f6247c810db8.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <e489252745ac4b53f1f7f50570b03fb416aa2065.camel@infradead.org>
 <7fedbeac-300f-48a3-9860-e05b6d286cd1@xen.org> <7cc618b80681e8e1402c73886505f6247c810db8.camel@infradead.org>
Message-ID: <aFmFYZlrxlLE2ZzY@google.com>
Subject: Re: KVM: x86/xen: Allow 'out of range' event channel ports in IRQ
 routing table.
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: paul@xen.org, kvm@vger.kernel.org, Ivan Orlov <iorlov@amazon.co.uk>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025, David Woodhouse wrote:
> On Mon, 2025-05-12 at 10:29 +0100, Paul Durrant wrote:
> > On 08/05/2025 21:30, David Woodhouse wrote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > >=20
> > > To avoid imposing an ordering constraint on userspace, allow 'invalid=
'
> > > event channel targets to be configured in the IRQ routing table.
> > >=20
> > > This is the same as accepting interrupts targeted at vCPUs which don'=
t
> > > exist yet, which is already the case for both Xen event channels *and=
*
> > > for MSIs (which don't do any filtering of permitted APIC ID targets a=
t
> > > all).
> > >=20
> > > If userspace actually *triggers* an IRQ with an invalid target, that
> > > will fail cleanly, as kvm_xen_set_evtchn_fast() also does the same ra=
nge
> > > check.
> > >=20
> > > If KVM enforced that the IRQ target must be valid at the time it is
> > > *configured*, that would force userspace to create all vCPUs and do
> > > various other parts of setup (in this case, setting the Xen long_mode=
)
> > > before restoring the IRQ table.
> > >=20
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > ---
> > > =C2=A0 arch/x86/kvm/xen.c | 14 ++++++++++++--
> > > =C2=A0 1 file changed, 12 insertions(+), 2 deletions(-)
> > >=20
> >=20
> > Reviewed-by: Paul Durrant <paul@xen.org>
>=20
> Ping?

Almost there :-)  I've got it applied (for 6.16), just need to run my gener=
ic
test stuff before making it "official".
