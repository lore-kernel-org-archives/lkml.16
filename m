Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBDB13212A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607755; cv=none; b=L2EovSBE2ZlMN2BFp5H3EY2XQ6gAypxVV5XZn8+SEqUa7VoALVCuzncYKvu5yE6olkTQU9yJDnx16gLLuPoMZxhdxSlISVk7ffLK3qVDWgfpqolPUzgymtSY81/5Lt36meV1U/JxuHtuTnJ83kiS1Vbdw//H9HEB4mFmlEvT6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607755; c=relaxed/simple;
	bh=Uech+UHhv4sOC9RgVhkZjRiQR8BJsrRsxWJSMFeN6tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8RHSd93xZWKbhSgfEQVCIW+3n+NN4UtDEv0thOcT8oAujEy8HSDv98IBvjO3NGGQ/kZxNOVi51LF3FJ2lfOaaTud5iDgmHOmFLYZnlyl+SQwmIbgWOCZe+hBpVTsoDVqO2Qq9RmLHRFtcMgd+V1sfWF+cB35j5yQ4oXZKjmOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C87miaOZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C87miaOZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab70043cd05so707340266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738607752; x=1739212552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGol6r61VcuNuEZWmMU6xs7WZxyGZ/9jqTylnkkwSoE=;
        b=C87miaOZKmm/iBzB3T8W+BF/P9yJ4+9ToEO8V99dbrAx6R5VwyJfv5e/Chff03zowi
         VCPyVGmVqEx+NFS7BYoJhXHIQJ+2JT9YcDvJIzAWu20jTlaUT/Yk6EnFddve0v9CqLx4
         5UJqGgpuMUP98Qbic7PDHT3aIoq3iwNxAvMR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607752; x=1739212552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGol6r61VcuNuEZWmMU6xs7WZxyGZ/9jqTylnkkwSoE=;
        b=OtgTSfK+zujdbtZtpH2jHHqLOtMFpyTzwnI4d7HvgmZQufS31wQPp+h6Saa7J8Yksb
         UQ3UHT4UzbI4SPwk4baf9p5TykPDS0dEUqpXPnk8duw4EDw0kYUIgNZgKPt9GfH/5uCf
         +n0kf26gCVPDvaQVuohHmGMnTYXGOtqJ8FCbc9pPK8knzfjKJicd8farkLIrVqJ61uWD
         upcdC4iFhqzI4pHBs2/RqFb5XvpvV15V1GjkmRpxAUiNz4rlSWoX0oudzKEhusS863R3
         pVG096UVX2cyH+YLb/m7VtKHm6rXdNkiZ+y9cW2LCdP58wkFgx6v4ClUGbEff2xLeHtF
         ztDA==
X-Forwarded-Encrypted: i=1; AJvYcCUfBRhQDKNJiW7es+7uZYHqPnMbpNdKVOxGnbdYQP6QtzR9YX/aSHEM6uvtT+EF5zrXZfI+//VQqkBHrYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mNJ/n9VspR2OgBLaZ6gVsW+on93MnhZYCEbuQHl5nsZzxqtg
	ZR1Tvu0PBa/c02BaadKo3acdjU0hovo0QD6SgEmBfuJgx4AyR7wEeJD9Jw2KiEgx+i3nH1k/iD5
	7BfMK+dpeVRl9e4a0UeW4bYQ53uo4MCyRRAJeu3CyX1HoKoW0UUv7ZsaFWcT354bR371vJYKk+a
	h8c7rvze2xxh5125qhoIv6f1a0/g==
X-Gm-Gg: ASbGncvdI0jQke4nE/VQtlKIzZC/nhBTaG12/NZiaWA5gESVvy18BbRNQB9aJwEfB17
	MMUTTe5cggclN1qfbstcQs4o5a20gT+1QQHHCugH3piMJ9RC8nkPBwANnx4QJJ0wkAJuNgwy1
X-Google-Smtp-Source: AGHT+IEH1diJZSoj3mI395z848+RHFqez3XxYAiGbf4Wp1Ry15eBzXvXYVZHA21MpEZ+9mdCsAnJwAUQqGiTPmRJ6wc=
X-Received: by 2002:a17:906:4789:b0:ab6:eeca:f548 with SMTP id
 a640c23a62f3a-ab6eecaf915mr1797979866b.50.1738607751915; Mon, 03 Feb 2025
 10:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=0YZ3j2gGhgmaFRdCFg@mail.gmail.com>
 <c3026876-8061-4ab2-9321-97cc05bad510@redhat.com> <CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8ccxYzk3aFzCA@mail.gmail.com>
 <CABgObfZEyCQMiq6CKBOE7pAVzUDkWjqT2cgfbwjW-RseH8VkLw@mail.gmail.com>
 <CADH9ctA_C1dAOus1K+wOH_SOKTb=-X1sVawt5R=dkH1iGt8QUg@mail.gmail.com>
 <CABgObfZrTyft-3vqMz5w0ZiAhp-v6c32brgftynZGJO8OafrdA@mail.gmail.com>
 <CADH9ctBYp-LMbW4hm3+QwNoXvAc5ryVeB0L1jLY0uDWSe3vbag@mail.gmail.com>
 <b1ddb439-9e28-4a58-ba86-0395bfc081e0@redhat.com> <CADH9ctCFYtNfhn3SSp2jp0fzxu6s_X1A+wBNnzvHZVb8qXPk=g@mail.gmail.com>
 <CADH9ctB0YSYqC_Vj2nP20vMO_gN--KsqOBOu8sfHDrkZJV6pmw@mail.gmail.com>
 <Z2IXvsM0olS5GvbR@google.com> <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
 <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com> <CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com>
In-Reply-To: <CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com>
From: Doug Covelli <doug.covelli@broadcom.com>
Date: Mon, 3 Feb 2025 13:35:21 -0500
X-Gm-Features: AWEUYZlFtTN_u4MfQfTduijgXMnD-wyLVW9fBA2KFoXRMHjBmKRmtYPFwX9qdrM
Message-ID: <CADH9ctAzffvDByS1s2PJoD63On-b+pCnCmER4Nf4Zc=62vkbMA@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific hypercalls
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:22=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> On Mon, Feb 3, 2025 at 5:35=E2=80=AFPM Doug Covelli <doug.covelli@broadco=
m.com> wrote:
> > OK.  It seems like fully embracing the in-kernel APIC is the way to go
> > especially considering it really simplifies using KVM's support for nes=
ted
> > virtualization.  Speaking of nested virtualization we have been working=
 on
> > adding support for that and would like to propose a couple of changes:
> >
> > - Add an option for L0 to handle backdoor accesses from CPL3 code runni=
ng in L2.
> > On a #GP nested_vmx_l0_wants_exit can check if this option is enabled a=
nd KVM
> > can handle the #GP like it would if it had been from L1 (exit to userle=
vel iff
> > it is a backdoor access otherwwise deliver the fault to L2).  When comb=
ined with
> > enable_vmware_backdoor this will allow L0 to optionally handle backdoor=
 accesses
> > from CPL3 code running in L2.  This is needed for cases such as running=
 VMware
> > tools in a Windows VM with VBS enabled.  For other cases such as runnin=
g tools
> > in a Windows VM in an ESX VM we still want L1 to handle the backdoor ac=
cesses
> > from L2.
>
> I think this makes sense and could be an argument to KVM_ENABLE_CAP.
>
> > - Extend KVM_EXIT_MEMORY_FAULT for permission faults (e.g the guest att=
empting
> > to write to a page that has been protected by userlevel calling mprotec=
t).  This
> > is useful for cases where we want synchronous detection of guest writes=
 such as
> > lazy snapshots (dirty page tracking is no good for this case).  Current=
ly
> > permission faults result in KVM_RUN returning EFAULT which we handle by
> > interpreting the instruction as we do not know the guest physical addre=
ss
> > associated with the fault.
>
> Yes, this makes sense too, though you might want to look into
> userfaultfd as well.
>
> We had something planned using attributes, but I don't see any issue
> extending it to EFAULT. Maybe it would have to be yet another
> KVM_ENABLE_CAP; considering that it would break your existing code,
> there might be someone else in the wild doing it.

It looks like KVM_EXIT_MEMORY_FAULT was implemented in such a way that it
won't break existing code:

Note! KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in
that it accompanies a return code of =E2=80=98-1=E2=80=99, not =E2=80=980=
=E2=80=99! errno will always
be set to EFAULT or EHWPOISON when KVM exits with
KVM_EXIT_MEMORY_FAULT, userspace should assume kvm_run.exit_reason is
stale/undefined for all other error numbers.

That being said we could certainly make this opt-in if that is preferable.

Doug

> Paolo
>

--=20
This electronic communication and the information and any files transmitted=
=20
with it, or attached to it, are confidential and are intended solely for=20
the use of the individual or entity to whom it is addressed and may contain=
=20
information that is confidential, legally privileged, protected by privacy=
=20
laws, or otherwise restricted from disclosure to anyone else. If you are=20
not the intended recipient or the person responsible for delivering the=20
e-mail to the intended recipient, you are hereby notified that any use,=20
copying, distributing, dissemination, forwarding, printing, or copying of=
=20
this e-mail is strictly prohibited. If you received this e-mail in error,=
=20
please return the e-mail to the sender, delete it from your computer, and=
=20
destroy any printed copy of it.
