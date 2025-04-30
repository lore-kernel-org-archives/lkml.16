Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485B29CE6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745986977; cv=none; b=qjsZneht7Khr1ny8ogbjwWeG3HhxWHLzTKSuS6EodNQhubN1NZkA4OJtef5APvATITnP6B6tu73kM4sWXgHLNJvEm97WNHVKNfxoQYfWPEiajOA2UxJ2ZQ2KBaEr2jq+TIlivg0p6I6GKTWqsuiwLa3cPX/0N/HXoWUxn5J254o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745986977; c=relaxed/simple;
	bh=Yx6WbrttF0V4WRXtUsQP4mfcu57U09xOwR6fkBgktK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWETpjR4+lkRRid7klRCTm2ekecoiSLSe30QSYVhBr9biBKM8TrC4d3ly4KSEDdC0Zao7LGk5FsttY0kbv0hvFmeUX7gdIpkPURKPlA5fCDYiPKkn5swxXPFFb+bkBboc6UH3pw4OJ8QO4VRLeAMOG89gEQukm433y3jmulqfGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=TtNUm2ul; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="TtNUm2ul"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso39549685ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745986974; x=1746591774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38ct102e6rV67TAerTfgwlZVdfvCfH6VgRwQ5JTNiqY=;
        b=TtNUm2ulQ7iaNk60rJTlhN0yYQYomss26QnBhC7roBTImtDW1h1X0uZHW2oJU6mMuR
         ydQO9ikm7FIrSELS9G8oScdSlsAz1ApaNkpmhfpez6UGzsjjtKM3Q0igLjUPkI6cSz+a
         N3ukHyTojZbudLKmFN6MSSLRFPhaD9wRk3ZojCrpa1pw+tGw1cAn/EOFQsR9ahdFJoet
         yLYftqX33Ce4saYQqMP+43wVgXJ2oiGvb8Oby5+1BE//+AWdareWfItSIvRCdsniTvmA
         6VRIejzuEXui9+ptPkg2IJWcmApprQiJE6KfyB6FCG9Bhb2RLngb+A9D8EKdH2HxSuG7
         +Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745986974; x=1746591774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38ct102e6rV67TAerTfgwlZVdfvCfH6VgRwQ5JTNiqY=;
        b=pNXJ52HX7vW0qU0/E+b+HzO+2dahzKQ4ViBaGmRI9w97rG1Av5GyKAlCBOKUub7eya
         3R4IcCQu+Z0RdIut/uVTvzhkaZ7nlEFcILXgHpga/8T4Dvax8sLhR9kqN8rTWvtHzYP/
         aFNRoAv81P5xNZAgb8F9o946o1U38EzyRw2/qQXAsb15nUswg9e8DAJaSz25vAE8X0KB
         ycCZeMDntfNo/QrW54odWqBoA6aoWhUYi9yUztJktoD1SzfWrteuSLxTkWJNF/bDAdJ/
         syUY4DJK8qQr763Osx0avQMa7XO9msrJaG9Ka9BjXip1HMHmltcHHgnfKw9fAE2usciX
         CEkA==
X-Forwarded-Encrypted: i=1; AJvYcCUQO/gz0AH3sAhlywJIqlbrKPDflN3hMQERwOvKCT6uo9N72dVs/+Qt3I21J2bju5QGdb0ejcwFik0uVOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4bwPYsrNZtRcqrUB//Iu6x3Oe0yi5RCejFzHX0v+6Vol4sNsq
	p2hE5BWZni39V5UCPQXypMAMkpA3p+1l9uRJRMZd2xsVVyQSxGi5pWKNnfO4GsOjvbM4V4hJ880
	ISxs0DLXVMpSZ8OiWqDsbcbJ1nEQ7b95QHpSLpg==
X-Gm-Gg: ASbGncsODdbmb23nk8X0iYXs6wmrts1eNR55Nr8MJhIpbtqtftROAOqBN/2qAcqnY3z
	HmODEShJkXvZRf2QxPGu+8Gi7V5YFrUdOyFRlF/BufJ9OVk+EoQ+sGO/3B6Khzq68RcQa4GI6uv
	MOf522mESJTdRUQpqVlOMSgNk=
X-Google-Smtp-Source: AGHT+IGl4iGmSaKp5RMw7EFDZJmn8F4FnfgYTHM0Ni9376soeIPJv4IoaKlXnzwrp9V2WncKuJ+CQDmMBVybP2mqJe8=
X-Received: by 2002:a05:6e02:4506:20b0:3d8:1e50:1d55 with SMTP id
 e9e14a558f8ab-3d967fc205dmr5957645ab.11.1745986974519; Tue, 29 Apr 2025
 21:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com> <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com> <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
In-Reply-To: <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Apr 2025 09:52:43 +0530
X-Gm-Features: ATxdqUGmKl8csSBnKXlzPOE4lM8k7L-kt85DmcktMYspDC-PRgYE5KsnznLpoKg
Message-ID: <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 9:51=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-04-29T20:31:18+05:30, Anup Patel <anup@brainfault.org>:
> > On Tue, Apr 29, 2025 at 3:55=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rk=
rcmar@ventanamicro.com> wrote:
> >>
> >> 2025-04-29T11:25:35+05:30, Anup Patel <apatel@ventanamicro.com>:
> >> > On Mon, Apr 28, 2025 at 11:15=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99=
 <rkrcmar@ventanamicro.com> wrote:
> >> >>
> >> >> 2025-04-28T17:52:25+05:30, Anup Patel <anup@brainfault.org>:
> >> >> > On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=
=99 <rkrcmar@ventanamicro.com> wrote:
> >> >> >> For a cleaner solution, we should add interfaces to perform the =
KVM-SBI
> >> >> >> reset request on userspace demand.  I think it would also be muc=
h better
> >> >> >> if userspace was in control of the post-reset state.
> >> >> >
> >> >> > Apart from breaking KVM user-space, this patch is incorrect and
> >> >> > does not align with the:
> >> >> > 1) SBI spec
> >> >> > 2) OS boot protocol.
> >> >> >
> >> >> > The SBI spec only defines the entry state of certain CPU register=
s
> >> >> > (namely, PC, A0, and A1) when CPU enters S-mode:
> >> >> > 1) Upon SBI HSM start call from some other CPU
> >> >> > 2) Upon resuming from non-retentive SBI HSM suspend or
> >> >> >     SBI system suspend
> >> >> >
> >> >> > The S-mode entry state of the boot CPU is defined by the
> >> >> > OS boot protocol and not by the SBI spec. Due to this, reason
> >> >> > KVM RISC-V expects user-space to set up the S-mode entry
> >> >> > state of the boot CPU upon system reset.
> >> >>
> >> >> We can handle the initial state consistency in other patches.
> >> >> What needs addressing is a way to trigger the KVM reset from usersp=
ace,
> >> >> even if only to clear the internal KVM state.
> >> >>
> >> >> I think mp_state is currently the best signalization that KVM shoul=
d
> >> >> reset, so I added it there.
> >> >>
> >> >> What would be your preferred interface for that?
> >> >>
> >> >
> >> > Instead of creating a new interface, I would prefer that VCPU
> >> > which initiates SBI System Reset should be resetted immediately
> >> > in-kernel space before forwarding the system reset request to
> >> > user space.
> >>
> >> The initiating VCPU might not be the boot VCPU.
> >> It would be safer to reset all of them.
> >
> > I meant initiating VCPU and not the boot VCPU. Currently, the
> > non-initiating VCPUs are already resetted by VCPU requests
> > so nothing special needs to be done.

There is no designated boot VCPU for KVM so let us only use the
term "initiating" or "non-initiating" VCPUs in context of system reset.

>
> Currently, we make the request only for VCPUs brought up by HSM -- the
> non-boot VCPUs.  There is a single VCPU not being reset and resetting
> the reset initiating VCPU changes nothing. e.g.
>
>   1) VCPU 1 initiates the reset through an ecall.
>   2) All VCPUs are stopped and return to userspace.

When all VCPUs are stopped, all VCPUs except VCPU1
(in this example) will SLEEP because we do
"kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP)"
so none of the VCPUs except VCPU1 (in this case) will
return to userspace.

>   3) Userspace prepares VCPU 0 as the boot VCPU.
>   4) VCPU 0 executes without going through KVM reset paths.

Userspace will see a system reset event exit for the
initiating VCPU by that time all other VCPUs are already
sleeping with mp_state =3D=3D KVM_MP_STATE_STOPPED.

>
> The point of this patch is to reset the boot VCPU, so we reset the VCPU
> that is made runnable by the KVM_SET_MP_STATE IOCTL.

Like I said before, we don't need to do this. The initiating VCPU
can be resetted just before exiting to user space for system reset
event exit.

>
> For design alternatives, it is also possible to reset immediately in an
> IOCTL instead of making the reset request.
>
> >> You also previously mentioned that we need to preserve the pre-reset
> >> state for userspace, which I completely agree with and it is why the
> >> reset happens later.
> >
> > Yes, that was only for debug purposes from user space. At the
> > moment, there is no one using this for debug purposes so we
> > can sacrifice that.
>
> We still can't immediately reset the boot VCPU, because it might already
> be in userspace.  We don't really benefit from immediately resetting the
> initiating VCPU.
> Also, making the reset request for all VCPUs from the initiating VCPU
> has some undesirable race conditions we would have to prevent, so I do
> prefer we go the IOCTL reset way.

All VCPUs are sleeping with mp_state =3D=3D KVM_MP_STATE_STOPPED
when userspace sees system reset exit on the initiating VCPU so I don't
see any race condition if we also reset the initiating VCPU before exiting
to userspace.

>
> >> >             This way we also force KVM user-space to explicitly
> >> > set the PC, A0, and A1 before running the VCPU again after
> >> > system reset.
> >>
> >> We also want to consider reset from emulation outside of KVM.
> >>
> >> There is a "simple" solution that covers everything (except speed) --
> >> the userspace can tear down the whole VM and re-create it.
> >> Do we want to do this instead and drop all resets from KVM?
> >
> > I think we should keep the VCPU resets in KVM so that handling
> > of system reset handling in user space remains simple. The user
> > space can also re-create the VM upon system reset but that is
> > user space choice.
>
> Ok.

Regards,
Anup
