Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDEA4B1E7D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641363; cv=none; b=P01GuVMasCaow7dUS2G/VkLEtxNa2sBD8iaYDi/9utZUliH20Fgwe/rsENmhLGY27vk9gjWAuWCXKl7kp5OWH1qsvarkQr0feIxmSf+MImvpE/U4k8FOB5ImgV9vTnFYkJQsE9/5W7wcrY8yrkh8u9YUZTkp1b3hHlTjb1c0yAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641363; c=relaxed/simple;
	bh=lQ4/BCswLY2N6ECLgvBXDQzaCsv17BjUWUhLGOcibLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqHV7PhmdtcMUfJRfIQ0HQcw56fQtC4KO2SqFfa2Q38NKH9KNqKKuygIg93ypnSA1Rr/4y0+Si3uSYrxlEyp3tZ2DyxRFyWMAkeXljBE6fcMNeSNDY0sWZcA99RIHQYB+W9CPPDGP4kOp+vvwmNR71tfr0CwRXqywpQF7eGLDJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rStKx5bL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rStKx5bL"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso1609a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 11:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746641360; x=1747246160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DGYhlqnhJG9IoKCyCL2sxs3rFfiV5qz+wh+tcIQTEw=;
        b=rStKx5bLHJ7SDCmNWvbqMPV4jr4v6YM8zpoRthSoA9yqXkDnNUB9hG+aa1O57FyIo0
         pYeQFsPAm/JzuWPRAkO3y2NH/Uk74BSzjXFNbz/pjUBt8F5tr19lYGGtghHfKQZ1+WbI
         PZu52Lr6319AI0bzHpZbqlLUL9hnrW97E7RUsHwN7WnyEIfDKpSOAMAmXIe/EydIJHuC
         E3VWyBvT9qkk8QEx7rrufHZezY/RvfIGz8qaZv82Q6fZjVXdt2JpY/7keanKTwBBT2Sr
         vz39lYGxL9iwIIVawWGgUA+PoJjoVUVhkyQHjlPMPhhXAYQBygmEyhzdNRaK4ymEwkJq
         6w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746641360; x=1747246160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DGYhlqnhJG9IoKCyCL2sxs3rFfiV5qz+wh+tcIQTEw=;
        b=ibH9uMgJ+g0s4VmzfjwwRKmvWVQc85riPZI+/EROSpuoo5XU8GU3N5I+I5p/erVQhy
         sg1M3wL3s5gGqW0lCMdo2C4eQrtM78T/PGx0cTHPL+z9wvFGqbbkAgT9bWqX2nGlcuBG
         h1dMDZU0iP7g8nKgQTeMJFPD+huRN7tCaRZ/mnNlM154+Ds/679okhnF4lkwtecSUee/
         U6KT7Ht3JOLpT9aLQWlOBNNceFk7tPQuvS6Ig7wTlrICMqt8hmmUndJRunrlK8Y33mI0
         2Iy4BdNdxYAfoO9Lo41BqeUEvfQzpIZpFxFZ4xCEwIhkx6ylxHOYI5Y0ntRgjbnyTvfM
         Uagg==
X-Gm-Message-State: AOJu0Yy3uke0+QYHhoVZET/L9PZ53tz6zFt+vf487gzXM64M9JINz5wB
	u3fVc3e/B0UN0zju3A83dR99gekxiI8h/WoqSjV+v7EaeGkQrE0rMV0ye0o2WjylbBl33uDWfKG
	k+8p9ioagvkT8arEC2JzfXxlcJhPr143Gwy63
X-Gm-Gg: ASbGnctANxmhrXxF2hu1V4VTub30M+gG5tPrp4ZXBIQCePqrsi1wr7ozWidNitqwOZg
	avPtmvkaS1DFE4+/7hdgOu+dtGtR3t46vlN5n00xKF0U8bJFy+vugb+FapsuRLS4c2yzFgkdVCO
	cVN75ibmppdcQhvzhUP8S3DQ==
X-Google-Smtp-Source: AGHT+IHLyIW4SYxyzdVGXlCCl20CHuuL7wWu4P4uR2cnzBouEN9d60OobvKz09nUeA//tsiI+wAtivlg8OUAQTJa2d0=
X-Received: by 2002:a05:6402:1cb5:b0:5fb:eab6:cdb0 with SMTP id
 4fb4d7f45d1cf-5fc496fad85mr3038a12.4.1746641359723; Wed, 07 May 2025 11:09:19
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321221444.2449974-1-jmattson@google.com> <20250321221444.2449974-2-jmattson@google.com>
 <aBAIL6oGYJ7IV85X@google.com> <CALMp9eS7XHpFWMAtnJPQijYO1TVW25-UGmFqc33eAeb1AE_9YA@mail.gmail.com>
 <aBjoqW6qzoc2RGrZ@google.com>
In-Reply-To: <aBjoqW6qzoc2RGrZ@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 7 May 2025 11:09:07 -0700
X-Gm-Features: ATxdqUE9F2GnW6W5rwaaXZ00W92XYSfzH9aqeHskS5rstI1IG8xmlnI2OcXqaEc
Message-ID: <CALMp9eQBLj=Qh_70Xvbu9ZkYkWBd=yNgeG-zbvLa__F+d-+BZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] KVM: x86: Provide a capability to disable
 APERF/MPERF read intercepts
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 9:34=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, May 05, 2025, Jim Mattson wrote:
> > On Mon, Apr 28, 2025 at 3:58=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> > > index 88a9475899c8..1675017eea88 100644
> > > --- a/arch/x86/kvm/x86.h
> > > +++ b/arch/x86/kvm/x86.h
> > > @@ -481,25 +481,15 @@ static inline u64 nsec_to_cycles(struct kvm_vcp=
u *vcpu, u64 nsec)
> > >             __rem;                                              \
> > >          })
> > >
> > > -static inline bool kvm_mwait_in_guest(struct kvm *kvm)
> > > -{
> > > -       return kvm->arch.mwait_in_guest;
> > > -}
> > > -
> > > -static inline bool kvm_hlt_in_guest(struct kvm *kvm)
> > > -{
> > > -       return kvm->arch.hlt_in_guest;
> > > -}
> > > -
> > > -static inline bool kvm_pause_in_guest(struct kvm *kvm)
> > > -{
> > > -       return kvm->arch.pause_in_guest;
> > > -}
> > > -
> > > -static inline bool kvm_cstate_in_guest(struct kvm *kvm)
> > > -{
> > > -       return kvm->arch.cstate_in_guest;
> > > -}
> > > +#define BUILD_DISABLED_EXITS_HELPER(lname, uname)                   =
           \
> > > +static inline bool kvm_##lname##_in_guest(struct kvm *kvm)          =
           \
> > > +{                                                                   =
           \
> > > +       return kvm->arch.disabled_exits & KVM_X86_DISABLE_EXITS_##una=
me;        \
> > > +}
> > > +BUILD_DISABLED_EXITS_HELPER(hlt, HLT);
> > > +BUILD_DISABLED_EXITS_HELPER(pause, PAUSE);
> > > +BUILD_DISABLED_EXITS_HELPER(mwait, MWAIT);
> > > +BUILD_DISABLED_EXITS_HELPER(cstate, CSTATE);
> >
> > The boilerplate is bad, but that's abhorrent.
>
> Assuming it's the macros you hate, keep the "u64 disabled_exits" change b=
ut
> manually code all of the getters?

Sounds good. I'll try to get a V4 out this week.
