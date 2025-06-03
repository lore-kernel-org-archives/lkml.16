Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2EA21171D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977217; cv=none; b=pMyffDLljExUlHOIuJkPmwX7eKsROgo3/T/9QLmivc1+hpCVQXcdxPJthjsJ+bMg20101rUk87gnN3cVIj60DOI9QLBFxMAYequNJin8peQhHXJck0j6bTYH3h3kb+Tx465CxXwc40bzO03XXFPBP3Inj1HA9o7Ms8nK5oiSNfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977217; c=relaxed/simple;
	bh=m5TJF0jIIbgCGQuk4aBQNxWcU+kLuEmnNdEOoqpXnrQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d3s2DX4Fdc05xXvAerLA1N46OTwGDVbIDqUxWUQjVyaoaDxJTirYGdHvjs/0hmPmEpLgask1YLfvMsyVJwds84u5tDt2ZlPaB7c24dowjh/wue1b/yHmns6b7YLvFt9+DzTJIX65wVOW3ilHPG9OXZnZCJiF8xQcQdwPMD3QiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WRY23oDe; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WRY23oDe"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so5937258a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748977214; x=1749582014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRI+kvPhnbWyNuALR5/UlU1wn44Og69LXb9THAFowqQ=;
        b=WRY23oDecMff6YNj6gN/NDeipVqbx5edVn6J0LA4PggtMeku73nQlull2jJ+yTfPLT
         vvrNc1IVgTnorA8I/vPtfrMwmamxNz6yqlL8mQKMXBoZ8QKLREUkqZMUaQkFrWu7uHW8
         Rclk0ZIrxtVo4nzFvtMg8jnbch5LG7C21H1aG60ksAAaHstakDQfGNxtPleJUJq/3ED9
         tS8vH3xpyNGRMDd8Ee16Ops4kOfF9z0wSteRhhAb2k0EzJqnGlUFbF/Gwo/YKb5AQ4n8
         FBl+ypc8rw5yLR6qr+RQvVDuOlZ0gJg3glAxgu6FZk9AZWHcPmFnKbFcDVhj2rmqIGVk
         7vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748977214; x=1749582014;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LRI+kvPhnbWyNuALR5/UlU1wn44Og69LXb9THAFowqQ=;
        b=j/yWZAnxEy/KVCs0HnVlszVZiDGc+zK+oKd4EcL/ZXzUrwnVjFhh8ipFkPCZhjmKi6
         QOqr5t7QMjkvNUHLZ3uHEVqik4RgS6DgaqgvsFQQR5cT78ND9JLA54kolxni9pU40TPI
         SXn20uZ9zoPMPEG0799ttEx6zdpJUXFdtImimNjXOzszwM93aHo2wI8zSSxAiIyMVjhc
         YjFre132tG4m8C91nJlXAzjtlJgnv+rbW7qm7CHTM6EgYXm5WegJr6W7EvGko1jrtDTL
         lk8ATKtZS3V9keTLLKv6QSbfjpLi9NyvmIP385LmrgeWT23Xmfq7Peq9PPqaMREW0fMJ
         j93Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9WkaV3721f2mC/9iswXvdxzLNb2llgu+EzBGbF/boxDprEMW3n23vC8qYaQyenniWI9onfK0VCPFxYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrYSDT11HlrmdcGLQz5aUiXjRrF3LTJb4BeeYebbM4YVnPa8Q+
	MvSh+XawTFeFwTLXWrQ/tmlg6KveeGza4XuBDOtTk8EvM0ZrdIkdn6heKpEzPdxTynKVGfjadyv
	yR7ic/g==
X-Google-Smtp-Source: AGHT+IFxfWW/66Xi/qsd8HDqTJ/6I2NynwNI53ATDTHnfVAav9b9q4IUuy06fJqORMG8yPjMT9M/PLVLHaw=
X-Received: from pjbsy7.prod.google.com ([2002:a17:90b:2d07:b0:310:f76d:7b8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2804:b0:311:e4ff:1810
 with SMTP id 98e67ed59e1d1-3130ccf511cmr257256a91.3.1748977214333; Tue, 03
 Jun 2025 12:00:14 -0700 (PDT)
Date: Tue, 3 Jun 2025 12:00:12 -0700
In-Reply-To: <CADrL8HWvYwxTvRQFzk33aaDLgnSzgBvCaTW_1vP-fBuaC_K4Sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602224459.41505-1-seanjc@google.com> <20250602224459.41505-2-seanjc@google.com>
 <CADrL8HWvYwxTvRQFzk33aaDLgnSzgBvCaTW_1vP-fBuaC_K4Sw@mail.gmail.com>
Message-ID: <aD9GPPz9U5JU89b-@google.com>
Subject: Re: [PATCH 1/2] KVM: SVM: Reject SEV{-ES} intra host migration if
 vCPU creation is in-flight
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Peter Gonda <pgonda@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 03, 2025, James Houghton wrote:
> On Mon, Jun 2, 2025 at 3:45=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > ---
> >  arch/x86/kvm/svm/sev.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index a7a7dc507336..93d899454535 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -2032,6 +2032,10 @@ static int sev_check_source_vcpus(struct kvm *ds=
t, struct kvm *src)
> >         struct kvm_vcpu *src_vcpu;
> >         unsigned long i;
> >
> > +       if (src->created_vcpus !=3D atomic_read(&src->online_vcpus) ||
> > +           dst->created_vcpus !=3D atomic_read(&dst->online_vcpus))
> > +               return -EINVAL;
>=20
> I think -EBUSY (or perhaps -EAGAIN) might be a more proper return code.

Yeah, I was 50/50 on EBUSY vs EINVAL.  I think I went with EINVAL mostly ou=
t of
spite :-)

I'll change it to EBUSY.
