Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D29920AF9B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600541; cv=none; b=uXSbzBZQgHyTD2MzASlsPNZKjBu7l2AiuHqIEqGkSKur8VXU1PpamN4eBWlBlG72qehAr9af6Bt6j8ZIT24Qb5EROBLNIlMArYeFDz115wlMEjT3Zti32yqBCt1sGkWowKWl6nRYGo3NydghR/HKOSxnYobwpjgJ1b55uaFajmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600541; c=relaxed/simple;
	bh=pRYUk0ZKvQj1gkwIksxjnfyIXLml63X97KJ99riBYZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNfa4BvSxNocmvCngFKN05JTyr1889ur+H1om/Do2STOqQ5NIjLukc+ygufZibBFZSXX9jq9j7PjFZ/QbXy1Qa3CgKyYM94AkPwnRbWPCo4k9stGJ2t0LlLte0S6uCuwYTl/OJ8+5uVY/Whc01G7PgHMYIGx5t16LgYnKf5bMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LGxe8Ig8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LGxe8Ig8"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so9591165a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738600537; x=1739205337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHIxoUzv1NfTLg3IcP41+9dhk+jT2PV2wOpPLYrhtVc=;
        b=LGxe8Ig8WM3lFHkKoTJBzOsrJ0FbvRknDy+A8X0d7NVk2mOQQmqhn6jUuwT0qXGT4O
         piTKcXYiVu2AXg3Ot76bg+PU8xef2Gbc7lQAyuEDyejvcVm9l4eB9Pcahx5g0xo7d0L0
         Hgs8a5ykcMdUuyaM3kn+s0TBihZ6+b9IMuhFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600537; x=1739205337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHIxoUzv1NfTLg3IcP41+9dhk+jT2PV2wOpPLYrhtVc=;
        b=Qcl+rMDioHVp1R7WtfJLWd9JFwWlN25DWpVZFbP4++yfPQ+L6kuuP2BEVfYue0R3+d
         RitYywFq4ZgU5sQoO0JIEuGfeZvAPOil8cak7DGrvWZjBaXw7UkoCgKLZBco50BUM7hi
         VyePnaAaAIDNCUJ7wPHNaFJoxdu1fAFZ3vAYMczVpp6dmTEGy80q+Od0uXt+WVY9sWsc
         qjkNf3l6g5gM+99Gr6Un+wh1JXIZZusDPiakO8iojEj0H5rZs2qpT2ynA7ATVy6UDFo/
         faeFh57pI07pabph8EJ01UiZ7P5e/7g8LiTxOzHenyD3AMA5kqMYXOXN4ZmWbma19Phi
         8Ajg==
X-Forwarded-Encrypted: i=1; AJvYcCUjTyHxc79h5nRa236df9xDiNMbCbUcp0n6LmJTlwvFNlc3SbsDllw3to3Ie42jlpwSwZX4WypV6GPsBxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzl10rcbXhJdRU3KQIthOFUP9a+puRS43jc0wFWqcZ/c9lwnSl
	+WSUsXQIspfOOej0YG3jl/x0tAdyyc/q9jXYv0Ct/UyVBTnJodwP1+r4QunfrrUcPBKiZ48wiTO
	orGoN9jQsQuajBD1fgnNIyAPQq+Oolv34Pk0bWNjZMiNY9Or3aF9Y5cRDmB3vYxSy5FF3VirqkF
	FRR35C4EU7ZmVnBSNg+zSQBBojYg==
X-Gm-Gg: ASbGnct2XsU62siNU9zgfWFfhY3yHkNGeQdABLEx0AXbUL0T4AjnFa4g/ZozHcDrmhP
	tDjDzPEiTqwHunrO1FgvuUBczV+5/uFL0txvn4B7vcDQBEf15oD+vfGcW7GWMFXIy+S76WVGT
X-Google-Smtp-Source: AGHT+IHhX+KtXIcqRMMHyB7BajSsI7eHa5uvkNSVbUMeWa6SIDte2e1vwyujrh9gykAk3x0eH5a3iTOwvnuD1twZJ/Y=
X-Received: by 2002:a17:907:7255:b0:ab7:e71:adb5 with SMTP id
 a640c23a62f3a-ab70e71b1bcmr1040194766b.35.1738600537450; Mon, 03 Feb 2025
 08:35:37 -0800 (PST)
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
In-Reply-To: <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
From: Doug Covelli <doug.covelli@broadcom.com>
Date: Mon, 3 Feb 2025 11:35:07 -0500
X-Gm-Features: AWEUYZmOY0gXuefMbV_TBx2UZa0_r8n8z510aZTLnGHyyjywNd7tyCqK6XVRNrA
Message-ID: <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com>
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

On Tue, Jan 7, 2025 at 12:10=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On Wed, Dec 18, 2024 at 4:44=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > > Changing our legacy BIOS is not an option so in order to support Wind=
ows VMs
> > > with the legacy BIOS with decent performance we would either need to =
add support
> > > for remote reads of the APIC ID register to KVM or support CR8 access=
es w/o
> > > exiting w/o the in-kernel APIC in order.  Do you have a preference?
> >
> > I didn't quite follow the CR8 access thing.  If the choice is between e=
mulating
> > Remote Read IPIs and using a userspace local APIC, then I vote with bot=
h hands
> > for emulating Remote Reads, especially if we can do a half-assed versio=
n that
> > provides only what your crazy BIOS needs :-)
>
> Absolutely.  Not quite userspace local APIC - VMware only needs
> userspace traps on CR8 access but yeah, it would not be great to have
> that. Remote read support is totally acceptable and hopefully win-win
> for VMware too.
>
> > The biggest wrinkle I can think of is that KVM uses the Remote Read IPI=
 encoding
> > for a paravirt vCPU kick feature, but I doubt that's used by Windows gu=
ests and
> > so can be sacrificed on the Altar of Ancient BIOS.
>
> That's easy, the existing code can be wrapped with
>
>                 if (guest_pv_has(vcpu, KVM_FEATURE_PV_UNHALT))
>
> The remote-read hack is not even supposed to be used by the guest
> (it's used internally by kvm_pv_kick_cpu_op).
>
> Paolo

OK.  It seems like fully embracing the in-kernel APIC is the way to go
especially considering it really simplifies using KVM's support for nested
virtualization.  Speaking of nested virtualization we have been working on
adding support for that and would like to propose a couple of changes:

- Add an option for L0 to handle backdoor accesses from CPL3 code running i=
n L2.
On a #GP nested_vmx_l0_wants_exit can check if this option is enabled and K=
VM
can handle the #GP like it would if it had been from L1 (exit to userlevel =
iff
it is a backdoor access otherwwise deliver the fault to L2).  When combined=
 with
enable_vmware_backdoor this will allow L0 to optionally handle backdoor acc=
esses
from CPL3 code running in L2.  This is needed for cases such as running VMw=
are
tools in a Windows VM with VBS enabled.  For other cases such as running to=
ols
in a Windows VM in an ESX VM we still want L1 to handle the backdoor access=
es
from L2.

- Extend KVM_EXIT_MEMORY_FAULT for permission faults (e.g the guest attempt=
ing
to write to a page that has been protected by userlevel calling mprotect). =
 This
is useful for cases where we want synchronous detection of guest writes suc=
h as
lazy snapshots (dirty page tracking is no good for this case).  Currently
permission faults result in KVM_RUN returning EFAULT which we handle by
interpreting the instruction as we do not know the guest physical address
associated with the fault.  This works fine for normal VMs but it would be =
good
to avoid it for the case where nested virtualization is enabled as emulatin=
g L2
instructions presents a number of challenges and it would be best to avoid =
this.
This is the only case I have found where our userlevel code has to interpre=
t
instructions from L2.

Any thoughts on these proposed changes?

Doug

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
