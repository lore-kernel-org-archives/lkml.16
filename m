Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9FD25B672
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210900; cv=none; b=KTejPJXS3ySj7VqZfBkA60jImTi30oCVem1wslVzU5X7IhHKgr2qrQDZazYhmnCJ6PVw5hJ7ETXJZM0Jkc6e0xYKpqNg2kuevY0TBXqtYuwUiyWLI0uyH+Y8Ga0Wg+IHaVikGuh2P226KNVMRCYR2waInRodxEy2hY22oHJUHt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210900; c=relaxed/simple;
	bh=2TtPvP50kSHzT7tkM6+GtK/X7cM/bySGkYO5MxVxTao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESVHPq0QNMiglSUQPoS/75vjiehJVLuPbHo7lgZQRdINBDXW3wkY+0QKYQi97bJOj2JA4xE2ZOXmDXM7T3hW8Frmqn/cjX8Qahqx6jGrMyoeSbQthBAzBZCSKRmuSJ9Ej2Dw/JzY1zA/aKUdT/3oniyX6JVP9h07Kbd26mW8Eak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2D4oJlIt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2D4oJlIt"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-544043a21eeso129e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739210897; x=1739815697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY81El80qf9jAQEoVg2pi4Od5P6ae28aqttIokpPNQA=;
        b=2D4oJlIt9JRMcFbY44sU4IwUsLMrCTgOrRlYs0diSktmU6+1LB6jluSBvapUvgnwsx
         8opV0GJK5Nn/LZaQOwZXYNz1HQ0N9Tlj6ZOTgry7NNYl7QxBwTxTwoE4dNC8sY5frFqn
         +6NyVnvZ0drUfIDGJhr2GCHasSeCuVm9Uqajhq+j7cfGEXNbbdfWnZYe6ZJAppALetV1
         gaTbhL6Y5hYsvT0KddD4C0pimU38uD+RXQj3W5wIye7GWRuEFskgsob9DQlQJy5H7Eij
         sKQairq1i3sWj9Gf9GTnyinNVzYMNdomOVUwdmaQGJw8J6p9d4odIq8OmcOW3doJGg/a
         hfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210897; x=1739815697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY81El80qf9jAQEoVg2pi4Od5P6ae28aqttIokpPNQA=;
        b=QPcehukI0NNt5ao5RyMhMLt7y5zRXwdH2+AGjCCwgQmP9SIzDhq69OpurQ5HliwBrR
         PClQCg+aFTE4dq+iHIbrhxE95Uo0c5dU62V96oFBZGFqx6mi+IXM/rHXkcBQ3sjGofbp
         J+aI4SbPkBz5XDRRm3gj6NBuBy33PHp0wgX3xzzcbY0xbR+CuwgV2JKnR0OJtnhv37kR
         XB+gxfCL3lbhGJbMOJXzeh4J7fHNCANf76OTAIo94p7jPPHLnzmHw0Ve7bRvuv3klKaC
         dnrGxRrckWRTB2gxKwmhI9TBdaHdJbiVtz3530N9MnPTarA/2OaJHz5LzJPaZ2eEd2I5
         UW5g==
X-Forwarded-Encrypted: i=1; AJvYcCUAMz7Ela0iGi5goIAN+wYH+h5s+WBB13Upc3ubjQcPePIlvAmoTyD1adSMXG1DSqh8LQUpErMRnfiD6eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxecY6qvLAnPTA+Yi/7ww22hrtjyuDKdIkxDcBRyHxKBrJ93kxn
	myaAdADzlZzfTRf9oKXxmlN5DudtN5gINeV9Ml/h/RmCT/vCs6Jfo4lxOkuZooH9u6EHWnQacbI
	PY/QkVNIPd90uXwiZfh1Ol9aF4YnFjCB5x3lV
X-Gm-Gg: ASbGncswGYn/N//T5xJQNahI7HZY53gu1TD7P1PcOrO04f8/BPhd7CQTSC2MHrFzwYl
	LAgMviSd8T25LAY4rVRtLePcVaO7jVYeA/tcfshacPorQzoUyJ7XeTkCw+Vg/tFrxapGzoz6Gvq
	pGq+dCdMSC3WNOj8AuySnA2KawTEAJ/Q==
X-Google-Smtp-Source: AGHT+IEQ0ef+m0AldXUWYxdphrWb1Y+cg1qk04ttfFfh49scXV0ClP0LU7xJYgLk7R8kmb1GlW+DJtnurcrGSpm+cjQ=
X-Received: by 2002:a05:6512:b9b:b0:543:e496:81d2 with SMTP id
 2adb3069b0e04-545045437f8mr414613e87.4.1739210896652; Mon, 10 Feb 2025
 10:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com>
 <20250206222714.1079059-2-vannapurve@google.com> <Z6YlTG3QV_Pv6nRo@google.com>
In-Reply-To: <Z6YlTG3QV_Pv6nRo@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 10 Feb 2025 10:08:03 -0800
X-Gm-Features: AWEUYZlh8FYiLO34fdk4pxnYTBPzAVvxgBUi3fK_ZQnbfSispqIxfJvp5sRmnEU
Message-ID: <CAGtprH8A8zLLPVUdRjy179Rn=MtwzSUk8UDbR+XPws2+J4h-hw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] x86/tdx: Emit warning if IRQs are enabled during
 HLT #VE handling
To: Sean Christopherson <seanjc@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, kirill@shutemov.name, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 7:22=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Feb 06, 2025, Vishal Annapurve wrote:
> ...
> > ---
> >  arch/x86/coco/tdx/tdx.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index 5e68758666a4..ed6738ea225c 100644
> > --- a/arch/x86/coco/tdx/tdx.c
> > +++ b/arch/x86/coco/tdx/tdx.c
> > @@ -393,6 +393,11 @@ static int handle_halt(struct ve_info *ve)
> >  {
> >       const bool irq_disabled =3D irqs_disabled();
> >
> > +     if (!irq_disabled) {
>
> Wrap the check with WARN_ONCE(), doing so adds an unlikely to the <drum r=
oll>
> unlikely scenario.
>
> > +             WARN_ONCE(1, "HLT instruction emulation unsafe with irqs =
enabled\n");
>
> Newline is redundant, the WARN does that for you.  IMO, it's also worth a=
dding
> a comment, because this is like the fifth time "safe halt" has come up in=
 the
> context of TDX.
>
> E.g.
>
>         /*
>          * HLT with IRQs enabled is unsafe, as an IRQ that is intended to=
 be a
>          * wake event may be consumed before requesting HLT emulation, le=
aving
>          * the vCPU blocking indefinitely.
>          */
>         if (WARN_ONCE(!irq_disabled, "HLT emulation with IRQs enabled"))
>                 return -EIO;

Ack, will integrate this feedback in v4.

Thanks,
Vishal
