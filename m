Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81463CF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745434684; cv=none; b=aUZtXc6JvhpiU/suuRdH15fh5FJ9agV20fD8KBw/VIPoEpkvH784YQGIPkwlYM0tBd+jqTuyGzMQIembVc6gcQUF5LU14b7gMlU0jl6OC8tYQnqtcSDene+iCdozHZkjSL0V4Ief/eqBQ2IVnx98YNYRneNRHdH1vO04z5Rku7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745434684; c=relaxed/simple;
	bh=JVtcUVc7US+oTQaeQw+HQD5mxyfXQT0C1LC9Tz0ut/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fAwbCVxEVhLniAAjGoECNPihDfaVXLSVwNpQU11pJX9KJ42eSnsbkcYgp2CyIkshap3c5ZzJIXof2oI59n60mnLp6XtyssAOA6I4vdC8iIEDBxG5JGWXlaAMSnQsH3xlHyJ7mJ5YUw9AMJSsjNa7+w23ESJKMW/W9CmB/65WXNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GxxSMh9u; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GxxSMh9u"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736d64c5e16so87434b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745434682; x=1746039482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaXDtQDICrVid48fIAOG4chL/EvByd0GF5YvCsnDoyE=;
        b=GxxSMh9uxctMuvChBP526pBe5NNrHRDKPqHRpvGDAKNow2gqTRgzRHdvGmzRaU4Byo
         nbXYqb4vZIqluXfFOR9oLD7QKZ+A7AXbGjp8OKE/uOwWOJvowtwqjv1TSfAtt1gy4Hzk
         YU+lphDop5xr2KmNa+GREjhxUbyQjOw0pDaZr/jOwy0tN8vpyoqJ0sKROGvTpz1+nmJx
         MhNamEZjWDFzOH0/ltMygdO1Bya78ilsKf2B3D4ho8vb0xRtj9ncIVD/s3h0O/RaTUro
         +/CTdTLwIbMGx1l1D/9O0U8ZHExSFnyrTc0n5k3NF77ms2BX4xIst9Z0WxBprtV89CdP
         EqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745434682; x=1746039482;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aaXDtQDICrVid48fIAOG4chL/EvByd0GF5YvCsnDoyE=;
        b=t4TbLuklAATMoHya5j9jH6GBJOtr2EtpP3Swe/yG2b9dNDvpBm7v4gGKfVWoNobdPw
         zq3kcXjAjnUjoMTjy5uDJ6qCGSVLXcS5cWAnCNNudbBlMQEqS/zZwrKZVNkmGjavWjhg
         Q5ASEUVjxqxuLY5CPT5eyFx0E85iGK2A5aFKdC6U1wZmRzI079dbJyVIz/R+rEbrJSqr
         5YTc7v8ak/wwH4IpdmJvkLv7LN4KnirdMzQWoK5z5asUpQXAdBHiDeox663lhXT1YcgT
         6Wkxb/JH0+9c7LGlh1ZyjyfGRDp1JBX+geOE3AmxNJ4mddXN9RiszINN5GrbmxDvJles
         AlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK3KB8EuKT1j2CdJjyJktH+s9lf79JDQNMbBbnQTLKiXto+MAONGqKBn7YQV9lZTIeBmLU3E0CC7G5+S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgVNyWpSZkrOPZWoj4zm2utaS5AQ/JzcRbhoq8oklhpROq68my
	k8Vo6Y3pjps1T/ObZzjOu4b+toqDLckW/gUKCe/JUMthmlkQSu25JyI19dIxPsfe3kyoXqM5xA9
	znw==
X-Google-Smtp-Source: AGHT+IGQ5NDwT7+wPfgEELFalTLORgQJexq0+s1pN2aLrlZiaK31u+Z+QuTxBath5TnsRBC9zdybUZTONlI=
X-Received: from pfia14.prod.google.com ([2002:a62:e20e:0:b0:736:5012:3564])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:158d:b0:1f5:9016:3594
 with SMTP id adf61e73a8af0-203cbc533f7mr31179674637.18.1745434681778; Wed, 23
 Apr 2025 11:58:01 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:57:59 -0700
In-Reply-To: <CABQX2QMtQes5yiG4VBvQgWkuAoSWgcP8R+X7MeuV_xHeLfpznw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422161304.579394-1-zack.rusin@broadcom.com>
 <20250422161304.579394-5-zack.rusin@broadcom.com> <a803c925-b682-490f-8cd9-ca8d4cc599aa@zytor.com>
 <CABQX2QMznYZiVm40Ligq+pFKmEkVpScW+zcKYbPpGgm0=S2Xkg@mail.gmail.com>
 <aAjrOgsooR4RYIJr@google.com> <CABQX2QNDmXizUDP_sckvfaM9OBTxHSr0ESgJ_=Z_5RiODfOGsg@mail.gmail.com>
 <aAkNN029DIxYay-j@google.com> <CABQX2QPUsKfkKYKnXG01A-jEu_7dbY7qBnEHyhYJnsSXD-jqng@mail.gmail.com>
 <aAkgV3ja9NbDsrju@google.com> <CABQX2QMtQes5yiG4VBvQgWkuAoSWgcP8R+X7MeuV_xHeLfpznw@mail.gmail.com>
Message-ID: <aAk4N0wYQeeYPLVM@google.com>
Subject: Re: [PATCH v2 4/5] KVM: x86: Add support for legacy VMware backdoors
 in nested setups
From: Sean Christopherson <seanjc@google.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025, Zack Rusin wrote:
> On Wed, Apr 23, 2025 at 1:16=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Wed, Apr 23, 2025, Zack Rusin wrote:
> > > On Wed, Apr 23, 2025 at 11:54=E2=80=AFAM Sean Christopherson <seanjc@=
google.com> wrote:
> > > > > I'd say that if we desperately want to use a single cap for all o=
f
> > > > > these then I'd probably prefer a different approach because this =
would
> > > > > make vmware_backdoor_enabled behavior really wacky.
> > > >
> > > > How so?  If kvm.enable_vmware_backdoor is true, then the backdoor i=
s enabled
> > > > for all VMs, else it's disabled by default but can be enabled on a =
per-VM basis
> > > > by the new capability.
> > >
> > > Like you said if  kvm.enable_vmware_backdoor is true, then it's
> > > enabled for all VMs, so it'd make sense to allow disabling it on a
> > > per-vm basis on those systems.
> > > Just like when the kvm.enable_vmware_backdoor is false, the cap can b=
e
> > > used to enable it on a per-vm basis.
> >
> > Why?  What use case does that serve?
>=20
> Testing purposes?

Heh, testing what?  To have heterogenous VMware emulation settings on a sin=
gle
host, at least one of the VMMs needs to have been updated to utilize the ne=
w
capability.  Updating the VMM that doesn't want VMware emulation makes zero=
 sense,
because that would limit testing to only the non-nested backdoor.

> > > > > It's the one that currently can only be set via kernel boot flags=
, so having
> > > > > systems where the boot flag is on and disabling it on a per-vm ba=
sis makes
> > > > > sense and breaks with this.
> > > >
> > > > We could go this route, e.g. KVM does something similar for PMU vir=
tualization.
> > > > But the key difference is that enable_pmu is enabled by default, wh=
ereas
> > > > enable_vmware_backdoor is disabled by default.  I.e. it makes far m=
ore sense for
> > > > the capability to let userspace opt-in, as opposed to opt-out.
> > > >
> > > > > I'd probably still write the code to be able to disable/enable al=
l of them
> > > > > because it makes sense for vmware_backdoor_enabled.
> > > >
> > > > Again, that's not KVM's default, and it will never be KVM's default=
.
> > >
> > > All I'm saying is that you can enable it on a whole system via the
> > > boot flags and on the systems on which it has been turned on it'd mak=
e
> > > sense to allow disabling it on a per-vm basis.
> >
> > Again, why would anyone do that?  If you *know* you're going to run som=
e VMs
> > with VMware emulation and some without, the sane approach is to not tou=
ch the
> > module param and rely entirely on the capability.  Otherwise the VMM mu=
st be
> > able to opt-out, which means that running an older userspace that doesn=
't know
> > about the new capability *can't* opt-out.
> >
> > The only reason to even keep the module param is to not break existing =
users,
> > e.g. to be able to run VMs that want VMware functionality using an exis=
ting VMM.
> >
> > > Anyway, I'm sure I can make it work correctly under any constraints, =
so let
> > > me try to understand the issue because I'm not sure what we're solvin=
g here.
> > > Is the problem the fact that we have three caps and instead want to s=
queeze
> > > all of the functionality under one cap?
> >
> > The "problem" is that I don't want to add complexity and create ABI for=
 a use
> > case that doesn't exist.
>=20
> Would you like to see a v3 where I specifically do not allow disabling
> those caps?

Yes.  Though I recommend waiting to send a v3 until I (and others) have had=
 a
change to review the rest of the patches, e.g. to avoid wasting your time.
